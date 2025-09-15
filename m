Return-Path: <linux-media+bounces-42517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F8B57080
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81B4188E44D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5037A287512;
	Mon, 15 Sep 2025 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KlUuzN4q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D572882B7;
	Mon, 15 Sep 2025 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918413; cv=none; b=O/+h10NX+DeWORyWrxmEIilFgmyJcPlKvsrJhWZFJJz2mDpEEINwZr5lVayvLoH3u0MMljdLM0+AzCtyqLRwG1gq23edFEceJ5Ks9q+4uOy37+ickxjJ2zPIw7M86baSVV5BjlV8A7JBFKIH3h4xbh+WAw2VGTajowOm7U7Sff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918413; c=relaxed/simple;
	bh=avfpzotIJNr7ZAssrGuB1xQBZmVl0SIyY0rYb5SR79Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFWXaIxNbzRT32J9+aB8a8NsETHKbd7huzgGiiH+2/raqvdEMGdimO2dEP1R7YtE4PxfZW6Pn8e9m0i2Sd+zDcaLEQVxcWbc0KBB6Ri23wIcOktD3or/ewrnBD/icqwx+x8OCVmt/ePOdWXMmcqncqnEy4vyohDSIeIwe4qf9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KlUuzN4q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF03EC71;
	Mon, 15 Sep 2025 08:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918333;
	bh=avfpzotIJNr7ZAssrGuB1xQBZmVl0SIyY0rYb5SR79Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KlUuzN4qKD6HRYJgSFwoQW0ashlqBzvqhnPNRHtJZXbafXcAAiCWVd7MEH88u0nqv
	 4UDYw7qgxhgP2Tk0lzsQTnEKkwr6+Mga5izVjH8/4+lY34FvtHrpJB49ufXkGzFxcs
	 Gp8KEBfoymW5nXdAcNrOhpPwrSQvmsz+nAkXLiIs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:12 +0530
Subject: [PATCH v3 6/8] media: imx355: Use subdev active state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-6-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7175;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=avfpzotIJNr7ZAssrGuB1xQBZmVl0SIyY0rYb5SR79Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SV11D49By4uouidX+Xg/P3JInSx5AZ8H8e2
 TDXJkqMh7KJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0lQAKCRBD3pH5JJpx
 RQPnEACnDQd+YMlFUK9Odrw7Yq+x3dqWrNnXWxOgPcYMuxoWIc9OChbOwydmMKtA9g9SH18nym2
 CdGA+Wf6lIOkCGUZv+egur/T3kcpwcTlDWBJuwrN4p6iSxWggvFqhehLuEBSk9aosdNZv/pOiL4
 Oeq+YeWDL/QSruTlce4vnKvPbsLesUWPMeZsVQEjvwSUpfah1pscr/ToQzeeKCicglZZ0cUjOUq
 1iZ7YeYeEF0LhMm1ImYgFtaZPHzV2zZGeoKchrnA5mmX1U7e1iNSxJ8P/pu6lmtXyLbcGjJ3j+W
 A4+2TgkY2A9MAIUkHfWnJNgBy+e9RoIgp0Cj0p5fySzpJ0vAHDsKl8A6dhBVscRQlh1ARM+2XDJ
 fqKOJ7CRdR01dZPFvsufeqnp/vmWY1+/0ALBtbmlg5NA4YlV5jaOHmB8EV8Y0x3xptatYqRuFCs
 BZzu8TVzeTigKKjAK96Y/ceFHsblvNcL0hvKVQUnjVKXn3CpmO385RUyMaBReHEQ+0MMArzSCqI
 qgAeFDjA2+619g2htL+uk646bek6LWDYp/oohxjCPVvx177pIEnPsf8oOSoF26TDe7H94k52/H+
 l9zoZgcsbJOHeppqFV5w/W9RH+rYQFvrkSAsvYVnYYuN6zIS3sYf7NO7rY6fw3Gf/H5Glhh4qn8
 3irOEU9VBUYu1tg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Port the driver to use the subdev active state. This simplifies locking,
and makes it easier to support different crop sizes for binned modes, by
storing the crop rectangle inside the subdev state.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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


