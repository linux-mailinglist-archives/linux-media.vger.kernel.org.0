Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8089A2B3D39
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 07:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgKPGnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 01:43:42 -0500
Received: from smtpout2.fz-rossendorf.de ([149.220.4.206]:60462 "EHLO
        smtpout2.fz-rossendorf.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgKPGnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 01:43:41 -0500
Received: from fz-rossendorf.de (mail.fz-rossendorf.de [149.220.4.66])
        by smtpout2.fz-rossendorf.de (Postfix) with ESMTPS id A5B6C40284;
        Mon, 16 Nov 2020 07:43:37 +0100 (CET)
Received: from [80.137.188.41] (account hlawac90@hzdr.de HELO [192.168.178.54])
  by hzdr.de (CommuniGate Pro SMTP 6.2.15)
  with ESMTPSA id 26573037; Mon, 16 Nov 2020 07:43:37 +0100
Message-ID: <902e5b064f3f5230c26f7b9325c6baa4f4566043.camel@hzdr.de>
Subject: Re: Philips Monitor with webcam
From:   Gregor Hlawacek <g.hlawacek@hzdr.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
In-Reply-To: <0575b7608e42ef4ffd4964cd2fa19d9d128a90d2.camel@hzdr.de>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
         <20201104170233.0d405dff@coco.lan>
         <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
         <20201104174554.4bbec36a@coco.lan>
         <b8fcc03ed79873f9e55ab394b4b95140ab8b215b.camel@hzdr.de>
         <20201104210155.353a0d6a@coco.lan>
         <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
         <20201104221148.4d5c644d@coco.lan>
         <20201104212454.GF29958@pendragon.ideasonboard.com>
         <73b62785d882113351d0e69e3b552f0f271e4f2d.camel@hzdr.de>
         <20201105091905.GD3988@pendragon.ideasonboard.com>
         <0575b7608e42ef4ffd4964cd2fa19d9d128a90d2.camel@hzdr.de>
Organization: HZDR FWIZ-N
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
        boundary="=-oTlMSOJHtzh0yHf6Iu2c"
Date:   Mon, 16 Nov 2020 07:43:36 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.38.1 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-oTlMSOJHtzh0yHf6Iu2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-11-07 at 17:23 +0100, Gregor Hlawacek wrote:
> On Thu, 2020-11-05 at 11:19 +0200, Laurent Pinchart wrote:
> > Hi Gregor,
> >=20
> > On Thu, Nov 05, 2020 at 08:41:27AM +0100, Gregor Hlawacek wrote:
> >=20
> > [snip]
> >=20
> > > Hi Mauro and Laurent
> > >=20
> > > @Mauro:
> > >=20
> > > I think there is a confusion, which might be my fault as I talked
> > > about
> > > a chicony cam in the external monitor. The chicony cam that shows
> > > up as
> > > video0/1 is my internal laptop camera which is working fine. The
> > > problematic one is the sunplusIT camera which has a chicony usb
> > > identifier (0412). This is connected to video2-5 and also the one
> > > for
> > > which I reported the above information.
> > >=20
> > > @Laurent:
> > >=20
> > > lsusb -v -d 0412:612b:
> >=20
> > [snip]
> >=20
> > Thank for the information. Nothing strikes me as weird. Could you
> >=20
> > - Set the uvcvideo trace parameter to 0xffff:
> >=20
> > =C2=A0 sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
> >=20
> > - Unplug and replug the monitor
> > - Open the video devices in turn with v4l2-ctl (use the video
> > device
> > =C2=A0 nodes /dev/video* directly, not the by-id links)
> > - Send send the output of 'sudo dmesg'
> >=20
> > You can clear the kernel log with 'sudo dmesg -c' before doing so
> > to
> > avoid including unrelated data (or just strip it from the dmesg
> > output
> > manually when copying it to an e-mail).
> >=20
>=20
> Hi Laurent
>=20
> sorry for the delay but I had to many other things going on during
> the
> end of this week. Here is the output attached.
>=20
> Have a nice weekend
>=20
> Gregor
>=20
Hi Laurent and Mauro

could you make any sense out of the dmesg log and the other input I've
provided?

Gregor

--=-oTlMSOJHtzh0yHf6Iu2c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCFpgw
ggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSsw
KQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5
c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAy
MB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMtg1/9moUHN0vqH
l4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZsFVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8F
XRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+Ba
L2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qL
NupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz
9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQU
k+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYD
VR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGC
LB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUv
cmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYB
BQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIw
DQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6
dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+
hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWS
T1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7
h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bPZYoaorVyGTkwggWsMIIElKAD
AgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJERTFFMEMGA1UEChM8VmVy
ZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRERk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcNMzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp
1xCeOdfZojDbchwFfylfS2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6W
LkDh0YNMZj0cZGnlm6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mI
TQ5HjUhfZZkQ0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUk
P7agCwf9TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22M
ZD08WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAdBgNV
HQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK4OpL4qIM
z+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9v
dC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYBBQUHAQEEgdAwgc0wMwYI
KwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBKBggrBgEF
BQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0
L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJv
b3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/
DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCN
T1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7Ln8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+
lgQCXISoKTlslPwQkgZ7nu7YRrQbtQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v
9NsH1VuEGMGpuEvObJAaguS5Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7
EUkp2KgtdRXYShjqFu9VNCIaE40GMIIF5TCCBM2gAwIBAgIMITw++XMeenpZKoHZMA0GCSqGSIb3
DQEBCwUAMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVp
bmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUw
IwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDcwMzE0NTMzM1oXDTIy
MDcwMjE0NTMzM1owgYMxCzAJBgNVBAYTAkRFMRAwDgYDVQQIDAdTYWNoc2VuMRAwDgYDVQQHDAdE
cmVzZGVuMTUwMwYDVQQKDCxIZWxtaG9sdHotWmVudHJ1bSBEcmVzZGVuIC0gUm9zc2VuZG9yZiBl
LiBWLjEZMBcGA1UEAwwQSGxhd2FjZWssIEdyZWdvcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAPT2husCqijBQDUyAd8yXl3PBKBB44b6kSh4kUIsskuSqPIV2Bbdo61wy7inFK/iSt4f
7DITlGarq3fwKtlDWHuHDyZhpv8gRea7T4Ul/lw8w4oymaimKNz47Ofio2XsosCWX7RQYitgTbr+
VlPKj36HlEv9BIr1+SxRXESr2FSIYRaFxwW+QA+ic0JJ3iimG8P7BQ+ylVqbnFMU+QqC739qC1HB
DPTSoi30gEBkQI1gcNL+dN1j0b1WibYZGQXcABjydbpy1ow17OyxpQVXNA4DaEI8VtGldmPqyXo7
QocVkn3hCoVCgcm23H1WSlFpNoC3C09CvsYPxny5vZ5O3dkCAwEAAaOCAkswggJHMD4GA1UdIAQ3
MDUwDwYNKwYBBAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEEAYGtIYIsAgEEBDAJ
BgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
HQYDVR0OBBYEFD9v9h1AN9B7JVmbUR3b4sCrEHIqMB8GA1UdIwQYMBaAFGs6mIv58lOJ2uCtsjIe
CR/oqjt0MB0GA1UdEQQWMBSBEmcuaGxhd2FjZWtAaHpkci5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7
hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5j
cmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3Js
L2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBj
YS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRm
bi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAl0uz9sxJ9EKjOX+9CcXVGa219cKWtKWqJh5hlvhfE/0W
eQAp7cs+5XX9y4a5+huV4z2iqMlwR2Bt4nmlxTrnv6E6LGfQS4z9KGS2LvXLV4eelXFLK8C2z3U1
gkUJF4VAtCadN1q1zPWMXA4lRgwuurqS0tNCKPJEjYjwc5vJVtzZudfX3vTOCcJ4/HEZts0s5zbO
TfKmutq0r3/ePxrkUhRnK0SdBYdDeLCZpWIya3VQhLgzH0j54dOKbGO3MT1bjnTdcgThrF7LU+ON
wTAwxG37DaIU4nD4mTghk01C3iYDvBUmiCLEYEeeOTfOyPzG/FoDj0ZAhj9AXvP0+3sW3TCCBeUw
ggTNoAMCAQICDCE8PvlzHnp6WSqB2TANBgkqhkiG9w0BAQsFADCBjTELMAkGA1UEBhMCREUxRTBD
BgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25l
dHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwg
SXNzdWluZyBDQTAeFw0xOTA3MDMxNDUzMzNaFw0yMjA3MDIxNDUzMzNaMIGDMQswCQYDVQQGEwJE
RTEQMA4GA1UECAwHU2FjaHNlbjEQMA4GA1UEBwwHRHJlc2RlbjE1MDMGA1UECgwsSGVsbWhvbHR6
LVplbnRydW0gRHJlc2RlbiAtIFJvc3NlbmRvcmYgZS4gVi4xGTAXBgNVBAMMEEhsYXdhY2VrLCBH
cmVnb3IwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD09obrAqoowUA1MgHfMl5dzwSg
QeOG+pEoeJFCLLJLkqjyFdgW3aOtcMu4pxSv4kreH+wyE5Rmq6t38CrZQ1h7hw8mYab/IEXmu0+F
Jf5cPMOKMpmopijc+Ozn4qNl7KLAll+0UGIrYE26/lZTyo9+h5RL/QSK9fksUVxEq9hUiGEWhccF
vkAPonNCSd4ophvD+wUPspVam5xTFPkKgu9/agtRwQz00qIt9IBAZECNYHDS/nTdY9G9Vom2GRkF
3AAY8nW6ctaMNezssaUFVzQOA2hCPFbRpXZj6sl6O0KHFZJ94QqFQoHJttx9VkpRaTaAtwtPQr7G
D8Z8ub2eTt3ZAgMBAAGjggJLMIICRzA+BgNVHSAENzA1MA8GDSsGAQQBga0hgiwBAQQwEAYOKwYB
BAGBrSGCLAEBBAQwEAYOKwYBBAGBrSGCLAIBBAQwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAw
HQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBQ/b/YdQDfQeyVZm1Ed2+LA
qxByKjAfBgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAdBgNVHREEFjAUgRJnLmhsYXdh
Y2VrQGh6ZHIuZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9k
Zm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRwOi8vY2RwMi5wY2Eu
ZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHO
MIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1Aw
SQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZu
LWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBAJdL
s/bMSfRCozl/vQnF1RmttfXClrSlqiYeYZb4XxP9FnkAKe3LPuV1/cuGufobleM9oqjJcEdgbeJ5
pcU657+hOixn0EuM/Shkti71y1eHnpVxSyvAts91NYJFCReFQLQmnTdatcz1jFwOJUYMLrq6ktLT
QijyRI2I8HObyVbc2bnX1970zgnCePxxGbbNLOc2zk3yprratK9/3j8a5FIUZytEnQWHQ3iwmaVi
Mmt1UIS4Mx9I+eHTimxjtzE9W4503XIE4axey1PjjcEwMMRt+w2iFOJw+Jk4IZNNQt4mA7wVJogi
xGBHnjk3zsj8xvxaA49GQIY/QF7z9Pt7Ft0xggOdMIIDmQIBATCBnjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQQIMITw++XMeenpZKoHZMA0GCWCGSAFlAwQCAQUAoIIBzzAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMDExMTYwNjQzMzZaMC8GCSqGSIb3DQEJ
BDEiBCBm1DZb7Ix1D4v0lPfdTaU/skrUm6JgiATnfz1j9RwZtzCBrwYJKwYBBAGCNxAEMYGhMIGe
MIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERl
dXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwhPD75cx56elkqgdkwgbEGCyqGSIb3DQEJ
EAILMYGhoIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5n
IGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJ
MSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwhPD75cx56elkqgdkwDQYJ
KoZIhvcNAQEBBQAEggEAMMas9rXYpSFxlxN+j2GlGSd8mCt/5ckbjOI2+UQLr84v/QaSCkYXUZ5v
hJFf8gwWmFlH/cw/B7MAg4oypdSp3TEXSS/nd/D/pyYDGppAaxbhHW8pXllwgDJhcZGymQS3dlfT
6q6Ji5cn33Ndb7j/URK1Jk5hZ5JxYW8KTt+GF909QgRg1xwlfT6LOprggdnTYSZjUrsWtbvppG+Q
zMrJ/DIpw4dn4cUJVYlatpSKdQxsKg70LOwVieeA6Y6cHxvi6UIWgM4DAlKTei8OXARfdC9SYNLR
TIAwA1thBb6NvqMPrtRmLBZ42HvYbU8E1j7p+bDh8+ZCJ8F8X5AQVB3HYgAAAAAAAA==


--=-oTlMSOJHtzh0yHf6Iu2c--

