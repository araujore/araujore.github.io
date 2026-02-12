---
layout: page
title: Publications
permalink: /publications/
---

<header>
    <h2>Publications</h2>
    <p class="pub-intro">Selected research and policy publications.</p>
</header>

<main class="publications">
    <ul class="pub-list">
        {% for pub in site.data.publications %}
            <li>
                <div class="pub-info">
                    <a href="#" class="pub-title" data-index="{{ forloop.index0 }}" onclick="openPanel({{ forloop.index0 }}); return false;">{{ pub.title }}</a>
                    <p class="pub-cite-inline">{{ pub.citation }}</p>
                </div>
                <span class="pub-year">{{ pub.year }}</span>
            </li>
        {% endfor %}
    </ul>
</main>

<!-- Slide-out panel overlay -->
<div class="pub-panel-overlay" id="pubOverlay" onclick="closePanel()"></div>

<!-- Slide-out panel -->
<div class="pub-panel" id="pubPanel">
    <button class="pub-panel-close" onclick="closePanel()">&times;</button>
    <h3 id="panelTitle"></h3>
    <p class="pub-summary" id="panelSummary"></p>
    <div class="pub-citation-block">
        <strong>Citation</strong>
        <p class="pub-citation" id="panelCitation"></p>
    </div>
    <a class="pub-link" id="panelLink" href="#" target="_blank">Read publication &rarr;</a>
</div>

<script>
var pubs = [
    {% for pub in site.data.publications %}
    {
        title: {{ pub.title | jsonify }},
        url: {{ pub.url | jsonify }},
        description: {{ pub.description | jsonify }},
        citation: {{ pub.citation | jsonify }}
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
];

function openPanel(index) {
    var pub = pubs[index];
    document.getElementById('panelTitle').textContent = pub.title;
    document.getElementById('panelSummary').textContent = pub.description;
    document.getElementById('panelCitation').innerHTML = pub.citation;
    document.getElementById('panelLink').href = pub.url;
    document.getElementById('pubPanel').classList.add('active');
    document.getElementById('pubOverlay').classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closePanel() {
    document.getElementById('pubPanel').classList.remove('active');
    document.getElementById('pubOverlay').classList.remove('active');
    document.body.style.overflow = '';
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') closePanel();
});
</script>
