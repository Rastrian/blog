open Lwt.Syntax

type issue = {
  number: int;
  title: string;
  body: string option;
  author: string;
  created_at: string;
  updated_at: string;
  labels: string list;
  html_url: string;
}

let api_base = "https://api.github.com"
let repo_owner = "rastrian"
let repo_name = "blog"

let github_token = 
  try Some (Sys.getenv "GITHUB_TOKEN")
  with Not_found -> None

let make_headers () =
  let base_headers = [("User-Agent", "Rastrian-Blog/1.0")] in
  match github_token with
  | Some token -> ("Authorization", "Bearer " ^ token) :: base_headers
  | None -> base_headers

let parse_labels json =
  match json with
  | `List labels ->
    List.map (function
      | `Assoc fields ->
        (match List.assoc_opt "name" fields with
         | Some (`String name) -> name
         | _ -> "")
      | _ -> ""
    ) labels
  | _ -> []

let parse_issue json =
  match json with
  | `Assoc fields ->
    let number = 
      match List.assoc_opt "number" fields with
      | Some (`Int n) -> n
      | _ -> 0
    in
    let title = 
      match List.assoc_opt "title" fields with
      | Some (`String t) -> t
      | _ -> ""
    in
    let body = 
      match List.assoc_opt "body" fields with
      | Some (`String b) -> Some b
      | Some `Null -> None
      | _ -> None
    in
    let author = 
      match List.assoc_opt "user" fields with
      | Some (`Assoc user_fields) ->
        (match List.assoc_opt "login" user_fields with
         | Some (`String login) -> login
         | _ -> "unknown")
      | _ -> "unknown"
    in
    let created_at = 
      match List.assoc_opt "created_at" fields with
      | Some (`String date) -> date
      | _ -> ""
    in
    let updated_at = 
      match List.assoc_opt "updated_at" fields with
      | Some (`String date) -> date
      | _ -> ""
    in
    let labels = 
      match List.assoc_opt "labels" fields with
      | Some labels_json -> parse_labels labels_json
      | _ -> []
    in
    let html_url = 
      match List.assoc_opt "html_url" fields with
      | Some (`String url) -> url
      | _ -> ""
    in
    Some { number; title; body; author; created_at; updated_at; labels; html_url }
  | _ -> None

let fetch_issues_page page per_page =
  let url = Printf.sprintf "%s/repos/%s/%s/issues?state=open&sort=created&direction=desc&labels=published&author=%s&page=%d&per_page=%d" 
    api_base repo_owner repo_name repo_owner page per_page in
  let headers = Cohttp.Header.of_list (make_headers ()) in
  let* response, body = Cohttp_lwt_unix.Client.get ~headers (Uri.of_string url) in
  let* body_string = Cohttp_lwt.Body.to_string body in
  match Yojson.Safe.from_string body_string with
  | `List issues ->
    let parsed_issues = List.filter_map parse_issue issues in
    Lwt.return parsed_issues
  | _ ->
    Printf.eprintf "Failed to parse GitHub API response\n%!";
    Lwt.return []

let fetch_issues () = fetch_issues_page 1 25

let fetch_issue number =
  let url = Printf.sprintf "%s/repos/%s/%s/issues/%d" 
    api_base repo_owner repo_name number in
  let headers = Cohttp.Header.of_list (make_headers ()) in
  let* response, body = Cohttp_lwt_unix.Client.get ~headers (Uri.of_string url) in
  let* body_string = Cohttp_lwt.Body.to_string body in
  match Yojson.Safe.from_string body_string with
  | json -> 
    (match parse_issue json with
     | Some issue when List.mem "published" issue.labels && issue.author = repo_owner -> 
       Lwt.return (Some issue)
     | _ -> Lwt.return None)
  | exception _ ->
    Printf.eprintf "Failed to parse issue %d\n%!" number;
    Lwt.return None

let find_issue_by_slug slug posts =
  let create_slug title =
    let sanitize s =
      String.map (function 
        | 'a'..'z' | '0'..'9' as c -> c
        | _ -> '-') s
    in
    let remove_consecutive_dashes s =
      let rec aux acc prev = function
        | [] -> String.of_seq (List.rev acc |> List.to_seq)
        | '-' :: rest when prev = '-' -> aux acc prev rest
        | c :: rest -> aux (c :: acc) c rest
      in
      aux [] ' ' (String.to_seq s |> List.of_seq)
    in
    let trim_dashes s =
      let len = String.length s in
      let start = if len > 0 && s.[0] = '-' then 1 else 0 in
      let stop = if len > 0 && s.[len-1] = '-' then len-1 else len in
      if start < stop then String.sub s start (stop - start) else ""
    in
    title
    |> String.lowercase_ascii
    |> sanitize
    |> remove_consecutive_dashes
    |> trim_dashes
  in
  List.find_opt (fun post -> create_slug post.title = slug) posts
