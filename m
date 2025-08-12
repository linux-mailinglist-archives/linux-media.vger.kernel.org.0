Return-Path: <linux-media+bounces-39648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB0B23B06
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D535851D9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADCD2D9483;
	Tue, 12 Aug 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Khlj4VLt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407A2D2384
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035223; cv=none; b=SMqZukJCBgaWzxA/u2TlHuOcHSvr70CxwSFh/8k9pgglhRqx4jjgL8SroKLsFPRkoopDuQjE/PWW6yq4cyy/8mwuNCFNvrPaYQDlRcVJedxFNoE44yjdejrqEt1OCjwKDsB10BqgpFbxc7EzoF9ExfLNWcaoOtSsiDw/Hq6c9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035223; c=relaxed/simple;
	bh=66cFsv3hBK++fvpcEzTCy/0J+ci01KdA08iGKZW6rCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boBZ65KK0MhAdkS1WeSt6hM7PBBDf5RBMWjkBWqBI3tjA1g3YmZLbAt78X18nioI09K5k1vAeEfpTlcfS+PHlVU+udFyWDFiW30m/AnEYeoS4/pSVn3hCF4VBJlJkLpmwYRjUZgnQoeXL8Qy//++c86NCLnUBeKu3dtuR7szzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Khlj4VLt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 08B6B10D4;
	Tue, 12 Aug 2025 23:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035166;
	bh=66cFsv3hBK++fvpcEzTCy/0J+ci01KdA08iGKZW6rCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Khlj4VLtKqjFBm7HwKETffLDj0AF2HDrc4tq6eHwjHLduqJPKoyw+76q4rgSaKVLR
	 kc/fCk+4dG7KqLfYrpTLP6CmHYOZU0A7zoFt0CYxr6vA6fbaSXZAb9neQJruglIlrW
	 qp79QjEyXboI9rAYbLx/bvbsGhEWy+7Ki6yCtH0U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 12/72] media: i2c: hi847: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:20 +0300
Message-ID: <20250812214620.30425-13-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct hi847 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/hi847.c | 58 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 546833f5b5f5..384ccfc171c2 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022 Intel Corporation.
 
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
@@ -2166,6 +2167,8 @@ static const struct hi847_mode supported_modes[] = {
 };
 
 struct hi847 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -2244,7 +2247,6 @@ static int hi847_write_reg(struct hi847 *hi847, u16 reg, u16 len, u32 val)
 static int hi847_write_reg_list(struct hi847 *hi847,
 				const struct hi847_reg_list *r_list)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi847->sd);
 	unsigned int i;
 	int ret;
 
@@ -2253,7 +2255,7 @@ static int hi847_write_reg_list(struct hi847 *hi847,
 				      HI847_REG_VALUE_16BIT,
 				      r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(hi847->dev,
 					    "failed to write reg 0x%4.4x. error = %d",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -2408,7 +2410,6 @@ static int hi847_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct hi847 *hi847 = container_of(ctrl->handler,
 					     struct hi847, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&hi847->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -2424,7 +2425,7 @@ static int hi847_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(hi847->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -2466,7 +2467,7 @@ static int hi847_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(hi847->dev);
 
 	return ret;
 }
@@ -2557,7 +2558,6 @@ static void hi847_assign_pad_format(const struct hi847_mode *mode,
 
 static int hi847_start_streaming(struct hi847 *hi847)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi847->sd);
 	const struct hi847_reg_list *reg_list;
 	int link_freq_index, ret;
 
@@ -2565,14 +2565,14 @@ static int hi847_start_streaming(struct hi847 *hi847)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = hi847_write_reg_list(hi847, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(hi847->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &hi847->cur_mode->reg_list;
 	ret = hi847_write_reg_list(hi847, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(hi847->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -2587,7 +2587,7 @@ static int hi847_start_streaming(struct hi847 *hi847)
 			      HI847_REG_VALUE_16BIT, HI847_MODE_STREAMING);
 
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(hi847->dev, "failed to set stream");
 		return ret;
 	}
 
@@ -2596,28 +2596,25 @@ static int hi847_start_streaming(struct hi847 *hi847)
 
 static void hi847_stop_streaming(struct hi847 *hi847)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi847->sd);
-
 	if (hi847_write_reg(hi847, HI847_REG_MODE_TG,
 			    HI847_REG_VALUE_16BIT, HI847_REG_MODE_TG_DISABLE))
-		dev_err(&client->dev, "failed to set stream 0x%x",
+		dev_err(hi847->dev, "failed to set stream 0x%x",
 			HI847_REG_MODE_TG);
 
 	if (hi847_write_reg(hi847, HI847_REG_MODE_SELECT,
 			    HI847_REG_VALUE_16BIT, HI847_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream 0x%x",
+		dev_err(hi847->dev, "failed to set stream 0x%x",
 		HI847_REG_MODE_SELECT);
 }
 
 static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct hi847 *hi847 = to_hi847(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&hi847->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(hi847->dev);
 		if (ret) {
 			mutex_unlock(&hi847->mutex);
 			return ret;
@@ -2627,11 +2624,11 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			hi847_stop_streaming(hi847);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(hi847->dev);
 		}
 	} else {
 		hi847_stop_streaming(hi847);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(hi847->dev);
 	}
 
 	mutex_unlock(&hi847->mutex);
@@ -2768,7 +2765,6 @@ static const struct v4l2_subdev_internal_ops hi847_internal_ops = {
 
 static int hi847_identify_module(struct hi847 *hi847)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&hi847->sd);
 	int ret;
 	u32 val;
 
@@ -2778,7 +2774,7 @@ static int hi847_identify_module(struct hi847 *hi847)
 		return ret;
 
 	if (val != HI847_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(hi847->dev, "chip id mismatch: %x!=%x",
 			HI847_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -2862,7 +2858,7 @@ static void hi847_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(hi847->dev);
 	mutex_destroy(&hi847->mutex);
 }
 
@@ -2875,9 +2871,11 @@ static int hi847_probe(struct i2c_client *client)
 	if (!hi847)
 		return -ENOMEM;
 
-	ret = hi847_check_hwcfg(&client->dev);
+	hi847->dev = &client->dev;
+
+	ret = hi847_check_hwcfg(hi847->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to get HW configuration: %d",
+		dev_err(hi847->dev, "failed to get HW configuration: %d",
 			ret);
 		return ret;
 	}
@@ -2885,7 +2883,7 @@ static int hi847_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&hi847->sd, client, &hi847_subdev_ops);
 	ret = hi847_identify_module(hi847);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(hi847->dev, "failed to find sensor: %d", ret);
 		return ret;
 	}
 
@@ -2893,7 +2891,7 @@ static int hi847_probe(struct i2c_client *client)
 	hi847->cur_mode = &supported_modes[0];
 	ret = hi847_init_controls(hi847);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(hi847->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -2904,20 +2902,20 @@ static int hi847_probe(struct i2c_client *client)
 	hi847->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&hi847->sd.entity, 1, &hi847->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(hi847->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&hi847->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(hi847->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(hi847->dev);
+	pm_runtime_enable(hi847->dev);
+	pm_runtime_idle(hi847->dev);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart


