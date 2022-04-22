Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E8B50B5A0
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 12:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446909AbiDVK4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 06:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446908AbiDVK4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 06:56:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25897554BA
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 03:53:48 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank114048062035.bbtec.net [114.48.62.35])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 302782F7;
        Fri, 22 Apr 2022 12:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650624825;
        bh=nY0/nEkx5vBhwqstyU4wDWd5yZcpjx9U6AW6+T1qQgE=;
        h=From:To:Cc:Subject:Date:From;
        b=n5j4EObbspqhuURTIDXaMtHocMFE9N1kkq+QlVv/YT+xK7t3k1BX177zUv/P4jJac
         egg1HlE7KT+QdlcDL0xjzLjdFwfAHehmAbI6yY0xmsEMpwuq+wedxRtQU5fUtxNteq
         XnIxbEWoa+tg+Jmpxi/abaqamTU/iXh3zv0xYQSQ=
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
Subject: [PATCH v4] media: ov5640: Use runtime PM
Date:   Fri, 22 Apr 2022 19:53:27 +0900
Message-Id: <20220422105327.1918427-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to using runtime PM for power management.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
Changes in v4:
- replace pm_runtime_put* with pm_runtime_put_autosuspend
- remove the manual initial call to ov5640_set_power()

Changes in v3:
- Move v4l2_ctrl_handler_setup() from ov5640_sensor_resume to
  ov5640_s_stream()

Changes in v2:
- replace manual tracking of power status with pm_runtime_get_if_in_use
- power on the sensor before reading the checking the chip id
- add dependency on PM to Kconfig
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5640.c | 119 ++++++++++++++++++++++---------------
 2 files changed, 71 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fae2baabb773..0bd53f8198f1 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -433,6 +433,7 @@ config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
 	depends on GPIOLIB && VIDEO_DEV && I2C
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index db5a19babe67..ff48cd16b735 100644
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
 
@@ -2692,9 +2665,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	/*
 	 * If the device is not powered up by the host driver do
 	 * not apply any controls to H/W at this time. Instead
-	 * the controls will be restored right after power-up.
+	 * the controls will be restored at start streaming time.
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
+		pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+
 	return ret;
 }
 
 static const struct v4l2_subdev_core_ops ov5640_core_ops = {
-	.s_power = ov5640_s_power,
 	.log_status = v4l2_ctrl_subdev_log_status,
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -3019,26 +3010,20 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
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
 		dev_err(&client->dev, "%s: wrong chip identifier, expected 0x5640, got 0x%x\n",
 			__func__, chip_id);
-		ret = -ENXIO;
+		return -ENXIO;
 	}
 
-power_off:
-	ov5640_set_power_off(sensor);
-	return ret;
+	return 0;
 }
 
 static int ov5640_probe(struct i2c_client *client)
@@ -3158,20 +3143,31 @@ static int ov5640_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
-	ret = ov5640_check_chip_id(sensor);
+	ret = ov5640_init_controls(sensor);
 	if (ret)
 		goto entity_cleanup;
 
-	ret = ov5640_init_controls(sensor);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get(dev);
+
+	ret = ov5640_check_chip_id(sensor);
 	if (ret)
-		goto entity_cleanup;
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
+	pm_runtime_put_autosuspend(dev);
 free_ctrls:
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 entity_cleanup:
@@ -3184,6 +3180,10 @@ static int ov5640_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	struct device *dev = &client->dev;
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
 	media_entity_cleanup(&sensor->sd.entity);
@@ -3193,6 +3193,26 @@ static int ov5640_remove(struct i2c_client *client)
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
@@ -3209,6 +3229,7 @@ static struct i2c_driver ov5640_i2c_driver = {
 	.driver = {
 		.name  = "ov5640",
 		.of_match_table	= ov5640_dt_ids,
+		.pm = &ov5640_pm_ops,
 	},
 	.id_table = ov5640_id,
 	.probe_new = ov5640_probe,
-- 
2.30.2

