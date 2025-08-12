Return-Path: <linux-media+bounces-39679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1236B23B0F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F5114E1877
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87502DCF7C;
	Tue, 12 Aug 2025 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBtND4AU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B12DCC08
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035273; cv=none; b=jjHuqfF9l7X0rCczvq91FMDGX9rc4F285Ct0rARfFO6y3t+fyK5V3hFq/KwGQVD7yqLeZMDm73+Rq+Akdlkcub0pDIe4ZAP+bDvFBp8pDazsKDElpEjtFWh2CHNemTHX/vxBfe0wSTAcUf1GzvzabnYxvfLQunkv+kGcTG8auDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035273; c=relaxed/simple;
	bh=RIinB3FLdx2PCR1xIehlQgUWUqt7v0Bz6iHnkuHd0oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AC5EBi4m88xd+81+1JcUSyXpAvIxj/Nhta81hFkcdb8z0KaUqOoi72N23mxpnXePXLgM+gV5AT+8/H8kUJouQUsH6hwLmzgAoKhsmmogY5fWFHG596Li7NiLK/Bj74CXTZq5K44Dg7vztt1xBAjf1giq6T4WmCyYII0PaefiVtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nBtND4AU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 587121738;
	Tue, 12 Aug 2025 23:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035217;
	bh=RIinB3FLdx2PCR1xIehlQgUWUqt7v0Bz6iHnkuHd0oQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBtND4AUGL+E3GBMu1h//oRqhxCzO3j+SnYAXL4X9wLTDzqgLVDfStREulfYHmD7f
	 vN2HncoEL22Y/8hPR7uekncReI6hzgCWQhMsRhW3mLrT5xW9BdsdbMSTEH1yX6tgoG
	 Bm6CQ6e/5g9xfRGxiew5dy0j70FSz3lDRSoZAM54=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 43/72] media: i2c: ov9734: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:51 +0300
Message-ID: <20250812214620.30425-44-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov9734 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov9734.c | 58 ++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index cae3aeefb616..d74d99344210 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -321,6 +322,8 @@ static const struct ov9734_mode supported_modes[] = {
 };
 
 struct ov9734 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -414,7 +417,6 @@ static int ov9734_write_reg(struct ov9734 *ov9734, u16 reg, u16 len, u32 val)
 static int ov9734_write_reg_list(struct ov9734 *ov9734,
 				 const struct ov9734_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
 	unsigned int i;
 	int ret;
 
@@ -422,7 +424,7 @@ static int ov9734_write_reg_list(struct ov9734 *ov9734,
 		ret = ov9734_write_reg(ov9734, r_list->regs[i].address, 1,
 				       r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov9734->dev,
 					    "write reg 0x%4.4x return err = %d",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -476,7 +478,6 @@ static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov9734 *ov9734 = container_of(ctrl->handler,
 					     struct ov9734, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -492,7 +493,7 @@ static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov9734->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -525,7 +526,7 @@ static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov9734->dev);
 
 	return ret;
 }
@@ -610,7 +611,6 @@ static void ov9734_update_pad_format(const struct ov9734_mode *mode,
 
 static int ov9734_start_streaming(struct ov9734 *ov9734)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
 	const struct ov9734_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -618,14 +618,14 @@ static int ov9734_start_streaming(struct ov9734 *ov9734)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov9734_write_reg_list(ov9734, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(ov9734->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &ov9734->cur_mode->reg_list;
 	ret = ov9734_write_reg_list(ov9734, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(ov9734->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -636,30 +636,27 @@ static int ov9734_start_streaming(struct ov9734 *ov9734)
 	ret = ov9734_write_reg(ov9734, OV9734_REG_MODE_SELECT,
 			       1, OV9734_MODE_STREAMING);
 	if (ret)
-		dev_err(&client->dev, "failed to start stream");
+		dev_err(ov9734->dev, "failed to start stream");
 
 	return ret;
 }
 
 static void ov9734_stop_streaming(struct ov9734 *ov9734)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
-
 	if (ov9734_write_reg(ov9734, OV9734_REG_MODE_SELECT,
 			     1, OV9734_MODE_STANDBY))
-		dev_err(&client->dev, "failed to stop stream");
+		dev_err(ov9734->dev, "failed to stop stream");
 }
 
 static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov9734 *ov9734 = to_ov9734(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov9734->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov9734->dev);
 		if (ret < 0) {
 			mutex_unlock(&ov9734->mutex);
 			return ret;
@@ -669,11 +666,11 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			ov9734_stop_streaming(ov9734);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov9734->dev);
 		}
 	} else {
 		ov9734_stop_streaming(ov9734);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov9734->dev);
 	}
 
 	mutex_unlock(&ov9734->mutex);
@@ -808,7 +805,6 @@ static const struct v4l2_subdev_internal_ops ov9734_internal_ops = {
 
 static int ov9734_identify_module(struct ov9734 *ov9734)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
 	int ret;
 	u32 val;
 
@@ -817,7 +813,7 @@ static int ov9734_identify_module(struct ov9734 *ov9734)
 		return ret;
 
 	if (val != OV9734_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov9734->dev, "chip id mismatch: %x!=%x",
 			OV9734_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -892,8 +888,8 @@ static void ov9734_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov9734->dev);
+	pm_runtime_set_suspended(ov9734->dev);
 	mutex_destroy(&ov9734->mutex);
 }
 
@@ -913,10 +909,12 @@ static int ov9734_probe(struct i2c_client *client)
 	if (!ov9734)
 		return -ENOMEM;
 
+	ov9734->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&ov9734->sd, client, &ov9734_subdev_ops);
 	ret = ov9734_identify_module(ov9734);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(ov9734->dev, "failed to find sensor: %d", ret);
 		return ret;
 	}
 
@@ -924,7 +922,7 @@ static int ov9734_probe(struct i2c_client *client)
 	ov9734->cur_mode = &supported_modes[0];
 	ret = ov9734_init_controls(ov9734);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(ov9734->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -935,7 +933,7 @@ static int ov9734_probe(struct i2c_client *client)
 	ov9734->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov9734->sd.entity, 1, &ov9734->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov9734->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -943,13 +941,13 @@ static int ov9734_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(ov9734->dev);
+	pm_runtime_enable(ov9734->dev);
+	pm_runtime_idle(ov9734->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov9734->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup_pm;
 	}
@@ -957,8 +955,8 @@ static int ov9734_probe(struct i2c_client *client)
 	return 0;
 
 probe_error_media_entity_cleanup_pm:
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov9734->dev);
+	pm_runtime_set_suspended(ov9734->dev);
 	media_entity_cleanup(&ov9734->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:
-- 
Regards,

Laurent Pinchart


