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
