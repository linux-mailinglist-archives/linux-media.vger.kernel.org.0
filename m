Return-Path: <linux-media+bounces-39652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C4B23B09
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CACC15660C4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885422E11C7;
	Tue, 12 Aug 2025 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ccuh4mmp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B62D949D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035230; cv=none; b=kgjXLfWADvA85M1+ek/VLjhD7ADY78DsHiaMInZduHfu4nOZgwDjh0hIaQ0/ggLNZdTDywv0jX9ZuuX7bXEshASAgyxFdWuKesQ46BqXzqJvzT19rXxlXGcQJVz4WhNFzPaHt9tHrEyfdKWT72Z6Wgk2MZjVJ2E4DrRJ5KjZSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035230; c=relaxed/simple;
	bh=2HjASUG9tLWZlTJ+2N+zF7BYI9uJGSdX0/gSvoEC5oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrpGi1h7MLfYb3NcoNAv8RDB55BO6+vL3NJqAUrzFaWVvtFY8bQYE+7v9naNUrS0OIxFOyrhzNEjsbjMAZfsODeZUH1HwBSeY7C1EIepWuZJrAdZftGcWWDpLgImEnwL/OTcUUk52RD0iod0UXmkXQcAHd7WdEfqrecCtO127ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ccuh4mmp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C715D1123;
	Tue, 12 Aug 2025 23:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035173;
	bh=2HjASUG9tLWZlTJ+2N+zF7BYI9uJGSdX0/gSvoEC5oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ccuh4mmp4NABotiAys6w3Mg3gbcY29xIQ2VFhJpLtvf0vx/TRPTpgNr3r2ZTCW8ES
	 ujmjHHfs89M1XnbvtprplBlx/8uv0E5b++ypE3J8BdjANgfc8R8Y0aEXIl5GimCGb3
	 Lcr5I/ZwqsA/iHHe9UpHDc4x7hLy9nReGkZBghMI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 16/72] media: i2c: imx319: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:24 +0300
Message-ID: <20250812214620.30425-17-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct imx319 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx319.c | 63 +++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 701840f4a5cc..f404d053873c 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2018 Intel Corporation
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -111,6 +112,8 @@ struct imx319_hwcfg {
 };
 
 struct imx319 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -1839,14 +1842,13 @@ static int imx319_write_reg(struct imx319 *imx319, u16 reg, u32 len, u32 val)
 static int imx319_write_regs(struct imx319 *imx319,
 			     const struct imx319_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
 	int ret;
 	u32 i;
 
 	for (i = 0; i < len; i++) {
 		ret = imx319_write_reg(imx319, regs[i].address, 1, regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(imx319->dev,
 					    "write reg 0x%4.4x return err %d",
 					    regs[i].address, ret);
 			return ret;
@@ -1880,7 +1882,6 @@ static int imx319_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx319 *imx319 = container_of(ctrl->handler,
 					     struct imx319, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
 	s64 max;
 	int ret;
 
@@ -1899,7 +1900,7 @@ static int imx319_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(imx319->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1933,12 +1934,12 @@ static int imx319_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		ret = -EINVAL;
-		dev_info(&client->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
+		dev_info(imx319->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
 			 ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx319->dev);
 
 	return ret;
 }
@@ -2087,7 +2088,6 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
 /* Verify chip ID */
 static int imx319_identify_module(struct imx319 *imx319)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
 	int ret;
 	u32 val;
 
@@ -2099,7 +2099,7 @@ static int imx319_identify_module(struct imx319 *imx319)
 		return ret;
 
 	if (val != IMX319_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx319->dev, "chip id mismatch: %x!=%x",
 			IMX319_CHIP_ID, val);
 		return -EIO;
 	}
@@ -2112,7 +2112,6 @@ static int imx319_identify_module(struct imx319 *imx319)
 /* Start streaming */
 static int imx319_start_streaming(struct imx319 *imx319)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
 	const struct imx319_reg_list *reg_list;
 	int ret;
 
@@ -2124,7 +2123,7 @@ static int imx319_start_streaming(struct imx319 *imx319)
 	reg_list = &imx319_global_setting;
 	ret = imx319_write_regs(imx319, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set global settings");
+		dev_err(imx319->dev, "failed to set global settings");
 		return ret;
 	}
 
@@ -2132,7 +2131,7 @@ static int imx319_start_streaming(struct imx319 *imx319)
 	reg_list = &imx319->cur_mode->reg_list;
 	ret = imx319_write_regs(imx319, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(imx319->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -2160,13 +2159,12 @@ static int imx319_stop_streaming(struct imx319 *imx319)
 static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx319 *imx319 = to_imx319(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&imx319->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(imx319->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -2179,7 +2177,7 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx319_stop_streaming(imx319);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(imx319->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -2191,7 +2189,7 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx319->dev);
 err_unlock:
 	mutex_unlock(&imx319->mutex);
 
@@ -2231,7 +2229,6 @@ static const struct v4l2_subdev_internal_ops imx319_internal_ops = {
 /* Initialize control handlers */
 static int imx319_init_controls(struct imx319 *imx319)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx319->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
@@ -2311,7 +2308,7 @@ static int imx319_init_controls(struct imx319 *imx319)
 				     0, 0, imx319_test_pattern_menu);
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "control init failed: %d", ret);
+		dev_err(imx319->dev, "control init failed: %d", ret);
 		goto error;
 	}
 
@@ -2392,24 +2389,26 @@ static int imx319_probe(struct i2c_client *client)
 	if (!imx319)
 		return -ENOMEM;
 
+	imx319->dev = &client->dev;
+
 	mutex_init(&imx319->mutex);
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(imx319->dev);
 	if (full_power) {
 		/* Check module identity */
 		ret = imx319_identify_module(imx319);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			dev_err(imx319->dev, "failed to find sensor: %d", ret);
 			goto error_probe;
 		}
 	}
 
-	imx319->hwcfg = imx319_get_hwcfg(&client->dev);
+	imx319->hwcfg = imx319_get_hwcfg(imx319->dev);
 	if (!imx319->hwcfg) {
-		dev_err(&client->dev, "failed to get hwcfg");
+		dev_err(imx319->dev, "failed to get hwcfg");
 		ret = -ENODEV;
 		goto error_probe;
 	}
@@ -2419,7 +2418,7 @@ static int imx319_probe(struct i2c_client *client)
 
 	ret = imx319_init_controls(imx319);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(imx319->dev, "failed to init controls: %d", ret);
 		goto error_probe;
 	}
 
@@ -2434,27 +2433,27 @@ static int imx319_probe(struct i2c_client *client)
 	imx319->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx319->sd.entity, 1, &imx319->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx319->dev, "failed to init entity pads: %d", ret);
 		goto error_handler_free;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
+		pm_runtime_set_active(imx319->dev);
+	pm_runtime_enable(imx319->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx319->sd);
 	if (ret < 0)
 		goto error_media_entity_pm;
 
-	pm_runtime_idle(&client->dev);
+	pm_runtime_idle(imx319->dev);
 
 	return 0;
 
 error_media_entity_pm:
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(imx319->dev);
 	if (full_power)
-		pm_runtime_set_suspended(&client->dev);
+		pm_runtime_set_suspended(imx319->dev);
 	media_entity_cleanup(&imx319->sd.entity);
 
 error_handler_free:
@@ -2475,9 +2474,9 @@ static void imx319_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(imx319->dev);
+	if (!pm_runtime_status_suspended(imx319->dev))
+		pm_runtime_set_suspended(imx319->dev);
 
 	mutex_destroy(&imx319->mutex);
 }
-- 
Regards,

Laurent Pinchart


