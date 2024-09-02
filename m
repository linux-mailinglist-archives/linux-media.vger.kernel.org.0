Return-Path: <linux-media+bounces-17406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BD968F3F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42709283CF5
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652FB188585;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4bT5v1b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51C1714A4;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314031; cv=none; b=L8msFdcxl7h6MsPakwzoEbTlRxpI1oRTkdgPQWWWeTYZy6pMmnc55j7dOXekMEFV9K9U1v0CCqZK2Fwwd2WQ3Wker0BTvG1UMht1Yq4AgFdEB0xf8NI/l5eIYY0dfK+u722QZplWG0WTPoveQfrhlp+6m23Nur3GJmzm0jFHYWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314031; c=relaxed/simple;
	bh=+0VYzHcIP4F/AHqO/v5VwN11p0LblPczRDTvcMN32r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mr61DguG/foYXPAXfDpsahxMUvVZDH9niate/xZq0ATWSEVEl+vEpCHOu2saZ/oc4/sWkQm6eEoFANG/wO3bwzp/VCBecGRyyUjE4TMheJJCo9MVjTGSuvdVbqRycD2YIGSI3CDfeo3+RQujcIx6zxij3h5fqfY86iF70aE7jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4bT5v1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 581BAC4CEC8;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=+0VYzHcIP4F/AHqO/v5VwN11p0LblPczRDTvcMN32r8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B4bT5v1bF2oeTp9GEdU1XsBuME6NSKCxdhUPhwhqUIJgsZL7oL8n7JdFGXy3jErZF
	 We8YeJFU05yporBgN2xneGw25M9uZjcBgGH6KveVbB70g9BA5fv0YSoNCWTBJVu4xa
	 9nofwr81NuO70pO9Md/4W1pjc/qpLHVc5p/myw7+n3mlOqfYrJYM9dLTc1xaQh+Ebb
	 rs9VoUB2SuMWoIiderhPSTexHxg1Eej6/VMox3TWggevt7a0/9HjhMrsMAZVvXIzyZ
	 qZMMwF9Husjfn/kyAy4pKUcENr4uLb6k3RdRIUgqinnkaE6ddOPlqY9poZ1P+k7MtQ
	 v3PqJ/D0Alj0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4607BCD13CF;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:28 +0200
Subject: [PATCH 01/13] media: i2c: imx214: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-1-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=8246;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=GSIvrjeyr0c3Vcgp4vX1yQm8ICyOnNIrdUp3+1ZKcBE=;
 b=DjURmWWKkFnTVgrdV68Hf7ABbSA1KGBmSIByy9jKDbPgfZ4OfUBT7v6KWX4sPRw8P5yKVPG9b
 AFwhS+WJb/tBYr5F7trObOd1jtGXJf2t4G0gBMfGP/cvhy+AYVBti2m
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

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 129 +++++++++++++--------------------------------
 1 file changed, 38 insertions(+), 91 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d..58f3c3f67e0d 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -71,12 +71,6 @@ struct imx214 {
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
@@ -604,34 +568,19 @@ static int imx214_set_format(struct v4l2_subdev *sd,
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
+	__format = v4l2_subdev_state_get_format(sd_state, 0);
+	*__format = format->format;
 
-	format->format = *__format;
-
-	mutex_unlock(&imx214->mutex);
+	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	__crop->width = mode->width;
+	__crop->height = mode->height;
 
 	return 0;
 }
@@ -640,14 +589,9 @@ static int imx214_get_selection(struct v4l2_subdev *sd,
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
@@ -829,7 +773,6 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	const struct imx214_mode *mode;
 	int ret;
 
-	mutex_lock(&imx214->mutex);
 	ret = imx214_write_table(imx214, mode_table_common);
 	if (ret < 0) {
 		dev_err(imx214->dev, "could not sent common table %d\n", ret);
@@ -855,11 +798,9 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		goto error;
 	}
 
-	mutex_unlock(&imx214->mutex);
 	return 0;
 
 error:
-	mutex_unlock(&imx214->mutex);
 	return ret;
 }
 
@@ -877,6 +818,7 @@ static int imx214_stop_streaming(struct imx214 *imx214)
 static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct imx214 *imx214 = to_imx214(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (enable) {
@@ -884,7 +826,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		if (ret < 0)
 			return ret;
 
+		state = v4l2_subdev_lock_and_get_active_state(subdev);
 		ret = imx214_start_streaming(imx214);
+		v4l2_subdev_unlock_state(state);
 		if (ret < 0)
 			goto err_rpm_put;
 	} else {
@@ -948,7 +892,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
 	.enum_mbus_code = imx214_enum_mbus_code,
 	.enum_frame_size = imx214_enum_frame_size,
 	.enum_frame_interval = imx214_enum_frame_interval,
-	.get_fmt = imx214_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx214_set_format,
 	.get_selection = imx214_get_selection,
 	.get_frame_interval = imx214_get_frame_interval,
@@ -1083,9 +1027,6 @@ static int imx214_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_power_off;
 
-	mutex_init(&imx214->mutex);
-	imx214->ctrls.lock = &imx214->mutex;
-
 	imx214->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx214->pad.flags = MEDIA_PAD_FL_SOURCE;
 	imx214->sd.dev = &client->dev;
@@ -1097,20 +1038,27 @@ static int imx214_probe(struct i2c_client *client)
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
@@ -1125,13 +1073,12 @@ static void imx214_remove(struct i2c_client *client)
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
2.46.0



