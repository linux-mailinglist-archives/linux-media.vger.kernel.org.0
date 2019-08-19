Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA07923D5
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfHSMuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:50:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47460 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727628AbfHSMuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:50:19 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 20304634C8B;
        Mon, 19 Aug 2019 15:49:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 4/6] smiapp: Rely on V4L2 sub-device framework to do the locking
Date:   Mon, 19 Aug 2019 15:47:26 +0300
Message-Id: <20190819124728.10511-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rely on the V4L2 sub-device framework to perform the locking for this
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 140 +++++++------------------
 1 file changed, 36 insertions(+), 104 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index c9d0416f9b03..79330ec41392 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1228,8 +1228,6 @@ static int smiapp_power_on(struct device *dev)
 	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
 	usleep_range(sleep, sleep);
 
-	mutex_lock(&sensor->mutex);
-
 	sensor->active = true;
 
 	/*
@@ -1330,12 +1328,9 @@ static int smiapp_power_on(struct device *dev)
 			goto out_cci_addr_fail;
 	}
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 
 out_cci_addr_fail:
-	mutex_unlock(&sensor->mutex);
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 
@@ -1353,8 +1348,6 @@ static int smiapp_power_off(struct device *dev)
 	struct smiapp_sensor *sensor =
 		container_of(ssd, struct smiapp_sensor, ssds[0]);
 
-	mutex_lock(&sensor->mutex);
-
 	/*
 	 * Currently power/clock to lens are enable/disabled separately
 	 * but they are essentially the same signals. So if the sensor is
@@ -1369,8 +1362,6 @@ static int smiapp_power_off(struct device *dev)
 
 	sensor->active = false;
 
-	mutex_unlock(&sensor->mutex);
-
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 	usleep_range(5000, 5000);
@@ -1389,28 +1380,26 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	mutex_lock(&sensor->mutex);
-
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_CSI_DATA_FORMAT,
 			    (sensor->csi_format->width << 8) |
 			    sensor->csi_format->compressed);
 	if (rval)
-		goto out;
+		return rval;
 
 	rval = smiapp_pll_configure(sensor);
 	if (rval)
-		goto out;
+		return rval;
 
 	/* Analog crop start coordinates */
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_X_ADDR_START,
 			    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_Y_ADDR_START,
 			    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/* Analog crop end coordinates */
 	rval = smiapp_write(
@@ -1418,14 +1407,14 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left
 		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width - 1);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	rval = smiapp_write(
 		sensor, SMIAPP_REG_U16_Y_ADDR_END,
 		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top
 		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height - 1);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	/*
 	 * Output from pixel array, including blanking, is set using
@@ -1439,25 +1428,25 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].left);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_Y_OFFSET,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].top);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_WIDTH,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].width);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_HEIGHT,
 			sensor->scaler->crop[SMIAPP_PAD_SINK].height);
 		if (rval < 0)
-			goto out;
+			return rval;
 	}
 
 	/* Scaling */
@@ -1466,23 +1455,23 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALING_MODE,
 				    sensor->scaling_mode);
 		if (rval < 0)
-			goto out;
+			return rval;
 
 		rval = smiapp_write(sensor, SMIAPP_REG_U16_SCALE_M,
 				    sensor->scale_m);
 		if (rval < 0)
-			goto out;
+			return rval;
 	}
 
 	/* Output size from sensor */
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_X_OUTPUT_SIZE,
 			    sensor->src->crop[SMIAPP_PAD_SRC].width);
 	if (rval < 0)
-		goto out;
+		return rval;
 	rval = smiapp_write(sensor, SMIAPP_REG_U16_Y_OUTPUT_SIZE,
 			    sensor->src->crop[SMIAPP_PAD_SRC].height);
 	if (rval < 0)
-		goto out;
+		return rval;
 
 	if ((sensor->limits[SMIAPP_LIMIT_FLASH_MODE_CAPABILITY] &
 	     (SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
@@ -1491,21 +1480,18 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	    sensor->hwcfg->strobe_setup->trigger != 0) {
 		rval = smiapp_setup_flash_strobe(sensor);
 		if (rval)
-			goto out;
+			return rval;
 	}
 
 	rval = smiapp_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");
-		goto out;
+		return rval;
 	}
 
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_MODE_SELECT,
 			    SMIAPP_MODE_SELECT_STREAMING);
 
-out:
-	mutex_unlock(&sensor->mutex);
-
 	return rval;
 }
 
@@ -1514,18 +1500,15 @@ static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	mutex_lock(&sensor->mutex);
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_MODE_SELECT,
 			    SMIAPP_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
-		goto out;
+		return rval;
 
 	rval = smiapp_call_quirk(sensor, post_streamoff);
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-out:
-	mutex_unlock(&sensor->mutex);
 	return rval;
 }
 
@@ -1574,20 +1557,17 @@ static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
-	int rval = -EINVAL;
-
-	mutex_lock(&sensor->mutex);
+	int rval = 0;
 
 	dev_err(&client->dev, "subdev %s, pad %d, index %d\n",
 		subdev->name, code->pad, code->index);
 
 	if (subdev != &sensor->src->sd || code->pad != SMIAPP_PAD_SRC) {
 		if (code->index)
-			goto out;
+			return -EINVAL;
 
 		code->code = sensor->internal_csi_format->code;
-		rval = 0;
-		goto out;
+		return 0;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(smiapp_csi_data_formats); i++) {
@@ -1598,14 +1578,10 @@ static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
 			code->code = smiapp_csi_data_formats[i].code;
 			dev_err(&client->dev, "found index %d, i %d, code %x\n",
 				code->index, i, code->code);
-			rval = 0;
-			break;
+			return 0;
 		}
 	}
 
-out:
-	mutex_unlock(&sensor->mutex);
-
 	return rval;
 }
 
@@ -1620,9 +1596,9 @@ static u32 __smiapp_get_mbus_code(struct v4l2_subdev *subdev,
 		return sensor->internal_csi_format->code;
 }
 
-static int __smiapp_get_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
-			       struct v4l2_subdev_format *fmt)
+static int smiapp_get_format(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_format *fmt)
 {
 	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
 
@@ -1646,20 +1622,6 @@ static int __smiapp_get_format(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int smiapp_get_format(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
-			     struct v4l2_subdev_format *fmt)
-{
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __smiapp_get_format(subdev, cfg, fmt);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
 static void smiapp_get_crop_compose(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_rect **crops,
@@ -1751,7 +1713,7 @@ static int smiapp_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __smiapp_get_format(subdev, cfg, fmt);
+	rval = smiapp_get_format(subdev, cfg, fmt);
 	if (rval)
 		return rval;
 
@@ -1800,17 +1762,8 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
 	struct v4l2_rect *crops[SMIAPP_PADS];
 
-	mutex_lock(&sensor->mutex);
-
-	if (fmt->pad == ssd->source_pad) {
-		int rval;
-
-		rval = smiapp_set_format_source(subdev, cfg, fmt);
-
-		mutex_unlock(&sensor->mutex);
-
-		return rval;
-	}
+	if (fmt->pad == ssd->source_pad)
+		return smiapp_set_format_source(subdev, cfg, fmt);
 
 	/* Sink pad. Width and height are changeable here. */
 	fmt->format.code = __smiapp_get_mbus_code(subdev, fmt->pad);
@@ -1838,8 +1791,6 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 	smiapp_propagate(subdev, cfg, fmt->which,
 			 V4L2_SEL_TGT_CROP);
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2181,9 +2132,9 @@ static void smiapp_get_native_size(struct smiapp_subdev *ssd,
 	r->height = ssd->sensor->limits[SMIAPP_LIMIT_Y_ADDR_MAX] + 1;
 }
 
-static int __smiapp_get_selection(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
-				  struct v4l2_subdev_selection *sel)
+static int smiapp_get_selection(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
 {
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
@@ -2231,19 +2182,6 @@ static int __smiapp_get_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int smiapp_get_selection(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
-				struct v4l2_subdev_selection *sel)
-{
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	int rval;
-
-	mutex_lock(&sensor->mutex);
-	rval = __smiapp_get_selection(subdev, cfg, sel);
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
 static int smiapp_set_selection(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_selection *sel)
@@ -2255,8 +2193,6 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&sensor->mutex);
-
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
 	sel->r.width = SMIAPP_ALIGN_DIM(sel->r.width, sel->flags);
@@ -2271,17 +2207,14 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		ret = smiapp_set_crop(subdev, cfg, sel);
+		return smiapp_set_crop(subdev, cfg, sel);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		ret = smiapp_set_compose(subdev, cfg, sel);
+		return smiapp_set_compose(subdev, cfg, sel);
 		break;
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&sensor->mutex);
-	return ret;
 }
 
 static int smiapp_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
@@ -2627,8 +2560,6 @@ static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct smiapp_sensor *sensor = ssd->sensor;
 	unsigned int i;
 
-	mutex_lock(&sensor->mutex);
-
 	for (i = 0; i < ssd->npads; i++) {
 		struct v4l2_mbus_framefmt *try_fmt =
 			v4l2_subdev_get_try_format(sd, fh->pad, i);
@@ -2650,8 +2581,6 @@ static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		*try_comp = *try_crop;
 	}
 
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 }
 
@@ -2913,6 +2842,9 @@ static int smiapp_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->mutex);
 
+	for (i = 0; i < SMIAPP_SUBDEVS; i++)
+		sensor->ssds[i].sd.lock = &sensor->mutex;
+
 	rval = smiapp_power_on(&client->dev);
 	if (rval < 0)
 		goto out_mutex_destroy;
-- 
2.20.1

