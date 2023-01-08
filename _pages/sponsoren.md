---
layout: single
title: Sponsoren
permalink: /sponsoren/
author_profile: false
sponsorlogos:
- /assets/sponsors/AkomOldenzaal.jpeg
- /assets/sponsors/AutoWessel.png
- /assets/sponsors/ErveHulsbeek.jpg
- /assets/sponsors/GemeenteOldenzaal.jpg
- /assets/sponsors/Impuls.png
- /assets/sponsors/Jumbo.png
- /assets/sponsors/LG_Landhuis.jpg
- /assets/sponsors/MonkeyTown.png
- /assets/sponsors/Partou.png
- /assets/sponsors/Reerink.png
classes: wide
---

De Wandel4Daagse Oldenzaal wordt mede mogelijk gemaakt door onze sponsoren:

<div>
    {% for logo in page.sponsorlogos %}
        <div class="feature__item">
            <img src="{{ logo }}" alt="sponsor logo">
        </div>
    {% endfor %}
</div>