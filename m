Return-Path: <linux-media+bounces-60678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOrnL/qH+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:27:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C70044DF51F
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AB66300FC23
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B764CA28E;
	Wed,  6 May 2026 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZJHV7JUd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FF4C6EFE
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091850; cv=none; b=fzX0eeZf+0XZ639U+c1ljeK1XK/N0IqyM6M3kgrPpD6QgNNuqu+gjQ7/q7/Xkbg+ObGE9PeEbblarqHWSrHzw+hpsBopNXOlfruKlBFZrOV9JFgD3TGbCfGyV+w6luaHIKnsyxtGyv92c6Rq4bu57r2cvQkjsl5LAbMPuleioiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091850; c=relaxed/simple;
	bh=LgZXwxnkssKH6vOPCvPwwV1bBZmH4E8jEazJBf5Jwuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQrWntVC8Yh0EXlUnctcHPAhaKi1X4+nVswo8y4Tg1RULq8EsprY1EDGSOBZ6zld3B0YXgCqtVluGke2sqB5Qvbhc1wCxssKgz4nDRgUyM9yqvKXloTT2mGyqbFhkC+/7BEM89qfwn5w+dIBpDKohBONE5VIjQ8XTCBhKlORpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZJHV7JUd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so32025e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091846; x=1778696646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4rKFRpOU1f6FRgs4DjqIZwveQeNsarmHK5JrkPCLp0=;
        b=ZJHV7JUdlVkq7+cYd0R87zw8gWf51UnIpWhpo4i+iWUTa4a5F5ryMFQVZwABVqIWTy
         szdprd4tsxa6Bkuj1gkbPwbHamv/Y/Cb4j3aaJqYGQ7GG8WkIqaYvo6zPz0TCadpN14y
         9mtdzwgkzIVpD89lKB30AnlakM9k1pgZrTLYBobRRI/0b04Zt9pFVqGzt755Ot6l1Sgd
         gZn4Kr9j03UHIutRJAzyordnUINz/OPsQmNFCaBOvmqDQI/XUpolEgLrtdclHyHitFyu
         bRsItjZX29URE7uvkNHldIn+9cAiN13VIzk6bPuUhWdWADMiDfpGt+HpJ+l7MaDLreVJ
         XIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091846; x=1778696646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v4rKFRpOU1f6FRgs4DjqIZwveQeNsarmHK5JrkPCLp0=;
        b=KkGqIxi9sYOgWnviuYGWFGngGBFFdRv4g9UwJZ6CrpSH53ImgwtimruBclJzDs5TCF
         vr1m5AzU3UYF9WAQqEaXzWe3fYmfPeu2omd9ag9WpIMm0w7z7RlUykbLODlr8u2xCitZ
         1mrHmTT1/hHdQlOuaTi6gl8W3Z3B8Wuof2zvqLnk3rDpBZOCDwr+PTNK8Co4gjQjqrn+
         Uy8Vjpy/w6AcSrUtpW48ihSEEroM7Vg+HsNCQhoMEoOvDakDYb3yc4w//bcusgj9UPH3
         Y5UICAOicsawr7zX/Jr44rtQQCdlWYf2DQi5hGJXmVijCsdQHJvDD40rXZI9VO1G/IhA
         mwvg==
X-Gm-Message-State: AOJu0YxnvJ/ZMyAOr9GQ8csNr/AQakTS1gtolhOlrigbTsRqk/uL7oXj
	gUKhFzkO4LurC6o6Q/fpsDunn9YF+MJgzxx3bOc0W7kydZKZ7kp7JDcOX2E2Zym8Tfp8iGrYJ8t
	9NzA0
X-Gm-Gg: AeBDiesxm9TnkHlkFcuipLgcBvsrdKSeboT4usqCpZ7HNMA7qRpQjjMpwF3WWVgSlA+
	38H2m3rZnIQuGiz8hqk4D1VpGT2eQpRY3OQEdWVjKjsyG6sgEy4E2MxjFOXzM+5Ujw1cepC8Rvc
	gER8QNLN/KfoPp4mQ9D+6GzAxZ0oUc3gMxDXab7qafFsfyx1yR0Qoutx0k/7XZ7DU3aEU8xKw3F
	M6wPJYgSovxomPKy4sJq8ny/+kaVycqeKmgI1kZTx+981uJa3z2uYzMIyHApOAnrDtlclTm00Ez
	Ynht20wPndMJzqVaDZGnNNl40Jw4YWAg1IXEJn7jqm9F8UyNh1PHyiD8GeG7fk9H9ZBw2Sj23cF
	eSc+8NRP01C9DEc9wYcONpgEalgrFs+T9ejxSy3ktKn17gENuT23ee7vI7bltVlcJNFq2GVB+Dv
	UrA0UE2F1k3sB/OwD7lQl8sdK6
X-Received: by 2002:a05:600c:b8a:b0:48a:5333:811e with SMTP id 5b1f17b1804b1-48e51f2f91cmr76913375e9.15.1778091845795;
        Wed, 06 May 2026 11:24:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:04 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:51 +0100
Subject: [PATCH 13/13] media: imx355: Support 2 lane readout.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-13-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: C70044DF51F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60678-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

The sensor supports 2 or 4 lane readout, but the driver only allowed
for 4 lanes. Add 2 lane support.

The clock tree was set to use single PLL mode to feed both IOP (MIPI)
and IVT (Pixel array).
2 lane mode supports a MIPI link frequency of up to 445MHz (890Mbit/s)
cf 360MHz (720Mbit/s) for 4lane, but that requires switching to dual
PLL mode as the rates can't be achieved with simple divisors.
The LLP values are extended for each mode to account for the increased
time per line over the MIPI link.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 135 ++++++++++++++++++++++++++++-----------------
 1 file changed, 84 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index d0e0e81d1e7c..fa1d1c86d5b0 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -27,10 +27,13 @@
 #define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX355_CHIP_ID			0x0355
 
+#define IMX355_REG_LANE_SEL		CCI_REG8(0x0114)
+
 /* PLL registers that depend on the external clock frequency */
 #define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
 #define IMX355_REG_PLL_VT_MUL		CCI_REG16(0x0306)
 #define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
+#define IMX355_REG_PLL_MODE		CCI_REG8(0x0310)
 
 /* V_TIMING internal */
 #define IMX355_REG_FLL			CCI_REG16(0x0340)
@@ -77,6 +80,8 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_REQ_LINK_BIT_RATE	CCI_REG16(0x0820)
+
 #define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
 #define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
 #define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
@@ -85,10 +90,10 @@
 #define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
 /* default link frequency and external clock */
-#define IMX355_LINK_FREQ_DEFAULT	360000000LL
+#define IMX355_LINK_FREQ_4LANE		360000000LL
+#define IMX355_LINK_FREQ_2LANE		445000000LL
 
-/* number of data lanes */
-#define IMX355_DATA_LANES		4
+#define IMX355_PIXEL_RATE		288000000
 
 #define IMX355_PIXEL_ARRAY_TOP		0
 #define IMX355_PIXEL_ARRAY_LEFT		0
@@ -110,8 +115,8 @@ struct imx355_mode {
 	/* V-timing */
 	u32 fll_def;
 
-	/* H-timing */
-	u32 llp;
+	/* H-timing - values for 4 lane and 2 lane */
+	u32 llp[2];
 
 	/* Default register values */
 	struct imx355_reg_list reg_list;
@@ -125,33 +130,38 @@ struct imx355_mode {
 
 struct imx355_clk_params {
 	u32 ext_clk;
-	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
-	u16 pll_vt_mpy;	/* VT system PLL multiplier */
-	u16 pll_op_mpy;	/* OP system PLL multiplier */
+	u16 extclk_freq;	/* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_vt_mpy[2];	/* VT system PLL multiplier */
+	u16 pll_op_mpy[2];	/* OP system PLL multiplier */
 };
 
 /*
- * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
- * so the multipliers are adjusted to produce the same VCO frequencies:
- *   VT VCO = 1152 MHz, OP VCO = 720 MHz
+ * For backwards compatibility, 4 lane mode uses the single PLL clock tree
+ * where only IOP matters. MIPI rate is 360Mhz (720Mbit/s), and pixel rate is
+ * 288MPix/s.
+ * 2 lane mode has a maximum MIPI rate of 445MHz (890Mbit/s) which requires
+ * switching to dual PLL mode if the pixel rate is to be kept the same.
+ *
+ * Multipliers are specified separately for 4 lane and 2 lane modes.
  */
 static const struct imx355_clk_params imx355_clk_params[] = {
 	{
 		.ext_clk = 19200000,
-		.extclk_freq = 0x1333,	/* 19.2 MHz */
-		.pll_vt_mpy = 120,	/* 19.2 / 2 * 120 = 1152 MHz */
-		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+		.extclk_freq = 0x1333,
+		.pll_vt_mpy = { 0,  75 },
+		.pll_op_mpy = { 75, 93 },
 	},
 	{
 		.ext_clk = 24000000,
-		.extclk_freq = 0x1800,	/* 24.0 MHz */
-		.pll_vt_mpy = 96,	/* 24.0 / 2 * 96  = 1152 MHz */
-		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+		.extclk_freq = 0x1800,
+		.pll_vt_mpy = { 0,  60 },
+		.pll_op_mpy = { 60, 74 },
 	},
 };
 
 struct imx355_hwcfg {
 	unsigned long link_freq_bitmap;
+	unsigned int num_lanes;
 };
 
 struct imx355 {
@@ -247,16 +257,12 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x305a), 0x00 },
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
-	{ CCI_REG8(0x0114), 0x03 },
 	{ CCI_REG8(0x0301), 0x05 },
 	{ CCI_REG8(0x0303), 0x01 },
 	{ CCI_REG8(0x0305), 0x02 },
 	{ CCI_REG8(0x030d), 0x02 },
-	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
-	{ CCI_REG8(0x0820), 0x0b },
-	{ CCI_REG8(0x0821), 0x40 },
 	{ CCI_REG8(0x3088), 0x04 },
 	{ CCI_REG8(0x6813), 0x02 },
 	{ CCI_REG8(0x6835), 0x07 },
@@ -349,17 +355,25 @@ static const char * const imx355_test_pattern_menu[] = {
  * When adding more than the one below, make sure the disallowed ones will
  * actually be disabled in the LINK_FREQ control.
  */
-static const s64 link_freq_menu_items[] = {
-	IMX355_LINK_FREQ_DEFAULT,
+static const s64 link_freq_menu_items_4lane[] = {
+	IMX355_LINK_FREQ_4LANE,
 };
 
+static const s64 link_freq_menu_items_2lane[] = {
+	IMX355_LINK_FREQ_2LANE,
+};
+
+/* Avoid the two arrays getting out of sync */
+static_assert(ARRAY_SIZE(link_freq_menu_items_4lane) ==
+				ARRAY_SIZE(link_freq_menu_items_2lane));
+
 /* Mode configs */
 static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3280,
 		.height = 2464,
 		.fll_def = 2615,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -374,7 +388,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 3268,
 		.height = 2448,
 		.fll_def = 2615,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
@@ -389,7 +403,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 3264,
 		.height = 2448,
 		.fll_def = 2615,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
@@ -404,7 +418,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1940,
 		.height = 1096,
 		.fll_def = 1306,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -419,7 +433,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1936,
 		.height = 1096,
 		.fll_def = 1306,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -434,7 +448,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1924,
 		.height = 1080,
 		.fll_def = 1306,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -449,7 +463,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1920,
 		.height = 1080,
 		.fll_def = 1306,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -464,7 +478,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1640,
 		.height = 1232,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -479,7 +493,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1640,
 		.height = 922,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -494,7 +508,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1300,
 		.height = 736,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -509,7 +523,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1296,
 		.height = 736,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -524,7 +538,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1284,
 		.height = 720,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -539,7 +553,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 1280,
 		.height = 720,
 		.fll_def = 1306,
-		.llp = 1836,
+		.llp = { 1836, 2970 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -554,7 +568,7 @@ static const struct imx355_mode supported_modes[] = {
 		.width = 820,
 		.height = 616,
 		.fll_def = 652,
-		.llp = 3672,
+		.llp = { 3672, 5942 },
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,
@@ -804,7 +818,8 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_FLL_OFFSET,
 					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
-		h_blank = mode->llp - imx355->cur_mode->width;
+		h_blank = mode->llp[imx355->hwcfg->num_lanes == 4 ? 0 : 1] -
+						imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
 		 * So FPS control is done only by vblank.
@@ -869,6 +884,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
 	int ret = 0;
 
 	/* Global Setting */
@@ -900,9 +916,19 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
 		  imx355->clk_params->extclk_freq, &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_VT_MUL,
-		  imx355->clk_params->pll_vt_mpy, &ret);
+		  imx355->clk_params->pll_vt_mpy[lane_idx], &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
-		  imx355->clk_params->pll_op_mpy, &ret);
+		  imx355->clk_params->pll_op_mpy[lane_idx], &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_MODE, lane_idx ? 0x01 : 0x00,
+		  &ret);
+
+	/* Set MIPI configuration */
+	cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
+		  imx355->hwcfg->num_lanes - 1, &ret);
+
+	cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE,
+		  (imx355->link_freq->qmenu_int[imx355->link_freq->val] *
+		   imx355->hwcfg->num_lanes * 2) / 1000000, &ret);
 
 	/* set digital gain control to all color mode */
 	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
@@ -1072,8 +1098,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 exposure_max;
 	s64 vblank_def;
 	s64 hblank;
-	u64 pixel_rate;
 	const struct imx355_mode *mode;
+	const s64 *link_freq_menu;
 	u32 max;
 	int ret;
 
@@ -1083,19 +1109,21 @@ static int imx355_init_controls(struct imx355 *imx355)
 		return ret;
 
 	ctrl_hdlr->lock = &imx355->mutex;
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
+
+	link_freq_menu = imx355->hwcfg->num_lanes == 4 ?
+				link_freq_menu_items_4lane :
+				link_freq_menu_items_2lane;
+	max = ARRAY_SIZE(link_freq_menu_items_4lane) - 1;
 	imx355->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx355_ctrl_ops,
 						   V4L2_CID_LINK_FREQ, max, 0,
-						   link_freq_menu_items);
+						   link_freq_menu);
 	if (imx355->link_freq)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
-	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+			  IMX355_PIXEL_RATE, IMX355_PIXEL_RATE, 1,
+			  IMX355_PIXEL_RATE);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;
@@ -1105,7 +1133,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 					   IMX355_FLL_MAX - mode->height,
 					   1, vblank_def);
 
-	hblank = mode->llp - mode->width;
+	hblank = mode->llp[imx355->hwcfg->num_lanes == 4 ? 0 : 1] - mode->width;
 	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, hblank,
 					   1, hblank);
@@ -1192,13 +1220,18 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4)
 		goto out_err;
 
+	cfg->num_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_freq_menu_items,
-				       ARRAY_SIZE(link_freq_menu_items),
+				       cfg->num_lanes == 4 ?
+						link_freq_menu_items_4lane :
+						link_freq_menu_items_2lane,
+				       ARRAY_SIZE(link_freq_menu_items_4lane),
 				       &cfg->link_freq_bitmap);
 	if (ret)
 		goto out_err;

-- 
2.34.1


