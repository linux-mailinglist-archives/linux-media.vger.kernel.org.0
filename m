Return-Path: <linux-media+bounces-23652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB69F58D5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32DB162FE3
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333671FA267;
	Tue, 17 Dec 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykq4Q1z0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF81F8AE6;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471563; cv=none; b=mFQimnqCem2OmL02cGc5p3CW8vuT/nn18YH7GoxjsW9pgr/kieqmOZjKHW6rsFUvaUSxbqcypnBp83jPd2eg51WvuGOXjKmZC9a8DIjCHfaJk4/uLoTrg16oJHmkkkOoOH9BMKVQB1elwELgQp9GGshIgFTwt5AmQhdvsOUPYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471563; c=relaxed/simple;
	bh=H+KBxXZjPd9VZdEYn0vO1XoUkq1rYO7rdU/RDr0VXBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4GTWz3WaDPm5Du923+pRVCQ2HgztZU3iviwoXgcyKjwSSjwlATLtp8EvF09umCu7ACt03jPiOkjpIqK9cTCN9BV0+7ed2qNx6FYELKsii0QmCm0mddpr47OH0gcMQCR21/NU0pO1VDFTphy5BZDENlVuk5QqA60XpNiGJcspxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykq4Q1z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27E0DC4CED7;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=H+KBxXZjPd9VZdEYn0vO1XoUkq1rYO7rdU/RDr0VXBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ykq4Q1z0lV7fB6ZCbRQ2fnq006S3H+KJMot3Lhh4QedE96kpoGAdm9g5s4Jv1MwCv
	 HgApHQ0dz+hEAqxF3U0wj4pygCCECKlYgMf3a2S7LtbfUDh2UURfyZJOVltiobKMjl
	 Hwm49vcGrNzGlwvZq3QZWPTrDnjiRkIxN/QxCTD7yCHsmlr7eQTLaOGi9XW86mBEK7
	 2XnoRaR25rKtzXcNp5N8fJTX2GSHZ2cK2/QkKimKlpWjN8qLIODyfvi/Soiq9BE4iW
	 TREokr5ZjOs99/c0rCHocbHQQRIvmH5PsYxmmxGXVe0s+ac+XOUSvqSLRaofWspjlP
	 TrGUt7pya7tXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1424EE77184;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:13 +0100
Subject: [PATCH v5 01/13] media: i2c: imx214: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-1-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=9658;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=3Sc6jLmHaRqTfWvya/hUi0fNJHx3PZb183+/a/z3ROM=;
 b=wsSYY4G4erZIBuQPc1IAsT4tpThwArKfCRsiZIkJXR6OhEu8GvMUJVQTKQkhShkbwmAns4l30
 Zsym68/wMnNCHJbiBTsNKu81hZ5MNxNthbXHvJf98Qn/uL7sFb19Jbv
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
 drivers/media/i2c/imx214.c | 154 +++++++++++++++------------------------------
 1 file changed, 49 insertions(+), 105 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d62425aeccb46a400fa93146f14ea..646a25d9d3767c4c537fba47a5972269208150ee 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -59,8 +59,6 @@ struct imx214 {
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixel_rate;
@@ -71,12 +69,6 @@ struct imx214 {
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
@@ -490,6 +482,22 @@ static int __maybe_unused imx214_power_off(struct device *dev)
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
@@ -549,52 +557,6 @@ static const struct v4l2_subdev_core_ops imx214_core_ops = {
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
@@ -604,34 +566,20 @@ static int imx214_set_format(struct v4l2_subdev *sd,
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
-
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
+	imx214_update_pad_format(imx214, mode, &format->format,
+				 format->format.code);
+	__format = v4l2_subdev_state_get_format(sd_state, 0);
 
-	format->format = *__format;
+	*__format = format->format;
 
-	mutex_unlock(&imx214->mutex);
+	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	__crop->width = mode->width;
+	__crop->height = mode->height;
 
 	return 0;
 }
@@ -640,14 +588,9 @@ static int imx214_get_selection(struct v4l2_subdev *sd,
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
@@ -826,40 +769,35 @@ static int imx214_write_table(struct imx214 *imx214,
 
 static int imx214_start_streaming(struct imx214 *imx214)
 {
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
 	const struct imx214_mode *mode;
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
+	state = v4l2_subdev_get_locked_active_state(&imx214->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(imx214_modes, ARRAY_SIZE(imx214_modes),
+				      width, height, fmt->width, fmt->height);
 	ret = imx214_write_table(imx214, mode->reg_table);
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
 
@@ -877,6 +815,7 @@ static int imx214_stop_streaming(struct imx214 *imx214)
 static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct imx214 *imx214 = to_imx214(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (enable) {
@@ -884,7 +823,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		if (ret < 0)
 			return ret;
 
+		state = v4l2_subdev_lock_and_get_active_state(subdev);
 		ret = imx214_start_streaming(imx214);
+		v4l2_subdev_unlock_state(state);
 		if (ret < 0)
 			goto err_rpm_put;
 	} else {
@@ -948,7 +889,7 @@ static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
 	.enum_mbus_code = imx214_enum_mbus_code,
 	.enum_frame_size = imx214_enum_frame_size,
 	.enum_frame_interval = imx214_enum_frame_interval,
-	.get_fmt = imx214_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx214_set_format,
 	.get_selection = imx214_get_selection,
 	.get_frame_interval = imx214_get_frame_interval,
@@ -1083,9 +1024,6 @@ static int imx214_probe(struct i2c_client *client)
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



