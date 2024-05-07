Return-Path: <linux-media+bounces-10942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AF8BD893
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E812283698
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AA179F0;
	Tue,  7 May 2024 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="a65N7A9t"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D979DF
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041534; cv=none; b=gFrGvNpk2brQcap+Nd3i0K/iqDR4hsUTU240SR29w0l6jN7cdGO6Y+J8iLlzAdGfcl/edio/ReawHalESfjSp22UXtsAtsBJ7zg+1y5pkv5plzsbWGf2H3nVZqaS7ARy3rWJX0EBfFG9PqQ1Yk3Hpgqjff8FBH3weRBCX4rZkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041534; c=relaxed/simple;
	bh=VcE+TB+vj8duY2lR1XCiRdcdCyimRhWKkpkQdAc77iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2yrro709Crdz1EPAxCcHURnvtSkG+sgaBl4gklO2TWMiiiGkRDuuNYi1ChCg/H6nfF1adUKS1GY+IOQSo74rmPioVLrCYZIwY6p2Duq0Kt2jTLMm97f7D8pO7VQ+X0Rt4kXmQ3norb411f/hSSwcNjIb/Aqi1QCN79ae/3kpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=a65N7A9t; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041525; x=1715646325; i=herdler@nurfuerspam.de;
	bh=PddmM42O0qh42eP+/qq4BlJaAaSWB/Bg7ftK1TqfYpE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a65N7A9tNvH/+irlZ+TVmo0yidCL8a3bnyn0X4uqintLYcNspqPsDN/9pK4ZJtvw
	 m0bGeZ4qTuZFuMm9nx7kRtIOfm/0AjI/rZvGJ3ZBwqfoulHOjOU1opDs8wbs9flOj
	 TRy0jQMUK2HIYaECAMNY0nWcQOxqMjNji89/BhUAxxNjA5Eu98KA9S2ROnIpdTSTz
	 1Hk/TiRV3/wSDtbNNo1tdZP8hVhbdJvIO6oXmmctbGau0voHDMixwt+ktp0c9DiKG
	 32Brrmsow3JrPpR/LPOa92a29mmbJHGStOIKBJCojZNvJdfqNU1FMwb7iJeUAo2mM
	 fUZwCBB9xrBbUVbrow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1sJCeq2hyb-00K9wE; Tue, 07
 May 2024 02:25:25 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 02/21] media: av7110: remove budget-patch driver
Date: Tue,  7 May 2024 02:24:41 +0200
Message-Id: <20240507002500.81867-3-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:ZGS7wzc6C5EabtPssTl7IeMy20wVpa5hsW89mvwJN7viDC6iRDa
 Ahi9dy1cKMMyd26Oe5lO/QamD9SR7Gq0I6YzJxFuGcdIZkINm7nWPf/n2TBG9Laf8ii/vJU
 eMPq0Huky9GO+5yxRHnaePfIrRqauv79xfMCNUCs3z/yPCIRHvqRyERyXjuFBrakrRYkxt2
 jr6dZ7DDkHr8XBqcEspoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VkvVsal2p6M=;VyLr/uqVvM8iOe5ycCVkKlvTgv6
 obynLYi41r5dmtE1otU5B83x2j+/MerbqUiQh7rbXiOuwRKenwZaK4/rcfio3BeCg0Qpb6Qlz
 5PhLAz22HYxpnf+w+7AJ/n0RBpwJN8LdpTXxpyisIHTZXYh+WxbY3rnTSNNCpoAXrfUtTE82H
 uMir8XJNo+AltwvlLrqEGAfOsjXkOGlIzmJQOIj6E2leqJdk7y6PewoytrFJLA7VU6SsLSeZs
 Jf/VwKyKf6kFABkOsGTDSqR+xIHr1bVQrXx1602vCuSQ+GbSGGnKVEtEi0NBqV/cVMtDTmtFq
 7It0m/vSZY5AcgeX4NnrPM1HDNS0WQhclsCBS74jQ/009YCcQiy2Nv1Z0goniAnRNKorpzmRu
 RmurdDuSmmpbd9Dc537WK2XxEJNvQg+EXbNclOKwPHZVjEy2jhlCFQYbUijVfWBMDkz+PuxhA
 dMFxCqygmcJjHvhioRNFLb7ztuZ6IidMGZC/mT+mgibfAy+UGWtR13+qvUhdOBmbLDepdDHBY
 oKe93zItcSgKYu4x0OrzSIsp8C05G6EdEP77qoPj3gFCuDZcSCbNQyNQn2W1EegnPlp+f/lWh
 ttySyJACUkj2FraXZ3ehNG4608N2U/gMzPHv5WJ2KByUL5Rzch+Xa9zsb1yfWFIDA13qlzPlj
 JLQfjVHuQCF0+Wvv3YYlUZyw+L115ouV8e+yc1jgqYtvtw05y/aLYgQvdjrqKwJuFnrkqWJ7u
 74vA0/LRc+fSu8+J5UipXBmzf8zzrOtadUKP34wkcpCba6D2ZYQpIXFsFuwxFQkBXjHfvoqez
 vcav7LR5VK8JVP/WuVvQCWXHAcr3bhYEr3mISBRBgRK+E=

This patch removes the budget-patch stand alone driver only.
This patch does *not* remove the budget-patch support from the av7110
     (=3D dvb-ttpci) driver.
This patch does also *not* remove the support for the full-ts mod.

The budget-patch is an obsolete, experimental hardware modification, which
aimed to receive the whole transport stream of a transponder by bypassing
the av7110. This modification never worked reliably enough to be used in a
productive environment.
"almost no packet loss" [budget-patch.c #522] is still a packet loss.

The successor of the budget-patch is the full-ts mod, which is reliable.
The full-ts mod circuit is found on the never rev. 2.2 and 2.3 DVB-S
cards ex factory. The full-ts mod support is (only) in the av7110
(=3D dvb-ttpci) driver.

The budget-patch driver is a stand alone driver, which turns the card into
a budget card. It doesn't appear to be ever intended for the average user.
"Card is required to have loaded firmware to tune properly. Firmware can
be loaded by insertion and removal of standard av7110 driver prior to
loading this driver." [Kconfig]

There is support for the budget-patch in the av7110 (=3D dvb-ttpci) driver
too, which isn't affected by this patch.

The budget-patch is obsolete and replaced by the full-ts mod quiet a while
now. Remove the budget-patch driver left over from development.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

I use this cards since almost 20 years now and I have never ever used
this driver, not even once.

Back then Oliver Endriss strongly discouraged me to make any experiments
with the budget-patch. It will corrupt the data, he said.
(Some time later he introduced the full-ts mod support.)

My productive System is running flawless without the whole kernel module.
(Tested by deleting budget-patch.ko.)

Therefore I'm as sure as I could be, this driver can be safely removed.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/staging/media/av7110/Kconfig        |  22 -
 drivers/staging/media/av7110/Makefile       |   2 -
 drivers/staging/media/av7110/budget-patch.c | 665 --------------------
 3 files changed, 689 deletions(-)
 delete mode 100644 drivers/staging/media/av7110/budget-patch.c

diff --git a/drivers/staging/media/av7110/Kconfig b/drivers/staging/media/=
av7110/Kconfig
index 9faf9d2d4..0722df9e6 100644
=2D-- a/drivers/staging/media/av7110/Kconfig
+++ b/drivers/staging/media/av7110/Kconfig
@@ -51,28 +51,6 @@ config DVB_AV7110_OSD

 	  All other people say N.

-config DVB_BUDGET_PATCH
-	tristate "AV7110 cards with Budget Patch"
-	depends on DVB_BUDGET_CORE && I2C
-	depends on DVB_AV7110
-	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
-	select DVB_TDA8083 if MEDIA_SUBDRV_AUTOSELECT
-	help
-	  Support for Budget Patch (full TS) modification on
-	  SAA7146+AV7110 based cards (DVB-S cards). This
-	  driver doesn't use onboard MPEG2 decoder. The
-	  card is driven in Budget-only mode. Card is
-	  required to have loaded firmware to tune properly.
-	  Firmware can be loaded by insertion and removal of
-	  standard AV7110 driver prior to loading this
-	  driver.
-
-	  Say Y if you own such a card and want to use it.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called budget-patch.
-
 if DVB_AV7110

 # Frontend driver that it is used only by AV7110 driver
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media=
/av7110/Makefile
index 307b26759..f4bbb535d 100644
=2D-- a/drivers/staging/media/av7110/Makefile
+++ b/drivers/staging/media/av7110/Makefile
@@ -10,8 +10,6 @@ ifdef CONFIG_DVB_AV7110_IR
 dvb-ttpci-objs +=3D av7110_ir.o
 endif

-obj-$(CONFIG_DVB_BUDGET_PATCH) +=3D budget-patch.o
-
 obj-$(CONFIG_DVB_AV7110) +=3D dvb-ttpci.o

 obj-$(CONFIG_DVB_SP8870) +=3D sp8870.o
diff --git a/drivers/staging/media/av7110/budget-patch.c b/drivers/staging=
/media/av7110/budget-patch.c
deleted file mode 100644
index d173c8ade..000000000
=2D-- a/drivers/staging/media/av7110/budget-patch.c
+++ /dev/null
@@ -1,665 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * budget-patch.c: driver for Budget Patch,
- * hardware modification of DVB-S cards enabling full TS
- *
- * Written by Emard <emard@softhome.net>
- *
- * Original idea by Roberto Deza <rdeza@unav.es>
- *
- * Special thanks to Holger Waechtler, Michael Hunold, Marian Durkovic
- * and Metzlerbros
- *
- * the project's page is at https://linuxtv.org
- */
-
-#include "av7110.h"
-#include "av7110_hw.h"
-#include "budget.h"
-#include "stv0299.h"
-#include "ves1x93.h"
-#include "tda8083.h"
-
-#include "bsru6.h"
-
-DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
-
-#define budget_patch budget
-
-static struct saa7146_extension budget_extension;
-
-MAKE_BUDGET_INFO(ttbp, "TT-Budget/Patch DVB-S 1.x PCI", BUDGET_PATCH);
-//MAKE_BUDGET_INFO(satel,"TT-Budget/Patch SATELCO PCI", BUDGET_TT_HW_DISE=
QC);
-
-static const struct pci_device_id pci_tbl[] =3D {
-	MAKE_EXTENSION_PCI(ttbp,0x13c2, 0x0000),
-//        MAKE_EXTENSION_PCI(satel, 0x13c2, 0x1013),
-	{
-		.vendor    =3D 0,
-	}
-};
-
-/* those lines are for budget-patch to be tried
-** on a true budget card and observe the
-** behaviour of VSYNC generated by rps1.
-** this code was shamelessly copy/pasted from budget.c
-*/
-static void gpio_Set22K (struct budget *budget, int state)
-{
-	struct saa7146_dev *dev=3Dbudget->dev;
-	dprintk(2, "budget: %p\n", budget);
-	saa7146_setgpio(dev, 3, (state ? SAA7146_GPIO_OUTHI : SAA7146_GPIO_OUTLO=
));
-}
-
-/* Diseqc functions only for TT Budget card */
-/* taken from the Skyvision DVB driver by
-   Ralph Metzler <rjkm@metzlerbros.de> */
-
-static void DiseqcSendBit (struct budget *budget, int data)
-{
-	struct saa7146_dev *dev=3Dbudget->dev;
-	dprintk(2, "budget: %p\n", budget);
-
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTHI);
-	udelay(data ? 500 : 1000);
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-	udelay(data ? 1000 : 500);
-}
-
-static void DiseqcSendByte (struct budget *budget, int data)
-{
-	int i, par=3D1, d;
-
-	dprintk(2, "budget: %p\n", budget);
-
-	for (i=3D7; i>=3D0; i--) {
-		d =3D (data>>i)&1;
-		par ^=3D d;
-		DiseqcSendBit(budget, d);
-	}
-
-	DiseqcSendBit(budget, par);
-}
-
-static int SendDiSEqCMsg (struct budget *budget, int len, u8 *msg, unsign=
ed long burst)
-{
-	struct saa7146_dev *dev=3Dbudget->dev;
-	int i;
-
-	dprintk(2, "budget: %p\n", budget);
-
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-	mdelay(16);
-
-	for (i=3D0; i<len; i++)
-		DiseqcSendByte(budget, msg[i]);
-
-	mdelay(16);
-
-	if (burst!=3D-1) {
-		if (burst)
-			DiseqcSendByte(budget, 0xff);
-		else {
-			saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTHI);
-			mdelay(12);
-			udelay(500);
-			saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-		}
-		msleep(20);
-	}
-
-	return 0;
-}
-
-/* shamelessly copy/pasted from budget.c */
-static int budget_set_tone(struct dvb_frontend *fe,
-			   enum fe_sec_tone_mode tone)
-{
-	struct budget* budget =3D (struct budget*) fe->dvb->priv;
-
-	switch (tone) {
-	case SEC_TONE_ON:
-		gpio_Set22K (budget, 1);
-		break;
-
-	case SEC_TONE_OFF:
-		gpio_Set22K (budget, 0);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int budget_diseqc_send_master_cmd(struct dvb_frontend* fe, struct =
dvb_diseqc_master_cmd* cmd)
-{
-	struct budget* budget =3D (struct budget*) fe->dvb->priv;
-
-	SendDiSEqCMsg (budget, cmd->msg_len, cmd->msg, 0);
-
-	return 0;
-}
-
-static int budget_diseqc_send_burst(struct dvb_frontend *fe,
-				    enum fe_sec_mini_cmd minicmd)
-{
-	struct budget* budget =3D (struct budget*) fe->dvb->priv;
-
-	SendDiSEqCMsg (budget, 0, NULL, minicmd);
-
-	return 0;
-}
-
-static int budget_av7110_send_fw_cmd(struct budget_patch *budget, u16* bu=
f, int length)
-{
-	int i;
-
-	dprintk(2, "budget: %p\n", budget);
-
-	for (i =3D 2; i < length; i++)
-	{
-		  ttpci_budget_debiwrite(budget, DEBINOSWAP, COMMAND + 2*i, 2, (u32) bu=
f[i], 0,0);
-		  msleep(5);
-	}
-	if (length)
-		  ttpci_budget_debiwrite(budget, DEBINOSWAP, COMMAND + 2, 2, (u32) buf[=
1], 0,0);
-	else
-		  ttpci_budget_debiwrite(budget, DEBINOSWAP, COMMAND + 2, 2, 0, 0,0);
-	msleep(5);
-	ttpci_budget_debiwrite(budget, DEBINOSWAP, COMMAND, 2, (u32) buf[0], 0,0=
);
-	msleep(5);
-	return 0;
-}
-
-static void av7110_set22k(struct budget_patch *budget, int state)
-{
-	u16 buf[2] =3D {( COMTYPE_AUDIODAC << 8) | (state ? ON22K : OFF22K), 0};
-
-	dprintk(2, "budget: %p\n", budget);
-	budget_av7110_send_fw_cmd(budget, buf, 2);
-}
-
-static int av7110_send_diseqc_msg(struct budget_patch *budget, int len, u=
8 *msg, int burst)
-{
-	int i;
-	u16 buf[18] =3D { ((COMTYPE_AUDIODAC << 8) | SendDiSEqC),
-		16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
-
-	dprintk(2, "budget: %p\n", budget);
-
-	if (len>10)
-		len=3D10;
-
-	buf[1] =3D len+2;
-	buf[2] =3D len;
-
-	if (burst !=3D -1)
-		buf[3]=3Dburst ? 0x01 : 0x00;
-	else
-		buf[3]=3D0xffff;
-
-	for (i=3D0; i<len; i++)
-		buf[i+4]=3Dmsg[i];
-
-	budget_av7110_send_fw_cmd(budget, buf, 18);
-	return 0;
-}
-
-static int budget_patch_set_tone(struct dvb_frontend *fe,
-				 enum fe_sec_tone_mode tone)
-{
-	struct budget_patch* budget =3D (struct budget_patch*) fe->dvb->priv;
-
-	switch (tone) {
-	case SEC_TONE_ON:
-		av7110_set22k (budget, 1);
-		break;
-
-	case SEC_TONE_OFF:
-		av7110_set22k (budget, 0);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int budget_patch_diseqc_send_master_cmd(struct dvb_frontend* fe, s=
truct dvb_diseqc_master_cmd* cmd)
-{
-	struct budget_patch* budget =3D (struct budget_patch*) fe->dvb->priv;
-
-	av7110_send_diseqc_msg (budget, cmd->msg_len, cmd->msg, 0);
-
-	return 0;
-}
-
-static int budget_patch_diseqc_send_burst(struct dvb_frontend *fe,
-					  enum fe_sec_mini_cmd minicmd)
-{
-	struct budget_patch* budget =3D (struct budget_patch*) fe->dvb->priv;
-
-	av7110_send_diseqc_msg (budget, 0, NULL, minicmd);
-
-	return 0;
-}
-
-static int alps_bsrv2_tuner_set_params(struct dvb_frontend *fe)
-{
-	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct budget_patch* budget =3D (struct budget_patch*) fe->dvb->priv;
-	u8 pwr =3D 0;
-	u8 buf[4];
-	struct i2c_msg msg =3D { .addr =3D 0x61, .flags =3D 0, .buf =3D buf, .le=
n =3D sizeof(buf) };
-	u32 div =3D (p->frequency + 479500) / 125;
-
-	if (p->frequency > 2000000)
-		pwr =3D 3;
-	else if (p->frequency > 1800000)
-		pwr =3D 2;
-	else if (p->frequency > 1600000)
-		pwr =3D 1;
-	else if (p->frequency > 1200000)
-		pwr =3D 0;
-	else if (p->frequency >=3D 1100000)
-		pwr =3D 1;
-	else pwr =3D 2;
-
-	buf[0] =3D (div >> 8) & 0x7f;
-	buf[1] =3D div & 0xff;
-	buf[2] =3D ((div & 0x18000) >> 10) | 0x95;
-	buf[3] =3D (pwr << 6) | 0x30;
-
-	// NOTE: since we're using a prescaler of 2, we set the
-	// divisor frequency to 62.5kHz and divide by 125 above
-
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1)
-		return -EIO;
-	return 0;
-}
-
-static struct ves1x93_config alps_bsrv2_config =3D {
-	.demod_address =3D 0x08,
-	.xin =3D 90100000UL,
-	.invert_pwm =3D 0,
-};
-
-static int grundig_29504_451_tuner_set_params(struct dvb_frontend *fe)
-{
-	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct budget_patch* budget =3D (struct budget_patch*) fe->dvb->priv;
-	u32 div;
-	u8 data[4];
-	struct i2c_msg msg =3D { .addr =3D 0x61, .flags =3D 0, .buf =3D data, .l=
en =3D sizeof(data) };
-
-	div =3D p->frequency / 125;
-	data[0] =3D (div >> 8) & 0x7f;
-	data[1] =3D div & 0xff;
-	data[2] =3D 0x8e;
-	data[3] =3D 0x00;
-
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1)
-		return -EIO;
-	return 0;
-}
-
-static struct tda8083_config grundig_29504_451_config =3D {
-	.demod_address =3D 0x68,
-};
-
-static void frontend_init(struct budget_patch* budget)
-{
-	switch(budget->dev->pci->subsystem_device) {
-	case 0x0000: // Hauppauge/TT WinTV DVB-S rev1.X
-	case 0x1013: // SATELCO Multimedia PCI
-
-		// try the ALPS BSRV2 first of all
-		budget->dvb_frontend =3D dvb_attach(ves1x93_attach, &alps_bsrv2_config,=
 &budget->i2c_adap);
-		if (budget->dvb_frontend) {
-			budget->dvb_frontend->ops.tuner_ops.set_params =3D alps_bsrv2_tuner_se=
t_params;
-			budget->dvb_frontend->ops.diseqc_send_master_cmd =3D budget_patch_dise=
qc_send_master_cmd;
-			budget->dvb_frontend->ops.diseqc_send_burst =3D budget_patch_diseqc_se=
nd_burst;
-			budget->dvb_frontend->ops.set_tone =3D budget_patch_set_tone;
-			break;
-		}
-
-		// try the ALPS BSRU6 now
-		budget->dvb_frontend =3D dvb_attach(stv0299_attach, &alps_bsru6_config,=
 &budget->i2c_adap);
-		if (budget->dvb_frontend) {
-			budget->dvb_frontend->ops.tuner_ops.set_params =3D alps_bsru6_tuner_se=
t_params;
-			budget->dvb_frontend->tuner_priv =3D &budget->i2c_adap;
-
-			budget->dvb_frontend->ops.diseqc_send_master_cmd =3D budget_diseqc_sen=
d_master_cmd;
-			budget->dvb_frontend->ops.diseqc_send_burst =3D budget_diseqc_send_bur=
st;
-			budget->dvb_frontend->ops.set_tone =3D budget_set_tone;
-			break;
-		}
-
-		// Try the grundig 29504-451
-		budget->dvb_frontend =3D dvb_attach(tda8083_attach, &grundig_29504_451_=
config, &budget->i2c_adap);
-		if (budget->dvb_frontend) {
-			budget->dvb_frontend->ops.tuner_ops.set_params =3D grundig_29504_451_t=
uner_set_params;
-			budget->dvb_frontend->ops.diseqc_send_master_cmd =3D budget_diseqc_sen=
d_master_cmd;
-			budget->dvb_frontend->ops.diseqc_send_burst =3D budget_diseqc_send_bur=
st;
-			budget->dvb_frontend->ops.set_tone =3D budget_set_tone;
-			break;
-		}
-		break;
-	}
-
-	if (budget->dvb_frontend =3D=3D NULL) {
-		printk("dvb-ttpci: A frontend driver was not found for device [%04x:%04=
x] subsystem [%04x:%04x]\n",
-		       budget->dev->pci->vendor,
-		       budget->dev->pci->device,
-		       budget->dev->pci->subsystem_vendor,
-		       budget->dev->pci->subsystem_device);
-	} else {
-		if (dvb_register_frontend(&budget->dvb_adapter, budget->dvb_frontend)) =
{
-			printk("budget-av: Frontend registration failed!\n");
-			dvb_frontend_detach(budget->dvb_frontend);
-			budget->dvb_frontend =3D NULL;
-		}
-	}
-}
-
-/* written by Emard */
-static int budget_patch_attach (struct saa7146_dev* dev, struct saa7146_p=
ci_extension_data *info)
-{
-	struct budget_patch *budget;
-	int err;
-	int count =3D 0;
-	int detected =3D 0;
-
-#define PATCH_RESET 0
-#define RPS_IRQ 0
-#define HPS_SETUP 0
-#if PATCH_RESET
-	saa7146_write(dev, MC1, MASK_31);
-	msleep(40);
-#endif
-#if HPS_SETUP
-	// initialize registers. Better to have it like this
-	// than leaving something unconfigured
-	saa7146_write(dev, DD1_STREAM_B, 0);
-	// port B VSYNC at rising edge
-	saa7146_write(dev, DD1_INIT, 0x00000200);  // have this in budget-core t=
oo!
-	saa7146_write(dev, BRS_CTRL, 0x00000000);  // VBI
-
-	// debi config
-	// saa7146_write(dev, DEBI_CONFIG, MASK_30|MASK_28|MASK_18);
-
-	// zero all HPS registers
-	saa7146_write(dev, HPS_H_PRESCALE, 0);                  // r68
-	saa7146_write(dev, HPS_H_SCALE, 0);                     // r6c
-	saa7146_write(dev, BCS_CTRL, 0);                        // r70
-	saa7146_write(dev, HPS_V_SCALE, 0);                     // r60
-	saa7146_write(dev, HPS_V_GAIN, 0);                      // r64
-	saa7146_write(dev, CHROMA_KEY_RANGE, 0);                // r74
-	saa7146_write(dev, CLIP_FORMAT_CTRL, 0);                // r78
-	// Set HPS prescaler for port B input
-	saa7146_write(dev, HPS_CTRL, (1<<30) | (0<<29) | (1<<28) | (0<<12) );
-	saa7146_write(dev, MC2,
-	  0 * (MASK_08 | MASK_24)  |   // BRS control
-	  0 * (MASK_09 | MASK_25)  |   // a
-	  0 * (MASK_10 | MASK_26)  |   // b
-	  1 * (MASK_06 | MASK_22)  |   // HPS_CTRL1
-	  1 * (MASK_05 | MASK_21)  |   // HPS_CTRL2
-	  0 * (MASK_01 | MASK_15)      // DEBI
-	   );
-#endif
-	// Disable RPS1 and RPS0
-	saa7146_write(dev, MC1, ( MASK_29 | MASK_28));
-	// RPS1 timeout disable
-	saa7146_write(dev, RPS_TOV1, 0);
-
-	// code for autodetection
-	// will wait for VBI_B event (vertical blank at port B)
-	// and will reset GPIO3 after VBI_B is detected.
-	// (GPIO3 should be raised high by CPU to
-	// test if GPIO3 will generate vertical blank signal
-	// in budget patch GPIO3 is connected to VSYNC_B
-	count =3D 0;
-#if 0
-	WRITE_RPS1(CMD_UPLOAD |
-	  MASK_10 | MASK_09 | MASK_08 | MASK_06 | MASK_05 | MASK_04 | MASK_03 | =
MASK_02 );
-#endif
-	WRITE_RPS1(CMD_PAUSE | EVT_VBI_B);
-	WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
-	WRITE_RPS1(GPIO3_MSK);
-	WRITE_RPS1(SAA7146_GPIO_OUTLO<<24);
-#if RPS_IRQ
-	// issue RPS1 interrupt to increment counter
-	WRITE_RPS1(CMD_INTERRUPT);
-	// at least a NOP is neede between two interrupts
-	WRITE_RPS1(CMD_NOP);
-	// interrupt again
-	WRITE_RPS1(CMD_INTERRUPT);
-#endif
-	WRITE_RPS1(CMD_STOP);
-
-#if RPS_IRQ
-	// set event counter 1 source as RPS1 interrupt (0x03)          (rE4 p53=
)
-	// use 0x03 to track RPS1 interrupts - increase by 1 every gpio3 is togg=
led
-	// use 0x15 to track VPE  interrupts - increase by 1 every vpeirq() is c=
alled
-	saa7146_write(dev, EC1SSR, (0x03<<2) | 3 );
-	// set event counter 1 threshold to maximum allowed value        (rEC p5=
5)
-	saa7146_write(dev, ECT1R,  0x3fff );
-#endif
-	// Fix VSYNC level
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-	// Set RPS1 Address register to point to RPS code               (r108 p4=
2)
-	saa7146_write(dev, RPS_ADDR1, dev->d_rps1.dma_handle);
-	// Enable RPS1,                                                 (rFC p33=
)
-	saa7146_write(dev, MC1, (MASK_13 | MASK_29 ));
-
-
-	mdelay(50);
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTHI);
-	mdelay(150);
-
-
-	if( (saa7146_read(dev, GPIO_CTRL) & 0x10000000) =3D=3D 0)
-		detected =3D 1;
-
-#if RPS_IRQ
-	printk("Event Counter 1 0x%04x\n", saa7146_read(dev, EC1R) & 0x3fff );
-#endif
-	// Disable RPS1
-	saa7146_write(dev, MC1, ( MASK_29 ));
-
-	if(detected =3D=3D 0)
-		printk("budget-patch not detected or saa7146 in non-default state.\n"
-		       "try enabling resetting of 7146 with MASK_31 in MC1 register\n")=
;
-
-	else
-		printk("BUDGET-PATCH DETECTED.\n");
-
-
-/*      OLD (Original design by Roberto Deza):
-**      This code will setup the SAA7146_RPS1 to generate a square
-**      wave on GPIO3, changing when a field (TS_HEIGHT/2 "lines" of
-**      TS_WIDTH packets) has been acquired on SAA7146_D1B video port;
-**      then, this GPIO3 output which is connected to the D1B_VSYNC
-**      input, will trigger the acquisition of the alternate field
-**      and so on.
-**      Currently, the TT_budget / WinTV_Nova cards have two ICs
-**      (74HCT4040, LVC74) for the generation of this VSYNC signal,
-**      which seems that can be done perfectly without this :-)).
-*/
-
-/*      New design (By Emard)
-**      this rps1 code will copy internal HS event to GPIO3 pin.
-**      GPIO3 is in budget-patch hardware connected to port B VSYNC
-
-**      HS is an internal event of 7146, accessible with RPS
-**      and temporarily raised high every n lines
-**      (n in defined in the RPS_THRESH1 counter threshold)
-**      I think HS is raised high on the beginning of the n-th line
-**      and remains high until this n-th line that triggered
-**      it is completely received. When the reception of n-th line
-**      ends, HS is lowered.
-
-**      To transmit data over DMA, 7146 needs changing state at
-**      port B VSYNC pin. Any changing of port B VSYNC will
-**      cause some DMA data transfer, with more or less packets loss.
-**      It depends on the phase and frequency of VSYNC and
-**      the way of 7146 is instructed to trigger on port B (defined
-**      in DD1_INIT register, 3rd nibble from the right valid
-**      numbers are 0-7, see datasheet)
-**
-**      The correct triggering can minimize packet loss,
-**      dvbtraffic should give this stable bandwidths:
-**        22k transponder =3D 33814 kbit/s
-**      27.5k transponder =3D 38045 kbit/s
-**      by experiment it is found that the best results
-**      (stable bandwidths and almost no packet loss)
-**      are obtained using DD1_INIT triggering number 2
-**      (Va at rising edge of VS Fa =3D HS x VS-failing forced toggle)
-**      and a VSYNC phase that occurs in the middle of DMA transfer
-**      (about byte 188*512=3D96256 in the DMA window).
-**
-**      Phase of HS is still not clear to me how to control,
-**      It just happens to be so. It can be seen if one enables
-**      RPS_IRQ and print Event Counter 1 in vpeirq(). Every
-**      time RPS_INTERRUPT is called, the Event Counter 1 will
-**      increment. That's how the 7146 is programmed to do event
-**      counting in this budget-patch.c
-**      I *think* HPS setting has something to do with the phase
-**      of HS but I can't be 100% sure in that.
-
-**      hardware debug note: a working budget card (including budget patc=
h)
-**      with vpeirq() interrupt setup in mode "0x90" (every 64K) will
-**      generate 3 interrupts per 25-Hz DMA frame of 2*188*512 bytes
-**      and that means 3*25=3D75 Hz of interrupt frequency, as seen by
-**      watch cat /proc/interrupts
-**
-**      If this frequency is 3x lower (and data received in the DMA
-**      buffer don't start with 0x47, but in the middle of packets,
-**      whose lengths appear to be like 188 292 188 104 etc.
-**      this means VSYNC line is not connected in the hardware.
-**      (check soldering pcb and pins)
-**      The same behaviour of missing VSYNC can be duplicated on budget
-**      cards, by setting DD1_INIT trigger mode 7 in 3rd nibble.
-*/
-
-	// Setup RPS1 "program" (p35)
-	count =3D 0;
-
-
-	// Wait Source Line Counter Threshold                           (p36)
-	WRITE_RPS1(CMD_PAUSE | EVT_HS);
-	// Set GPIO3=3D1                                                  (p42)
-	WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
-	WRITE_RPS1(GPIO3_MSK);
-	WRITE_RPS1(SAA7146_GPIO_OUTHI<<24);
-#if RPS_IRQ
-	// issue RPS1 interrupt
-	WRITE_RPS1(CMD_INTERRUPT);
-#endif
-	// Wait reset Source Line Counter Threshold                     (p36)
-	WRITE_RPS1(CMD_PAUSE | RPS_INV | EVT_HS);
-	// Set GPIO3=3D0                                                  (p42)
-	WRITE_RPS1(CMD_WR_REG_MASK | (GPIO_CTRL>>2));
-	WRITE_RPS1(GPIO3_MSK);
-	WRITE_RPS1(SAA7146_GPIO_OUTLO<<24);
-#if RPS_IRQ
-	// issue RPS1 interrupt
-	WRITE_RPS1(CMD_INTERRUPT);
-#endif
-	// Jump to begin of RPS program                                 (p37)
-	WRITE_RPS1(CMD_JUMP);
-	WRITE_RPS1(dev->d_rps1.dma_handle);
-
-	// Fix VSYNC level
-	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-	// Set RPS1 Address register to point to RPS code               (r108 p4=
2)
-	saa7146_write(dev, RPS_ADDR1, dev->d_rps1.dma_handle);
-
-	if (!(budget =3D kmalloc (sizeof(struct budget_patch), GFP_KERNEL)))
-		return -ENOMEM;
-
-	dprintk(2, "budget: %p\n", budget);
-
-	err =3D ttpci_budget_init(budget, dev, info, THIS_MODULE, adapter_nr);
-	if (err) {
-		kfree(budget);
-		return err;
-	}
-
-	// Set Source Line Counter Threshold, using BRS                 (rCC p43=
)
-	// It generates HS event every TS_HEIGHT lines
-	// this is related to TS_WIDTH set in register
-	// NUM_LINE_BYTE3 in budget-core.c. If NUM_LINE_BYTE
-	// low 16 bits are set to TS_WIDTH bytes (TS_WIDTH=3D2*188
-	//,then RPS_THRESH1
-	// should be set to trigger every TS_HEIGHT (512) lines.
-	//
-	saa7146_write(dev, RPS_THRESH1, budget->buffer_height | MASK_12 );
-
-	// saa7146_write(dev, RPS_THRESH0, ((TS_HEIGHT/2)<<16) |MASK_28| (TS_HEI=
GHT/2) |MASK_12 );
-	// Enable RPS1                                                  (rFC p33=
)
-	saa7146_write(dev, MC1, (MASK_13 | MASK_29));
-
-
-	dev->ext_priv =3D budget;
-
-	budget->dvb_adapter.priv =3D budget;
-	frontend_init(budget);
-
-	ttpci_budget_init_hooks(budget);
-
-	return 0;
-}
-
-static int budget_patch_detach (struct saa7146_dev* dev)
-{
-	struct budget_patch *budget =3D (struct budget_patch*) dev->ext_priv;
-	int err;
-
-	if (budget->dvb_frontend) {
-		dvb_unregister_frontend(budget->dvb_frontend);
-		dvb_frontend_detach(budget->dvb_frontend);
-	}
-	err =3D ttpci_budget_deinit (budget);
-
-	kfree (budget);
-
-	return err;
-}
-
-static int __init budget_patch_init(void)
-{
-	return saa7146_register_extension(&budget_extension);
-}
-
-static void __exit budget_patch_exit(void)
-{
-	saa7146_unregister_extension(&budget_extension);
-}
-
-static struct saa7146_extension budget_extension =3D {
-	.name           =3D "budget_patch dvb",
-	.flags          =3D 0,
-
-	.module         =3D THIS_MODULE,
-	.pci_tbl        =3D pci_tbl,
-	.attach         =3D budget_patch_attach,
-	.detach         =3D budget_patch_detach,
-
-	.irq_mask       =3D MASK_10,
-	.irq_func       =3D ttpci_budget_irq10_handler,
-};
-
-module_init(budget_patch_init);
-module_exit(budget_patch_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Emard, Roberto Deza, Holger Waechtler, Michael Hunold, oth=
ers");
-MODULE_DESCRIPTION("Driver for full TS modified DVB-S SAA7146+AV7110 base=
d so-called Budget Patch cards");
=2D-
2.34.0


