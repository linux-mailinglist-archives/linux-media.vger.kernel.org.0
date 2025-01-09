Return-Path: <linux-media+bounces-24504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C775FA0746F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A31165A77
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A423C216381;
	Thu,  9 Jan 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="k/6imb7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3721638D
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421430; cv=none; b=qLLFDuZp3H7lYXpufJXZ6BlOdwanuKdNHfWCt+Jnzun2hHAmjNJCDD/MIG/rDTKz+U9HaUnZN270PplPdHH7QKiJ1iJXdBXq+CeNAq9orPBeK6/S8u4W6IykqL7vZHcLO1tUjD5WnljgIci9gIypq1adJQ8OXlMOIP2UAHTTRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421430; c=relaxed/simple;
	bh=2SVlAKy9ycVKrxI/OiosWqeUtu66MzqT8puLexKAmtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAUGCWWLNMM3h+IXP6N4Ld3ypqaAks2XcUsKeeteiG/PPw/u+9TbA03NhdLIO5evnpxrPa21GkLKCe569cAuakREaI1UlnJWQdV2uowUAzq9hNpTmux1any/Sw0Qc4KDiugx3w2oexKy75Ta+3hpm2woM22LXsYkmjwtIA8UDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=k/6imb7L; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e3621518so434593f8f.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 03:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736421426; x=1737026226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pj9OsK0gjG/VTlu5wLrvObt5Ggsq7mHWz27kkYt3hmc=;
        b=k/6imb7LqfzekWvix/vaEKWGTVxqlz5iAOsxIlexZCcUKuk4HxI2QoDol0fo4aQLTp
         6QGlE0C9zzzB7VVTOWe7o/4bI6SNPfcXJzQVeRMcOFUU5F6IzOJb9K2H3KAgSopjj1Bb
         qE2tl0VMd3TaLZ78MhnEg3wjIUjoB4WEbntNppduHCzC+iNI3bw/0szSSyV3HhhjDk/s
         e7xBWpGhtC8C5jGFe1uVkc1sqU3ZzlUPbpTHtqRhkxxUzSUtAmzmD6f2pFln0Py0XTyL
         7s95rILHiAcWmgmkkPXOBwzAMGJPwj7PyMx8ISgwtkwcfISJJ9nTDXzIshi6PLdhf7mc
         rlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421426; x=1737026226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj9OsK0gjG/VTlu5wLrvObt5Ggsq7mHWz27kkYt3hmc=;
        b=UcoDGtKUi62gELSQG/G9rQVAtHYRsnOlGQc1b1JCHZhiQNRZg+HdYmCOfuTIOuNmB6
         TR2gWQ6uaswp/fVc0ws54i/uJOyTBpLdPqopkXjrIyfbrUqIvrvrQywz4uj14xfKt+QF
         jGxjX46zJPRsQJUIQnwor6SgBGk5HcvLpp8arJo8ziN6G9LvuBfgce6Ypy3D9B46H3x1
         ZL9E3FpU/sLAnnw82BDmrNXJWwrDnaO2TcIsle6svjKsg0vpmQf/LGX09/PBKoV3426Q
         BNGd+e8tpcdTrs50oqCNLqBoSDnH+3mXWU7wkuNp82FtHocIkfu6Auk2gFqXPZ67Ltxy
         SGSg==
X-Gm-Message-State: AOJu0YxsjaPVr9IJpLo0+4HJaO4HQrj2p+La4VeX825SH9JiaJGUW2HL
	ebk5FVEmRbUaPoXWt7526ohehH2WG+Ybc1xwdkdlaaF2d0u36zCehMp732rv3JjtbntKazsrHdm
	K
X-Gm-Gg: ASbGnctXXO5f5K9aV3CH39RZxJa9Qlp2Lo6/xZa/zY9xzUL+2FOFBMKzHddwwSTPB8s
	uHD7CMkaCaJ0ARXzOFC3u4rgCTl1Wu2079i7bq4f0RYGDieLfKKrXSIDZEumd57gCZpE8FoIIIY
	DDtu7K32ihTsq9L7RgD3TCP3cOccZcxGeDUjhapUtRYGlqYJQQpRxYtGb078nkgblhPiGcMKUQe
	E+uSKzBotTi7/viYDwNUKcUV09lGqUAW/hdsZp61hIvcnHg
X-Google-Smtp-Source: AGHT+IHcYceMEWIHrOmEnsg9w5rQz45ovuijkrOlL7eWQJzaZvrM+EccGEDkpkyfT8xcwmPZD8aAZw==
X-Received: by 2002:a5d:6d82:0:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-38a87358c39mr5153473f8f.53.1736421426425;
        Thu, 09 Jan 2025 03:17:06 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm51383635e9.16.2025.01.09.03.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 03:17:06 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 09 Jan 2025 11:17:01 +0000
Subject: [PATCH 2/3] media: i2c: imx415: Make HBLANK controllable and in
 consistent units
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-media-imx415-v1-2-366ba6a234ab@raspberrypi.com>
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
In-Reply-To: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
index 2c8c0905aa99..e23b41027987 100644
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
@@ -786,6 +758,12 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -804,12 +782,11 @@ static int imx415_ctrls_init(struct imx415 *sensor)
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
 
@@ -846,12 +823,14 @@ static int imx415_ctrls_init(struct imx415 *sensor)
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
@@ -859,8 +838,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 					   IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
 					   1, IMX415_PIXEL_ARRAY_VBLANK);
 
-	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
-			  pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  sensor->pixel_rate, sensor->pixel_rate, 1,
+			  sensor->pixel_rate);
 
 	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1332,6 +1312,17 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
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


