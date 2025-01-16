Return-Path: <linux-media+bounces-24853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D366A1410D
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 18:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E34B53A8A65
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 17:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6B622F3AF;
	Thu, 16 Jan 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ocF8OCjA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E1153598
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049404; cv=none; b=JZX10AWZmoVnDtBthMeey/o1AE2hamsjDe5HyowSzwb3wqPHA0PRNRIrk56A6WFCNTOt9fpLG7Na16Gg2KMHT7gc2Lm4YW9rp7yJJ0w88RZeslhp6w1dHuD5nyR/eDDP1kF3qlclbWbUWPV2ietOtNfTfMADib3ACOBKsNggpw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049404; c=relaxed/simple;
	bh=7PTUaE8JgkH+IFjyTT/YXB1fdLn2K44DQcIAUbn59zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/F2czIuLKVqN91xA5nxRQypDGwmT6GZWEWKRP/uOQ6kMU4BFIfIpWyxbr/0zGjCMMWcbMHcz8zMfDizsnCmAcceyinTdueS6c94FjWnJGqNLWiu58bpuLk8oFe6DjugOHzSt2qQlTTRk7/4Lb7g69Aws28gYq6O2Kt2iukFTo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ocF8OCjA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43635796b48so8206975e9.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737049401; x=1737654201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4P7LDYMxTkeBW5tzguw3DNocT1SYMj4Wwsqt793ul8=;
        b=ocF8OCjAMvxbAbs26Q8L1E+wy6DNmbOCcV9qnuJwboumOaXoVrGFWHE+piTLmdF+Ae
         vqQJeWqTr9gC/PwsXHyFKrCWZd1zXMc4DgkMql//qYHwkYp6X4BmaCoch9GzM3IgceP4
         mvLLoKB1l016fPy52v/Cl9iMJWkYdYk16j+DAwVQJvcRRAAOyqhzNY9kXNbIHjLIt/Zo
         cZTWn58pFQivJDmZ0JkGYy52CVWFY44chpIVznsb7GHkdG56DAlMk2Mli0Zb+ADbKKRN
         zxhqFlmJnUaylGjQSqWeKasxAKhpetk3h5uIy1mkrcqO4lc4pC8CPvDIjY0NAOF8v4B2
         eS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049401; x=1737654201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4P7LDYMxTkeBW5tzguw3DNocT1SYMj4Wwsqt793ul8=;
        b=tZI31EfRJtM2rssGbIPVMLfAS4C4sHFjpO7Rq94PlkqMxr2MFH3tiwdylWxcQrnW/K
         2jEqcwUBl8OfWqbAS08BQ5K/KNdbB6D6jYqARnYBPYzhQuj0fCiuSyqLYI5RzcpcQtBm
         +iuGplCBqEUlspgQ//bFHohEEL6vdEjmR70lNthk8nv4ocp3b7a37lPZ2JKYBjcNJ74j
         ejTUC4FwMk1kDf11h84+r80Tmcy1Dn1V7ikwKY/J3vzbGhPGajjav8oRuNtc9wIgXX98
         hPS0e57SUTsSbNR6nMDqUuaUtAsv298k4wrZCk767QDGToMUucSXDkzYb2jlJUYvk0D3
         ZG3w==
X-Forwarded-Encrypted: i=1; AJvYcCWpn4k0vEPL+ZcZN32+fZFdg15YWCwjxRcvGOBG+w0Px34HSu2Z3Ij5y0FJFQT6cIJknsIwZltDNU1CgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+yMp3FBfTusStepLHpI5DbnAnCKcTbiqnX7/e5bf5Mc3SSGyt
	OseZR3iRK47ZB8EOd+7z22YZsviRCcO8hUKalcy7FqaTY4ixN55LD5TaQ0YlKiU=
X-Gm-Gg: ASbGncu2yXeKW/lAz85TWHqWPTSm18+vxmXm69PxYtVAkSOfn+NHhcl61OKGJGzNDv8
	ht3t8GZ7cTAaiQnYOR9xccS8q+d5TOCXZnWjzB0H5pO7+ZtRNKNc6mRncy17QRpMiMaCsZuk582
	mfsEXy35WhNSggXUtWCQrSvnZzdx0UuZ/A/GM7HJDaxXGWv7W8+JCn6LgT6cnMjqcSDfiy8MS3u
	Nd1DX0uZDax3BNKXNVKy2nUyyyM43gDRraiMyIqlZsH7aGH
X-Google-Smtp-Source: AGHT+IHAgVBSJ8ZY/NqW0LreuzZcmoNo6KoRW0AkecvteQBt+RaD9wBriFRUtwpi197mTywx/YONow==
X-Received: by 2002:a05:600c:1588:b0:436:747d:55c9 with SMTP id 5b1f17b1804b1-437c6af20d2mr66019365e9.5.1737049401061;
        Thu, 16 Jan 2025 09:43:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890413053sm6302515e9.10.2025.01.16.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:43:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 17:43:10 +0000
Subject: [PATCH v2 2/3] media: i2c: imx415: Make HBLANK controllable and in
 consistent units
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-media-imx415-v2-2-735263f04652@raspberrypi.com>
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
In-Reply-To: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
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
 drivers/media/i2c/imx415.c | 87 +++++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index fa7ffb9220e5..24633d17cb09 100644
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
@@ -787,6 +759,12 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = imx415_set_testpattern(sensor, ctrl->val);
 		break;
 
+	case V4L2_CID_HBLANK:
+		return cci_write(sensor->regmap, IMX415_HMAX,
+				 (format->width + ctrl->val) /
+						IMX415_HMAX_MULTIPLIER,
+				 NULL);
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -805,12 +783,11 @@ static int imx415_ctrls_init(struct imx415 *sensor)
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
 
@@ -847,12 +824,14 @@ static int imx415_ctrls_init(struct imx415 *sensor)
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
@@ -860,8 +839,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 					   IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
 					   1, IMX415_PIXEL_ARRAY_VBLANK);
 
-	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
-			  pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  sensor->pixel_rate, sensor->pixel_rate, 1,
+			  sensor->pixel_rate);
 
 	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1333,6 +1313,17 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
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


