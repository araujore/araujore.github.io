# Development Notes

Personal website for Renan Araujo — AI governance researcher. Site lives at araujore.github.io.

## Stack

- Jekyll on GitHub Pages
- All CSS is inline in `_includes/head.html` (no external stylesheet)
- Font: Lusitana (Google Fonts)
- No JS frameworks — vanilla JS only
- `zoom: 1.1` on `body` (user preference)

## File Structure

```
├── _config.yml                 # Site config and metadata
├── _includes/
│   ├── head.html              # <head> with ALL CSS (this is the main styling file)
│   ├── header.html            # Sticky nav with active states
│   └── footer.html            # Social icons (LinkedIn, Twitter) + footer text
├── _layouts/
│   ├── default.html           # Base layout
│   ├── page.html              # Static pages (wraps in .container)
│   └── post.html              # Blog posts (three-column: TOC | content | references)
├── _posts/
│   ├── 2024-12-20-building-in-public.md
│   ├── 2024-12-10-notes-on-reading.md
│   └── 2024-11-28-why-write.md
├── _data/
│   └── publications.yml       # All 7 publications with title, url, year, description, citation
├── images/
│   ├── compressed_headshot_2025.jpg
│   ├── soren                  # No file extension
│   ├── endeavour              # No file extension
│   └── monet                  # No file extension
├── index.md                   # Home/About page
├── blog.md                    # Blog listing
├── publications.md            # Publications with slide-out panel
├── contact.md                 # Contact page
└── Gemfile
```

## Design System

### Colors (CSS variables in `:root`)
- `--bg: #F5F5F5` — background
- `--text: #21232C` — main text
- `--text-light: #666` — secondary text, citations
- `--caption: #B2B7CC` — image captions
- `--border: #e0e0e0` — dividers
- `--accent: #A47663` — links, hover states

### Typography
- Font: `'Lusitana', Georgia, serif`
- Body: 11pt, line-height 1.6
- Nav headings: 22pt, weight 400
- Page headers: 22pt, weight 700
- Blog post titles: 18pt on listing, 22pt on detail
- Citations inline: 9pt
- Captions: 8–9pt italic

## Key Features

### Publications Page (`publications.md`)
- Clean list: title (clickable) + year on right
- Chicago-style citation shown below each title (`.pub-cite-inline`, 9pt gray)
- Clicking a title opens a **slide-out panel** from the right (440px, or full-width on mobile)
- Panel shows: title, ~50-word description, citation block, "Read publication →" link
- Panel closes via: × button, clicking overlay, or pressing Escape
- Data lives in `_data/publications.yml`
- JS uses Liquid `jsonify` filter to pass data to vanilla JS

### Blog Posts (`_layouts/post.html`)
- Three-column grid: TOC sidebar (200px) | main content (1fr) | references sidebar (250px)
- Collapses to single column below 1200px
- TOC and references are sticky (top: 140px)
- Inline citations link to right sidebar references
- Front matter supports: `toc` array (id, title) and `references` array (number, text, url)

### Navigation (`_includes/header.html`)
- Sticky top, z-index 100
- Active page gets `border-bottom: 1px solid`
- Links: About, Publications, Blog, Contact

## How to Add a Publication

Add entry to `_data/publications.yml`:
```yaml
- title: "Publication Title"
  url: "https://link.com"
  year: 2025
  description: "~50-word summary for the slide-out panel."
  citation: "Author, Name, et al. 2025. <em>Title.</em> Publisher."
```
Citations use `<em>` for italicized titles (standardized format).

## How to Add a Blog Post

Create `_posts/YYYY-MM-DD-slug.md`:
```yaml
---
layout: post
title: Post Title
date: YYYY-MM-DD
excerpt: Brief excerpt for blog listing.
toc:
  - id: section-id
    title: Section Title
references:
  - number: 1
    text: "Author (Year). Title"
    url: "https://example.com"
---
```
Use `{#section-id}` anchors on headings. Inline citations: `<a href="#ref1" class="citation">1</a>`.

## Deployment

Push to `main` branch → GitHub Pages auto-builds. Site is at `araujore.github.io`.

For pushing from a local machine:
```bash
git add . && git commit -m "message" && git push origin main
```

If auth is needed: create a classic PAT with `repo` scope at github.com/settings/tokens, embed in URL:
```bash
git push https://TOKEN@github.com/araujore/araujore.github.io.git main
```
**Always delete the token after use.**

## Responsive Breakpoints

- **> 1200px**: Three-column blog layout, full nav
- **768–1200px**: Single column, static sidebars
- **< 768px**: Compact nav (20px gaps), smaller headings, full-width slide-out panel
