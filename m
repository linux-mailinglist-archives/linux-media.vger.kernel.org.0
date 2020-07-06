Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DFF21619A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 00:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgGFWas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 18:30:48 -0400
Received: from 93-103-235-126.static.t-2.net ([93.103.235.126]:44373 "EHLO
        sijanec.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgGFWar (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jul 2020 18:30:47 -0400
X-Greylist: delayed 513 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 18:30:47 EDT
Received: from [172.20.10.10] (188-230-129-82.dynamic.t-2.net [188.230.129.82])
        by sijanec.eu (Postfix) with ESMTPSA id 55CBB3C6CA0
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 00:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sijanec.eu; s=mail;
        t=1594074130; bh=vx9+wIlJvArLKvbMrykZUYXkNuNYeYRv9RS56eU7Zy8=;
        h=To:From:Subject:Date:From;
        b=fvoa93UpNL5JBFfQcgl/BaNpMqNYeO6st3JhWQybMWV7sc/px5j58i2zMeN+yWxxO
         t4mcQIvldUoMNWN10o0IPO3oWSyLeo/98sOqvL8GPwxTus6QqjHNT9SHHz0apSxg/n
         h4xDxMzKCgRQtD+qy0pvOX+mCRJAQJY+BYXTOx1C7S/cuzGxOLDKlGAXfUUAWucsut
         SjTOQ7FDRccxAn2CWsAOEXq/GG9F3s9QeZ1HZ14riXrd/WF9RTh8xSyCEJKn56zYLQ
         VU7zCkHVb3rfvHaY7JKI1TwAAvicu/AOaC3DeDWghzyp1VmE7gwA76RsGuQi6O1wGN
         UsnwUriSs3aGg==
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Anton_Luka_=c5=a0ijanec?= <anton@sijanec.eu>
Subject: Commit to dtv-scan-tables (add table for Slovenia: center @ dvb-t)
Autocrypt: addr=anton@sijanec.eu; keydata=
 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
Message-ID: <e55a5774-9f4d-c8c1-d9ca-870788294f42@sijanec.eu>
Date:   Tue, 7 Jul 2020 00:22:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------AD6C05314EADB53D6FDC36D8"
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------AD6C05314EADB53D6FDC36D8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello!

I have fixed the dtv-scan-tables/dvb-t/si-Ljubljana file for new
frequences in the center region.

See my patch below and regards, sijanec.

Signed-off-by: Anton Luka Šijanec <anton@sijanec.eu>
diff --git a/dvb-t/si-Ljubljana b/dvb-t/si-Ljubljana
index e1d3e8b..37b6d98 100644
--- a/dvb-t/si-Ljubljana
+++ b/dvb-t/si-Ljubljana
@@ -1,6 +1,8 @@
-# Slovenia / Ljubljana
+# Slovenia / Ljubljana - center
 # MULTIPLEX A
 #------------------------------------------
+# i believe this is the old specification. keeping in case I am wrong.
+# po mojem so to stare frekvence. puščam notri v kolikor nimam prav.
 [CHANNEL]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 602000000
@@ -25,3 +27,38 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO

+# Slovenia / Ljubljana - center
+# reference: https://dvb-t.svetidej.com/drzave/slovenija.html
+
+# MULTIPLEX A - national stations:
+#   SLO 1 HD, SLO 2 HD, SLO 3 HD, TV Maribor, TV Koper, Vaš kanal
+
+[CHANNEL]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 562000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = 2/3
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = 8K
+	GUARD_INTERVAL = 1/8
+	HIERARCHY = NONE
+	INVERSION = AUTO
+
+
+# MULTIPLEX C - commercial stations:
+#   TV3 Medias, Golica TV, Nora24TV
+
+[CHANNEL]
+	DELIVERY_SYSTEM = DVBT
+	FREQUENCY = 610000000
+	BANDWIDTH_HZ = 8000000
+	CODE_RATE_HP = 2/3
+	CODE_RATE_LP = NONE
+	MODULATION = QAM/64
+	TRANSMISSION_MODE = 8K
+	GUARD_INTERVAL = 1/8
+	HIERARCHY = NONE
+	INVERSION = AUTO
+
+

--------------AD6C05314EADB53D6FDC36D8
Content-Type: application/pgp-keys;
 name="0xE76135F49802CD14.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0xE76135F49802CD14.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQINBF6HFDIBEAC2BVGe1e+6zLc1BG7lIzZo55HhCLQVvA+ywTES5rF3EIJ+HzeY
sq7UalWW6n8yDWteUH4j2h+KJ6uxor27kDVwimpMPgqolcasEN3FrUt1IL2HtjI/
9+d9Oi5WlYTE/gk1YQU6Shq1rsyNbiSg2PLwHAaeOnZ8QRv3l95mXer5e0EIPSvU
MJfVCyr1Z/W30XX5/iL1t/I9oacqRXGns15DXPF+qeNm2nlkoCyrGsgvQE8Z1alG
ePVdaa0i7Um1szCS8Y78akkIcfTUXWt25gtVQMlVSp6qgDKMulOgg5WqKRdXVF13
9mjb7RVc/dHsUU09T9KoqEbFjzxRMcHkBQDHGiOIzpbF5BxWi3m6pWQ9cHg1wFUy
DgvAO4mMGh7SWmkHpEV6c3yiX9dah+jcKnLcnjW6CCwPnC0P5iBitQfA0FHeUfP/
7YlVW4mOAtF2Az7fDE49DbB8Ia4RJfIviyyL47E3R9cBFm+DmsE8znsg56PJNati
7S+sdE1j+jJXDt+tSSbvmj7Fywmyuq8yx7s997/ZKMhJErP3y+kDT3rGEo2TeLgs
7kmRdYryiFJAnpL6ysVp225dtsNBgLxrJTM8Zfu/AkuepNTI4uXUr92gA2qRVlXQ
Dg9ktzK2KJPkwjMDQVGh2ueDQK1+2XnM3IQRb7xfWr0eTZWCToimqK8wxwARAQAB
tCZBbnRvbiBMdWthIMWgaWphbmVjIDxhbnRvbkBzaWphbmVjLmV1PokCVAQTAQgA
PhYhBPTD46TftyVDl6n5k+dhNfSYAs0UBQJehxQyAhsDBQkFo5qABQsJCAcDBRUK
CQgLBRYCAwEAAh4BAheAAAoJEOdhNfSYAs0UED4P/3CaB+OurTLuogaIwDMCW2mZ
YypTzoKuB/yCggjOhFEpTBJkRY45U44qr46KhaYRaOhgrG6HdKRJ3A8Qngb5LodN
GhixMfTiUCySKlzyxpJyDEP1YmoRom+DQGlsVe9/3SY18gsFTioCDxIlXD3omHRv
ZVBnMa+QU5D/3DVfTN5devQp4ILyBXKcisU/4yh9CBmnGEs+W0hbiOYP607pmLP1
Mq0xjshPqp3u2a+NUbAuW7sv9dp7LSM6AMDRZuWNnD7ISFHpiETURBmMtqczx21u
BAz28A5+SWegvnoC+toPY6uIpIKLW7UouOmGaJlURSfcjiD4avniCCZKrv8Dslf9
eNXqtHQTBK37Bq/rb1X8rVd0FgiA8dmdiz/I/Tn0WqzPuKJWt0b/qN9lLXG62mIz
TotmlpkUeeIoqoK2lHP0tey7V0Yoc8Wui+0tIpTQbR6ItrJ5mM0ymM7fWLm0nnZA
H/VkpSkdJL8uEjPaeCqnRRcF359pV03zEuWFw48d9S/jYupSEA5jc5fQQxY8xVXA
C/zp+Eh4kEA1vLRAE+CtZ0S5NHw937lkiZDWA/nD08E4ziVDQSZmWbef9dHb0v92
ulRIkdakHSWly1yPBv6uKPaTrsFf3uqRhlZ1W23PlB3RjJFzfRwwR7ayc5DsGfpy
EhbA/DEDJGogL61hSNE3uQINBF6HFDIBEADDiFM71lhWAz184ed1M9BvZhCxh9Ja
Cp+Qpvsw+NHNhbKdl2BtfHGFqD2XpWszPHEYp7x8txlJA6DAn6ApXUU+23edRgzl
Z7rEbmCsWH0ePO8I0xwITUUoFhBcOeXWQ04cndZIqo+rrLh+yKolt2+FpgXMan8c
h+rzNrIkjkz52hdfmHGw/GwDWj2265TAtDUXiIlk7bGnRUFcmVNmHiGOGEiWtryM
fJmzEZELDbX6HoN6uu7JUxaajJIfNQmS3MIGsvuq5rzDj8bCcgneoTCZ9FC6pO11
XNyJsq57hCvJ+91mxdQLDfDgp1jdVadudHU0bLcRMFXnKD2NULV5wBxz3zDGPZAf
ln9oZCi/WrUEoTJeakWGEmEIYWH0XoQrns3nMp283g2evFedWKHpRWrQI3Gy7BXD
fgg2adExLiS4U3Ik705RGnICm7jsHf8+mqea73Q4Y+ZDoymS8rvO4Ka2TEtJbvGx
0yQZCxRFL/W9dJeElYvkf/LckVzNScJSGAyv44jTBuA33GDx8zcBomFh/f044aTA
jhqEvXc6fpii00yUod0J+pUXGus1T7wuZklipE5H+gQgDM2HBje+VmAo5CwKFeu1
2oT4YFZDdqwZvqjmmYhsHvHEpE6tV0/bwiW1XIij1lAxrTxryfWkGmqU7ID846Ue
4+spuXmsmpxS/wARAQABiQI8BBgBCAAmFiEE9MPjpN+3JUOXqfmT52E19JgCzRQF
Al6HFDICGwwFCQWjmoAACgkQ52E19JgCzRRFaxAAjlqNiQxqqqQhfxl3YduqWFne
z131+nohnPYAkIKrC5BF5Bes+DUhYi9RA7tASIwaDbjjj0Qjs1tj/DPDf5rE/F++
8yygVX/Gqk/9+uqseGZgg6azGIvuxtbFoA1worH6K5OwSUgq9J6e4cVnEpj8nyxA
BsIj76xVCJjxDyRhj/TH5mjq4dUgVJfY7adLfK90pJDu0S0+ROxhFQMqcwrGU3gh
c14re3wys9YazO+gnv2QBv8o8n5FH9nmXEzC7I5b761mu7yPi8huNKDsz9DgT6nN
D5HOJawR3SlFhNdM7sLLWuIdq8ljVbvlkVJvKObck59xurC6dXeqe5k2xWyGpFQx
y4odXSEUNIzbdHP0KH468wbhwQBm8WgjSsq2sUwphyrU/IEy4syVFWR/RRSuRVw5
5jdGX+BAHg1mjBppHHpcuSAjUD5odXrXLaYzTSCbGdWT9EoicsieKWYl9MQdttjw
3WI4kVyiwByr5ds6pcEafAm6av+NlKx5bYI61QI9Wm41fQYlwlKjxK4++aQENRJm
oif7MWkdxY1ByfshS/iiuxmnOkLQ7Tx97IDO9eeZt1ROEjsOR4qs27UKpjetSMJa
Fri0FaXWWnnPUMUwpd5n2MIUD+6Nr+hzoW5FCI4rxKE/ArtFrp30kYrKEZGMx6sw
mS3dmLalBRwejsg/asu5Ag0EXocVfwEQALG4lovWs1ldikAboODZGubn/nwMy/4t
PvFVTOFT7tVAkSO64WlfRv5qPZFkicNIiztCD8PiUnDkQKxmnt4gYUCRwYqR87bj
mLuk7AUW3FTOSHiTvmZbr1hU3kHCqJYAz9h641CnS58e8Wemlc7RN3GpsPr/LR4S
5gRhUrxTp1xXHdWEgKgag1h7PMj9E+Kphbb35Xpbcbg1lMKpp3fXBl4I0Ggo5xUH
HEmMRuriKLI8iJNNBVUXrfEAZ28h/gTEIptQ9IG+De+SqigG2KBRssObNIv+ckeN
vkxi9COq3CX5YQ+k4TB9mgxGWAKzsrbuW5e/Uw6HiOR9d6MKJ7IjEW9wb2OTA5uE
b9HR75nuxk7EyxZ2gJ7x4zTHyqcvyWggOi+K8vgx9AavrbTjR6sR1ZSigaEM8L9+
3RPGP3MK7KWLvACG3G+NrKqJsdbMRRSZw9uHX9toGSGuSnuPmiszGvglVgNJiX7o
/1mTwkuSdsGrU2oC0q9kw1W3shAL9xn7kIbO6Mn67buThR9lq33+2+p//iKvf9g2
Kq9PLs0EvJK6Cg2It1E7ZS2i9S7M1iYkqMuoDYVQGc1QhOZH7xRMKCwO1kJjIZfg
cu+5qLKJjdj6HwJjFrEEOkQr7fvWasHBXm5k2Nj4JLNAPZW87lXBvPnp4qvW6TeY
PLA2HfL97SQFABEBAAGJBHIEGAEIACYWIQT0w+Ok37clQ5ep+ZPnYTX0mALNFAUC
XocVfwIbAgUJAeEzgAJACRDnYTX0mALNFMF0IAQZAQgAHRYhBLU+7io83Ju1vggj
OkA2hPAp1mkRBQJehxV/AAoJEEA2hPAp1mkRWG4P/2M6DX0SCz2ubNMXOd0ROdG3
GCCtzl07vG9EUzTh8npRpUP7kQQaixVekvjoGLtU6DWMuzR9zfs17bEkY6BTkME0
GI9tMhGKV7MblkWAJyZ973JgV1rPNyZh2asCg/0UeapTdeoPfLSfAJqF0srsKFf2
cpW5MQthRzq6VqD1fkUJBmWsHB7spe8nRLAgOOGvovMABl+zpaZIQQLXYP0IZo32
2HxA0a90wYYu0Io8nyyx9iCaoZyJ6ISDzRWGEG2ZH6UJpPn0OcSF9nJ4FQMyGVn6
j6nZD07hHCzIo9uSc9CkBmi06eylcw1ft+rAJNmEMtKJdn1AL0+RGTMTEQgiBf9H
SSuTLbkHOAp0B5OIkBXN54RwdP2hRueE7MtC89rZT/tBlc2jrl9QPenG8FzCCuIS
PnqVlgq9k6rvZRT67Wwfhn0kAfrgOcmGVuAZ15gMOkP3bxi5BIozGenAZ7S5qEDs
i3p/RbdAbIqu48dG47a3IwX/usmPfM3ZmT2VreueglEB7GXZG0hDT+XuhVqfna9I
F0AEW5/Lo89/vDKBaGRVdMeOy7edZPKMxK/vVIWTas8aXLlfhp+TSmctjzGc5R6/
IKDNR2TPfTUFc/ZAN+ulJRguK5honhv6bFC4ujVng3dWYcsvJfDNzPYQ2/aRslvR
YAe12OI9U5eOjo+6goER7zoQAIWiGq0ljNSo4t9YIeH46yOMrViD+RAy41zrci6r
pJCxACj1PVNL9Rm+lrPhO+kYQVjYfStoGANGqP4jUUdNObs8cT8drewjEXkGNBIH
zKsBWIqaZjupP1sg/aTHVQ08MU70w8U8+G+ykCnfSivqBeFH4L1MxAaTSzYLn/x8
ZJdJjyCBvJIWZMpt4x1T8xAWMBxG8haPLnzy2r20axrWBApRdZ6ZVh+SJDm8nlY4
ubWodfOw0CbXp1ZYgrff09XuR7YCSdzgFakUah0YcHVxsxRcZAb614Xw5RFcszgw
Uqk253OGnJsmL5HBFzIMRbvSuHoNW3DFsswcMhkD/DlKHc0zwRmn1jAJGQVvPbIl
yUPruR5U6O0txAIsMI/YdEB/mzRaiPF3Pj9ki9Kk3srO2CnQb4IohA/iAEZlP9ju
wBpmF81cdYKSCkyPvf50fLjKu+ivELKtkSbsyJNJWl6TJokLC0e3yi9sjUr5R1j1
KjO7IQbl7b/4dpq8/fkTmK0KNp8PYXLsv5I7mq+3egJxUfJftShT6z4FSMHA6RRK
C6HVKCox8JyEDjFPTtQLnsRp6W1eeRnkq0EU1gx/pVwV6vfo6I4dG1A2aBL1U9e1
lN/ROIs0e28QhI3kyc85Z08J4Os57RuskzY7QuHlvMhRQXwIqg90stl2GB7Nwte+
Fkle
=3Dm9KV
-----END PGP PUBLIC KEY BLOCK-----

--------------AD6C05314EADB53D6FDC36D8--
