Return-Path: <linux-media+bounces-10947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FC8BD898
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE43283E87
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C900BB640;
	Tue,  7 May 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="nptKWk1x"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A537C
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041535; cv=none; b=VoyvXq1XWctMFY58+GOBfZzP54ta+8Qf+WjM0FowBre9QHlhULtEicKLenYEl5aB/imC3s5XooZgem95WJQ3PcMFw3IjZxRYc88vV2A7SxMmuGprDgi9fHT2SyPFRJZyzTBai8Alc5IBOwUmuGET8vN5NYDw0svUlxhxxyA1dZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041535; c=relaxed/simple;
	bh=EjU7si92ubn2nOI/nwiunaQe5jl0YB4Wm2cRPHVSMP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kn9F6JQb9rIbO6yZgU4DeZrMQXkM5ZOhVQ6q5jZ+H1gDiXK5ONQwHmVkjyfQckkZga5VJMRXWdMB+ZX2fpsWD4oziB3vOsx6tq2sNYX026W+/iJZct44hoEi0vzXUIDJCBo3G0VCduVBZO9c0tZ/wp4cdEK898ciVGvH84S/x0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=nptKWk1x; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041529; x=1715646329; i=herdler@nurfuerspam.de;
	bh=a3gxFHemFYUxxJgVHcPHp5ApB6BblJkedmmGhhsf534=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nptKWk1xKNMfHHagiWNSnohxNWZXeHI/jFf0yJ1pazHSlATnXV2b5uKyuqKK6sVp
	 5jiCEfHiatFIeQqSpnL6Pi0fDa0o5YaN6vXcQW+j50pkuZBkI9IHus17zzNMLReDy
	 vUrmYA0CEVfThcJ/lBnDQQx1wo3eLA9JtDAA7GaISxcoB31zKkYAU8Erp/wDPvLE7
	 wuVztesiU9ukXPVXCioGpLKxaJfMusg059WDD+oyayxYZXI2nBQBhfHynaWwcLR8+
	 +2SxXta/bK/gq1qj95HFP6j7Tj8AkWZrgr2mYBCueuPGJ9NwxorLis8SfYWujpt3I
	 sl/mTEO+364sPXmXWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiDX-1sGQxr3zAN-00QCLI; Tue, 07
 May 2024 02:25:29 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 15/21] media: av7110: coding style fixes: comparsations
Date: Tue,  7 May 2024 02:24:54 +0200
Message-Id: <20240507002500.81867-16-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:LD3Q1mer/EWhYp82YC6Z98ufMDTVuKYCn++p6aIRWqhtYBTt47o
 NYcCCvtyhS8hR8fkl+x+EhIJKbusnuIFKirDEMNsrkPIUUz8pWHGksHDMOu4JwZydzkY15y
 SNr8qukzLocJ2J9AKh4mF8gZ4eEzl7Khosc46yWTS3Sq0xZXLSfYZ7XC2MY+jbfRz0nU9Hf
 Kbj8xfyV2x53nudSgbFaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7cJ2Uhhl1aw=;1krqXmFzpqShp92UxuHfx7szEtq
 oucuwmM0UiKITfcJSNJPxMrci1K4sKTkBIZk6JvrgGtqIaT7UDrp8chYEpoMQuseD1amtvZ9D
 t4cD2mZ6a6uEmQDjq59FEb108xlSHJHhPY0GG2XD8jA1wCNBNcsBzrFVoocrDA3kWkfXsNpss
 djyeSVCsjySUpXpZ6+SWdujnzXRaj29uv3q20VhLj5UnvRmOg/xiVTKEcX5FdZrr0drLA0UmU
 n01KLprZpGbxXNb9BMB6OrnROnxH6JpTZR2cDiOUM/6APQu0jfch2Nrc7rgATtHelFwt/pE88
 JVETVYIAUE721SXgcfvV77Pc2Q7mSK5gBWSoSlzUJxbUXYGt6+tUAeeMRRJBPSOHQMzejk2Cc
 WEoPwHN2hTgx1NPrSpHqm3NumlA6Fayv/B+bb7Bv7EmcinS2DyH6enoAmFQ9iN8q9j8wNne83
 YEWat5oh+7d4vHpU1mhvXMtPHIH4sRfZlKc05DmpjEG3K2gYHNAaX/Xts7C7NGMiRKnzrvnto
 4HMYU9+4OgzUnpqL+Zapc65Nl7TOxgAaxsc9DA/E6BZJdWLUazIl7g7Lo1tl7tntC6awAC7u9
 Kifj4UKK0lBtTirvpId6iQ3JQqF6ym/NLqNiVh+lVaC6Oo1cFjiqr6wOzOhd1HsgbW/X5acBt
 qTzvwKD2gKDua1UhcmTS1ncbJ1L1jCc0x1IPDbIyg1nBH/DiMIxLRASgGnVcBa31R9UCxuSnL
 VddG2kAypZf0ScmFcMDlJmy/9KMV/1jKIhbuAGck5q/+JhCcuUMYWA/teBMkjUs9RUarIr3LX
 FPT9DhK6vjITzplkjhOVIWmlhguXx7KiKKlmXB4cHdpTM=

This patch fixes the following checkpatch warnings:

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the =
right side of the test
CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written ...

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c     | 10 +++++-----
 drivers/staging/media/av7110/av7110_hw.c  |  2 +-
 drivers/staging/media/av7110/av7110_v4l.c |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index fac774dc6..de9476154 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -104,7 +104,7 @@ static int av7110_num;

 #define FE_FUNC_OVERRIDE(fe_func, av7110_copy, av7110_func) \
 {\
-	if (fe_func !=3D NULL) { \
+	if (fe_func) { \
 		av7110_copy =3D fe_func; \
 		fe_func =3D av7110_func; \
 	} \
@@ -159,7 +159,7 @@ static void init_av7110_av(struct av7110 *av7110)
 		/**
 		 * some special handling for the Siemens DVB-C cards...
 		 */
-	} else if (0 =3D=3D av7110_init_analog_module(av7110)) {
+	} else if (av7110_init_analog_module(av7110) =3D=3D 0) {
 		/* done. */
 	} else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
 		printk("dvb-ttpci: DVB-C w/o analog module @ card %d detected\n",
@@ -1386,7 +1386,7 @@ static void dvb_unregister(struct av7110 *av7110)
 	dvb_dmxdev_release(&av7110->dmxdev);
 	dvb_dmx_release(&av7110->demux);

-	if (av7110->fe !=3D NULL) {
+	if (av7110->fe) {
 		dvb_unregister_frontend(av7110->fe);
 		dvb_frontend_detach(av7110->fe);
 	}
@@ -1518,7 +1518,7 @@ static int get_firmware(struct av7110 *av7110)

 	/* check if the firmware is available */
 	av7110->bin_fw =3D vmalloc(fw->size);
-	if (NULL =3D=3D av7110->bin_fw) {
+	if (!av7110->bin_fw) {
 		dprintk(1, "out of memory\n");
 		release_firmware(fw);
 		return -ENOMEM;
@@ -2233,7 +2233,7 @@ static int frontend_init(struct av7110 *av7110)
 				av7110->fe->ops.tuner_ops.set_params =3D alps_bsbe1_tuner_set_params;
 				av7110->fe->tuner_priv =3D &av7110->i2c_adap;

-				if (dvb_attach(lnbp21_attach, av7110->fe, &av7110->i2c_adap, 0, 0) =
=3D=3D NULL) {
+				if (!dvb_attach(lnbp21_attach, av7110->fe, &av7110->i2c_adap, 0, 0)) =
{
 					printk("dvb-ttpci: LNBP21 not found!\n");
 					if (av7110->fe->ops.release)
 						av7110->fe->ops.release(av7110->fe);
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index 52290a500..5a4de3e3e 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -390,7 +390,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16 *buf, int length)
 		break;
 	}

-	if (type !=3D NULL) {
+	if (type) {
 		/* non-immediate COMMAND type */
 		start =3D jiffies;
 		for (;;) {
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index f19e50537..0ccc34f3d 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -128,7 +128,7 @@ static int ves1820_writereg(struct saa7146_dev *dev, u=
8 addr, u8 reg, u8 data)

 	dprintk(4, "dev: %p\n", dev);

-	if (1 !=3D i2c_transfer(&av7110->i2c_adap, &msg, 1))
+	if (i2c_transfer(&av7110->i2c_adap, &msg, 1) !=3D 1)
 		return -1;
 	return 0;
 }
@@ -140,7 +140,7 @@ static int tuner_write(struct saa7146_dev *dev, u8 add=
r, u8 data[4])

 	dprintk(4, "dev: %p\n", dev);

-	if (1 !=3D i2c_transfer(&av7110->i2c_adap, &msg, 1))
+	if (i2c_transfer(&av7110->i2c_adap, &msg, 1) !=3D 1)
 		return -1;
 	return 0;
 }
@@ -221,7 +221,7 @@ static int av7110_dvb_c_switch(struct saa7146_dev *dev=
)

 	dprintk(4, "%p\n", av7110);

-	if (0 !=3D av7110->current_input) {
+	if (av7110->current_input !=3D 0) {
 		dprintk(1, "switching to analog TV:\n");
 		adswitch =3D 1;
 		source =3D SAA7146_HPS_SOURCE_PORT_B;
@@ -409,7 +409,7 @@ static int vidioc_s_frequency(struct file *file, void =
*fh, const struct v4l2_fre
 	if (!av7110->analog_tuner_flags || av7110->current_input !=3D 1)
 		return -EINVAL;

-	if (V4L2_TUNER_ANALOG_TV !=3D f->type)
+	if (f->type !=3D V4L2_TUNER_ANALOG_TV)
 		return -EINVAL;

 	msp_writereg(av7110, MSP_WR_DSP, 0x0000, 0xffe0); /* fast mute */
=2D-
2.34.0


