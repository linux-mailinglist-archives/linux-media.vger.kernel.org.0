Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317B92A61F5
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbgKDKiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:38:02 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:51573 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729630AbgKDKiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:38:01 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1CDF2100003;
        Wed,  4 Nov 2020 10:37:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 26/30] media: ov5647: Use pm_runtime infrastructure
Date:   Wed,  4 Nov 2020 11:36:18 +0100
Message-Id: <20201104103622.595908-27-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pm_runtime framework to replace the legacy s_power() operation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 142 ++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f0c14a473f21c..4a9292237ea03 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-ctrls.h>
@@ -892,86 +893,75 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
+static int ov5647_power_on(struct device *dev)
 {
+	struct ov5647 *sensor = dev_get_drvdata(dev);
 	int ret;
-	u8 rdval;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
-	if (ret < 0)
-		return ret;
+	dev_dbg(dev, "OV5647 power on\n");
 
-	if (standby)
-		rdval &= ~0x01;
-	else
-		rdval |= 0x01;
-
-	return ov5647_write(sd, OV5647_SW_STANDBY, rdval);
-}
+	if (sensor->pwdn) {
+		gpiod_set_value_cansleep(sensor->pwdn, 0);
+		msleep(PWDN_ACTIVE_DELAY_MS);
+	}
 
-static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
-	int ret = 0;
+	ret = clk_prepare_enable(sensor->xclk);
+	if (ret < 0) {
+		dev_err(dev, "clk prepare enable failed\n");
+		goto error_pwdn;
+	}
 
-	mutex_lock(&sensor->lock);
+	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
+				 ARRAY_SIZE(sensor_oe_enable_regs));
+	if (ret < 0) {
+		dev_err(dev, "write sensor_oe_enable_regs error\n");
+		goto error_clk_disable;
+	}
 
-	if (on && !sensor->power_count)	{
-		dev_dbg(&client->dev, "OV5647 power on\n");
+	/* Stream off to coax lanes into LP-11 state. */
+	ret = ov5647_stream_off(&sensor->sd);
+	if (ret < 0) {
+		dev_err(dev, "camera not available, check power\n");
+		goto error_clk_disable;
+	}
 
-		if (sensor->pwdn) {
-			gpiod_set_value_cansleep(sensor->pwdn, 0);
-			msleep(PWDN_ACTIVE_DELAY_MS);
-		}
+	return 0;
 
-		ret = clk_prepare_enable(sensor->xclk);
-		if (ret < 0) {
-			dev_err(&client->dev, "clk prepare enable failed\n");
-			goto out;
-		}
+error_clk_disable:
+	clk_disable_unprepare(sensor->xclk);
+error_pwdn:
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
 
-		ret = ov5647_write_array(sd, sensor_oe_enable_regs,
-					 ARRAY_SIZE(sensor_oe_enable_regs));
-		if (ret < 0) {
-			clk_disable_unprepare(sensor->xclk);
-			dev_err(&client->dev,
-				"write sensor_oe_enable_regs error\n");
-			goto out;
-		}
+	return ret;
+}
 
-		/* Stream off to coax lanes into LP-11 state. */
-		ret = ov5647_stream_off(sd);
-		if (ret < 0) {
-			clk_disable_unprepare(sensor->xclk);
-			dev_err(&client->dev,
-				"Camera not available, check Power\n");
-			goto out;
-		}
-	} else if (!on && sensor->power_count == 1) {
-		dev_dbg(&client->dev, "OV5647 power off\n");
+static int ov5647_power_off(struct device *dev)
+{
+	struct ov5647 *sensor = dev_get_drvdata(dev);
+	u8 rdval;
+	int ret;
 
-		ret = ov5647_write_array(sd, sensor_oe_disable_regs,
-					 ARRAY_SIZE(sensor_oe_disable_regs));
-		if (ret < 0)
-			dev_dbg(&client->dev, "disable oe failed\n");
+	dev_dbg(dev, "OV5647 power off\n");
 
-		ret = set_sw_standby(sd, true);
-		if (ret < 0)
-			dev_dbg(&client->dev, "soft stby failed\n");
+	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
+				 ARRAY_SIZE(sensor_oe_disable_regs));
+	if (ret < 0)
+		dev_dbg(dev, "disable oe failed\n");
 
-		clk_disable_unprepare(sensor->xclk);
-		gpiod_set_value_cansleep(sensor->pwdn, 1);
-	}
+	/* Enter software standby */
+	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
+	if (ret < 0)
+		dev_dbg(dev, "software standby failed\n");
 
-	/* Update the power count. */
-	sensor->power_count += on ? 1 : -1;
-	WARN_ON(sensor->power_count < 0);
+	rdval &= ~0x01;
+	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	if (ret < 0)
+		dev_dbg(dev, "software standby failed\n");
 
-out:
-	mutex_unlock(&sensor->lock);
+	clk_disable_unprepare(sensor->xclk);
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
 
-	return ret;
+	return 0;
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
@@ -1000,7 +990,6 @@ static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 
 /* Subdev core operations registration */
 static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
-	.s_power		= ov5647_sensor_power,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	.g_register		= ov5647_sensor_get_register,
 	.s_register		= ov5647_sensor_set_register,
@@ -1551,24 +1540,29 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
-	if (sensor->pwdn) {
-		gpiod_set_value_cansleep(sensor->pwdn, 0);
-		msleep(PWDN_ACTIVE_DELAY_MS);
-	}
+	ret = ov5647_power_on(dev);
+	if (ret)
+		goto entity_cleanup;
 
 	ret = ov5647_detect(sd);
-	gpiod_set_value_cansleep(sensor->pwdn, 1);
 	if (ret < 0)
-		goto entity_cleanup;
+		goto power_off;
 
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto entity_cleanup;
+		goto power_off;
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
 
 	dev_dbg(dev, "OmniVision OV5647 camera driver probed\n");
 
 	return 0;
 
+power_off:
+	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
@@ -1588,11 +1582,16 @@ static int ov5647_remove(struct i2c_client *client)
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
+	pm_runtime_disable(&client->dev);
 	mutex_destroy(&sensor->lock);
 
 	return 0;
 }
 
+static const struct dev_pm_ops ov5647_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov5647_power_off, ov5647_power_on, NULL)
+};
+
 static const struct i2c_device_id ov5647_id[] = {
 	{ "ov5647", 0 },
 	{ /* sentinel */ }
@@ -1611,6 +1610,7 @@ static struct i2c_driver ov5647_driver = {
 	.driver = {
 		.of_match_table = of_match_ptr(ov5647_of_match),
 		.name	= "ov5647",
+		.pm	= &ov5647_pm_ops,
 	},
 	.probe_new	= ov5647_probe,
 	.remove		= ov5647_remove,
-- 
2.29.1

