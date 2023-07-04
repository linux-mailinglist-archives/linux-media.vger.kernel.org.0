Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628F4746EF2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjGDKlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjGDKlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:41:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDB418D
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:41:11 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30C122094;
        Tue,  4 Jul 2023 12:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688467225;
        bh=gQ1bInA5WablRohLu+6QO9ugmKAoHxt3GOW5P+Lh0pc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wduLsK3p+/NRQ8hbk+pmbdhVeigmvshoP5bawn5Knp54Ws0VD6fy0n7r1O+iBautO
         C6iLvJt+PBUgiqqQqFHN1Pa2ftraNlRcBStAsF0sI9M24rCZAeeccIiM/iaWSzHa0l
         /D6Ad83q7PkfRBN+l9z3+ycn/h+VyEN+RXJa9H1o=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 3/5] media: i2c: imx219: Use subdev active state
Date:   Tue,  4 Jul 2023 12:40:55 +0200
Message-Id: <20230704104057.149837-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Port the imx219 sensor driver to use the subdev active state.

Move all the format configuration to the subdevice state and simplify
the format handling, locking and initialization.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 182 +++++++++++--------------------------
 1 file changed, 51 insertions(+), 131 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 191cb4a427cc..127ecee3643d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -460,8 +460,6 @@ struct imx219 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
-	struct v4l2_mbus_framefmt fmt;
-
 	struct clk *xclk; /* system clock to IMX219 */
 	u32 xclk_freq;
 
@@ -481,12 +479,6 @@ struct imx219 {
 	/* Current mode */
 	const struct imx219_mode *mode;
 
-	/*
-	 * Mutex for serialized access:
-	 * Protect sensor module set pad format and start/stop streaming safely.
-	 */
-	struct mutex mutex;
-
 	/* Streaming on/off */
 	bool streaming;
 
@@ -576,8 +568,6 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
 	unsigned int i;
 
-	lockdep_assert_held(&imx219->mutex);
-
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == code)
 			break;
@@ -591,23 +581,6 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
-static void imx219_set_default_format(struct imx219 *imx219)
-{
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = &imx219->fmt;
-	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
-							  fmt->colorspace,
-							  fmt->ycbcr_enc);
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
-	fmt->width = supported_modes[0].width;
-	fmt->height = supported_modes[0].height;
-	fmt->field = V4L2_FIELD_NONE;
-}
-
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -705,15 +678,21 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_rect *try_crop;
 
 	/* Initialize try_fmt */
-	format = v4l2_subdev_get_try_format(sd, state, 0);
+	format = v4l2_subdev_get_pad_format(sd, state, 0);
 	format->width = supported_modes[0].width;
 	format->height = supported_modes[0].height;
 	format->code = imx219_get_format_code(imx219,
 					      MEDIA_BUS_FMT_SRGGB10_1X10);
 	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_SRGB;
+	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
+	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  format->colorspace,
+							  format->ycbcr_enc);
+	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
 
 	/* Initialize try_crop rectangle. */
-	try_crop = v4l2_subdev_get_try_crop(sd, state, 0);
+	try_crop = v4l2_subdev_get_pad_crop(sd, state, 0);
 	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
 	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
 	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
@@ -731,9 +710,7 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
 		return -EINVAL;
 
-	mutex_lock(&imx219->mutex);
 	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
-	mutex_unlock(&imx219->mutex);
 
 	return 0;
 }
@@ -748,9 +725,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	mutex_lock(&imx219->mutex);
 	code = imx219_get_format_code(imx219, fse->code);
-	mutex_unlock(&imx219->mutex);
 	if (fse->code != code)
 		return -EINVAL;
 
@@ -782,52 +757,15 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 	imx219_reset_colorspace(&fmt->format);
 }
 
-static int __imx219_get_pad_format(struct imx219 *imx219,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_format *fmt)
-{
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(&imx219->sd, sd_state,
-						   fmt->pad);
-		/* update the code which could change due to vflip or hflip: */
-		try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
-		fmt->format = *try_fmt;
-	} else {
-		imx219_update_pad_format(imx219, imx219->mode, fmt);
-		fmt->format.code = imx219_get_format_code(imx219,
-							  imx219->fmt.code);
-	}
-
-	return 0;
-}
-
-static int imx219_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_format *fmt)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	int ret;
-
-	mutex_lock(&imx219->mutex);
-	ret = __imx219_get_pad_format(imx219, sd_state, fmt);
-	mutex_unlock(&imx219->mutex);
-
-	return ret;
-}
-
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
-	struct v4l2_mbus_framefmt *framefmt;
 	int exposure_max, exposure_def, hblank;
 	unsigned int i;
 
-	mutex_lock(&imx219->mutex);
-
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == fmt->format.code)
 			break;
@@ -841,13 +779,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
+
 	imx219_update_pad_format(imx219, mode, fmt);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
-		*framefmt = fmt->format;
-	} else if (imx219->mode != mode ||
-		   imx219->fmt.code != fmt->format.code) {
-		imx219->fmt = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx219->mode = mode;
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -873,14 +808,15 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 hblank);
 	}
 
-	mutex_unlock(&imx219->mutex);
+	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = fmt->format;
 
 	return 0;
 }
 
-static int imx219_set_framefmt(struct imx219 *imx219)
+static int imx219_set_framefmt(struct imx219 *imx219,
+			       const struct v4l2_mbus_framefmt *format)
 {
-	switch (imx219->fmt.code) {
+	switch (format->code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -899,7 +835,8 @@ static int imx219_set_framefmt(struct imx219 *imx219)
 	return -EINVAL;
 }
 
-static int imx219_set_binning(struct imx219 *imx219)
+static int imx219_set_binning(struct imx219 *imx219,
+			      const struct v4l2_mbus_framefmt *format)
 {
 	if (!imx219->mode->binning) {
 		return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
@@ -907,7 +844,7 @@ static int imx219_set_binning(struct imx219 *imx219)
 					IMX219_BINNING_NONE);
 	}
 
-	switch (imx219->fmt.code) {
+	switch (format->code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -928,34 +865,13 @@ static int imx219_set_binning(struct imx219 *imx219)
 	return -EINVAL;
 }
 
-static const struct v4l2_rect *
-__imx219_get_pad_crop(struct imx219 *imx219,
-		      struct v4l2_subdev_state *sd_state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&imx219->sd, sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &imx219->mode->crop;
-	}
-
-	return NULL;
-}
-
 static int imx219_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
-		struct imx219 *imx219 = to_imx219(sd);
-
-		mutex_lock(&imx219->mutex);
-		sel->r = *__imx219_get_pad_crop(imx219, sd_state, sel->pad,
-						sel->which);
-		mutex_unlock(&imx219->mutex);
-
+		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
 		return 0;
 	}
 
@@ -987,9 +903,11 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 				IMX219_CSI_2_LANE_MODE : IMX219_CSI_4_LANE_MODE);
 };
 
-static int imx219_start_streaming(struct imx219 *imx219)
+static int imx219_start_streaming(struct imx219 *imx219,
+				  struct v4l2_subdev_state *state)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct v4l2_mbus_framefmt *format;
 	const struct imx219_reg_list *reg_list;
 	int ret;
 
@@ -1019,14 +937,15 @@ static int imx219_start_streaming(struct imx219 *imx219)
 		goto err_rpm_put;
 	}
 
-	ret = imx219_set_framefmt(imx219);
+	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
+	ret = imx219_set_framefmt(imx219, format);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
 		goto err_rpm_put;
 	}
 
-	ret = imx219_set_binning(imx219);
+	ret = imx219_set_binning(imx219, format);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set binning: %d\n",
 			__func__, ret);
@@ -1075,35 +994,30 @@ static void imx219_stop_streaming(struct imx219 *imx219)
 static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&imx219->mutex);
-	if (imx219->streaming == enable) {
-		mutex_unlock(&imx219->mutex);
-		return 0;
-	}
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (imx219->streaming == enable)
+		goto unlock;
 
 	if (enable) {
 		/*
 		 * Apply default & customized values
 		 * and then start streaming.
 		 */
-		ret = imx219_start_streaming(imx219);
+		ret = imx219_start_streaming(imx219, state);
 		if (ret)
-			goto err_unlock;
+			goto unlock;
 	} else {
 		imx219_stop_streaming(imx219);
 	}
 
 	imx219->streaming = enable;
 
-	mutex_unlock(&imx219->mutex);
-
-	return ret;
-
-err_unlock:
-	mutex_unlock(&imx219->mutex);
-
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -1168,10 +1082,13 @@ static int __maybe_unused imx219_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	if (imx219->streaming) {
-		ret = imx219_start_streaming(imx219);
+		state = v4l2_subdev_lock_and_get_active_state(sd);
+		ret = imx219_start_streaming(imx219, state);
+		v4l2_subdev_unlock_state(state);
 		if (ret)
 			goto error;
 	}
@@ -1234,7 +1151,7 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.init_cfg = imx219_init_cfg,
 	.enum_mbus_code = imx219_enum_mbus_code,
-	.get_fmt = imx219_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
@@ -1267,9 +1184,6 @@ static int imx219_init_controls(struct imx219 *imx219)
 	if (ret)
 		return ret;
 
-	mutex_init(&imx219->mutex);
-	ctrl_hdlr->lock = &imx219->mutex;
-
 	/* By default, PIXEL_RATE is read only */
 	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE,
@@ -1366,7 +1280,6 @@ static int imx219_init_controls(struct imx219 *imx219)
 
 error:
 	v4l2_ctrl_handler_free(ctrl_hdlr);
-	mutex_destroy(&imx219->mutex);
 
 	return ret;
 }
@@ -1374,7 +1287,6 @@ static int imx219_init_controls(struct imx219 *imx219)
 static void imx219_free_controls(struct imx219 *imx219)
 {
 	v4l2_ctrl_handler_free(imx219->sd.ctrl_handler);
-	mutex_destroy(&imx219->mutex);
 }
 
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
@@ -1511,19 +1423,23 @@ static int imx219_probe(struct i2c_client *client)
 	/* Initialize source pad */
 	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
 
-	/* Initialize default format */
-	imx219_set_default_format(imx219);
-
 	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
 	if (ret) {
 		dev_err(dev, "failed to init entity pads: %d\n", ret);
 		goto error_handler_free;
 	}
 
+	imx219->sd.state_lock = imx219->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx219->sd);
+	if (ret < 0) {
+		dev_err(dev, "subdev init error: %d\n", ret);
+		goto error_media_entity;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
 	if (ret < 0) {
 		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_cleanup;
 	}
 
 	/* Enable runtime PM and turn off the device */
@@ -1533,6 +1449,9 @@ static int imx219_probe(struct i2c_client *client)
 
 	return 0;
 
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx219->sd);
+
 error_media_entity:
 	media_entity_cleanup(&imx219->sd.entity);
 
@@ -1551,6 +1470,7 @@ static void imx219_remove(struct i2c_client *client)
 	struct imx219 *imx219 = to_imx219(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	imx219_free_controls(imx219);
 
-- 
2.40.1

