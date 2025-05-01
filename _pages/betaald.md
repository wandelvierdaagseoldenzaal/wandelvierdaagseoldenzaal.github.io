---
layout: single
title: Betaling
permalink: /betaald
author_profile: false
---

<div id="betaald" style="display: none">
    Bedankt voor uw betaling!  

    Uw inschrijving is nu afgerond. Uw persoonlijke QR code is:  

    <div id="qrcode"></div>

    U ontvangt tevens een bevestiging per e-mail.  
</div>
<div id="nietbetaald" style="display: none">
Er is wat mis gegaan met de betaling. Probeer het opnieuw of neem contact op met de organisatie.
</div>

<script type="text/javascript">
    var urlParams = new URLSearchParams(window.location.search);
    var status = urlParams.get('orderStatusId');
    if (status == '100') {
        document.getElementById('betaald').style.display = 'block';

        var orderId = urlParams.get('orderId');
        fetch("https://api.wandel4daagseoldenzaal.nl/v1/qrcode?orderid=" + orderId + "&format=json")
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
            document.getElementById('qrcode').innerHTML = '<img src="https://api.wandel4daagseoldenzaal.nl/v1/qrcode?orderid=' + orderId + '" alt="QR Code" />';
        });
    } else {
        document.getElementById('nietbetaald').style.display = 'block';
    }
</script>