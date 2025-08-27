open Github

let css = {|
:root {
  --bg-color: #0a0a0a;
  --text-color: #e0e0e0;
  --accent-color: #00ff41;
  --secondary-color: #333;
  --border-color: #444;
  --link-color: #00ff41;
  --code-bg: #1a1a1a;
}

[data-theme="light"] {
  --bg-color: #fafafa;
  --text-color: #333;
  --accent-color: #007acc;
  --secondary-color: #e0e0e0;
  --border-color: #ccc;
  --link-color: #007acc;
  --code-bg: #f5f5f5;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Courier New', monospace;
  background-color: var(--bg-color);
  color: var(--text-color);
  line-height: 1.6;
  transition: background-color 0.3s, color 0.3s;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

header {
  border-bottom: 2px solid var(--accent-color);
  margin-bottom: 2rem;
  padding-bottom: 1rem;
}

.site-title {
  font-size: 2.5rem;
  color: var(--accent-color);
  text-decoration: none;
  display: inline-block;
}

.site-title:hover {
  text-shadow: 0 0 10px var(--accent-color);
}

.theme-toggle {
  float: right;
  background: var(--secondary-color);
  border: 1px solid var(--border-color);
  color: var(--text-color);
  padding: 8px 16px;
  cursor: pointer;
  font-family: inherit;
  border-radius: 4px;
  transition: all 0.3s;
}

.theme-toggle:hover {
  background: var(--accent-color);
  color: var(--bg-color);
}

.post {
  margin-bottom: 3rem;
  border: 1px solid var(--border-color);
  padding: 1.5rem;
  background: var(--code-bg);
}

.post-title {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
  color: var(--accent-color);
  text-decoration: none;
}

.post-title:hover {
  text-decoration: underline;
}

.post-meta {
  font-size: 0.9rem;
  color: var(--text-color);
  opacity: 0.7;
  margin-bottom: 1rem;
}

.post-content {
  margin-bottom: 1rem;
}

.tags {
  margin-top: 1rem;
}

.tag {
  display: inline-block;
  background: var(--accent-color);
  color: var(--bg-color);
  padding: 2px 8px;
  margin-right: 8px;
  font-size: 0.8rem;
  border-radius: 3px;
}

pre, code {
  background: var(--secondary-color);
  border: 1px solid var(--border-color);
  font-family: 'Courier New', monospace;
}

pre {
  padding: 1rem;
  overflow-x: auto;
  margin: 1rem 0;
}

code {
  padding: 2px 4px;
}

blockquote {
  border-left: 3px solid var(--accent-color);
  padding-left: 1rem;
  margin: 1rem 0;
  font-style: italic;
}

/* Improved markdown content styling */
.markdown-content {
  line-height: 1.7;
}

.markdown-content p {
  margin-bottom: 1rem;
}

.markdown-content ul, .markdown-content ol {
  margin: 1rem 0;
  padding-left: 2rem;
}

.markdown-content li {
  margin-bottom: 0.5rem;
  line-height: 1.6;
}

.markdown-content h1, .markdown-content h2, .markdown-content h3, 
.markdown-content h4, .markdown-content h5, .markdown-content h6 {
  margin: 1.5rem 0 1rem 0;
  line-height: 1.3;
  color: var(--accent-color);
}

.markdown-content h1 { font-size: 2rem; }
.markdown-content h2 { font-size: 1.7rem; }
.markdown-content h3 { font-size: 1.4rem; }
.markdown-content h4 { font-size: 1.2rem; }
.markdown-content h5 { font-size: 1.1rem; }
.markdown-content h6 { font-size: 1rem; }

.markdown-content code {
  background: var(--code-bg);
  padding: 2px 6px;
  border-radius: 3px;
  font-size: 0.9em;
}

.markdown-content pre {
  background: var(--code-bg);
  border: 1px solid var(--border-color);
  border-radius: 6px;
  padding: 1rem;
  overflow-x: auto;
  margin: 1.5rem 0;
}

.markdown-content pre code {
  background: none;
  padding: 0;
  border: none;
  border-radius: 0;
}

.markdown-content blockquote {
  border-left: 4px solid var(--accent-color);
  padding: 0.5rem 0 0.5rem 1rem;
  margin: 1.5rem 0;
  background: var(--code-bg);
  border-radius: 0 4px 4px 0;
}

.markdown-content table {
  border-collapse: collapse;
  margin: 1.5rem 0;
  width: 100%;
}

.markdown-content th, .markdown-content td {
  border: 1px solid var(--border-color);
  padding: 0.7rem;
  text-align: left;
}

.markdown-content th {
  background: var(--secondary-color);
  font-weight: bold;
}

.markdown-content hr {
  height: 0.25em;
  padding: 0;
  margin: 24px 0;
  background-color: var(--border-color);
  border: 0;
  border-radius: 1px;
}

a {
  color: var(--link-color);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

img {
  max-width: 100%;
  height: auto;
  border-radius: 4px;
  margin: 1rem 0;
}

.post-content img {
  display: block;
  margin: 1rem auto;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.nav {
  margin: 2rem 0;
}

.nav a {
  margin-right: 2rem;
  color: var(--accent-color);
  text-transform: uppercase;
  font-weight: bold;
}

.footer {
  margin-top: 4rem;
  border-top: 1px solid var(--border-color);
  padding: 2rem 0;
  text-align: center;
  opacity: 0.8;
}

.footer-content p {
  margin: 0.5rem 0;
  font-size: 0.9rem;
}

.footer a {
  color: var(--text-color);
  text-decoration: none;
  transition: color 0.3s;
}

.footer a:hover {
  color: var(--accent-color);
}

.github-icon {
  margin-right: 0.5rem;
}

.pagination {
  margin: 3rem 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 0;
  border-top: 1px solid var(--border-color);
}

.pagination-btn {
  display: inline-block;
  padding: 0.5rem 1rem;
  background: var(--code-bg);
  border: 1px solid var(--border-color);
  color: var(--text-color);
  text-decoration: none;
  border-radius: 4px;
  transition: all 0.3s;
}

.pagination-btn:hover:not(.disabled) {
  background: var(--accent-color);
  color: var(--bg-color);
  border-color: var(--accent-color);
}

.pagination-btn.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.page-info {
  font-size: 0.9rem;
  color: var(--text-color);
  opacity: 0.8;
}

@media (max-width: 768px) {
  .container {
    padding: 10px;
  }
  
  .site-title {
    font-size: 1.8rem;
  }
  
  .theme-toggle {
    float: none;
    display: block;
    margin-top: 1rem;
    width: 100%;
  }
  
  .nav a {
    display: block;
    margin: 0.5rem 0;
  }
  
  .post {
    padding: 1rem;
    margin-bottom: 2rem;
  }
  
  .post-title {
    font-size: 1.3rem;
  }
  
  .post-content {
    font-size: 0.95rem;
    line-height: 1.7;
  }
  
  .post-content img {
    margin: 0.8rem auto;
    border-radius: 3px;
  }
  
  .tags .tag {
    font-size: 0.75rem;
    margin: 0.2rem 0.4rem 0.2rem 0;
  }
  
  .footer {
    margin-top: 2rem;
    padding: 1.5rem 0;
  }
  
  .footer-content p {
    font-size: 0.85rem;
    margin: 0.4rem 0;
  }
  
  /* Mobile markdown content */
  .markdown-content h1 { font-size: 1.6rem; }
  .markdown-content h2 { font-size: 1.4rem; }
  .markdown-content h3 { font-size: 1.2rem; }
  .markdown-content h4 { font-size: 1.1rem; }
  
  .markdown-content ul, .markdown-content ol {
    padding-left: 1.5rem;
  }
  
  .markdown-content pre {
    padding: 0.8rem;
    margin: 1rem 0;
    overflow-x: auto;
  }
  
  .pagination {
    flex-direction: column;
    gap: 1rem;
    margin: 2rem 0;
  }
  
  .pagination-btn {
    padding: 0.7rem 1rem;
    width: 100%;
    text-align: center;
  }
  
  .page-info {
    order: -1;
    font-size: 0.85rem;
  }
}
|}

let javascript = {|
// Theme detection and switching
function initTheme() {
  const savedTheme = localStorage.getItem('theme');
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  const theme = savedTheme || (prefersDark ? 'dark' : 'light');
  
  document.documentElement.setAttribute('data-theme', theme);
  updateThemeButton(theme);
}

function toggleTheme() {
  const currentTheme = document.documentElement.getAttribute('data-theme');
  const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
  
  document.documentElement.setAttribute('data-theme', newTheme);
  localStorage.setItem('theme', newTheme);
  updateThemeButton(newTheme);
  updateGiscusTheme(newTheme);
}

function updateGiscusTheme(theme) {
  const giscusFrame = document.querySelector('iframe[src*="giscus"]');
  if (giscusFrame) {
    const giscusTheme = theme === 'light' ? 'light' : 'dark';
    giscusFrame.contentWindow.postMessage({
      giscus: {
        setConfig: {
          theme: giscusTheme
        }
      }
    }, 'https://giscus.app');
  }
}

function updateThemeButton(theme) {
  const button = document.getElementById('theme-toggle');
  if (button) {
    button.textContent = theme === 'dark' ? '☀️ Light' : '🌙 Dark';
  }
}

// Initialize theme on page load
document.addEventListener('DOMContentLoaded', function() {
  initTheme();
  
  const themeButton = document.getElementById('theme-toggle');
  if (themeButton) {
    themeButton.addEventListener('click', toggleTheme);
  }
  
  // Set initial Giscus theme after comments load
  setTimeout(function() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    updateGiscusTheme(currentTheme);
  }, 2000);
});

// Listen for system theme changes
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function(e) {
  if (!localStorage.getItem('theme')) {
    const theme = e.matches ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', theme);
    updateThemeButton(theme);
    updateGiscusTheme(theme);
  }
});
|}

let layout ~title ~content ?(meta_tags="") () = 
  Printf.sprintf {|<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>%s</title>
      <link rel="icon" type="image/png" href="https://rastrian.dev/assets/img/favicon.png">
  <link rel="alternate" type="application/rss+xml" title="Rastrian Blog RSS Feed" href="/rss.xml">
  %s
  <style>%s</style>
</head>
<body>
    <div class="container">
        <header>
            <a href="/" class="site-title">~/rastrian/blog</a>
            <button id="theme-toggle" class="theme-toggle">🌙 Dark</button>
        </header>
        <nav class="nav">
            <a href="https://rastrian.dev">Home</a>
            <a href="/">Posts</a>
            <a href="/tags">Tags</a>
            <a href="/rss.xml" title="Subscribe to RSS feed">RSS</a>
        </nav>
        <main>%s</main>
        <footer class="footer">
            <div class="footer-content">
                <p>© 2025 Luis Vaz (Rastrian). Crafted with ❤️ and lots of ☕</p>
                <p>
                    <a href="https://github.com/rastrian/blog" target="_blank">
                        <span class="github-icon">⭐</span> Open Source on GitHub
                    </a>
                </p>
            </div>
        </footer>
    </div>
    <script>%s</script>
</body>
</html>|} title meta_tags css content javascript

let format_date date_str =
  try
    let parts = String.split_on_char 'T' date_str in
    match parts with
    | date_part :: time_part :: _ ->
        let time_without_z = 
          if String.contains time_part 'Z' then
            String.sub time_part 0 (String.index time_part 'Z')
          else if String.contains time_part '+' then
            String.sub time_part 0 (String.index time_part '+')
          else
            time_part
        in
        let time_parts = String.split_on_char ':' time_without_z in
        let hour_min = match time_parts with
          | hour :: minute :: _ -> Printf.sprintf "%s:%s" hour minute
          | _ -> "00:00"
        in
        Printf.sprintf "%s at %s UTC" date_part hour_min
    | [date_part] -> date_part
    | _ -> date_str
  with _ -> date_str

let extract_description text max_length =
  let clean_text = Str.global_replace (Str.regexp "<[^>]+>") "" text in
  let clean_text = Str.global_replace (Str.regexp "[ \t\n\r]+") " " clean_text in
  let clean_text = String.trim clean_text in
  if String.length clean_text <= max_length then clean_text
  else String.sub clean_text 0 max_length ^ "..."

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

let escape_xml text =
  let text = Str.global_replace (Str.regexp "&") "&amp;" text in
  let text = Str.global_replace (Str.regexp "<") "&lt;" text in
  let text = Str.global_replace (Str.regexp ">") "&gt;" text in
  let text = Str.global_replace (Str.regexp "\"") "&quot;" text in
  let text = Str.global_replace (Str.regexp "'") "&#39;" text in
  text

let format_rss_date date_str =
  try
    (* Convert ISO 8601 to RFC 822 format *)
    let parts = String.split_on_char 'T' date_str in
    match parts with
    | date_part :: time_part :: _ ->
        let date_parts = String.split_on_char '-' date_part in
        let months = [|"Jan"; "Feb"; "Mar"; "Apr"; "May"; "Jun";
                     "Jul"; "Aug"; "Sep"; "Oct"; "Nov"; "Dec"|] in
        (match date_parts with
         | year :: month :: day :: _ ->
             let month_int = int_of_string month in
             let month_name = months.(month_int - 1) in
             let time_clean = if String.contains time_part 'Z' then
                 String.sub time_part 0 (String.index time_part 'Z')
               else time_part
             in
             Printf.sprintf "%s %s %s %s +0000" day month_name year time_clean
         | _ -> date_str)
    | _ -> date_str
  with _ -> date_str

let generate_rss_item post =
  let slug = create_slug post.title in
  let content = match post.body with
    | Some body -> Cmarkit.Doc.of_string body |> Cmarkit_html.of_doc ~safe:false
    | None -> "No content available."
  in
  Printf.sprintf {|
    <item>
      <title>%s</title>
      <link>https://blog.rastrian.dev/post/%s</link>
      <description><![CDATA[%s]]></description>
      <author>%s</author>
      <guid isPermaLink="true">https://blog.rastrian.dev/post/%s</guid>
      <pubDate>%s</pubDate>
    </item>|}
    (escape_xml post.title)
    slug
    content
    (escape_xml post.author)
    slug
    (format_rss_date post.created_at)

let generate_rss_feed posts =
  let items = List.map generate_rss_item posts |> String.concat "\n" in
  let last_build_date = match posts with
    | post :: _ -> format_rss_date post.created_at
    | [] -> format_rss_date (Printf.sprintf "%fZ" (Unix.time ()))
  in
  Printf.sprintf {|<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Rastrian Blog</title>
    <link>https://blog.rastrian.dev</link>
    <description>Software Engineer passionate about backend development, DevOps, and functional programming</description>
    <language>en-us</language>
    <managingEditor>me@rastrian.dev (Luis Vaz)</managingEditor>
    <webMaster>me@rastrian.dev (Luis Vaz)</webMaster>
    <lastBuildDate>%s</lastBuildDate>
    <atom:link href="https://blog.rastrian.dev/rss.xml" rel="self" type="application/rss+xml"/>
    <generator>OCaml Blog Generator</generator>
    <ttl>60</ttl>
%s
  </channel>
</rss>|}
    last_build_date
    items

let extract_first_image content =
  (* Try to find markdown images first: ![alt](url) *)
  let make_absolute_url url =
    if String.length url > 4 && (String.sub url 0 4 = "http" || String.sub url 0 2 = "//") then
      url
    else if String.length url > 0 && url.[0] = '/' then
      "https://blog.rastrian.dev" ^ url
    else
      url
  in
  try
    let markdown_regex = Str.regexp "!\\[[^]]*\\](\\([^)]+\\))" in
    if Str.search_forward markdown_regex content 0 >= 0 then
      Some (make_absolute_url (Str.matched_group 1 content))
    else
      (* Try to find HTML img tags: <img src="url" ... > *)
      let html_regex = Str.regexp "<img[^>]+src=[\"']\\([^\"']+\\)[\"'][^>]*>" in
      if Str.search_forward html_regex content 0 >= 0 then
        Some (make_absolute_url (Str.matched_group 1 content))
      else
        (* Try to find HTML img tags with different quote styles *)
        let html_regex2 = Str.regexp "<img[^>]+src=\\([^ >]+\\)[^>]*>" in
        if Str.search_forward html_regex2 content 0 >= 0 then
          Some (make_absolute_url (Str.matched_group 1 content))
        else
          None
  with
  | Not_found -> None
  | _ -> None

let generate_blog_meta_tags () =
  {|
    <!-- Open Graph -->
    <meta property="og:title" content="Rastrian's Blog | Life & Tech">
    <meta property="og:description" content="Personal blog about functional programming, software development, and tech insights">
    <meta property="og:image" content="https://rastrian.dev/assets/img/profile.png">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://blog.rastrian.dev">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@TheRastrian">
    <meta name="twitter:creator" content="@TheRastrian">
    <meta name="twitter:title" content="Rastrian's Blog | Life & Tech">
    <meta name="twitter:description" content="Personal blog about life, functional programming, software development, and tech insights">
    <meta name="twitter:image" content="https://rastrian.dev/assets/img/profile.png">
  |}

let generate_post_meta_tags post =
  let description = match post.body with
    | Some body -> extract_description body 512
    | None -> "Read this post on Rastrian's blog about life, functional programming, and software development"
  in
  let post_url = Printf.sprintf "https://blog.rastrian.dev/post/%s" (create_slug post.title) in
  let image = match post.body with
    | Some body -> 
      (match extract_first_image body with
       | Some img_url -> img_url
       | None -> "https://rastrian.dev/assets/img/profile.png")
    | None -> "https://rastrian.dev/assets/img/profile.png"
  in
  Printf.sprintf {|
    <!-- Open Graph -->
    <meta property="og:title" content="%s">
    <meta property="og:description" content="%s">
    <meta property="og:image" content="%s">
    <meta property="og:type" content="article">
    <meta property="og:url" content="%s">
    <meta property="article:author" content="Luis Vaz (Rastrian)">
    <meta property="article:published_time" content="%s">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@TheRastrian">
    <meta name="twitter:creator" content="@TheRastrian">
    <meta name="twitter:title" content="%s">
    <meta name="twitter:description" content="%s">
    <meta name="twitter:image" content="%s">
  |} post.title description image post_url post.created_at post.title description image

let render_tags tags =
  let filtered_tags = List.filter (fun tag -> tag <> "published") tags in
  String.concat "" (List.map (fun tag -> 
    Printf.sprintf {|<span class="tag">%s</span>|} tag
  ) filtered_tags)

let take n lst =
  let rec aux acc n = function
    | [] -> List.rev acc
    | h :: t when n > 0 -> aux (h :: acc) (n - 1) t
    | _ -> List.rev acc
  in
  aux [] n lst

let render_post_preview post =
  let preview = match post.body with
    | Some body -> 
      let lines = String.split_on_char '\n' body in
      let preview_lines = take (min 3 (List.length lines)) lines in
      String.concat "\n" preview_lines ^ (if List.length lines > 3 then "..." else "")
    | None -> "No content available."
  in
  let markdown_preview = Cmarkit.Doc.of_string preview |> Cmarkit_html.of_doc ~safe:false in
  let slug = create_slug post.title in
  Printf.sprintf {|
    <article class="post">
        <h2><a href="/post/%s" class="post-title">%s</a></h2>
        <div class="post-meta">
            By <strong>%s</strong> on %s
        </div>
        <div class="post-content markdown-content">%s</div>
        <div class="tags">%s</div>
    </article>
  |} slug post.title post.author (format_date post.created_at) markdown_preview (render_tags post.labels)

let render_post_full post =
  let content = match post.body with
    | Some body -> Cmarkit.Doc.of_string body |> Cmarkit_html.of_doc ~safe:false
    | None -> "<p>No content available.</p>"
  in
  Printf.sprintf {|
    <article class="post">
        <h1 class="post-title">%s</h1>
        <div class="post-meta">
            By <strong>%s</strong> on %s
            <br><a href="%s" target="_blank">View on GitHub</a>
        </div>
        <div class="post-content markdown-content">%s</div>
        <div class="tags">%s</div>
    </article>
    
    <div class="comments-section" style="margin-top: 3rem;">
        <script src="https://giscus.app/client.js"
                data-repo="rastrian/blog"
                data-repo-id="R_kgDOPkwBNQ"
                data-category="Q&A"
                data-category-id="DIC_kwDOPkwBNc4CuntW"
                data-mapping="pathname"
                data-strict="0"
                data-reactions-enabled="1"
                data-emit-metadata="0"
                data-input-position="top"
                data-theme="preferred_color_scheme"
                data-lang="en"
                crossorigin="anonymous"
                async>
        </script>
    </div>
  |} post.title post.author (format_date post.created_at) post.html_url content (render_tags post.labels)

let render_pagination current_page total_posts per_page =
  let total_pages = (total_posts + per_page - 1) / per_page in
  if total_pages <= 1 then ""
  else
    let prev_link = 
      if current_page > 1 then
        Printf.sprintf {|<a href="/?page=%d" class="pagination-btn">← Previous</a>|} (current_page - 1)
      else
        {|<span class="pagination-btn disabled">← Previous</span>|}
    in
    let next_link = 
      if current_page < total_pages then
        Printf.sprintf {|<a href="/?page=%d" class="pagination-btn">Next →</a>|} (current_page + 1)
      else
        {|<span class="pagination-btn disabled">Next →</span>|}
    in
    let page_info = Printf.sprintf "Page %d of %d" current_page total_pages in
    Printf.sprintf {|
      <div class="pagination">
        %s
        <span class="page-info">%s</span>
        %s
      </div>
    |} prev_link page_info next_link

let home_page posts current_page total_posts per_page =
  let posts_html = String.concat "\n" (List.map render_post_preview posts) in
  let pagination_html = render_pagination current_page total_posts per_page in
  let meta_tags = generate_blog_meta_tags () in
  layout ~title:"rastrian blog" ~content:(posts_html ^ pagination_html) ~meta_tags ()

let post_page post =
  let content = render_post_full post in
  let meta_tags = generate_post_meta_tags post in
  layout ~title:(Printf.sprintf "%s - rastrian blog" post.title) ~content ~meta_tags ()

let tags_page posts =
  let all_tags = List.fold_left (fun acc post ->
    List.fold_left (fun acc tag -> 
      if List.mem tag acc || tag = "published" then acc else tag :: acc
    ) acc post.labels
  ) [] posts in
  
  let tags_html = String.concat "\n" (List.map (fun tag ->
    let count = List.fold_left (fun acc post ->
      if List.mem tag post.labels then acc + 1 else acc
    ) 0 posts in
    Printf.sprintf {|<div><a href="/tag/%s">%s (%d)</a></div>|} tag tag count
  ) all_tags) in
  
  layout ~title:"Tags - rastrian blog" ~content:(Printf.sprintf {|
    <h1>Tags</h1>
    <div>%s</div>
  |} tags_html) ()

let not_found_page = 
  layout ~title:"404 - Not Found" ~content:{|
    <h1>404 - Page Not Found</h1>
    <p>The page you're looking for doesn't exist.</p>
    <p><a href="/">← Back to home</a></p>
  |} ()

let tag_page tag posts =
  if tag = "published" then
    not_found_page
  else
    let filtered_posts = List.filter (fun post -> List.mem tag post.labels) posts in
    let posts_html = String.concat "\n" (List.map render_post_preview filtered_posts) in
    layout ~title:(Printf.sprintf "Posts tagged '%s' - rastrian blog" tag) 
           ~content:(Printf.sprintf {|
      <h1>Posts tagged '%s'</h1>
      %s
    |} tag posts_html) ()

