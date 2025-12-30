# Personal Website User Manual

## Design Specifications

- Background: #F5F5F5 (light gray)
- Font: Lusitana from Google Fonts
- Body text: 11pt, #21232C
- H1: 22pt, bold, #21232C
- H2: 18pt, bold, #21232C
- H3: 14pt, italic, #21232C
- Links: #A47663, underlined (except in navigation)

## File Structure

```
your-site/
├── index.html              # About/Home page
├── blog.html               # Blog listing page
├── publications.html       # Publications list
├── contact.html            # Contact page
├── building-in-public.html # Sample blog post
├── notes-on-reading.html   # Sample blog post
├── why-write.html          # Sample blog post
└── images/
    ├── headshot.jpg
    ├── soren.jpg
    ├── endeavour.jpg
    └── monet.jpg
```

## Adding a New Blog Post

### Create the HTML File

Duplicate one of the blog post files (e.g., building-in-public.html) and rename it (e.g., my-new-post.html).

### Update the Content

Update title:
```html
<title>Your Post Title - Renan Araujo</title>
```

Update h1:
```html
<h1>Your Post Title</h1>
```

Update date:
```html
<p class="meta">January 15, 2025</p>
```

Update table of contents:
```html
<aside class="toc-sidebar">
    <h4>Contents</h4>
    <ul>
        <li><a href="#section1">Your First Section</a></li>
        <li><a href="#section2">Your Second Section</a></li>
    </ul>
</aside>
```

Update h2 headings with matching IDs:
```html
<h2 id="section1">Your First Section</h2>
```

### Add Inline Citations

```html
<p>
    Your text here with a citation.<a href="#ref1" class="citation">1</a>
</p>
```

### Add References

```html
<aside class="references-sidebar">
    <h4>References</h4>
    <div class="reference-item" id="ref1">
        <span class="reference-number">1</span>
        Author. (Year). <a href="URL" target="_blank">Title</a>
    </div>
</aside>
```

### Add to Blog Listing

Update blog.html:
```html
<article>
    <h3><a href="/your-new-post.html">Your Post Title</a></h3>
    <p class="meta">January 15, 2025</p>
    <p class="excerpt">
        Your post excerpt here...
    </p>
</article>
```

### Upload Files

Upload both the new post file and the updated blog.html.

## Setting Up Comments

The blog posts use Giscus (GitHub-based comments).

1. Go to https://giscus.app/
2. Enter your GitHub repository name
3. Enable Discussions in your repo settings
4. Configure your preferences on giscus.app
5. Copy the generated script tag
6. Replace the placeholder script in each blog post

Current placeholder in blog posts:
```html
<script src="https://giscus.app/client.js"
        data-repo="YOUR-GITHUB-USERNAME/YOUR-REPO-NAME"
        data-repo-id="YOUR-REPO-ID"
        ...
</script>
```

## Adding Images

All images should be in the /images/ directory.

1. Upload image to /images/ folder in your GitHub repository
2. Reference in HTML:
```html
<div class="hero-image">
    <img src="images/your-image.jpg" alt="Description">
</div>
<p class="image-caption">
    <a href="https://source-url.com">Image Title</a>, Artist (Year)
</p>
```

Note: Use relative paths (images/file.jpg) not absolute paths (/images/file.jpg).

## Adding Publications

Update publications.html:

```html
<article>
    <h3><a href="URL_TO_PUBLICATION" target="_blank">Your Publication Title</a></h3>
    <p class="meta">Journal/Venue • Year</p>
    <p class="description">
        Brief description of the publication
    </p>
</article>
```

## Customizing Colors

Edit CSS variables in any HTML file:
```css
:root {
    --bg: #F5F5F5;           /* Background */
    --text: #21232C;         /* Body text */
    --text-light: #666;      /* Metadata */
    --caption: #B2B7CC;      /* Image captions */
    --accent: #A47663;       /* Links */
}
```

## Hosting on GitHub Pages

1. Create repository named: yourusername.github.io
2. Upload all files maintaining the folder structure
3. Make sure images are in /images/ folder
4. Site will be live at https://yourusername.github.io

## Using Your Own Domain

### With GitHub Pages

1. In your GitHub repo, go to Settings, then Pages
2. Under "Custom domain", enter: araujorenan.com
3. Save the settings
4. In your domain registrar (where you bought araujorenan.com):
   - Add a CNAME record pointing to: yourusername.github.io
   - Or add A records pointing to: 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
5. Wait for DNS to propagate (can take up to 24 hours)
6. Enable "Enforce HTTPS" in GitHub Pages settings

### With Netlify (Alternative)

1. Go to netlify.com
2. Drag and drop your site folder
3. Click "Add custom domain"
4. Follow their instructions for DNS settings
5. Done

## Alternative Hosting Options

### Netlify
- Easier interface than GitHub
- Drag-and-drop deployment
- Free tier available
- Simple custom domain setup

### Vercel
- Similar to Netlify
- Also very easy to use

### Recommendation
Start with GitHub Pages since you're already using GitHub. If you find it clunky, try Netlify (it's simpler).

## Common Tasks

### Changing the Site Title
The site title "Renan Araujo" appears at the top of every page and links to the homepage. To change it, update this in each HTML file:
```html
<h1><a href="/">Renan Araujo</a></h1>
```

### Changing the Navigation Menu
Edit the nav section in each HTML file's .site-nav div.

### Adding More Pages
Duplicate any existing page, modify the content, and add a link in the navigation.

### Changing Fonts
Update the Google Fonts link in head and the --font-main variable in CSS.

### Troubleshooting References
The references sidebar is sticky and scrolls with the page. Make sure citations use `<a href="#ref1" class="citation">1</a>` and references have matching `id="ref1"`.

## Quick Setup Checklist

1. Replace placeholder email in contact.html
2. Set up Giscus comments for blog posts
3. Upload images to /images/ folder in GitHub
4. Add your actual publications
5. Replace sample blog posts with your content
6. Test all links work
7. Set up custom domain if desired
