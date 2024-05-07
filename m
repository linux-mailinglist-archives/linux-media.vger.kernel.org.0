Return-Path: <linux-media+bounces-10955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC48BD8A0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB33E284AA5
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3622566;
	Tue,  7 May 2024 00:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="iCd+y/FQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107C622
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041537; cv=none; b=repvcWseLtkx3gPe9ZQ7UzMu/WyuaNp0Ri18mMHfNlbxc7LUEieIQOfED2ELsTf2YHG7BYIuYHsTzLwZAHKTmPUQ/dcahPaX0Hn9xdtCdYUjoVqiQ+imMxHlezAFjOZQaI18eUB2VZ2IJpFLD/7uUJxO2JTi850tBBa93TaJOj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041537; c=relaxed/simple;
	bh=JCFB7HhMvIMMGhanxN3QHo+K6mqN4gDyt1raEyy7Sd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pp9/LZNi5v63wpP8USXhE9ZGpZu3Rq7lFTB1i4BpFA46iV4m5wy46sVjdwO/qIcgm4VBK3J1DMJyx31qgV2gxKrY9HsewzIXDFuCY4YZ0f1pyxBMDkWepiqLydSRd84w4LCLX+w6qiZbUPcVshzV0Xpdpd5zX0cj/vr0h9/InEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=iCd+y/FQ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041529; x=1715646329; i=herdler@nurfuerspam.de;
	bh=hfopkUk4HidOYuCRwnz1Psnu1f4L/QvG4k5cBa+NZhU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iCd+y/FQV6e/itWBFf3JIwb9HDPCjBwcmRKk71MQ0Dn6W9O4rFD2noSXguFuy2gN
	 GtIW0cSmL7cC6VTWlFTPqa3+N68ZrPmSFs8ZqlWKjplJLgoGU93yP+TroFBZDQ11S
	 ToOEtVS3+GhaFoDD8MAbNAkajOuknARkiiWgOjWfAez7VF5kHHVI2Ee8G28bBKYji
	 3keAvAiB3Q/ME5DfBdp3Ifzsp3Kg79Rt0qwVuQPYErca4bPZwUCWAHV019Tk/AIgF
	 zGmJRUazrMy/Xw/FGwj4JfUCuVxLUVnY+6wXXcJIRGdvriZadY/qKVh7r0pA52Xoi
	 Y5eKreRUqdO8nUszHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1sg73z0pXm-016zM5; Tue, 07
 May 2024 02:25:29 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 16/21] media: av7110: coding style fixes: sizeof
Date: Tue,  7 May 2024 02:24:55 +0200
Message-Id: <20240507002500.81867-17-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:10aGrKK9do7cuFA/RaNNRhYG+GRuwIZzQ9VMKl8TBaEpcA7CUrv
 EzIhzAtlC3/AX04bM1ZV2ZCziqT7LND0kLXCiwQAARBdJfj7n8e5eY6u7w876slCB5NtYxJ
 ZFsO0DgADfYIeSoy2KZ6IhxiPsmjQKjuQGwzjNjv+FbXFVOcwQSdaHd9ihg05SAWJ6iFlGB
 Fadsd28biS/qTbF++F6pQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mo3gkYAHw1g=;1s7VaveNkYVzNjo1VsZOqmEMqP8
 PWE66+e6e1t01fFhctbYmjygXc64491Gh8FUFUz84fGqgAo04b9bOEQhTnhlFLYklycDnxAEd
 +oIQDvXfLoNTWbGJDCZY74IYxVwP23XGYwX9BE6dO6vyqJ7aaGeo07rQth63gct3GTkL9JKC4
 UG8vCWRh1P1noAyPmgtDqhtSaf8AbsQ6JZLZ0XEzDxI0s4oMVgUmPqbxSetD10Io6W4WbAVEr
 Kch5VV/2M6MhoWZSQoFI4oeb1HBvpdFb7QD1PwMPjIN0TCgMu2w0FKkplEilmIMSYY2yR+JN6
 JVF3egX/OQUOpUgfvgmY+pnyYo6ECyDtJbynenJ/cKnfprKWkb0ozB/4PCOSOqKnJj3o/i6j5
 qnDvzEs0uLXAMolRM1tvon2/K8EeTlLZdt1PviKqVqcysHkB+toFrOOxnXPlEZm6lKgokg40H
 q62572XSqGV9uT2ST3QCmnxVbsE1DBETD+GVfqQLvWg+rSWsaHQGB1pSsqbhLXuIcmYlOaPe8
 3jC1BR+eBxIl9IARX0VLHyO5AYrIzuKGa/WFrDGV2jaF3aucSGjIv5Twe0oc4iFHvJSM6Ujpd
 wUsg+CnvXH14uIKWOGtlD4qDYKkfJVjR489BjEeB9g6FLFwr2DvRGmrLNZWuavOQZ1ECs9TZh
 fDICWI65Mdcn0aRtCt46nP9GLf06LOxpxRsZpeLevOt6BSqCllvQm1F6ItHQcKI3WHYgoSPry
 PnC5ncCdFuIE1TIxwyRtYTVaCI6KF5xLX9XG1HZtugsJtxcAdgZLsIBYt/fR/KIVvUnkSmQ+5
 uqTSyC46O/xMfhFp0qQ5G8DrFkwugj02wQ5JUZl7pVWWM=

This patch fixes the following checkpatch warnings:

WARNING:SIZEOF_PARENTHESIS: sizeof d should be sizeof(d)
WARNING:SIZEOF_PARENTHESIS: sizeof f->fmt.sliced should be sizeof(f->fmt.s=
liced)
WARNING:CONST_STRUCT: struct dvb_frontend_ops should normally be const
CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*av7110)...) over kzalloc=
(sizeof(struct av7110)...)

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c     | 2 +-
 drivers/staging/media/av7110/av7110_v4l.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index de9476154..42b5d049e 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2437,7 +2437,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 	}

 	/* prepare the av7110 device struct */
-	av7110 =3D kzalloc(sizeof(struct av7110), GFP_KERNEL);
+	av7110 =3D kzalloc(sizeof(*av7110), GFP_KERNEL);
 	if (!av7110) {
 		dprintk(1, "out of memory\n");
 		return -ENOMEM;
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index 0ccc34f3d..d13f1afec 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -557,7 +557,7 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *fi=
le, void *fh,
 	dprintk(2, "VIDIOC_G_FMT:\n");
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
 		return -EINVAL;
-	memset(&f->fmt.sliced, 0, sizeof f->fmt.sliced);
+	memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
 	if (av7110->wssMode) {
 		f->fmt.sliced.service_set =3D V4L2_SLICED_WSS_625;
 		f->fmt.sliced.service_lines[0][23] =3D V4L2_SLICED_WSS_625;
@@ -618,7 +618,7 @@ static ssize_t av7110_vbi_write(struct file *file, con=
st char __user *data, size
 	int rc;

 	dprintk(2, "%s\n", __func__);
-	if (FW_VERSION(av7110->arm_app) < 0x2623 || !av7110->wssMode || count !=
=3D sizeof d)
+	if (FW_VERSION(av7110->arm_app) < 0x2623 || !av7110->wssMode || count !=
=3D sizeof(d))
 		return -EINVAL;
 	if (copy_from_user(&d, data, count))
 		return -EFAULT;
=2D-
2.34.0


