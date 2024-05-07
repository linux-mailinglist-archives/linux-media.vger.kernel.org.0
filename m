Return-Path: <linux-media+bounces-10951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600058BD89C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC731B23777
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B66C148;
	Tue,  7 May 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="ZKbJBGTU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1964F
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041535; cv=none; b=et1+HztmDGb9HFPp9lqDl63bsm1p/BdsC7l6HiDUi/vgSEtrUynXKi7d91h9qi8crg2FjwD77nxalhQPkNN0dHfWuTFZeL3C77lntSHVsut2OFw0WIRivIrtqnq8ikKCyDodnKb2OYEswYukR2MPM3qV1YEjQZgXbK5fppRcjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041535; c=relaxed/simple;
	bh=LaNN/PknjqydjKNNPsTzYiJPGt4QOhMA66QdgMdurls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrCE9nWEoGgEAEW0WNaSVsl0sU0q2knh4ztVG8p94+BMTYzyVDI3DmsqVztI72TL8g3zqWylHNwB+LDSHMPrP9dMs4VKrFWZ/aADTe4cz9oBzCcokyOLp7dYg58UNmvKtsPoWxV4IiBhrMs4JgyGw34F1jTVEL8Fc9G39IEhigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=ZKbJBGTU; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041529; x=1715646329; i=herdler@nurfuerspam.de;
	bh=W+nkUDSEvEFnaJ3eDxJ+5qJ/Vs37FG016keg0LXj9SM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZKbJBGTURpP4vbk7k5yEzTwQLNVacb7REDIA1ksUI3s3kx9uqbO9wq1oXDYO+g3P
	 IVOu3m+iMtWfhYhYx4cXgDA/2pqInak7wRKbofgFx1QAB/TvUB1K5FTdwHto215Dk
	 Rh2Oil1sNmvqflxJrIVzzCl8CE/2LnYiYYdkU6tmY6NeOXCsR/JeFdxmEL447JXZ+
	 SnjblLP0lxQXyTRbXMSdo3sPudi5CEnk0RFhjruzbClenU3A++EGOgWbVf7iGIPP1
	 pONIyU34RXlym/sc6+716iuRlTfsuiQTjXGJRLcR41xxXEyHLvwlyRseBk+x1Zh76
	 3HfQRPUfLMMtOH5wZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1sTp0o2ur9-00mJi4; Tue, 07
 May 2024 02:25:29 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 18/21] media: av7110: coding style fixes: miscellaneous
Date: Tue,  7 May 2024 02:24:57 +0200
Message-Id: <20240507002500.81867-19-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4a0/PcX9wBE32Kcp5OdYyKFN+RFGyk7bw7HKjIY+pZR9Hz19kR9
 a1fMGq22Wg+823lrD5InkEkNl8tEMv/ouKX+P3iMBpNVNEAXA3GGO0ryQVKKh8DA/a8VzWG
 014LuV8GuQ/Y/4+58loHFG/8zuIhT+5xfqaF8foXFruqroBzMmamLkmW3LZQZGLFjzuu7UO
 QExBZ/FcdRCry4Asv9ObQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9qpuTHPv5L8=;QZlIEIfhciWCc+NNXHdlOJ2nNg8
 nsBD4OzP54v0nT9D4b2b1PbIxca78ngXZbzpcgkVko3qjJB9Wbc293XvVdcDmQeHMBGCsf3XM
 sqVX6gOl/Tl4iMUmPzyQINlduTKKeWfYYmmWYB3sEsDtNzxJpnp4Zo2FlxX5/VudeNJkdaCG9
 9EzxEVmAtK0NReMX+0tdpwbh9QRxKTU40VUWLYOOHjJKrmQg2qtwlPSvNxDfL+8S0AB9TeCnP
 vqQMijS5HM5Sj3IIlheZsYf1xRtFLbeUq2948+RLPxbOauF7lbhmplL58FEXgCPLRLed9qBHR
 zBGOF7tyzMpn0j7SF9PDLEkrJ4PQZNs1RXfSjx4vwadtKGmTYfTtyyC9G/DerJwKKcfogTN5Z
 FZXV57iDzHIhi/BRonkF3/wSghRjeoiFMRwIaDnW21vzM1hfFJ3agQQgB8HW1QLHdSwGpBFtJ
 mwN/dgrXaQvIyd0vFssTvdeF/E6rTubNM8piUW44wR9UswfbCr9tKYfnx5E2zK5LybFx8X3/Q
 LLhHR56Uj8uYGhsfZUxr8GSfITWChnJGm3rjLhmuL1O7CE0nFCSGcR2Pf8TQzB+5tMpgjm38y
 JOkytSe+bsQ6kzy4hHNkW9pChOGzpDAz9dlLmVjzFwLrSVgQiBFsost7geyMxNZbK+xXPo3JL
 u+Okvvgc9H1ZiimVv3RN7zm9Ytx2RYtlAF+o3ye4i82XKwP4fTNsm2tTnShsVz2N35rr+RB/j
 uzJMxHmhYnnv1Zpa3xSDF1hGUOd/ki7Db/dGhSzhDmvNXp9fdtOPY+7l/Uig3+mukIL0oi2ZY
 IKLbNX7fgxAroWaXmykdj6vioUuZygjs57KkLZWkxmmIw=

This patch fixes the following checkpatch warnings:

WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fe_func' - possible side-effe=
cts?

The MACRO_ARG_REUSE isn't really fixed but marked as intentional.
The comment is visible in the checkpatch warning.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 2 +-
 drivers/staging/media/av7110/av7110_ipack.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 14c512fdf..30e2e6e65 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -108,7 +108,7 @@ static int av7110_num;
 		av7110_copy =3D fe_func; \
 		fe_func =3D av7110_func; \
 	} \
-}
+}    /* Macro argument reuse of 'fe_func' is intentional! */

 static void init_av7110_av(struct av7110 *av7110)
 {
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index c41a233e1..9631aae71 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -23,10 +23,8 @@ int av7110_ipack_init(struct ipack *p, int size,
 		      void (*func)(u8 *buf, int size, void *priv))
 {
 	p->buf =3D vmalloc(size);
-	if (!p->buf) {
-		printk(KERN_WARNING "Couldn't allocate memory for ipack\n");
+	if (!p->buf)
 		return -ENOMEM;
-	}
 	p->size =3D size;
 	p->func =3D func;
 	p->repack_subids =3D 0;
=2D-
2.34.0


