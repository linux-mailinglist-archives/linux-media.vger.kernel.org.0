Return-Path: <linux-media+bounces-9292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249B8A46E5
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49E85282F57
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161881BF40;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="Nvd4DRC7"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070113ACC
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147880; cv=none; b=emkeVMyaY4+E0kkQZ4+t4nzX9MQ3ZhSzwG6e0VhhAsfSi1fSjKXd8Pn3M7Fh2a7nHC45aOHNkskPjYFCxxucohOrn5rANJnLdx6jzZjN2c65FP1XaAHbFHr3lGFRnNRE6RuGZPpkop9YnF+IHLU3V8nPWBSjRV+nAg8nwx/5ees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147880; c=relaxed/simple;
	bh=83Kz0f3Th8jiKMXBXe2YJI2HKH1nvfEWKz8t7ZuCwSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3qrfxMesJFTN97bQNRvEgUHonZAx9lUouXWDGIOnTI8b02eX949UYvYw9UDwmTAVXQU8T4odqQQyMB0HfRh8CBVx/m3Z5UtulP3/9T+wvyhcpq9TynLx8bvQzOJrFQBkRp7tmpf+2bOaFuq9pPlxN96oL5BZ5dhhZ9jiOmwH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=Nvd4DRC7; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147872; x=1713752672; i=herdler@nurfuerspam.de;
	bh=kmQIgUb1ByhapF+d4puNqGHi9giwbVrMMBL6LP5X3fs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nvd4DRC7Z01+DUv90jryGPdZdYqyV022gAVqpMuohk+EkWVSmTI90qUsLB/EEDQe
	 dC7RhWFkfhvgcyyFKE5/bm1ty7KyLvKVdyqODVcGcOruy9njzMnxl+F0YrbqDF88H
	 5jSF4o02idkY7hCqqGIyyPvjTU23bMtMWZPCVAHvlr/67T4WHtoD0xP4RR9efu9ZW
	 TtL9Aa5inGyNbd/Zjr6j2kJwWZkfVHjxx1lu/rnVGNaiPw/U5ZDbfhoMxNI5L0rFp
	 O6stqIYP9BWbt/YVtHEoOKm2kMUNvJQPHhTt5h+w2sA1T9AWPZ5eOpHI3XrDKru0k
	 SdGhCaqqk8h6Bdv8wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1s0MUC3YaF-00FAfx; Mon, 15
 Apr 2024 04:24:31 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 01/10] media: ttpci: coding style fixes: whitespace and newlines
Date: Mon, 15 Apr 2024 04:24:02 +0200
Message-Id: <20240415022411.234580-2-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:uWs4ZwPUWsUz7F/SjULspV5uslQykPpVl0IZ62Tl3seH94zJEG2
 NaMKyT9XTf37vCjPWrqw+7DWkLnCz20cDNHtBiKNPyYbbfPfs+biJtc6HSbko3uU/id2I0d
 J6ZYx0jMESNE9Xcug0F6nG3B0kkPWH2XorRSes/XlcyVP92I6rLSaVoRYOtJqaA5umXpLB5
 9PpZxsEsqZP2PLkXUh7eA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jRHGgKiy+9Y=;P1Fa3AR0W1rYsNxXnKtU92xZQ8i
 T2maWkpyMvYDaK205Zdgq9rCwfsTUE+onKlc1IuUS1ksS6AMtWmUf1SBG1sq7zHZWvghsFd0f
 IwLKGaVokUsfX48O8VemXzIqwDW5BiF2xdw75W7v7A2Cnj1wGlkVsYEwWVqPBy8Eo1jbX/8Ho
 r0ezXjei8O78dil8nVdRwa0E3Da/ftxo3ZEyU1EmF/tjCYUTlsbE+bgTrqsBjtdZQoOp1QIS5
 LtYAAjK6344vnaq0cRJArOPo4LmafUf865kie8LWUaj7ZmpOhZCaKtUoqlOcScFAwkRPKDCeW
 LSWJYwvx1XRnVNHaxWq0WS/hqXTnXDCVctyRoVS8sB28+QqXH09VCDRdRpop8vWM2ICtrj60A
 jcpzour8UAe5trK9kazUNyjsTP2wpC24FZYhfcPiXLEKiIVNdHfqWWQeSk0UYX9Hg7RyY6+QR
 srbAHCDWijrqdJ1FwHFPigTFq6FzrQX/YOhhqAssM5k9XKqiX2mGPuAwuamayf40Knwl+r1BO
 nnx7jOS2cyZ4vAEjkNsZA1/z5NmhTcBGHP9DZ3LXAqk0LdnpiFTfTi1ji7meMOCsQ7MZP8LMH
 AxosxTNzqIs3tmuAd0+V5fT+mPQuenx+kknzjScEvtCXl5mZmxmyZR9Za6EdSdo+ECjNMb4yk
 +b4il8Hv91lC/79Fx5zCjzWMmO3b8fCOWWO8ZGiNl0kz9B4gX4Ys8anhYyGgSBwNHL07ZhT7u
 0jkiAe0a9G2m6hHjmJ/4DVwhED9FThibcuDKjzEcx6+10AOB3RLRYKQTFRc3M7GVHdbWonUBn
 /m4m8NZsNR6fAD32FdLhM1XrFq7V4aQ4i3hveTxEFqlSg=

This patch fixes the following checkpatch warnings and errors:

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
ERROR:SPACING: space prohibited after that open parenthesis '('
ERROR:SPACING: space prohibited before that close parenthesis ')'
ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
ERROR:SPACING: space required after that ',' (ctx:VxV)
ERROR:SPACING: space required before that '-' (ctx:OxV)
ERROR:SPACING: space required before the open parenthesis '('
ERROR:SPACING: spaces required around that '!=3D' (ctx:VxO)
ERROR:SPACING: spaces required around that '<' (ctx:VxV)
ERROR:SPACING: spaces required around that '=3D' (ctx:VxV)
ERROR:SPACING: spaces required around that '>=3D' (ctx:VxV)
WARNING:SPACING: space prohibited between function name and open parenthes=
is '('
WARNING:TABSTOP: Statements should start on a tabstop
WARNING:LEADING_SPACE: please, no spaces at the start of a line
WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statement=
s
WARNING:LINE_SPACING: Missing a blank line after declarations

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

 drivers/media/pci/ttpci/budget-av.c   | 30 +++++------
 drivers/media/pci/ttpci/budget-ci.c   | 14 ++---
 drivers/media/pci/ttpci/budget-core.c |  6 +--
 drivers/media/pci/ttpci/budget.c      | 74 ++++++++++++++-------------
 drivers/media/pci/ttpci/budget.h      |  8 +--
 5 files changed, 68 insertions(+), 64 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index a47c5850e..72ba9d3c3 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -95,12 +95,12 @@ static u8 i2c_readreg(struct i2c_adapter *i2c, u8 id, =
u8 reg)
 	return mm2[0];
 }

-static int i2c_readregs(struct i2c_adapter *i2c, u8 id, u8 reg, u8 * buf,=
 u8 len)
+static int i2c_readregs(struct i2c_adapter *i2c, u8 id, u8 reg, u8 *buf, =
u8 len)
 {
 	u8 mm1[] =3D { reg };
 	struct i2c_msg msgs[2] =3D {
-		{.addr =3D id / 2,.flags =3D 0,.buf =3D mm1,.len =3D 1},
-		{.addr =3D id / 2,.flags =3D I2C_M_RD,.buf =3D buf,.len =3D len}
+		{.addr =3D id / 2, .flags =3D 0, .buf =3D mm1, .len =3D 1},
+		{.addr =3D id / 2, .flags =3D I2C_M_RD, .buf =3D buf, .len =3D len}
 	};

 	if (i2c_transfer(i2c, msgs, 2) !=3D 2)
@@ -492,7 +492,7 @@ static int philips_su1278_ty_ci_tuner_set_params(struc=
t dvb_frontend *fe)
 	u32 div;
 	u8 buf[4];
 	struct budget *budget =3D fe->dvb->priv;
-	struct i2c_msg msg =3D {.addr =3D 0x61,.flags =3D 0,.buf =3D buf,.len =
=3D sizeof(buf) };
+	struct i2c_msg msg =3D {.addr =3D 0x61, .flags =3D 0, .buf =3D buf, .len=
 =3D sizeof(buf) };

 	if ((c->frequency < 950000) || (c->frequency > 2150000))
 		return -EINVAL;
@@ -606,7 +606,7 @@ static int philips_cu1216_tuner_set_params(struct dvb_=
frontend *fe)
 	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
 	struct budget *budget =3D fe->dvb->priv;
 	u8 buf[6];
-	struct i2c_msg msg =3D {.addr =3D 0x60,.flags =3D 0,.buf =3D buf,.len =
=3D sizeof(buf) };
+	struct i2c_msg msg =3D {.addr =3D 0x60, .flags =3D 0, .buf =3D buf, .len=
 =3D sizeof(buf) };
 	int i;

 #define CU1216_IF 36125000
@@ -670,7 +670,7 @@ static int philips_tu1216_tuner_init(struct dvb_fronte=
nd *fe)
 {
 	struct budget *budget =3D fe->dvb->priv;
 	static u8 tu1216_init[] =3D { 0x0b, 0xf5, 0x85, 0xab };
-	struct i2c_msg tuner_msg =3D {.addr =3D 0x60,.flags =3D 0,.buf =3D tu121=
6_init,.len =3D sizeof(tu1216_init) };
+	struct i2c_msg tuner_msg =3D {.addr =3D 0x60, .flags =3D 0, .buf =3D tu1=
216_init, .len =3D sizeof(tu1216_init) };

 	// setup PLL configuration
 	if (fe->ops.i2c_gate_ctrl)
@@ -687,7 +687,7 @@ static int philips_tu1216_tuner_set_params(struct dvb_=
frontend *fe)
 	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
 	struct budget *budget =3D fe->dvb->priv;
 	u8 tuner_buf[4];
-	struct i2c_msg tuner_msg =3D {.addr =3D 0x60,.flags =3D 0,.buf =3D tuner=
_buf,.len =3D
+	struct i2c_msg tuner_msg =3D {.addr =3D 0x60, .flags =3D 0, .buf =3D tun=
er_buf, .len =3D
 			sizeof(tuner_buf) };
 	int tuner_frequency =3D 0;
 	u8 band, cp, filter;
@@ -865,7 +865,7 @@ static int philips_sd1878_ci_set_symbol_rate(struct dv=
b_frontend *fe,

 static const struct stv0299_config philips_sd1878_config =3D {
 	.demod_address =3D 0x68,
-     .inittab =3D philips_sd1878_inittab,
+	.inittab =3D philips_sd1878_inittab,
 	.mclk =3D 88000000UL,
 	.invert =3D 0,
 	.skip_reinit =3D 0,
@@ -1153,8 +1153,8 @@ static u8 read_pwm(struct budget_av *budget_av)
 {
 	u8 b =3D 0xff;
 	u8 pwm;
-	struct i2c_msg msg[] =3D { {.addr =3D 0x50,.flags =3D 0,.buf =3D &b,.len=
 =3D 1},
-	{.addr =3D 0x50,.flags =3D I2C_M_RD,.buf =3D &pwm,.len =3D 1}
+	struct i2c_msg msg[] =3D { {.addr =3D 0x50, .flags =3D 0, .buf =3D &b, .=
len =3D 1},
+	{.addr =3D 0x50, .flags =3D I2C_M_RD, .buf =3D &pwm, .len =3D 1}
 	};

 	if ((i2c_transfer(&budget_av->budget.i2c_adap, msg, 2) !=3D 2)
@@ -1196,8 +1196,8 @@ static u8 read_pwm(struct budget_av *budget_av)

 static void frontend_init(struct budget_av *budget_av)
 {
-	struct saa7146_dev * saa =3D budget_av->budget.dev;
-	struct dvb_frontend * fe =3D NULL;
+	struct saa7146_dev *saa =3D budget_av->budget.dev;
+	struct dvb_frontend *fe =3D NULL;

 	/* Enable / PowerON Frontend */
 	saa7146_setgpio(saa, 0, SAA7146_GPIO_OUTLO);
@@ -1351,7 +1351,7 @@ static void frontend_init(struct budget_av *budget_a=
v)
 }


-static void budget_av_irq(struct saa7146_dev *dev, u32 * isr)
+static void budget_av_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct budget_av *budget_av =3D dev->ext_priv;

@@ -1532,8 +1532,8 @@ static struct saa7146_ext_vv vv_data =3D {
 static struct saa7146_extension budget_extension;

 MAKE_BUDGET_INFO(knc1s, "KNC1 DVB-S", BUDGET_KNC1S);
-MAKE_BUDGET_INFO(knc1s2,"KNC1 DVB-S2", BUDGET_KNC1S2);
-MAKE_BUDGET_INFO(sates2,"Satelco EasyWatch DVB-S2", BUDGET_KNC1S2);
+MAKE_BUDGET_INFO(knc1s2, "KNC1 DVB-S2", BUDGET_KNC1S2);
+MAKE_BUDGET_INFO(sates2, "Satelco EasyWatch DVB-S2", BUDGET_KNC1S2);
 MAKE_BUDGET_INFO(knc1c, "KNC1 DVB-C", BUDGET_KNC1C);
 MAKE_BUDGET_INFO(knc1t, "KNC1 DVB-T", BUDGET_KNC1T);
 MAKE_BUDGET_INFO(kncxs, "KNC TV STAR DVB-S", BUDGET_TVSTAR);
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index 66e1a004e..569e8915a 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -551,7 +551,7 @@ static void ciintf_deinit(struct budget_ci *budget_ci)
 	saa7146_write(saa, MC1, MASK_27);
 }

-static void budget_ci_irq(struct saa7146_dev *dev, u32 * isr)
+static void budget_ci_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct budget_ci *budget_ci =3D dev->ext_priv;

@@ -651,7 +651,7 @@ static int philips_su1278_tt_tuner_set_params(struct d=
vb_frontend *fe)
 	struct budget_ci *budget_ci =3D fe->dvb->priv;
 	u32 div;
 	u8 buf[4];
-	struct i2c_msg msg =3D {.addr =3D 0x60,.flags =3D 0,.buf =3D buf,.len =
=3D sizeof(buf) };
+	struct i2c_msg msg =3D {.addr =3D 0x60, .flags =3D 0, .buf =3D buf, .len=
 =3D sizeof(buf) };

 	if ((p->frequency < 950000) || (p->frequency > 2150000))
 		return -EINVAL;
@@ -701,7 +701,7 @@ static int philips_tdm1316l_tuner_init(struct dvb_fron=
tend *fe)
 	struct budget_ci *budget_ci =3D fe->dvb->priv;
 	static u8 td1316_init[] =3D { 0x0b, 0xf5, 0x85, 0xab };
 	static u8 disable_mc44BC374c[] =3D { 0x1d, 0x74, 0xa0, 0x68 };
-	struct i2c_msg tuner_msg =3D {.addr =3D budget_ci->tuner_pll_address,.fl=
ags =3D 0,.buf =3D td1316_init,.len =3D
+	struct i2c_msg tuner_msg =3D {.addr =3D budget_ci->tuner_pll_address, .f=
lags =3D 0, .buf =3D td1316_init, .len =3D
 			sizeof(td1316_init) };

 	// setup PLL configuration
@@ -731,7 +731,7 @@ static int philips_tdm1316l_tuner_set_params(struct dv=
b_frontend *fe)
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
 	struct budget_ci *budget_ci =3D fe->dvb->priv;
 	u8 tuner_buf[4];
-	struct i2c_msg tuner_msg =3D {.addr =3D budget_ci->tuner_pll_address,.fl=
ags =3D 0,.buf =3D tuner_buf,.len =3D sizeof(tuner_buf) };
+	struct i2c_msg tuner_msg =3D {.addr =3D budget_ci->tuner_pll_address, .f=
lags =3D 0, .buf =3D tuner_buf, .len =3D sizeof(tuner_buf) };
 	int tuner_frequency =3D 0;
 	u8 band, cp, filter;

@@ -1427,8 +1427,8 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 					budget_ci->budget.dvb_frontend =3D NULL;
 				}
 			} else {
-					dvb_frontend_detach(budget_ci->budget.dvb_frontend);
-					budget_ci->budget.dvb_frontend =3D NULL;
+				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
+				budget_ci->budget.dvb_frontend =3D NULL;
 			}
 		}
 		break;
@@ -1538,7 +1538,7 @@ static const struct pci_device_id pci_tbl[] =3D {
 	MAKE_EXTENSION_PCI(ttbs1500b, 0x13c2, 0x101b),
 	{
 	 .vendor =3D 0,
-	 }
+	}
 };

 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index 25f44c3ee..ffa659be1 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -80,7 +80,7 @@ static int start_ts_capture(struct budget *budget)
 	 *      Pitch: 188, NumBytes3: 188, NumLines3: 1024
 	 */

-	switch(budget->card->type) {
+	switch (budget->card->type) {
 	case BUDGET_FS_ACTIVY:
 		saa7146_write(dev, DD1_INIT, 0x04000000);
 		saa7146_write(dev, MC2, (MASK_09 | MASK_25));
@@ -423,7 +423,7 @@ int ttpci_budget_init(struct budget *budget, struct sa=
a7146_dev *dev,
 	budget->card =3D bi;
 	budget->dev =3D (struct saa7146_dev *) dev;

-	switch(budget->card->type) {
+	switch (budget->card->type) {
 	case BUDGET_FS_ACTIVY:
 		budget->buffer_width =3D TS_WIDTH_ACTIVY;
 		max_bufsize =3D TS_MAX_BUFSIZE_K_ACTIVY;
@@ -568,7 +568,7 @@ int ttpci_budget_deinit(struct budget *budget)
 	return 0;
 }

-void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 * isr)
+void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 *isr)
 {
 	struct budget *budget =3D dev->ext_priv;

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index b76a1b330..aab94c4d7 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -42,9 +42,10 @@ MODULE_PARM_DESC(diseqc_method, "Select DiSEqC method f=
or subsystem id 13c2:1003

 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);

-static void Set22K (struct budget *budget, int state)
+static void Set22K(struct budget *budget, int state)
 {
-	struct saa7146_dev *dev=3Dbudget->dev;
+	struct saa7146_dev *dev =3D budget->dev;
+
 	dprintk(2, "budget: %p\n", budget);
 	saa7146_setgpio(dev, 3, (state ? SAA7146_GPIO_OUTHI : SAA7146_GPIO_OUTLO=
));
 }
@@ -53,9 +54,10 @@ static void Set22K (struct budget *budget, int state)
 /* taken from the Skyvision DVB driver by
    Ralph Metzler <rjkm@metzlerbros.de> */

-static void DiseqcSendBit (struct budget *budget, int data)
+static void DiseqcSendBit(struct budget *budget, int data)
 {
-	struct saa7146_dev *dev=3Dbudget->dev;
+	struct saa7146_dev *dev =3D budget->dev;
+
 	dprintk(2, "budget: %p\n", budget);

 	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTHI);
@@ -64,13 +66,13 @@ static void DiseqcSendBit (struct budget *budget, int =
data)
 	udelay(data ? 1000 : 500);
 }

-static void DiseqcSendByte (struct budget *budget, int data)
+static void DiseqcSendByte(struct budget *budget, int data)
 {
-	int i, par=3D1, d;
+	int i, par =3D 1, d;

 	dprintk(2, "budget: %p\n", budget);

-	for (i=3D7; i>=3D0; i--) {
+	for (i =3D 7; i >=3D 0; i--) {
 		d =3D (data>>i)&1;
 		par ^=3D d;
 		DiseqcSendBit(budget, d);
@@ -79,9 +81,9 @@ static void DiseqcSendByte (struct budget *budget, int d=
ata)
 	DiseqcSendBit(budget, par);
 }

-static int SendDiSEqCMsg (struct budget *budget, int len, u8 *msg, unsign=
ed long burst)
+static int SendDiSEqCMsg(struct budget *budget, int len, u8 *msg, unsigne=
d long burst)
 {
-	struct saa7146_dev *dev=3Dbudget->dev;
+	struct saa7146_dev *dev =3D budget->dev;
 	int i;

 	dprintk(2, "budget: %p\n", budget);
@@ -89,12 +91,12 @@ static int SendDiSEqCMsg (struct budget *budget, int l=
en, u8 *msg, unsigned long
 	saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
 	mdelay(16);

-	for (i=3D0; i<len; i++)
+	for (i =3D 0; i < len; i++)
 		DiseqcSendByte(budget, msg[i]);

 	mdelay(16);

-	if (burst!=3D-1) {
+	if (burst !=3D -1) {
 		if (burst)
 			DiseqcSendByte(budget, 0xff);
 		else {
@@ -118,7 +120,7 @@ static int SendDiSEqCMsg (struct budget *budget, int l=
en, u8 *msg, unsigned long
 static int SetVoltage_Activy(struct budget *budget,
 			     enum fe_sec_voltage voltage)
 {
-	struct saa7146_dev *dev=3Dbudget->dev;
+	struct saa7146_dev *dev =3D budget->dev;

 	dprintk(2, "budget: %p\n", budget);

@@ -146,7 +148,7 @@ static int siemens_budget_set_voltage(struct dvb_front=
end *fe,
 {
 	struct budget *budget =3D fe->dvb->priv;

-	return SetVoltage_Activy (budget, voltage);
+	return SetVoltage_Activy(budget, voltage);
 }

 static int budget_set_tone(struct dvb_frontend *fe,
@@ -156,11 +158,11 @@ static int budget_set_tone(struct dvb_frontend *fe,

 	switch (tone) {
 	case SEC_TONE_ON:
-		Set22K (budget, 1);
+		Set22K(budget, 1);
 		break;

 	case SEC_TONE_OFF:
-		Set22K (budget, 0);
+		Set22K(budget, 0);
 		break;

 	default:
@@ -170,11 +172,11 @@ static int budget_set_tone(struct dvb_frontend *fe,
 	return 0;
 }

-static int budget_diseqc_send_master_cmd(struct dvb_frontend* fe, struct =
dvb_diseqc_master_cmd* cmd)
+static int budget_diseqc_send_master_cmd(struct dvb_frontend *fe, struct =
dvb_diseqc_master_cmd *cmd)
 {
 	struct budget *budget =3D fe->dvb->priv;

-	SendDiSEqCMsg (budget, cmd->msg_len, cmd->msg, 0);
+	SendDiSEqCMsg(budget, cmd->msg_len, cmd->msg, 0);

 	return 0;
 }
@@ -184,7 +186,7 @@ static int budget_diseqc_send_burst(struct dvb_fronten=
d *fe,
 {
 	struct budget *budget =3D fe->dvb->priv;

-	SendDiSEqCMsg (budget, 0, NULL, minicmd);
+	SendDiSEqCMsg(budget, 0, NULL, minicmd);

 	return 0;
 }
@@ -220,7 +222,7 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
 	return 0;
 }

@@ -248,7 +250,7 @@ static int alps_tdbe2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
 	return 0;
 }

@@ -303,7 +305,7 @@ static int grundig_29504_401_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
 	return 0;
 }

@@ -333,7 +335,7 @@ static int grundig_29504_451_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
 	return 0;
 }

@@ -365,7 +367,7 @@ static int s5h1420_tuner_set_params(struct dvb_fronten=
d *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer (&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;

 	return 0;
 }
@@ -422,12 +424,12 @@ static int i2c_readreg(struct i2c_adapter *i2c, u8 a=
dr, u8 reg)
 	return (i2c_transfer(i2c, msg, 2) !=3D 2) ? -EIO : val;
 }

-static u8 read_pwm(struct budget* budget)
+static u8 read_pwm(struct budget *budget)
 {
 	u8 b =3D 0xff;
 	u8 pwm;
-	struct i2c_msg msg[] =3D { { .addr =3D 0x50,.flags =3D 0,.buf =3D &b,.le=
n =3D 1 },
-				 { .addr =3D 0x50,.flags =3D I2C_M_RD,.buf =3D &pwm,.len =3D 1} };
+	struct i2c_msg msg[] =3D { { .addr =3D 0x50, .flags =3D 0, .buf =3D &b, =
.len =3D 1 },
+				 { .addr =3D 0x50, .flags =3D I2C_M_RD, .buf =3D &pwm, .len =3D 1} };

 	if ((i2c_transfer(&budget->i2c_adap, msg, 2) !=3D 2) || (pwm =3D=3D 0xff=
))
 		pwm =3D 0x48;
@@ -478,7 +480,7 @@ static void frontend_init(struct budget *budget)
 {
 	(void)alps_bsbe1_config; /* avoid warning */

-	switch(budget->dev->pci->subsystem_device) {
+	switch (budget->dev->pci->subsystem_device) {
 	case 0x1003: // Hauppauge/TT Nova budget (stv0299/ALPS BSRU6(tsa5059) OR=
 ves1893/ALPS BSRV2(sp5659))
 	case 0x1013:
 		// try the ALPS BSRV2 first of all
@@ -642,6 +644,7 @@ static void frontend_init(struct budget *budget)

 	case 0x101c: { /* TT S2-1600 */
 			const struct stv6110x_devctl *ctl;
+
 			saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTLO);
 			msleep(50);
 			saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTHI);
@@ -695,6 +698,7 @@ static void frontend_init(struct budget *budget)

 	case 0x1020: { /* Omicom S2 */
 			const struct stv6110x_devctl *ctl;
+
 			saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTLO);
 			msleep(50);
 			saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTHI);
@@ -769,13 +773,13 @@ static void frontend_init(struct budget *budget)
 	return;
 }

-static int budget_attach (struct saa7146_dev* dev, struct saa7146_pci_ext=
ension_data *info)
+static int budget_attach(struct saa7146_dev *dev, struct saa7146_pci_exte=
nsion_data *info)
 {
 	struct budget *budget =3D NULL;
 	int err;

 	budget =3D kmalloc(sizeof(struct budget), GFP_KERNEL);
-	if( NULL =3D=3D budget ) {
+	if (NULL =3D=3D budget) {
 		return -ENOMEM;
 	}

@@ -786,7 +790,7 @@ static int budget_attach (struct saa7146_dev* dev, str=
uct saa7146_pci_extension_
 	err =3D ttpci_budget_init(budget, dev, info, THIS_MODULE, adapter_nr);
 	if (err) {
 		printk("=3D=3D> failed\n");
-		kfree (budget);
+		kfree(budget);
 		return err;
 	}

@@ -798,7 +802,7 @@ static int budget_attach (struct saa7146_dev* dev, str=
uct saa7146_pci_extension_
 	return 0;
 }

-static int budget_detach (struct saa7146_dev* dev)
+static int budget_detach(struct saa7146_dev *dev)
 {
 	struct budget *budget =3D dev->ext_priv;
 	int err;
@@ -808,9 +812,9 @@ static int budget_detach (struct saa7146_dev* dev)
 		dvb_frontend_detach(budget->dvb_frontend);
 	}

-	err =3D ttpci_budget_deinit (budget);
+	err =3D ttpci_budget_deinit(budget);

-	kfree (budget);
+	kfree(budget);
 	dev->ext_priv =3D NULL;

 	return err;
@@ -839,8 +843,8 @@ static const struct pci_device_id pci_tbl[] =3D {
 	MAKE_EXTENSION_PCI(ttbs,  0x13c2, 0x1016),
 	MAKE_EXTENSION_PCI(ttbs1401, 0x13c2, 0x1018),
 	MAKE_EXTENSION_PCI(tt1600, 0x13c2, 0x101c),
-	MAKE_EXTENSION_PCI(fsacs1,0x1131, 0x4f60),
-	MAKE_EXTENSION_PCI(fsacs0,0x1131, 0x4f61),
+	MAKE_EXTENSION_PCI(fsacs1, 0x1131, 0x4f60),
+	MAKE_EXTENSION_PCI(fsacs0, 0x1131, 0x4f61),
 	MAKE_EXTENSION_PCI(fsact1, 0x1131, 0x5f60),
 	MAKE_EXTENSION_PCI(fsact, 0x1131, 0x5f61),
 	MAKE_EXTENSION_PCI(omicom, 0x14c4, 0x1020),
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/bu=
dget.h
index bd87432e6..4579243c2 100644
=2D-- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -83,10 +83,10 @@ struct budget {
 	void *priv;
 };

-#define MAKE_BUDGET_INFO(x_var,x_name,x_type) \
+#define MAKE_BUDGET_INFO(x_var, x_name, x_type) \
 static struct budget_info x_var ## _info =3D { \
-	.name=3Dx_name,	\
-	.type=3Dx_type };	\
+	.name =3D x_name,	\
+	.type =3D x_type };	\
 static struct saa7146_pci_extension_data x_var =3D { \
 	.ext_priv =3D &x_var ## _info, \
 	.ext =3D &budget_extension };
@@ -119,7 +119,7 @@ extern int ttpci_budget_init(struct budget *budget, st=
ruct saa7146_dev *dev,
 			     struct module *owner, short *adapter_nums);
 extern void ttpci_budget_init_hooks(struct budget *budget);
 extern int ttpci_budget_deinit(struct budget *budget);
-extern void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 * isr=
);
+extern void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 *isr)=
;
 extern void ttpci_budget_set_video_port(struct saa7146_dev *dev, int vide=
o_port);
 extern int ttpci_budget_debiread(struct budget *budget, u32 config, int a=
ddr, int count,
 				 int uselocks, int nobusyloop);
=2D-
2.34.0


