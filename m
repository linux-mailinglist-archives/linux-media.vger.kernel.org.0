Return-Path: <linux-media+bounces-25413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310CA21FF0
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 16:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96E7167F52
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 15:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F001DE2A4;
	Wed, 29 Jan 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UMC/tFdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7F1B4F15
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163040; cv=none; b=r9O33GAMrHzPmdTW+iP9HkiKrVggsLf4dCkq20ekREvGlvi+BiYagSmS1F29+tvyPvEXhYBod5a5ogY7WtkCtqEGvLsEDfyM/gX1/3LDnbornI8/OZDczCNtLgCI1Tq2RqBgrxIzs4EgiQ47kXz6pvSnj5IUbJpIQ4KACf1YBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163040; c=relaxed/simple;
	bh=6lq47fOjlA0UWXV5aFwDu8hAWqziXfD5gNuaTIVaD1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQ/VQFYtE0ytrwhaaGoc8v8dEZtZaRTjKtX2FXojzr0VTSwerwFsz+W7PeHYe/W5Fwy8ROY7vJuNDaikE66I43G64iC2E8cDIzLzk41zdfO1+RhzNPI6Gky8EaiIh8LMKP7fcrTjWKs1uNDXOjO/+Ra1JQwHTRcegg4sGuNA7cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UMC/tFdH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361c705434so50258835e9.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 07:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738163036; x=1738767836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4QQH2LhDX2v4Lr/mwCZzmNPhylNtOOaNds4qlvJsCs=;
        b=UMC/tFdH4OJIHw4LarXaQ33RggTx4/B8YOydlfOsMzb78nInXNt0Teh7WLNiS+8aTO
         3+3QCccvOpzgkgzA6nO0ZRUfpG/6fbkWDboJf4bI9CcL3varNvYYX+z5t3SaXl7A00gz
         4QtXcd9GtTQAMK6486W248qLN1lI9uSghlv4SrNZMk0kW+0GfGYg/Jn163+F+dWzMVOy
         GafpqX1tRXd8UlJqueSNDvU+7lsx3aFyDjPnRk2NxI42IrY7XlC/w+uGPfHuXVuipUa8
         FIwsPo84OwHmammppHU+owhFyqLZkSJEGdbdRASq2rIXADPs4qezbPN1y2fvoY0fIxoC
         KWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163036; x=1738767836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4QQH2LhDX2v4Lr/mwCZzmNPhylNtOOaNds4qlvJsCs=;
        b=SruB1Vb1HVzTpo+KMII0xOWXyEdXonfGd9h8TOgYWImOuoI5OsCflnu92+CrXOV9tA
         ySsB1yGMngX/pY4n/24zqHgglaFNQYBucxlSq5qU+qhAUylj5wsRmjuR0zDQM8N5SEyN
         BkT39jiwiUExns/VfF/PBVTUmOzdlLz9yFJ9Zis/QvX2O94QQsa95zD0VT3XjgaZ/b/b
         a1cKEwdz60xqJdpzC8payvEBMIIuVlx0S9tEWrOcHm5rPlLIST+VsZrzVh41Vvucvufp
         f1zUd9h4yzVH5qVZoY/Jgb++tVMdlhyt/u5tyZqSzbpvxrWYhb7ekDkF9fDJK8mWKWzJ
         D8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVOn8XtTifMr92uLAqultV2LvhlaAqePvHvQtQkSLEoOnbBXF72meqZQom+v9YqhxSJ3J1cGNT7uZleCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMT5B7/phAU6uHshaeF64072VGgWNWjoIumUW5y5P1HYCjME8B
	IWW4Jjab0tm7l5aVUZ+fy/dogUutixzH06cYMgkBH0r6fKHfupPOSGOUYkotMes=
X-Gm-Gg: ASbGncuR8+u11LUCvu+bodHos7zDH48S36mNueFDKq2QZ7OTMkhoO/XAcYjh+iFxufS
	hEI5sRumymVT945/0WTSKuW0+HkNgCO35u9/DVz5ZfQTBsZoFPSgW+BuE6J2LkpiZCK1poy95Bb
	/AB0SEHTdBQl9jltOaWs5RbhHetq/6avMe8SExhJo2SmOcXWoI6nLd0VSy2gvCtL5P9aNdFOW0C
	YaiyFax+xNwALihVjTRGjpu8If7ajmpFu74ju8cmQwr2nzsYfsULNKjq98/SelAeq/B41GcBGZ9
	8uVCEH4=
X-Google-Smtp-Source: AGHT+IHcuetWf+UaKHuqmqU6qq8pdnBMvbnW+SXpsW7HJY5czzG8tcqbBU5MA4lTaWcGf2ndpfCicg==
X-Received: by 2002:a05:600c:1c99:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-438dc40be3dmr28201565e9.22.1738163036351;
        Wed, 29 Jan 2025 07:03:56 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438d755375bsm39074745e9.0.2025.01.29.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:55 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 15:03:50 +0000
Subject: [PATCH v3 2/3] media: i2c: imx415: Make HBLANK controllable and in
 consistent units
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-media-imx415-v3-2-d16d4fa8fc10@raspberrypi.com>
References: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
In-Reply-To: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The control of HMAX documented in the datasheet is consistent
with being in terms of a scaled INCK, being always 72MHz or
74.25MHz. It is NOT link frequency dependent, but the minimum
value for HMAX is dictated by the link frequency.

If PIXEL_RATE is defined as being 12 times the 72 or 74.25MHz,
and all values are scaled down again when writing HMAX, then
the numbers all work out regardless of INCK or link frequency.
Retain an hmax_min (set to the same value as the previous fixed
hmax register value) to set as the default value to avoid changing
the behaviour for existing users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx415.c | 88 +++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index fa7ffb9220e5..86dbcfcd820d 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -28,6 +28,9 @@
 #define IMX415_PIXEL_ARRAY_VBLANK 58
 #define IMX415_EXPOSURE_OFFSET	  8
 
+#define IMX415_PIXEL_RATE_74_25MHZ	891000000
+#define IMX415_PIXEL_RATE_72MHZ		864000000
+
 #define IMX415_NUM_CLK_PARAM_REGS 11
 
 #define IMX415_MODE		  CCI_REG8(0x3000)
@@ -54,6 +57,8 @@
 #define IMX415_VMAX		  CCI_REG24_LE(0x3024)
 #define IMX415_VMAX_MAX		  0xfffff
 #define IMX415_HMAX		  CCI_REG16_LE(0x3028)
+#define IMX415_HMAX_MAX		  0xffff
+#define IMX415_HMAX_MULTIPLIER	  12
 #define IMX415_SHR0		  CCI_REG24_LE(0x3050)
 #define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
 #define IMX415_AGAIN_MIN	  0
@@ -449,7 +454,6 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_720[] = {
-	{ IMX415_HMAX, 0x07F0 },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
 	{ IMX415_TCLKPOST, 0x006F },
 	{ IMX415_TCLKPREPARE, 0x002F },
@@ -464,7 +468,6 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
 
 /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_1440[] = {
-	{ IMX415_HMAX, 0x042A },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
 	{ IMX415_TCLKPOST, 0x009F },
 	{ IMX415_TCLKPREPARE, 0x0057 },
@@ -479,7 +482,6 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 
 /* all-pixel 4-lane 891 Mbps 30 Hz mode */
 static const struct cci_reg_sequence imx415_mode_4_891[] = {
-	{ IMX415_HMAX, 0x044C },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
 	{ IMX415_TCLKPOST, 0x007F },
 	{ IMX415_TCLKPREPARE, 0x0037 },
@@ -497,39 +499,10 @@ struct imx415_mode_reg_list {
 	const struct cci_reg_sequence *regs;
 };
 
-/*
- * Mode : number of lanes, lane rate and frame rate dependent settings
- *
- * pixel_rate and hmax_pix are needed to calculate hblank for the v4l2 ctrl
- * interface. These values can not be found in the data sheet and should be
- * treated as virtual values. Use following table when adding new modes.
- *
- * lane_rate  lanes    fps     hmax_pix   pixel_rate
- *
- *     594      2     10.000     4400       99000000
- *     891      2     15.000     4400      148500000
- *     720      2     15.748     4064      144000000
- *    1782      2     30.000     4400      297000000
- *    2079      2     30.000     4400      297000000
- *    1440      2     30.019     4510      304615385
- *
- *     594      4     20.000     5500      247500000
- *     594      4     25.000     4400      247500000
- *     720      4     25.000     4400      247500000
- *     720      4     30.019     4510      304615385
- *     891      4     30.000     4400      297000000
- *    1440      4     30.019     4510      304615385
- *    1440      4     60.038     4510      609230769
- *    1485      4     60.000     4400      594000000
- *    1782      4     60.000     4400      594000000
- *    2079      4     60.000     4400      594000000
- *    2376      4     90.164     4392      891000000
- */
 struct imx415_mode {
 	u64 lane_rate;
 	u32 lanes;
-	u32 hmax_pix;
-	u64 pixel_rate;
+	u32 hmax_min;
 	struct imx415_mode_reg_list reg_list;
 };
 
@@ -538,8 +511,7 @@ static const struct imx415_mode supported_modes[] = {
 	{
 		.lane_rate = 720000000,
 		.lanes = 2,
-		.hmax_pix = 4064,
-		.pixel_rate = 144000000,
+		.hmax_min = 2032,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(imx415_mode_2_720),
 			.regs = imx415_mode_2_720,
@@ -548,8 +520,7 @@ static const struct imx415_mode supported_modes[] = {
 	{
 		.lane_rate = 1440000000,
 		.lanes = 2,
-		.hmax_pix = 4510,
-		.pixel_rate = 304615385,
+		.hmax_min = 1066,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1440),
 			.regs = imx415_mode_2_1440,
@@ -558,8 +529,7 @@ static const struct imx415_mode supported_modes[] = {
 	{
 		.lane_rate = 891000000,
 		.lanes = 4,
-		.hmax_pix = 4400,
-		.pixel_rate = 297000000,
+		.hmax_min = 1100,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(imx415_mode_4_891),
 			.regs = imx415_mode_4_891,
@@ -586,6 +556,7 @@ static const char *const imx415_test_pattern_menu[] = {
 struct imx415 {
 	struct device *dev;
 	struct clk *clk;
+	unsigned long pixel_rate;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(imx415_supply_names)];
 	struct gpio_desc *reset;
 	struct regmap *regmap;
@@ -597,6 +568,7 @@ struct imx415 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *exposure;
@@ -787,6 +759,13 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = imx415_set_testpattern(sensor, ctrl->val);
 		break;
 
+	case V4L2_CID_HBLANK:
+		ret = cci_write(sensor->regmap, IMX415_HMAX,
+				(format->width + ctrl->val) /
+						IMX415_HMAX_MULTIPLIER,
+				NULL);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -805,12 +784,11 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
-	u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
 	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
 			   IMX415_PIXEL_ARRAY_VBLANK -
 			   IMX415_EXPOSURE_OFFSET;
-	u32 hblank;
+	u32 hblank_min, hblank_max;
 	unsigned int i;
 	int ret;
 
@@ -847,12 +825,14 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 			  IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
 			  IMX415_AGAIN_MIN);
 
-	hblank = supported_modes[sensor->cur_mode].hmax_pix -
-		 IMX415_PIXEL_ARRAY_WIDTH;
+	hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
+		      IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
+	hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
+		     IMX415_PIXEL_ARRAY_WIDTH;
 	ctrl = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
-				 V4L2_CID_HBLANK, hblank, hblank, 1, hblank);
-	if (ctrl)
-		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+				 V4L2_CID_HBLANK, hblank_min,
+				 hblank_max, IMX415_HMAX_MULTIPLIER,
+				 hblank_min);
 
 	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					   V4L2_CID_VBLANK,
@@ -860,8 +840,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 					   IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
 					   1, IMX415_PIXEL_ARRAY_VBLANK);
 
-	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
-			  pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  sensor->pixel_rate, sensor->pixel_rate, 1,
+			  sensor->pixel_rate);
 
 	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1333,6 +1314,17 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 				    "no valid sensor mode defined\n");
 		goto done_endpoint_free;
 	}
+	switch (inck) {
+	case 27000000:
+	case 37125000:
+	case 74250000:
+		sensor->pixel_rate = IMX415_PIXEL_RATE_74_25MHZ;
+		break;
+	case 24000000:
+	case 72000000:
+		sensor->pixel_rate = IMX415_PIXEL_RATE_72MHZ;
+		break;
+	}
 
 	lane_rate = supported_modes[sensor->cur_mode].lane_rate;
 	for (i = 0; i < ARRAY_SIZE(imx415_clk_params); ++i) {

-- 
2.34.1


