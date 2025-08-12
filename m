Return-Path: <linux-media+bounces-39673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B44B23B1E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF6B587E11
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26302DA75B;
	Tue, 12 Aug 2025 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X79Qlwya"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8342E0B6D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035264; cv=none; b=OaLQeDlpHIBCO+rlfUQkeZAeDyg2DFIekSmNwVAg0MpMazLB58QvtBkt1zZK0EPqd8RKWcpWJYWuTqeeTo1IwUgoq8Cf1Jnrf9JFi3b0JijtICLJCbHoP6mUztXaX71hLCMhRYN51P1Z7EAxkIR6RioISTimBEGpbazbhUSAGds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035264; c=relaxed/simple;
	bh=NXfQJQMG/6SPeve37J/vW6dCwXpVNzkGDAbGLjX9aIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MA8wY2N42uymRZQd1PN5iPdMEfeGULu0M/4dLZY/6DN4JT7Pn9eOwyCQUHfNhGHXDEWSBMnvXFqAMJw/Jf5/DxGm4O8bIq94v0WHz12GxMS8wJxi6d9jAzG8IcHWeP0P9ZgORGxdDWOMFjVkuytmErq4WLQ5Mnq+PdYuG+euhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X79Qlwya; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0DB634A4;
	Tue, 12 Aug 2025 23:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035208;
	bh=NXfQJQMG/6SPeve37J/vW6dCwXpVNzkGDAbGLjX9aIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X79QlwyaQVHu4e3QLr2bfKVSs7k35/O306iTHt8tfvVAwqPJ5bzBmh78BZXPHcdDE
	 lxfLafsbT2ttO2vuEqfCtdb1dEqOgiTd0/ZIDdydrH0sXqNSTyABdCPyUGZpjzLq6J
	 tS+N4ngJQk0Duj3891zgRuXsxP+QWFTj1v2CCpmA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 37/72] media: i2c: ov5670: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:45 +0300
Message-ID: <20250812214620.30425-38-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov5670 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 99 ++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 52 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index b9efb2d2276a..f4af89bda902 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -12,6 +11,8 @@
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -1854,6 +1855,8 @@ static const struct ov5670_mode supported_modes[] = {
 };
 
 struct ov5670 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint endpoint;
@@ -1959,7 +1962,6 @@ static int ov5670_write_reg(struct ov5670 *ov5670, u16 reg, unsigned int len,
 static int ov5670_write_regs(struct ov5670 *ov5670,
 			     const struct ov5670_reg *regs, unsigned int len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	unsigned int i;
 	int ret;
 
@@ -1967,7 +1969,7 @@ static int ov5670_write_regs(struct ov5670 *ov5670,
 		ret = ov5670_write_reg(ov5670, regs[i].address, 1, regs[i].val);
 		if (ret) {
 			dev_err_ratelimited(
-				&client->dev,
+				ov5670->dev,
 				"Failed to write reg 0x%4.4x. error = %d\n",
 				regs[i].address, ret);
 
@@ -2032,7 +2034,6 @@ static int ov5670_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5670 *ov5670 = container_of(ctrl->handler,
 					     struct ov5670, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	s64 max;
 	int ret;
 
@@ -2048,7 +2049,7 @@ static int ov5670_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov5670->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -2080,12 +2081,12 @@ static int ov5670_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		ret = -EINVAL;
-		dev_info(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
+		dev_info(ov5670->dev, "%s Unhandled id:0x%x, val:0x%x\n",
 			 __func__, ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov5670->dev);
 
 	return ret;
 }
@@ -2099,7 +2100,6 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 {
 	struct v4l2_mbus_config_mipi_csi2 *bus_mipi_csi2 =
 		&ov5670->endpoint.bus.mipi_csi2;
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	unsigned int lanes_count;
@@ -2177,7 +2177,7 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov5670->dev, &props);
 	if (ret)
 		goto error;
 
@@ -2350,7 +2350,6 @@ static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 /* Verify chip ID */
 static int ov5670_identify_module(struct ov5670 *ov5670)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	int ret;
 	u32 val;
 
@@ -2363,7 +2362,7 @@ static int ov5670_identify_module(struct ov5670 *ov5670)
 		return ret;
 
 	if (val != OV5670_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(ov5670->dev, "chip id mismatch: %x!=%x\n",
 			OV5670_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -2389,7 +2388,6 @@ static int ov5670_mipi_configure(struct ov5670 *ov5670)
 /* Prepare streaming by writing default values and customized values */
 static int ov5670_start_streaming(struct ov5670 *ov5670)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	const struct ov5670_reg_list *reg_list;
 	int link_freq_index;
 	int ret;
@@ -2402,7 +2400,7 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	ret = ov5670_write_reg(ov5670, OV5670_REG_SOFTWARE_RST,
 			       OV5670_REG_VALUE_08BIT, OV5670_SOFTWARE_RST);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set powerup registers\n",
+		dev_err(ov5670->dev, "%s failed to set powerup registers\n",
 			__func__);
 		return ret;
 	}
@@ -2412,7 +2410,7 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov5670_write_reg_list(ov5670, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(ov5670->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
@@ -2420,13 +2418,13 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	reg_list = &ov5670->cur_mode->reg_list;
 	ret = ov5670_write_reg_list(ov5670, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(ov5670->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
 	ret = ov5670_mipi_configure(ov5670);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to configure MIPI\n", __func__);
+		dev_err(ov5670->dev, "%s failed to configure MIPI\n", __func__);
 		return ret;
 	}
 
@@ -2438,7 +2436,7 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 	ret = ov5670_write_reg(ov5670, OV5670_REG_MODE_SELECT,
 			       OV5670_REG_VALUE_08BIT, OV5670_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+		dev_err(ov5670->dev, "%s failed to set stream\n", __func__);
 		return ret;
 	}
 
@@ -2447,13 +2445,12 @@ static int ov5670_start_streaming(struct ov5670 *ov5670)
 
 static int ov5670_stop_streaming(struct ov5670 *ov5670)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	int ret;
 
 	ret = ov5670_write_reg(ov5670, OV5670_REG_MODE_SELECT,
 			       OV5670_REG_VALUE_08BIT, OV5670_MODE_STANDBY);
 	if (ret)
-		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+		dev_err(ov5670->dev, "%s failed to set stream\n", __func__);
 
 	/* Return success even if it was an error, as there is nothing the
 	 * caller can do about it.
@@ -2464,13 +2461,12 @@ static int ov5670_stop_streaming(struct ov5670 *ov5670)
 static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov5670 *ov5670 = to_ov5670(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov5670->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov5670->dev);
 		if (ret < 0)
 			goto unlock_and_return;
 
@@ -2479,12 +2475,12 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 			goto error;
 	} else {
 		ret = ov5670_stop_streaming(ov5670);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov5670->dev);
 	}
 	goto unlock_and_return;
 
 error:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov5670->dev);
 
 unlock_and_return:
 	mutex_unlock(&ov5670->mutex);
@@ -2621,26 +2617,23 @@ static const struct media_entity_operations ov5670_subdev_entity_ops = {
 
 static int ov5670_regulators_probe(struct ov5670 *ov5670)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	unsigned int i;
 
 	for (i = 0; i < OV5670_NUM_SUPPLIES; i++)
 		ov5670->supplies[i].supply = ov5670_supply_names[i];
 
-	return devm_regulator_bulk_get(&client->dev, OV5670_NUM_SUPPLIES,
+	return devm_regulator_bulk_get(ov5670->dev, OV5670_NUM_SUPPLIES,
 				       ov5670->supplies);
 }
 
 static int ov5670_gpio_probe(struct ov5670 *ov5670)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
-
-	ov5670->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+	ov5670->pwdn_gpio = devm_gpiod_get_optional(ov5670->dev, "powerdown",
 						    GPIOD_OUT_LOW);
 	if (IS_ERR(ov5670->pwdn_gpio))
 		return PTR_ERR(ov5670->pwdn_gpio);
 
-	ov5670->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+	ov5670->reset_gpio = devm_gpiod_get_optional(ov5670->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov5670->reset_gpio))
 		return PTR_ERR(ov5670->reset_gpio);
@@ -2660,18 +2653,20 @@ static int ov5670_probe(struct i2c_client *client)
 	if (!ov5670)
 		return -ENOMEM;
 
-	ov5670->xvclk = devm_clk_get_optional(&client->dev, NULL);
+	ov5670->dev = &client->dev;
+
+	ov5670->xvclk = devm_clk_get_optional(ov5670->dev, NULL);
 	if (!IS_ERR_OR_NULL(ov5670->xvclk))
 		input_clk = clk_get_rate(ov5670->xvclk);
 	else if (!ov5670->xvclk || PTR_ERR(ov5670->xvclk) == -ENOENT)
-		device_property_read_u32(&client->dev, "clock-frequency",
+		device_property_read_u32(ov5670->dev, "clock-frequency",
 					 &input_clk);
 	else
-		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
+		return dev_err_probe(ov5670->dev, PTR_ERR(ov5670->xvclk),
 				     "error getting clock\n");
 
 	if (input_clk != OV5670_XVCLK_FREQ) {
-		dev_err(&client->dev,
+		dev_err(ov5670->dev,
 			"Unsupported clock frequency %u\n", input_clk);
 		return -EINVAL;
 	}
@@ -2682,20 +2677,20 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ret = ov5670_regulators_probe(ov5670);
 	if (ret)
-		return dev_err_probe(&client->dev, ret, "Regulators probe failed\n");
+		return dev_err_probe(ov5670->dev, ret, "Regulators probe failed\n");
 
 	ret = ov5670_gpio_probe(ov5670);
 	if (ret)
-		return dev_err_probe(&client->dev, ret, "GPIO probe failed\n");
+		return dev_err_probe(ov5670->dev, ret, "GPIO probe failed\n");
 
 	/*
 	 * Graph Endpoint. If it's missing we defer rather than fail, as this
 	 * sensor is known to co-exist on systems with the IPU3 and so it might
 	 * be created by the ipu-bridge.
 	 */
-	handle = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	handle = fwnode_graph_get_next_endpoint(dev_fwnode(ov5670->dev), NULL);
 	if (!handle)
-		return dev_err_probe(&client->dev, -EPROBE_DEFER,
+		return dev_err_probe(ov5670->dev, -EPROBE_DEFER,
 				     "Endpoint for node get failed\n");
 
 	ov5670->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
@@ -2704,20 +2699,20 @@ static int ov5670_probe(struct i2c_client *client)
 	ret = v4l2_fwnode_endpoint_alloc_parse(handle, &ov5670->endpoint);
 	fwnode_handle_put(handle);
 	if (ret)
-		return dev_err_probe(&client->dev, ret, "Endpoint parse failed\n");
+		return dev_err_probe(ov5670->dev, ret, "Endpoint parse failed\n");
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov5670->dev);
 	if (full_power) {
-		ret = ov5670_runtime_resume(&client->dev);
+		ret = ov5670_runtime_resume(ov5670->dev);
 		if (ret) {
-			dev_err_probe(&client->dev, ret, "Power up failed\n");
+			dev_err_probe(ov5670->dev, ret, "Power up failed\n");
 			goto error_endpoint;
 		}
 
 		/* Check module identity */
 		ret = ov5670_identify_module(ov5670);
 		if (ret) {
-			dev_err_probe(&client->dev, ret, "ov5670_identify_module() error\n");
+			dev_err_probe(ov5670->dev, ret, "ov5670_identify_module() error\n");
 			goto error_power_off;
 		}
 	}
@@ -2729,7 +2724,7 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ret = ov5670_init_controls(ov5670);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "ov5670_init_controls() error\n");
+		dev_err_probe(ov5670->dev, ret, "ov5670_init_controls() error\n");
 		goto error_mutex_destroy;
 	}
 
@@ -2742,28 +2737,28 @@ static int ov5670_probe(struct i2c_client *client)
 	ov5670->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov5670->sd.entity, 1, &ov5670->pad);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "media_entity_pads_init() error\n");
+		dev_err_probe(ov5670->dev, ret, "media_entity_pads_init() error\n");
 		goto error_handler_free;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
+		pm_runtime_set_active(ov5670->dev);
+	pm_runtime_enable(ov5670->dev);
 
 	/* Async register for subdev */
 	ret = v4l2_async_register_subdev_sensor(&ov5670->sd);
 	if (ret < 0) {
-		dev_err_probe(&client->dev, ret, "v4l2_async_register_subdev() error\n");
+		dev_err_probe(ov5670->dev, ret, "v4l2_async_register_subdev() error\n");
 		goto error_pm_disable;
 	}
 
-	pm_runtime_idle(&client->dev);
+	pm_runtime_idle(ov5670->dev);
 
 	return 0;
 
 error_pm_disable:
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov5670->dev);
 
 	media_entity_cleanup(&ov5670->sd.entity);
 
@@ -2775,7 +2770,7 @@ static int ov5670_probe(struct i2c_client *client)
 
 error_power_off:
 	if (full_power)
-		ov5670_runtime_suspend(&client->dev);
+		ov5670_runtime_suspend(ov5670->dev);
 
 error_endpoint:
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
@@ -2793,8 +2788,8 @@ static void ov5670_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	mutex_destroy(&ov5670->mutex);
 
-	pm_runtime_disable(&client->dev);
-	ov5670_runtime_suspend(&client->dev);
+	pm_runtime_disable(ov5670->dev);
+	ov5670_runtime_suspend(ov5670->dev);
 
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
 }
-- 
Regards,

Laurent Pinchart


