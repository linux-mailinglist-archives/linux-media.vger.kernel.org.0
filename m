Return-Path: <linux-media+bounces-10940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992B8BD891
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55172B21C83
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD8E20ED;
	Tue,  7 May 2024 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="HbSTOkUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBB8828
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041533; cv=none; b=K4AG6nDzRNfg/4T3KmwzmppUoJL85CXU8lx3oN0E+FRMR+EO6FM6cXAC/1L02k/0HspbUungg6FAOxheIc6F/S3rNE1/FZNYYNf2OUTYKuHNgx0diyaK5ZBV25ZHtHyZf32zK80Yd0pIcEkfp/axiMDk3G81tqSkDlpNd90R9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041533; c=relaxed/simple;
	bh=mAcaCbDBSwSqqFm9IRIPQohaUd6EpcA+uJ86WmyVmgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYtPPp2kEGCMiWPKd6ndbwY2e0OizKLMgMhOx2k1qkAJCgbSalHovoMRxVZTP7ZoGbRdN0ca68CVj+ybJqujjzhjzodWmuYvIQ09Z2EBIlgDe9P4RwZ9kDYxDU/kgiwj8w70NMfGw6Rn6otXFcQAXCIcVnxf0i77NyXJcov6hd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=HbSTOkUb; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041527; x=1715646327; i=herdler@nurfuerspam.de;
	bh=n4P60J14blsG6NGd+zwl2z2Wj1wWSU9jfikHqVg/5xc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HbSTOkUbaQl1pzQkIo2eB+fvZd+Oj4/wD08GxZmWCaXl7uchz82ClrCKK5EGLGm+
	 8mn85PJryrDC6svUF4YdfNl/dgaUb33lvbaftS5RPMA+OfHiw+fj318Bez0mtXBDp
	 ccfc87L6GUrQdePyKHhyFDgYWDvHwq8YiW9oYp3RNzjP7DrovjspITVLnVazpm1+d
	 EYLtXHh9EVfcnARXrtdB95hpxH6jV9ZkjajU7Ll4EGMdqVKYmmy0xrfBNxqoOOFaa
	 xpz5cXRkHuQAT/D1VGisy4lOpGiQA1dPrZmyT+oqrSWborAu0D84Ei7KQ1ONIElla
	 k0MJFbhH2f1cd3E/DQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1sCpnD2nJI-00QWnf; Tue, 07
 May 2024 02:25:27 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 10/21] media: av7110: coding style fixes: newline
Date: Tue,  7 May 2024 02:24:49 +0200
Message-Id: <20240507002500.81867-11-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:5kg04sIOdi3zO42ul+epWkqJV7FN0AwfiC1UAAZv/MAkWgsQ2uL
 a4LnuUbDYU/fJ7y/XQ0qBjRgpK0DD05d8AOzzfq4JrW/dMkQebXy0PvJEawmhFFh0ss/Eb3
 Jrt49WkXXU6z0fxvgl0zCBcqh5bbprA/xGc2JaACgqGk0tj0hlC+xYhm/2eS04EQLgxdvR2
 Nwn3ySubcvl/He4UF342g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fzycp3VQgqA=;FwsUGRS+tGqf3vXmOkz1LTQLCdg
 Ol1oY55SLqqTzISuC/m5rfnXEAUDLPYLYRlL5tEMp7cdjjKrEsQhQPBOnSBFG9qlyRs26H3Km
 vqoamZKcLjlT2m8X1tFF71+Lp/JvCe32EDzOEE5nsZhyt4u4LdzINze/ep+5+NvfD/C2fjMgr
 YoonhjiEY8j0pTzZvukq4J2UdW+mXLmsx6Rup/J3s93Zvz+NpytmlyinWP0XTZgH5SmHwgOvB
 THjU9r7sN4M+DvJAypsw6E+9Kt0revb8Xkj+AR9u/1q1K7zeY+h7Bv8J4cR8GKRMQeSIIf2Gp
 tR7X3C5rzTkKZRqpv+RjAFK6+WhNl1Qwr2pXXV3f+IUMQWrTxNXeGtys7FLWpyFUiCL92Xx/a
 a9IO3/ADSTYXdEOn+U/mjGZkGgxpN7malBhZfaLhJ+iG85EROJipxndB21Y45aRiEcLxAenET
 L04CdOLifs2rfQl3MkXMFQqL3VTItUTQRRLim48Ibs0Nmmn9fBi7DfxCQGIFvLDJdKULnml5R
 6mMI/PjTBSWl4Vs6rUPJW4LeXMo0qbmvTgUgD4NQbinvY5Gha8oW4DvTN9IIbSS8PMv+EYgcY
 3uliyvcs9z80qaPS4x03es8iziq06ee/HB27DdlLDRrExdqg20FQEJEIVxxlBKwzhDy46/dgg
 cuZHyPsdGaAqlqeEf9gji2FQONf6HoAlQSAuP1ImWd7VJH9X0Q8joRahJb1G/RVbgE7mMHuq/
 5olQGgEMs4+nj0NvjhgRwF/NbWQ0NibGNOaRJeMBF6kSMwFil0SbWNmPtjiHisyNOp5U+gXce
 I+NlDdPnh49wjqhPo0z+Sy825pJ1eDUVwJ9ZO7tmdzKSE=

This patch fixes the following checkpatch warnings:

ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
ERROR:OPEN_BRACE: open brace '{' following enum go on the same line
ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
ERROR:OPEN_BRACE: that open brace { should be on the previous line
ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previo=
us line

Newline and whitespace changes only.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c       | 22 +++++++-------
 drivers/staging/media/av7110/av7110_av.c    |  9 ++++--
 drivers/staging/media/av7110/av7110_hw.c    |  9 ++----
 drivers/staging/media/av7110/av7110_hw.h    | 13 ++++----
 drivers/staging/media/av7110/av7110_ipack.c |  8 ++---
 drivers/staging/media/av7110/av7110_v4l.c   | 12 ++++----
 drivers/staging/media/av7110/dvb_filter.c   | 33 ++++++++++++---------
 7 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 557f42352..8a4e7bd82 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -161,13 +161,11 @@ static void init_av7110_av(struct av7110 *av7110)
 		 */
 	} else if (0 =3D=3D av7110_init_analog_module(av7110)) {
 		/* done. */
-	}
-	else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
+	} else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
 		printk("dvb-ttpci: DVB-C w/o analog module @ card %d detected\n",
 			av7110->dvb_adapter.num);
 		av7110->adac_type =3D DVB_ADAC_NONE;
-	}
-	else {
+	} else {
 		av7110->adac_type =3D adac;
 		printk("dvb-ttpci: adac type set to %d @ card %d\n",
 			av7110->adac_type, av7110->dvb_adapter.num);
@@ -504,8 +502,7 @@ static void gpioirq(struct tasklet_struct *t)
 		event.type =3D VIDEO_EVENT_SIZE_CHANGED;
 		event.u.size.w =3D av7110->video_size.w;
 		event.u.size.h =3D av7110->video_size.h;
-		switch ((h_ar >> 12) & 0xf)
-		{
+		switch ((h_ar >> 12) & 0xf) {
 		case 3:
 			av7110->video_size.aspect_ratio =3D VIDEO_FORMAT_16_9;
 			event.u.size.aspect_ratio =3D VIDEO_FORMAT_16_9;
@@ -576,8 +573,8 @@ static void gpioirq(struct tasklet_struct *t)
 			len =3D av7110_pes_play(av7110->debi_virt, &av7110->aout, 2048);
 			spin_unlock(&av7110->aout.lock);
 		}
-		if (len <=3D 0 && (av7110->debitype & 0x200)
-		    &&av7110->videostate.play_state !=3D VIDEO_FREEZED) {
+		if (len <=3D 0 && (av7110->debitype & 0x200) &&
+		    av7110->videostate.play_state !=3D VIDEO_FREEZED) {
 			spin_lock(&av7110->avout.lock);
 			len =3D av7110_pes_play(av7110->debi_virt, &av7110->avout, 2048);
 			spin_unlock(&av7110->avout.lock);
@@ -874,8 +871,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *d=
vbdmxfeed)
 	}

 	if (dvbdmxfeed->pes_type < 2 && npids[0])
-		if (av7110->fe_synced)
-		{
+		if (av7110->fe_synced) {
 			ret =3D av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
 			if (ret)
 				return ret;
@@ -1823,7 +1819,8 @@ static int nexusca_stv0297_tuner_set_params(struct d=
vb_frontend *fe)
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 1);
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) =3D=3D 1)
-			if (data[0] & 0x40) break;
+			if (data[0] & 0x40)
+				break;
 		msleep(10);
 	}

@@ -1875,7 +1872,8 @@ static int grundig_29504_401_tuner_set_params(struct=
 dvb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&av7110->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&av7110->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 0b384e832..56fa1f180 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -1043,13 +1043,16 @@ static int play_iframe(struct av7110 *av7110, char=
 __user *buf, unsigned int len
 			continue;
 		}
 		switch (match++) {
-		case 2: if (c =3D=3D 0x01)
+		case 2:
+			if (c =3D=3D 0x01)
 				continue;
 			break;
-		case 3: if (c =3D=3D 0xb5)
+		case 3:
+			if (c =3D=3D 0xb5)
 				continue;
 			break;
-		case 4: if ((c & 0xf0) =3D=3D 0x10)
+		case 4:
+			if ((c & 0xf0) =3D=3D 0x10)
 				continue;
 			break;
 		}
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index d7439c522..d3aa524f6 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -440,8 +440,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16 *buf, int length)
 	if (stat & GPMQOver) {
 		printk(KERN_ERR "dvb-ttpci: %s(): GPMQOver\n", __func__);
 		return -ENOSPC;
-	}
-	else if (stat & OSDQOver) {
+	} else if (stat & OSDQOver) {
 		printk(KERN_ERR "dvb-ttpci: %s(): OSDQOver\n", __func__);
 		return -ENOSPC;
 	}
@@ -511,8 +510,7 @@ int av7110_send_ci_cmd(struct av7110 *av7110, u8 subco=
m, u8 *buf, u8 len)

 	dprintk(4, "%p\n", av7110);

-	for (i =3D 0; i < len && i < 32; i++)
-	{
+	for (i =3D 0; i < len && i < 32; i++) {
 		if (i % 2 =3D=3D 0)
 			cmd[(i / 2) + 2] =3D (u16)(buf[i]) << 8;
 		else
@@ -588,8 +586,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 		printk(KERN_ERR "%s: GPMQOver\n", __func__);
 		mutex_unlock(&av7110->dcomlock);
 		return -1;
-	}
-	else if (stat & OSDQOver) {
+	} else if (stat & OSDQOver) {
 		printk(KERN_ERR "%s: OSDQOver\n", __func__);
 		mutex_unlock(&av7110->dcomlock);
 		return -1;
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/me=
dia/av7110/av7110_hw.h
index 3aff5db56..39488c2fc 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -14,15 +14,14 @@
 #define ARM_WAIT_SHAKE (HZ/5)
 #define ARM_WAIT_OSD (HZ)

-enum av7110_bootstate
-{
+enum av7110_bootstate {
 	BOOTSTATE_BUFFER_EMPTY	=3D 0,
 	BOOTSTATE_BUFFER_FULL	=3D 1,
 	BOOTSTATE_AV7110_BOOT_COMPLETE	=3D 2
 };

-enum av7110_type_rec_play_format
-{	RP_None,
+enum av7110_type_rec_play_format {
+	RP_None,
 	AudioPES,
 	AudioMp2,
 	AudioPCM,
@@ -30,8 +29,7 @@ enum av7110_type_rec_play_format
 	AV_PES
 };

-enum av7110_osd_palette_type
-{
+enum av7110_osd_palette_type {
 	NoPalet =3D  0,	   /* No palette */
 	Pal1Bit =3D  2,	   /* 2 colors for 1 Bit Palette    */
 	Pal2Bit =3D  4,	   /* 4 colors for 2 bit palette    */
@@ -50,8 +48,7 @@ enum av7110_osd_palette_type
 #define FB_ON	SAA7146_GPIO_OUTHI  /* FastBlank on  (RGB-Mode) */
 #define FB_LOOP	SAA7146_GPIO_INPUT  /* FastBlank loop-through (PC graphic=
s ???) */

-enum av7110_video_output_mode
-{
+enum av7110_video_output_mode {
 	NO_OUT	     =3D 0,		/* disable analog output */
 	CVBS_RGB_OUT =3D 1,
 	CVBS_YC_OUT  =3D 2,
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging=
/media/av7110/av7110_ipack.c
index fc953db36..ac00bff44 100644
=2D-- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -80,8 +80,8 @@ static void send_ipack(struct ipack *p)
 		p->buf[7] =3D 0x00;
 		p->buf[8] =3D 0x00;
 		p->count =3D 9;
-		if (p->repack_subids && p->cid =3D=3D PRIVATE_STREAM1
-		    && (streamid & 0xf8) =3D=3D 0x80) {
+		if (p->repack_subids && p->cid =3D=3D PRIVATE_STREAM1 &&
+		    (streamid & 0xf8) =3D=3D 0x80) {
 			p->count +=3D 4;
 			p->buf[9] =3D streamid;
 			p->buf[10] =3D (ac3_off >> 8) & 0xff;
@@ -144,8 +144,8 @@ int av7110_ipack_instant_repack(const u8 *buf, int cou=
nt, struct ipack *p)

 	while (c < count && (p->mpeg =3D=3D 0 ||
 			     (p->mpeg =3D=3D 1 && p->found < 7) ||
-			     (p->mpeg =3D=3D 2 && p->found < 9))
-	       &&  (p->found < 5 || !p->done)) {
+			     (p->mpeg =3D=3D 2 && p->found < 9)) &&
+			     (p->found < 5 || !p->done)) {
 		switch (p->found) {
 		case 0:
 		case 1:
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index c494e940d..202a05561 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -729,13 +729,16 @@ int av7110_init_analog_module(struct av7110 *av7110)
 	} else {
 		u8 *i =3D saa7113_init_regs;

-		if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x110a) && (av7110->dev-=
>pci->subsystem_device =3D=3D 0x0000)) {
+		if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x110a) &&
+		    (av7110->dev->pci->subsystem_device =3D=3D 0x0000)) {
 			/* Fujitsu/Siemens DVB-Cable */
 			av7110->analog_tuner_flags |=3D ANALOG_TUNER_VES1820;
-		} else if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2) && (av711=
0->dev->pci->subsystem_device =3D=3D 0x0002)) {
+		} else if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2) &&
+			   (av7110->dev->pci->subsystem_device =3D=3D 0x0002)) {
 			/* Hauppauge/TT DVB-C premium */
 			av7110->analog_tuner_flags |=3D ANALOG_TUNER_VES1820;
-		} else if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2) && (av711=
0->dev->pci->subsystem_device =3D=3D 0x000A)) {
+		} else if ((av7110->dev->pci->subsystem_vendor =3D=3D 0x13c2) &&
+			   (av7110->dev->pci->subsystem_device =3D=3D 0x000A)) {
 			/* Hauppauge/TT DVB-C premium */
 			av7110->analog_tuner_flags |=3D ANALOG_TUNER_STV0297;
 		}
@@ -912,8 +915,7 @@ static int std_callback(struct saa7146_dev *dev, struc=
t saa7146_standard *std)
 	if (std->id & V4L2_STD_PAL) {
 		av7110->vidmode =3D AV7110_VIDEO_MODE_PAL;
 		av7110_set_vidmode(av7110, av7110->vidmode);
-	}
-	else if (std->id & V4L2_STD_NTSC) {
+	} else if (std->id & V4L2_STD_NTSC) {
 		av7110->vidmode =3D AV7110_VIDEO_MODE_NTSC;
 		av7110_set_vidmode(av7110, av7110->vidmode);
 	}
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/m=
edia/av7110/dvb_filter.c
index 4f1f92290..4c41682ff 100644
=2D-- a/drivers/staging/media/av7110/dvb_filter.c
+++ b/drivers/staging/media/av7110/dvb_filter.c
@@ -6,17 +6,19 @@

 static u32 freq[4] =3D {480, 441, 320, 0};

-static unsigned int ac3_bitrates[32] =3D
-    {32,40,48,56,64,80,96,112,128,160,192,224,256,320,384,448,512,576,640=
,
-     0,0,0,0,0,0,0,0,0,0,0,0,0};
-
-static u32 ac3_frames[3][32] =3D
-    {{64,80,96,112,128,160,192,224,256,320,384,448,512,640,768,896,1024,
-      1152,1280,0,0,0,0,0,0,0,0,0,0,0,0,0},
-     {69,87,104,121,139,174,208,243,278,348,417,487,557,696,835,975,1114,
-      1253,1393,0,0,0,0,0,0,0,0,0,0,0,0,0},
-     {96,120,144,168,192,240,288,336,384,480,576,672,768,960,1152,1344,
-      1536,1728,1920,0,0,0,0,0,0,0,0,0,0,0,0,0}};
+static unsigned int ac3_bitrates[32] =3D {
+	32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448,=
 512, 576, 640,
+	 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static u32 ac3_frames[3][32] =3D {
+	{64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448, 512, 640, 768,=
 896, 1024,
+	 1152, 1280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{69, 87, 104, 121, 139, 174, 208, 243, 278, 348, 417, 487, 557, 696, 835=
, 975, 1114,
+	 1253, 1393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{96, 120, 144, 168, 192, 240, 288, 336, 384, 480, 576, 672, 768, 960, 11=
52, 1344,
+	 1536, 1728, 1920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
+};

 int dvb_filter_get_ac3info(u8 *mbuf, int count, struct dvb_audio_info *ai=
, int pr)
 {
@@ -36,12 +38,14 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct=
 dvb_audio_info *ai, int p
 		}
 	}

-	if (!found) return -1;
+	if (!found)
+		return -1;
 	if (pr)
 		printk(KERN_DEBUG "Audiostream: AC3");

 	ai->off =3D c;
-	if (c+5 >=3D count) return -1;
+	if (c + 5 >=3D count)
+		return -1;

 	ai->layer =3D 0;  // 0 for AC3
 	headr =3D mbuf+c+2;
@@ -59,7 +63,8 @@ int dvb_filter_get_ac3info(u8 *mbuf, int count, struct d=
vb_audio_info *ai, int p
 		printk(KERN_CONT "  Freq: %d Hz\n", (int) ai->frequency);

 	ai->framesize =3D ac3_frames[fr][frame >> 1];
-	if ((frame & 1) &&  (fr =3D=3D 1)) ai->framesize++;
+	if ((frame & 1) && (fr =3D=3D 1))
+		ai->framesize++;
 	ai->framesize =3D ai->framesize << 1;
 	if (pr)
 		printk(KERN_DEBUG "  Framesize %d\n", (int) ai->framesize);
=2D-
2.34.0


