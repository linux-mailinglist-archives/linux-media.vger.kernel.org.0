Return-Path: <linux-media+bounces-37392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FFFB00AA0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D189B189EB8F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7762F4315;
	Thu, 10 Jul 2025 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oTyx5Y3c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8442F430D
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169801; cv=none; b=DOvWg5tt6lhqOSn/SNBRrOvG6qsQjLbRI1Eh4LwfASKqUJf3uL5I5//ivUJU9JnWP7VDs0bjNPVBxtpRk9rj/Hocqnkie2C56YEKScn+rkD2bWCSql88ll2Bz3Mfc/H3Aqah7gTcVD2Tcq75NwhLKbGBAq2hi4o3Blvzo6UNt1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169801; c=relaxed/simple;
	bh=8S+GZLpBuMpRLqA91FYvnXJ+5Vms0lDRVT5xE9oPEHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJ9u/zOJZF++HcehN4HUxzi0Y4+brXrf3Rl1BVhSlY1TIy8YXJjieEq1nyxUyLw0lxq85vNo2Jy2OhX0ixZT76/d759P0gyrQdWszGjSqZO8poZ4hczJ+2LiyDtLD6MI2oHPAvAGWQYEzq3ZU5yLmTHeh5HB6jcF/269rCenfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oTyx5Y3c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7195BB2B;
	Thu, 10 Jul 2025 19:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169769;
	bh=8S+GZLpBuMpRLqA91FYvnXJ+5Vms0lDRVT5xE9oPEHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oTyx5Y3cAy38gOZasp/5cbPVoiZeCdTb54q5YQ9s4zEmSO3lPjoudFfPo9KU4RY3z
	 XPDxEi1hw04Mra7oesk2GMg6B++fZc7xf5U+fuGQ8i8affWlc/gntNUpYEINNKY/Cw
	 r9DJRXCHFIPhF1MNYLeFty6ZVeCM/mAKMMnl0F4o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 49/72] media: i2c: ov5675: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:45 +0300
Message-ID: <20250710174808.5361-50-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov5675 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5675.c | 74 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index e7aec281e9a4..fe16d5439e39 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -11,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -493,6 +494,8 @@ static const struct ov5675_mode supported_modes[] = {
 };
 
 struct ov5675 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -584,7 +587,6 @@ static int ov5675_write_reg(struct ov5675 *ov5675, u16 reg, u16 len, u32 val)
 static int ov5675_write_reg_list(struct ov5675 *ov5675,
 				 const struct ov5675_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	unsigned int i;
 	int ret;
 
@@ -592,7 +594,7 @@ static int ov5675_write_reg_list(struct ov5675 *ov5675,
 		ret = ov5675_write_reg(ov5675, r_list->regs[i].address, 1,
 				       r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov5675->dev,
 				    "failed to write reg 0x%4.4x. error = %d",
 				    r_list->regs[i].address, ret);
 			return ret;
@@ -700,7 +702,6 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5675 *ov5675 = container_of(ctrl->handler,
 					     struct ov5675, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -716,7 +717,7 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov5675->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -765,7 +766,7 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov5675->dev);
 
 	return ret;
 }
@@ -776,7 +777,6 @@ static const struct v4l2_ctrl_ops ov5675_ctrl_ops = {
 
 static int ov5675_init_controls(struct ov5675 *ov5675)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max, h_blank;
@@ -839,7 +839,7 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 		return ctrl_hdlr->error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov5675->dev, &props);
 	if (ret)
 		goto error;
 
@@ -869,7 +869,6 @@ static void ov5675_update_pad_format(const struct ov5675_mode *mode,
 
 static int ov5675_identify_module(struct ov5675 *ov5675)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	int ret;
 	u32 val;
 
@@ -882,7 +881,7 @@ static int ov5675_identify_module(struct ov5675 *ov5675)
 		return ret;
 
 	if (val != OV5675_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov5675->dev, "chip id mismatch: %x!=%x",
 			OV5675_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -894,7 +893,6 @@ static int ov5675_identify_module(struct ov5675 *ov5675)
 
 static int ov5675_start_streaming(struct ov5675 *ov5675)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	const struct ov5675_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -906,14 +904,14 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov5675_write_reg_list(ov5675, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(ov5675->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &ov5675->cur_mode->reg_list;
 	ret = ov5675_write_reg_list(ov5675, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(ov5675->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -924,7 +922,7 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 	ret = ov5675_write_reg(ov5675, OV5675_REG_MODE_SELECT,
 			       OV5675_REG_VALUE_08BIT, OV5675_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(ov5675->dev, "failed to set stream");
 		return ret;
 	}
 
@@ -933,22 +931,19 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 
 static void ov5675_stop_streaming(struct ov5675 *ov5675)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
-
 	if (ov5675_write_reg(ov5675, OV5675_REG_MODE_SELECT,
 			     OV5675_REG_VALUE_08BIT, OV5675_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(ov5675->dev, "failed to set stream");
 }
 
 static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov5675 *ov5675 = to_ov5675(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov5675->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov5675->dev);
 		if (ret < 0) {
 			mutex_unlock(&ov5675->mutex);
 			return ret;
@@ -958,11 +953,11 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			ov5675_stop_streaming(ov5675);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov5675->dev);
 		}
 	} else {
 		ov5675_stop_streaming(ov5675);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov5675->dev);
 	}
 
 	mutex_unlock(&ov5675->mutex);
@@ -1171,8 +1166,9 @@ static const struct v4l2_subdev_internal_ops ov5675_internal_ops = {
 	.open = ov5675_open,
 };
 
-static int ov5675_get_hwcfg(struct ov5675 *ov5675, struct device *dev)
+static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 {
+	struct device *dev = ov5675->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1276,12 +1272,12 @@ static void ov5675_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov5675->dev);
 	mutex_destroy(&ov5675->mutex);
 
-	if (!pm_runtime_status_suspended(&client->dev))
-		ov5675_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(ov5675->dev))
+		ov5675_power_off(ov5675->dev);
+	pm_runtime_set_suspended(ov5675->dev);
 }
 
 static int ov5675_probe(struct i2c_client *client)
@@ -1294,23 +1290,25 @@ static int ov5675_probe(struct i2c_client *client)
 	if (!ov5675)
 		return -ENOMEM;
 
-	ret = ov5675_get_hwcfg(ov5675, &client->dev);
+	ov5675->dev = &client->dev;
+
+	ret = ov5675_get_hwcfg(ov5675);
 	if (ret)
 		return ret;
 
 	v4l2_i2c_subdev_init(&ov5675->sd, client, &ov5675_subdev_ops);
 
-	ret = ov5675_power_on(&client->dev);
+	ret = ov5675_power_on(ov5675->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to power on: %d\n", ret);
+		dev_err(ov5675->dev, "failed to power on: %d\n", ret);
 		return ret;
 	}
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov5675->dev);
 	if (full_power) {
 		ret = ov5675_identify_module(ov5675);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			dev_err(ov5675->dev, "failed to find sensor: %d", ret);
 			goto probe_power_off;
 		}
 	}
@@ -1319,7 +1317,7 @@ static int ov5675_probe(struct i2c_client *client)
 	ov5675->cur_mode = &supported_modes[0];
 	ret = ov5675_init_controls(ov5675);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(ov5675->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1330,22 +1328,22 @@ static int ov5675_probe(struct i2c_client *client)
 	ov5675->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov5675->sd.entity, 1, &ov5675->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov5675->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&ov5675->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov5675->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(ov5675->dev);
+	pm_runtime_enable(ov5675->dev);
+	pm_runtime_idle(ov5675->dev);
 
 	return 0;
 
@@ -1356,7 +1354,7 @@ static int ov5675_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov5675->sd.ctrl_handler);
 	mutex_destroy(&ov5675->mutex);
 probe_power_off:
-	ov5675_power_off(&client->dev);
+	ov5675_power_off(ov5675->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


