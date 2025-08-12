Return-Path: <linux-media+bounces-39664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D38B23B05
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4C11AA641F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACB82E2DD2;
	Tue, 12 Aug 2025 21:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ohFbsgI5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D72E283F
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035249; cv=none; b=gZlP18uOoSCRGa2t9+MQd4MkycKCQYS5/sBCRwLKsRKCiXI/FQ3gnQhauFqToAl5Nh6MEFXlTzgmJuAlzfV7ErsSGaGDvAtwnkvKhBCNHjK4IL5klBG+TtR6Ur3N99HzYAOueGe3L4WILR4Yt1U+FdVbsiF81NI31GFM56qrgPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035249; c=relaxed/simple;
	bh=2VRFA44yhx1jSzsUZ0FLtrO2isayuvbarrS8eSktR5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usORYXoagqxHpt4SXkE4sjQDN6C3825+Crx/B4h0I9VnEN90RA+Y1QPh98AQqDxlc40wzhTcwN8p7fXaY9Xb5wPZJda1tOz5xrLqodw14eVEqWAaDm3olyPLqh7u8qdqUCKAqJvf4OnBcKjQaVL90qWd2A2ss25iTXgIMa7eXAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ohFbsgI5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5CEE91123;
	Tue, 12 Aug 2025 23:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035193;
	bh=2VRFA44yhx1jSzsUZ0FLtrO2isayuvbarrS8eSktR5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohFbsgI5N9ZyssAFY1t8c5zj9A5pvaz2ELc/zR6KnfS4eztJY26pSLdPzB18yQvA6
	 kdnFNlp6qnmheVd50bJLCFy/Z/zEr4mSTxnBQQYm7hVWKSeILcY7LJhA98VgTmM3aU
	 EJOkt2UpxTB+pyZRfi/Vgd63CLdVuVkijJq5tQvY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jason Chen <jason.z.chen@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 28/72] media: i2c: ov08x40: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:36 +0300
Message-ID: <20250812214620.30425-29-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov08x40 and
access it from there instead, to simplify the driver.

While at it, fix mistakes in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov08x40.c | 82 ++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index e0094305ca2a..15504344a4b1 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1,15 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
-#include <linux/i2c.h>
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -1305,6 +1306,8 @@ static const char * const ov08x40_supply_names[] = {
 };
 
 struct ov08x40 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -1513,7 +1516,6 @@ static int ov08x40_write_reg(struct ov08x40 *ov08x,
 static int ov08x40_write_regs(struct ov08x40 *ov08x,
 			      const struct ov08x40_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	int ret;
 	u32 i;
 
@@ -1522,7 +1524,7 @@ static int ov08x40_write_regs(struct ov08x40 *ov08x,
 					regs[i].val);
 
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov08x->dev,
 					    "Failed to write reg 0x%4.4x. error = %d\n",
 					    regs[i].address, ret);
 
@@ -1670,7 +1672,6 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov08x40 *ov08x = container_of(ctrl->handler,
 					     struct ov08x40, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	s64 max;
 	int exp;
 	int fll;
@@ -1699,7 +1700,7 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov08x->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1737,13 +1738,13 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 		ov08x40_set_ctrl_vflip(ov08x, ctrl->val);
 		break;
 	default:
-		dev_info(&client->dev,
+		dev_info(ov08x->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
 			 ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov08x->dev);
 
 	return ret;
 }
@@ -1912,7 +1913,6 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 
 static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	const struct ov08x40_reg_list *reg_list;
 	int ret, link_freq_index;
 
@@ -1920,7 +1920,7 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 	ret = ov08x40_write_reg(ov08x, OV08X40_REG_SOFTWARE_RST,
 				OV08X40_REG_VALUE_08BIT, OV08X40_SOFTWARE_RST);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set powerup registers\n",
+		dev_err(ov08x->dev, "%s failed to set powerup registers\n",
 			__func__);
 		return ret;
 	}
@@ -1930,14 +1930,14 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 
 	ret = ov08x40_write_reg_list(ov08x, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(ov08x->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
 	reg_list = &ov08x40_global_setting;
 	ret = ov08x40_write_reg_list(ov08x, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set global setting\n",
+		dev_err(ov08x->dev, "%s failed to set global setting\n",
 			__func__);
 		return ret;
 	}
@@ -1946,7 +1946,7 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 	reg_list = &ov08x->cur_mode->reg_list;
 	ret = ov08x40_write_reg_list(ov08x, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(ov08x->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
@@ -1962,7 +1962,7 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 	}
 
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set regs\n", __func__);
+		dev_err(ov08x->dev, "%s failed to set regs\n", __func__);
 		return ret;
 	}
 
@@ -1986,7 +1986,6 @@ static int ov08x40_stop_streaming(struct ov08x40 *ov08x)
 /* Verify chip ID */
 static int ov08x40_identify_module(struct ov08x40 *ov08x)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	int ret;
 	u32 val;
 
@@ -1996,17 +1995,17 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
 			       OV08X40_REG_VALUE_24BIT, &val);
 	if (ret) {
-		dev_err(&client->dev, "error reading chip-id register: %d\n", ret);
+		dev_err(ov08x->dev, "error reading chip-id register: %d\n", ret);
 		return ret;
 	}
 
 	if (val != OV08X40_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(ov08x->dev, "chip id mismatch: %x!=%x\n",
 			OV08X40_CHIP_ID, val);
 		return -ENXIO;
 	}
 
-	dev_dbg(&client->dev, "chip id 0x%x\n", val);
+	dev_dbg(ov08x->dev, "chip id 0x%x\n", val);
 	ov08x->identified = true;
 
 	return 0;
@@ -2015,13 +2014,12 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov08x40 *ov08x = to_ov08x40(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov08x->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov08x->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -2038,7 +2036,7 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		ov08x40_stop_streaming(ov08x);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov08x->dev);
 	}
 
 	mutex_unlock(&ov08x->mutex);
@@ -2046,7 +2044,7 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov08x->dev);
 err_unlock:
 	mutex_unlock(&ov08x->mutex);
 
@@ -2079,7 +2077,6 @@ static const struct v4l2_subdev_internal_ops ov08x40_internal_ops = {
 
 static int ov08x40_init_controls(struct ov08x40 *ov08x)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
@@ -2160,12 +2157,12 @@ static int ov08x40_init_controls(struct ov08x40 *ov08x)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
+		dev_err(ov08x->dev, "%s control init failed (%d)\n",
 			__func__, ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov08x->dev, &props);
 	if (ret)
 		goto error;
 
@@ -2191,11 +2188,12 @@ static void ov08x40_free_controls(struct ov08x40 *ov08x)
 	mutex_destroy(&ov08x->mutex);
 }
 
-static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
+static int ov08x40_check_hwcfg(struct ov08x40 *ov08x)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	struct device *dev = ov08x->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned int i;
@@ -2294,19 +2292,21 @@ static int ov08x40_probe(struct i2c_client *client)
 	if (!ov08x)
 		return -ENOMEM;
 
+	ov08x->dev = &client->dev;
+
 	/* Check HW config */
-	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
+	ret = ov08x40_check_hwcfg(ov08x);
 	if (ret)
 		return ret;
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov08x->dev);
 	if (full_power) {
-		ret = ov08x40_power_on(&client->dev);
+		ret = ov08x40_power_on(ov08x->dev);
 		if (ret) {
-			dev_err(&client->dev, "failed to power on\n");
+			dev_err(ov08x->dev, "failed to power on\n");
 			return ret;
 		}
 
@@ -2333,7 +2333,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	ov08x->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov08x->sd.entity, 1, &ov08x->pad);
 	if (ret) {
-		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+		dev_err(ov08x->dev, "%s failed:%d\n", __func__, ret);
 		goto error_handler_free;
 	}
 
@@ -2342,9 +2342,9 @@ static int ov08x40_probe(struct i2c_client *client)
 		goto error_media_entity;
 
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(ov08x->dev);
+	pm_runtime_enable(ov08x->dev);
+	pm_runtime_idle(ov08x->dev);
 
 	return 0;
 
@@ -2355,7 +2355,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	ov08x40_free_controls(ov08x);
 
 probe_power_off:
-	ov08x40_power_off(&client->dev);
+	ov08x40_power_off(ov08x->dev);
 
 	return ret;
 }
@@ -2369,10 +2369,10 @@ static void ov08x40_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	ov08x40_free_controls(ov08x);
 
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		ov08x40_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov08x->dev);
+	if (!pm_runtime_status_suspended(ov08x->dev))
+		ov08x40_power_off(ov08x->dev);
+	pm_runtime_set_suspended(ov08x->dev);
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
-- 
Regards,

Laurent Pinchart


