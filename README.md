# Writing Portfolio Website

A clean, typography-focused blog inspired by borretti.me. Built with pure HTML and CSS—no frameworks, no build process, no dependencies.

## Files Included

- `index.html` - Homepage with recent posts
- `post.html` - Example individual post page
- `about.html` - About page

## How to Use

1. **Customize the content**: Open each HTML file and replace placeholder text with your own:
   - Your name
   - Your bio and interests
   - Your actual blog posts
   - Contact links (email, Twitter, GitHub, etc.)

2. **Host it**: Upload these files to any web host:
   - GitHub Pages (free)
   - Netlify (free)
   - Vercel (free)
   - Your own server

3. **Add more posts**: 
   - Duplicate `post.html`
   - Update the title, date, and content
   - Add a link to it from `index.html`

## Design Features

- **Clean typography**: Uses Crimson Pro (serif) and IBM Plex Mono
- **Minimal, readable layout**: Max-width content, generous line height
- **Subtle animations**: Fade-in effects on page load
- **Responsive**: Works on mobile and desktop
- **Fast**: No JavaScript, no external dependencies beyond fonts

## Customization Tips

### Colors
Edit the CSS variables at the top of any file:
```css
:root {
    --bg: #fdfdf8;        /* Background */
    --text: #1a1a1a;      /* Main text */
    --text-light: #666;   /* Metadata, footer */
    --accent: #2a5a8a;    /* Links, accents */
}
```

### Fonts
Current fonts:
- Headings and body: Crimson Pro (serif)
- Code and metadata: IBM Plex Mono

To change fonts, update the Google Fonts link in the `<head>` and the CSS variables.

### Layout
The main content width is set to `680px`. Adjust in the `.container` class to make it wider or narrower.

## Adding an RSS Feed

To enable RSS (so people can subscribe), you'll need to create a `feed.xml` file. This requires some manual work or a static site generator like Jekyll or Hugo if you want it automated.

## Next Steps

Consider adding:
- An archive page showing all posts
- Tags or categories
- A search function (requires JavaScript)
- Comments (via Disqus, Utterances, etc.)
- Analytics (if desired)

## License

This template is free to use however you'd like. No attribution required.
