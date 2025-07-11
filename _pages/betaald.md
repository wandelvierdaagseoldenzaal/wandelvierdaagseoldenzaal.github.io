---
layout: single
title: Betaling
permalink: /betaald
author_profile: false
---

<div id="betaald" style="display: none">
    Bedankt voor je betaling!  

    Jouw inschrijving is nu afgerond. Jouw persoonlijke QR code is:  

    <div id="qrcode"><img src="/assets/images/loading.gif" alt="Gegevens worden opgehaald" /></div>

    <div id="instructions"></div>
</div>
<div id="nietbetaald" style="display: none">
    Er is wat mis gegaan met de betaling. <span id="opnieuwlink">Probeer het opnieuw</span> of <a href="/contact">neem contact op met de organisatie</a>.
</div>

<script type="text/javascript">
    var urlParams = new URLSearchParams(window.location.search);
    var status = urlParams.get('orderStatusId');
    var orderId = urlParams.get('orderId');

    if (status == '100') {
        document.getElementById('betaald').style.display = 'block';
        
        fetch("https://api.wandel4daagseoldenzaal.nl/v1/qrcode?orderid=" + orderId + "&format=json")
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            document.getElementById('qrcode').innerHTML = '<img src="data:image/png;base64,' + data.qrCode + '" alt="QR Code" /><p style="font-size: 14pt">' + data.registrationId + '<br/>' + data.participants + ' deelnemer' + (data.participants != 1 ? 's' : '') + '<br/>' + (data.ticketType === 'DayPass' ? 'dagkaart' : 'vierdagenkaart') + '</p>';
            if(data.emailAddressProvided) {
                document.getElementById('instructions').innerHTML = 'Je ontvangt ook een bevestiging per e-mail. Graag deze e-mail tonen bij onze stand bij de start van de route tijdens de Wandel4Daagse.';
            } else {
                document.getElementById('instructions').innerHTML = 'Aangezien je geen e-mailadres hebt opgegeven, graag een screenshot van deze pagina maken, je deelnamecode opschrijven of je aanmelden met je naam bij onze stand bij de start van de route tijdens de Wandel4Daagse.';
            }
        })
        .catch(error => {
            console.error('QR Code error:', error);
            document.getElementById('qrcode').innerHTML = '<img src="https://api.wandel4daagseoldenzaal.nl/v1/qrcode?orderid=' + orderId + '" alt="QR Code" />';
        });
    } else {
        document.getElementById('nietbetaald').style.display = 'block';

        fetch("https://api.wandel4daagseoldenzaal.nl/v1/paymentlink?orderid=" + orderId)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if(data && data.paymentlink) {
                document.getElementById('opnieuwlink').innerHTML = '<a href="' + data.paymentlink + '">Probeer het opnieuw</a>';
            }
        })
        .catch(error => {
            console.error('Payment lookup error:', error);
        });
    }
</script>