Return-Path: <linux-media+bounces-17407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005A968F42
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6429E1C223A0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A75188599;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="so+4P11V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C418734B;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=b/uCC9jNPC8UFAxlhMn9GLow8CQbTlGjNV0SBm/J5uxFAlEzCXUr7f2aOgrJv/QnDXknvu8sCE4yjmdxlp7DzCjlo7b4Fek1h4htgM/4c3O/N4OfEhB5vvpXBiXZFZ1x4XIBOaTXpoCMQAjaonqeE5F0zAZyVWooPFlmJcXeCk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=3q/L+eyYKubmfx7QWv9iYmvQtMP1z0aECamdg7fIOGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXguozQ7C+bIcs+J0SDKa0csxSbK4j9T8VIOQr5CKZ3o/QEd696n9CiOJjPf/TB82yRLoDB/QrQBWtjFSCk8TskPKaZTx35hQJDF3jdS222vF8gar/urXbOHpQeC5AGMCfcIQ4cVC990VQT9T73gLQRn+ZafJR869jdeqdmpJis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=so+4P11V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B26A2C4CEC9;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=3q/L+eyYKubmfx7QWv9iYmvQtMP1z0aECamdg7fIOGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=so+4P11VEpZMc+5ywf55rfEC71Y3rToeox9cb5HsTdtWZKlrOvDTGez3sWOS2XI3F
	 aXT0DjAfvl48IQo8shotFtbrXBJW/RLwNvV2Fu5a933+zso+MViYpVCzhZbRE0nTf6
	 oEhl8KcYeo+y9BqtLJovczjiGen+XuOWLzonNAmK4XGxxr58M1hFgWf8j3p0l5GkUT
	 SkTC08J6JvRdjxlggzqWV30tjkF3WO4KPCQwtTMurpvwu6ZpchsgapQhqxrGnOXy4R
	 Kvo2K441s6SgVJkGPlyhL008T2kmgMGwiTyQk1gbPopK1G+RoFBc6seKcWwELztZkX
	 h2GIIT9oRYamA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA308C54FC6;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:35 +0200
Subject: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-8-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=7948;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=esLlpt+LC/KNfH1W810CYQcTWI2Qy2Iu5Bni2NRH3VQ=;
 b=oNQpIxqSVF9wkTumHQXvztW/2x34ECmEzmhgELGCCalHzZTSt+nmtStulez3NPje8eLGAWezG
 tmvdV59o6LQCGJsN9hKBccZK+1pTffpZaR2HmblySwist4oD0s3IwVg
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
 drivers/media/i2c/imx214.c | 112 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 91 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 3b422cddbdce..9f5a57aebb86 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -34,11 +34,18 @@
 
 /* V-TIMING internal */
 #define IMX214_REG_FRM_LENGTH_LINES	CCI_REG16(0x0340)
+#define IMX214_VTS_MAX			0xffff
+
+#define IMX214_VBLANK_MIN		4
+
+/* HBLANK control - read only */
+#define IMX214_PPL_DEFAULT		5008
 
 /* Exposure control */
 #define IMX214_REG_EXPOSURE		CCI_REG16(0x0202)
-#define IMX214_EXPOSURE_MIN		0
-#define IMX214_EXPOSURE_MAX		3184
+#define IMX214_EXPOSURE_OFFSET		10
+#define IMX214_EXPOSURE_MIN		1
+#define IMX214_EXPOSURE_MAX		(IMX214_VTS_MAX - IMX214_EXPOSURE_OFFSET)
 #define IMX214_EXPOSURE_STEP		1
 #define IMX214_EXPOSURE_DEFAULT		3184
 #define IMX214_REG_EXPOSURE_RATIO	CCI_REG8(0x0222)
@@ -189,6 +196,8 @@ struct imx214 {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *unit_size;
 
@@ -205,8 +214,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_FRM_LENGTH_LINES, 3194 },
-	{ IMX214_REG_LINE_LENGTH_PCK, 5008 },
 	{ IMX214_REG_X_ADD_STA, 56 },
 	{ IMX214_REG_Y_ADD_STA, 408 },
 	{ IMX214_REG_X_ADD_END, 4151 },
@@ -277,8 +284,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_FRM_LENGTH_LINES, 3194 },
-	{ IMX214_REG_LINE_LENGTH_PCK, 5008 },
 	{ IMX214_REG_X_ADD_STA, 1144 },
 	{ IMX214_REG_Y_ADD_STA, 1020 },
 	{ IMX214_REG_X_ADD_END, 3063 },
@@ -362,6 +367,7 @@ static const struct cci_reg_sequence mode_table_common[] = {
 	{ IMX214_REG_ORIENTATION, 0 },
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
 	{ IMX214_REG_FAST_STANDBY_CTRL, 1 },
+	{ IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
 	{ CCI_REG8(0x4550), 0x02 },
 	{ CCI_REG8(0x4601), 0x00 },
 	{ CCI_REG8(0x4642), 0x05 },
@@ -465,18 +471,24 @@ static const struct cci_reg_sequence mode_table_common[] = {
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
@@ -629,6 +641,37 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	__crop->width = mode->width;
 	__crop->height = mode->height;
 
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		int exposure_max;
+		int exposure_def;
+		int hblank;
+
+		/* Update limits and set FPS to default */
+		__v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MIN,
+					 IMX214_VTS_MAX - mode->height, 1,
+					 mode->vts_def - mode->height);
+		__v4l2_ctrl_s_ctrl(imx214->vblank,
+				   mode->vts_def - mode->height);
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
+		exposure_def = (exposure_max < IMX214_EXPOSURE_DEFAULT) ?
+			exposure_max : IMX214_EXPOSURE_DEFAULT;
+		__v4l2_ctrl_modify_range(imx214->exposure,
+					 imx214->exposure->minimum,
+					 exposure_max, imx214->exposure->step,
+					 exposure_def);
+
+		/*
+		 * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hblank
+		 * depends on mode->width only, and is not changeble in any
+		 * way other than changing the mode.
+		 */
+		hblank = IMX214_PPL_DEFAULT - mode->width;
+		__v4l2_ctrl_modify_range(imx214->hblank, hblank, hblank, 1,
+					 hblank);
+	}
+
 	return 0;
 }
 
@@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx214 *imx214 = container_of(ctrl->handler,
 					     struct imx214, ctrls);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	int ret;
 
+	state = v4l2_subdev_get_locked_active_state(&imx214->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max, exposure_def;
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = format->height + ctrl->val - IMX214_EXPOSURE_OFFSET;
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
@@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
@@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 6);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 8);
 	if (ret)
 		return ret;
 
@@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	if (imx214->link_freq)
 		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	/*
-	 * WARNING!
-	 * Values obtained reverse engineering blobs and/or devices.
-	 * Ranges and functionality might be wrong.
-	 *
-	 * Sony, please release some register set documentation for the
-	 * device.
-	 *
-	 * Yours sincerely, Ricardo.
-	 */
+	/* Initial vblank/hblank/exposure parameters based on current mode */
+	imx214->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					   V4L2_CID_VBLANK, IMX214_VBLANK_MIN,
+					   IMX214_VTS_MAX - mode->height, 1,
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
-					     IMX214_EXPOSURE_MIN,
-					     IMX214_EXPOSURE_MAX,
+					     IMX214_EXPOSURE_MIN, exposure_max,
 					     IMX214_EXPOSURE_STEP,
-					     IMX214_EXPOSURE_DEFAULT);
+					     exposure_def);
 
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,

-- 
2.46.0



