Return-Path: <linux-media+bounces-42262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25155B52B60
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D47293A6043
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226CA2E36E3;
	Thu, 11 Sep 2025 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RSlCGJ+c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB02DF158;
	Thu, 11 Sep 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578539; cv=none; b=hyRuTjscLJz+iyDWspRAzGz4ZewJy+3clWC0qx3+sKwSDXRq1TTrr6XAyFjO/7mfNOrIRsTQ9d59NYW6GLQjK/aqC7J0B6H7Z+UVZoLEvcA5odfMNrk411CKTmDLhVp3Lf43Quduw+eIlG1D6q6wAjf4BLsHBSzUgIvDAEUGT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578539; c=relaxed/simple;
	bh=gMvZYVz30eqvJbIVDZFXZ6aZlKWcQHZzSXmlx43ny9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeVWmJGDpxjY3cd31M14pe2pDa2mWjICWOEynu9f8cr3W8hu5wXKYQHiKcAu4jv68RfFoSz0KFaV9tBuBwitadZbq2WI2ORhSTbOOr6oyvbcOWzzPRRzbCxbyjThf2agsnURPbt/QXCM7DFAaNPyRAd/2vOvd1hXJCsrcTRtxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RSlCGJ+c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7721D4A4;
	Thu, 11 Sep 2025 10:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578461;
	bh=gMvZYVz30eqvJbIVDZFXZ6aZlKWcQHZzSXmlx43ny9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RSlCGJ+cVoqf1Y3ZZmb0XCYEgZdeZAg+KraSv+e97MUvx/48sP6sZshGgPcKD/LGP
	 TWYOEBaX7qxv5YEgZKJ1gyrnVgoApCNeQWObUWGmyXnAbCNjHXz9S7dObjVoGYNW1K
	 xPSKnIJNkweqoe+JOa1k1581Hv5BHTbddmgyHW6w=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:22 +0530
Subject: [PATCH v2 6/8] media: imx355: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-6-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7112;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=gMvZYVz30eqvJbIVDZFXZ6aZlKWcQHZzSXmlx43ny9E=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTxE+yYnhbREwNWEoIlfutl0sjHOm58NhOS5
 AHKQ+/7g+aJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE8QAKCRBD3pH5JJpx
 RV1lEACmf4XJTwBm0o47L6Z6hZNl8lMkwy2eikrtYaqPSx1wjqpLkePSSo1p8Tg54a09iMBTtt+
 f9oK8D6Rmhtkz2hpylZnSqbnkjo+mylkdkd7odXa0elQoMO0WqO7qqAibI/3LB7zGwAPU++RWEa
 uyqZQwcEsTdVy5XGY+lbJtiiknyozNU2IASiQgNC9YPMB74jxgoUdADYyte1qjzMDaN715c4mQG
 olDM6L4ZY87W6/FROKugvj/9VaVRfJBqe6Ux+edBenZBFaiy8DKAErwWkrNpedGp79a9NoWb153
 uGcj5T+PfByKDSLiZ6EtCJidjvIk6rjqJW0oYuYPeDs53nUrqwxqWh8SqM7wcFC2/zPwxEAg31r
 gPMvmb6/cnti48dTSVr11kg4UZLYw2rwxU7N5oLgOvNALrenN85GqFc5ll0oujdicmkPRkHvJdp
 nwuyS1AGwjRH9aKAP8rI3WIusX60UqjbDvvBCo6ZiaJ3eBDxKpeSN6rft9xiUAAa8pW/xkLdzER
 MfCgHOvyjJc80+NKfdWBm4Zq+kiDdbnlvuI5Zn0nke6OhV04s3YxnL+qV33xl8KZVghu4GYzQuT
 CtBm2VzHtMw49e5Rl8e9600/nGp8sEdu4nMX3fr1hW2T9pbHHdVLAw+SdWOHmeYlf6Q30uPI5MU
 fMFwkFy+jh3dTmw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Port the driver to use the subdev active state. This simplifies locking,
and makes it easier to support different crop sizes for binned modes, by
storing the crop rectangle inside the subdev state.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 79 ++++++++++++----------------------------------
 1 file changed, 21 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 7631f41e6f1e65695fb76a66d9ac5a3588c69658..9b9bbe6473d545bc5618c0fe8191df0b18037cd8 100644
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
@@ -766,36 +764,6 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
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
@@ -809,12 +777,12 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
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
@@ -822,19 +790,15 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 
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
 
@@ -854,12 +818,10 @@ static int imx335_init_state(struct v4l2_subdev *sd,
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
@@ -1001,16 +963,17 @@ static void imx335_stop_streaming(struct imx335 *imx335)
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
@@ -1138,7 +1101,7 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.enum_frame_size = imx335_enum_frame_size,
 	.get_selection = imx335_get_selection,
 	.set_selection = imx335_get_selection,
-	.get_fmt = imx335_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx335_set_pad_format,
 };
 
@@ -1233,9 +1196,6 @@ static int imx335_init_controls(struct imx335 *imx335)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx335->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	imx335->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1355,12 +1315,10 @@ static int imx335_probe(struct i2c_client *client)
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
@@ -1393,11 +1351,18 @@ static int imx335_probe(struct i2c_client *client)
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
@@ -1406,14 +1371,14 @@ static int imx335_probe(struct i2c_client *client)
 
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
@@ -1427,9 +1392,9 @@ static int imx335_probe(struct i2c_client *client)
 static void imx335_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx335 *imx335 = to_imx335(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1437,8 +1402,6 @@ static void imx335_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		imx335_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&imx335->mutex);
 }
 
 static const struct dev_pm_ops imx335_pm_ops = {

-- 
2.51.0


