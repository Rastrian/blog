open Github

let css = {|
/* ==========================================================================
   rastrian/blog - design system ported from the rastrian.dev landing
   direction: gothic / ember / manuscript
   ========================================================================== */

/* First paint on <html>, not on <body> (anti-FOUC) */
html {
  background: #f5f3ef;
}

html[data-theme="dark"] {
  background: #0d0817;
}

html:not([data-theme="light"]) {
  background: #0d0817;
}

/* ===== Design tokens (exact copy of the approved landing) ===== */
:root {
  color-scheme: light;
  --sans: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
  --mono: "JetBrains Mono", ui-monospace, "SFMono-Regular", Menlo, Consolas, monospace;
  --display: "Cinzel", "Times New Roman", serif;
  --bg: #f5f3ef;
  --bg-2: #edeae2;
  --surface: #fffdf9;
  --text: #241a3e;
  --text-soft: #4d4363;
  --text-faint: #5f5573;
  --heading: #2a1c4f;
  --border: #e2ddd1;
  --border-strong: #cfc7b6;
  --accent: #f27b22;
  --accent-strong: #d96a15;
  --accent-text: #a34400;
  --accent-soft: rgba(242, 123, 34, 0.12);
  --focus: #a34400;
  --shadow-1: 0 1px 2px rgba(23,15,42,0.06), 0 10px 28px rgba(23,15,42,0.08);
  --shadow-ember: 0 8px 28px rgba(242,123,34,0.30);
  --nav-bg: rgba(245, 243, 239, 0.88);
}

[data-theme="dark"] {
  color-scheme: dark;
  --bg: #0d0817;
  --bg-2: #170f2a;
  --surface: rgba(255,255,255,0.045);
  --text: rgba(255,255,255,0.92);
  --text-soft: rgba(255,255,255,0.72);
  --text-faint: rgba(255,255,255,0.60);
  --heading: rgba(255,255,255,0.96);
  --border: rgba(255,255,255,0.09);
  --border-strong: rgba(255,255,255,0.19);
  --accent: #ff9347;
  --accent-strong: #ffa55e;
  --accent-text: #ff9347;
  --accent-soft: rgba(255,147,71,0.10);
  --focus: #ff9347;
  --shadow-1: 0 1px 2px rgba(0,0,0,0.30), 0 10px 28px rgba(0,0,0,0.36);
  --shadow-ember: 0 8px 28px rgba(255,147,71,0.22);
  --nav-bg: rgba(13, 8, 23, 0.84);
}

/* No-JS / auto default: dark whenever no explicit data-theme is set */
:root:not([data-theme="light"]) {
  color-scheme: dark;
  --bg: #0d0817;
  --bg-2: #170f2a;
  --surface: rgba(255,255,255,0.045);
  --text: rgba(255,255,255,0.92);
  --text-soft: rgba(255,255,255,0.72);
  --text-faint: rgba(255,255,255,0.60);
  --heading: rgba(255,255,255,0.96);
  --border: rgba(255,255,255,0.09);
  --border-strong: rgba(255,255,255,0.19);
  --accent: #ff9347;
  --accent-strong: #ffa55e;
  --accent-text: #ff9347;
  --accent-soft: rgba(255,147,71,0.10);
  --focus: #ff9347;
  --shadow-1: 0 1px 2px rgba(0,0,0,0.30), 0 10px 28px rgba(0,0,0,0.36);
  --shadow-ember: 0 8px 28px rgba(255,147,71,0.22);
  --nav-bg: rgba(13, 8, 23, 0.84);
}

/* Prism syntax palette derived from the theme; same rules as the tokens above */
:root {
  --syn-comment: #5f5573;
  --syn-punct: #4d4363;
  --syn-string: #b8a67a;
  --syn-keyword: #8d4b0f;
  --syn-function: #6b46c1;
  --syn-number: #a34400;
  --syn-plain: #241a3e;
}

[data-theme="dark"] {
  --syn-comment: rgba(255,255,255,0.60);
  --syn-punct: rgba(255,255,255,0.72);
  --syn-string: #e8c28a;
  --syn-keyword: #ffa55e;
  --syn-function: #c4a5ff;
  --syn-number: #ff9347;
  --syn-plain: rgba(255,255,255,0.92);
}

:root:not([data-theme="light"]) {
  --syn-comment: rgba(255,255,255,0.60);
  --syn-punct: rgba(255,255,255,0.72);
  --syn-string: #e8c28a;
  --syn-keyword: #ffa55e;
  --syn-function: #c4a5ff;
  --syn-number: #ff9347;
  --syn-plain: rgba(255,255,255,0.92);
}

/* ===== Base ===== */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: var(--sans);
  color: var(--text);
  line-height: 1.6;
  font-size: 1rem;
  background: transparent;
  padding-top: 64px;
  position: relative;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

/* Static radial ember tint behind the page head (same atmosphere as the
   landing hero); theme-native via --accent-soft, so it works in both themes */
body::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 34rem;
  z-index: 0;
  pointer-events: none;
  background: radial-gradient(46rem 26rem at 50% 0%, var(--accent-soft), transparent 65%);
}

::selection {
  background: var(--accent-soft);
}

a {
  color: var(--accent-text);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
  text-underline-offset: 3px;
}

:focus-visible {
  outline: 2px solid var(--focus);
  outline-offset: 2px;
}

img {
  max-width: 100%;
  height: auto;
}

.container {
  position: relative;
  z-index: 1;
  max-width: 840px;
  margin: 0 auto;
  padding: 0 28px;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

/* Inner: container width/padding without the flex-page layout (used by contact and footer) */
.inner {
  max-width: 840px;
  margin: 0 auto;
  padding: 0 28px;
  width: 100%;
}

main {
  flex: 1;
  padding-bottom: 4rem;
}

/* ===== Navbar (matches the landing: fixed bar, blur, mono + active diamond) ===== */
.site-nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 50;
  background: var(--nav-bg);
  -webkit-backdrop-filter: blur(12px);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
}

.nav-inner {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  height: 64px;
  max-width: 1080px;
  margin-inline: auto;
  padding-inline: clamp(1.25rem, 5vw, 2.5rem);
}

.site-id {
  font-family: var(--mono);
  font-size: 0.88rem;
  font-weight: 500;
  color: var(--text-soft);
  text-decoration: none;
  transition: color 0.15s ease;
}
.site-id:hover { color: var(--accent-text); }

.nav-links {
  display: flex;
  align-items: center;
  gap: 0.1rem;
  margin: 0 0 0 auto;
  padding: 0;
  list-style: none;
}
.nav-links a {
  display: block;
  padding: 0.45rem 0.7rem;
  font-family: var(--mono);
  font-size: 0.82rem;
  color: var(--text-faint);
  text-decoration: none;
  transition: color 0.15s ease;
}
.nav-links a::before {
  content: "◇";
  margin-right: 0.4rem;
  font-size: 0.7em;
  opacity: 0;
  transition: opacity 0.15s ease;
}
.nav-links a:hover { color: var(--text); }
.nav-links a.active { color: var(--accent-text); }
.nav-links a.active::before { opacity: 1; }

.icon-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 4px;
  border: 1px solid var(--border);
  background: var(--surface);
  color: var(--text-soft);
  transition: color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
}
.icon-btn:hover {
  color: var(--accent-text);
  border-color: var(--accent);
  box-shadow: 0 0 0 3px var(--accent-soft);
}

.nav-toggle { display: none; margin-left: auto; }

.nav-toggle .i-close { display: none; }
.site-nav.open .nav-toggle .i-close { display: block; }
.site-nav.open .nav-toggle .i-burger { display: none; }

@media (max-width: 780px) {
  .nav-toggle { display: inline-flex; }
  .nav-links {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    flex-direction: column;
    align-items: stretch;
    gap: 0.15rem;
    margin-left: 0;
    padding: 0.85rem clamp(1.25rem, 5vw, 2.5rem) 1.25rem;
    background: var(--bg);
    border-bottom: 1px solid var(--border);
    box-shadow: var(--shadow-1);
  }
  .site-nav.open .nav-links { display: flex; }
  .nav-links a { padding: 0.7rem 0.75rem; font-size: 1rem; }
}

/* Gothic ornament: hairline + ember diamond */
.ornament {
  margin-top: 1.1rem;
  text-align: center;
  color: var(--border-strong);
}

/* ===== Toggle de tema ===== */
.theme-toggle svg {
  display: block;
}

.theme-toggle .i-moon { display: block; }
.theme-toggle .i-sun { display: none; }

[data-theme="dark"] .theme-toggle .i-moon { display: none; }
[data-theme="dark"] .theme-toggle .i-sun { display: block; }

/* ===== Section header (kicker + title) ===== */
.section-head {
  padding: 2.8rem 0 1.6rem;
}

.kicker {
  font-family: var(--mono);
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.22em;
  text-transform: uppercase;
  color: var(--accent-text);
  display: flex;
  align-items: center;
  gap: 0.55rem;
}

.section-title {
  font-family: var(--display);
  font-weight: 600;
  font-size: 2rem;
  color: var(--heading);
  margin-top: 0.45rem;
  line-height: 1.15;
}

/* ===== Diamond markers ===== */
.diamond {
  display: inline-block;
  width: 6px;
  height: 6px;
  flex: 0 0 6px;
  background: var(--accent);
  transform: rotate(45deg);
}

.tag-sep {
  display: inline-block;
  width: 5px;
  height: 5px;
  background: var(--border-strong);
  transform: rotate(45deg);
  vertical-align: middle;
  margin: 0 0.6rem;
}

/* ===== Post list (landing Writing pattern) ===== */
.post-list {
  border-top: 1px solid var(--border);
}

.post-row {
  padding: 1.6rem 0;
  border-bottom: 1px solid var(--border);
}

.post-date {
  display: flex;
  align-items: center;
  gap: 0.55rem;
  font-family: var(--mono);
  font-size: 0.78rem;
  color: var(--text-faint);
}

.post-row-title {
  font-family: var(--sans);
  font-weight: 600;
  font-size: 1.3rem;
  line-height: 1.35;
  margin: 0.5rem 0 0.65rem;
}

.post-row-title a {
  color: var(--heading);
  transition: color 0.15s ease;
}

.post-row-title a:hover {
  color: var(--accent-text);
  text-decoration: none;
}

/* Link arrow: SVG, slides 3px on hover */
.link-arrow {
  display: inline-flex;
  align-items: center;
  color: var(--text-faint);
  margin-left: 0.45rem;
  vertical-align: middle;
  transition: transform 0.15s ease, color 0.15s ease;
}

a:hover > .link-arrow {
  transform: translateX(3px);
  color: var(--accent-text);
}

.post-excerpt {
  color: var(--text-soft);
  font-size: 0.95rem;
  line-height: 1.65;
}

.post-excerpt p {
  margin: 0 0 0.55rem;
}

.post-excerpt p:last-child {
  margin-bottom: 0;
}

.post-tags {
  margin-top: 0.8rem;
  font-family: var(--mono);
  font-size: 0.75rem;
  color: var(--text-faint);
}

.tag-link {
  color: var(--text-faint);
  transition: color 0.15s ease;
}

.tag-link:hover {
  color: var(--accent-text);
  text-decoration: none;
}

/* ===== Paginacao ===== */
.pagination {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
  margin-top: 2.2rem;
  padding-top: 1.4rem;
  border-top: 1px solid var(--border);
}

.pagination-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.55rem;
  padding: 0.8rem 1.35rem;
  border-radius: 4px;
  border: 1px solid var(--border-strong);
  background: var(--surface);
  font-family: var(--mono);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.09em;
  text-transform: uppercase;
  color: var(--text);
  transition: transform 0.15s ease, border-color 0.15s ease, color 0.15s ease;
}

a.pagination-btn:hover {
  border-color: var(--accent);
  color: var(--accent-text);
  transform: translateY(-1px);
  text-decoration: none;
}

.pagination-btn svg { flex: none; }

.pagination-btn.disabled {
  opacity: 0.45;
  pointer-events: none;
}

.page-info {
  font-family: var(--mono);
  font-size: 0.78rem;
  color: var(--text-faint);
  letter-spacing: 0.06em;
}

@media (max-width: 640px) {
  .pagination { flex-direction: column; gap: 0.9rem; }
  .pagination-btn { width: 100%; justify-content: center; }
  .page-info { order: -1; }
}

/* ===== Artigo individual ===== */
.article {
  max-width: 740px;
}

.article-head {
  padding: 2.8rem 0 0;
}

.article-title {
  font-family: var(--display);
  font-weight: 600;
  font-size: clamp(1.8rem, 4vw, 2.6rem);
  line-height: 1.15;
  color: var(--heading);
  margin: 0.7rem 0 1rem;
}

.article-byline {
  font-family: var(--mono);
  font-size: 0.8rem;
  color: var(--text-faint);
  padding-bottom: 1.6rem;
}

.article-byline strong {
  color: var(--text-soft);
  font-weight: 500;
}

.article-source-row {
  margin: 0.35rem 0 0;
  padding-bottom: 1.6rem;
  border-bottom: 1px solid var(--border);
  margin-bottom: 2rem;
}

.article-source {
  display: inline-flex;
  align-items: center;
  gap: 0.45rem;
  font-family: var(--mono);
  font-size: 0.78rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--text-faint);
  transition: color 0.15s ease;
}

.article-source:hover {
  color: var(--accent-text);
  text-decoration: none;
}
.article-source:hover svg { transform: translateX(3px); }
.article-source svg { transition: transform 0.15s ease; }

/* ===== Corpo markdown ===== */
.markdown-content {
  line-height: 1.7;
  color: var(--text);
  font-size: 1rem;
}

.markdown-content p {
  margin: 0 0 1.05rem;
}

.markdown-content h1, .markdown-content h2, .markdown-content h3,
.markdown-content h4, .markdown-content h5, .markdown-content h6 {
  font-family: var(--display);
  font-weight: 600;
  color: var(--heading);
  line-height: 1.3;
  margin: 2.1rem 0 0.9rem;
}

.markdown-content h1 { font-size: 1.9rem; }
.markdown-content h2 { font-size: 1.55rem; }
.markdown-content h3 { font-size: 1.3rem; }
.markdown-content h4 { font-size: 1.12rem; }
.markdown-content h5 { font-size: 1rem; }
.markdown-content h6 { font-size: 0.9rem; }

.markdown-content a {
  color: var(--accent-text);
  text-decoration: none;
  border-bottom: 1px solid var(--border-strong);
  transition: border-color 0.15s ease, color 0.15s ease;
}

.markdown-content a:hover {
  border-bottom-color: var(--accent-text);
}

.markdown-content ul, .markdown-content ol {
  margin: 1.05rem 0;
  padding-left: 1.6rem;
}

.markdown-content li {
  margin-bottom: 0.45rem;
  line-height: 1.65;
}

.markdown-content blockquote {
  border-left: 2px solid var(--accent);
  background: var(--accent-soft);
  padding: 0.85rem 1.1rem;
  margin: 1.5rem 0;
  border-radius: 0 6px 6px 0;
  color: var(--text-soft);
}

.markdown-content code {
  font-family: var(--mono);
  font-size: 0.88em;
  background: var(--accent-soft);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.1em 0.35em;
}

.markdown-content pre {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 1.1rem 1.2rem;
  overflow-x: auto;
  margin: 1.5rem 0;
  line-height: 1.55;
}

.markdown-content pre code {
  background: none;
  border: none;
  padding: 0;
  border-radius: 0;
  font-size: 0.88rem;
}

.markdown-content table {
  border-collapse: collapse;
  margin: 1.5rem 0;
  width: 100%;
  font-size: 0.95rem;
}

.markdown-content th, .markdown-content td {
  border: 1px solid var(--border);
  padding: 0.6rem 0.75rem;
  text-align: left;
}

.markdown-content th {
  background: var(--bg-2);
  font-family: var(--mono);
  font-size: 0.8rem;
  font-weight: 600;
  color: var(--heading);
}

.markdown-content hr {
  border: 0;
  border-top: 1px solid var(--border-strong);
  height: 0;
  margin: 2.2rem 0;
}

.markdown-content img {
  border-radius: 6px;
  margin: 1.5rem 0;
}

.markdown-content iframe {
  max-width: 100%;
  aspect-ratio: 16 / 9;
  height: auto;
  display: block;
  margin: 1.5rem auto;
  border-radius: 6px;
}

/* ===== Prism: local colors, consistent with the palette ===== */
code[class*="language-"],
pre[class*="language-"] {
  font-family: var(--mono);
  color: var(--syn-plain);
  text-align: left;
  white-space: pre;
  word-spacing: normal;
  word-break: normal;
  tab-size: 2;
  hyphens: none;
}

pre[class*="language-"] {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  margin: 1.5rem 0;
  padding: 1.1rem 1.2rem;
  overflow: auto;
}

:not(pre) > code[class*="language-"] {
  background: var(--accent-soft);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.1em 0.35em;
  font-size: 0.88em;
}

.token.comment,
.token.prolog,
.token.doctype,
.token.cdata {
  color: var(--syn-comment);
}

.token.punctuation {
  color: var(--syn-punct);
}

.token.property,
.token.tag,
.token.boolean,
.token.number,
.token.constant,
.token.symbol,
.token.deleted {
  color: var(--syn-number);
}

.token.selector,
.token.attr-name,
.token.string,
.token.char,
.token.builtin,
.token.inserted {
  color: var(--syn-string);
}

.token.operator,
.token.entity,
.token.url,
.language-css .token.string,
.style .token.string {
  color: var(--syn-punct);
}

.token.atrule,
.token.attr-value,
.token.keyword {
  color: var(--syn-keyword);
}

.token.function,
.token.class-name {
  color: var(--syn-function);
}

.token.regex,
.token.important,
.token.variable {
  color: var(--syn-number);
}

.token.important,
.token.bold {
  font-weight: 600;
}

.token.italic {
  font-style: italic;
}

/* ===== Mermaid ===== */
.mermaid {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 1.5rem;
  margin: 1.5rem 0;
  overflow-x: auto;
  text-align: center;
}

.mermaid svg {
  max-width: 100%;
  height: auto;
}

pre code.language-mermaid,
pre code.lang-mermaid {
  display: none;
}

/* ===== Tags page (textual checklist) ===== */
.tag-list {
  list-style: none;
  border-top: 1px solid var(--border);
}

.tag-row {
  display: flex;
  align-items: center;
  gap: 0.65rem;
  padding: 0.85rem 0;
  border-bottom: 1px solid var(--border);
  font-family: var(--mono);
  font-size: 0.88rem;
}

.tag-row .tag-link {
  color: var(--heading);
  transition: color 0.15s ease;
}

.tag-row .tag-link:hover {
  color: var(--accent-text);
  text-decoration: none;
}

.tag-count {
  color: var(--text-faint);
  font-size: 0.8rem;
}

/* ===== Feed page ===== */
.feed-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 1.4rem 1.5rem;
  margin-bottom: 1.4rem;
}

.feed-card-title {
  font-family: var(--display);
  font-weight: 600;
  font-size: 1.15rem;
  color: var(--heading);
  margin-bottom: 0.8rem;
}

.feed-card p {
  margin-bottom: 0.7rem;
  color: var(--text-soft);
}

.feed-card p:last-child {
  margin-bottom: 0;
}

.feed-card strong {
  color: var(--text);
  font-weight: 600;
}

.feed-link {
  color: var(--accent-text);
}

.feed-link:hover {
  text-decoration: underline;
  text-underline-offset: 3px;
}

.feed-url-row {
  display: flex;
  align-items: center;
  gap: 0.9rem;
  flex-wrap: wrap;
}

.feed-url {
  font-family: var(--mono);
  font-size: 0.92rem;
  color: var(--accent-text);
  background: var(--bg-2);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.55rem 0.8rem;
  word-break: break-all;
  flex: 1 1 220px;
}

.feed-copy-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-family: var(--mono);
  font-size: 0.8rem;
  padding: 0.55rem 1rem;
  background: transparent;
  border: 1px solid var(--border);
  border-radius: 4px;
  color: var(--text-soft);
  cursor: pointer;
  transition: border-color 0.15s ease, color 0.15s ease, opacity 0.15s ease;
}

.feed-copy-btn:hover {
  border-color: var(--accent);
  color: var(--accent-text);
}

.copy-feedback {
  display: none;
  font-family: var(--mono);
  font-size: 0.78rem;
  color: var(--accent-text);
  margin-top: 0.7rem;
}

.feed-list {
  margin: 0.4rem 0 0 1.4rem;
  color: var(--text-soft);
  line-height: 1.8;
}

.feed-list li {
  margin-bottom: 0.4rem;
}

.feed-list strong {
  color: var(--text);
  font-weight: 600;
}

/* ===== 404 ===== */
.notfound-text {
  color: var(--text-soft);
  margin: 1rem 0 1.8rem;
  max-width: 46ch;
}

.back-link {
  font-family: var(--mono);
  font-size: 0.85rem;
  color: var(--text-soft);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.55rem 1rem;
  display: inline-flex;
  align-items: center;
  transition: border-color 0.15s ease, color 0.15s ease;
}

.back-link:hover {
  border-color: var(--accent);
  color: var(--accent-text);
  text-decoration: none;
}

/* ===== Comentarios (giscus) ===== */
.comments-section {
  margin-top: 3.5rem;
  padding-top: 2rem;
  border-top: 1px solid var(--border);
}

/* ===== Footer ===== */
/* ===== Footer (landing style: centered ornament + inner flex) ===== */
.site-footer {
  border-top: 1px solid var(--border);
  padding-block: 2.1rem;
}
.site-footer .orn { margin-inline: auto; }
.footer-inner {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  gap: 0.5rem 1.5rem;
  margin-top: 1.4rem;
  font-size: 0.85rem;
  color: var(--text-faint);
}
.footer-inner a {
  color: var(--text-faint);
  transition: color 0.15s ease;
}
.footer-inner a:hover {
  color: var(--accent-text);
  text-decoration: none;
}

/* ===== Contact section (landing style) ===== */
.contact-inner {
  padding-block: clamp(3.5rem, 9vw, 6rem);
  border-top: 1px solid var(--border);
  text-align: center;
}
.contact-inner .section-head { margin-bottom: 1.4rem; }
.contact-inner .kicker-row { justify-content: center; }
.contact-inner .kicker-row::after { display: none; }
.contact-inner .section-lede { margin-inline: auto; }
.contact-inner .orn { margin-inline: auto; }

.email-link {
  display: inline-block;
  margin-top: 1.2rem;
  font-family: var(--mono);
  font-size: clamp(1.3rem, 4.5vw, 2rem);
  font-weight: 500;
  color: var(--heading);
  text-decoration: underline;
  text-decoration-color: var(--accent);
  text-decoration-thickness: 3px;
  text-underline-offset: 9px;
  transition: color 0.15s ease;
}
.email-link:hover { color: var(--accent-text); text-decoration-color: var(--accent); }

.socials {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 0.75rem;
  margin: 2.4rem 0 0;
  padding: 0;
  list-style: none;
}
.socials a {
  display: grid;
  place-items: center;
  width: 46px;
  height: 46px;
  border: 1px solid var(--border);
  border-radius: 4px;
  background: var(--surface);
  color: var(--text-soft);
  transition: color 0.15s ease, border-color 0.15s ease, transform 0.15s ease, box-shadow 0.15s ease;
}
.socials a:hover {
  color: var(--accent-text);
  border-color: var(--accent);
  transform: translateY(-2px);
  box-shadow: var(--shadow-1);
}

/* landing ornament reused in the footer */
.orn {
  display: block;
  width: 140px;
  height: 14px;
  color: var(--border-strong);
}
.orn .o-line { stroke: currentColor; stroke-width: 1; }
.orn .o-side { fill: currentColor; opacity: 0.6; }
.orn .o-core { fill: var(--accent); }

/* ===== Responsivo ===== */
@media (max-width: 640px) {
  .container {
    padding: 0 18px;
  }

  .site-header-row {
    gap: 0.7rem;
  }

  .site-nav {
    gap: 0.9rem;
  }

  .section-head {
    padding: 2.2rem 0 1.3rem;
  }

  .section-title {
    font-size: 1.7rem;
  }

  .post-row {
    padding: 1.3rem 0;
  }

  .post-row-title {
    font-size: 1.15rem;
  }

  .pagination {
    flex-direction: column;
  }

  .page-info {
    order: -1;
  }

  .feed-card {
    padding: 1.1rem 1.2rem;
  }
}
|}

let javascript = {|
// Cookie utilities
function setCookie(name, value, days) {
  const expires = new Date();
  expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
  // Domain-wide cookie: the theme choice syncs with rastrian.dev (the
  // landing reads it pre-paint and mirrors it into its localStorage).
  document.cookie = name + '=' + value + ';expires=' + expires.toUTCString() + ';path=/;domain=.rastrian.dev';
}

function getCookie(name) {
  const nameEQ = name + "=";
  const ca = document.cookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
  }
  return null;
}

// Theme switching: attribute -> giscus -> mermaid -> persist cookie via /api/theme
function toggleTheme() {
  const currentTheme = document.documentElement.getAttribute('data-theme');
  const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

  document.documentElement.setAttribute('data-theme', newTheme);
  updateGiscusTheme(newTheme);
  updateMermaidTheme(newTheme);

  // Client-side persistence: plain cookie (readable by the boot script),
  // written synchronously so it survives immediate navigation.
  setCookie('theme', newTheme, 365);
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

function updateMermaidTheme(theme) {
  if (window.mermaidInstance) {
    const mermaidTheme = theme === 'dark' ? 'dark' : 'default';
    window.mermaidInstance.initialize({
      startOnLoad: false,
      theme: mermaidTheme,
      securityLevel: 'loose',
      flowchart: { useMaxWidth: true, htmlLabels: true }
    });
    window.mermaidInstance.run();
  }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
  const themeButton = document.getElementById('theme-toggle');
  if (themeButton && !themeButton.dataset.themeBound) {
    themeButton.dataset.themeBound = '1';
    themeButton.addEventListener('click', toggleTheme);
  }

  // Active page marker (ember diamond, like the landing scroll-spy)
  var path = window.location.pathname;
  document.querySelectorAll('.nav-links a').forEach(function(a) {
    var href = a.getAttribute('href');
    if (href === path || (href === '/' && path === '/')) {
      a.classList.add('active');
    }
  });
  if (path.indexOf('/post/') === 0 || path.indexOf('/tag/') === 0) {
    var postsLink = document.querySelector('.nav-links a[href="/"]');
    if (postsLink) { postsLink.classList.add('active'); }
  }

  // Set initial Giscus theme after comments load
  setTimeout(function() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    updateGiscusTheme(currentTheme);
  }, 2000);
});

// Mobile menu (burger): delegated on document so script re-execution
// (Cloudflare Rocket Loader rewriting/deferring) can never bind twice
// and toggle the menu open+closed within one click.
if (!window.__blogNavBound) {
  window.__blogNavBound = true;
  document.addEventListener('click', function(e) {
    var toggle = e.target.closest ? e.target.closest('.nav-toggle') : null;
    if (!toggle) return;
    var nav = document.getElementById('site-nav');
    if (!nav) return;
    var open = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
    toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
  });
}

// Copy RSS URL to clipboard
function copyRssUrl() {
  const rssUrl = 'https://blog.rastrian.dev/rss.xml';
  const feedback = document.getElementById('copy-feedback');
  const button = document.getElementById('copy-rss-btn');

  if (navigator.clipboard && navigator.clipboard.writeText) {
    navigator.clipboard.writeText(rssUrl).then(function() {
      showCopyFeedback(feedback, button);
    }).catch(function(err) {
      console.error('Failed to copy:', err);
      fallbackCopy(rssUrl, feedback, button);
    });
  } else {
    fallbackCopy(rssUrl, feedback, button);
  }
}

function fallbackCopy(text, feedback, button) {
  const textarea = document.createElement('textarea');
  textarea.value = text;
  textarea.style.position = 'fixed';
  textarea.style.opacity = '0';
  document.body.appendChild(textarea);
  textarea.select();

  try {
    const successful = document.execCommand('copy');
    if (successful) {
      showCopyFeedback(feedback, button);
    } else {
      alert('Failed to copy. Please copy manually: ' + text);
    }
  } catch (err) {
    console.error('Fallback copy failed:', err);
    alert('Failed to copy. Please copy manually: ' + text);
  }

  document.body.removeChild(textarea);
}

function showCopyFeedback(feedback, button) {
  if (feedback && button) {
    feedback.style.display = 'block';
    const label = button.querySelector('.copy-label');
    if (label) label.textContent = 'Copied';
    button.style.opacity = '0.8';

    setTimeout(function() {
      feedback.style.display = 'none';
      if (label) label.textContent = 'Copy';
      button.style.opacity = '1';
    }, 2000);
  }
}
|}

let theme_boot_script = {|
(function () {
  var m = document.cookie.match(/(?:^|; )theme=(light|dark)(?:;|$)/);
  var t = m ? m[1] : 'dark';
  document.documentElement.setAttribute('data-theme', t);
})();
|}
let layout ~title ~content ?(meta_tags="") ~theme () =
  let html_open_tag =
    if theme = "auto" then {|<html lang="en">|}
    else Printf.sprintf {|<html lang="en" data-theme="%s">|} theme
  in
  Printf.sprintf {|<!DOCTYPE html>
%s
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>%s</title>
    <link rel="icon" type="image/png" href="https://rastrian.dev/assets/favicon.png">
    <link rel="alternate" type="application/rss+xml" title="Rastrian Blog RSS Feed" href="/rss.xml">
    <script data-cfasync="false">%s</script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500;600&display=swap">
    %s
    <style>%s</style>
</head>
<body>
    <div class="container">
        <header class="site-nav" id="site-nav">
            <nav class="nav-inner" aria-label="Primary">
                <a class="site-id" href="/">~/rastrian/blog</a>
                <button class="icon-btn nav-toggle" type="button" aria-expanded="false" aria-controls="nav-links" aria-label="Open menu">
                    <svg class="i-burger" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
                    <svg class="i-close" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18"/></svg>
                </button>
                <ul class="nav-links" id="nav-links">
                    <li><a href="https://rastrian.dev">home</a></li>
                    <li><a href="/">posts</a></li>
                    <li><a href="/tags">tags</a></li>
                    <li><a href="/feed">rss feed</a></li>
                </ul>
                <button id="theme-toggle" type="button" class="icon-btn theme-toggle" aria-label="Toggle dark mode">
                    <svg class="i-moon" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
                    <svg class="i-sun" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M4.93 19.07l1.41-1.41M17.66 6.34l1.41-1.41"/></svg>
                </button>
            </nav>
        </header>
        <main>%s</main>
        <section class="contact-inner" aria-labelledby="contact-title">
            <div class="inner">
                <div class="section-head">
                    <div class="kicker-row"><p class="kicker">~/contact</p></div>
                    <h2 id="contact-title">Contact</h2>
                    <svg class="orn" viewBox="0 0 140 14" aria-hidden="true" focusable="false">
                        <line class="o-line" x1="0" y1="7" x2="52" y2="7"/>
                        <rect class="o-side" x="54" y="4.5" width="4" height="4" transform="rotate(45 56 6.5)"/>
                        <rect class="o-core" x="63" y="2" width="10" height="10" transform="rotate(45 68 7)"/>
                        <rect class="o-side" x="78" y="4.5" width="4" height="4" transform="rotate(45 80 6.5)"/>
                        <line class="o-line" x1="84" y1="7" x2="140" y2="7"/>
                    </svg>
                    <p class="section-lede">Email is the fastest way to reach me. For anything else, pick a network:</p>
                </div>
                <a class="email-link" href="mailto:me@rastrian.dev">me@rastrian.dev</a>
                <ul class="socials">
                    <li>
                        <a href="https://github.com/Rastrian" aria-label="GitHub">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://br.linkedin.com/in/rastrian" aria-label="LinkedIn">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.225 0z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://twitter.com/TheRastrian" aria-label="X (Twitter)">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://bsky.app/profile/rastrian.dev" aria-label="Bluesky">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 10.8c-1.087-2.114-4.046-6.053-6.798-7.995C2.566 1.133.759 1.02 1.022 4.293c.213 2.586 3.275 10.348 4.61 12.748.832 1.496 2.516 3.635 4.817 3.635 2.3 0 3.984-2.139 4.816-3.635 1.335-2.4 4.397-10.162 4.61-12.748.263-3.273-1.544-3.16-4.18-.488C16.046 4.747 13.087 8.686 12 10.8Z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.twitch.tv/Rastrian" aria-label="Twitch">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M11.571 4.714h1.715v5.143H11.57zm4.715 0H18v5.143h-1.714zM6 0L1.714 4.286v15.428h5.143V24l4.286-4.286h3.428L22.286 12V0zm14.571 11.143l-3.428 3.428h-3.429l-3 3v-3H6.857V1.714h13.714Z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://discord.com/users/214508470588801024" aria-label="Discord">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M20.317 4.3698a19.7913 19.7913 0 00-4.8851-1.5152.0741.0741 0 00-.0785.0371c-.211.3753-.4447.8648-.6083 1.2495-1.8447-.2762-3.68-.2762-5.4868 0-.1636-.3933-.4058-.8742-.6177-1.2495a.077.077 0 00-.0785-.037 19.7363 19.7363 0 00-4.8852 1.515.0699.0699 0 00-.0321.0277C.5334 9.0458-.319 13.5799.0992 18.0578a.0824.0824 0 00.0312.0561c2.0528 1.5076 4.0413 2.4228 5.9929 3.0294a.0777.0777 0 00.0842-.0276c.4616-.6304.8731-1.2952 1.226-1.9942a.076.076 0 00-.0416-.1057c-.6528-.2476-1.2743-.5495-1.8722-.8923a.077.077 0 01-.0076-.1277c.1258-.0943.2517-.1923.3718-.2914a.0743.0743 0 01.0776-.0105c3.9278 1.7933 8.18 1.7933 12.0614 0a.0739.0739 0 01.0785.0095c.1202.099.246.1981.3728.2924a.077.077 0 01-.0066.1276 12.2986 12.2986 0 01-1.873.8914.0766.0766 0 00-.0407.1067c.3604.698.7719 1.3628 1.225 1.9932a.076.076 0 00.0842.0286c1.961-.6067 3.9495-1.5219 6.0023-3.0294a.077.077 0 00.0313-.0552c.5004-5.177-.8382-9.6739-3.5485-13.6604a.061.061 0 00-.0312-.0286zM8.02 15.3312c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9555-2.4189 2.157-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.9555 2.4189-2.1569 2.4189zm7.9748 0c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9554-2.4189 2.1569-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.946 2.4189-2.1568 2.4189Z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://t.me/Rastrian" aria-label="Telegram">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M11.944 0A12 12 0 000 12a12 12 0 0012 12 12 12 0 0012-12A12 12 0 0012 0a12 12 0 00-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 01.171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/></svg>
                        </a>
                    </li>
                    <li>
                        <a href="/feed" aria-label="Blog RSS feed">
                            <svg width="20" height="20" viewBox="0 0 24 24" aria-hidden="true"><path fill="currentColor" d="M4.5 17.4a2.1 2.1 0 100 4.2 2.1 2.1 0 000-4.2z"/><path fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" d="M4.5 10.2a9.3 9.3 0 0 1 9.3 9.3"/><path fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" d="M4.5 3.6a15.9 15.9 0 0 1 15.9 15.9"/></svg>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        <footer class="site-footer">
            <div class="inner">
                <svg class="orn" viewBox="0 0 140 14" aria-hidden="true" focusable="false">
                    <line class="o-line" x1="0" y1="7" x2="52" y2="7"/>
                    <rect class="o-side" x="54" y="4.5" width="4" height="4" transform="rotate(45 56 6.5)"/>
                    <rect class="o-core" x="63" y="2" width="10" height="10" transform="rotate(45 68 7)"/>
                    <rect class="o-side" x="78" y="4.5" width="4" height="4" transform="rotate(45 80 6.5)"/>
                    <line class="o-line" x1="84" y1="7" x2="140" y2="7"/>
                </svg>
                <div class="footer-inner">
                    <p>&copy; 2026 Luis Vaz (Rastrian)</p>
                    <a href="https://github.com/rastrian/blog" target="_blank" rel="noopener">rastrian/blog on GitHub</a>
                </div>
            </div>
        </footer>
    </div>
    <!-- Prism.js for syntax highlighting -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/autoloader/prism-autoloader.min.js"></script>
    <script data-cfasync="false">%s</script>
    <!-- Mermaid.js initialization (after DOM is ready) -->
    <script data-cfasync="false" type="module">
      import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';

      // Store mermaid instance globally for theme updates
      window.mermaidInstance = mermaid;

      function initializeMermaid() {
        const theme = document.documentElement.getAttribute('data-theme') === 'dark' ? 'dark' : 'default';
        mermaid.initialize({
          startOnLoad: true,
          theme: theme,
          securityLevel: 'loose',
          flowchart: { useMaxWidth: true, htmlLabels: true }
        });

        // Find all code blocks with language-mermaid and convert them
        document.querySelectorAll('pre code.language-mermaid, pre code.lang-mermaid').forEach(function(el) {
          const mermaidCode = el.textContent;
          const wrapper = document.createElement('div');
          wrapper.className = 'mermaid';
          wrapper.textContent = mermaidCode;
          el.parentElement.replaceWith(wrapper);
        });

        // Render all mermaid diagrams
        mermaid.run();
      }

      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initializeMermaid);
      } else {
        initializeMermaid();
      }
    </script>
</body>
</html>|} html_open_tag title theme_boot_script meta_tags css content javascript

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

(* Short date "Oct 2026" for kickers and the post list (Writing look) *)
let format_date_short date_str =
  try
    let date_part = List.hd (String.split_on_char 'T' date_str) in
    match String.split_on_char '-' date_part with
    | year :: month :: day :: _ ->
        let months = [|"Jan"; "Feb"; "Mar"; "Apr"; "May"; "Jun";
                       "Jul"; "Aug"; "Sep"; "Oct"; "Nov"; "Dec"|] in
        let month_int = int_of_string month in
        if month_int >= 1 && month_int <= 12 then
          Printf.sprintf "%s %s, %s" months.(month_int - 1) day year
        else date_part
    | _ -> date_part
  with _ -> date_str

(* Link arrow always as SVG, with the approved design system path *)
let arrow_icon = {|<span class="link-arrow" aria-hidden="true"><svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 12h15M13 6l6 6-6 6"/></svg></span>|}

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

(* Simple base64 encoding for Mermaid diagrams *)
let base64_encode s =
  let base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" in
  let encode_char n = String.make 1 base64_chars.[n] in
  let rec encode acc i =
    if i >= String.length s then acc
    else
      let byte1 = int_of_char s.[i] in
      if i + 1 >= String.length s then
        let b1 = encode_char ((byte1 lsr 2) land 63) in
        let b2 = encode_char (((byte1 lsl 4) land 48)) in
        acc ^ b1 ^ b2 ^ "=="
      else if i + 2 >= String.length s then
        let byte2 = int_of_char s.[i + 1] in
        let b1 = encode_char ((byte1 lsr 2) land 63) in
        let b2 = encode_char (((byte1 lsl 4) lor ((byte2 lsr 4) land 15)) land 63) in
        let b3 = encode_char (((byte2 lsl 2) land 60)) in
        acc ^ b1 ^ b2 ^ b3 ^ "="
      else
        let byte2 = int_of_char s.[i + 1] in
        let byte3 = int_of_char s.[i + 2] in
        let b1 = encode_char ((byte1 lsr 2) land 63) in
        let b2 = encode_char (((byte1 lsl 4) lor ((byte2 lsr 4) land 15)) land 63) in
        let b3 = encode_char (((byte2 lsl 2) lor ((byte3 lsr 6) land 3)) land 63) in
        let b4 = encode_char (byte3 land 63) in
        encode (acc ^ b1 ^ b2 ^ b3 ^ b4) (i + 3)
  in
  encode "" 0

(* Convert Mermaid code blocks to images for RSS feed *)
(* Processes markdown and replaces ```mermaid blocks with image tags before HTML conversion *)
let convert_mermaid_in_markdown markdown =
  let rec find_and_replace acc pos =
    if pos >= String.length markdown then acc
    else
      (* Find ```mermaid or ```lang-mermaid *)
      let mermaid_start = try Some (Str.search_forward (Str.regexp "```\\(mermaid\\|lang-mermaid\\)") markdown pos) with Not_found -> None in
      match mermaid_start with
      | None -> acc ^ (String.sub markdown pos (String.length markdown - pos))
      | Some start ->
          (* Calculate where the code starts (after ```mermaid or ```lang-mermaid) *)
          let lang_match = try Str.matched_group 1 markdown with Not_found -> "mermaid" in
          let lang_len = String.length lang_match in
          let code_start = start + 3 + lang_len in
          (* Skip newline if present *)
          let code_start = if code_start < String.length markdown && markdown.[code_start] = '\n' then code_start + 1 else code_start in
          (* Find the closing ``` *)
          let code_end = try Some (Str.search_forward (Str.regexp "```") markdown code_start) with Not_found -> None in
          match code_end with
          | None -> acc ^ (String.sub markdown pos (String.length markdown - pos))
          | Some end_pos ->
              let mermaid_code = String.sub markdown code_start (end_pos - code_start) in
              let trimmed_code = String.trim mermaid_code in
              if String.length trimmed_code > 0 then
                let base64_code = base64_encode trimmed_code in
                let image_markdown = Printf.sprintf "\n\n![Mermaid diagram](https://mermaid.ink/img/%s)\n\n" base64_code in
                let before_match = String.sub markdown pos (start - pos) in
                let after_pos = end_pos + 3 in
                find_and_replace (acc ^ before_match ^ image_markdown) after_pos
              else
                let before_match = String.sub markdown pos (start - pos) in
                let after_pos = end_pos + 3 in
                find_and_replace (acc ^ before_match) after_pos
  in
  find_and_replace "" 0

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
    | Some body -> 
        (* Convert Mermaid code blocks to images before markdown conversion *)
        let body_with_images = convert_mermaid_in_markdown body in
        Cmarkit.Doc.of_string body_with_images |> Cmarkit_html.of_doc ~safe:false
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
<?xml-stylesheet type="text/xsl" href="/rss.xsl"?>
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

let generate_rss_xsl () = {|<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="rss/channel/title"/> - RSS Feed</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&amp;family=Inter:wght@400;500;600;700&amp;family=JetBrains+Mono:wght@400;500;600&amp;display=swap"/>
        <style>
          :root {
            --bg: #0d0817;
            --bg-2: #170f2a;
            --surface: rgba(255,255,255,0.045);
            --text: rgba(255,255,255,0.92);
            --text-soft: rgba(255,255,255,0.72);
            --text-faint: rgba(255,255,255,0.60);
            --heading: rgba(255,255,255,0.96);
            --border: rgba(255,255,255,0.09);
            --accent: #ff9347;
            --accent-soft: rgba(255,147,71,0.10);
            --mono: "JetBrains Mono", ui-monospace, "SFMono-Regular", Menlo, Consolas, monospace;
            --sans: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
            --display: "Cinzel", "Times New Roman", serif;
          }
          body {
            font-family: var(--sans);
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.6;
            margin: 0;
            padding: 20px;
          }
          .container {
            max-width: 840px;
            margin: 0 auto;
          }
          .kicker {
            font-family: var(--mono);
            font-size: 0.75rem;
            letter-spacing: 0.22em;
            text-transform: uppercase;
            color: var(--accent);
          }
          .feed-header {
            margin: 30px 0;
          }
          .feed-title {
            font-family: var(--display);
            font-size: 2rem;
            color: var(--heading);
            margin: 6px 0 0 0;
          }
          .feed-description {
            color: var(--text-soft);
            font-size: 1rem;
            margin: 10px 0 0 0;
          }
          .rss-info {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
          }
          .rss-info h2 {
            font-family: var(--display);
            color: var(--heading);
            margin-top: 0;
            font-size: 1.15rem;
          }
          .rss-info p {
            margin-bottom: 12px;
            color: var(--text-soft);
          }
          .rss-url {
            background: var(--bg-2);
            border: 1px solid var(--border);
            padding: 10px 12px;
            border-radius: 4px;
            font-family: var(--mono);
            word-break: break-all;
            color: var(--accent);
          }
          .item {
            margin-bottom: 24px;
            border: 1px solid var(--border);
            padding: 20px;
            background: var(--surface);
            border-radius: 8px;
          }
          .item-title {
            font-family: var(--sans);
            font-weight: 600;
            font-size: 1.2rem;
            margin: 0 0 10px 0;
          }
          .item-title a {
            color: var(--heading);
            text-decoration: none;
          }
          .item-title a:hover {
            color: var(--accent);
          }
          .item-meta {
            font-family: var(--mono);
            color: var(--text-faint);
            font-size: 0.85rem;
            margin-bottom: 12px;
          }
          .item-description {
            color: var(--text-soft);
          }
          .about-link {
            color: var(--accent);
            text-decoration: none;
          }
          .about-link:hover {
            text-decoration: underline;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="rss-info">
            <h2>This is a Web Feed (RSS Feed)</h2>
            <p><strong>This is a web feed, also known as an RSS feed.</strong> Subscribe by copying the URL from the address bar into your newsreader.</p>
            <p>Visit <a href="https://aboutfeeds.com" class="about-link">About Feeds</a> to get started with newsreaders and subscribing. It's free.</p>
            <p><strong>Feed URL:</strong></p>
            <div class="rss-url"><xsl:value-of select="rss/channel/atom:link/@href"/></div>
          </div>

          <div class="feed-header">
            <p class="kicker">~/feed</p>
            <h1 class="feed-title"><xsl:value-of select="rss/channel/title"/></h1>
            <p class="feed-description"><xsl:value-of select="rss/channel/description"/></p>
          </div>

          <xsl:for-each select="rss/channel/item">
            <div class="item">
              <h3 class="item-title">
                <a href="{link}"><xsl:value-of select="title"/></a>
              </h3>
              <div class="item-meta">
                Published: <xsl:value-of select="pubDate"/> | By: <xsl:value-of select="author"/>
              </div>
              <div class="item-description">
                <xsl:value-of select="description" disable-output-escaping="yes"/>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>|}

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
    <meta property="og:image" content="https://rastrian.dev/assets/profile.png">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://blog.rastrian.dev">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@TheRastrian">
    <meta name="twitter:creator" content="@TheRastrian">
    <meta name="twitter:title" content="Rastrian's Blog | Life & Tech">
    <meta name="twitter:description" content="Personal blog about life, functional programming, software development, and tech insights">
    <meta name="twitter:image" content="https://rastrian.dev/assets/profile.png">
  |}

let generate_post_meta_tags post =
  let description = match post.body with
    | Some body -> extract_description body 200
    | None -> "Read this post on Rastrian's blog about life, functional programming, and software development"
  in
  let post_url = Printf.sprintf "https://blog.rastrian.dev/post/%s" (create_slug post.title) in
  let image = "https://rastrian.dev/assets/profile.png" in
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
  let sep = {|<span class="tag-sep" aria-hidden="true"></span>|} in
  String.concat sep (List.map (fun tag ->
    Printf.sprintf {|<a href="/tag/%s" class="tag-link">%s</a>|} (escape_xml tag) (escape_xml tag)
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
    <article class="post-row">
      <p class="post-date"><span class="diamond" aria-hidden="true"></span>%s</p>
      <h2 class="post-row-title"><a href="/post/%s">%s%s</a></h2>
      <div class="post-excerpt">%s</div>
      <p class="post-tags">%s</p>
    </article>|}
    (format_date_short post.created_at) slug post.title arrow_icon markdown_preview (render_tags post.labels)

let render_post_full post =
  let content = match post.body with
    | Some body -> Cmarkit.Doc.of_string body |> Cmarkit_html.of_doc ~safe:false
    | None -> "<p>No content available.</p>"
  in
  Printf.sprintf {|
    <article class="article">
      <header class="article-head">
        <p class="kicker"><span class="diamond" aria-hidden="true"></span>%s</p>
        <h1 class="article-title">%s</h1>
        <p class="article-byline">By <strong>%s</strong> on %s</p>
        <p class="article-source-row"><a class="article-source" href="%s" target="_blank" rel="noopener">View on GitHub%s</a></p>
      </header>
      <div class="post-content markdown-content">%s</div>
      <p class="post-tags">%s</p>
    </article>

    <div class="comments-section">
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
  |}
    (format_date_short post.created_at) post.title post.author (format_date post.created_at)
    post.html_url arrow_icon content (render_tags post.labels)

let render_pagination current_page total_posts per_page =
  let total_pages = (total_posts + per_page - 1) / per_page in
  if total_pages <= 1 then ""
  else
    let arrow_left = {|
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 12H5M11 18l-6-6 6-6"/></svg>|}
    in
    let arrow_right = {|
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 12h15M13 6l6 6-6 6"/></svg>|}
    in
    let prev_link =
      if current_page > 1 then
        Printf.sprintf {|<a href="/?page=%d" class="pagination-btn">%sPrevious</a>|} (current_page - 1) arrow_left
      else
        Printf.sprintf {|<span class="pagination-btn disabled">%sPrevious</span>|} arrow_left
    in
    let next_link =
      if current_page < total_pages then
        Printf.sprintf {|<a href="/?page=%d" class="pagination-btn">Next%s</a>|} (current_page + 1) arrow_right
      else
        Printf.sprintf {|<span class="pagination-btn disabled">Next%s</span>|} arrow_right
    in
    let page_info = Printf.sprintf "Page %d of %d" current_page total_pages in
    Printf.sprintf {|
      <nav class="pagination" aria-label="Pagination">
        %s
        <span class="page-info">%s</span>
        %s
      </nav>|} prev_link page_info next_link

let home_page posts current_page total_posts per_page theme =
  let posts_html = String.concat "\n" (List.map render_post_preview posts) in
  let pagination_html = render_pagination current_page total_posts per_page in
  let meta_tags = generate_blog_meta_tags () in
  let content = Printf.sprintf {|
    <div class="section-head">
      <p class="kicker">~/writing</p>
      <h1 class="section-title">Writing</h1>
    </div>
    <div class="post-list">%s</div>
%s|} posts_html pagination_html in
  layout ~title:"rastrian blog" ~content ~meta_tags ~theme ()

let post_page post theme =
  let content = render_post_full post in
  let meta_tags = generate_post_meta_tags post in
  layout ~title:(Printf.sprintf "%s - rastrian blog" post.title) ~content ~meta_tags ~theme ()

let tags_page posts theme =
  let all_tags = List.fold_left (fun acc post ->
    List.fold_left (fun acc tag ->
      if List.mem tag acc || tag = "published" then acc else tag :: acc
    ) acc post.labels
  ) [] posts in
  let tags_html = String.concat "\n" (List.map (fun tag ->
    let count = List.fold_left (fun acc post ->
      if List.mem tag post.labels then acc + 1 else acc
    ) 0 posts in
    Printf.sprintf {|<li class="tag-row"><span class="diamond" aria-hidden="true"></span><a href="/tag/%s" class="tag-link">%s</a> <span class="tag-count">(%d)</span></li>|} (escape_xml tag) (escape_xml tag) count
  ) all_tags) in
  layout ~title:"Tags - rastrian blog" ~content:(Printf.sprintf {|
    <div class="section-head">
      <p class="kicker">~/tags</p>
      <h1 class="section-title">Tags</h1>
    </div>
    <ul class="tag-list">%s</ul>|} tags_html) ~theme ()

let not_found_page theme =
  layout ~title:"404 - Not Found" ~content:(Printf.sprintf {|
    <div class="section-head">
      <p class="kicker">~/404</p>
      <h1 class="section-title">404</h1>
    </div>
    <p class="notfound-text">The page you are looking for does not exist or has moved.</p>
    <a href="/" class="back-link">Back to posts%s</a>|} arrow_icon) ~theme ()

let tag_page tag posts theme =
  if tag = "published" then
    not_found_page theme
  else
    let filtered_posts = List.filter (fun post -> List.mem tag post.labels) posts in
    let posts_html = String.concat "\n" (List.map render_post_preview filtered_posts) in
    layout ~title:(Printf.sprintf "Posts tagged '%s' - rastrian blog" (escape_xml tag))
           ~content:(Printf.sprintf {|
      <div class="section-head">
        <p class="kicker">~/tags</p>
        <h1 class="section-title">%s</h1>
      </div>
      <div class="post-list">%s</div>|} (escape_xml tag) posts_html) ~theme ()

let rss_page theme =
  layout ~title:"RSS Feed - rastrian blog" ~content:{|
    <div class="section-head">
      <p class="kicker">~/feed</p>
      <h1 class="section-title">RSS Feed</h1>
    </div>

    <div class="feed-card">
      <h2 class="feed-card-title">What is RSS?</h2>
      <p><strong>This is a web feed, also known as an RSS feed.</strong> Subscribe by copying the URL from the address bar into your newsreader.</p>
      <p>Visit <a href="https://aboutfeeds.com" class="feed-link">About Feeds</a> to get started with newsreaders and subscribing. It's free.</p>
    </div>

    <div class="feed-card">
      <h2 class="feed-card-title">Feed URL</h2>
      <div class="feed-url-row">
        <code id="rss-url" class="feed-url">https://blog.rastrian.dev/rss.xml</code>
        <button id="copy-rss-btn" type="button" class="feed-copy-btn" onclick="copyRssUrl()">
          <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg>
          <span class="copy-label">Copy</span>
        </button>
      </div>
      <p id="copy-feedback" class="copy-feedback">Copied to clipboard.</p>
    </div>

    <div class="feed-card">
      <h2 class="feed-card-title">How to Subscribe</h2>
      <ol class="feed-list">
        <li><strong>Get a newsreader app:</strong> choose from Feedly, Inoreader, NetNewsWire, or The Old Reader</li>
        <li><strong>Copy the feed URL</strong> shown above</li>
        <li><strong>Add it to your newsreader:</strong> look for "Subscribe", "Add Feed", or a "+" button</li>
        <li><strong>Paste the URL</strong> and you are done</li>
      </ol>
    </div>

    <div class="feed-card">
      <h2 class="feed-card-title">Why Use RSS?</h2>
      <ul class="feed-list">
        <li><strong>No algorithm:</strong> get every post, with no content filtering</li>
        <li><strong>Privacy-friendly:</strong> no tracking, no email required</li>
        <li><strong>All in one place:</strong> read multiple blogs from a single app</li>
        <li><strong>No spam:</strong> clean, organized content delivery</li>
        <li><strong>You are in control:</strong> easy to subscribe and unsubscribe</li>
      </ul>
    </div>

    <div class="feed-card">
      <p>New to RSS? Check out <a href="https://aboutfeeds.com" class="feed-link">About Feeds</a> for a beginner-friendly guide to newsreaders and web feeds.</p>
    </div>|} ~theme ()
