---
title: Guides
permalink: /guides/
nav_exclude: true
---

# Guides

How each of Clearer's features works.

{% assign guides = site.guides | sort: "nav_order" %}
{% for guide in guides %}
- [{{ guide.title }}]({{ guide.url }})
{% endfor %}
