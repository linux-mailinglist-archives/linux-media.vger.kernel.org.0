Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 368F8DC828
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408582AbfJRPKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:10:42 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51496 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406464AbfJRPKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:10:41 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id E5697634C8A;
        Fri, 18 Oct 2019 18:10:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/3] smiapp: Avoid maintaining power state information
Date:   Fri, 18 Oct 2019 18:07:19 +0300
Message-Id: <20191018150720.31674-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018150720.31674-1-sakari.ailus@linux.intel.com>
References: <20191018150720.31674-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of keeping track of the power state ourselves, let runtime PM
handle it.

This also splits handling controls between side effect management and
writing the new configuration to the sensor's registers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 199 ++++++++++++++-----------
 drivers/media/i2c/smiapp/smiapp-regs.c |   3 -
 drivers/media/i2c/smiapp/smiapp.h      |   1 -
 3 files changed, 113 insertions(+), 90 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 2af796abb6b8..bcc703b83309 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -413,21 +413,14 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct smiapp_sensor *sensor =
 		container_of(ctrl->handler, struct smiapp_subdev, ctrl_handler)
 			->sensor;
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int pm_status;
 	u32 orient = 0;
+	unsigned int i;
 	int exposure;
 	int rval;
 
 	switch (ctrl->id) {
-	case V4L2_CID_ANALOGUE_GAIN:
-		return smiapp_write(
-			sensor,
-			SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GLOBAL, ctrl->val);
-
-	case V4L2_CID_EXPOSURE:
-		return smiapp_write(
-			sensor,
-			SMIAPP_REG_U16_COARSE_INTEGRATION_TIME, ctrl->val);
-
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
 		if (sensor->streaming)
@@ -440,15 +433,10 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 			orient |= SMIAPP_IMAGE_ORIENTATION_VFLIP;
 
 		orient ^= sensor->hvflip_inv_mask;
-		rval = smiapp_write(sensor, SMIAPP_REG_U8_IMAGE_ORIENTATION,
-				    orient);
-		if (rval < 0)
-			return rval;
 
 		smiapp_update_mbus_formats(sensor);
 
-		return 0;
-
+		break;
 	case V4L2_CID_VBLANK:
 		exposure = sensor->exposure->val;
 
@@ -461,59 +449,105 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 				return rval;
 		}
 
-		return smiapp_write(
-			sensor, SMIAPP_REG_U16_FRAME_LENGTH_LINES,
-			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
-			+ ctrl->val);
-
-	case V4L2_CID_HBLANK:
-		return smiapp_write(
-			sensor, SMIAPP_REG_U16_LINE_LENGTH_PCK,
-			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width
-			+ ctrl->val);
-
+		break;
 	case V4L2_CID_LINK_FREQ:
 		if (sensor->streaming)
 			return -EBUSY;
 
-		return smiapp_pll_update(sensor);
-
-	case V4L2_CID_TEST_PATTERN: {
-		unsigned int i;
+		rval = smiapp_pll_update(sensor);
+		if (rval)
+			return rval;
 
+		return 0;
+	case V4L2_CID_TEST_PATTERN:
 		for (i = 0; i < ARRAY_SIZE(sensor->test_data); i++)
 			v4l2_ctrl_activate(
 				sensor->test_data[i],
 				ctrl->val ==
 				V4L2_SMIAPP_TEST_PATTERN_MODE_SOLID_COLOUR);
 
-		return smiapp_write(
-			sensor, SMIAPP_REG_U16_TEST_PATTERN_MODE, ctrl->val);
+		break;
 	}
 
+	pm_runtime_get_noresume(&client->dev);
+	pm_status = pm_runtime_get_if_in_use(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+	if (!pm_status)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		rval = smiapp_write(
+			sensor,
+			SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GLOBAL, ctrl->val);
+
+		break;
+	case V4L2_CID_EXPOSURE:
+		rval = smiapp_write(
+			sensor,
+			SMIAPP_REG_U16_COARSE_INTEGRATION_TIME, ctrl->val);
+
+		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		rval = smiapp_write(sensor, SMIAPP_REG_U8_IMAGE_ORIENTATION,
+				    orient);
+
+		break;
+	case V4L2_CID_VBLANK:
+		rval = smiapp_write(
+			sensor, SMIAPP_REG_U16_FRAME_LENGTH_LINES,
+			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
+			+ ctrl->val);
+
+		break;
+	case V4L2_CID_HBLANK:
+		rval = smiapp_write(
+			sensor, SMIAPP_REG_U16_LINE_LENGTH_PCK,
+			sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width
+			+ ctrl->val);
+
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		rval = smiapp_write(
+			sensor, SMIAPP_REG_U16_TEST_PATTERN_MODE, ctrl->val);
+
+		break;
 	case V4L2_CID_TEST_PATTERN_RED:
-		return smiapp_write(
+		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_TEST_DATA_RED, ctrl->val);
 
+		break;
 	case V4L2_CID_TEST_PATTERN_GREENR:
-		return smiapp_write(
+		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_TEST_DATA_GREENR, ctrl->val);
 
+		break;
 	case V4L2_CID_TEST_PATTERN_BLUE:
-		return smiapp_write(
+		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_TEST_DATA_BLUE, ctrl->val);
 
+		break;
 	case V4L2_CID_TEST_PATTERN_GREENB:
-		return smiapp_write(
+		rval = smiapp_write(
 			sensor, SMIAPP_REG_U16_TEST_DATA_GREENB, ctrl->val);
 
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		/* For v4l2_ctrl_s_ctrl_int64() used internally. */
-		return 0;
+		rval = 0;
 
+		break;
 	default:
-		return -EINVAL;
+		rval = -EINVAL;
 	}
+
+	if (pm_status > 0) {
+		pm_runtime_mark_last_busy(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
+	}
+
+	return rval;
 }
 
 static const struct v4l2_ctrl_ops smiapp_ctrl_ops = {
@@ -1184,10 +1218,6 @@ static int smiapp_power_on(struct device *dev)
 	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
 	usleep_range(sleep, sleep);
 
-	mutex_lock(&sensor->mutex);
-
-	sensor->active = true;
-
 	/*
 	 * Failures to respond to the address change command have been noticed.
 	 * Those failures seem to be caused by the sensor requiring a longer
@@ -1270,24 +1300,9 @@ static int smiapp_power_on(struct device *dev)
 		goto out_cci_addr_fail;
 	}
 
-	/* Are we still initialising...? If not, proceed with control setup. */
-	if (sensor->pixel_array) {
-		rval = __v4l2_ctrl_handler_setup(
-			&sensor->pixel_array->ctrl_handler);
-		if (rval)
-			goto out_cci_addr_fail;
-
-		rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
-		if (rval)
-			goto out_cci_addr_fail;
-	}
-
-	mutex_unlock(&sensor->mutex);
-
 	return 0;
 
 out_cci_addr_fail:
-	mutex_unlock(&sensor->mutex);
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 
@@ -1305,8 +1320,6 @@ static int smiapp_power_off(struct device *dev)
 	struct smiapp_sensor *sensor =
 		container_of(ssd, struct smiapp_sensor, ssds[0]);
 
-	mutex_lock(&sensor->mutex);
-
 	/*
 	 * Currently power/clock to lens are enable/disabled separately
 	 * but they are essentially the same signals. So if the sensor is
@@ -1319,10 +1332,6 @@ static int smiapp_power_off(struct device *dev)
 			     SMIAPP_REG_U8_SOFTWARE_RESET,
 			     SMIAPP_SOFTWARE_RESET);
 
-	sensor->active = false;
-
-	mutex_unlock(&sensor->mutex);
-
 	gpiod_set_value(sensor->xshutdown, 0);
 	clk_disable_unprepare(sensor->ext_clk);
 	usleep_range(5000, 5000);
@@ -1507,6 +1516,30 @@ static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
  * V4L2 subdev video operations
  */
 
+static int smiapp_pm_get_init(struct smiapp_sensor *sensor)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	int rval;
+
+	rval = pm_runtime_get_sync(&client->dev);
+	if (rval < 0) {
+		if (rval != -EBUSY && rval != -EAGAIN)
+			pm_runtime_set_active(&client->dev);
+		pm_runtime_put_noidle(&client->dev);
+
+		return rval;
+	} else if (!rval) {
+		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
+					       ctrl_handler);
+		if (rval)
+			return rval;
+
+		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
+	}
+
+	return 0;
+}
+
 static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
@@ -1516,27 +1549,25 @@ static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
 	if (sensor->streaming == enable)
 		return 0;
 
-	if (enable) {
-		rval = pm_runtime_get_sync(&client->dev);
-		if (rval < 0) {
-			if (rval != -EBUSY && rval != -EAGAIN)
-				pm_runtime_set_active(&client->dev);
-			pm_runtime_put(&client->dev);
-			return rval;
-		}
-
-		sensor->streaming = true;
-
-		rval = smiapp_start_streaming(sensor);
-		if (rval < 0)
-			sensor->streaming = false;
-	} else {
-		rval = smiapp_stop_streaming(sensor);
+	if (!enable) {
+		smiapp_stop_streaming(sensor);
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
 		pm_runtime_put_autosuspend(&client->dev);
+
+		return 0;
 	}
 
+	rval = smiapp_pm_get_init(sensor);
+	if (rval)
+		return rval;
+
+	sensor->streaming = true;
+
+	rval = smiapp_start_streaming(sensor);
+	if (rval < 0)
+		sensor->streaming = false;
+
 	return rval;
 }
 
@@ -2291,13 +2322,9 @@ smiapp_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
 	if (!sensor->dev_init_done)
 		return -EBUSY;
 
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0) {
-		if (rval != -EBUSY && rval != -EAGAIN)
-			pm_runtime_set_active(&client->dev);
-		pm_runtime_put_noidle(&client->dev);
+	rval = smiapp_pm_get_init(sensor);
+	if (rval < 0)
 		return -ENODEV;
-	}
 
 	rval = smiapp_read_nvm(sensor, buf, PAGE_SIZE);
 	if (rval < 0) {
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/smiapp-regs.c
index 0470e47c2f7a..ce8c1d47fbf0 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/smiapp-regs.c
@@ -223,9 +223,6 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	     len != SMIAPP_REG_32BIT) || flags)
 		return -EINVAL;
 
-	if (!sensor->active)
-		return 0;
-
 	msg.addr = client->addr;
 	msg.flags = 0; /* Write */
 	msg.len = 2 + len;
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index 3ab874a5deba..4837d80dc453 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -198,7 +198,6 @@ struct smiapp_sensor {
 
 	u8 hvflip_inv_mask; /* H/VFLIP inversion due to sensor orientation */
 	u8 frame_skip;
-	bool active; /* is the sensor powered on? */
 	u16 embedded_start; /* embedded data start line */
 	u16 embedded_end;
 	u16 image_start; /* image data start line */
-- 
2.20.1

