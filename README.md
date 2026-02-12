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
