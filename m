Return-Path: <linux-media+bounces-37373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745AB00A8D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59778760A05
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73482F1FE4;
	Thu, 10 Jul 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rtoreAxG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DBE2F364E
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169771; cv=none; b=ssogosILlCZGFu4C63qUegEp9iYR0sVD7u89l0M3xbQwrheiL5WWsIgXu5WiNJESTrDK/Ds5/HjHYy2kNczbEYH8Q68r205fJ1z0pIadnASlW2Kklfaq6Qe8WPdVyBzdXykb1EQS4YLgrTsNydI8TIVr6iSR6HdzQKd2S8S7O1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169771; c=relaxed/simple;
	bh=Bjm55WT3TNSHq0+cDma5SPgQ7QjpphiumzYttateBPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUJcQiHjx39586+uPc8b3M/uId2V9hjVH5YQMJrmPjVHL5Vzab6iZY8ob0pqr+D617sDLukAeNb8SHNcnOfgOJrkq0KGIYxph0iPqKqCqS47qGesRLtn9S+UbxV69hrFeZ5zbDiMNuXDhH4XHN/q1sd7rsyO5brQfnFZMnWIKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rtoreAxG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 70B11111D;
	Thu, 10 Jul 2025 19:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169738;
	bh=Bjm55WT3TNSHq0+cDma5SPgQ7QjpphiumzYttateBPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rtoreAxGFF2D/0fHQQfhdEVoBba3tQjoQ+3zBG3UovXrPnDUmZxicQI4KE6IQastl
	 RbHGYPyyBjOIbbeVW/pPC2kgydK7suJFRwimu47u7WGdH2Qdz2WXhEs40P8UEJqSN2
	 IWDG/Qmz+hwSsE3o3upJlHHjlPmqYbmYKlHKPXpg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 30/72] media: i2c: og01a1b: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:26 +0300
Message-ID: <20250710174808.5361-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver needs to access the struct device in many places, and
retrieves it from the i2c_client itself retrieved with
v4l2_get_subdevdata(). Store it as a pointer in struct og01a1b and
access it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/og01a1b.c | 80 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 78d5d406e4b7..59688bad7c98 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022 Intel Corporation.
 
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
@@ -421,6 +422,7 @@ static const struct og01a1b_mode supported_modes[] = {
 };
 
 struct og01a1b {
+	struct device *dev;
 	struct clk *xvclk;
 	struct gpio_desc *reset_gpio;
 	struct regulator *avdd;
@@ -512,7 +514,6 @@ static int og01a1b_write_reg(struct og01a1b *og01a1b, u16 reg, u16 len, u32 val)
 static int og01a1b_write_reg_list(struct og01a1b *og01a1b,
 				  const struct og01a1b_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 	unsigned int i;
 	int ret;
 
@@ -520,7 +521,7 @@ static int og01a1b_write_reg_list(struct og01a1b *og01a1b,
 		ret = og01a1b_write_reg(og01a1b, r_list->regs[i].address, 1,
 					r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(og01a1b->dev,
 					    "failed to write reg 0x%4.4x. error = %d",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -544,7 +545,6 @@ static int og01a1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og01a1b *og01a1b = container_of(ctrl->handler,
 					       struct og01a1b, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -560,7 +560,7 @@ static int og01a1b_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(og01a1b->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -596,7 +596,7 @@ static int og01a1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(og01a1b->dev);
 
 	return ret;
 }
@@ -688,7 +688,6 @@ static void og01a1b_update_pad_format(const struct og01a1b_mode *mode,
 
 static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 	const struct og01a1b_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -697,14 +696,14 @@ static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 
 	ret = og01a1b_write_reg_list(og01a1b, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(og01a1b->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &og01a1b->cur_mode->reg_list;
 	ret = og01a1b_write_reg_list(og01a1b, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(og01a1b->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -716,7 +715,7 @@ static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 				OG01A1B_REG_VALUE_08BIT,
 				OG01A1B_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(og01a1b->dev, "failed to set stream");
 		return ret;
 	}
 
@@ -725,22 +724,19 @@ static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 
 static void og01a1b_stop_streaming(struct og01a1b *og01a1b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
-
 	if (og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
 			      OG01A1B_REG_VALUE_08BIT, OG01A1B_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(og01a1b->dev, "failed to set stream");
 }
 
 static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct og01a1b *og01a1b = to_og01a1b(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&og01a1b->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(og01a1b->dev);
 		if (ret) {
 			mutex_unlock(&og01a1b->mutex);
 			return ret;
@@ -750,11 +746,11 @@ static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			og01a1b_stop_streaming(og01a1b);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(og01a1b->dev);
 		}
 	} else {
 		og01a1b_stop_streaming(og01a1b);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(og01a1b->dev);
 	}
 
 	mutex_unlock(&og01a1b->mutex);
@@ -889,7 +885,6 @@ static const struct v4l2_subdev_internal_ops og01a1b_internal_ops = {
 
 static int og01a1b_identify_module(struct og01a1b *og01a1b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 	int ret;
 	u32 val;
 
@@ -899,7 +894,7 @@ static int og01a1b_identify_module(struct og01a1b *og01a1b)
 		return ret;
 
 	if (val != OG01A1B_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(og01a1b->dev, "chip id mismatch: %x!=%x",
 			OG01A1B_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -909,8 +904,7 @@ static int og01a1b_identify_module(struct og01a1b *og01a1b)
 
 static int og01a1b_check_hwcfg(struct og01a1b *og01a1b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
-	struct device *dev = &client->dev;
+	struct device *dev = og01a1b->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1066,7 +1060,7 @@ static void og01a1b_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(og01a1b->dev);
 	mutex_destroy(&og01a1b->mutex);
 }
 
@@ -1079,34 +1073,36 @@ static int og01a1b_probe(struct i2c_client *client)
 	if (!og01a1b)
 		return -ENOMEM;
 
+	og01a1b->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
 
-	og01a1b->xvclk = devm_clk_get_optional(&client->dev, NULL);
+	og01a1b->xvclk = devm_clk_get_optional(og01a1b->dev, NULL);
 	if (IS_ERR(og01a1b->xvclk)) {
 		ret = PTR_ERR(og01a1b->xvclk);
-		dev_err(&client->dev, "failed to get xvclk clock: %d\n", ret);
+		dev_err(og01a1b->dev, "failed to get xvclk clock: %d\n", ret);
 		return ret;
 	}
 
 	ret = og01a1b_check_hwcfg(og01a1b);
 	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
+		dev_err(og01a1b->dev, "failed to check HW configuration: %d",
 			ret);
 		return ret;
 	}
 
-	og01a1b->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+	og01a1b->reset_gpio = devm_gpiod_get_optional(og01a1b->dev, "reset",
 						      GPIOD_OUT_LOW);
 	if (IS_ERR(og01a1b->reset_gpio)) {
-		dev_err(&client->dev, "cannot get reset GPIO\n");
+		dev_err(og01a1b->dev, "cannot get reset GPIO\n");
 		return PTR_ERR(og01a1b->reset_gpio);
 	}
 
-	og01a1b->avdd = devm_regulator_get_optional(&client->dev, "avdd");
+	og01a1b->avdd = devm_regulator_get_optional(og01a1b->dev, "avdd");
 	if (IS_ERR(og01a1b->avdd)) {
 		ret = PTR_ERR(og01a1b->avdd);
 		if (ret != -ENODEV) {
-			dev_err_probe(&client->dev, ret,
+			dev_err_probe(og01a1b->dev, ret,
 				      "Failed to get 'avdd' regulator\n");
 			return ret;
 		}
@@ -1114,11 +1110,11 @@ static int og01a1b_probe(struct i2c_client *client)
 		og01a1b->avdd = NULL;
 	}
 
-	og01a1b->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
+	og01a1b->dovdd = devm_regulator_get_optional(og01a1b->dev, "dovdd");
 	if (IS_ERR(og01a1b->dovdd)) {
 		ret = PTR_ERR(og01a1b->dovdd);
 		if (ret != -ENODEV) {
-			dev_err_probe(&client->dev, ret,
+			dev_err_probe(og01a1b->dev, ret,
 				      "Failed to get 'dovdd' regulator\n");
 			return ret;
 		}
@@ -1126,11 +1122,11 @@ static int og01a1b_probe(struct i2c_client *client)
 		og01a1b->dovdd = NULL;
 	}
 
-	og01a1b->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
+	og01a1b->dvdd = devm_regulator_get_optional(og01a1b->dev, "dvdd");
 	if (IS_ERR(og01a1b->dvdd)) {
 		ret = PTR_ERR(og01a1b->dvdd);
 		if (ret != -ENODEV) {
-			dev_err_probe(&client->dev, ret,
+			dev_err_probe(og01a1b->dev, ret,
 				      "Failed to get 'dvdd' regulator\n");
 			return ret;
 		}
@@ -1139,13 +1135,13 @@ static int og01a1b_probe(struct i2c_client *client)
 	}
 
 	/* The sensor must be powered on to read the CHIP_ID register */
-	ret = og01a1b_power_on(&client->dev);
+	ret = og01a1b_power_on(og01a1b->dev);
 	if (ret)
 		return ret;
 
 	ret = og01a1b_identify_module(og01a1b);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(og01a1b->dev, "failed to find sensor: %d", ret);
 		goto power_off;
 	}
 
@@ -1153,7 +1149,7 @@ static int og01a1b_probe(struct i2c_client *client)
 	og01a1b->cur_mode = &supported_modes[0];
 	ret = og01a1b_init_controls(og01a1b);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(og01a1b->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1164,21 +1160,21 @@ static int og01a1b_probe(struct i2c_client *client)
 	og01a1b->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&og01a1b->sd.entity, 1, &og01a1b->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(og01a1b->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&og01a1b->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(og01a1b->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
 	/* Enable runtime PM and turn off the device */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(og01a1b->dev);
+	pm_runtime_enable(og01a1b->dev);
+	pm_runtime_idle(og01a1b->dev);
 
 	return 0;
 
@@ -1190,7 +1186,7 @@ static int og01a1b_probe(struct i2c_client *client)
 	mutex_destroy(&og01a1b->mutex);
 
 power_off:
-	og01a1b_power_off(&client->dev);
+	og01a1b_power_off(og01a1b->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


