Return-Path: <linux-media+bounces-23659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 910879F58F9
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563A2188F7E9
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266051FBC89;
	Tue, 17 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMG2bMk5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE681FA173;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471564; cv=none; b=HVuLjTfepM37ztOROBbI40+b8Zmyf0dciO47GlwiGccfJKpXf7P85kyCBMg4D7idVtbtCC4ZpX/sJbk44Pv3H5T7vtj3PJtbxY7/c2JTQmgAChr5GlybpmIuxRgqhQkFYbaTmqw71kBBw0TkcwwYkduxcQMA1ncq7N6lEfonR3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471564; c=relaxed/simple;
	bh=NX79w+DgpWqkdeHevHv8IN8Z/laqCZE8YTmEIa09TkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVzoF5baUdaKwU5TAw6Bz2ai8WlocD1zeY3OMlYTbDa61u3S/Pm9sShccEFD+1Y4IgRhOctFRpQFqeFLfc/4Z7Za/ofu5vlNG2f2KRRfkDlVUMKlWryLVPr4pKlCV3h5kKsP9405rEtIwqOei9llnWjxClFiEEmmrIhpB7G/6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMG2bMk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98DDBC4CEED;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=NX79w+DgpWqkdeHevHv8IN8Z/laqCZE8YTmEIa09TkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KMG2bMk5mfvrcO3e4jQOY1k9Y3B/ZOz+SWkFuQFY8FrbJ0wO3nyUBXOr5yoDOx+gs
	 QcBgGiXf/3DlXI4vLhZsSNBexOuGo+w91yP82Y28Up9VOOb7ia0XIygIlmJSYOCkLo
	 z9Ox8QnQzH6n3VYRDeHk9EMH18HgH1x+ogpAXL8FLM3RQdeK2zhz0CzOyWVU7KxUnX
	 27s9kQVGWQ2UyWlfqXygy3B+hvn1O4HMRP8jr3DJR6uZIPamzl1gMljRG+PrWbfRjR
	 rHopiXDwW4VZYNicI8aSqyWvT3usXvcfRd9gCOjPWP+AMAl40t+fvzMnLoUVcUtf48
	 3biZ89TgNFEGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F639E77187;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:20 +0100
Subject: [PATCH v5 08/13] media: i2c: imx214: Implement vflip/hflip
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-8-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=6157;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=VDiQ/6WRsavjKvFbdCbxQixR+7dBL4iT0dO4nibI58o=;
 b=qm0NT1OwILowXOo7KRaoxMB2X4eLcOjETFimui9gtFqNELbOcYjeG1uQ/ZBIdD+ywy2db/S6Z
 MXwSRyF7i5yCnqPAuhaNmGC8+AQl6w6dNqzaDDaoWsJK3/8e4bY5nDX
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 sensor supports horizontal and vertical flipping. Add
appropriate controls to the driver.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 69 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 81d4ef67bcb5c660dfaab12039f8c683d7a7d683..8ff1f00f2ec2a5ba805e052c2c143c8219008248 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -30,7 +30,6 @@
 #define IMX214_DEFAULT_LINK_FREQ 480000000
 #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
-#define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
 
 /* V-TIMING internal */
 #define IMX214_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
@@ -182,6 +181,22 @@ static const char * const imx214_supply_name[] = {
 
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
@@ -197,6 +212,10 @@ struct imx214 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *unit_size;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
 
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
@@ -358,7 +377,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 
 	/* global setting */
 	/* basic config */
-	{ IMX214_REG_ORIENTATION, 0 },
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
 	{ IMX214_REG_FAST_STANDBY_CTRL, 1 },
 	{ IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
@@ -537,11 +555,21 @@ static int __maybe_unused imx214_power_off(struct device *dev)
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
@@ -557,10 +585,12 @@ static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
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
@@ -569,7 +599,11 @@ static int imx214_enum_frame_size(struct v4l2_subdev *subdev,
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
@@ -701,6 +735,7 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	struct v4l2_subdev_format fmt = { };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	fmt.format.width = imx214_modes[0].width;
 	fmt.format.height = imx214_modes[0].height;
 
@@ -744,6 +779,11 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -782,7 +822,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 8);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 10);
 	if (ret)
 		return ret;
 
@@ -831,6 +871,18 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
@@ -969,6 +1021,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
+	struct imx214 *imx214 = to_imx214(subdev);
 	const struct imx214_mode *mode;
 
 	dev_warn_once(imx214->dev, "frame_interval functions return an unreliable value for compatibility reasons. Use the VBLANK and HBLANK controls to determine the correct frame rate.\n");
@@ -980,7 +1033,7 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				ARRAY_SIZE(imx214_modes), width, height,
 				fie->width, fie->height);
 
-	fie->code = IMX214_MBUS_CODE;
+	fie->code = imx214_get_format_code(imx214);
 	fie->width = mode->width;
 	fie->height = mode->height;
 	fie->interval.numerator = 1;

-- 
2.47.1



