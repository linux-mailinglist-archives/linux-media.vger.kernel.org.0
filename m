Return-Path: <linux-media+bounces-50078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE16CFB350
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 23:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E657F30049C7
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E042877FC;
	Tue,  6 Jan 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=karsten.festag@gmx.de header.b="EICsIG9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7B1FE45D
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737333; cv=none; b=AX+DHztlCWLeWtcRRg46ezwIjj+jg9j97R36QzZWqa2P805gR2bU2bsEafOoUbZvSISnB5q6bkG68FtVRGNoA7YOA3ycJ0g5JC+KaSdrnosBoRwg0mr10PqclS3paPvLpWqk/vWBSd7QXSs3TNP9gG6/0gVhuM93rjOH9o6Xj4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737333; c=relaxed/simple;
	bh=7Ru1BJai7Rp9CwZyR2YPsLu9yMsrGfsjLOCcggHvzJ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TwvXWgz9YSsdisi8ukc3wMb9XkSLImLveK5HR6KlsTiejllNbvRddBNRXFMByXI71c5eFUYoIQXh4Jx2B0vp8KUBHn//pWRXBuzWu0Cl8QLK+oEe6PE4ZUgSl8z3GVfy+0zuq/gsBfdDQzFg02z6FLQBQvJtgONXcehjFkvAp4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=karsten.festag@gmx.de header.b=EICsIG9b; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767737329; x=1768342129; i=karsten.festag@gmx.de;
	bh=JiTbcbGKtsLvh8aTp3Vg6LkrdcI0C91RhkOrzcw0yB0=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EICsIG9bAyMHH8FPxPbXBVdCLzd+HBS1RzJefI79EFjtGwr9pN5lRqz162j4E0Bg
	 Ygz+CQivov033bBhQglcdfSmnl3CkTBAsf/B8s7xVKBei2Hry0BMbW0kwVdVcCZ9B
	 ZEj3QEdHpP2P40G70d/GXBwJb6/UWBzFoIEypDrxYJ5Faf5xMSlde6TwX8aTb6x4I
	 2ZNdQKHN59cpqy+0tXIz0fBRTrClWvHwNhmUB/fZsIewSHJnbxzXOxDzilm7Ql3bW
	 FugYIIe9ZwEFAikCBEiXw0OtKcUDOOUveQxqonOoqy58ksYooGWNtkoAviaLqDL3j
	 OeK2NIxiDzLbMdHCuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from delfix.localnet ([89.247.172.38]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1vWfeb0M36-00695O for
 <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 23:08:49 +0100
From: Karsten Festag <karsten.festag@gmx.de>
To: linux-media@vger.kernel.org
Subject: [PATCH dtv-scan-tables] dvb-t/de-Thueringen
Date: Tue, 06 Jan 2026 23:08:48 +0100
Message-ID: <7270313.9J7NaK4W3v@delfix>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart22431480.4csPzL39Zc"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:sizK7TXhUkCygew1OWcGE1Wmlz9h6kNASC5h0hsAKFadpjAFp4Q
 Azt9axgL4CKQ4Qf/vpd2TY75Z7wC1Xy74GKGm7S59KNwJ7L5zVAFtCUqVGgXVT4Hgkr2ko4
 V5zt4N9crS/VU9SGFqVBciCTrTPv8yDhhpCjpusGkIaR0bnesyXwScOsDvdwK+SxnFPw4CT
 /ny+2cLQXqvmP2szCFI0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/6JRXrmnugc=;np5tWUdiHUOE9k2a2yP6kYNnuux
 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

This is a multi-part message in MIME format.

--nextPart22431480.4csPzL39Zc
Content-Type: multipart/alternative; boundary="nextPart10042275.eNJFYEL58v"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart10042275.eNJFYEL58v
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi linux-media maintainers,

It's my first time I am contributing, I hope I did everything right.=20
I found some DVB-T2 stations missing after a scan.
Attached is an updated scan table for Germany-Thuringia.
I got the information from=20
https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_2025.p=
df[1]
and
https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschland-10=
0.html#sprung1[2]

Best wishes for the new year,
Karsten

=2D-------
[1] https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_20=
25.pdf
[2] https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschlan=
d-100.html#sprung1

--nextPart10042275.eNJFYEL58v
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Hi linux-media maintainers,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">It's my first time I am contributing, I hope I did everything right. </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I found some DVB-T2 stations missing after a scan.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Attached is an updated scan table for Germany-Thuringia.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I got the information from </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><a href="https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_2025.pdf">https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_2025.pdf</a></p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">and</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><a href="https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschland-100.html#sprung1">https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschland-100.html#sprung1</a></p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Best wishes for the new year,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Karsten</p>
</body>
</html>
--nextPart10042275.eNJFYEL58v--

--nextPart22431480.4csPzL39Zc
Content-Disposition: attachment;
 filename="0001-Signed-off-by-Karsten-Festag-karsten.festag-gmx.de.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="utf-8";
 name="0001-Signed-off-by-Karsten-Festag-karsten.festag-gmx.de.patch"

=46rom c0c6322ff6349877aedda935b2e6c017bb190498 Mon Sep 17 00:00:00 2001
=46rom: Karsten Festag <karsten.festag@gmx.de>
Date: Tue, 6 Jan 2026 22:53:07 +0100
Subject: [PATCH] Signed-off-by: Karsten Festag <karsten.festag@gmx.de>

dvb-t/de-Thueringen updated.
Sources:
https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_2025.pdf
https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschland-100=
=2Ehtml#sprung1
=2D--
 dvb-t/de-Thueringen | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/dvb-t/de-Thueringen b/dvb-t/de-Thueringen
index 72fa9458..aad09f86 100644
=2D-- a/dvb-t/de-Thueringen
+++ b/dvb-t/de-Thueringen
@@ -1,6 +1,10 @@
 # DVB-T Th=C3=BCringen
=2D# Created from http://www.ueberallfernsehen.de/data/senderliste.pdf
=2D[CH21: Das Erste, arte, Phoenix, EinsFestival]
+# Sources:
+# https://www.dvb-t2hd.de/files/2/DVBT2_Sendestandorte_und_Kanaele_01_2025=
=2Epdf
+# https://www.mdr.de/tv/empfang/dvb-tzwei-hd-frequenzen-mitteldeutschland-=
100.html#sprung1
+
+
+[CH21: ONE HD, ARTE, phoenix, BR Nord, hr, WDR K=C3=B6ln]
 	DELIVERY_SYSTEM =3D DVBT
 	FREQUENCY =3D 474000000
 	BANDWIDTH_HZ =3D 8000000
@@ -24,7 +28,7 @@
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=20
=2D[CH25: Das Erste, arte, Phoenix, EinsFestival]
+[CH25: ONE HD, ARTE, phoenix, BR Nord, hr, WDR K=C3=B6ln]
 	DELIVERY_SYSTEM =3D DVBT
 	FREQUENCY =3D 506000000
 	BANDWIDTH_HZ =3D 8000000
@@ -36,7 +40,7 @@
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=20
=2D[CH27: MDR-TH, rbb, hr, Bayerisches Fernsehen]
+[CH27: Das Erste, MDR, tagesschau24, rbb , NDR NDS, SWR BW]
 	DELIVERY_SYSTEM =3D DVBT
 	FREQUENCY =3D 522000000
 	BANDWIDTH_HZ =3D 8000000
@@ -48,9 +52,9 @@
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=20
=2D[CH48: MDR-TH, rbb, hr, Bayerisches Fernsehen]
+[CH28: Freenet TV 2]
 	DELIVERY_SYSTEM =3D DVBT
=2D	FREQUENCY =3D 690000000
+	FREQUENCY =3D 530000000
 	BANDWIDTH_HZ =3D 8000000
 	CODE_RATE_HP =3D 2/3
 	CODE_RATE_LP =3D NONE
@@ -60,9 +64,21 @@
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=20
=2D[CH50: ZDF, 3sat, KiKa / ZDFneo, ZDFinfo]
+[CH33: Freenet TV 2]
 	DELIVERY_SYSTEM =3D DVBT
=2D	FREQUENCY =3D 706000000
+	FREQUENCY =3D 570000000
+	BANDWIDTH_HZ =3D 8000000
+	CODE_RATE_HP =3D 2/3
+	CODE_RATE_LP =3D NONE
+	MODULATION =3D QAM/64
+	TRANSMISSION_MODE =3D 8K
+	GUARD_INTERVAL =3D 1/4
+	HIERARCHY =3D NONE
+	INVERSION =3D AUTO
+
+[CH41: ZDF, 3sat, KiKa / ZDFneo, ZDFinfo]
+	DELIVERY_SYSTEM =3D DVBT
+	FREQUENCY =3D 634000000
 	BANDWIDTH_HZ =3D 8000000
 	CODE_RATE_HP =3D 2/3
 	CODE_RATE_LP =3D NONE
@@ -72,9 +88,9 @@
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=20
=2D[CH53: Das Erste, arte, Phoenix, EinsFestival]
+[CH47: Freenet TV 3]
 	DELIVERY_SYSTEM =3D DVBT
=2D	FREQUENCY =3D 730000000
+	FREQUENCY =3D 682000000
 	BANDWIDTH_HZ =3D 8000000
 	CODE_RATE_HP =3D 2/3
 	CODE_RATE_LP =3D NONE
@@ -83,4 +99,3 @@
 	GUARD_INTERVAL =3D 1/4
 	HIERARCHY =3D NONE
 	INVERSION =3D AUTO
=2D
=2D-=20
2.52.0


--nextPart22431480.4csPzL39Zc--




