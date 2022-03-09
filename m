Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A27F94D2E15
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 12:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiCILd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 06:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiCILdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 06:33:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB0786E22
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 03:32:54 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-042-148.catv02.itscom.jp [175.177.42.148])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10CAC488;
        Wed,  9 Mar 2022 12:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646825571;
        bh=BBT+bvecDjnffM1jxvhFYJuPoeXYSCHV5XZbYfv5SAY=;
        h=From:To:Cc:Subject:Date:From;
        b=awKI6LoNEdyjnSgzKCh3f585Xq1AhJQJE5o0abRkJ6zq3WhyYat5eAQtBM+jzdev5
         xWFOfmOhVoeXXIIQnECfQCQI2V5e7alqQpPSxMaDcGqMhnYil+nOPqcElV3eEtybJt
         YYng1vNcuv03BWFT/qcqLMtSkkxcRKfQ6vIKWhsY=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: ov5640: Use runtime PM
Date:   Wed,  9 Mar 2022 20:32:32 +0900
Message-Id: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
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
 drivers/media/i2c/ov5640.c | 108 ++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ddbd71394db3..8e95096ba67b 100644
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
@@ -240,7 +241,7 @@ struct ov5640_dev {
 	/* lock to protect all members below */
 	struct mutex lock;
 
-	int power_count;
+	bool powered;
 
 	struct v4l2_mbus_framefmt fmt;
 	bool pending_fmt_change;
@@ -2148,6 +2149,8 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 	if (!on)
 		ov5640_set_power_off(sensor);
 
+	sensor->powered = on;
+
 	return 0;
 
 power_off:
@@ -2157,37 +2160,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 
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
@@ -2663,6 +2635,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	if (!sensor->powered)
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_AUTOGAIN:
 		val = ov5640_get_gain(sensor);
@@ -2694,7 +2669,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	 * not apply any controls to H/W at this time. Instead
 	 * the controls will be restored right after power-up.
 	 */
-	if (sensor->power_count == 0)
+	if (!sensor->powered)
 		return 0;
 
 	switch (ctrl->id) {
@@ -2945,6 +2920,12 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	int ret = 0;
 
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
+		if (ret < 0)
+			return ret;
+	}
+
 	mutex_lock(&sensor->lock);
 
 	if (sensor->streaming == !enable) {
@@ -2969,13 +2950,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -3019,15 +3004,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
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
@@ -3036,8 +3017,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
 		ret = -ENXIO;
 	}
 
-power_off:
-	ov5640_set_power_off(sensor);
 	return ret;
 }
 
@@ -3158,20 +3137,35 @@ static int ov5640_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
-	ret = ov5640_check_chip_id(sensor);
+	ret = ov5640_init_controls(sensor);
 	if (ret)
 		goto entity_cleanup;
 
-	ret = ov5640_init_controls(sensor);
+	ret = ov5640_set_power(sensor, true);
+	if (ret)
+		goto free_ctrls;
+
+	ret = ov5640_check_chip_id(sensor);
 	if (ret)
 		goto entity_cleanup;
 
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+
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
@@ -3193,6 +3187,31 @@ static int ov5640_remove(struct i2c_client *client)
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
+	int ret;
+
+	ret = ov5640_set_power(ov5640, true);
+	if (ret)
+		return ret;
+
+	return v4l2_ctrl_handler_setup(&ov5640->ctrls.handler);
+}
+
+static const struct dev_pm_ops ov5640_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
+};
+
 static const struct i2c_device_id ov5640_id[] = {
 	{"ov5640", 0},
 	{},
@@ -3209,6 +3228,7 @@ static struct i2c_driver ov5640_i2c_driver = {
 	.driver = {
 		.name  = "ov5640",
 		.of_match_table	= ov5640_dt_ids,
+		.pm = &ov5640_pm_ops,
 	},
 	.id_table = ov5640_id,
 	.probe_new = ov5640_probe,
-- 
2.30.2

