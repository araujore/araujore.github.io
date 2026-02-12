#!/bin/bash

# Jekyll Site Setup Script
# This script creates the entire Jekyll site structure when run from a git repo directory

echo "Creating Jekyll site directories..."

# Create directories
mkdir -p _includes
mkdir -p _layouts
mkdir -p _posts
mkdir -p _data

echo "Creating _config.yml..."
cat << 'ENDOFFILE' > _config.yml
title: Renan Araujo
description: Personal website and blog
url: "https://araujore.github.io"
baseurl: ""
markdown: kramdown
kramdown:
  input: GFM
  auto_ids: true
  toc_levels: "2..3"
permalink: /blog/:title/
navigation:
  - title: About
    url: /
  - title: Publications
    url: /publications
  - title: Blog
    url: /blog
  - title: Contact
    url: /contact
social:
  linkedin: https://www.linkedin.com/in/araujonrenan/
  twitter: https://twitter.com/araujonrenan
ENDOFFILE

echo "Creating Gemfile..."
cat << 'ENDOFFILE' > Gemfile
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins
ENDOFFILE

echo "Creating README.md..."
cat << 'ENDOFFILE' > README.md
# Renan Araujo Jekyll Site

A clean, minimalist Jekyll site for personal branding, writing, and research publication.

## File Structure Overview

```
jekyll-site/
├── _config.yml                 # Site configuration and metadata
├── _includes/                  # Reusable template components
│   ├── head.html              # Head section with all CSS
│   ├── header.html            # Navigation header
│   └── footer.html            # Social links and footer
├── _layouts/                  # Page layout templates
│   ├── default.html           # Base layout for pages
│   ├── page.html              # Layout for static pages
│   └── post.html              # Layout for blog posts (three-column)
├── _posts/                    # Blog posts in Markdown
│   ├── 2024-12-20-building-in-public.md
│   ├── 2024-12-10-notes-on-reading.md
│   └── 2024-11-28-why-write.md
├── _data/                     # Data files
│   └── publications.yml       # Publications listing
├── assets/                    # Static assets
│   └── images/               # Image files
├── index.md                   # Home/About page
├── blog.md                    # Blog listing page
├── publications.md            # Publications page
├── contact.md                 # Contact page
└── README.md                  # This file
```

## Getting Started

### Prerequisites

- Ruby 2.7 or higher
- Bundler
- Jekyll

### Installation

1. Navigate to the site directory:
   ```
   cd jekyll-site
   ```

2. Create a Gemfile if one doesn't exist:
   ```
   bundle init
   ```

3. Add Jekyll to your Gemfile:
   ```
   bundle add jekyll
   ```

4. Install dependencies:
   ```
   bundle install
   ```

5. Serve the site locally:
   ```
   bundle exec jekyll serve
   ```

6. Open your browser to http://localhost:4000

## Site Configuration

Edit `_config.yml` to customize:
- Site title and description
- Base URL (important for GitHub Pages subdirectories)
- Navigation menu items
- Social media links (LinkedIn, Twitter)

Example:
```yaml
title: Renan Araujo
description: Personal website and blog
url: "https://araujore.github.io"
baseurl: ""
```

## How to Add a New Blog Post

1. Create a new file in the `_posts/` directory with the naming convention: `YYYY-MM-DD-post-title.md`

2. Add front matter at the top of the file:
```markdown
---
layout: post
title: Your Post Title
date: 2024-02-11
excerpt: A brief excerpt that shows on the blog listing page.
toc:
  - id: section-id
    title: Section Title
  - id: another-section
    title: Another Section
references:
  - number: 1
    text: "Author Name (Year). Reference Title"
    url: "https://example.com"
  - number: 2
    text: "Another Reference"
---
```

3. Write your content in Markdown after the front matter.

4. Use heading anchors in your content: `## Section Title {#section-id}`

5. Add inline citations with: `<a href="#ref1" class="citation">1</a>`

The blog post will automatically appear on the /blog/ page and can be linked as `/blog/your-post-title/`.

### Front Matter Fields

- `layout: post` - Required for blog posts
- `title` - Post title (shows in page and listings)
- `date` - Publication date (YYYY-MM-DD format)
- `excerpt` - Short summary for blog listing (max 1-2 sentences)
- `toc` - Table of contents array with `id` and `title` for each section
- `references` - References array with `number`, `text`, and optional `url`

## How to Add a New Publication

1. Edit `_data/publications.yml`

2. Add a new publication entry:
```yaml
- title: "Publication Title"
  url: "https://link-to-publication.com"
  venue: "Journal Name, Conference, or Publisher"
  year: 2024
  description: "Brief description of the publication and its key contributions."
```

The Publications page will automatically include the new entry, sorted by year.

## How to Edit Page Content

Static pages (About, Contact, Publications) are simple Markdown files:

- **index.md** - About/Home page. Edit the hero section and content blocks.
- **contact.md** - Contact page. Modify the contact information and links.
- **publications.md** - Auto-generates from `_data/publications.yml`
- **blog.md** - Auto-generates the blog listing

To edit a page, open the corresponding `.md` file and modify the content after the front matter.

## How to Change Site Settings

Edit `_config.yml` at the root of the site:

```yaml
title: Your Site Title                    # Main site name
description: Your description             # Meta description
url: "https://yourdomain.com"            # Full site URL
baseurl: ""                              # Leave empty unless using subdirectory
permalink: /blog/:title/                 # URL pattern for blog posts
navigation:                              # Main navigation links
  - title: About
    url: /
  - title: Publications
    url: /publications
social:
  linkedin: https://www.linkedin.com/in/yourprofile/
  twitter: https://twitter.com/yourhandle
```

### Color Customization

Colors are defined as CSS variables in `_includes/head.html`. To change them:

1. Open `_includes/head.html`
2. Find the `:root` section near the top of the `<style>` tag
3. Modify the color values:
   ```css
   :root {
       --bg: #F5F5F5;           /* Background color */
       --text: #21232C;         /* Main text color */
       --text-light: #666;      /* Secondary text */
       --accent: #A47663;       /* Links and accents */
       --border: #e0e0e0;       /* Border color */
       --caption: #B2B7CC;      /* Caption text */
   }
   ```

### Font Customization

The site uses "Lusitana" from Google Fonts. To change:

1. Open `_includes/head.html`
2. Replace the Google Fonts link with your preferred font
3. Update the `--font-main` variable in the `:root` section

## How to Set Up Custom Domain

If you're using GitHub Pages:

1. Create a `CNAME` file at the root of your repository with your domain name:
   ```
   yourdomain.com
   ```

2. Configure your domain registrar to point to GitHub Pages (see GitHub Pages documentation)

3. In your repository settings, enable HTTPS

## Image Usage

Images are stored in `assets/images/`. To include an image:

```markdown
![Alt text]({{ site.baseurl }}/images/filename)
```

For example:
```markdown
![Headshot]({{ site.baseurl }}/images/compressed_headshot_2025.jpg)
```

Note: Some images in the source don't have extensions (like `soren`, `endeavour`, `monet`). Reference them without extensions.

## Blog Post Structure

Blog posts use a three-column layout:

- **Left sidebar**: Auto-generated table of contents from headings
- **Center**: Article content with title, date, and body
- **Right sidebar**: References section

This layout is responsive and stacks vertically on screens smaller than 1200px.

## Comments

Blog posts can include a Giscus comments section. To enable:

1. Go to https://giscus.app/
2. Enter your GitHub repository details
3. Copy the generated script configuration
4. Edit `_layouts/post.html` and replace the script attributes in the Comments section

## Building for Deployment

To build the site for production:

```bash
bundle exec jekyll build
```

This generates a `_site/` folder with the static site. For GitHub Pages, this happens automatically when you push to your repository.

## Deployment to GitHub Pages

1. Create a GitHub repository named `yourusername.github.io`

2. Push your Jekyll site to the repository:
   ```bash
   git add .
   git commit -m "Initial Jekyll site"
   git push origin main
   ```

3. GitHub will automatically build and deploy your site at `https://yourusername.github.io`

4. To use a custom domain, add a `CNAME` file (see "Custom Domain" section above)

## Styling and Layout

The site uses a single CSS file in `_includes/head.html`. Key design features:

- Responsive design (desktop, tablet, mobile)
- Sticky navigation header
- Fade-in animations on page load
- Three-column post layout (desktop) that stacks on mobile
- Max-width containers for readability

To modify layouts or styling, edit the appropriate section in `_includes/head.html` or the relevant layout file.

## Troubleshooting

### Posts not showing up

- Ensure the filename follows the format: `YYYY-MM-DD-title.md`
- Check that the front matter is valid YAML
- Run `bundle exec jekyll build` to see error messages

### Images not loading

- Verify the image file exists in `assets/images/`
- Use relative paths: `{{ site.baseurl }}/images/filename`
- Check that filenames match exactly (case-sensitive)

### Navigation not highlighting active page

- Navigation active states are handled by `_includes/header.html`
- The active class is set based on the current page URL

### Styles not loading

- Ensure you're viewing the live site, not a cached version
- Clear browser cache (Ctrl+Shift+Delete or Cmd+Shift+Delete)
- Check that `_includes/head.html` is in the correct location
ENDOFFILE

echo "Creating _includes/head.html..."
cat << 'ENDOFFILE' > _includes/head.html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lusitana:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #F5F5F5;
            --text: #21232C;
            --text-light: #666;
            --caption: #B2B7CC;
            --border: #e0e0e0;
            --accent: #A47663;
            --font-main: 'Lusitana', Georgia, serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-main);
            font-size: 11pt;
            line-height: 1.6;
            color: var(--text);
            background: var(--bg);
            -webkit-font-smoothing: antialiased;
        }

        .site-nav {
            text-align: center;
            padding: 40px 24px 20px;
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            background: var(--bg);
            z-index: 100;
        }

        .site-nav h1 {
            font-size: 22pt;
            font-weight: 400;
            margin-bottom: 20px;
            letter-spacing: -0.02em;
            color: var(--text);
        }

        .site-nav h1 a {
            color: var(--text);
            text-decoration: none;
        }

        .site-nav nav {
            display: flex;
            justify-content: center;
            gap: 32px;
            flex-wrap: wrap;
        }

        .site-nav nav a {
            color: var(--text);
            text-decoration: none;
            font-size: 11pt;
            transition: color 0.2s ease;
        }

        .site-nav nav a:hover {
            color: var(--accent);
        }

        .site-nav nav a.active {
            border-bottom: 1px solid var(--text);
        }

        .container {
            max-width: 680px;
            margin: 0 auto;
            padding: 60px 24px;
        }

        /* Hero section */
        .hero {
            text-align: center;
            margin-bottom: 60px;
            opacity: 0;
            animation: fadeIn 0.8s ease forwards;
        }

        .hero-title {
            font-size: 24pt;
            font-weight: 400;
            color: var(--text);
            margin-bottom: 24px;
            letter-spacing: -0.02em;
            line-height: 1.3;
        }

        .hero-text {
            font-size: 11pt;
            line-height: 1.7;
            margin-bottom: 40px;
        }

        .hero-image {
            width: 100%;
            margin-bottom: 8px;
        }

        .hero-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .image-caption {
            font-size: 8pt;
            font-style: italic;
            color: var(--caption);
            text-align: center;
            margin-bottom: 60px;
        }

        .image-caption a {
            color: var(--caption);
            text-decoration: underline;
        }

        /* Content sections */
        section {
            margin-bottom: 60px;
            opacity: 0;
            animation: fadeIn 0.8s ease 0.2s forwards;
        }

        p {
            margin-bottom: 20px;
            line-height: 1.7;
        }

        a {
            color: var(--accent);
            text-decoration: underline;
            transition: opacity 0.2s ease;
        }

        a:hover {
            opacity: 0.7;
        }

        .headshot-container {
            text-align: center;
            margin: 40px 0;
        }

        .headshot-container img {
            max-width: 400px;
            width: 100%;
            height: auto;
            margin-bottom: 12px;
        }

        .headshot-caption {
            font-size: 9pt;
            font-style: italic;
            color: var(--caption);
        }

        .headshot-caption a {
            color: var(--caption);
            text-decoration: underline;
        }

        header {
            margin-bottom: 60px;
            opacity: 0;
            animation: fadeIn 0.8s ease forwards;
        }

        header h2 {
            font-size: 22pt;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 16px;
            letter-spacing: -0.02em;
        }

        .posts {
            opacity: 0;
            animation: fadeIn 0.8s ease 0.2s forwards;
        }

        article {
            margin-bottom: 56px;
            padding-bottom: 56px;
            border-bottom: 1px solid var(--border);
        }

        article:last-child {
            border-bottom: none;
        }

        article h3 {
            font-size: 18pt;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 12px;
            letter-spacing: -0.02em;
            line-height: 1.2;
        }

        article h3 a {
            color: var(--text);
            text-decoration: underline;
            transition: opacity 0.2s ease;
        }

        article h3 a:hover {
            opacity: 0.7;
        }

        .meta {
            font-size: 10pt;
            color: var(--text-light);
            margin-bottom: 16px;
        }

        .excerpt {
            font-size: 11pt;
            line-height: 1.7;
        }

        .description {
            font-size: 11pt;
            line-height: 1.7;
        }

        /* Three column layout for posts */
        .page-wrapper {
            display: grid;
            grid-template-columns: 200px 1fr 250px;
            gap: 60px;
            max-width: 1400px;
            margin: 0 auto;
            padding: 60px 24px;
        }

        /* Left sidebar - Table of Contents */
        .toc-sidebar {
            position: sticky;
            top: 140px;
            align-self: start;
            opacity: 0;
            animation: fadeIn 0.8s ease forwards;
        }

        .toc-sidebar h4 {
            font-size: 11pt;
            font-weight: 700;
            margin-bottom: 16px;
            color: var(--text);
        }

        .toc-sidebar ul {
            list-style: none;
        }

        .toc-sidebar li {
            margin-bottom: 8px;
        }

        .toc-sidebar a {
            color: var(--text-light);
            text-decoration: none;
            font-size: 10pt;
            line-height: 1.4;
            transition: color 0.2s ease;
        }

        .toc-sidebar a:hover {
            color: var(--text);
        }

        /* Main content */
        .main-content {
            max-width: 650px;
            opacity: 0;
            animation: fadeIn 0.8s ease 0.2s forwards;
        }

        .article-header {
            margin-bottom: 48px;
        }

        h1 {
            font-size: 22pt;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 16px;
            letter-spacing: -0.02em;
            line-height: 1.2;
        }

        article p {
            margin-bottom: 20px;
        }

        article h2 {
            font-size: 18pt;
            font-weight: 700;
            color: var(--text);
            margin: 40px 0 16px;
            letter-spacing: -0.02em;
        }

        article h3 {
            font-size: 14pt;
            font-weight: 400;
            font-style: italic;
            color: var(--text);
            margin: 32px 0 12px;
        }

        article a {
            color: var(--text);
            text-decoration: underline;
            transition: opacity 0.2s ease;
        }

        article a:hover {
            opacity: 0.7;
        }

        article blockquote {
            border-left: 3px solid var(--accent);
            padding-left: 20px;
            margin: 28px 0;
            font-style: italic;
            color: var(--text-light);
        }

        /* Inline citations */
        .citation {
            color: var(--text);
            font-size: 9pt;
            vertical-align: super;
            text-decoration: none;
            font-weight: 700;
        }

        .citation:hover {
            opacity: 0.7;
        }

        /* Right sidebar - References */
        .references-sidebar {
            position: sticky;
            top: 140px;
            align-self: start;
            opacity: 0;
            animation: fadeIn 0.8s ease 0.3s forwards;
        }

        .references-sidebar h4 {
            font-size: 11pt;
            font-weight: 700;
            margin-bottom: 16px;
            color: var(--text);
        }

        .reference-item {
            margin-bottom: 20px;
            font-size: 9pt;
            line-height: 1.5;
        }

        .reference-number {
            color: var(--text);
            font-weight: 700;
            margin-right: 4px;
        }

        .reference-item a {
            color: var(--text);
            text-decoration: underline;
            word-break: break-word;
        }

        /* Comments section */
        .comments-section {
            margin-top: 60px;
            padding-top: 32px;
            border-top: 1px solid var(--border);
        }

        .comments-section h2 {
            font-size: 18pt;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 24px;
        }

        /* Footer with social icons */
        .article-footer {
            margin-top: 80px;
            padding-top: 32px;
            border-top: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        footer {
            margin-top: 80px;
            padding-top: 32px;
            border-top: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            opacity: 0;
            animation: fadeIn 0.8s ease 0.4s forwards;
        }

        .social-icons {
            display: flex;
            gap: 16px;
        }

        .social-icons a {
            width: 40px;
            height: 40px;
            background: var(--text);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: opacity 0.2s ease;
            text-decoration: none;
        }

        .social-icons a:hover {
            opacity: 0.7;
        }

        .social-icons svg {
            width: 20px;
            height: 20px;
            fill: white;
        }

        .footer-text {
            font-size: 10pt;
            color: var(--text);
            text-align: center;
        }

        .footer-text a {
            color: var(--text);
            text-decoration: underline;
        }

        .contact-links {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-top: 32px;
        }

        .contact-links a {
            color: var(--text);
            text-decoration: underline;
            font-size: 11pt;
            transition: opacity 0.2s ease;
        }

        .contact-links a:hover {
            opacity: 0.7;
        }

        .publications {
            opacity: 0;
            animation: fadeIn 0.8s ease 0.2s forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 1200px) {
            .page-wrapper {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .toc-sidebar,
            .references-sidebar {
                position: static;
            }

            .main-content {
                max-width: 680px;
            }
        }

        @media (max-width: 768px) {
            .site-nav {
                padding: 30px 20px 15px;
            }

            .site-nav nav {
                gap: 20px;
            }

            .container {
                padding: 40px 20px;
            }

            .page-wrapper {
                padding: 40px 20px;
            }

            .hero-title {
                font-size: 22pt;
            }

            header h2 {
                font-size: 18pt;
            }

            article h3 {
                font-size: 18pt;
            }

            h1 {
                font-size: 18pt;
            }

            article h2 {
                font-size: 14pt;
            }

            h2 {
                font-size: 18pt;
            }

            .headshot-container img {
                max-width: 300px;
            }
        }
    </style>
</head>
ENDOFFILE

echo "Creating _includes/header.html..."
cat << 'ENDOFFILE' > _includes/header.html
<div class="site-nav">
    <h1><a href="/">{{ site.title }}</a></h1>
    <nav>
        {% for nav_item in site.navigation %}
            {% if page.url == nav_item.url or (nav_item.url == '/blog' and page.url contains '/blog') or (nav_item.url == '/blog' and page.layout == 'post') %}
                <a href="{{ nav_item.url }}" class="active">{{ nav_item.title }}</a>
            {% else %}
                <a href="{{ nav_item.url }}">{{ nav_item.title }}</a>
            {% endif %}
        {% endfor %}
    </nav>
</div>
ENDOFFILE

echo "Creating _includes/footer.html..."
cat << 'ENDOFFILE' > _includes/footer.html
<footer>
    <div class="social-icons">
        <a href="{{ site.social.linkedin }}" target="_blank" aria-label="LinkedIn">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
            </svg>
        </a>
        <a href="{{ site.social.twitter }}" target="_blank" aria-label="Twitter">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
            </svg>
        </a>
    </div>
    <div class="footer-text">
        2025 · {{ site.title }} · <a href="/contact">Contact</a>
    </div>
</footer>
ENDOFFILE

echo "Creating _layouts/default.html..."
cat << 'ENDOFFILE' > _layouts/default.html
<!DOCTYPE html>
<html lang="en">
{% include head.html %}
<body>
    {% include header.html %}
    <div class="container">
        {{ content }}
    </div>
    {% include footer.html %}
</body>
</html>
ENDOFFILE

echo "Creating _layouts/page.html..."
cat << 'ENDOFFILE' > _layouts/page.html
---
layout: default
---

{{ content }}
ENDOFFILE

echo "Creating _layouts/post.html..."
cat << 'ENDOFFILE' > _layouts/post.html
<!DOCTYPE html>
<html lang="en">
{% include head.html %}
<body>
    {% include header.html %}

    <div class="page-wrapper">
        <!-- Left Sidebar: Table of Contents -->
        <aside class="toc-sidebar">
            <h4>Contents</h4>
            <ul>
                {% for toc_item in page.toc %}
                    <li><a href="#{{ toc_item.id }}">{{ toc_item.title }}</a></li>
                {% endfor %}
            </ul>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <header class="article-header">
                <h1>{{ page.title }}</h1>
                <p class="meta">{{ page.date | date: "%B %d, %Y" }}</p>
            </header>

            <article>
                {{ content }}
            </article>

            <!-- Comments Section -->
            <div class="comments-section">
                <h2>Comments</h2>
                <script src="https://giscus.app/client.js"
                        data-repo="YOUR-GITHUB-USERNAME/YOUR-REPO-NAME"
                        data-repo-id="YOUR-REPO-ID"
                        data-category="General"
                        data-category-id="YOUR-CATEGORY-ID"
                        data-mapping="pathname"
                        data-strict="0"
                        data-reactions-enabled="1"
                        data-emit-metadata="0"
                        data-input-position="top"
                        data-theme="light"
                        data-lang="en"
                        crossorigin="anonymous"
                        async>
                </script>
            </div>

            <footer class="article-footer">
                <div class="social-icons">
                    <a href="{{ site.social.linkedin }}" target="_blank" aria-label="LinkedIn">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
                        </svg>
                    </a>
                    <a href="{{ site.social.twitter }}" target="_blank" aria-label="Twitter">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                        </svg>
                    </a>
                </div>
                <div class="footer-text">
                    2025 · {{ site.title }} · <a href="/contact">Contact</a>
                </div>
            </footer>
        </main>

        <!-- Right Sidebar: References -->
        <aside class="references-sidebar">
            <h4>References</h4>
            {% for ref in page.references %}
                <div class="reference-item" id="ref{{ ref.number }}">
                    <span class="reference-number">{{ ref.number }}</span>
                    {% if ref.url %}
                        <a href="{{ ref.url }}" target="_blank">{{ ref.text }}</a>
                    {% else %}
                        {{ ref.text }}
                    {% endif %}
                </div>
            {% endfor %}
        </aside>
    </div>
</body>
</html>
ENDOFFILE

echo "Creating _posts/2024-12-20-building-in-public.md..."
cat << 'ENDOFFILE' > _posts/2024-12-20-building-in-public.md
---
layout: post
title: Building in Public
date: 2024-12-20
excerpt: There's something paradoxical about sharing unfinished work. We're taught to polish, to perfect, to present only our best selves. But the most interesting people I've encountered online are those who think out loud, who show their process, who aren't afraid to be wrong in public.
toc:
  - id: perfectionism
    title: The Perfectionism Trap
  - id: learning
    title: Learning in Public
  - id: work
    title: The Work That Matters
  - id: final
    title: Final Thoughts
references:
  - number: 1
    text: "Swyx. (2021). Learn In Public"
    url: "https://www.swyx.io/learn-in-public"
  - number: 2
    text: "Brown, B. (2012). Daring Greatly: How the Courage to Be Vulnerable Transforms the Way We Live, Love, Parent, and Lead"
  - number: 3
    text: "Nielsen, M. (2016). Using spaced repetition systems to see through a piece of mathematics"
    url: "http://cognitivemedium.com/srs-mathematics"
---

There's something paradoxical about sharing unfinished work. We're taught to polish, to perfect, to present only our best selves. But the most interesting people I've encountered online are those who think out loud, who show their process, who aren't afraid to be wrong in public.<a href="#ref1" class="citation">1</a>

I've been thinking about this lately because I keep catching myself in the same pattern: I'll work on something for weeks, maybe months, refining it in private until it feels "ready." And then, more often than not, it never sees the light of day. The bar for "ready" keeps moving. There's always one more thing to fix, one more edge case to handle, one more paragraph to rewrite.

## The Perfectionism Trap {#perfectionism}

Perfectionism is a peculiar form of procrastination. It masquerades as diligence, as high standards, as caring about quality. But really it's fear dressed up in respectable clothes. Fear of judgment, fear of being misunderstood, fear of putting something into the world that isn't quite right.<a href="#ref2" class="citation">2</a>

The irony is that the things I've shared imperfectly—the rough drafts, the half-formed ideas, the "I'm not sure about this but here goes"—those are the things that have led to the most interesting conversations. They're the things that other people recognize themselves in.

> "I am understood" is a wonderful feeling.

Someone on Twitter once told me they appreciated my willingness to share unfinished thoughts because it made them feel less alone in their own confusion. That stuck with me. We sanitize our public presence so much that we lose the most human parts—the uncertainty, the struggle, the process of figuring things out.

## Learning in Public {#learning}

There's a concept in software called "learning in public"—the idea that you should share what you're learning as you learn it, not after you've mastered it.<a href="#ref3" class="citation">3</a> It feels counterintuitive. Why would anyone want to hear from someone who's still figuring things out?

### The Best Teachers Are One Step Ahead

But here's what I've realized: the person who's one step ahead of you is often the best teacher. They remember what it was like to be confused. They haven't yet internalized all the tacit knowledge. They're still close enough to the beginner's mind to explain things clearly.

When I write about something I'm learning, I'm not claiming expertise. I'm documenting the journey. And sometimes that's more valuable than the destination.

## The Work That Matters {#work}

I try to apply a rule now: if I do something and don't write about it—or otherwise generate external-facing evidence of it—it didn't happen. This sounds extreme, but it's been surprisingly liberating.

It forces me to ask: is this worth doing at all? If I'm not willing to tell anyone about it, maybe it's not worth my time. And conversely, if it is worth doing, why keep it to myself?

The work that matters—the thinking, the making, the learning—shouldn't happen in isolation. Not because we need an audience, but because sharing creates accountability. It makes the work more real. It transforms vague intentions into concrete artifacts.

## Final Thoughts {#final}

I don't think everyone needs to build in public. Some people work better in private. Some things genuinely benefit from being refined before release.

But if you're like me—if you have a tendency to hoard your half-finished projects, to wait for the perfect moment, to keep your learning private—maybe try sharing something imperfect. Write the blog post before you feel ready. Push the code that's not quite polished. Tweet the idea that's still half-formed.

You might be surprised by what happens.
ENDOFFILE

echo "Creating _posts/2024-12-10-notes-on-reading.md..."
cat << 'ENDOFFILE' > _posts/2024-12-10-notes-on-reading.md
---
layout: post
title: Notes on Reading
date: 2024-12-10
excerpt: I've been thinking about how we read differently now. Not worse, just different. We skim, we scan, we search for the good bits. Maybe this is fine. Maybe the real insight is knowing when to slow down.
toc:
  - id: changed
    title: How We Read Now
  - id: slow
    title: When to Slow Down
references:
  - number: 1
    text: "Carr, N. (2010). The Shallows: What the Internet Is Doing to Our Brains"
  - number: 2
    text: "Adler, M. & Van Doren, C. (1972). How to Read a Book"
---

I've been thinking about how we read differently now. Not worse, just different. We skim, we scan, we search for the good bits. Maybe this is fine. Maybe the real insight is knowing when to slow down.

## How We Read Now {#changed}

The internet has rewired how we consume text. We've become remarkably good at extracting signal from noise, at finding the paragraph that matters in a sea of words.<a href="#ref1" class="citation">1</a> This isn't a degradation of reading—it's an adaptation.

But there's a cost. We lose the pleasure of wandering through an argument, of letting an idea slowly reveal itself. We trade depth for breadth, patience for efficiency.

## When to Slow Down {#slow}

The skill isn't in reading fast—it's in knowing when not to. Some texts deserve to be savored. Some ideas need time to settle.<a href="#ref2" class="citation">2</a>

I try to ask myself: is this something I'm reading to extract information, or something I'm reading to think with? The first can be skimmed. The second demands attention.

Perhaps the goal isn't to read more, but to read better. To know which mode of reading each text deserves.
ENDOFFILE

echo "Creating _posts/2024-11-28-why-write.md..."
cat << 'ENDOFFILE' > _posts/2024-11-28-why-write.md
---
layout: post
title: Why Write
date: 2024-11-28
excerpt: The question comes up again and again—why bother writing if no one reads it? But that's the wrong question. Writing isn't just communication—it's thinking. The words you put on the page clarify what was murky in your head. That alone is worth it.
toc:
  - id: thinking
    title: Writing Is Thinking
  - id: audience
    title: The Audience Question
references:
  - number: 1
    text: "Graham, P. (2004). Writing and Speaking"
    url: "http://www.paulgraham.com/writing44.html"
  - number: 2
    text: "Ahrens, S. (2017). How to Take Smart Notes"
---

The question comes up again and again: why bother writing if no one reads it? But that's the wrong question. Writing isn't just communication—it's thinking. The words you put on the page clarify what was murky in your head. That alone is worth it.

## Writing Is Thinking {#thinking}

There's a particular kind of clarity that only comes from trying to explain something in writing.<a href="#ref1" class="citation">1</a> When you're just thinking, it's easy to fool yourself into believing you understand something. But when you try to write it down, the gaps become obvious.

This is why writing is thinking. The act of putting words on a page forces you to organize your thoughts, to find the throughline, to discover what you actually believe. Often I start writing with one idea and end up somewhere completely different.

## The Audience Question {#audience}

Should you write for an audience? Maybe. But the primary audience for your writing should be yourself—the version of yourself that needs to think through this problem, or the future version who will have forgotten these thoughts.

If others benefit from reading it, that's wonderful. But it's not the point. The point is the clarification that comes from the act of writing itself.<a href="#ref2" class="citation">2</a>

Write to think. Everything else is secondary.
ENDOFFILE

echo "Creating _data/publications.yml..."
cat << 'ENDOFFILE' > _data/publications.yml
- title: "Title of Your Publication"
  url: "https://example.com/publication-1"
  venue: "Journal Name"
  year: 2024
  description: "Brief description of the publication and its key contributions to the field of AI governance and policy."

- title: "Another Publication Title"
  url: "https://example.com/publication-2"
  venue: "Conference Proceedings"
  year: 2023
  description: "Another brief description highlighting the main findings or arguments related to international AI governance."

- title: "Third Publication Example"
  url: "https://example.com/publication-3"
  venue: "Policy Report"
  year: 2023
  description: "Description of this publication's contribution to AI policy discourse and governance frameworks."
ENDOFFILE

echo "Creating index.md..."
cat << 'ENDOFFILE' > index.md
---
layout: page
title: About
page_class: home
---

<section class="hero">
    <h2 class="hero-title">Shaping AI policy at the frontier</h2>
    <p class="hero-text">
        Navigating transformative AI will be incredibly challenging—we need the best people cooperating to tackle it. I lead teams, design programs, and do policy research to increase talent working on AI policy and coordination among key actors. I specialize in the international governance of advanced AI.
    </p>
    <div class="hero-image">
        <img src="images/soren" alt="Black Sun by Søren Solkær">
    </div>
    <p class="image-caption">
        <a href="https://www.sorensolkaer.com/photographs/blacksun">Black Sun</a>, Søren Solkær (2017)
    </p>
</section>

<section>
    <p style="text-align: center; font-weight: 700; font-size: 22pt; margin-bottom: 32px; letter-spacing: -0.02em;">My work</p>
    <p>
        I'm Director of Programs at the <a href="https://www.iaps.ai">Institute for AI Policy and Strategy</a> (IAPS). I also work closely with the <a href="https://www.governance.ai">Oxford Martin AI Governance Initiative</a>, as a research affiliate, and the <a href="https://www.oxfordchinapolicylab.org">Oxford China Policy Lab</a>, as a fellow. I'm a lawyer with experience in comparative policy and emergent technologies.
    </p>

    <p>
        <strong>Programs:</strong> I design programs to find and bolster talented people to work on AI policy, mainly via the <a href="https://www.iaps.ai/fellowship">IAPS Fellowship</a>. I also run coordination activities, such as one-off conferences and regular working groups, to ensure we're making the most of the talent we have.
    </p>

    <p>
        <strong>People and teams:</strong> Managing people and getting teams off the ground are a core part of my work. I manage researchers and fellows at IAPS, am an advisor and board member of <a href="https://forum.effectivealtruism.org/posts/hJKuNhr8YzPcKEFvc/ai-safety-organizations">several nonprofits</a> in the AI policy space, and mentor aspiring AI policy professionals in <a href="https://www.bluedot.org">various</a> <a href="https://www.condorinitiative.org">programs</a>.
    </p>

    <p>
        <strong>Research:</strong> My <a href="https://scholar.google.com/citations?user=EXAMPLE">research interests</a> include emerging governmental institutions handling advanced AI, the implications of stronger state involvement in developing AGI, and Sino-western relations on AI.
    </p>

    <div class="headshot-container">
        <img src="images/compressed_headshot_2025.jpg" alt="Renan Araujo headshot">
        <p class="headshot-caption">
            <a href="https://bit.ly/renanheadshot2025">You can download this photo here if you need it.</a>
        </p>
    </div>
</section>

<section>
    <p style="text-align: center; font-weight: 700; font-size: 22pt; margin-bottom: 32px; letter-spacing: -0.02em;">Other work interests</p>

    <p>
        <strong>Developing countries and AI:</strong> I co-founded and advise the <a href="https://www.condorinitiative.org">Condor Initiative</a>, an educational nonprofit that elevates talented students from LMIC to work on AI safety and governance. I'm enthusiastic about the role that developing countries can play in global AI policy, and also follow governance developments in regions such as Latin America, Africa, and South/Southeast Asia.
    </p>

    <p>
        <strong>Governing emergent technologies:</strong> Besides AI, I've worked on the governance of fields such as bio, nuclear, and space technology. At <a href="https://rethinkpriorities.org">Rethink Priorities</a>, I ran an incubator of nonprofits reducing global risks (of which the Vista Institute and Condor came out). At the <a href="https://www.law.ox.ac.uk/research-subject-groups/institute-ethics-law-and-armed-conflict">Institute for Law and AI</a>, I analyzed all <a href="https://constitutions.app">constitutions</a> ever written on their protection of future generations, and legal mechanisms to improve <a href="https://www.spacelaw.ox.ac.uk">space governance</a>.
    </p>

    <div class="hero-image" style="margin-top: 40px;">
        <img src="images/endeavour" alt="Launch of the Endeavour shuttle">
    </div>
    <p class="image-caption">
        <a href="https://www.nasa.gov/mission_pages/shuttle/shuttlemissions/sts134/index.html">Launch of the Endeavour shuttle</a>, NASA (2011)
    </p>
</section>

<section>
    <p style="text-align: center; font-weight: 700; font-size: 22pt; margin-bottom: 32px; letter-spacing: -0.02em;">About me</p>

    <p>
        <strong>My previous life as a lawyer:</strong> I'm a lawyer by training with a master's degree from the London School of Economics in criminology. I worked for five years as chief of staff of Justices of Appeal at the Pernambuco State Court – that was during and a bit after law school, and I was the youngest chief of staff at the court then. During that time, I also co-led a <a href="https://example.com">group</a> of 50 students and lawyers providing free legal counseling for inmates in Brazil.
    </p>

    <p>
        <strong>Personal:</strong> I live in east London, UK. Outside work, I love volunteering (from animal welfare to human rights, but more recently mostly advising nonprofits on AI policy), traveling (before moving to the UK, my wife and I were "digital nomads" for two years, living in places ranging from Buenos Aires and Lisbon to Bangkok and Tokyo), have been training endurance sports (currently aiming for a half Ironman), deeply enjoy visual arts and music, and love hunting for second-hand books. I hail from Recife, in <a href="https://en.wikipedia.org/wiki/Northeast_Region,_Brazil">northeastern Brazil</a> – the best region of the country, if you want the opinion of an impartial observer.
    </p>

    <div class="hero-image" style="margin-top: 40px;">
        <img src="images/monet" alt="Impression, Sunrise by Monet">
    </div>
    <p class="image-caption">
        Impression, Sunrise, Monet (1872)
    </p>
</section>
ENDOFFILE

echo "Creating blog.md..."
cat << 'ENDOFFILE' > blog.md
---
layout: page
title: Blog
permalink: /blog/
---

<header>
    <h2>Blog</h2>
</header>

<main class="posts">
    {% for post in site.posts %}
        <article>
            <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            <p class="meta">{{ post.date | date: "%B %d, %Y" }}</p>
            <p class="excerpt">
                {{ post.excerpt }}
            </p>
        </article>
    {% endfor %}
</main>
ENDOFFILE

echo "Creating publications.md..."
cat << 'ENDOFFILE' > publications.md
---
layout: page
title: Publications
permalink: /publications/
---

<header>
    <h2>Publications</h2>
</header>

<main class="publications">
    {% for pub in site.data.publications %}
        <article>
            <h3><a href="{{ pub.url }}" target="_blank">{{ pub.title }}</a></h3>
            <p class="meta">{{ pub.venue }} · {{ pub.year }}</p>
            <p class="description">
                {{ pub.description }}
            </p>
        </article>
    {% endfor %}
</main>
ENDOFFILE

echo "Creating contact.md..."
cat << 'ENDOFFILE' > contact.md
---
layout: page
title: Contact
permalink: /contact/
---

<header>
    <h2>Get in Touch</h2>
</header>

<main>
    <p>
        I'm always interested in connecting with people working on AI governance, policy research, or related topics. Feel free to reach out.
    </p>

    <div class="contact-links">
        <a href="mailto:renannascimentoaraujo@gmail.com">Email: renannascimentoaraujo@gmail.com</a>
        <a href="https://twitter.com/araujonrenan" target="_blank">Twitter / X</a>
        <a href="https://www.linkedin.com/in/araujonrenan/" target="_blank">LinkedIn</a>
    </div>
</main>
ENDOFFILE

echo "Complete! Jekyll site structure has been created successfully."
echo "Your site is ready. Run 'bundle install' and 'bundle exec jekyll serve' to start."
