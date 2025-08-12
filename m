Return-Path: <linux-media+bounces-39670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD447B23B0B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A234D1AA6202
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F22E0B5C;
	Tue, 12 Aug 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cOWRTyxj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE572D8390
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035259; cv=none; b=q783OpT9e/KtuU4spICGK3S065VIIIKsQh63AD4rrjiLT58xok7LCpjmphM/rvfdJxABXJlVKSEHEx5fCfm2EiW6aCLzDAW3RXtk2uNxlz16BcZLzfvfzAfNzqkn6IOhfemXuuaTJ9TlJGvqoQo2Y4YM78+FyGjYDOu6/7TwCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035259; c=relaxed/simple;
	bh=lnHdAIyYliltfU9tnb2dKjyHxeH92ISgjf4bfI+669I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlbDmrrygydReZP8OI4raJTFKFIYFvYt9R1HAh4i1Le17qxGkJb7aawMLzRft6AzltTFcR9WLyZqxVA+7D76UKR9aGfmaNngCPBv74PeAsDGdF85qKh1T/fejV52n8veAoF6bALrkySr5kjI7qXTlHRqoBAzr6UaHgiAw6fiK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cOWRTyxj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5CCEB1123;
	Tue, 12 Aug 2025 23:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035203;
	bh=lnHdAIyYliltfU9tnb2dKjyHxeH92ISgjf4bfI+669I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOWRTyxjggP387Up8ut5vNKMrOYkFyEf1w43tw8Q1Pb279KJfJLLrsOG2fjgrlqPS
	 y625bJAJHxwUvicX6SxS70eOiRm5TRdHhkt1ZUoLfKszLbgEYk1+Ibo+luUgoo3XFC
	 Md6fF2lE7foh50C55CFBI1nFrDvIeXFeRkbqifr8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 34/72] media: i2c: ov2740: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:42 +0300
Message-ID: <20250812214620.30425-35-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov2740 and access
it from there instead, to simplify the driver.

While at it, fix mistakes in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 67 ++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 4e959534e6e7..aedf62df6e93 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1,17 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/pm_runtime.h>
 #include <linux/nvmem-provider.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -519,6 +519,8 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
 };
 
 struct ov2740 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -616,7 +618,6 @@ static int ov2740_write_reg(struct ov2740 *ov2740, u16 reg, u16 len, u32 val)
 static int ov2740_write_reg_list(struct ov2740 *ov2740,
 				 const struct ov2740_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	unsigned int i;
 	int ret;
 
@@ -624,7 +625,7 @@ static int ov2740_write_reg_list(struct ov2740 *ov2740,
 		ret = ov2740_write_reg(ov2740, r_list->regs[i].address, 1,
 				       r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov2740->dev,
 					    "write reg 0x%4.4x return err = %d\n",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -636,7 +637,6 @@ static int ov2740_write_reg_list(struct ov2740 *ov2740,
 
 static int ov2740_identify_module(struct ov2740 *ov2740)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	int ret;
 	u32 val;
 
@@ -648,12 +648,12 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 		return ret;
 
 	if (val != OV2740_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x != %x\n",
+		dev_err(ov2740->dev, "chip id mismatch: %x != %x\n",
 			OV2740_CHIP_ID, val);
 		return -ENXIO;
 	}
 
-	dev_dbg(&client->dev, "chip id: 0x%x\n", val);
+	dev_dbg(ov2740->dev, "chip id: 0x%x\n", val);
 
 	ov2740->identified = true;
 
@@ -704,7 +704,6 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov2740 *ov2740 = container_of(ctrl->handler,
 					     struct ov2740, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	s64 exposure_max;
 	int ret;
 
@@ -720,7 +719,7 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov2740->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -753,7 +752,7 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov2740->dev);
 
 	return ret;
 }
@@ -764,7 +763,6 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
 
 static int ov2740_init_controls(struct ov2740 *ov2740)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
@@ -821,7 +819,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov2740->dev, &props);
 	if (ret) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ret;
@@ -940,7 +938,6 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 
 static int ov2740_start_streaming(struct ov2740 *ov2740)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	const struct ov2740_reg_list *reg_list;
 	int link_freq_index;
 	int ret;
@@ -955,7 +952,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	/* Reset the sensor */
 	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
 	if (ret) {
-		dev_err(&client->dev, "failed to reset\n");
+		dev_err(ov2740->dev, "failed to reset\n");
 		return ret;
 	}
 
@@ -965,14 +962,14 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls\n");
+		dev_err(ov2740->dev, "failed to set plls\n");
 		return ret;
 	}
 
 	reg_list = &ov2740->cur_mode->reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(ov2740->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -983,31 +980,28 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
 	if (ret)
-		dev_err(&client->dev, "failed to start streaming\n");
+		dev_err(ov2740->dev, "failed to start streaming\n");
 
 	return ret;
 }
 
 static void ov2740_stop_streaming(struct ov2740 *ov2740)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
-
 	if (ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			     OV2740_MODE_STANDBY))
-		dev_err(&client->dev, "failed to stop streaming\n");
+		dev_err(ov2740->dev, "failed to stop streaming\n");
 }
 
 static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov2740 *ov2740 = to_ov2740(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov2740->dev);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -1015,11 +1009,11 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			ov2740_stop_streaming(ov2740);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov2740->dev);
 		}
 	} else {
 		ov2740_stop_streaming(ov2740);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov2740->dev);
 	}
 
 out_unlock:
@@ -1131,10 +1125,9 @@ static const struct media_entity_operations ov2740_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static int ov2740_check_hwcfg(struct device *dev)
+static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2740 *ov2740 = to_ov2740(sd);
+	struct device *dev = ov2740->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1270,7 +1263,7 @@ static int ov2740_register_nvmem(struct i2c_client *client,
 	struct regmap_config regmap_config = { };
 	struct nvmem_config nvmem_config = { };
 	struct regmap *regmap;
-	struct device *dev = &client->dev;
+	struct device *dev = ov2740->dev;
 
 	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
 	if (!nvm)
@@ -1357,10 +1350,12 @@ static int ov2740_probe(struct i2c_client *client)
 	if (!ov2740)
 		return -ENOMEM;
 
+	ov2740->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	ov2740->sd.internal_ops = &ov2740_internal_ops;
 
-	ret = ov2740_check_hwcfg(dev);
+	ret = ov2740_check_hwcfg(ov2740);
 	if (ret)
 		return ret;
 
@@ -1397,7 +1392,7 @@ static int ov2740_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov2740->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
 		ret = ov2740_resume(dev);
@@ -1435,9 +1430,9 @@ static int ov2740_probe(struct i2c_client *client)
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(ov2740->dev);
+	pm_runtime_enable(ov2740->dev);
+	pm_runtime_idle(ov2740->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
 	if (ret < 0) {
@@ -1447,13 +1442,13 @@ static int ov2740_probe(struct i2c_client *client)
 
 	ret = ov2740_register_nvmem(client, ov2740);
 	if (ret)
-		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
+		dev_warn(ov2740->dev, "register nvmem failed, ret %d\n", ret);
 
 	return 0;
 
 probe_error_v4l2_subdev_cleanup:
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov2740->dev);
+	pm_runtime_set_suspended(ov2740->dev);
 	v4l2_subdev_cleanup(&ov2740->sd);
 
 probe_error_media_entity_cleanup:
-- 
Regards,

Laurent Pinchart


