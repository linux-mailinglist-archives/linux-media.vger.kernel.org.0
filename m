Return-Path: <linux-media+bounces-9291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D88A46E4
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA3A3B20DFF
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A461F1BC49;
	Mon, 15 Apr 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="ji6x4mif"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0B14A84
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147880; cv=none; b=NGWelnrureMDT0xca1J1UC/jwnE3hX2txawifnSSAOw4M/JN0YM4Sr8fErpH1NPk6KWpTXb9LMiOnaicmA+ZR4A6jIlnXbPeRY3MedaKeyez1sAmbOb6Nn4YZcXusYU+YWwoS4SuG79KH0E7yCW82wvQ1Zb5Kxmvag+YI4etxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147880; c=relaxed/simple;
	bh=PTD8HhX6WLpWm2pNsJtj67zZyE9xTwIMfBXI9ek28Ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGPpVDWWc1kdPy6mLIRy+VTUlC9KivkwPW19ycXIlE1U0zRsxUA52xCbqobgo23hlrpMmfyqxSg3ezBxmqhMtXWq9ImKb/uuzNezu2DEP+LEuCx/UI+abbYe1NgwFDP39h+jhW9MTfo++2MsR187x4gBjAF/P6XBAVyXjnu0eP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=ji6x4mif; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147873; x=1713752673; i=herdler@nurfuerspam.de;
	bh=hVbeD2rs06zmPrt4W/ONBYdKouvb6RnxPdD2rIs/NDk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ji6x4mifMsB49+69luIcPCbJ+o4A8jivEjPN8HvF+tzfNhyBEaD3ggwwxpob1NU9
	 8if7011dUq8q/w9zF1uf5GZu/S3xaNOSBWWPK3sD7MZHWikS/ewFJHmVypZhmHqWP
	 0+BVT+7UKCJXqDrKtNEi16OG/gbOkwDl1fsL91gQcfV7U4Dkwwqgq0bsk6S9sLzmf
	 MLVP5boB8e5yj9SAJTyGivGXCqwTWdCSbSOaNKN6UC14h+pHW0N/JUa70sdBK8R11
	 oJuoyvsFjfc6BhwZccmw+gb+rZAMb65LWUpA96ptZld6N07vBt4GsVIujs6TjZRSk
	 RlqvQUIFK1Xb807IZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1ruX3z0TyE-002lgC; Mon, 15
 Apr 2024 04:24:33 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 07/10] media: ttpci: coding style fixes: trailing_statements
Date: Mon, 15 Apr 2024 04:24:08 +0200
Message-Id: <20240415022411.234580-8-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240415022411.234580-1-herdler@nurfuerspam.de>
References: <20240415022411.234580-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W5WXj+Izndhq3Iy2PPc1ZFY2F+UQszEkFPnXFoXxBCgcLy9h5Gh
 yXrILIkH1gg12dqJ9qg6zuPTF3DRB2ujHf/t9nEoWiweHLpYEbAaK3VT7uMmoUdBn4af23c
 aS6NZhpUMVzLVMURD8Mib011SGE4Zw1bzmNWhC62bL9Eydq/2F7v3XUPCMh8+pT1FPap76K
 t7ZcyehS+0Hhrgdco16zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QNTDb+H2qtQ=;XOyYtcMDj1Lt8nEDGUAk0O5u3Mi
 UCeN0O0dFIzDQAU3/6SqLElnGuPHENhWsAu6hw3ZVT9l6E8JcfmpYbhJs4LpkNNMkGFk/5PNQ
 Wj2h0YMfhtLg1m9jUfNzj4zI7cw9LA2qWIx1QdQrc5AsDRQDGYgiEHxpblh/u2ujPLrmVNr8b
 s3/jhXk0LdcYLKduuz0nAJZvZYR8PKvY3YAYq/TqayI9HxuTt21nhVD0ac8gokxyyFZr5+gvK
 nYtuHIIPV3orf+2DB39HoOtQqOQwHZoi1w51sCNoeQLkKzih0QL5LUu/A02AMeeARexI2TU7Q
 Tb3VvomrMhMhF/B3gVNUJVR/t6yop9q6daeJSOPUecUlgVreTHZKLIcCEVxtBsx3DOkci+vnU
 /IRjsUmfRcfLNaIynjZYCKUDTkwMZGvHkOOxAAta9zcP0csuRwvVC+IM0SRRbL/RPd0ZNoBb7
 J6C1avXHqalRq08iUFoVLFy4DK8vX79WuoLX7SJ82a8fdNfqB7ENLsI/0uu/hCah2GmmJs35w
 evLpDu0WMzotXpa4t1E6vpJDiBZfwyL3bSu1KeCJKFeMPq+7aCTh57HAcPijSenbIgTxyrI+A
 t6yCf7YLeatdcrhDKGHRVGmlTW6+0WsQOR2fF2Ka+2Pld11hja5Z1oHovITqkyD+GnyPckfZ0
 3CP/CX8I8PjJWKCVrhq3gAAnp8Cn0J8gkoNKfN/cm/yhIWmkhO9efmrJPhY6L/z4rkyxRv+/W
 xYAtG7sUxHGs4rhA31ccF+ft4pdH2E/AJwOtGmc6nf/tX0rDoV7XrCRydf3PmYYoDpNjHw6my
 noPlZbxOLgIvgQWj3yCKH8zLf3SweQL4hdx6exsmV3eG0=

This patch fixes the following checkpatch errors:

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Changes since v1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Title

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/media/pci/ttpci/budget.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 44f09b548..28a479ce0 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -213,7 +213,8 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)
 		pwr =3D 0;
 	else if (c->frequency >=3D 1100000)
 		pwr =3D 1;
-	else pwr =3D 2;
+	else
+		pwr =3D 2;

 	buf[0] =3D (div >> 8) & 0x7f;
 	buf[1] =3D div & 0xff;
@@ -225,7 +226,8 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -252,7 +254,8 @@ static int alps_tdbe2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -307,7 +310,8 @@ static int grundig_29504_401_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -337,7 +341,8 @@ static int grundig_29504_451_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -369,7 +374,8 @@ static int s5h1420_tuner_set_params(struct dvb_fronten=
d *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;

 	return 0;
 }
=2D-
2.34.0


