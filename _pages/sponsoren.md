---
layout: single
title: Sponsoren
permalink: /sponsoren
author_profile: false
sponsorlogos:
- url: /assets/sponsors/AkomOldenzaal.jpeg
  name: Akom
- url: /assets/sponsors/AutoWessel.png
  name: Auto Wessel
- url: /assets/sponsors/Coop.png
  name: Coop Oldenzaal
- url: /assets/sponsors/ErveHulsbeek.jpg
  name: Erve Hulsbeek
- url: /assets/sponsors/GemeenteOldenzaal.jpg
  name: Fabri
- url: /assets/sponsors/Fabri.png
  name: Gemeente Oldenzaal
- url: /assets/sponsors/GlimLachVanTwente.png
  name: Glimlach van Twente
- url: /assets/sponsors/Hulsbeach.png
  name: Hulsbeach
- url: /assets/sponsors/Impuls.png
  name: Impuls Oldenzaal
- url: /assets/sponsors/Jumbo.png
  name: Jumbo
- url: /assets/sponsors/LandschapOverijssel.png
  name: Landschap Overijssel
- url: /assets/sponsors/LG_Landhuis.jpg
  name: Het Landhuis
- url: /assets/sponsors/LetterPret.png
  name: LetterPret  
- url: /assets/sponsors/MonkeyTown.png
  name: MonkeyTown
- url: /assets/sponsors/Natuurmonumenten.png
  name: Natuurmonumenten
- url: /assets/sponsors/OldenzaalsBeweegEnSportAkkoord.png
  name: Oldenzaals Beweeg- en Sportakkoord
- url: /assets/sponsors/Partou.png
  name: Partou
- url: /assets/sponsors/ProvincieOverrijsel.png
  name: Provincie Overijssel
- url: /assets/sponsors/Rabobank.png
  name: Rabobank
- url: /assets/sponsors/Reerink.png
  name: Reerink
- url: /assets/sponsors/Riteco.jpg
  name: Riteco
classes: wide
---

De Wandel4Daagse Oldenzaal wordt mede mogelijk gemaakt door deze fantastische sponsoren:

<div style="text-align: center">
    {% for logo in page.sponsorlogos %}
        <div style="padding-bottom: 50px">
            <img src="{{ logo.url }}" title="{{ logo.name }}" alt="{{ logo.name }}" />
        </div>
    {% endfor %}
</div>