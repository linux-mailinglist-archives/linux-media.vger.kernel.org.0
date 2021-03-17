Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974D533FAB9
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 23:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhCQWAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 18:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCQWAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 18:00:06 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A672C06175F
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 15:00:05 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4F13wz3hJZzQjmS
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 23:00:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
        s=MBO0001; t=1616018401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=uNF1exP9RsY2/Y8bMepXh5FjwO4T9B+EhTMrtBYRNsE=;
        b=IF1j6vUMgVLJlvpkqJwBJL6dqWEuD1WSD75rawZ8byNCUhAVbrXYcG6Eybz3epRiEHwMLq
        Iku8I5NFFTfEUgEe3/NajuZzwmCKH+xCUqmchsJl23Ms9I/eYBZxi5H7eKNpWTFiCf/dQu
        nsveuf5O+x9rnJ9slm4xV5udDI56wh3Lt+t9Gp31XMpKVEOdHZH/Jh+/gMo21vLWRUD0uV
        FOSdUqZ8NJOEA5a3jpDNQzOUfQaEkIVY46Obx1sFYUL5epDiyUe/v1p2I4dUvTa4bQcqju
        6rHdrRrQDClrzR6tzY4FhcMpAYTB/kfm19AA+w9kx98P5NQIXMIuNwbnFYnmSg==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id sEl50GX-MZse for <linux-media@vger.kernel.org>;
        Wed, 17 Mar 2021 22:59:57 +0100 (CET)
To:     linux-media@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
        s=mail; t=1616018396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=uNF1exP9RsY2/Y8bMepXh5FjwO4T9B+EhTMrtBYRNsE=;
        b=cqOrrfSZ1AlJNrZr/LkHYafha71Xiq3h2teyPCc0pytOa6A8Pcos+ZqSBht4OLT8M5/n85
        8UzyS7T2fnkkmBmC9L4091KDBRh6Cd2BLKPmWZTRv/ZuEHjTPg0CFm7RN3ns7JNqaBmVxo
        e3OoZoITLEfM0Ub4HT5AmVJEC5yL853isGZo1QmPG/tLpgO994To5brH8rmXIdNIImtxFN
        nxC1p5vLZ3bI6a10+ftBfQbAJhhz2nvPP83mqisfPmKH/BbY27+iWEbaJfEEZSBhAINnph
        L+qLIhpkTff2z+lFIWGmw+XRrd2eHtWOs0r7PZo7Imdomsw14VS0mZ27uKdFhA==
From:   Leonardo Brondani Schenkel <leonardo@schenkel.net>
Subject: [PATCH] Add extra keys for rc6-mce
Message-ID: <288ddcee-15d1-90b7-8d52-4519faa56ea4@schenkel.net>
Date:   Wed, 17 Mar 2021 22:59:56 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms040303030809040001080108"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -7.00 / 15.00 / 15.00
X-Rspamd-Queue-Id: 47B8917BE
X-Rspamd-UID: 61c202
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms040303030809040001080108
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(This is my first time sending a patch to this project. I hope I'm doing =

it right. This is not necessarily meant to be merged as-is.)

Over the years I have compiled a list of known MCE remote keys from=20
multiple sources. Unfortunately I have not written down those sources,=20
but I remember that among them there were IR databases such as the one=20
from Logitech Harmony, and also some web pages.

I noticed that the RC6-MCE keymap is missing a few of them, so I am=20
submitting a patch to include them.

I have a Harmony remote and also a JP1 programmable remote and I=20
personally tested all those keys.

I added comments in the diff after the fact to communicate to this list=20
what the buttons are on the remote, so you can know why the specific key =

was chosen.
---
  utils/keytable/rc_keymaps/rc6_mce.toml | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/utils/keytable/rc_keymaps/rc6_mce.toml=20
b/utils/keytable/rc_keymaps/rc6_mce.toml
index 1ee9c722..672fa763 100644
--- a/utils/keytable/rc_keymaps/rc6_mce.toml
+++ b/utils/keytable/rc_keymaps/rc6_mce.toml
@@ -44,24 +44,32 @@ variant =3D "rc6_mce"
  0x800f0425 =3D "KEY_TUNER"
  0x800f0426 =3D "KEY_EPG"
  0x800f0427 =3D "KEY_ZOOM"
+0x800f0428 =3D "KEY_OPEN" # Open/Close
+0x800f0429 =3D "KEY_WAKEUP" # Power on (discrete)
+0x800f042a =3D "KEY_SLEEP" # Power off (discrete)
  0x800f0432 =3D "KEY_MODE"
  0x800f0433 =3D "KEY_PRESENTATION"
  0x800f0434 =3D "KEY_EJECTCD"
  0x800f043a =3D "KEY_BRIGHTNESSUP"
+0x800f043b =3D "KEY_EXIT" # Exit/Close (Alt+F4 in Windows)
  0x800f0446 =3D "KEY_TV"
  0x800f0447 =3D "KEY_AUDIO"
  0x800f0448 =3D "KEY_PVR"
  0x800f0449 =3D "KEY_CAMERA"
  0x800f044a =3D "KEY_VIDEO"
+0x800f044b =3D "KEY_ANGLE" # DVD angle
  0x800f044c =3D "KEY_LANGUAGE"
  0x800f044d =3D "KEY_TITLE"
  0x800f044e =3D "KEY_PRINT"
+0x800f044f =3D "KEY_DISPLAYTOGGLE" # Display
  0x800f0450 =3D "KEY_RADIO"
+0x800f0451 =3D "KEY_TITLE" # Title
  0x800f045a =3D "KEY_SUBTITLE"
  0x800f045b =3D "KEY_RED"
  0x800f045c =3D "KEY_GREEN"
  0x800f045d =3D "KEY_YELLOW"
  0x800f045e =3D "KEY_BLUE"
+0x800f0464 =3D "KEY_GAMES" # Xbox
  0x800f0465 =3D "KEY_POWER2"
  0x800f0469 =3D "KEY_MESSENGER"
  0x800f046e =3D "KEY_PLAYPAUSE"
--=20
2.31.0


--------------ms040303030809040001080108
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
LnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczMIIC
IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA7eaHlqHBpLbtwkJV9z8PDyJgXxPgpkOI
hkmReRwbLxpQD9xGAe72ujqGzFFh78QPgAhxKVqtGHzYeq0VJVCzhnCKRBbVX+JwIhL3ULYh
UAZrViUp952qDB6qTL5sGeJS9F69VPSR5k6pFNw7mHDTTt0voWFg2aVkG3khomzVXoieJGOi
Q4dH76paCtQbLkt59joAKz2BnwGLQ4wr09nfumJt5AKx2YxHK2XgSPslVZ4z8G00gimsfA7U
tjT/wiekY6Z0b7ksLrEcvODncHQe9VSrNRA149SE3AlkWaZM/joVei/GYfj9K5jkiReinR4m
qM353FEceLOeBhSTURpMdQ5wsXLi9DSTGBuNv4aw2Dozb/qBlkhGTvwk92mi0jAecE22Sn3A
9UfrU2p1w/uRs+TIteQ0xO0B/J2mY2caqocsS9SsriIGlQ8b0LT0o6Ob07KGtPa5/lIvMmx5
72Dv2v+vDiECByxm1Hdgjp8JtE4mdyYP6GBscJyT71NZw1zXHnFkyCbxReag9qaSR9x4CVVX
j1BDmNROCqd5NAfIXUXYTFeZ/jukQigkxXGWhEhfLBC4Ha6pwizz9fq1+wwPKcWaF9P/SZOu
BDrG30MiyCZa66G9mEtF5ZLuh4rGfKqxy4Z5Mxecuzt+MZmrSKfKGeXOeED/iuX5Z02M1o7i
MS8CAwEAAaOCAfQwggHwMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUUtiIOsifeGbt
ifN7OHCUyQICNtAwQQYIKwYBBQUHAQEENTAzMDEGCCsGAQUFBzABhiVodHRwOi8vb2NzcDA1
LmFjdGFsaXMuaXQvVkEvQVVUSC1ST09UMEUGA1UdIAQ+MDwwOgYEVR0gADAyMDAGCCsGAQUF
BwIBFiRodHRwczovL3d3dy5hY3RhbGlzLml0L2FyZWEtZG93bmxvYWQwHQYDVR0lBBYwFAYI
KwYBBQUHAwIGCCsGAQUFBwMEMIHjBgNVHR8EgdswgdgwgZaggZOggZCGgY1sZGFwOi8vbGRh
cDA1LmFjdGFsaXMuaXQvY24lM2RBY3RhbGlzJTIwQXV0aGVudGljYXRpb24lMjBSb290JTIw
Q0EsbyUzZEFjdGFsaXMlMjBTLnAuQS4lMmYwMzM1ODUyMDk2NyxjJTNkSVQ/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdDtiaW5hcnkwPaA7oDmGN2h0dHA6Ly9jcmwwNS5hY3RhbGlzLml0
L1JlcG9zaXRvcnkvQVVUSC1ST09UL2dldExhc3RDUkwwHQYDVR0OBBYEFL6XqaqEv4C/EFN9
CTL54S4yG893MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG9w0BAQsFAAOCAgEAJpvnG1kNdLMS
A+nnVfeEgIXNQsM7YRxXx6bmEt9IIrFlH1qYKeNw4NV8xtop91Rle168wghmYeCTP10FqfuK
MZsleNkI8/b3PBkZLIKOl9p2Dmz2Gc0I3WvcMbAgd/IuBtx998PJX/bBb5dMZuGV2drNmxfz
3ar6ytGYLxedfjKCD55Yv8CQcN6e9sW5OUm9TJ3kjt7Wdvd1hcw5s+7bhlND38rWFJBuzump
5xqm1NSOggOkFSlKnhSz6HUjgwBaid6Ypig9L1/TLrkmtEIpx+wpIj7WTA9JqcMMyLJ0rN6j
jpetLSGUDk3NCOpQntSy4a8+0O+SepzS/Tec1cGdSN6Ni2/A7ewQNd1Rbmb2SM2qVBlfN0e6
ZklWo9QYpNZyf0d/d3upsKabE9eNCg1S4eDnp8sJqdlaQQ7hI/UYCAgDtLIm7/J9+/S2zuwE
WtJMPcvaYIBczdjwF9uW+8NJ/Zu/JKb98971uua7OsJexPFRBzX7/PnJ2/NXcTdwudShJc/p
d9c3IRU7qw+RxRKchIczv3zEuQJMHkSSM8KM8TbOzi/0v0lU6SSyS9bpGdZZxx19Hd8Qs0cv
+R6nyt7ohttizwefkYzQ6GzwIwM9gSjH5Bf/r9Kc5/JqqpKKUGicxAGy2zKYEGB0Qo761Mcc
IyclBW9mfuNFDbTBeDEyu80xggPzMIID7wIBATCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNV
BAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFs
aXMgUy5wLkEuMSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBH
MwIQbTEHAL1+rU7GJdUMarw5eDANBglghkgBZQMEAgEFAKCCAi0wGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMzE3MjE1OTU2WjAvBgkqhkiG9w0BCQQx
IgQg1i8Y7yGpHNt2sJ/iIEUCEuXf5fT+UQRETzEJmksJ2EowbAYJKoZIhvcNAQkPMV8wXTAL
BglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBpwYJKwYBBAGCNxAEMYGZ
MIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUg
U2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhBtMQcAvX6tTsYl1QxqvDl4MIGpBgsqhkiG
9w0BCRACCzGBmaCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0JlcmdhbW8xGTAXBgNV
BAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEuMSwwKgYDVQQD
DCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMwIQbTEHAL1+rU7GJdUMarw5
eDANBgkqhkiG9w0BAQEFAASCAQA40j7XceWNZS0sHlUpa1H7NEIIF5dtroI30p/FQeyFTy7t
SIzwVoT2He6TNTDTkeBCpeTXk4/uYRX06kThckNtdgBjvT3I3sI4FZJuL+mtMG65c+rxQE+e
tAzhvz/7nNt+PhMWLLTiNHNu6re+mCAZbHQsaeBDB++8/HGTqLxzPFtnlebhsZ8iJMdZ2IoS
wizrjfMhm4pyQcMrmGjGPB2ijysgKrTz0Td9XNHMPUZgX7CQddV2APTsHj/mJe/mkBVaphVH
dxQNLI23otaGPw2XDTeHBw91NbQb9uihH6g+qigl2V8YndNQqkM50Htr+Q08sVJCTEoKAw7S
t5A7C9CQAAAAAAAA
--------------ms040303030809040001080108--
