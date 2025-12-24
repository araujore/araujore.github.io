# Renan Araujo - Writing Portfolio Website

## Files Included

- `index.html` - Homepage with introduction and recent posts
- `article-template.html` - Article template with TOC, references sidebar, and social footer
- `publications.html` - Portfolio-style grid for publications with covers
- `articles.html` - Blog listing page
- `about.html` - About page
- `contact.html` - Contact page
- `feed.xml` - RSS feed for blog subscribers

## Design Features

### Typography & Headings
- **Font**: Lusitana from Google Fonts
- **Body text**: 11pt, #21232C
- **H1**: 20pt, bold, #A47663 (accent color)
- **H2**: 16pt, bold, #21232C
- **H3**: 14pt, italic, #21232C
- **Links**: #A47663, underlined (except in navigation)
- **Background**: Pure white (#FFFFFF)

### Article Layout
- Three-column layout: Table of Contents (left) | Article (center, ~650px wide) | References (right)
- Sticky TOC and references sidebars
- Social footer with LinkedIn and Twitter icons
- Responsive design collapses to single column on mobile

## How to Post New Articles

### Step 1: Create the Article File
1. Duplicate `article-template.html`
2. Rename it (e.g., `my-new-article.html`)
3. Update the content:
   - Change `<title>` tag
   - Update `<h1>` heading
   - Update the date in meta section
   - Replace article content
   - Update Table of Contents links to match your H2 headings
   - Add your references in the right sidebar

### Step 2: Update the Table of Contents
In your new article, update the TOC to match your H2 headings:

```html
<aside class="toc-sidebar">
    <h4>Contents</h4>
    <ul>
        <li><a href="#section1">Your First H2 Heading</a></li>
        <li><a href="#section2">Your Second H2 Heading</a></li>
    </ul>
</aside>
```

Make sure to add matching `id` attributes to your H2 tags:
```html
<h2 id="section1">Your First H2 Heading</h2>
```

### Step 3: Add to Article Listing
Update `articles.html` and `index.html` to include your new post:

```html
<article>
    <h3><a href="/your-new-article.html">Your Article Title</a></h3>
    <div class="meta">
        <span>2025-01-15</span>
        <span>•</span>
        <span>7 min read</span>
    </div>
    <p class="excerpt">
        Your article excerpt here...
    </p>
    <a href="/your-new-article.html" class="read-more">Read more</a>
</article>
```

### Step 4: Update RSS Feed
Edit `feed.xml` and add a new item at the top:

```xml
<item>
    <title>Your Article Title</title>
    <link>https://yourdomain.com/your-new-article.html</link>
    <description>Your article excerpt...</description>
    <pubDate>Wed, 15 Jan 2025 00:00:00 GMT</pubDate>
    <guid>https://yourdomain.com/your-new-article.html</guid>
</item>
```

### Step 5: Upload
Upload the new/updated files to your hosting:
- New article HTML file
- Updated `articles.html`
- Updated `index.html` (if showing on homepage)
- Updated `feed.xml`

## RSS Feed & Subscriptions

### What is RSS?
RSS is a web feed that allows readers to access updates to your blog in a standardized format. Readers use RSS reader apps (like Feedly, Inoreader, NetNewsWire) to subscribe to your feed.

### How to Enable RSS on Your Site

**Your RSS feed is already created** (`feed.xml`). Here's how to make it discoverable:

1. **Link to it in your navigation**
   - Add "Subscribe" or "RSS" link to your site nav
   - Link to: `https://yourdomain.com/feed.xml`

2. **Add auto-discovery tag** (optional but recommended)
   Add this to the `<head>` of each page:
   ```html
   <link rel="alternate" type="application/rss+xml" title="Renan Araujo" href="/feed.xml">
   ```

### Email Subscriptions (Alternative to RSS)

RSS works well for technical audiences, but for broader reach, consider email subscriptions:

**Free Options:**
1. **Buttondown** (buttondown.email) - Free for up to 100 subscribers, then $9/month
2. **Substack** (substack.com) - Free, takes 10% of paid subscriptions
3. **Mailchimp** - Free up to 500 subscribers

**How it works:**
- Add a signup form to your site
- When you publish a new article, send it via email
- More reader-friendly than RSS for non-technical audiences

**Recommended:** Start with RSS (already built!), add email later if you want broader reach.

## Customizing the Design

### Change Colors
Edit CSS variables in any HTML file:
```css
:root {
    --bg: #FFFFFF;
    --text: #21232C;
    --text-light: #666;
    --accent: #A47663;
}
```

### Adjust Article Width
In `article-template.html`, find:
```css
.main-content {
    max-width: 650px;
}
```
Change `650px` to your preferred width.

### Modify Heading Styles
Find and edit these sections in the CSS:
```css
h1 { font-size: 20pt; font-weight: 700; color: var(--accent); }
h2 { font-size: 16pt; font-weight: 700; color: var(--text); }
h3 { font-size: 14pt; font-weight: 400; font-style: italic; }
```

## File Structure

```
your-site/
├── index.html                 # Homepage
├── about.html                 # About page
├── publications.html          # Publications grid
├── articles.html             # Articles listing
├── contact.html              # Contact page
├── article-template.html     # Use this as template for new articles
├── feed.xml                  # RSS feed
└── [your-article-files].html # Your published articles
```

## Hosting Options

### GitHub Pages (Recommended for simplicity)
1. Create repository: `yourusername.github.io`
2. Upload all HTML/XML files
3. Site will be live at `https://yourusername.github.io`
4. Free, easy updates via git

### Netlify (Recommended for custom domains)
1. Drag and drop your folder to netlify.com
2. Get instant URL or connect custom domain
3. Free tier includes HTTPS and custom domains

### Custom Domain
If you have a domain (like `araujorenan.com`):
- Point it to your GitHub Pages or Netlify site
- Both services have guides for custom domains

## Quick Start Checklist

- [ ] Replace all "Your Name" with your actual info
- [ ] Update social links (LinkedIn, Twitter) in all files
- [ ] Update `feed.xml` with your domain
- [ ] Write your first real article using the template
- [ ] Add your publications with cover images
- [ ] Test all links work
- [ ] Upload to hosting
- [ ] Share the URL!

## Questions?

**Q: How do I add images to articles?**
A: Upload images to your hosting, then use: `<img src="/images/photo.jpg" alt="Description">`

**Q: Can I add more sections to the navigation?**
A: Yes! Just add another link in the `<nav>` section of each page.

**Q: How do I change the social icons in the footer?**
A: Edit the `<svg>` elements or find new icons at sites like heroicons.com

## License

Free to use however you like. No attribution required.
