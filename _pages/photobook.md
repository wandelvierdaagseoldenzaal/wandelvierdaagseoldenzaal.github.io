---
layout: single
title: Fotoboek
permalink: /photobook
author_profile: false
---

<style>
.photobook-container {
  margin: 20px 0;
}

.year-section {
  margin-bottom: 40px;
}

.year-title {
  font-size: 2em;
  font-weight: bold;
  margin: 30px 0 20px 0;
  padding-bottom: 10px;
  border-bottom: 3px solid #333;
}

.day-section {
  margin-bottom: 30px;
}

.day-title {
  font-size: 1.5em;
  font-weight: bold;
  margin: 20px 0 15px 0;
  padding-bottom: 5px;
  border-bottom: 2px solid #666;
  text-transform: capitalize;
}

.photo-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 15px;
  margin: 20px 0;
}

.photo-item {
  position: relative;
  overflow: hidden;
  aspect-ratio: 1;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.photo-item:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 16px rgba(0,0,0,0.2);
}

.photo-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.photo-count {
  color: #666;
  font-size: 0.9em;
  margin-left: 10px;
}
</style>

<div class="photobook-container">
{% if site.data.photobook %}
  {% assign sorted_years = site.data.photobook | keys | sort | reverse %}
  
  {% for year in sorted_years %}
    {% assign year_data = site.data.photobook[year] %}
    {% assign year_photo_count = 0 %}
    {% for day_pair in year_data %}
      {% assign day_photos = day_pair[1] %}
      {% assign year_photo_count = year_photo_count | plus: day_photos.size %}
    {% endfor %}
    
    {% if year_photo_count > 0 %}
    <div class="year-section">
      <h2 class="year-title">{{ year }}<span class="photo-count">({{ year_photo_count }} foto's)</span></h2>
      
      {% assign day_order = "dinsdag,woensdag,donderdag,vrijdag" | split: "," %}
      
      {% for day_name in day_order %}
        {% if year_data[day_name] %}
          {% assign day_photos = year_data[day_name] %}
          <div class="day-section">
            <h3 class="day-title">{{ day_name }}<span class="photo-count">({{ day_photos.size }} foto's)</span></h3>
            <div class="photo-grid">
              {% for photo in day_photos %}
                <a href="https://wandel4daagseoldenzaal.blob.core.windows.net/fotoboek/{{ year }}/{{ day_name }}/{{ photo }}" target="_blank" class="photo-item" title="{{ photo }}">
                  <img src="/assets/photobook/{{ year }}/{{ day_name }}/{{ photo }}" alt="{{ photo }}" loading="lazy">
                </a>
              {% endfor %}
            </div>
          </div>
        {% endif %}
      {% endfor %}
      
      {% comment %} Handle photos directly in year folder (no day subdirectory) {% endcomment %}
      {% if year_data["direct"] %}
        {% assign direct_photos = year_data["direct"] %}
        <div class="photo-grid">
          {% for photo in direct_photos %}
            <a href="https://wandel4daagseoldenzaal.blob.core.windows.net/fotoboek/{{ year }}/{{ photo }}" target="_blank" class="photo-item" title="{{ photo }}">
              <img src="/assets/photobook/{{ year }}/{{ photo }}" alt="{{ photo }}" loading="lazy">
            </a>
          {% endfor %}
        </div>
      {% endif %}
    </div>
    {% endif %}
  {% endfor %}
{% else %}
  <p>Geen foto's gevonden. Het fotoboek wordt momenteel gegenereerd...</p>
{% endif %}
</div>
