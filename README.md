# Renan Araujo - Personal Website

A clean, typography-focused personal website built with Lusitana font. Features include blog posts with table of contents, references sidebar, comments system, and publications portfolio.

## 🎨 Design Features

- **Background**: #F5F5F5 (light gray)
- **Font**: Lusitana from Google Fonts
- **Body text**: 11pt, #21232C
- **H1**: 20pt, bold, #A47663 (accent color)
- **H2**: 16pt, bold, #21232C
- **H3**: 14pt, italic, #21232C
- **Links**: #A47663, underlined (except in navigation)

## 📁 File Structure

```
your-site/
├── index.html              # About/Home page (merged)
├── blog.html               # Blog listing page
├── publications.html       # Publications portfolio
├── contact.html            # Contact page
├── blog/
│   ├── building-in-public.html
│   ├── notes-on-reading.html
│   └── why-write.html
└── images/
    ├── compressed_headshot_2025.png
    ├── 2017_Søren_Solkær_-_Black_Sun_8__starling_murmurations_.jpg
    ├── 2011_NASA_Endeavour_Launch_2011_-_Editado.jpg
    └── 1872_Monet_-_Impression__Sunrise.jpg
```

## ✅ What's Implemented

### Homepage (index.html)
- Combined About + Home page
- Center-aligned hero with tagline
- Images with captions
- Sections: My work, Other work interests, About me
- Your headshot with download link

### Blog System
- Blog listing page with clean layout
- Individual post pages with:
  - Table of contents (left sidebar)
  - Main content (center, ~650px wide)
  - References (right sidebar with inline citations)
  - Comments section using Giscus
  - Social footer
- Three sample posts included

### Other Pages
- Publications: Portfolio grid for publication covers
- Contact: Simple contact page with links

## 📝 How to Add a New Blog Post

### Step 1: Create the HTML File
1. Duplicate one of the blog post files (e.g., `blog/building-in-public.html`)
2. Rename it (e.g., `blog/my-new-post.html`)

### Step 2: Update the Content
```html
<!-- Update title -->
<title>Your Post Title - Renan Araujo</title>

<!-- Update h1 -->
<h1>Your Post Title</h1>

<!-- Update date -->
<p class="meta">January 15, 2025</p>

<!-- Update table of contents -->
<aside class="toc-sidebar">
    <h4>Contents</h4>
    <ul>
        <li><a href="#section1">Your First Section</a></li>
        <li><a href="#section2">Your Second Section</a></li>
    </ul>
</aside>

<!-- Update h2 headings with matching IDs -->
<h2 id="section1">Your First Section</h2>
```

### Step 3: Add Inline Citations
```html
<p>
    Your text here with a citation.<a href="#ref1" class="citation">1</a>
</p>
```

### Step 4: Add References
```html
<aside class="references-sidebar">
    <h4>References</h4>
    <div class="reference-item" id="ref1">
        <span class="reference-number">1</span>
        Author. (Year). <a href="URL" target="_blank">Title</a>
    </div>
</aside>
```

### Step 5: Add to Blog Listing
Update `blog.html`:
```html
<article>
    <h3><a href="/blog/your-new-post.html">Your Post Title</a></h3>
    <p class="meta">January 15, 2025</p>
    <p class="excerpt">
        Your post excerpt here...
    </p>
</article>
```

### Step 6: Upload Files
Upload both the new post file and the updated `blog.html`

## 💬 Setting Up Comments

The blog posts use Giscus (GitHub-based comments). To enable:

1. Go to https://giscus.app/
2. Enter your GitHub repository name
3. Enable Discussions in your repo settings
4. Configure your preferences on giscus.app
5. Copy the generated `<script>` tag
6. Replace the placeholder script in each blog post

Current placeholder:
```html
<script src="https://giscus.app/client.js"
        data-repo="YOUR-GITHUB-USERNAME/YOUR-REPO-NAME"
        data-repo-id="YOUR-REPO-ID"
        ...
</script>
```

## 🖼️ Adding Images

All images are in the `/images/` directory. To add new images:

1. Upload image to `/images/` folder
2. Reference in HTML:
```html
<div class="hero-image">
    <img src="/images/your-image.jpg" alt="Description">
</div>
<p class="image-caption">
    <a href="https://source-url.com">Image Title</a>, Artist (Year)
</p>
```

## 📚 Adding Publications

Update `publications.html`:

```html
<a href="URL_TO_PUBLICATION" class="publication-item" target="_blank">
    <div class="publication-cover">
        <img src="/images/cover.jpg" alt="Publication title">
    </div>
    <h3 class="publication-title">Your Publication Title</h3>
    <p class="publication-meta">Journal/Venue • Year</p>
    <p class="publication-description">
        Brief description of the publication
    </p>
</a>
```

## 🎨 Customizing Colors

Edit CSS variables in any HTML file:
```css
:root {
    --bg: #F5F5F5;           /* Background */
    --text: #21232C;         /* Body text */
    --text-light: #666;      /* Metadata */
    --caption: #B2B7CC;      /* Image captions */
    --accent: #A47663;       /* Links, H1 */
}
```

## 🚀 Hosting on GitHub Pages

1. Create repository: `yourusername.github.io`
2. Upload all files maintaining the folder structure
3. Make sure images are in `/images/` and blog posts in `/blog/`
4. Site will be live at `https://yourusername.github.io`

## 📋 Quick Checklist

- [ ] Replace placeholder email in contact.html
- [ ] Set up Giscus comments for blog posts
- [ ] Add your actual publications with covers
- [ ] Replace sample blog posts with your content
- [ ] Update social links (already set to your profiles)
- [ ] Upload all images to `/images/` folder
- [ ] Test all links work
- [ ] Deploy to GitHub Pages

## 🔧 Technical Notes

- Three-column layout for blog posts collapses to single column on mobile
- References sidebar appears parallel to where citations appear in text
- All pages use sticky navigation
- Images automatically resize for mobile
- Comments require GitHub account (via Giscus)

## ❓ Common Questions

**Q: How do I change the navigation menu?**
A: Edit the `<nav>` section in each HTML file's `.site-nav` div.

**Q: Can I add more pages?**
A: Yes! Duplicate any existing page and modify the content. Add a link in the navigation.

**Q: How do I change fonts?**
A: Update the Google Fonts link in `<head>` and the `--font-main` variable in CSS.

**Q: References aren't showing parallel to citations?**
A: The references sidebar is sticky and scrolls with the page. Make sure citations use `<a href="#ref1" class="citation">1</a>` and references have matching `id="ref1"`.

## 📄 License

Free to use however you like. No attribution required.
