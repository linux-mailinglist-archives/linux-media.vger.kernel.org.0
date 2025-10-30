Return-Path: <linux-media+bounces-45990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51064C1F0C9
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D8CD189A5BC
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2587233DEC4;
	Thu, 30 Oct 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h9U3zq40"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD933C52D;
	Thu, 30 Oct 2025 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813828; cv=none; b=UQeiWBFfmWro8Kd9ZLABWJzTJTUCFbxmM6Ie6TxfnIch7Yvu7WP9htk2bKcx8tMrBOf1QTn3ThXzoFl9A4JpqdNydjt5CtAoWzqZxI+MPchAERZeNwpwBjyYf+Ck9rt1hGcBa6p6Vd3q00xQwPfXiiWctqOxqvZ6Aq2P9oKCMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813828; c=relaxed/simple;
	bh=kokEcIS5DxI8Kkdo0V1lHfdBi9YnPOXA5WgzvzYYTeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgRKQg/nTFcGuT9OvE4k6VpYsT/S9/Klq8fwokZyZOugvqgR5Lt+gzqeM+VCnDgijEYtEA0uhHgGNr/zRB7rnON8CjjF7RBfvBUhVo/icBpp2+bza9/oNhiLaiOqrj52Xe7UA74un/txG0zcwqeOD4LppgWb/PqFgen5zJhgJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h9U3zq40; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CE0FEAE;
	Thu, 30 Oct 2025 09:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813715;
	bh=kokEcIS5DxI8Kkdo0V1lHfdBi9YnPOXA5WgzvzYYTeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9U3zq40Ec2dFIcU+Dj3/hXJrEekmmFbFcFowaSpSqq6XDfJelnodSoToLhSlIVjz
	 GwMtFwVly6FnSfesnvXhiGN0osADcs4wT1Tpnt41cDwREc32kHHHSBqkTAUBTSlzyx
	 LB04hKoRByK5nt8LBKkmy/1CeqMQG8f41nEjLcDw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 6/8] media: imx355: Use subdev active state
Date: Thu, 30 Oct 2025 14:12:59 +0530
Message-ID: <20251030-imx335_binning-v4-6-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Port the driver to use the subdev active state. This simplifies locking,
and makes it easier to support different crop sizes for binned modes, by
storing the crop rectangle inside the subdev state.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 79 +++++++++++++++++++++----------------------------------------------------------
 1 file changed, 21 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 5e18eb998f9d76907ef88cd09ee19e7afe9166e4..00e65da5f9ae127f6d61a0fe68691c9f49c26d15 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -204,7 +204,6 @@ struct imx335_mode {
  * @vblank: Vertical blanking in lines
  * @lane_mode: Mode for number of connected data lanes
  * @cur_mode: Pointer to current selected sensor mode
- * @mutex: Mutex for serializing sensor controls
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
  * @cur_mbus_code: Currently selected media bus format code
  */
@@ -231,7 +230,6 @@ struct imx335 {
 	u32 vblank;
 	u32 lane_mode;
 	const struct imx335_mode *cur_mode;
-	struct mutex mutex;
 	unsigned long link_freq_bitmap;
 	u32 cur_mbus_code;
 };
@@ -759,36 +757,6 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-/**
- * imx335_get_pad_format() - Get subdevice pad format
- * @sd: pointer to imx335 V4L2 sub-device structure
- * @sd_state: V4L2 sub-device configuration
- * @fmt: V4L2 sub-device format need to be set
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx335_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_format *fmt)
-{
-	struct imx335 *imx335 = to_imx335(sd);
-
-	mutex_lock(&imx335->mutex);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		struct v4l2_mbus_framefmt *framefmt;
-
-		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-		fmt->format = *framefmt;
-	} else {
-		imx335_fill_pad_format(imx335, imx335->cur_mode, fmt);
-	}
-
-	mutex_unlock(&imx335->mutex);
-
-	return 0;
-}
-
 /**
  * imx335_set_pad_format() - Set subdevice pad format
  * @sd: pointer to imx335 V4L2 sub-device structure
@@ -802,12 +770,12 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx335 *imx335 = to_imx335(sd);
+	struct v4l2_mbus_framefmt *format;
 	const struct imx335_mode *mode;
 	int i, ret = 0;
 
-	mutex_lock(&imx335->mutex);
-
 	mode = &supported_mode;
+
 	for (i = 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
 		if (imx335_mbus_codes[i] == fmt->format.code)
 			imx335->cur_mbus_code = imx335_mbus_codes[i];
@@ -815,19 +783,15 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 
 	imx335_fill_pad_format(imx335, mode, fmt);
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		struct v4l2_mbus_framefmt *framefmt;
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	*format = fmt->format;
 
-		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-		*framefmt = fmt->format;
-	} else {
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = imx335_update_controls(imx335, mode);
 		if (!ret)
 			imx335->cur_mode = mode;
 	}
 
-	mutex_unlock(&imx335->mutex);
-
 	return ret;
 }
 
@@ -847,12 +811,10 @@ static int imx335_init_state(struct v4l2_subdev *sd,
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	imx335_fill_pad_format(imx335, &supported_mode, &fmt);
 
-	mutex_lock(&imx335->mutex);
 	__v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
 				 __fls(imx335->link_freq_bitmap),
 				 ~(imx335->link_freq_bitmap),
 				 __ffs(imx335->link_freq_bitmap));
-	mutex_unlock(&imx335->mutex);
 
 	return imx335_set_pad_format(sd, sd_state, &fmt);
 }
@@ -994,16 +956,17 @@ static void imx335_stop_streaming(struct imx335 *imx335)
 static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx335 *imx335 = to_imx335(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&imx335->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable)
 		ret = imx335_start_streaming(imx335);
 	else
 		imx335_stop_streaming(imx335);
 
-	mutex_unlock(&imx335->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1131,7 +1094,7 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.enum_frame_size = imx335_enum_frame_size,
 	.get_selection = imx335_get_selection,
 	.set_selection = imx335_get_selection,
-	.get_fmt = imx335_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx335_set_pad_format,
 };
 
@@ -1226,9 +1189,6 @@ static int imx335_init_controls(struct imx335 *imx335)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx335->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	imx335->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1348,12 +1308,10 @@ static int imx335_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	mutex_init(&imx335->mutex);
-
 	ret = imx335_power_on(imx335->dev);
 	if (ret) {
 		dev_err(imx335->dev, "failed to power-on the sensor\n");
-		goto error_mutex_destroy;
+		return ret;
 	}
 
 	/* Check module identity */
@@ -1386,11 +1344,18 @@ static int imx335_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	imx335->sd.state_lock = imx335->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx335->sd);
+	if (ret < 0) {
+		dev_err(imx335->dev, "subdev init error\n");
+		goto error_media_entity;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&imx335->sd);
 	if (ret < 0) {
 		dev_err(imx335->dev,
 			"failed to register async subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_cleanup;
 	}
 
 	pm_runtime_set_active(imx335->dev);
@@ -1399,14 +1364,14 @@ static int imx335_probe(struct i2c_client *client)
 
 	return 0;
 
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx335->sd);
 error_media_entity:
 	media_entity_cleanup(&imx335->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(imx335->sd.ctrl_handler);
 error_power_off:
 	imx335_power_off(imx335->dev);
-error_mutex_destroy:
-	mutex_destroy(&imx335->mutex);
 
 	return ret;
 }
@@ -1420,9 +1385,9 @@ static int imx335_probe(struct i2c_client *client)
 static void imx335_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx335 *imx335 = to_imx335(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1430,8 +1395,6 @@ static void imx335_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		imx335_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&imx335->mutex);
 }
 
 static const struct dev_pm_ops imx335_pm_ops = {

-- 
2.51.0

