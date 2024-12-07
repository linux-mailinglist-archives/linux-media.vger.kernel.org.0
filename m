Return-Path: <linux-media+bounces-22825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB59E8204
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 21:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BF11884617
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 20:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF56191F8E;
	Sat,  7 Dec 2024 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDTAA0ow"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7730155C8A;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604506; cv=none; b=F9bi1Gu071lni61b17/IrQHgSO01/eKY35z7DBWS9td0fr4btstruJTrU+W40oXBM9MBIi83b8219N+BS2MXocWC6IlKwfgbXI5UrZZ2BpADjYngkxrDNBqYg+vt2Pz7bGVi1AS0XGUJsl/pkP9yAfXiJgU6NFZN7rVy8x6CZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604506; c=relaxed/simple;
	bh=tJ4OwUAcUq7WzrqLPG9ABeIx+l4b2QN9Zwvg8PvBIXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1bNeYBKzX+rpCJGigtewl3rf15ouxIZtCm1HqAxHURTGUolbQRBg22abwloAilpw4n7JLcvn6UpJ5P3uEVdHqtCnce6Pz4ATrkTcRaCNvX7t11UZe3WftL8dkXbSr1VhG8Lu9FZvjlILpMsUMEO1m21bekG78TUViu+JR9J8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDTAA0ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F747C4CED2;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733604506;
	bh=tJ4OwUAcUq7WzrqLPG9ABeIx+l4b2QN9Zwvg8PvBIXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UDTAA0owOzcv/UOPMX61e7GLNllIBetPKCNd3Iftq0JZHHmuJBfevNn+bGSurioEV
	 KqKX8slAeOLJHTjbQtD8+iWUyd1ivFGy4NCdq5iWUlBBi2+dV4F8GScvFh4pLR9fgb
	 YVRtneOjoFZjtdTj17lsPf6WTOHHR/F0m3FsWzW83GtdOtMGZUdzRN/mtAGb4MLYEb
	 VgoOzWWIZYMzDlnqnD4DWslF9UXqztTji2fE0QiCnsKbVrfyAp674h9yBYQPgoH6+v
	 kABHvPGNB37ZoKDhv/0L+qJ22mfOtCQFssW3QKUdATsaUOwx0n4/H4/a15J7F9/rJi
	 BstLcGQXmbWbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D454E7717F;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 07 Dec 2024 21:47:50 +0100
Subject: [PATCH v3 01/12] media: i2c: imx214: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241207-imx214-v3-1-ab60af7ee915@apitzsch.eu>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733604504; l=9789;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=7jjaHEv0bY8J3xMvrgzrSBWM/eKhHWc6WkK4AJAZKZU=;
 b=T/qgxYwLqzTzvnF6m78+U8tuHbwtLvDxv3+qrVuLH8oW1+u821v847I9qsjKdkWZUEkNBA7uH
 J4sBmCJuf9UCHIJ+bEpQP2vGhtxuxNvF7Tset3VLOABwkXQ+TMoXuAT
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Port the imx214 sensor driver to use the subdev active state.

Move all the format configuration to the subdevice state and simplify
the format handling, locking and initialization.

While at it, simplify imx214_start_streaming() by removing unneeded goto
statements and the corresponding error label.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 156 +++++++++++++++------------------------------
 1 file changed, 50 insertions(+), 106 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d62425aeccb46a400fa93146f14ea..435d1ee12c3a0959ae751c3e7a8b4e7fa1a4c303 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -59,8 +59,6 @@ struct imx214 {
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixel_rate;
@@ -68,15 +66,11 @@ struct imx214 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *unit_size;
 
+	const struct imx214_mode *cur_mode;
+
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
 	struct gpio_desc *enable_gpio;
-
-	/*
-	 * Serialize control access, get/set format, get selection
-	 * and start streaming.
-	 */
-	struct mutex mutex;
 };
 
 struct reg_8 {
@@ -490,6 +484,22 @@ static int __maybe_unused imx214_power_off(struct device *dev)
 	return 0;
 }
 
+static void imx214_update_pad_format(struct imx214 *imx214,
+				     const struct imx214_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt, u32 code)
+{
+	fmt->code = IMX214_MBUS_CODE;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
 static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -549,52 +559,6 @@ static const struct v4l2_subdev_core_ops imx214_core_ops = {
 #endif
 };
 
-static struct v4l2_mbus_framefmt *
-__imx214_get_pad_format(struct imx214 *imx214,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad,
-			enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &imx214->fmt;
-	default:
-		return NULL;
-	}
-}
-
-static int imx214_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *format)
-{
-	struct imx214 *imx214 = to_imx214(sd);
-
-	mutex_lock(&imx214->mutex);
-	format->format = *__imx214_get_pad_format(imx214, sd_state,
-						  format->pad,
-						  format->which);
-	mutex_unlock(&imx214->mutex);
-
-	return 0;
-}
-
-static struct v4l2_rect *
-__imx214_get_pad_crop(struct imx214 *imx214,
-		      struct v4l2_subdev_state *sd_state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_crop(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &imx214->crop;
-	default:
-		return NULL;
-	}
-}
-
 static int imx214_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
@@ -604,34 +568,22 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	struct v4l2_rect *__crop;
 	const struct imx214_mode *mode;
 
-	mutex_lock(&imx214->mutex);
-
-	__crop = __imx214_get_pad_crop(imx214, sd_state, format->pad,
-				       format->which);
-
 	mode = v4l2_find_nearest_size(imx214_modes,
 				      ARRAY_SIZE(imx214_modes), width, height,
 				      format->format.width,
 				      format->format.height);
 
-	__crop->width = mode->width;
-	__crop->height = mode->height;
+	imx214_update_pad_format(imx214, mode, &format->format, format->format.code);
+	__format = v4l2_subdev_state_get_format(sd_state, 0);
 
-	__format = __imx214_get_pad_format(imx214, sd_state, format->pad,
-					   format->which);
-	__format->width = __crop->width;
-	__format->height = __crop->height;
-	__format->code = IMX214_MBUS_CODE;
-	__format->field = V4L2_FIELD_NONE;
-	__format->colorspace = V4L2_COLORSPACE_SRGB;
-	__format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(__format->colorspace);
-	__format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-				__format->colorspace, __format->ycbcr_enc);
-	__format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(__format->colorspace);
+	*__format = format->format;
 
-	format->format = *__format;
+	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	__crop->width = mode->width;
+	__crop->height = mode->height;
 
-	mutex_unlock(&imx214->mutex);
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		imx214->cur_mode = mode;
 
 	return 0;
 }
@@ -640,14 +592,9 @@ static int imx214_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
-	struct imx214 *imx214 = to_imx214(sd);
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		mutex_lock(&imx214->mutex);
-		sel->r = *__imx214_get_pad_crop(imx214, sd_state, sel->pad,
-						sel->which);
-		mutex_unlock(&imx214->mutex);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
 		return 0;
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
@@ -826,40 +773,28 @@ static int imx214_write_table(struct imx214 *imx214,
 
 static int imx214_start_streaming(struct imx214 *imx214)
 {
-	const struct imx214_mode *mode;
 	int ret;
 
-	mutex_lock(&imx214->mutex);
 	ret = imx214_write_table(imx214, mode_table_common);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent common table %d\n", ret);
-		goto error;
+		return ret;
 	}
 
-	mode = v4l2_find_nearest_size(imx214_modes,
-				ARRAY_SIZE(imx214_modes), width, height,
-				imx214->fmt.width, imx214->fmt.height);
-	ret = imx214_write_table(imx214, mode->reg_table);
+	ret = imx214_write_table(imx214, imx214->cur_mode->reg_table);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent mode table %d\n", ret);
-		goto error;
+		return ret;
 	}
 	ret = __v4l2_ctrl_handler_setup(&imx214->ctrls);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sync v4l2 controls\n");
-		goto error;
+		return ret;
 	}
 	ret = regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX214_MODE_STREAMING);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(imx214->dev, "could not sent start table %d\n", ret);
-		goto error;
-	}
 
-	mutex_unlock(&imx214->mutex);
-	return 0;
-
-error:
-	mutex_unlock(&imx214->mutex);
 	return ret;
 }
 
@@ -877,6 +812,7 @@ static int imx214_stop_streaming(struct imx214 *imx214)
 static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct imx214 *imx214 = to_imx214(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (enable) {
@@ -884,7 +820,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		if (ret < 0)
 			return ret;
 
+		state = v4l2_subdev_lock_and_get_active_state(subdev);
 		ret = imx214_start_streaming(imx214);
+		v4l2_subdev_unlock_state(state);
 		if (ret < 0)
 			goto err_rpm_put;
 	} else {
@@ -948,7 +886,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
 	.enum_mbus_code = imx214_enum_mbus_code,
 	.enum_frame_size = imx214_enum_frame_size,
 	.enum_frame_interval = imx214_enum_frame_interval,
-	.get_fmt = imx214_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx214_set_format,
 	.get_selection = imx214_get_selection,
 	.get_frame_interval = imx214_get_frame_interval,
@@ -1079,13 +1017,13 @@ static int imx214_probe(struct i2c_client *client)
 	pm_runtime_enable(imx214->dev);
 	pm_runtime_idle(imx214->dev);
 
+	/* Set default mode to max resolution */
+	imx214->cur_mode = &imx214_modes[0];
+
 	ret = imx214_ctrls_init(imx214);
 	if (ret < 0)
 		goto error_power_off;
 
-	mutex_init(&imx214->mutex);
-	imx214->ctrls.lock = &imx214->mutex;
-
 	imx214->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx214->pad.flags = MEDIA_PAD_FL_SOURCE;
 	imx214->sd.dev = &client->dev;
@@ -1097,20 +1035,27 @@ static int imx214_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
-	imx214_entity_init_state(&imx214->sd, NULL);
+	imx214->sd.state_lock = imx214->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(&imx214->sd);
+	if (ret < 0) {
+		dev_err(dev, "subdev init error: %d\n", ret);
+		goto free_entity;
+	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
-		goto free_entity;
+		goto error_subdev_cleanup;
 	}
 
 	return 0;
 
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx214->sd);
+
 free_entity:
 	media_entity_cleanup(&imx214->sd.entity);
 free_ctrl:
-	mutex_destroy(&imx214->mutex);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
 error_power_off:
 	pm_runtime_disable(imx214->dev);
@@ -1125,13 +1070,12 @@ static void imx214_remove(struct i2c_client *client)
 	struct imx214 *imx214 = to_imx214(sd);
 
 	v4l2_async_unregister_subdev(&imx214->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&imx214->sd.entity);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
 
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&imx214->mutex);
 }
 
 static const struct of_device_id imx214_of_match[] = {

-- 
2.47.1



