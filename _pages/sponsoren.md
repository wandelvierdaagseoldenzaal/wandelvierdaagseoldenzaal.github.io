---
layout: single
title: Sponsoren
permalink: /sponsoren
author_profile: false
sponsorlogos:
- url: /assets/sponsors/AkomOldenzaal.jpeg
  name: Akom
  link: https://www.akomoldenzaal.nl/
- url: /assets/sponsors/AutoWessel.png
  name: Auto Wessel
  link: https://www.auto-wessel.nl/
- url: /assets/sponsors/BoeskoolFonds.png
  name: Boeskoolfonds
  link: https://www.boeskoolfonds.nl/
- url: /assets/sponsors/ErveHulsbeek.jpg
  name: Erve Hulsbeek
  link: https://www.hulsbeek.nl/
- url: /assets/sponsors/Fabri.png
  name: Fabri
  link: https://fabri.nl/
- url: /assets/sponsors/focus.png
  name: Focus Print en Druk
  link: https://www.focusprintendruk.nl/
- url: /assets/sponsors/GemeenteOldenzaal.jpg
  name: Gemeente Oldenzaal
  link: https://www.oldenzaal.nl
- url: /assets/sponsors/GlimlachVanTwente.png
  name: Glimlach van Twente
  link: https://www.glimlachtwente.nl/
- url: /assets/sponsors/Hulsbeach.png
  name: Hulsbeach
  link: https://www.hulsbeach.nl/
- url: /assets/sponsors/Impuls.png
  name: Impuls Oldenzaal
  link: https://www.impuls-oldenzaal.nl/
- url: /assets/sponsors/Jumbo.png
  name: Jumbo
  link: https://www.jumbo.com/winkel/oldenzaal/jumbo-oldenzaal-kuipers
- url: /assets/sponsors/Geldermanstichting.png
  name: Geldermanstichting Oldenzaal
  link: https://www.geldermanstichting.nl/
- url: /assets/sponsors/Heisterkamp.png
  name: Heisterkamp
  link: https://www.heisterkamp.eu/nl
- url: /assets/sponsors/LG_Landhuis.jpg
  name: Het Landhuis
  link: https://www.hotelhetlandhuis.nl/
- url: /assets/sponsors/Hobru.png
  name: Hobru
  link: https://hobru.com/
- url: /assets/sponsors/KockVanBenthem.png
  name: Kok van Benthem Makelaars
  link: https://www.kvbm.nl/
- url: /assets/sponsors/LetterPret.png
  name: LetterPret
  link: https://www.letterpret.com/
- url: /assets/sponsors/Natuurmonumenten.png
  name: Natuurmonumenten
  link: https://www.natuurmonumenten.nl/
- url: /assets/sponsors/OldenzaalsBeweegEnSportAkkoord.png
  name: Oldenzaals Beweeg- en Sportakkoord
  link: https://oldenzaalvitaal.nl/sportakkoord/
- url: /assets/sponsors/Partou.png
  name: Partou
  link: https://partou.nl/kinderopvang/oldenzaal/kinderdagverblijf
- url: /assets/sponsors/Plus.png
  name: Plus
  link: https://www.plus.nl/supermarkten/oldenzaal_plus-oldenzaal_823
- url: /assets/sponsors/Rabobank.png
  name: Rabobank
  link: https://www.rabobank.nl/
- url: /assets/sponsors/Reerink.png
  name: Reerink
  link: https://reerink.nl/
- url: /assets/sponsors/Riteco.jpg
  name: Riteco
  link: https://notariskantoorriteco.nl/
- url: /assets/sponsors/Thijs.png
  name: Thijs
  link: https://www.thijs-oldenzaal.nl/
classes: wide
---

De Wandel4Daagse Oldenzaal wordt mede mogelijk gemaakt door deze fantastische sponsoren:

<div style="text-align: center">
    {% for logo in page.sponsorlogos %}
        <div style="padding-bottom: 50px">
          {% if logo.link %}
            <a href="{{ logo.link }}" target="_blank">
          {% endif %}
            <img src="{{ logo.url }}" title="{{ logo.name }}" alt="{{ logo.name }}" />
          {% if logo.link %}
            </a>
          {% endif %}
        </div>
    {% endfor %}
</div>

Ook sponsor worden? [Neem contact op](/contact) met ons voor de mogelijkheden!  