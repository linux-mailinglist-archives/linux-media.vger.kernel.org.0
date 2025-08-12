Return-Path: <linux-media+bounces-39694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2CB23B34
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CA65A0F18
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ECB2E717F;
	Tue, 12 Aug 2025 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="og22IiOF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF42E0902
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035299; cv=none; b=MyAGH48zEjYYhKKbhS4FUht33EYbVGIr96TPB7BSJ5O77rzyHtBZd+DrH1tBB0l/tU4LgxQ39ot0EhxuR00KUGMhx7gDdV8qHf7IIdLK2M9qtY4EtkYMsX5ANNQgWM2Vvvybz7re87UyvHsrg1ZZTQNWCsJHBkNxUK1w+xUwMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035299; c=relaxed/simple;
	bh=QH7lI+G4vgACuNq7DL6BzpNLynaR0YIHOvEInEhgUXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ld5woW+Kkl9/okykDT/Sb7i/N6uIa++v8lhyjVp8kwvyEABdZQV56rDq4UZIS/bEBxfLcUkZyMk0HEzIWX/2KXMTmIaTDmM9yllaaEFdr5WsO2rED1L8S8rdBUIPQH383ETMcSfyNOy82ihbgRfmObjjuz123w8ktLfhjzjwwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=og22IiOF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A257F1123;
	Tue, 12 Aug 2025 23:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035243;
	bh=QH7lI+G4vgACuNq7DL6BzpNLynaR0YIHOvEInEhgUXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=og22IiOF6ZwXxjE/rWInKu0m56RqdsCbwg1eQr48c91Hb13a48JuNua33Z65J0VJ3
	 HE/lc0Bd396bnKIxbqBQpK6z5gHZ/xo0981R7W1ByZYSXHvcIicyL01Go3do/1r1Vb
	 0l8bE0TGT2Ep+kmgw9rkHRfCBiQ5RrAKLmGdrVGw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 58/72] media: i2c: ov8856: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:46:06 +0300
Message-ID: <20250812214620.30425-59-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov8856 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov8856.c | 69 +++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index b85051f053ff..674ee36e394c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
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
@@ -1414,6 +1415,8 @@ static const struct ov8856_reg_list bayer_offset_configs[] = {
 };
 
 struct ov8856 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -1668,7 +1671,6 @@ static int ov8856_write_reg(struct ov8856 *ov8856, u16 reg, u16 len, u32 val)
 static int ov8856_write_reg_list(struct ov8856 *ov8856,
 				 const struct ov8856_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	unsigned int i;
 	int ret;
 
@@ -1676,7 +1678,7 @@ static int ov8856_write_reg_list(struct ov8856 *ov8856,
 		ret = ov8856_write_reg(ov8856, r_list->regs[i].address, 1,
 				       r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov8856->dev,
 				    "failed to write reg 0x%4.4x. error = %d",
 				    r_list->regs[i].address, ret);
 			return ret;
@@ -1688,7 +1690,6 @@ static int ov8856_write_reg_list(struct ov8856 *ov8856,
 
 static int ov8856_identify_module(struct ov8856 *ov8856)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	int ret;
 	u32 val;
 
@@ -1701,7 +1702,7 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return ret;
 
 	if (val != OV8856_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov8856->dev, "chip id mismatch: %x!=%x",
 			OV8856_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -1818,7 +1819,6 @@ static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8856 *ov8856 = container_of(ctrl->handler,
 					     struct ov8856, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -1834,7 +1834,7 @@ static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov8856->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1876,7 +1876,7 @@ static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov8856->dev);
 
 	return ret;
 }
@@ -1979,7 +1979,6 @@ static void ov8856_update_pad_format(struct ov8856 *ov8856,
 
 static int ov8856_start_streaming(struct ov8856 *ov8856)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	const struct ov8856_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -1992,21 +1991,21 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 
 	ret = ov8856_write_reg_list(ov8856, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(ov8856->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &ov8856->cur_mode->reg_list;
 	ret = ov8856_write_reg_list(ov8856, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(ov8856->dev, "failed to set mode");
 		return ret;
 	}
 
 	reg_list = &bayer_offset_configs[ov8856->cur_mbus_index];
 	ret = ov8856_write_reg_list(ov8856, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mbus format");
+		dev_err(ov8856->dev, "failed to set mbus format");
 		return ret;
 	}
 
@@ -2017,7 +2016,7 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
 			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(ov8856->dev, "failed to set stream");
 		return ret;
 	}
 
@@ -2026,22 +2025,19 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 
 static void ov8856_stop_streaming(struct ov8856 *ov8856)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
-
 	if (ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
 			     OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(ov8856->dev, "failed to set stream");
 }
 
 static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov8856->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov8856->dev);
 		if (ret < 0) {
 			mutex_unlock(&ov8856->mutex);
 			return ret;
@@ -2051,11 +2047,11 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			ov8856_stop_streaming(ov8856);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov8856->dev);
 		}
 	} else {
 		ov8856_stop_streaming(ov8856);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov8856->dev);
 	}
 
 	mutex_unlock(&ov8856->mutex);
@@ -2255,8 +2251,9 @@ static const struct v4l2_subdev_internal_ops ov8856_internal_ops = {
 };
 
 
-static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
+static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 {
+	struct device *dev = ov8856->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -2363,10 +2360,10 @@ static void ov8856_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov8856->dev);
 	mutex_destroy(&ov8856->mutex);
 
-	ov8856_power_off(&client->dev);
+	ov8856_power_off(ov8856->dev);
 }
 
 static int ov8856_probe(struct i2c_client *client)
@@ -2379,23 +2376,25 @@ static int ov8856_probe(struct i2c_client *client)
 	if (!ov8856)
 		return -ENOMEM;
 
-	ret = ov8856_get_hwcfg(ov8856, &client->dev);
+	ov8856->dev = &client->dev;
+
+	ret = ov8856_get_hwcfg(ov8856);
 	if (ret)
 		return ret;
 
 	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov8856->dev);
 	if (full_power) {
-		ret = ov8856_power_on(&client->dev);
+		ret = ov8856_power_on(ov8856->dev);
 		if (ret) {
-			dev_err(&client->dev, "failed to power on\n");
+			dev_err(ov8856->dev, "failed to power on\n");
 			return ret;
 		}
 
 		ret = ov8856_identify_module(ov8856);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			dev_err(ov8856->dev, "failed to find sensor: %d", ret);
 			goto probe_power_off;
 		}
 	}
@@ -2405,7 +2404,7 @@ static int ov8856_probe(struct i2c_client *client)
 	ov8856->cur_mbus_index = ov8856->cur_mode->default_mbus_index;
 	ret = ov8856_init_controls(ov8856);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(ov8856->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -2416,22 +2415,22 @@ static int ov8856_probe(struct i2c_client *client)
 	ov8856->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov8856->sd.entity, 1, &ov8856->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov8856->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&ov8856->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov8856->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(ov8856->dev);
+	pm_runtime_enable(ov8856->dev);
+	pm_runtime_idle(ov8856->dev);
 
 	return 0;
 
@@ -2443,7 +2442,7 @@ static int ov8856_probe(struct i2c_client *client)
 	mutex_destroy(&ov8856->mutex);
 
 probe_power_off:
-	ov8856_power_off(&client->dev);
+	ov8856_power_off(ov8856->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


