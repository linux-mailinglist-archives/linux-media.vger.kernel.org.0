Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732CF731B0A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345006AbjFOOPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344979AbjFOOP2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595CC2953
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3kKVy6yExJUUAMzCxjJ+7VlbCCW0We67UDNS8uVF6Ek=;
        b=GS6re49l7/F0d3DN6s4pJyXotKJqIfw+Wob8sOun5ZxJNuElOlrOzxCCIDI4hv8l96hUlk
        q4EZacN1t3dccxvGMQM3hBT4m87BsUQUl65Q0aouh4G/YNBWcVA+d2qYdzzqGlUZylNQ1B
        dpyxRzvojDxxH61YW3f1/M/j9GBFrK8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-l9p7U5I2O4Cz_5MOI2lLVA-1; Thu, 15 Jun 2023 10:14:30 -0400
X-MC-Unique: l9p7U5I2O4Cz_5MOI2lLVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33A72101CC70;
        Thu, 15 Jun 2023 14:14:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21043400F0B;
        Thu, 15 Jun 2023 14:14:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 12/28] media: ov2680: Add runtime-pm support
Date:   Thu, 15 Jun 2023 16:13:33 +0200
Message-Id: <20230615141349.172363-13-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the obsolete s_power() callback and instead use runtime-pm +
autosuspend, powering-on the sensor on s_stream(1) and releasing
the runtime-pm reference on s_stream(0).

This also removes the need for ov2680_mode_restore() instead
ov2680_stream_enable() now takes care of all sensor initalization
after power-on.

This is a preparation patch for adding ACPI support.

Note this also removes putting the clock lane into LP-11 state from
ov2680_power_on() since now streaming will start immediately after
powering on the sensor there is no need to put the clock lane
in a low power state.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 134 +++++++++++++++++--------------------
 1 file changed, 61 insertions(+), 73 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 0de047c49c31..56aaf67c1d82 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -99,7 +100,6 @@ struct ov2680_dev {
 	struct gpio_desc		*pwdn_gpio;
 	struct mutex			lock; /* protect members */
 
-	bool				mode_pending_changes;
 	bool				is_enabled;
 	bool				is_streaming;
 
@@ -282,19 +282,15 @@ static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
 }
 
 static int ov2680_stream_enable(struct ov2680_dev *sensor)
-{
-	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 1, NULL);
-}
-
-static int ov2680_stream_disable(struct ov2680_dev *sensor)
-{
-	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 0, NULL);
-}
-
-static int ov2680_mode_set(struct ov2680_dev *sensor)
 {
 	int ret;
 
+	ret = regmap_multi_reg_write(sensor->regmap,
+				     ov2680_mode_init_data.reg_data,
+				     ov2680_mode_init_data.reg_data_size);
+	if (ret < 0)
+		return ret;
+
 	ret = regmap_multi_reg_write(sensor->regmap,
 				     sensor->current_mode->reg_data,
 				     sensor->current_mode->reg_data_size);
@@ -306,22 +302,12 @@ static int ov2680_mode_set(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	sensor->mode_pending_changes = false;
-
-	return 0;
+	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 1, NULL);
 }
 
-static int ov2680_mode_restore(struct ov2680_dev *sensor)
+static int ov2680_stream_disable(struct ov2680_dev *sensor)
 {
-	int ret;
-
-	ret = regmap_multi_reg_write(sensor->regmap,
-				     ov2680_mode_init_data.reg_data,
-				     ov2680_mode_init_data.reg_data_size);
-	if (ret < 0)
-		return ret;
-
-	return ov2680_mode_set(sensor);
+	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 0, NULL);
 }
 
 static int ov2680_power_off(struct ov2680_dev *sensor)
@@ -369,11 +355,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 
 	sensor->is_enabled = true;
 
-	/* Set clock lane into LP-11 state */
-	ov2680_stream_enable(sensor);
-	usleep_range(1000, 2000);
-	ov2680_stream_disable(sensor);
-
 	return 0;
 
 err_disable_regulators:
@@ -381,26 +362,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 	return ret;
 }
 
-static int ov2680_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct ov2680_dev *sensor = to_ov2680_dev(sd);
-	int ret = 0;
-
-	mutex_lock(&sensor->lock);
-
-	if (on)
-		ret = ov2680_power_on(sensor);
-	else
-		ret = ov2680_power_off(sensor);
-
-	if (on && ret == 0)
-		ret = ov2680_mode_restore(sensor);
-
-	mutex_unlock(&sensor->lock);
-
-	return ret;
-}
-
 static int ov2680_s_g_frame_interval(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_frame_interval *fi)
 {
@@ -423,16 +384,20 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	if (sensor->is_streaming == !!enable)
 		goto unlock;
 
-	if (enable && sensor->mode_pending_changes) {
-		ret = ov2680_mode_set(sensor);
+	if (enable) {
+		ret = pm_runtime_resume_and_get(sensor->sd.dev);
 		if (ret < 0)
 			goto unlock;
-	}
 
-	if (enable)
 		ret = ov2680_stream_enable(sensor);
-	else
+		if (ret < 0) {
+			pm_runtime_put(sensor->sd.dev);
+			goto unlock;
+		}
+	} else {
 		ret = ov2680_stream_disable(sensor);
+		pm_runtime_put(sensor->sd.dev);
+	}
 
 	sensor->is_streaming = !!enable;
 
@@ -519,7 +484,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	sensor->current_mode = mode;
 	sensor->fmt = format->format;
-	sensor->mode_pending_changes = true;
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -603,10 +567,6 @@ static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
 	.s_ctrl = ov2680_s_ctrl,
 };
 
-static const struct v4l2_subdev_core_ops ov2680_core_ops = {
-	.s_power = ov2680_s_power,
-};
-
 static const struct v4l2_subdev_video_ops ov2680_video_ops = {
 	.g_frame_interval	= ov2680_s_g_frame_interval,
 	.s_frame_interval	= ov2680_s_g_frame_interval,
@@ -623,7 +583,6 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov2680_subdev_ops = {
-	.core	= &ov2680_core_ops,
 	.video	= &ov2680_video_ops,
 	.pad	= &ov2680_pad_ops,
 };
@@ -643,8 +602,6 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 
 	sensor->current_mode = init_mode;
 
-	sensor->mode_pending_changes = true;
-
 	return 0;
 }
 
@@ -722,8 +679,6 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 	u64 chip_id;
 	int ret;
 
-	ov2680_power_on(sensor);
-
 	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
 	if (ret < 0) {
 		dev_err(sensor->dev, "failed to read chip id\n");
@@ -811,18 +766,39 @@ static int ov2680_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
-	ret = ov2680_check_id(sensor);
+	/*
+	 * Power up and verify the chip now, so that if runtime pm is
+	 * disabled the chip is left on and streaming will work.
+	 */
+	ret = ov2680_power_on(sensor);
 	if (ret < 0)
 		goto lock_destroy;
 
+	ret = ov2680_check_id(sensor);
+	if (ret < 0)
+		goto err_powerdown;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(&client->dev);
+
 	ret = ov2680_v4l2_register(sensor);
 	if (ret < 0)
-		goto lock_destroy;
+		goto err_pm_runtime;
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	dev_info(dev, "ov2680 init correctly\n");
 
 	return 0;
 
+err_pm_runtime:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+err_powerdown:
+	ov2680_power_off(sensor);
 lock_destroy:
 	dev_err(dev, "ov2680 init fail: %d\n", ret);
 	mutex_destroy(&sensor->lock);
@@ -839,9 +815,18 @@ static void ov2680_remove(struct i2c_client *client)
 	mutex_destroy(&sensor->lock);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov2680_power_off(sensor);
+	pm_runtime_set_suspended(&client->dev);
 }
 
-static int __maybe_unused ov2680_suspend(struct device *dev)
+static int ov2680_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
@@ -849,15 +834,19 @@ static int __maybe_unused ov2680_suspend(struct device *dev)
 	if (sensor->is_streaming)
 		ov2680_stream_disable(sensor);
 
-	return 0;
+	return ov2680_power_off(sensor);
 }
 
-static int __maybe_unused ov2680_resume(struct device *dev)
+static int ov2680_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	int ret;
 
+	ret = ov2680_power_on(sensor);
+	if (ret < 0)
+		goto stream_disable;
+
 	if (sensor->is_streaming) {
 		ret = ov2680_stream_enable(sensor);
 		if (ret < 0)
@@ -873,9 +862,8 @@ static int __maybe_unused ov2680_resume(struct device *dev)
 	return ret;
 }
 
-static const struct dev_pm_ops ov2680_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov2680_suspend, ov2680_resume)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ov2680_pm_ops, ov2680_suspend, ov2680_resume,
+				 NULL);
 
 static const struct of_device_id ov2680_dt_ids[] = {
 	{ .compatible = "ovti,ov2680" },
@@ -886,7 +874,7 @@ MODULE_DEVICE_TABLE(of, ov2680_dt_ids);
 static struct i2c_driver ov2680_i2c_driver = {
 	.driver = {
 		.name  = "ov2680",
-		.pm = &ov2680_pm_ops,
+		.pm = pm_sleep_ptr(&ov2680_pm_ops),
 		.of_match_table	= of_match_ptr(ov2680_dt_ids),
 	},
 	.probe		= ov2680_probe,
-- 
2.40.1

