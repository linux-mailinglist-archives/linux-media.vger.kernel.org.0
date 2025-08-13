Return-Path: <linux-media+bounces-39745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18DB24295
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03DC35808D4
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD8E2EBDD2;
	Wed, 13 Aug 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vuxcFNhw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7672D9EE8;
	Wed, 13 Aug 2025 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069693; cv=none; b=dbWCDSVICaMR8Ha8Lt9x87N/ogoTLJOeirOlhbM7as+qdCLxNTcCmywhWBMgnzV9iXFTj4ouQt7DsRZpYtMOU8Eno98FwRLtWiE241GsmuTkMuqXaOjQnbkG8GAIA0mJDFHczHsM4uwYTl3FnTiG19nW+bHy4YyeTKh1B9iw8qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069693; c=relaxed/simple;
	bh=25p3Sz1t9kJMVh9fauiqODHhWdxO3rNOkRXGbOODn0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0NZBGeGU5FlLoJcpcZ0CU135HWvt/kL78fyxsTvAZqEZ7Tm4Gwnco8NqCSqdob5zMGUg24TvwUGGrd2wWVkUyb5VU4M4bQzB9FC7or3s3sTyI0FtfrDx7qWJy/WGbDoF3qmwhVwvzKK7CywZ5O+K+cAbDeTAfv5vWBPKD+3myI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vuxcFNhw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CD01351;
	Wed, 13 Aug 2025 09:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069637;
	bh=25p3Sz1t9kJMVh9fauiqODHhWdxO3rNOkRXGbOODn0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vuxcFNhws+NVSJTL6o83fcogO6wO2iPIQqN75YpnsxUzOwQvf89iDspPm8iS7bcGd
	 4eStqINb1jKdw/lk5whNsPegeREacRYmc++/FZ4Bs7gBMPl9AcVKl0Jcr4+daBRioZ
	 AgdhGQKDIpS6ghOOBUkwKznLzDHtqHjsPrVxavZs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 Aug 2025 12:50:36 +0530
Subject: [PATCH 5/6] media: imx355: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
In-Reply-To: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9723;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=25p3Sz1t9kJMVh9fauiqODHhWdxO3rNOkRXGbOODn0c=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzZe20Sqo6U80N8uYqC7P3RJf3DO8/+xoUkR
 gz91lhw1eOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw82QAKCRBD3pH5JJpx
 RfzdD/92nC/CG3GqE80znfhwQECLhWSBRvulWYFJYN/vZiMY44YW5Ma1J18KtNbJtGwX2wa3kV3
 RyN3P/+xGsQt1WuDjWe8fLHwjwMb/OxWxBp0JzuyebXwAReh9ZD6f4/aN55LbMQ0vGUPgp+9kmp
 r8LUcNtSPIVnowscWXPHR3H/pP1jDij9d2q4xtLhIIInHTWq5URxc7bR+DkefsJgmuRJhP//2vj
 5Yj828rKQBK8Fo8Kr1ZgzWOEWe9xLOMNtLR998jCkPuogz61UiELA4Ao5RhQWqjKs8H4mOv/nPe
 PJMjAhZkeBuwxsWB0i9mL8xN2qECLTTV+0TQFUAQuTYtBughdYTf6vjnEL9wT7ilr9WIn+gIKQC
 gFhuHSmZG/eHCIjFw87/iqP0KJU/DVknuiKiZvRzZ8mQ+pHDelqksDDYIA8KsDRqhkh7veJlUvQ
 rBFYfseoGWTlnXr7r1yo+7xX9ZDccChQsUC+Eonw8zvRKM4yohvvPy6J4iIZ9AT00y34KH9rUXG
 DZ1gjbRICqPpuyWEUMD15nhQESPvvl8vBP1jESjcEX+N5HtOuM3IbxdCDX++kKmd55K7WdjJWQI
 TSNVoupZclrMmHzUYRcl+Pf1ABbzr/nc53WZKEP/KfspxUdy8ON9SFqSihxYOnMmZ+nyaRkWHU/
 Htj7SZWNFnZ+eSw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Port the driver to use the subdev active state. This simplifies locking,
and makes it easier to support different crop sizes for binned modes, by
storing the crop rectangle inside the subdev state.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 125 +++++++++++++++------------------------------
 1 file changed, 41 insertions(+), 84 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c61a6952f828fd8b945746ae2f53f5517e98c410..df1535927f481de3a0d043ac9be24b9336ea8f7f 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -196,7 +196,6 @@ struct imx335_mode {
  * @vblank: Vertical blanking in lines
  * @lane_mode: Mode for number of connected data lanes
  * @cur_mode: Pointer to current selected sensor mode
- * @mutex: Mutex for serializing sensor controls
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
  * @cur_mbus_code: Currently selected media bus format code
  */
@@ -223,7 +222,6 @@ struct imx335 {
 	u32 vblank;
 	u32 lane_mode;
 	const struct imx335_mode *cur_mode;
-	struct mutex mutex;
 	unsigned long link_freq_bitmap;
 	u32 cur_mbus_code;
 };
@@ -758,36 +756,6 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
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
@@ -801,12 +769,12 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
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
@@ -814,19 +782,15 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 
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
 
@@ -846,12 +810,10 @@ static int imx335_init_state(struct v4l2_subdev *sd,
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
@@ -919,13 +881,17 @@ static int imx335_start_streaming(struct imx335 *imx335)
 	const struct imx335_reg_list *reg_list;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(imx335->dev);
+	if (ret < 0)
+		return ret;
+
 	/* Setup PLL */
 	reg_list = &link_freq_reglist[__ffs(imx335->link_freq_bitmap)];
 	ret = cci_multi_reg_write(imx335->cci, reg_list->regs,
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set plls\n", __func__);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -934,27 +900,27 @@ static int imx335_start_streaming(struct imx335 *imx335)
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "fail to write initial registers\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	ret = imx335_set_framefmt(imx335);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Configure lanes */
 	ret = cci_write(imx335->cci, IMX335_REG_LANEMODE,
 			imx335->lane_mode, NULL);
 	if (ret)
-		return ret;
+		goto err_rpm_put;
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx335->dev, "fail to setup handler\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Start streaming */
@@ -962,25 +928,29 @@ static int imx335_start_streaming(struct imx335 *imx335)
 			IMX335_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "fail to start streaming\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Initial regulator stabilization period */
 	usleep_range(18000, 20000);
 
 	return 0;
+
+err_rpm_put:
+	pm_runtime_put(imx335->dev);
+
+	return ret;
 }
 
 /**
  * imx335_stop_streaming() - Stop sensor stream
  * @imx335: pointer to imx335 device
- *
- * Return: 0 if successful, error code otherwise.
  */
-static int imx335_stop_streaming(struct imx335 *imx335)
+static void imx335_stop_streaming(struct imx335 *imx335)
 {
-	return cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
-			 IMX335_MODE_STANDBY, NULL);
+	cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
+		  IMX335_MODE_STANDBY, NULL);
+	pm_runtime_put(imx335->dev);
 }
 
 /**
@@ -993,31 +963,18 @@ static int imx335_stop_streaming(struct imx335 *imx335)
 static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx335 *imx335 = to_imx335(sd);
-	int ret;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
 
-	mutex_lock(&imx335->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(imx335->dev);
-		if (ret)
-			goto error_unlock;
-
 		ret = imx335_start_streaming(imx335);
-		if (ret)
-			goto error_power_off;
 	} else {
 		imx335_stop_streaming(imx335);
-		pm_runtime_put(imx335->dev);
 	}
 
-	mutex_unlock(&imx335->mutex);
-
-	return 0;
-
-error_power_off:
-	pm_runtime_put(imx335->dev);
-error_unlock:
-	mutex_unlock(&imx335->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1146,7 +1103,7 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.enum_frame_size = imx335_enum_frame_size,
 	.get_selection = imx335_get_selection,
 	.set_selection = imx335_get_selection,
-	.get_fmt = imx335_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx335_set_pad_format,
 };
 
@@ -1241,9 +1198,6 @@ static int imx335_init_controls(struct imx335 *imx335)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx335->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	imx335->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1363,12 +1317,10 @@ static int imx335_probe(struct i2c_client *client)
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
@@ -1401,11 +1353,18 @@ static int imx335_probe(struct i2c_client *client)
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
@@ -1414,14 +1373,14 @@ static int imx335_probe(struct i2c_client *client)
 
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
@@ -1435,9 +1394,9 @@ static int imx335_probe(struct i2c_client *client)
 static void imx335_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx335 *imx335 = to_imx335(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1445,8 +1404,6 @@ static void imx335_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		imx335_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&imx335->mutex);
 }
 
 static const struct dev_pm_ops imx335_pm_ops = {

-- 
2.50.1


