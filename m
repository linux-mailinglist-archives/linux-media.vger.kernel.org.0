Return-Path: <linux-media+bounces-39646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD9B23B04
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DBA5585FB4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9B52E093A;
	Tue, 12 Aug 2025 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fDR1qu7B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9AD2D739D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035220; cv=none; b=TZSSPfT8ugE16lTlG/TQiXC6XIIk2hwt7ltelCwW+mlq6XXbBeLBCp0TauaUaNVE+pgFL3JJqPTGybwZMJW81eEtON+tr6WKcbWgFCHGdMoIyL7FdHl9BN0li/9WBrsSgHnzWb6Pecjq+4noQx0/MX3xl47Znev0mJQlGpL/1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035220; c=relaxed/simple;
	bh=jyZ1tQHnWkNkVUp6c2PDxnFUTN50sQdaMi3rWoS/bY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q212nL2ZRizWyXUrr6WhEEocFyL6x5SS2ZEV3DgymqDCEUyguxjAwrGjVU/zk10hGHe3O2DSvTSTcRASmk0MMfMklLU0lQ3V4T6N4/jptG02Knv1hltp7UlTjF5COl6TTRIuE4OgRH5okcW+vTAlnHVM3euqDVfPBIsQeh7B008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fDR1qu7B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A129D1738;
	Tue, 12 Aug 2025 23:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035162;
	bh=jyZ1tQHnWkNkVUp6c2PDxnFUTN50sQdaMi3rWoS/bY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDR1qu7BMXZXn8GCwo2PPLe0wDP7s/yJSENCCoAvdT2HieUohcKktugUU3L5b5ped
	 3GxKosRiSOBJexzsTDmjiMsxlo2oLkofDzYdIoGahSi+0nQ8ZXNUYP1Pv8YeeQK7tx
	 zZyzJZXiT/ahsQqfeAXLhNplRMX4lFNrjALFWuok=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 10/72] media: i2c: hi556: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:18 +0300
Message-ID: <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver needs to access the struct device in many places, and
retrieves it from the i2c_client itself retrieved with
v4l2_get_subdevdata(). Store it as a pointer in struct hi556 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/hi556.c | 72 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 076c19fcf99c..cd7c3e4fd39c 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -10,6 +9,8 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -631,6 +632,8 @@ static const char * const hi556_supply_names[] = {
 };
 
 struct hi556 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -715,7 +718,6 @@ static int hi556_write_reg(struct hi556 *hi556, u16 reg, u16 len, u32 val)
 static int hi556_write_reg_list(struct hi556 *hi556,
 				const struct hi556_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
 	unsigned int i;
 	int ret;
 
@@ -724,7 +726,7 @@ static int hi556_write_reg_list(struct hi556 *hi556,
 				      HI556_REG_VALUE_16BIT,
 				      r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(hi556->dev,
 					    "failed to write reg 0x%4.4x. error = %d\n",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -785,7 +787,6 @@ static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct hi556 *hi556 = container_of(ctrl->handler,
 					     struct hi556, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -801,7 +802,7 @@ static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(hi556->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -835,7 +836,7 @@ static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(hi556->dev);
 
 	return ret;
 }
@@ -921,7 +922,6 @@ static void hi556_assign_pad_format(const struct hi556_mode *mode,
 
 static int hi556_identify_module(struct hi556 *hi556)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
 	int ret;
 	u32 val;
 
@@ -934,7 +934,7 @@ static int hi556_identify_module(struct hi556 *hi556)
 		return ret;
 
 	if (val != HI556_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(hi556->dev, "chip id mismatch: %x!=%x\n",
 			HI556_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -998,7 +998,6 @@ static int hi556_get_selection(struct v4l2_subdev *sd,
 
 static int hi556_start_streaming(struct hi556 *hi556)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
 	const struct hi556_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -1010,14 +1009,14 @@ static int hi556_start_streaming(struct hi556 *hi556)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = hi556_write_reg_list(hi556, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls\n");
+		dev_err(hi556->dev, "failed to set plls\n");
 		return ret;
 	}
 
 	reg_list = &hi556->cur_mode->reg_list;
 	ret = hi556_write_reg_list(hi556, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(hi556->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -1029,7 +1028,7 @@ static int hi556_start_streaming(struct hi556 *hi556)
 			      HI556_REG_VALUE_16BIT, HI556_MODE_STREAMING);
 
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream\n");
+		dev_err(hi556->dev, "failed to set stream\n");
 		return ret;
 	}
 
@@ -1038,22 +1037,19 @@ static int hi556_start_streaming(struct hi556 *hi556)
 
 static void hi556_stop_streaming(struct hi556 *hi556)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
-
 	if (hi556_write_reg(hi556, HI556_REG_MODE_SELECT,
 			    HI556_REG_VALUE_16BIT, HI556_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream\n");
+		dev_err(hi556->dev, "failed to set stream\n");
 }
 
 static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct hi556 *hi556 = to_hi556(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&hi556->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(hi556->dev);
 		if (ret < 0) {
 			mutex_unlock(&hi556->mutex);
 			return ret;
@@ -1062,11 +1058,11 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 		ret = hi556_start_streaming(hi556);
 		if (ret) {
 			hi556_stop_streaming(hi556);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(hi556->dev);
 		}
 	} else {
 		hi556_stop_streaming(hi556);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(hi556->dev);
 	}
 
 	mutex_unlock(&hi556->mutex);
@@ -1289,7 +1285,7 @@ static void hi556_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(hi556->dev);
 	mutex_destroy(&hi556->mutex);
 }
 
@@ -1347,40 +1343,42 @@ static int hi556_probe(struct i2c_client *client)
 	if (!hi556)
 		return -ENOMEM;
 
+	hi556->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&hi556->sd, client, &hi556_subdev_ops);
 
-	hi556->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+	hi556->reset_gpio = devm_gpiod_get_optional(hi556->dev, "reset",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hi556->reset_gpio))
-		return dev_err_probe(&client->dev, PTR_ERR(hi556->reset_gpio),
+		return dev_err_probe(hi556->dev, PTR_ERR(hi556->reset_gpio),
 				     "failed to get reset GPIO\n");
 
-	hi556->clk = devm_clk_get_optional(&client->dev, "clk");
+	hi556->clk = devm_clk_get_optional(hi556->dev, "clk");
 	if (IS_ERR(hi556->clk))
-		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
+		return dev_err_probe(hi556->dev, PTR_ERR(hi556->clk),
 				     "failed to get clock\n");
 
 	for (i = 0; i < ARRAY_SIZE(hi556_supply_names); i++)
 		hi556->supplies[i].supply = hi556_supply_names[i];
 
-	ret = devm_regulator_bulk_get(&client->dev,
+	ret = devm_regulator_bulk_get(hi556->dev,
 				      ARRAY_SIZE(hi556_supply_names),
 				      hi556->supplies);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(hi556->dev, ret,
 				     "failed to get regulators\n");
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(hi556->dev);
 	if (full_power) {
 		/* Ensure non ACPI managed resources are enabled */
-		ret = hi556_resume(&client->dev);
+		ret = hi556_resume(hi556->dev);
 		if (ret)
-			return dev_err_probe(&client->dev, ret,
+			return dev_err_probe(hi556->dev, ret,
 					     "failed to power on sensor\n");
 
 		ret = hi556_identify_module(hi556);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+			dev_err(hi556->dev, "failed to find sensor: %d\n", ret);
 			goto probe_error_power_off;
 		}
 	}
@@ -1389,7 +1387,7 @@ static int hi556_probe(struct i2c_client *client)
 	hi556->cur_mode = &supported_modes[0];
 	ret = hi556_init_controls(hi556);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d\n", ret);
+		dev_err(hi556->dev, "failed to init controls: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1400,22 +1398,22 @@ static int hi556_probe(struct i2c_client *client)
 	hi556->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&hi556->sd.entity, 1, &hi556->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
+		dev_err(hi556->dev, "failed to init entity pads: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&hi556->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d\n",
+		dev_err(hi556->dev, "failed to register V4L2 subdev: %d\n",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(hi556->dev);
+	pm_runtime_enable(hi556->dev);
+	pm_runtime_idle(hi556->dev);
 
 	return 0;
 
@@ -1428,7 +1426,7 @@ static int hi556_probe(struct i2c_client *client)
 
 probe_error_power_off:
 	if (full_power)
-		hi556_suspend(&client->dev);
+		hi556_suspend(hi556->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


