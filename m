Return-Path: <linux-media+bounces-4640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C584864F
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 13:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20F51C20BC1
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 12:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497325D909;
	Sat,  3 Feb 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="FzIIViSG"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C991B17C77
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964539; cv=none; b=I5llivk7MvAXCJiOVjXOGO9UMXynvdXKX5LtZlAnaDynsEbZpJhbfEaLBzNcf1entDkf8lppDADJ1hiHegXwzki4/R3c3jmuNglUcW6FD6OXJCU/YzCVgn1CKFRRZ/Ouelaq5x/CdJohNjrvjWuTVSpZSsP5lcqzrM4vc92uwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964539; c=relaxed/simple;
	bh=yfIwFf8l8LnvVzGeMvjilsUdq7I9sIV6v2qPFcH2Ysg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HubcBsXeBUvmXWCTch6ZSCYz6q/pDjX+bB+9miZgwkwITRU0/T3lE77VUYAFXx814ExsSVVpgvClbPzK8SbpM0L6FOWZHKjD3Ry68k2pHlrL5AJ5V4I8riz5V1WLwGTNtuJNkS4DO6bHo0Fjqf62cJTWzF5/1wDhfY/j0/LZGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=FzIIViSG; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706964531; x=1707569331; i=nils.rothaug@gmx.de;
	bh=yfIwFf8l8LnvVzGeMvjilsUdq7I9sIV6v2qPFcH2Ysg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=FzIIViSGeI/mOqzQqGebz6B0KqGojxpekWL+xKhSmF+T/BJc9Yrg/PFBh59ZEvVM
	 szmU4LWJFYr/Rn173WkerD6yZRO8dDvll8fWtqnua+2dSTIpFWFU4ksuBz5RG4rNu
	 8uVOJYttSLthEM6B9kX/qpft6z3xvCmsAo16qs4SSq4Qt0cQjThcFsoKcWDe1YCf/
	 3xwBhdprdErZpU1QmHk80n4OREBz1GNi6/JzMLKUfhxnCLhzcaYGjvYnY1jXqiHK0
	 QFcU4STnholAz6KbZhbO9OoAArLKIE3yXgQ2iMBQLalgkQgatDVyYGiKmQBuRN4nV
	 dnaOE+xi99oHOTwq0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N6siz-1qy2AO2dd1-018MtU; Sat, 03
 Feb 2024 13:48:51 +0100
From: Nils Rothaug <nils.rothaug@gmx.de>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Nils Rothaug <nils.rothaug@gmx.de>
Subject: [PATCH 4/4] media: admin-guide: Update cardlists
Date: Sat,  3 Feb 2024 13:47:45 +0100
Message-Id: <20240203124745.10257-5-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203124745.10257-1-nils.rothaug@gmx.de>
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VBH1Hhf/WgFQFDrzfrb5VZLDxagZCpIG75pAplXM1fC2vlnAVGN
 LN+3WdpIfTKITjRIko4t7FVKrcz2gnDU8W2Laz+4LNgZhyvC9i7/SbouZs0rSij49gvOZ/w
 Ad0SRadgYyfUlVCkCo5FE65C5cB6Us+OUY3EU6SijoG+pqy0XrqDVIAh75WDkodh7VD09vQ
 bfa3I0YVNBgjARY1OoIUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gSwP02ckTnQ=;GEIcQfhAb0jDKAaCb0J+O4F4wCn
 32uiUdM3vDPn6tLL77S4ti5Q+4Sv/6uN2xf9wWMbvS0Sq90Y0/I1UCoBgHGwumM7UFvUJU/Z8
 LXBRbCs2fGKaJD6RUtdNuiLlvhUpKLOxk0FiEfFKfP+ZS/m3W7kjUFYl8yCZ+QDqwblknnrwZ
 pQBuqxjyhXr0XKI/IJqd7sLGYj6jAg+/ZZGITupU4AGgeHtYK3jdn8mpA8NNpUjhmcC2sCbJS
 mgQ7gl/dFYZegtzQ1XHxzJoOP00MuOBAV5yIyqEFLTQIPjChXCgqhtpNalCCzCxsc4c4W76yW
 W/7FACYOdpe6bJiIV7BEfR9PWS5xEsJHSH1oBRGILWXrO8LRi80kD2ZXng6yu6yRxJ8Cf1i1K
 YAPS9/dhjH3Z3eTiQwCeH5GhwlXDOry0GBT9/9b3k2QMUwPJKU62sNBrIhApFvBwEAjCace+d
 6B4ktMo48h6LyOY5sXike4zpeMiKTSAFNJAXbscGKgdguOJj9Vdvt8RvdOY6b/PvofRPYErTl
 4OzcAria3JZ3pvN0+L4XgTygG1SCmi+HPkp68AffrWtsZ4ipkHzbM4N1Lz7lgmpQFZUgpQVma
 JXFpnmBwlZMJvfJSiDfOlU0IBEtHXCzK7mIj4shX0VvsF3R6aQ5iMYcoY2pGSp6cXLeagpDR5
 xSNqkVRdLrYV78OIPikepRHcycR8+5PXGMsDRFtBnhmym3VE1g7hVQ+nK25pLLnAl116eaWnX
 kubVI9LJ7CfOzwwywq8+NsryS34roxV2PVJG8+6pO5AfdBlK7ZRVgZN+00Yx7OsUEXh1rgPy5
 4+IXLiCEosV5X7qj7zkOw9H5F5IlAQEXjiqTPsfaHnJys=

Add a few recently supported cards.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 Documentation/admin-guide/media/em28xx-cardlist.rst | 8 ++++++++
 Documentation/admin-guide/media/tuner-cardlist.rst  | 2 ++
 Documentation/devicetree/bindings/media/rc.yaml     | 1 +
 3 files changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documen=
tation/admin-guide/media/em28xx-cardlist.rst
index ace65718ea2..7dac07986d9 100644
=2D-- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -438,3 +438,11 @@ EM28xx cards list
      - MyGica iGrabber
      - em2860
      - 1f4d:1abe
+   * - 106
+     - Hauppauge USB QuadHD ATSC
+     - em28274
+     - 2040:846d
+   * - 107
+     - MyGica UTV3 Analog USB2.0 TV Box
+     - em2860
+     - eb1a:2860
diff --git a/Documentation/admin-guide/media/tuner-cardlist.rst b/Document=
ation/admin-guide/media/tuner-cardlist.rst
index 362617c59c5..65ecf48ddf2 100644
=2D-- a/Documentation/admin-guide/media/tuner-cardlist.rst
+++ b/Documentation/admin-guide/media/tuner-cardlist.rst
@@ -97,4 +97,6 @@ Tuner number Card name
 89           Sony BTF-PG472Z PAL/SECAM
 90           Sony BTF-PK467Z NTSC-M-JP
 91           Sony BTF-PB463Z NTSC-M
+92           Silicon Labs Si2157 tuner
+93           Tena TNF931D-DFDR1
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentati=
on/devicetree/bindings/media/rc.yaml
index 7bbe580c80f..dedc5a4b81e 100644
=2D-- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -103,6 +103,7 @@ properties:
       - rc-msi-digivox-iii
       - rc-msi-tvanywhere
       - rc-msi-tvanywhere-plus
+      - rc-mygica-utv3
       - rc-nebula
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
=2D-
2.34.1


