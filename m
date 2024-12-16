Return-Path: <linux-media+bounces-23492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56369F3C45
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A9F1634A2
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE9C1EE021;
	Mon, 16 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt3Jg/uO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BC91E5708;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382892; cv=none; b=QkWiymG98KjOQyiJmGvNGO2BrR8OZnq4RWlUPherJqqyLLBpi0Y38f4cF2VUwOEYn7xsIYp48I7jbAKUMw9pG41x03uJl9Dk9oPK2I1/N6aVuQ+9Mj8PxtBTp06PboSoemSuGRF9C7aDi2zo9mHOmhxTZM9+YytVuGxgVToLkek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382892; c=relaxed/simple;
	bh=RoQGnHKtaGUL8mOPn5pG0+xndTgAcQORe5hNPcXjc2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hg9wr24PTasNsKB9kmoB3Um4b9reavt376Q+1qQC6cVbnqCyZOo4OIPaZ2Wm3Zh9ncTIw6Xhdh8owXr1U40bt+VgqdtoonsetipF3jMXMn0oUr5QvoE6zCe8+TtLtD/7aVgCXXwx+nZSwGe0XMzUMQNGMg+5GHnWQOu2OpnbbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt3Jg/uO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C819C4AF0C;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382892;
	bh=RoQGnHKtaGUL8mOPn5pG0+xndTgAcQORe5hNPcXjc2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vt3Jg/uOldmnFk3qAS3m1NsZAxiZdt8y992ZN9ObZ0uFAamWHCixEf8yg4lODS5hX
	 L63KNC9jEN/8wL/AoPJKglta98oJKCmlB+bBMdRqqHR5nzI7GaOEBQD+u4HvQ7TO0M
	 WHMXBaL3LOAImw00GFlxCxCTckVcPvA8wx5jINrXfZ41erUaJRzo2fM8EfH6yjL7sX
	 gdqFaROXTU29qDZSbLtDtSVCS2+xPyuqEEN79BbnlcggW7kJXFyPDOIOxoQdD5JoUW
	 1Tn1rTBZPKBXjaA7Eh84S2fKL6yZ7wWDpsot5COQlYKAws8PGAZF7407QNSjsdRbvD
	 usVb819TENyKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422DBE77183;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 16 Dec 2024 22:00:53 +0100
Subject: [PATCH v4 07/13] media: i2c: imx214: Add vblank and hblank
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-imx214-v4-7-8cbda160fbce@apitzsch.eu>
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
In-Reply-To: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734382889; l=8430;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=eOJwvpUYsXRam1lhvnoI8p9eaVy/k0kSB+FipoWRS0s=;
 b=a+c2etu9itVseyS/0OW1RYBYxPexLeaEDZwEKnxN9OgMOrUO8NRBx9KXUiFN7PDRWOXIChLf3
 4ltE+buDEFFCASEXb57ifZLHFeVMePPmCVMthM7FtuSswvksJxk4aAz
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add vblank control to allow changing the framerate /
higher exposure values.

The vblank and hblank controls are needed for libcamera support.

While at it, fix the minimal exposure time according to the datasheet.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 109 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 98 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 3e8264d12f3fda38bb7076cb2d63a30529b9afa2..804814f3e5886369090c6ac36c57fa07cde6d5ac 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -34,11 +34,17 @@
 
 /* V-TIMING internal */
 #define IMX214_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
+#define IMX214_VTS_MAX			0xffff
+
+#define IMX214_VBLANK_MIN		890
+
+/* HBLANK control - read only */
+#define IMX214_PPL_DEFAULT		5008
 
 /* Exposure control */
 #define IMX214_REG_EXPOSURE		CCI_REG16(0x0202)
-#define IMX214_EXPOSURE_MIN		0
-#define IMX214_EXPOSURE_MAX		3184
+#define IMX214_EXPOSURE_OFFSET		10
+#define IMX214_EXPOSURE_MIN		1
 #define IMX214_EXPOSURE_STEP		1
 #define IMX214_EXPOSURE_DEFAULT		3184
 #define IMX214_REG_EXPOSURE_RATIO	CCI_REG8(0x0222)
@@ -187,6 +193,8 @@ struct imx214 {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *unit_size;
 
@@ -202,8 +210,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_FRM_LENGTH_LINES, 3194 },
-	{ IMX214_REG_LINE_LENGTH_PCK, 5008 },
 	{ IMX214_REG_X_ADD_STA, 56 },
 	{ IMX214_REG_Y_ADD_STA, 408 },
 	{ IMX214_REG_X_ADD_END, 4151 },
@@ -274,8 +280,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_FRM_LENGTH_LINES, 3194 },
-	{ IMX214_REG_LINE_LENGTH_PCK, 5008 },
 	{ IMX214_REG_X_ADD_STA, 1144 },
 	{ IMX214_REG_Y_ADD_STA, 1020 },
 	{ IMX214_REG_X_ADD_END, 3063 },
@@ -359,6 +363,7 @@ static const struct cci_reg_sequence mode_table_common[] = {
 	{ IMX214_REG_ORIENTATION, 0 },
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
 	{ IMX214_REG_FAST_STANDBY_CTRL, 1 },
+	{ IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
 	{ CCI_REG8(0x4550), 0x02 },
 	{ CCI_REG8(0x4601), 0x00 },
 	{ CCI_REG8(0x4642), 0x05 },
@@ -462,18 +467,24 @@ static const struct cci_reg_sequence mode_table_common[] = {
 static const struct imx214_mode {
 	u32 width;
 	u32 height;
+
+	/* V-timing */
+	unsigned int vts_def;
+
 	unsigned int num_of_regs;
 	const struct cci_reg_sequence *reg_table;
 } imx214_modes[] = {
 	{
 		.width = 4096,
 		.height = 2304,
+		.vts_def = 3194,
 		.num_of_regs = ARRAY_SIZE(mode_4096x2304),
 		.reg_table = mode_4096x2304,
 	},
 	{
 		.width = 1920,
 		.height = 1080,
+		.vts_def = 3194,
 		.num_of_regs = ARRAY_SIZE(mode_1920x1080),
 		.reg_table = mode_1920x1080,
 	},
@@ -627,9 +638,36 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	__crop->width = mode->width;
 	__crop->height = mode->height;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		int exposure_max;
+		int exposure_def;
+		int hblank;
+
 		imx214->cur_mode = mode;
 
+		/* Update blank limits */
+		__v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MIN,
+					 IMX214_VTS_MAX - mode->height, 2,
+					 mode->vts_def - mode->height);
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
+		exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
+		__v4l2_ctrl_modify_range(imx214->exposure,
+					 imx214->exposure->minimum,
+					 exposure_max, imx214->exposure->step,
+					 exposure_def);
+
+		/*
+		 * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hblank
+		 * depends on mode->width only, and is not changeable in any
+		 * way other than changing the mode.
+		 */
+		hblank = IMX214_PPL_DEFAULT - mode->width;
+		__v4l2_ctrl_modify_range(imx214->hblank, hblank, hblank, 1,
+					 hblank);
+	}
+
 	return 0;
 }
 
@@ -679,8 +717,26 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx214 *imx214 = container_of(ctrl->handler,
 					     struct imx214, ctrls);
+	const struct v4l2_mbus_framefmt *format = NULL;
+	struct v4l2_subdev_state *state;
 	int ret;
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max, exposure_def;
+
+		state = v4l2_subdev_get_locked_active_state(&imx214->sd);
+		format = v4l2_subdev_state_get_format(state, 0);
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max =
+			format->height + ctrl->val - IMX214_EXPOSURE_OFFSET;
+		exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
+		__v4l2_ctrl_modify_range(imx214->exposure,
+					 imx214->exposure->minimum,
+					 exposure_max, imx214->exposure->step,
+					 exposure_def);
+	}
+
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
@@ -692,7 +748,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val, &ret);
 		break;
-
+	case V4L2_CID_VBLANK:
+		cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
+			  format->height + ctrl->val, &ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -715,8 +774,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		.width = 1120,
 		.height = 1120,
 	};
+	const struct imx214_mode *mode = &imx214_modes[0];
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	int exposure_max, exposure_def;
+	int hblank;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(imx214->dev, &props);
@@ -724,7 +786,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 6);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 8);
 	if (ret)
 		return ret;
 
@@ -750,12 +812,28 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	 *
 	 * Yours sincerely, Ricardo.
 	 */
+
+	/* Initial vblank/hblank/exposure parameters based on current mode */
+	imx214->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					   V4L2_CID_VBLANK, IMX214_VBLANK_MIN,
+					   IMX214_VTS_MAX - mode->height, 2,
+					   mode->vts_def - mode->height);
+
+	hblank = IMX214_PPL_DEFAULT - mode->width;
+	imx214->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank,
+					   1, hblank);
+	if (imx214->hblank)
+		imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
+	exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
 	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX214_EXPOSURE_MIN,
-					     IMX214_EXPOSURE_MAX,
+					     exposure_max,
 					     IMX214_EXPOSURE_STEP,
-					     IMX214_EXPOSURE_DEFAULT);
+					     exposure_def);
 
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
@@ -877,12 +955,21 @@ static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+/*
+ * Raw sensors should be using the VBLANK and HBLANK controls to determine
+ * the frame rate. However this driver was initially added using the
+ * [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of 30fps.
+ * Retain the frame_interval ops for backwards compatibility, but they do
+ * nothing.
+ */
 static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
 	const struct imx214_mode *mode;
 
+	dev_warn_once(imx214->dev, "frame_interval functions return an unreliable value for compatibility reasons. Use the VBLANK and HBLANK controls to determine the correct frame rate.\n");
+
 	if (fie->index != 0)
 		return -EINVAL;
 

-- 
2.47.1



