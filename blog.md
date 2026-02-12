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
