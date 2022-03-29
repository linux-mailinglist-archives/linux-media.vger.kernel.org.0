Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9C4EA8D8
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 09:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbiC2H7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 03:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbiC2H7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 03:59:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8315723B3F3
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:57:57 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-148.catv02.itscom.jp [175.177.42.148])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 343232F7;
        Tue, 29 Mar 2022 09:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648540673;
        bh=MVcUoDdqBSYzHFxoA0yobPv4Xm6RbYWJ/pNzG6XjWNI=;
        h=From:To:Cc:Subject:Date:From;
        b=YYbIIMp2Cz0NtXBMWbqtOTJ5sWEpmsc/+BofwyB8aSTMZ8o9gpEdZrfkQHeZKV+D/
         9v1R9OJimfIhrEh4Di3tToMnNHz0G7XHVCUmsBAI5R+GF6CuIjAkEJ8tIHcmZVAFeX
         ifCirRwjSn1khl8jj0NN6NKkHJCZdSsPjD1po7fE=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3] media: ov5640: Use runtime PM
Date:   Tue, 29 Mar 2022 16:57:37 +0900
Message-Id: <20220329075737.3051924-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to using runtime PM for power management.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes in v3:
- Move v4l2_ctrl_handler_setup() from ov5640_sensor_resume to
  ov5640_s_stream()

Changes in v2:
- replace manual tracking of power status with pm_runtime_get_if_in_use
- power on the sensor before reading the checking the chip id
- add dependency on PM to Kconfig
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5640.c | 117 ++++++++++++++++++++++---------------
 2 files changed, 72 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 69c56e24a612..8a038337c679 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -976,6 +976,7 @@ config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
 	depends on GPIOLIB && VIDEO_V4L2 && I2C
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ddbd71394db3..fe2aacc74cbb 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -240,8 +241,6 @@ struct ov5640_dev {
 	/* lock to protect all members below */
 	struct mutex lock;
 
-	int power_count;
-
 	struct v4l2_mbus_framefmt fmt;
 	bool pending_fmt_change;
 
@@ -2157,37 +2156,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 
 /* --------------- Subdev Operations --------------- */
 
-static int ov5640_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct ov5640_dev *sensor = to_ov5640_dev(sd);
-	int ret = 0;
-
-	mutex_lock(&sensor->lock);
-
-	/*
-	 * If the power count is modified from 0 to != 0 or from != 0 to 0,
-	 * update the power state.
-	 */
-	if (sensor->power_count == !on) {
-		ret = ov5640_set_power(sensor, !!on);
-		if (ret)
-			goto out;
-	}
-
-	/* Update the power count. */
-	sensor->power_count += on ? 1 : -1;
-	WARN_ON(sensor->power_count < 0);
-out:
-	mutex_unlock(&sensor->lock);
-
-	if (on && !ret && sensor->power_count == 1) {
-		/* restore controls */
-		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
-	}
-
-	return ret;
-}
-
 static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 				     struct v4l2_fract *fi,
 				     u32 width, u32 height)
@@ -2663,6 +2631,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_AUTOGAIN:
 		val = ov5640_get_gain(sensor);
@@ -2678,6 +2649,8 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+
 	return 0;
 }
 
@@ -2694,7 +2667,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	 * not apply any controls to H/W at this time. Instead
 	 * the controls will be restored right after power-up.
 	 */
-	if (sensor->power_count == 0)
+	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -2733,6 +2706,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+
 	return ret;
 }
 
@@ -2945,6 +2920,18 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	int ret = 0;
 
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
+		if (ret < 0)
+			return ret;
+
+		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+		if (ret) {
+			pm_runtime_put(&sensor->i2c_client->dev);
+			return ret;
+		}
+	}
+
 	mutex_lock(&sensor->lock);
 
 	if (sensor->streaming == !enable) {
@@ -2969,13 +2956,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 		if (!ret)
 			sensor->streaming = enable;
 	}
+
 out:
 	mutex_unlock(&sensor->lock);
+
+	if (!enable || ret)
+		pm_runtime_put(&sensor->i2c_client->dev);
+
 	return ret;
 }
 
 static const struct v4l2_subdev_core_ops ov5640_core_ops = {
-	.s_power = ov5640_s_power,
 	.log_status = v4l2_ctrl_subdev_log_status,
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -3019,15 +3010,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 	int ret = 0;
 	u16 chip_id;
 
-	ret = ov5640_set_power_on(sensor);
-	if (ret)
-		return ret;
-
 	ret = ov5640_read_reg16(sensor, OV5640_REG_CHIP_ID, &chip_id);
 	if (ret) {
 		dev_err(&client->dev, "%s: failed to read chip identifier\n",
 			__func__);
-		goto power_off;
+		return ret;
 	}
 
 	if (chip_id != 0x5640) {
@@ -3036,8 +3023,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 		ret = -ENXIO;
 	}
 
-power_off:
-	ov5640_set_power_off(sensor);
 	return ret;
 }
 
@@ -3158,20 +3143,35 @@ static int ov5640_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
-	ret = ov5640_check_chip_id(sensor);
+	ret = ov5640_init_controls(sensor);
 	if (ret)
 		goto entity_cleanup;
 
-	ret = ov5640_init_controls(sensor);
+	ret = ov5640_set_power(sensor, true);
 	if (ret)
-		goto entity_cleanup;
+		goto free_ctrls;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get(dev);
+
+	ret = ov5640_check_chip_id(sensor);
+	if (ret)
+		goto err_pm_runtime;
 
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret)
-		goto free_ctrls;
+		goto err_pm_runtime;
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
+err_pm_runtime:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 free_ctrls:
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 entity_cleanup:
@@ -3184,6 +3184,10 @@ static int ov5640_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	struct device *dev = &client->dev;
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
 	media_entity_cleanup(&sensor->sd.entity);
@@ -3193,6 +3197,26 @@ static int ov5640_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int __maybe_unused ov5640_sensor_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
+
+	return ov5640_set_power(ov5640, false);
+}
+
+static int __maybe_unused ov5640_sensor_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
+
+	return ov5640_set_power(ov5640, true);
+}
+
+static const struct dev_pm_ops ov5640_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
+};
+
 static const struct i2c_device_id ov5640_id[] = {
 	{"ov5640", 0},
 	{},
@@ -3209,6 +3233,7 @@ static struct i2c_driver ov5640_i2c_driver = {
 	.driver = {
 		.name  = "ov5640",
 		.of_match_table	= ov5640_dt_ids,
+		.pm = &ov5640_pm_ops,
 	},
 	.id_table = ov5640_id,
 	.probe_new = ov5640_probe,
-- 
2.30.2

