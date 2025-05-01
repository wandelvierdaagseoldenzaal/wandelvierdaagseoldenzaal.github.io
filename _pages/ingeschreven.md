---
layout: single
title: Ingeschreven
permalink: /ingeschreven
author_profile: false
---

Bedankt voor uw inschrijving!  

Voor uw inschrijving worden geen deelnamekosten berekend. Uw inschrijving is hiermee nu afgerond. Uw persoonlijke QR code is:  

<div id="qrcode"></div>

U ontvangt tevens een bevestiging per e-mail.  

<script type="text/javascript">
    var urlParams = new URLSearchParams(window.location.search);
    var signupreference = urlParams.get('signupreference');

    fetch("https://api.wandel4daagseoldenzaal.nl/v1/qrcode?signupreference=" + signupreference + "&format=json")
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        console.log(data);
        document.getElementById('qrcode').innerHTML = '<img src="data:image/png;base64,' + data.qrCode + '" alt="QR Code" /><p style="font-size: 14pt">' + data.registrationId + '<br/>' + data.participants + ' deelnemer' + (data.participants != 1 ? 's' : '') + '</p>';
    })
    .catch(error => {
        console.error('QR Code error:', error);
        document.getElementById('qrcode').innerHTML = '<img src="https://api.wandel4daagseoldenzaal.nl/v1/qrcode?signupreference=' + signupreference + '" alt="QR Code" />';
    });
</script>