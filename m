Return-Path: <linux-media+bounces-10939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505068BD890
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F231F23424
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B2915CB;
	Tue,  7 May 2024 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="IkkBsrzW"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1738821
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041533; cv=none; b=gY71RHeC1kk/Nq9Yg+RyTFq1MaUK0oAJRIegXN8qXT2bp2bRLO2H1HgB2s73JmzGYkzB+2XlCEOrqPuYfqUn7covL5rIXryHth+xN8KH4GKr9V5uhJ4ud6KsZAMpmeU82t0rTAjNIPRKr1x821rM08zpAx5/t3R/8oQ5ndHCe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041533; c=relaxed/simple;
	bh=1VgQ5/c0GyioLTIkmmvradVzu0JrLchrEFe4tvP5GwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ItbltFXqbLaFrOp8/IoXFWsF+MnkbiYzJ+Xk3YIEJyPxQouv4BObsCv4b1/zRDVjzS/vsWbHIwrpGLHz84+7w5PvrFsEIMVkhJKcbsLlzpYb+t+GU2Ukyx6/NOx/5SUL57aUdUoZgH4dDRlgOHLsr0xdh8AZ7LOJWaNv9aOPLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=IkkBsrzW; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041526; x=1715646326; i=herdler@nurfuerspam.de;
	bh=vNhcPL96xktsfWccEwGOIYlZcf27bGWM1fvPq5jb2tg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IkkBsrzW0ObbxMMEE+Qsy2g5ueCzp4oVq+fArAFQ+EZl8uHcTNoAdUK0lcURX3Jx
	 aKvVdxAu++CpDdw3TNX9b+G13lmHlS0wrLX1XQ3V0eSgsUoPo6loGJbg1lS9RVE94
	 4lIgS6tsJh9lgeaEpgm/6t8+5pc0KuoWAc6VaVlYjH2RSm3qYvG0z1WcIa2Ov9ooq
	 WfLqerNKQOXCjrhKyyFdssrAMhAmSFTiMGfkcPZboH93iOROIREalZJ9vhRb0/rwe
	 FmqLscnRNgdYf0ibVlUKPgZLwni4DdBTB9HAhZtpBPrDF/t2qrvCdSwlLjkHy6EaM
	 g0aTEeCmgsGXKIoZog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1sdke52d3z-00aBgS; Tue, 07
 May 2024 02:25:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 06/21] media: sp8870: coding style fixes: logging
Date: Tue,  7 May 2024 02:24:45 +0200
Message-Id: <20240507002500.81867-7-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:KhfzQF8ambVLRhiZ9CGPtg40t2ekIUiSyE8BeLQEITXMD6kJVh1
 hmE64e+stop8SBwuk9OjmrlSVDlh3R+A38p7bKpxsSVDYKCuX+rXmm38sANv8tw6b2hRkds
 ot0YGfiCAt+y/nXiJdqa7R1RHvsl31aw1t9GnUnVq6cxJqzr5WQMTyFgbqGU+BM19TkRTCg
 qsGqxAX6Grb24UI4PWfrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VOh9T0mKnDg=;GrgO9HLumjXH+LitODRP02Jzis3
 RIgZTZgOtXdQt0L0bCvvuguOJMu2GKJ+ti6m7FboGoN26oJ/4PHoGmnByJUQq+LyIQaQ92scx
 obISjcOOsITqV3AjEZ7AgdFbCgC/iQq5i7szh8Msy31cElaJ84AjeYYCE02yY2qCETBEA58A/
 GK8v6QX9DGEBsMx6T+L7fGcS59DcjJXN8efuurD4O5PxKXVmDqXvQEMR9mSpi0fEnwlADFgDG
 8UwGcY1Mjtfuf6ne5ZIEIW+oR50oIRehn9fVeaTKN7zg3zaP+GLeyNFOhaKVaD2QvM5ydzxPc
 CKw9jXfj1yn96Nf6XnQbk38G+QewzY0Hk6/8YhD7QunJNBOCnghUzl1iLcxM0ER2DfR9ww3hB
 oqbccTBwDqiu6Lmf5dM9NbKclof/4ToxycYePfToh1R/ZetFEXpq61rL5TqPmQ1mHUGZHbN3j
 4b5USz1jWOgBTk94689f9A5ZSEKCshF7pUWr1/5dvwEQZxWNtxndT6QtV2K9Ceu4VWA8S/Xgi
 s3j8yEh/USFtTHVHKon7nF8+z6Xg4k0+YeT9Ejy+6CZY0dW3hQC5QxuHrew2i5c9nlgyh1Qss
 v1FkczCKI99gYszgh2vsTvdiLkB37ZVe5iqqFDurAYqAxhN8xl01hcydj+WTx9+uT+mCwLgES
 kmSKv1IgbS6THh4QU6RbK4iP4izjtU1pOZcvynMTIHwDVQxR7BmAtUjJ70o6K6mfcHtvf9WZT
 OjS9SDMxyfJRHBHQRl5IMITh1Kh30GB9yiQriG0X7eiaZ2czFGEQUGEint1FWngHMP/+SLGIW
 PT+1m1HdlS2Y3dMH8oAg2CV27DRdOBD9lU7OwESHH3LfA=

This patch fixes the following checkpatch warnings:

WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_dbg([subsystem]dev,=
 ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> fa=
cility level
WARNING:TRACING_LOGGING: Unnecessary ftrace-like logging - prefer using ft=
race
ERROR:TRAILING_STATEMENTS: trailing statements should be on next line

Convert logging to the recommend pr_* macros.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/sp8870.c | 46 +++++++++++++++------------
 drivers/staging/media/av7110/sp8870.h |  2 +-
 2 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media=
/av7110/sp8870.c
index 282beb157..0c813860f 100644
=2D-- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -11,6 +11,12 @@
  * download/extract it, and then copy it to /usr/lib/hotplug/firmware
  * or /lib/firmware (depending on configuration of firmware hotplug).
  */
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #define SP8870_DEFAULT_FIRMWARE "dvb-fe-sp8870.fw"

 #include <linux/init.h>
@@ -36,9 +42,10 @@ struct sp8870_state {
 };

 static int debug;
-#define dprintk(args...) \
+#define dprintk(fmt, arg...) \
 	do { \
-		if (debug) printk(KERN_DEBUG "sp8870: " args); \
+		if (debug) \
+			pr_info("%s(): " fmt, __func__, ##arg); \
 	} while (0)

 /* firmware size for sp8870 */
@@ -61,7 +68,7 @@ static int sp8870_writereg(struct sp8870_state *state, u=
16 reg, u16 data)

 	err =3D i2c_transfer(state->i2c, &msg, 1);
 	if (err !=3D 1) {
-		dprintk ("%s: writereg error (err =3D=3D %i, reg =3D=3D 0x%02x, data =
=3D=3D 0x%02x)\n", __func__, err, reg, data);
+		dprintk("writereg error (err =3D=3D %i, reg =3D=3D 0x%02x, data =3D=3D =
0x%02x)\n", err, reg, data);
 		return -EREMOTEIO;
 	}

@@ -81,7 +88,7 @@ static int sp8870_readreg(struct sp8870_state *state, u1=
6 reg)
 	ret =3D i2c_transfer(state->i2c, msg, 2);

 	if (ret !=3D 2) {
-		dprintk("%s: readreg error (ret =3D=3D %i)\n", __func__, ret);
+		dprintk("readreg error (ret =3D=3D %i)\n", ret);
 		return -1;
 	}

@@ -97,7 +104,7 @@ static int sp8870_firmware_upload(struct sp8870_state *=
state, const struct firmw
 	int tx_len;
 	int err =3D 0;

-	dprintk ("%s: ...\n", __func__);
+	dprintk("start firmware upload...\n");

 	if (fw->size < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET)
 		return -EINVAL;
@@ -126,14 +133,14 @@ static int sp8870_firmware_upload(struct sp8870_stat=
e *state, const struct firmw
 		msg.len =3D tx_len + 2;
 		err =3D i2c_transfer(state->i2c, &msg, 1);
 		if (err !=3D 1) {
-			printk("%s: firmware upload failed!\n", __func__);
-			printk ("%s: i2c error (err =3D=3D %i)\n", __func__, err);
+			pr_err("%s(): firmware upload failed!\n", __func__);
+			pr_err("%s(): i2c error (err =3D=3D %i)\n", __func__, err);
 			return err;
 		}
 		fw_pos +=3D tx_len;
 	}

-	dprintk ("%s: done!\n", __func__);
+	dprintk("firmware upload successful!\n");
 	return 0;
 };

@@ -310,22 +317,22 @@ static int sp8870_init(struct dvb_frontend *fe)
 		return 0;
 	state->initialised =3D 1;

-	dprintk ("%s\n", __func__);
+	dprintk("initialising frontend...\n");

 	/* request the firmware, this will block until someone uploads it */
-	printk("sp8870: waiting for firmware upload (%s)...\n", SP8870_DEFAULT_F=
IRMWARE);
+	pr_info("waiting for firmware upload (%s)...\n", SP8870_DEFAULT_FIRMWARE=
);
 	if (state->config->request_firmware(fe, &fw, SP8870_DEFAULT_FIRMWARE)) {
-		printk("sp8870: no firmware upload (timeout or file not found?)\n");
+		pr_err("no firmware upload (timeout or file not found?)\n");
 		return -EIO;
 	}

 	if (sp8870_firmware_upload(state, fw)) {
-		printk("sp8870: writing firmware to device failed\n");
+		pr_err("writing firmware to device failed\n");
 		release_firmware(fw);
 		return -EIO;
 	}
 	release_firmware(fw);
-	printk("sp8870: firmware upload complete\n");
+	pr_info("firmware upload complete\n");

 	/* enable TS output and interface pins */
 	sp8870_writereg(state, 0xc18, 0x00d);
@@ -475,7 +482,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe=
)
 	int trials =3D 0;
 	int check_count =3D 0;

-	dprintk("%s: frequency =3D %i\n", __func__, p->frequency);
+	dprintk("frequency =3D %i\n", p->frequency);

 	for (trials =3D 1; trials <=3D MAXTRIALS; trials++) {
 		err =3D sp8870_set_frontend_parameters(fe);
@@ -486,8 +493,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe=
)
 //			valid =3D ((sp8870_readreg(i2c, 0x0200) & 4) =3D=3D 0);
 			valid =3D sp8870_read_data_valid_signal(state);
 			if (valid) {
-				dprintk("%s: delay =3D %i usec\n",
-					__func__, check_count * 10);
+				dprintk("delay =3D %i usec\n", check_count * 10);
 				break;
 			}
 			udelay(10);
@@ -497,20 +503,20 @@ static int sp8870_set_frontend(struct dvb_frontend *=
fe)
 	}

 	if (!valid) {
-		printk("%s: firmware crash!!!!!!\n", __func__);
+		pr_err("%s(): firmware crash!!!!!!\n", __func__);
 		return -EIO;
 	}

 	if (debug) {
 		if (valid) {
 			if (trials > 1) {
-				printk("%s: firmware lockup!!!\n", __func__);
-				printk("%s: recovered after %i trial(s))\n",  __func__, trials - 1);
+				pr_info("%s(): firmware lockup!!!\n", __func__);
+				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1=
);
 				lockups++;
 			}
 		}
 		switches++;
-		printk("%s: switches =3D %i lockups =3D %i\n", __func__, switches, lock=
ups);
+		pr_info("%s(): switches =3D %i lockups =3D %i\n", __func__, switches, l=
ockups);
 	}

 	return 0;
diff --git a/drivers/staging/media/av7110/sp8870.h b/drivers/staging/media=
/av7110/sp8870.h
index 3f566671c..3323d1dfa 100644
=2D-- a/drivers/staging/media/av7110/sp8870.h
+++ b/drivers/staging/media/av7110/sp8870.h
@@ -25,7 +25,7 @@ struct dvb_frontend *sp8870_attach(const struct sp8870_c=
onfig *config, struct i2
 static inline struct dvb_frontend *sp8870_attach(const struct sp8870_conf=
ig *config,
 						 struct i2c_adapter *i2c)
 {
-	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
+	pr_warn(KBUILD_MODNAME ": %s(): driver disabled by Kconfig\n", __func__)=
;
 	return NULL;
 }
 #endif // CONFIG_DVB_SP8870
=2D-
2.34.0


