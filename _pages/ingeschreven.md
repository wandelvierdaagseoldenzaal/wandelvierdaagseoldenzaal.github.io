---
layout: single
title: Ingeschreven
permalink: /ingeschreven
author_profile: false
---

Bedankt voor je inschrijving, leuk dat je meedoet!  

Voor jouw inschrijving worden geen deelnamekosten berekend. Jouw inschrijving is hiermee nu afgerond. Jouw persoonlijke QR code en deelnamebewijs is:  

<div id="qrcode"><img src="/assets/images/loading.gif" alt="Gegevens worden opgehaald" /></div>

<div id="instructions"></div>

<script type="text/javascript">
    var urlParams = new URLSearchParams(window.location.search);
    var signupreference = urlParams.get('signupreference');
    var signupid = urlParams.get('signupid');
    var environment = urlParams.get('environment') ?? '';

    fetch("https://publicapi" + environment + ".wandel4daagseoldenzaal.nl/v1/qrcode?signupreference=" + signupreference + "&signupid=" + signupid + "&format=json")
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        document.getElementById('qrcode').innerHTML = '<img src="data:image/png;base64,' + data.qrCode + '" alt="QR Code" /><p style="font-size: 14pt">' + data.registrationId + '<br/>' + data.participants + ' deelnemer' + (data.participants != 1 ? 's' : '') +  '<br/>' + (data.ticketType === 'DayPass' ? 'dagkaart' : 'vierdagenkaart') + '</p>';
        if(data.emailAddressProvided) {
            document.getElementById('instructions').innerHTML = 'Je ontvangt ook een bevestiging per e-mail. Graag deze e-mail tonen bij onze stand bij de start van de route tijdens de Wandel4Daagse.';
        } else {
            document.getElementById('instructions').innerHTML = 'Aangezien je geen e-mailadres hebt opgegeven, graag een screenshot van deze pagina maken, je deelnamecode opschrijven of je aanmelden met je naam bij onze stand bij de start van de route tijdens de Wandel4Daagse.';
        }
    })
    .catch(error => {
        console.error('QR Code error:', error);
        document.getElementById('qrcode').innerHTML = '<img src="https://publicapi' + environment + '.wandel4daagseoldenzaal.nl/v1/qrcode?signupreference=' + signupreference + '&signupid=' + signupid + '" alt="QR Code" />';
    });
</script>