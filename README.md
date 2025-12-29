# Renan Araujo - Personal Website

A clean, typography-focused personal website built with Lusitana font. Features include blog posts with table of contents, references sidebar, comments system, and publications list.

Design features

Background: #F5F5F5 (light gray)
Font: Lusitana from Google Fonts
Body text: 11pt, #21232C
H1: 22pt, bold, #21232C
H2: 18pt, bold, #21232C
H3: 14pt, italic, #21232C
Links: #A47663, underlined (except in navigation)

File structure

```
your-site/
├── index.html              # About/Home page (merged)
├── blog.html               # Blog listing page
├── publications.html       # Publications list
├── contact.html            # Contact page
├── building-in-public.html
├── notes-on-reading.html
├── why-write.html
└── images/
    ├── compressed_headshot_2025.png
    ├── 2017_Søren_Solkær_-_Black_Sun_8__starling_murmurations_.jpg
    ├── 2011_NASA_Endeavour_Launch_2011_-_Editado.jpg
    └── 1872_Monet_-_Impression__Sunrise.jpg
```

What's implemented

Homepage (index.html): Combined About and Home page with center-aligned hero, tagline, images with captions, sections for work, interests, and personal background, headshot with download link.

Blog system: Blog listing page with clean layout, individual post pages with table of contents (left sidebar), main content (center, approximately 650px wide), references (right sidebar with inline citations), comments section using Giscus, social footer.

Other pages: Publications as simple list format (same style as blog), Contact page with links.

Images: All uploaded images are in the /images/ directory.

How to add a new blog post

Step 1: Create the HTML file

Duplicate one of the blog post files (e.g., building-in-public.html) and rename it (e.g., my-new-post.html).

Step 2: Update the content

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

Step 3: Add inline citations

```html
<p>
    Your text here with a citation.<a href="#ref1" class="citation">1</a>
</p>
```

Step 4: Add references

```html
<aside class="references-sidebar">
    <h4>References</h4>
    <div class="reference-item" id="ref1">
        <span class="reference-number">1</span>
        Author. (Year). <a href="URL" target="_blank">Title</a>
    </div>
</aside>
```

Step 5: Add to blog listing

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

Step 6: Upload files

Upload both the new post file and the updated blog.html.

Setting up comments

The blog posts use Giscus (GitHub-based comments). To enable:

1. Go to https://giscus.app/
2. Enter your GitHub repository name
3. Enable Discussions in your repo settings
4. Configure your preferences on giscus.app
5. Copy the generated script tag
6. Replace the placeholder script in each blog post

Current placeholder:
```html
<script src="https://giscus.app/client.js"
        data-repo="YOUR-GITHUB-USERNAME/YOUR-REPO-NAME"
        data-repo-id="YOUR-REPO-ID"
        ...
</script>
```

Adding images

Yes, you need to upload images to GitHub. All images should be in the /images/ directory.

To add new images:

1. Upload image to /images/ folder in your GitHub repository
2. Reference in HTML:
```html
<div class="hero-image">
    <img src="/images/your-image.jpg" alt="Description">
</div>
<p class="image-caption">
    <a href="https://source-url.com">Image Title</a>, Artist (Year)
</p>
```

Adding publications

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

Customizing colors

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

Hosting on GitHub Pages

1. Create repository: yourusername.github.io
2. Upload all files maintaining the folder structure
3. Make sure images are in /images/ folder
4. Site will be live at https://yourusername.github.io

Using your own domain

To use araujorenan.com with GitHub Pages:

1. In your GitHub repo, go to Settings, then Pages
2. Under "Custom domain", enter: araujorenan.com
3. Save the settings
4. In your domain registrar (where you bought araujorenan.com):
   - Add a CNAME record pointing to: yourusername.github.io
   - Or add A records pointing to GitHub's IPs: 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
5. Wait for DNS to propagate (can take up to 24 hours)
6. Enable "Enforce HTTPS" in GitHub Pages settings

Alternative hosting options

GitHub Pages is free and works well for static sites. If you want alternatives:

Netlify: Easier interface than GitHub, drag-and-drop deployment, free tier, good for custom domains. Very simple to set up. Go to netlify.com, drag your folder, done.

Vercel: Similar to Netlify, also very easy.

Traditional web hosting: More complex setup, costs money, unnecessary for a static site.

Recommendation: Start with GitHub Pages since you're already using GitHub. If you find it clunky, try Netlify (it's actually easier than GitHub Pages).

Quick checklist

- Replace placeholder email in contact.html
- Set up Giscus comments for blog posts
- Upload images to /images/ folder in GitHub
- Add your actual publications
- Replace sample blog posts with your content
- Test all links work
- Set up custom domain if desired

Technical notes

Three-column layout for blog posts collapses to single column on mobile.
References sidebar appears parallel to where citations appear in text.
All pages use sticky navigation.
Images automatically resize for mobile.
Comments require GitHub account (via Giscus).

Common questions

How do I change the navigation menu? Edit the nav section in each HTML file's .site-nav div.

Can I add more pages? Yes. Duplicate any existing page and modify the content. Add a link in the navigation.

How do I change fonts? Update the Google Fonts link in head and the --font-main variable in CSS.

Why aren't references showing parallel to citations? The references sidebar is sticky and scrolls with the page. Make sure citations use the format shown above with matching IDs.

License

Free to use however you like. No attribution required.
