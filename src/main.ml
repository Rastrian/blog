open Lwt.Syntax
open Dream

let posts_cache = ref []
let last_update = ref 0.0

let cache_duration = 900.0 (* 15 minutes *)
let posts_per_page = 3

let get_posts () =
  let now = Unix.time () in
  if now -. !last_update > cache_duration then (
    let* posts = Github.fetch_issues () in
    posts_cache := posts;
    last_update := now;
    Lwt.return posts
  ) else
    Lwt.return !posts_cache

let paginate_posts posts page per_page =
  let total_posts = List.length posts in
  let start_idx = (page - 1) * per_page in
  let end_idx = min (start_idx + per_page) total_posts in
  if start_idx >= total_posts then ([], total_posts)
  else
    let rec take_range acc idx remaining = function
      | [] -> List.rev acc
      | h :: t when idx < start_idx -> take_range acc (idx + 1) remaining t
      | h :: t when remaining > 0 -> take_range (h :: acc) (idx + 1) (remaining - 1) t
      | _ -> List.rev acc
    in
    let page_posts = take_range [] 0 per_page posts in
    (page_posts, total_posts)

let () =
  run ~interface:"0.0.0.0" ~port:8080
  @@ logger
  @@ router [
    get "/" (fun request ->
      let page = 
        try 
          match query request "page" with
          | Some page_str -> max 1 (int_of_string page_str)
          | None -> 1
        with _ -> 1
      in
      let* all_posts = get_posts () in
      let (posts, total_posts) = paginate_posts all_posts page posts_per_page in
      html (Templates.home_page posts page total_posts posts_per_page)
    );
    
    get "/post/:slug" (fun request ->
      let slug = param request "slug" in
      let* posts = get_posts () in
      match Github.find_issue_by_slug slug posts with
      | Some issue -> html (Templates.post_page issue)
      | None -> html ~status:`Not_Found Templates.not_found_page
    );
    
    get "/tags" (fun _ ->
      let* posts = get_posts () in
      html (Templates.tags_page posts)
    );
    
    get "/tag/:tag" (fun request ->
      let tag = param request "tag" in
      let* posts = get_posts () in
      html (Templates.tag_page tag posts)
    );
    
    get "/rss.xml" (fun _ ->
      let* posts = get_posts () in
      let rss_content = Templates.generate_rss_feed posts in
      respond ~headers:[("Content-Type", "application/rss+xml; charset=utf-8")] rss_content
    );
    
    get "/**" (fun _ ->
      html ~status:`Not_Found Templates.not_found_page
    );
  ]

