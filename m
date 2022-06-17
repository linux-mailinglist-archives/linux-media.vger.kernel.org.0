Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4591754F305
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 10:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381036AbiFQIdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 04:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381017AbiFQIdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 04:33:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B166169282
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 01:33:49 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D66E62A5;
        Fri, 17 Jun 2022 10:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655454827;
        bh=l39RgYrHIMjjasAEGJG57nquvMmpjtv8v1RZixj4/fo=;
        h=From:To:Cc:Subject:Date:From;
        b=S4TpqyOul6nu9PAZTO25YQ+XCP733cBs3net70gKa5TkP1DV+beanSdn4cabvIxCh
         chK+k7rmB7LcLrYqRsJZeOTP2OKaYD0yGtpSpird9L/WLFIh8shKeQAZRQBZ9CwaGw
         4pIfYdLqyexo4lqINO072S5A1xU8Ll+UOWGDyYSM=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
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
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6] media: ov5640: Use runtime PM
Date:   Fri, 17 Jun 2022 17:33:28 +0900
Message-Id: <20220617083328.3894368-1-paul.elder@ideasonboard.com>
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

Switch to using runtime PM for power management. Make it optional,
however, to support ACPI.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
Changes in v6:
- remove dependency on pm_runtime (to support ACPI)

Changes in v5:
- fix compilation warning

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
 drivers/media/i2c/ov5640.c | 123 +++++++++++++++++++++++--------------
 1 file changed, 76 insertions(+), 47 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index db5a19babe67..3626daaef9c6 100644
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
 
@@ -2155,39 +2154,24 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 	return ret;
 }
 
-/* --------------- Subdev Operations --------------- */
-
-static int ov5640_s_power(struct v4l2_subdev *sd, int on)
+static int ov5640_sensor_suspend(struct device *dev)
 {
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
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
 
-	/* Update the power count. */
-	sensor->power_count += on ? 1 : -1;
-	WARN_ON(sensor->power_count < 0);
-out:
-	mutex_unlock(&sensor->lock);
+	return ov5640_set_power(ov5640, false);
+}
 
-	if (on && !ret && sensor->power_count == 1) {
-		/* restore controls */
-		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
-	}
+static int ov5640_sensor_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
 
-	return ret;
+	return ov5640_set_power(ov5640, true);
 }
 
+/* --------------- Subdev Operations --------------- */
+
 static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 				     struct v4l2_fract *fi,
 				     u32 width, u32 height)
@@ -2663,6 +2647,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_AUTOGAIN:
 		val = ov5640_get_gain(sensor);
@@ -2678,6 +2665,8 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+
 	return 0;
 }
 
@@ -2692,9 +2681,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -2733,6 +2722,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+
 	return ret;
 }
 
@@ -2945,6 +2936,18 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -2969,13 +2972,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -3019,26 +3026,20 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
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
@@ -3154,26 +3155,43 @@ static int ov5640_probe(struct i2c_client *client)
 
 	ret = ov5640_get_regulators(sensor);
 	if (ret)
-		return ret;
+		goto entity_cleanup;
 
 	mutex_init(&sensor->lock);
 
-	ret = ov5640_check_chip_id(sensor);
+	ret = ov5640_init_controls(sensor);
 	if (ret)
 		goto entity_cleanup;
 
-	ret = ov5640_init_controls(sensor);
-	if (ret)
+	ret = ov5640_sensor_resume(dev);
+	if (ret) {
+		dev_err(dev, "failed to power on\n");
 		goto entity_cleanup;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
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
 
-free_ctrls:
+err_pm_runtime:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	ov5640_sensor_suspend(dev);
 entity_cleanup:
 	media_entity_cleanup(&sensor->sd.entity);
 	mutex_destroy(&sensor->lock);
@@ -3184,6 +3202,12 @@ static int ov5640_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	struct device *dev = &client->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		ov5640_sensor_suspend(dev);
+	pm_runtime_set_suspended(dev);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
 	media_entity_cleanup(&sensor->sd.entity);
@@ -3193,6 +3217,10 @@ static int ov5640_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct dev_pm_ops ov5640_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
+};
+
 static const struct i2c_device_id ov5640_id[] = {
 	{"ov5640", 0},
 	{},
@@ -3209,6 +3237,7 @@ static struct i2c_driver ov5640_i2c_driver = {
 	.driver = {
 		.name  = "ov5640",
 		.of_match_table	= ov5640_dt_ids,
+		.pm = &ov5640_pm_ops,
 	},
 	.id_table = ov5640_id,
 	.probe_new = ov5640_probe,
-- 
2.30.2

