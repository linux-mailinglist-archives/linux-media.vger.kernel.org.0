Return-Path: <linux-media+bounces-17411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C851E968F47
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9741C22509
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1118893D;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUP5alPI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087F618756E;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=ZfMrWdDNtjzFTAB4MeqSGve8zVeQjnSu/MyWHrDOwV/MRGGEsl0c/JnbVHQrzjoYdBkDQtuR1xgmRES6L13c5b5alWtjjicVsvgFy9nX2ux9x2FQ5enf7oBKp16ON15c5/YgMrskckxG/k5HWG50Wmdm7TMsla4yvmVhlsmZiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=vJv8NPQbDrlLb83wHkvDOtTJuctKz14b9h3oIUWuFyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYl0Z0AQECzrBy2Hvc0wSUc8ic9lVO5OIQAvSiIrFlZyhCEE3dEAapgeXBlgzaob7sh6wgZ721CQXfQ+lUZ0WDz4j6tDr6SHSkawslATvDKLNoMN5tFyOzQo3Ksa5zL75cn73s8pRM8x21lW9CQIRj474JZhTPnXfheco3WNo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUP5alPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDC58C4CECC;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=vJv8NPQbDrlLb83wHkvDOtTJuctKz14b9h3oIUWuFyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZUP5alPIyP31nTYKtbizwcENNdBqvKyss1e6UunHUKfm5qorpryRtEkZEOJO+PCv9
	 IZTc4RLiKTNtTflButg1H4R+K82OB2kR5+RQwg1FKe6UPXzzzv6/vjH8Cqv24YxdbF
	 03QjBRADyfpTF49CnTUDQrUh3sWGjB88eIvUmKCp5jhHQbq25VdwOGxAlXWIokFByc
	 HNsNCdS/jUDtdFp4zmg9m3wf7ZKgehWBYimubDej7Bqg8bBKrzKP0BEAyWafyPvu40
	 uIotCOT0gcJXah84zLyLLQ3G/2RQzGyittmmnpPvYRT1YuGeJaqv2fZVvL7G+eWqJo
	 14TcFob+LzRUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CAACD342A;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:37 +0200
Subject: [PATCH 10/13] media: i2c: imx214: Implement vflip/hflip controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-10-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=6116;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=z4IDGcz2oRhDAWPsSJQAk/j4fXh6njUvCiBVMmsYNE8=;
 b=pajjN9rXOKUM36ThSnrwTm12uO4l9CvyI9XrysPZ43GqgnX/IOeT62tP1ilB2VWl+47DKv9M0
 jTL8ET4gSlIBEftyY9TNBe7mOc+jYDX9f/njTP8AK4UOO3GqqjQFCT8
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 sensor supports horizontal and vertical flipping. Add
appropriate controls to the driver.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 73 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 733f55257585..4a1433728cd5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -30,7 +30,6 @@
 #define IMX214_DEFAULT_LINK_FREQ 480000000
 #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
-#define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* V-TIMING internal */
 #define IMX214_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
@@ -186,6 +185,22 @@ static const char * const imx214_supply_name[] = {
 
 #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
 
+/*
+ * The supported formats.
+ * This table MUST contain 4 entries per format, to cover the various flip
+ * combinations in the order
+ * - no flip
+ * - h flip
+ * - v flip
+ * - h&v flips
+ */
+static const u32 imx214_mbus_formats[] = {
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
 struct imx214 {
 	struct device *dev;
 	struct clk *xclk;
@@ -202,6 +217,8 @@ struct imx214 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *unit_size;
 
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
@@ -339,7 +356,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 
 	/* global setting */
 	/* basic config */
-	{ IMX214_REG_ORIENTATION, 0 },
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
 	{ IMX214_REG_FAST_STANDBY_CTRL, 1 },
 	{ IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
@@ -518,11 +534,29 @@ static int __maybe_unused imx214_power_off(struct device *dev)
 	return 0;
 }
 
+/* Get bayer order based on flip setting. */
+static u32 imx214_get_format_code(struct imx214 *imx214, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx214_mbus_formats); i++)
+		if (imx214_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(imx214_mbus_formats))
+		i = 0;
+
+	i = (i & ~3) | (imx214->vflip->val ? 2 : 0) |
+	    (imx214->hflip->val ? 1 : 0);
+
+	return imx214_mbus_formats[i];
+}
+
 static void imx214_update_pad_format(struct imx214 *imx214,
 				     const struct imx214_mode *mode,
 				     struct v4l2_mbus_framefmt *fmt, u32 code)
 {
-	fmt->code = IMX214_MBUS_CODE;
+	fmt->code = imx214_get_format_code(imx214, code);
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -538,10 +572,12 @@ static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	struct imx214 *imx214 = to_imx214(sd);
+
+	if (code->index >= (ARRAY_SIZE(imx214_mbus_formats) / 4))
 		return -EINVAL;
 
-	code->code = IMX214_MBUS_CODE;
+	code->code = imx214_get_format_code(imx214, imx214_mbus_formats[code->index * 4]);
 
 	return 0;
 }
@@ -550,7 +586,11 @@ static int imx214_enum_frame_size(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->code != IMX214_MBUS_CODE)
+	struct imx214 *imx214 = to_imx214(subdev);
+	u32 code;
+
+	code = imx214_get_format_code(imx214, fse->code);
+	if (fse->code != code)
 		return -EINVAL;
 
 	if (fse->index >= ARRAY_SIZE(imx214_modes))
@@ -708,6 +748,7 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	struct v4l2_subdev_format fmt = { };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	fmt.format.width = imx214_modes[0].width;
 	fmt.format.height = imx214_modes[0].height;
 
@@ -750,6 +791,11 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val, &ret);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		cci_write(imx214->regmap, IMX214_REG_ORIENTATION,
+			  imx214->hflip->val | imx214->vflip->val << 1, &ret);
+		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
 			  format->height + ctrl->val, &ret);
@@ -788,7 +834,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 8);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 10);
 	if (ret)
 		return ret;
 
@@ -825,6 +871,16 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 					     IMX214_EXPOSURE_STEP,
 					     exposure_def);
 
+	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx214->hflip)
+		imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	imx214->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx214->vflip)
+		imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
@@ -1034,6 +1090,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
+	struct imx214 *imx214 = to_imx214(subdev);
 	const struct imx214_mode *mode;
 
 	if (fie->index != 0)
@@ -1043,7 +1100,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				ARRAY_SIZE(imx214_modes), width, height,
 				fie->width, fie->height);
 
-	fie->code = IMX214_MBUS_CODE;
+	fie->code = imx214_get_format_code(imx214, fie->code);
 	fie->width = mode->width;
 	fie->height = mode->height;
 	fie->interval.numerator = 1;

-- 
2.46.0



