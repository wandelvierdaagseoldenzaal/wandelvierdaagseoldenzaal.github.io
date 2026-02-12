---
layout: single
title: Fotoboek
permalink: /fotoboek
author_profile: false
---

<style>
.year-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
  margin: 30px 0;
}

.year-card {
  background: #f5f5f5;
  border-radius: 10px;
  padding: 25px;
  text-align: center;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.year-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 16px rgba(0,0,0,0.2);
}

.year-card h2 {
  font-size: 2.5em;
  margin: 0 0 10px 0;
  color: #333;
}

.year-card p {
  font-size: 1.1em;
  color: #666;
  margin: 0;
}

.year-card a {
  text-decoration: none;
  color: inherit;
  display: block;
}

.year-card a:hover h2 {
  color: #0066cc;
}
</style>

<div class="fotoboek-overview">
  <p>Tijdens de Wandel4Daagse Oldenzaal worden er herinneringen gemaakt en vriendschappen gesloten of verstekt. Mooie momenten om vast te leggen. Klik op een jaar om de foto's van dat evenement te bekijken.</p>

  {% if site.data.photobook %}
    <div class="year-grid">
      {% assign sorted_years = site.data.photobook | keys | sort | reverse %}
      
      {% for year in sorted_years %}
        {% assign year_data = site.data.photobook[year] %}
        {% assign year_photo_count = 0 %}
        {% for day_pair in year_data %}
          {% assign day_photos = day_pair[1] %}
          {% assign year_photo_count = year_photo_count | plus: day_photos.size %}
        {% endfor %}
        
        {% if year_photo_count > 0 %}
          <div class="year-card">
            <a href="/fotoboek/{{ year }}">
              <h2>{{ year }}</h2>
              <p>{{ year_photo_count }} foto's</p>
            </a>
          </div>
        {% endif %}
      {% endfor %}
    </div>
  {% else %}
    <p>Geen foto's gevonden. Het fotoboek wordt momenteel gegenereerd...</p>
  {% endif %}
</div>
