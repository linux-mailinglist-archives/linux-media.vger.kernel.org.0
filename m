Return-Path: <linux-media+bounces-19939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A63589A5745
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AE2A1F20F45
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E443119AA53;
	Sun, 20 Oct 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUTjSpVy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA71991BE;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=nJhzlEh6c5ZOaqEn5k2iJKMV9ogXTrRCp70zMZ6LfL20/QHVCIpg25ZxtZjo02Y6X/iBa80cPRjOT+v2r5K78S3hxJsds94vWYZWqIbZX7QOPDNvpBqO3dtxV9ZKUHODTQ83OtY76DMLx7DQgUNRxai9hB2exZw9iQ8Ub/9hTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=yk0ClJZp0r8exg54uJLYZ+QTLVTk1fuu+8aNLiSCesA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpryWpyV0U7QU1SPTp8/g3FJMWo2tfeED60aykiHynzWyHj9gH+aF6CWhM9xVKdG659noPAhNOwVQt8wo1ORYJzZBNDmgfynm4PcBr0N/Niy2VyrafP1ZGOBiRvtCJNYSUPM7SbeFX6T1Dohh1Ib79ruqu/fVXrbi5uNpzT9aHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUTjSpVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27151C4CEF7;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=yk0ClJZp0r8exg54uJLYZ+QTLVTk1fuu+8aNLiSCesA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XUTjSpVyFHAg0KwGLYhCR0y5HgDukFcl/CA+pBxzHbhf8Mzk0GSi7ETkaWk4znbDa
	 VP2wrBSYWzngAckJHmlMezfG9VMMjknoeJfavx/quZUCGqYC8Xm2BHeN0d4CYV069v
	 YwW+CSAjAzwjh0K31dt8qnic4YWwllf3Vjnrdvzk9ryRfOMEqCt1tDNKFAKrEa9KNl
	 FYr13DFAuwIkLYEJdgMgjoKGMGgwW8uDhKcGAMgPaLtPN4oe8pISyJ9zo20m7yffQj
	 n7AMN9SDtl4hx+ukgweJqkSQhKZ9SkzYATn7DdAOcq1v0nbVWFQ/CGf7ZDPA2pPn5R
	 tuQif4xO/k4DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC9FD3C938;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:29 +0200
Subject: [PATCH v2 09/13] media: i2c: imx214: Extract format and crop
 settings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=8252;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=p6Xt8IYTKhjGLY7+IsD6FSf18HwHfmecuRaNE4HBLGo=;
 b=c231zhCszMGcLxejHIBpb8PUy+apsdIsRncJWUXpJa7kgv3g94A1ttBXcqYfmktjOTWGXA4nd
 fFnHqnj3xPjD8W4W3pR0JDrStgxAg7KLR5LDG2oRW8c79dvN9qzp7BY
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Remove format and crop settings from register sequences and set them
programmatically.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 129 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 97 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index cb443d8bee6fe72dc9378b2c2d3caae09f8642c5..87a03e292e19ccd71f1b2dcee3409826b2f5cb6f 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -96,6 +96,9 @@
 #define IMX214_REG_PREPLLCK_VT_DIV	CCI_REG8(0x0305)
 #define IMX214_REG_PLL_VT_MPY		CCI_REG16(0x0306)
 #define IMX214_REG_OPPXCK_DIV		CCI_REG8(0x0309)
+#define IMX214_OPPXCK_DIV_COMP6		6
+#define IMX214_OPPXCK_DIV_COMP8		8
+#define IMX214_OPPXCK_DIV_RAW10		10
 #define IMX214_REG_OPSYCK_DIV		CCI_REG8(0x030b)
 #define IMX214_REG_PLL_MULT_DRIV	CCI_REG8(0x0310)
 #define IMX214_PLL_SINGLE		0
@@ -132,6 +135,9 @@
 #define IMX214_BINNING_NONE		0
 #define IMX214_BINNING_ENABLE		1
 #define IMX214_REG_BINNING_TYPE		CCI_REG8(0x0901)
+#define IMX214_BINNING_1X1		0
+#define IMX214_BINNING_2X2		0x22
+#define IMX214_BINNING_4X4		0x44
 #define IMX214_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
 #define IMX214_BINNING_AVERAGE		0x00
 #define IMX214_BINNING_SUMMED		0x01
@@ -211,36 +217,22 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_X_ADD_STA, 56 },
-	{ IMX214_REG_Y_ADD_STA, 408 },
-	{ IMX214_REG_X_ADD_END, 4151 },
-	{ IMX214_REG_Y_ADD_END, 2711 },
 	{ IMX214_REG_X_EVEN_INC, 1 },
 	{ IMX214_REG_X_ODD_INC, 1 },
 	{ IMX214_REG_Y_EVEN_INC, 1 },
 	{ IMX214_REG_Y_ODD_INC, 1 },
-	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
-	{ IMX214_REG_BINNING_TYPE, 0 },
 	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
 	{ CCI_REG8(0x3000), 0x35 },
 	{ CCI_REG8(0x3054), 0x01 },
 	{ CCI_REG8(0x305C), 0x11 },
 
-	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
-	{ IMX214_REG_X_OUTPUT_SIZE, 4096 },
-	{ IMX214_REG_Y_OUTPUT_SIZE, 2304 },
 	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
 	{ IMX214_REG_SCALE_M, 2 },
-	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
-	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
 	{ IMX214_REG_VTPXCK_DIV, 5 },
 	{ IMX214_REG_VTSYCK_DIV, 2 },
 	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
 	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
 	{ IMX214_REG_OPSYCK_DIV, 1 },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
@@ -281,36 +273,22 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_X_ADD_STA, 1144 },
-	{ IMX214_REG_Y_ADD_STA, 1020 },
-	{ IMX214_REG_X_ADD_END, 3063 },
-	{ IMX214_REG_Y_ADD_END, 2099 },
 	{ IMX214_REG_X_EVEN_INC, 1 },
 	{ IMX214_REG_X_ODD_INC, 1 },
 	{ IMX214_REG_Y_EVEN_INC, 1 },
 	{ IMX214_REG_Y_ODD_INC, 1 },
-	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
-	{ IMX214_REG_BINNING_TYPE, 0 },
 	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
 	{ CCI_REG8(0x3000), 0x35 },
 	{ CCI_REG8(0x3054), 0x01 },
 	{ CCI_REG8(0x305C), 0x11 },
 
-	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
-	{ IMX214_REG_X_OUTPUT_SIZE, 1920 },
-	{ IMX214_REG_Y_OUTPUT_SIZE, 1080 },
 	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
 	{ IMX214_REG_SCALE_M, 2 },
-	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
-	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
 	{ IMX214_REG_VTPXCK_DIV, 5 },
 	{ IMX214_REG_VTSYCK_DIV, 2 },
 	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
 	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
 	{ IMX214_REG_OPSYCK_DIV, 1 },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
@@ -623,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *__format;
 	struct v4l2_rect *__crop;
 	const struct imx214_mode *mode;
+	unsigned int bin_h, bin_v, bin;
 
 	mode = v4l2_find_nearest_size(imx214_modes,
 				      ARRAY_SIZE(imx214_modes), width, height,
@@ -637,9 +616,32 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 
 	*__format = format->format;
 
+	/*
+	 * Use binning to maximize the crop rectangle size, and centre it in the
+	 * sensor.
+	 */
+	bin_h = IMX214_PIXEL_ARRAY_WIDTH / __format->width;
+	bin_v = IMX214_PIXEL_ARRAY_HEIGHT / __format->height;
+
+	switch (min(bin_h, bin_v)) {
+	case 1:
+		bin = 1;
+		break;
+	case 2:
+	case 3:
+		bin = 2;
+		break;
+	case 4:
+	default:
+		bin = 4;
+		break;
+	}
+
 	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	__crop->width = mode->width;
-	__crop->height = mode->height;
+	__crop->width = __format->width * bin;
+	__crop->height = __format->height * bin;
+	__crop->left = (IMX214_NATIVE_WIDTH - __crop->width) / 2;
+	__crop->top = (IMX214_NATIVE_HEIGHT - __crop->height) / 2;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
@@ -847,7 +849,62 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	return 0;
 };
 
-static int imx214_start_streaming(struct imx214 *imx214)
+static int imx214_set_framefmt(struct imx214 *imx214,
+			       struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	u64 bin_mode;
+	u64 bin_type;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+
+	cci_write(imx214->regmap, IMX214_REG_X_ADD_STA,
+		  crop->left - IMX214_PIXEL_ARRAY_LEFT, &ret);
+	cci_write(imx214->regmap, IMX214_REG_X_ADD_END,
+		  crop->left - IMX214_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_ADD_STA,
+		  crop->top - IMX214_PIXEL_ARRAY_TOP, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_ADD_END,
+		  crop->top - IMX214_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
+
+	/* Proper setting is required even if cropping is not used */
+	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_WIDTH, crop->width, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_HEIGHT, crop->height, &ret);
+
+	switch (crop->width / format->width) {
+	case 1:
+	default:
+		bin_mode = IMX214_BINNING_NONE;
+		bin_type = IMX214_BINNING_1X1;
+		break;
+	case 2:
+		bin_mode = IMX214_BINNING_ENABLE;
+		bin_type = IMX214_BINNING_2X2;
+		break;
+	case 4:
+		bin_mode = IMX214_BINNING_ENABLE;
+		bin_type = IMX214_BINNING_4X4;
+		break;
+	}
+
+	cci_write(imx214->regmap, IMX214_REG_BINNING_MODE, bin_mode, &ret);
+	cci_write(imx214->regmap, IMX214_REG_BINNING_TYPE, bin_type, &ret);
+
+	cci_write(imx214->regmap, IMX214_REG_X_OUTPUT_SIZE, format->width, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_OUTPUT_SIZE, format->height, &ret);
+
+	cci_write(imx214->regmap, IMX214_REG_CSI_DATA_FORMAT,
+		  IMX214_CSI_DATA_FORMAT_RAW10, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, IMX214_OPPXCK_DIV_RAW10, &ret);
+
+	return ret;
+};
+
+static int imx214_start_streaming(struct imx214 *imx214,
+				  struct v4l2_subdev_state *state)
 {
 	int ret;
 
@@ -865,6 +922,14 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	/* Apply format and crop settings */
+	ret = imx214_set_framefmt(imx214, state);
+	if (ret) {
+		dev_err(imx214->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	ret = cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg_table,
 				  imx214->cur_mode->num_of_regs, NULL);
 	if (ret < 0) {
@@ -913,7 +978,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 			return ret;
 
 		state = v4l2_subdev_lock_and_get_active_state(subdev);
-		ret = imx214_start_streaming(imx214);
+		ret = imx214_start_streaming(imx214, state);
 		v4l2_subdev_unlock_state(state);
 		if (ret < 0)
 			goto err_rpm_put;

-- 
2.47.0



