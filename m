Return-Path: <linux-media+bounces-13328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A385909FA9
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 22:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2D91F21C36
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 20:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFB26BFD2;
	Sun, 16 Jun 2024 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuDDnomG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC0171B0;
	Sun, 16 Jun 2024 20:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569498; cv=none; b=RxNL0c9aicslxXWslktxyZsunYNJSq+ahZTT88EzbqRz8DyoZ4unPG+5r4izkWe40SIB5CELl5oVHZ8vYegKaYi51FOk934+qT+GtxAaOsxXdILLy6+dRlqj8cYfpngOQYdxKttvY7CQVqng3nsklVF+pub1p1vIWORqOe8wSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569498; c=relaxed/simple;
	bh=gR9sf8a7Zt9lusy60SQwTB+1BJ9sKotZPWurWafm+wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQBgNQJM60N5D7SRJXpY6qQpmGbTIZVI7j6HJ/1v+CzZ691lUNpig1K2VtifCwRjoDdxRM97wzRmhAcoNPTHsPfioMUe6o00zrkE1fNc6qLlpASN/Vx9v4Fg8rFCRlajXtpUmXar0Dk2JZkg3hf9OJIv0XBLYxBYwFpZJIpvzuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuDDnomG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebe3bac6c6so42334411fa.1;
        Sun, 16 Jun 2024 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569494; x=1719174294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DNbDAVO3i47HctSTcPvCqdylA/+OVuPjiB7bCAIdmM=;
        b=RuDDnomGZ5YdDxgrjLlEeoFExI/MvY0wfJ5HSEGG6BYc4ce9eLYFMT0ZDkv1w4lbGE
         vBwFhpkg0UqpUvOTyqxLJGDd9vCNJL7D6yWaFIdiBkxwDtoZkJmhTOfu1DUr90DvoIdL
         HwIVR/I/XAra0MytXKjMeLvARnQr4lplbaVfKnNeTigvv8zf1caq2voH6SjMRKAdg2xs
         9RVVGH6ae5ElNUtY1k4oO6yYkEU4yvCW/O08iH34gsAi/vc0Lkicdi8nqvvwwzJMQq7J
         3kH7DXXK2svHbHsl2vp2vdCWa2EZAbam1cYaGVIueDc0i8ozNUl9Eo/OTMl7wU7LT4vh
         uaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569494; x=1719174294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DNbDAVO3i47HctSTcPvCqdylA/+OVuPjiB7bCAIdmM=;
        b=CNAF1joGo1hsGx2UyhtUuPJuCFafkmlAFR1rceMxefzNMZEiPUiPCE1afvvaOY+R/y
         PVYeun+RScBP4TdHaWiO+BJJ9R4sA1mGySOATiraOdz+pB5QIBXGH0n5E3Ze9BzxoVXg
         UIbP+MOT0Aek7Ar5A69l6IBdGLR06XsOPkG8FPrwSB0h5Ssdu7A8VudOYPjM7X3h+JDu
         oaUiA5oQozh56eSsut8uUmNFGC1K+j3Q7lXfEugW0r4CH7TO2tylDySv432wA/dvoyJx
         u47Xp6N1NHBBHPJbodh1SZ8SbsayiNCzL6Lcx3bvMQ12I8aARheRvpzFVmGnmrVWAVXD
         bxtw==
X-Forwarded-Encrypted: i=1; AJvYcCXegNz39QNxkBi18x3xIRZ6elDpoNnurDJa3ODQlx3ifjlJa1DZNKJ6JdQ+LtNOspLzPJR8wia5E2JMCDiB80fZBM8kcAtKbHTnGGmt
X-Gm-Message-State: AOJu0YztgUvtrboRt9FLAncrkpDaugzRkZ7A5TLtzsZYIWqpsttONsvq
	TzlDJ9SRGcv6aNGsq90ssj6NS7YR28YjQYEZ+xCktr1QPhEO3rUgE9ksTeU8
X-Google-Smtp-Source: AGHT+IF3bylqE0/mpxFq931pKVwkHhSn7GfPiOX9Q0W4VAtO0v6eyd4KHIJcDKd0USHvFbID6tnPFQ==
X-Received: by 2002:a2e:7205:0:b0:2eb:fca8:7f19 with SMTP id 38308e7fff4ca-2ec0e60104dmr73856701fa.36.1718569493933;
        Sun, 16 Jun 2024 13:24:53 -0700 (PDT)
Received: from localhost (95-24-152-217.broadband.corbina.ru. [95.24.152.217])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf4378sm12008791fa.5.2024.06.16.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 13:24:52 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 2/4] media: i2c: ov4689: Eliminate struct ov4689_mode
Date: Sun, 16 Jun 2024 23:24:31 +0300
Message-ID: <20240616202433.227895-3-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240616202433.227895-1-mike.rudenko@gmail.com>
References: <20240616202433.227895-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the output frame size now controlled by selection rather than
cur_mode, this commit relocates pixel rate and default VTS to
defines. Consequently, it removes struct ov4689_mode and the cur_mode
field from struct ov4689.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/ov4689.c | 70 +++++++++-----------------------------
 1 file changed, 17 insertions(+), 53 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 933d714aa26c..affc6e3d5467 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -57,6 +57,8 @@
 #define OV4689_HTS_MAX			0x7fff
 
 #define OV4689_REG_VTS			CCI_REG16(0x380e)
+/* Default VTS corresponds to 30 fps at default crop and minimal HTS */
+#define OV4689_VTS_DEF			4683
 #define OV4689_VTS_MAX			0x7fff
 
 #define OV4689_REG_H_WIN_OFF		CCI_REG16(0x3810)
@@ -94,6 +96,7 @@
 
 #define OV4689_LANES			4
 #define OV4689_XVCLK_FREQ		24000000
+#define OV4689_PIXEL_RATE		480000000
 
 #define OV4689_PIXEL_ARRAY_WIDTH	2720
 #define OV4689_PIXEL_ARRAY_HEIGHT	1536
@@ -119,24 +122,6 @@ static const char *const ov4689_supply_names[] = {
 	"dvdd", /* Digital core power */
 };
 
-enum ov4689_mode_id {
-	OV4689_MODE_2688_1520 = 0,
-	OV4689_NUM_MODES,
-};
-
-struct ov4689_mode {
-	enum ov4689_mode_id id;
-	u32 width;
-	u32 height;
-	u32 hts_def;
-	u32 hts_min;
-	u32 vts_def;
-	u32 exp_def;
-	u32 pixel_rate;
-	const struct cci_reg_sequence *reg_list;
-	unsigned int num_regs;
-};
-
 struct ov4689 {
 	struct device *dev;
 	struct regmap *regmap;
@@ -152,8 +137,6 @@ struct ov4689 {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *exposure, *hblank, *vblank;
-
-	const struct ov4689_mode *cur_mode;
 };
 
 #define to_ov4689(sd) container_of(sd, struct ov4689, subdev)
@@ -172,7 +155,7 @@ struct ov4689_gain_range {
  * max_framerate 90fps
  * mipi_datarate per lane 1008Mbps
  */
-static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
+static const struct cci_reg_sequence ov4689_common_regs[] = {
 	/* System control*/
 	{ CCI_REG8(0x0103), 0x01 }, /* SC_CTRL0103 software_reset = 1 */
 	{ CCI_REG8(0x3000), 0x20 }, /* SC_CMMN_PAD_OEN0 FSIN_output_enable = 1 */
@@ -273,21 +256,6 @@ static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
 	{ CCI_REG8(0x5503), 0x0f }, /* OTP_DPC_END_L otp_end_address[7:0] = 0x0f */
 };
 
-static const struct ov4689_mode supported_modes[] = {
-	{
-		.id = OV4689_MODE_2688_1520,
-		.width = 2688,
-		.height = 1520,
-		.exp_def = 1536,
-		.hts_def = 10296,
-		.hts_min = 3432,
-		.vts_def = 1554,
-		.pixel_rate = 480000000,
-		.reg_list = ov4689_2688x1520_regs,
-		.num_regs = ARRAY_SIZE(ov4689_2688x1520_regs),
-	},
-};
-
 static const u64 link_freq_menu_items[] = { 504000000 };
 
 static const char *const ov4689_test_pattern_menu[] = {
@@ -584,8 +552,8 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 			goto unlock_and_return;
 
 		ret = cci_multi_reg_write(ov4689->regmap,
-					  ov4689->cur_mode->reg_list,
-					  ov4689->cur_mode->num_regs,
+					  ov4689_common_regs,
+					  ARRAY_SIZE(ov4689_common_regs),
 					  NULL);
 		if (ret) {
 			pm_runtime_put(dev);
@@ -863,14 +831,12 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov4689->subdev);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *handler;
-	const struct ov4689_mode *mode;
 	s64 exposure_max, vblank_def;
-	s64 hblank_def, hblank_min;
 	struct v4l2_ctrl *ctrl;
+	s64 hblank_def;
 	int ret;
 
 	handler = &ov4689->ctrl_handler;
-	mode = ov4689->cur_mode;
 	ret = v4l2_ctrl_handler_init(handler, 15);
 	if (ret)
 		return ret;
@@ -881,26 +847,26 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0,
-			  mode->pixel_rate, 1, mode->pixel_rate);
+			  OV4689_PIXEL_RATE, 1, OV4689_PIXEL_RATE);
 
-	hblank_def = mode->hts_def - mode->width;
-	hblank_min = mode->hts_min - mode->width;
+	hblank_def = ov4689_hts_min(OV4689_H_OUTPUT_SIZE_DEFAULT) -
+		     OV4689_H_OUTPUT_SIZE_DEFAULT;
 	ov4689->hblank = v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank_min,
-					   OV4689_HTS_MAX - mode->width,
+					   V4L2_CID_HBLANK, hblank_def,
+					   OV4689_HTS_MAX - OV4689_H_OUTPUT_SIZE_DEFAULT,
 					   OV4689_HTS_DIVIDER, hblank_def);
 
-	vblank_def = mode->vts_def - mode->height;
+	vblank_def = OV4689_VTS_DEF - OV4689_V_OUTPUT_SIZE_DEFAULT;
 	ov4689->vblank = v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops,
 					   V4L2_CID_VBLANK, OV4689_VBLANK_MIN,
-					   OV4689_VTS_MAX - mode->height, 1,
-					   vblank_def);
+					   OV4689_VTS_MAX - OV4689_V_OUTPUT_SIZE_DEFAULT,
+					   1, vblank_def);
 
-	exposure_max = mode->vts_def - 4;
+	exposure_max = OV4689_VTS_DEF - 4;
 	ov4689->exposure =
 		v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_EXPOSURE,
 				  OV4689_EXPOSURE_MIN, exposure_max,
-				  OV4689_EXPOSURE_STEP, mode->exp_def);
+				  OV4689_EXPOSURE_STEP, exposure_max);
 
 	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  ov4689_gain_ranges[0].logical_min,
@@ -1055,8 +1021,6 @@ static int ov4689_probe(struct i2c_client *client)
 
 	ov4689->dev = dev;
 
-	ov4689->cur_mode = &supported_modes[OV4689_MODE_2688_1520];
-
 	ov4689->xvclk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(ov4689->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov4689->xvclk),
-- 
2.45.2


