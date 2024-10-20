Return-Path: <linux-media+bounces-19940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B349A5747
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A82DC2823CB
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F215119AA75;
	Sun, 20 Oct 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNLrexUE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0181991C1;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=IDnL7HBM8T7ubs5Z386cQTf+GNB+5qKZKtYlXKSCS7V8if8nDRc845LW5gZ/+JQ9pDF9UQLKMS7Jx+oIILHmQ6mwQWN2uhNAFx1XQ10O9nrh2ztzmOoQJFgTuHjlPC+c9qEF+Le07XLvKGW8R218ldu6xmvHenH4GZHTuC+50ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=PweRBHEo5QtIKPF4uuLIiad5fmqzbffeOgUoyOKTttc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvBUXZC4gd9ZZMbAgS8+txDmxWBDXr1oaQnLVE+TUwQeD9FQwQ0xhmde5Qi7MNgJMIpxxZun8xlhLmig19DRYQy65aDFusJjkkXQtaechakvzByD8cEAAORSWoRpshWQbLinHo572sj+pfYcQ6DjH/35CvVHPWp4aW7cG6nKjtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNLrexUE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3665EC4CEFA;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=PweRBHEo5QtIKPF4uuLIiad5fmqzbffeOgUoyOKTttc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FNLrexUEkqoUy4yqzDfM8XW9IjK3cKbbXh14viLoIp1myK7VLZD1B0W6rIQ12dATF
	 oRPCD97UZYJ3xj2IjjTN6VXr0DhH6JO9MnUWN2yVph5+VX1BuuPFphnnXXQsl83pp0
	 KS2LCrKOZFgOyH/qCAqFeEX5lz9oH08H6K+B1GJDw+Ddtg30p1AVSnee0RPhUlefrp
	 +CGzRk5pd8WSo8tmrDe7/gZtPODnoF/lEk69hTOCcrKeAqCbvo3AukywOvNUl+jbof
	 DUl6o0k04Q6jz4m+z5HrJYBy4sen54AEXBmSHxO96VMizAF6t7Gh4/HLlveUD6hupG
	 9aMkrLPS2UBVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BECCD3C935;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:30 +0200
Subject: [PATCH v2 10/13] media: i2c: imx214: Implement vflip/hflip
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-10-fbd23e99541e@apitzsch.eu>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=5924;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=TWO/BcgBISCxxfC2d/H2lS3pg23/eXAtD4hde4yNOUg=;
 b=VKW+2eRwG/GMMUQs/0xAhlF4DokAu+i51bhgreO5G30/zABCwSbGAcJ7ekxAPxkMVkDK+DDal
 GFhpIi2fMsdAMyN4INfjBbAAu/vyzIcJbT/UAjcgT/rZKrXNTCyPY2E
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
 drivers/media/i2c/imx214.c | 69 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 87a03e292e19ccd71f1b2dcee3409826b2f5cb6f..f2d21c2e8cf84ed25403c98e280073f32e50e758 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -30,7 +30,6 @@
 #define IMX214_DEFAULT_LINK_FREQ 600000000
 #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
-#define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* V-TIMING internal */
 #define IMX214_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
@@ -189,6 +188,22 @@ static const char * const imx214_supply_name[] = {
 
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
@@ -204,6 +219,10 @@ struct imx214 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *unit_size;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
 
 	const struct imx214_mode *cur_mode;
 
@@ -339,7 +358,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 
 	/* global setting */
 	/* basic config */
-	{ IMX214_REG_ORIENTATION, 0 },
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
 	{ IMX214_REG_FAST_STANDBY_CTRL, 1 },
 	{ IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
@@ -518,11 +536,21 @@ static int __maybe_unused imx214_power_off(struct device *dev)
 	return 0;
 }
 
+/* Get bayer order based on flip setting. */
+static u32 imx214_get_format_code(struct imx214 *imx214)
+{
+	unsigned int i;
+
+	i = (imx214->vflip->val ? 2 : 0) | (imx214->hflip->val ? 1 : 0);
+
+	return imx214_mbus_formats[i];
+}
+
 static void imx214_update_pad_format(struct imx214 *imx214,
 				     const struct imx214_mode *mode,
 				     struct v4l2_mbus_framefmt *fmt, u32 code)
 {
-	fmt->code = IMX214_MBUS_CODE;
+	fmt->code = imx214_get_format_code(imx214);
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -538,10 +566,12 @@ static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	struct imx214 *imx214 = to_imx214(sd);
+
+	if (code->index >= (ARRAY_SIZE(imx214_mbus_formats) / 4))
 		return -EINVAL;
 
-	code->code = IMX214_MBUS_CODE;
+	code->code = imx214_get_format_code(imx214);
 
 	return 0;
 }
@@ -550,7 +580,11 @@ static int imx214_enum_frame_size(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->code != IMX214_MBUS_CODE)
+	struct imx214 *imx214 = to_imx214(subdev);
+	u32 code;
+
+	code = imx214_get_format_code(imx214);
+	if (fse->code != code)
 		return -EINVAL;
 
 	if (fse->index >= ARRAY_SIZE(imx214_modes))
@@ -713,6 +747,7 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	struct v4l2_subdev_format fmt = { };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	fmt.format.width = imx214_modes[0].width;
 	fmt.format.height = imx214_modes[0].height;
 
@@ -755,6 +790,11 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -793,7 +833,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 8);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 10);
 	if (ret)
 		return ret;
 
@@ -830,6 +870,18 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
+	v4l2_ctrl_cluster(2, &imx214->hflip);
+
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
@@ -1023,6 +1075,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
+	struct imx214 *imx214 = to_imx214(subdev);
 	const struct imx214_mode *mode;
 
 	if (fie->index != 0)
@@ -1032,7 +1085,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				ARRAY_SIZE(imx214_modes), width, height,
 				fie->width, fie->height);
 
-	fie->code = IMX214_MBUS_CODE;
+	fie->code = imx214_get_format_code(imx214);
 	fie->width = mode->width;
 	fie->height = mode->height;
 	fie->interval.numerator = 1;

-- 
2.47.0



