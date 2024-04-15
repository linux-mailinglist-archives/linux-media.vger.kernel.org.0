Return-Path: <linux-media+bounces-9296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4A8A46E9
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34311F22362
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A651DA21;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="pau35U4z"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3C134A5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147881; cv=none; b=GVFEbzeZ3ULG0L62Ry0HGe95dr9+QFG63qtfq+rOntZSmsV6uu4KIEDjy4nitBhEijmoJ4uj00DwzGSOILd1av8gKXH1PPwBTpN+p45qPMQPkFxZanbLA+3BxGgeH0hmE8wBFgF2rcZo49lYKR+A9W17e/kEbmIqlOdWLoaK9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147881; c=relaxed/simple;
	bh=9m3uGzmTleCBGZVq7aDUQz6mlZJxMtNaEzJLhwNwCQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gzbc1u1A1npG9qVKEeM9whOhiqZuh6OFAT9x0LuWmAces2otL1Q7/IQ/Sk2fTXKpJY+n/Vf2bDOpUvAYHDXO2TIfElGFD/RoId6WbOP/yGlOMhbl7+k4sL3StzGKnOHdL39aR2uDbIv5f/jcUHBZOG4tDp3cueALKX3UGNLo4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=pau35U4z; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147872; x=1713752672; i=herdler@nurfuerspam.de;
	bh=vnYi+mPrMHIEmhhgLd1lu00SS8y2F38qpjkYk/Bz4Bo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=pau35U4z6PAHQQ/+Tt5RpEKAcn6ZgPKH3oqdHQSOGaXJOhMfwF/6oKOtzqzgfaJ1
	 rekvbEHGXB3kO+cROk28fPbrdgmV9oPYUQVf80Yg0ETcbANQ4navXrw8XBI3b07MI
	 IuVahtPI9lLDpMdje5/Q4aWFIG/zfRZaekYf8/Txf1ayoXsoa6LtRSx1JBl4uL4D9
	 S0BJ/GePgHPZzeBsEhc7eQRf7f0Gw5ZMzMn1MiWVmd3+gsNtxBXVAoATYTyPppkQS
	 zSR8zVYBl08qPlY/+aIxirpaZQE7Mg2G2U+KBkz3+PH7py5pipKUHAYrCHPusYg7D
	 b/gytyBOp3WIkGAyJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1sZ9CY24JS-00oERc; Mon, 15
 Apr 2024 04:24:32 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 04/10] media: ttpci: coding style fixes: braces
Date: Mon, 15 Apr 2024 04:24:05 +0200
Message-Id: <20240415022411.234580-5-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:8YJ+RltTJlRMhZAUg8YX2RNHMKk1p53KHTSs52Vrup1aZCEE5Iz
 r1iGrEIh9gdFAIBGWASPZKVX7O0g5IXckFrR/URHAVB3B9hnzHXVsXMUKEJVIl1vWR3aBm7
 GL0w4jVzY44Gu0WYrcwfBhCasXBGT3Lmz0svxirdVJN84ezsyk2pkXrix7ra0nQQiYQ7yVJ
 6ZvfWmQ9rRx7RjEWU9SVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jpeu5luHSt8=;BGxtv4MQfyik1BxyiDEP+hL61jn
 eEREpQxt1V5MmRnyZMg+B7bh5xiyvxrBukrpYxSCysux3CgOhlTHNv40U8d1Eo5fXcKpjthJo
 8uYtxFH4QdiGF95/BBCToois4wSN88AjVzRkqQcicqmonajs378oX+6C7u0pfmhPLgOvRu7lK
 sxSKUvmK6xEIDFtR5THIC5jP7OwRrfrUSpX4PEsE5rCjdlAAw09N4vsc+Z2Tjzqq3w0d/YOyP
 ZEZFKq9f++EolxjIydnOBuL124E95XReg4l5vTUAtMR5xGK1+4D9o9e8AC7eLY1v3iIhxVan6
 vrUNQ7gU1DJulXIEzDu9EzJSf8osXURVsZXARH2aQDzjMlDH/FwkTslN3oPycKvXmOLBRif6R
 KBndOOAhCsiTp1znvJt5nOijRnc0sCHNZfpc6NZ5uRKRPJpGLEpOvthPxg9wtVChPnwECW8yy
 VNvXxfu8O0mZpGdmo/gUn9ak+NAWSMOWyvSL83TzZKHmKmJ90MH3okivP2yEheQi5CG2CuWu6
 7tMkov5/Xav/kp86lgiGch639/2BNaAL3n2YmO1qiDFbQW6ishd8z3+7OCrpMr5yxp5iixaLg
 CgGVhyaXI3bJI1r61auQfsH0h9UTfXW0/XxzJ4gjiKcGsuWUxvbjIC5BF+M2xRWsqFsTOMU3M
 IywxmdGuYnowMaLVImZBFmMOnhe19CMPkxfoFRZhCo4jJQo0LAzH5Az56xFADdaPoy28P/0iG
 eJhOgT0/Rc3rtZaNvJuHFrf1BmHDrOyFPJRIyc/6mQQe8KzWxgU9zSqzhfXecO9hnC6zlDNWw
 rgPeKPrXp7MNMnZh2kUp59jEZXwdAKFF6jYvlFf+z8J6U=

This patch fixes the following checkpatch warnings and errors:

WARNING:BRACES: braces {} are not necessary for any arm of this statement
WARNING:BRACES: braces {} are not necessary for single statement blocks
ERROR:OPEN_BRACE: that open brace { should be on the previous line
CHECK:BRACES: braces {} should be used on all arms of this statement
CHECK:BRACES: Unbalanced braces around else statement

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Changes since v1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Title

2. Remove the offending hunk that erroneous appeared in here.

3. Remove one change, that caused a 'unbalanced braces' warning.

4. Fix the rest of the 'unbalanced braces' warnings too.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/media/pci/ttpci/budget-av.c | 30 +++++++++++------------------
 drivers/media/pci/ttpci/budget-ci.c | 21 +++++++++-----------
 drivers/media/pci/ttpci/budget.c    | 10 ++++------
 3 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index dbd4ef40e..acac9bae4 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -309,16 +309,14 @@ static int ciintf_poll_slot_status(struct dvb_ca_en5=
0221 *ca, int slot, int open
 	/* read from attribute memory in reset/ready state to know when the CAM =
is ready */
 	if (budget_av->slot_status =3D=3D SLOTSTATUS_RESET) {
 		result =3D ciintf_read_attribute_mem(ca, slot, 0);
-		if (result =3D=3D 0x1d) {
+		if (result =3D=3D 0x1d)
 			budget_av->slot_status =3D SLOTSTATUS_READY;
-		}
 	}

 	/* work out correct return code */
 	if (budget_av->slot_status !=3D SLOTSTATUS_NONE) {
-		if (budget_av->slot_status & SLOTSTATUS_READY) {
+		if (budget_av->slot_status & SLOTSTATUS_READY)
 			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY=
;
-		}
 		return DVB_CA_EN50221_POLL_CAM_PRESENT;
 	}
 	return 0;
@@ -452,8 +450,9 @@ static int saa7113_setinput(struct budget_av *budget_a=
v, int input)
 	} else if (input =3D=3D 0) {
 		i2c_writereg(&budget->i2c_adap, 0x4a, 0x02, 0xc0);
 		i2c_writereg(&budget->i2c_adap, 0x4a, 0x09, 0x00);
-	} else
+	} else {
 		return -EINVAL;
+	}

 	budget_av->cur_input =3D input;
 	return 0;
@@ -1237,15 +1236,13 @@ static void frontend_init(struct budget_av *budget=
_av)
 		if (saa->pci->subsystem_vendor =3D=3D 0x1894) {
 			fe =3D dvb_attach(stv0299_attach, &cinergy_1200s_1894_0010_config,
 					     &budget_av->budget.i2c_adap);
-			if (fe) {
+			if (fe)
 				dvb_attach(tua6100_attach, fe, 0x60, &budget_av->budget.i2c_adap);
-			}
 		} else {
 			fe =3D dvb_attach(stv0299_attach, &typhoon_config,
 					     &budget_av->budget.i2c_adap);
-			if (fe) {
+			if (fe)
 				fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_param=
s;
-			}
 		}
 		break;

@@ -1257,19 +1254,17 @@ static void frontend_init(struct budget_av *budget=
_av)
 	case SUBID_DVBS_EASYWATCH_2:
 		fe =3D dvb_attach(stv0299_attach, &philips_sd1878_config,
 				&budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			dvb_attach(dvb_pll_attach, fe, 0x60,
 				   &budget_av->budget.i2c_adap,
 				   DVB_PLL_PHILIPS_SD1878_TDA8261);
-		}
 		break;

 	case SUBID_DVBS_TYPHOON:
 		fe =3D dvb_attach(stv0299_attach, &typhoon_config,
 				    &budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_params=
;
-		}
 		break;
 	case SUBID_DVBS2_KNC1:
 	case SUBID_DVBS2_KNC1_OEM:
@@ -1282,9 +1277,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 	case SUBID_DVBS_CINERGY1200:
 		fe =3D dvb_attach(stv0299_attach, &cinergy_1200s_config,
 				    &budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_params=
;
-		}
 		break;

 	case SUBID_DVBC_KNC1:
@@ -1300,9 +1294,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 			fe =3D dvb_attach(tda10021_attach, &philips_cu1216_config_altaddress,
 					     &budget_av->budget.i2c_adap,
 					     read_pwm(budget_av));
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_cu1216_tuner_set_params;
-		}
 		break;

 	case SUBID_DVBC_EASYWATCH_MK3:
@@ -1316,9 +1309,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 			&philips_cu1216_tda10023_config,
 			&budget_av->budget.i2c_adap,
 			read_pwm(budget_av));
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_cu1216_tuner_set_params;
-		}
 		break;

 	case SUBID_DVBT_EASYWATCH:
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index ebf340417..2a51febdb 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -412,24 +412,21 @@ static int ciintf_poll_slot_status(struct dvb_ca_en5=
0221 *ca, int slot, int open
 	flags =3D ttpci_budget_debiread(&budget_ci->budget, DEBICICTL, DEBIADDR_=
CICONTROL, 1, 1, 0);
 	if (flags & CICONTROL_CAMDETECT) {
 		// mark it as present if it wasn't before
-		if (budget_ci->slot_status & SLOTSTATUS_NONE) {
+		if (budget_ci->slot_status & SLOTSTATUS_NONE)
 			budget_ci->slot_status =3D SLOTSTATUS_PRESENT;
-		}

 		// during a RESET, we check if we can read from IO memory to see when C=
AM is ready
 		if (budget_ci->slot_status & SLOTSTATUS_RESET) {
-			if (ciintf_read_attribute_mem(ca, slot, 0) =3D=3D 0x1d) {
+			if (ciintf_read_attribute_mem(ca, slot, 0) =3D=3D 0x1d)
 				budget_ci->slot_status =3D SLOTSTATUS_READY;
-			}
 		}
 	} else {
 		budget_ci->slot_status =3D SLOTSTATUS_NONE;
 	}

 	if (budget_ci->slot_status !=3D SLOTSTATUS_NONE) {
-		if (budget_ci->slot_status & SLOTSTATUS_READY) {
+		if (budget_ci->slot_status & SLOTSTATUS_READY)
 			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY=
;
-		}
 		return DVB_CA_EN50221_POLL_CAM_PRESENT;
 	}

@@ -494,11 +491,10 @@ static int ciintf_init(struct budget_ci *budget_ci)
 	// Setup CI slot IRQ
 	if (budget_ci->ci_irq) {
 		tasklet_setup(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt);
-		if (budget_ci->slot_status !=3D SLOTSTATUS_NONE) {
+		if (budget_ci->slot_status !=3D SLOTSTATUS_NONE)
 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
-		} else {
+		else
 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQHI);
-		}
 		SAA7146_IER_ENABLE(saa, MASK_03);
 	}

@@ -857,9 +853,9 @@ static int dvbc_philips_tdm1316l_tuner_set_params(stru=
ct dvb_frontend *fe)

 	// determine charge pump
 	tuner_frequency =3D p->frequency + 36125000;
-	if (tuner_frequency < 87000000)
+	if (tuner_frequency < 87000000) {
 		return -EINVAL;
-	else if (tuner_frequency < 130000000) {
+	} else if (tuner_frequency < 130000000) {
 		cp =3D 3;
 		band =3D 1;
 	} else if (tuner_frequency < 160000000) {
@@ -886,8 +882,9 @@ static int dvbc_philips_tdm1316l_tuner_set_params(stru=
ct dvb_frontend *fe)
 	} else if (tuner_frequency < 895000000) {
 		cp =3D 7;
 		band =3D 4;
-	} else
+	} else {
 		return -EINVAL;
+	}

 	// assume PLL filter should always be 8MHz for the moment.
 	filter =3D 1;
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 9fe087add..44f09b548 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -100,9 +100,9 @@ static int SendDiSEqCMsg(struct budget *budget, int le=
n, u8 *msg, unsigned long
 	mdelay(16);

 	if (burst !=3D -1) {
-		if (burst)
+		if (burst) {
 			DiseqcSendByte(budget, 0xff);
-		else {
+		} else {
 			saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTHI);
 			mdelay(12);
 			udelay(500);
@@ -229,8 +229,7 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)
 	return 0;
 }

-static struct ves1x93_config alps_bsrv2_config =3D
-{
+static struct ves1x93_config alps_bsrv2_config =3D {
 	.demod_address =3D 0x08,
 	.xin =3D 90100000UL,
 	.invert_pwm =3D 0,
@@ -786,9 +785,8 @@ static int budget_attach(struct saa7146_dev *dev, stru=
ct saa7146_pci_extension_d
 	int err;

 	budget =3D kmalloc(sizeof(struct budget), GFP_KERNEL);
-	if (NULL =3D=3D budget) {
+	if (NULL =3D=3D budget)
 		return -ENOMEM;
-	}

 	dprintk(2, "dev:%p, info:%p, budget:%p\n", dev, info, budget);

=2D-
2.34.0


