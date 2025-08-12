Return-Path: <linux-media+bounces-39660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D7B23B11
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82138568B32
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C65E2E265D;
	Tue, 12 Aug 2025 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bm9gibK8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BB2D739E
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035242; cv=none; b=Qp1AsGV7h/Lv1nKjIWVnzb5xCsEGCuDnvdv6eQY25cEuIT1TVBnc+8Z9OqquanxvoFSWACNBgGsHkmlkkRmJqQ4i0kgm8P9gLqna13JVaO7AHbRrQ/1yX+vcHFmUlGkTJrvAkpYsUb6+EFvsxH9f/YI+EuejJLUJ7l50AmQVGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035242; c=relaxed/simple;
	bh=g9UVAIA/rqr1X42OOFTFkAygbMiUyHJHwsyXplRHD4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unbWIUe6TTjTQ16B4vYJbXn3KN48pGnf1Xa4a0jmFxj4q8qNpgXwJo34v/W0uPqdOF9P19gbSDl36niJt90mXeX2t+7FS3hp8Ys0Xb4VqUj8YUamrUouE/Oy5TeX5hDTVE230kLepAQKjuH5XVJ8MkarAlI3xxzNg7aRWFtNM2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bm9gibK8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2A3514A4;
	Tue, 12 Aug 2025 23:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035186;
	bh=g9UVAIA/rqr1X42OOFTFkAygbMiUyHJHwsyXplRHD4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bm9gibK846bTK1HIP2lgAYSEW52/8E/Liw6A+jsYk1G4zaNOva85k9tTTFf9HLnxA
	 7C3Azk9Gg8cNPeDk0FtORvTQKp5dD5scAqwxj8IgloAOOmMnfyzGqTexsD3NEZSrpq
	 JUFCR8EolvRaaN7jGGXwVGVX87q78PsVVEKFQbiE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 24/72] media: i2c: ov02e10: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:32 +0300
Message-ID: <20250812214620.30425-25-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov02e10 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02e10.c | 67 +++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index d74dc62e189d..3dcb169dfaa3 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -226,6 +226,8 @@ static const char * const ov02e10_supply_names[] = {
 };
 
 struct ov02e10 {
+	struct device *dev;
+
 	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -288,7 +290,6 @@ static int ov02e10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov02e10 *ov02e10 = container_of(ctrl->handler,
 					       struct ov02e10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
 	s64 exposure_max;
 	int ret;
 
@@ -307,7 +308,7 @@ static int ov02e10_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov02e10->dev))
 		return 0;
 
 	ret = cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
@@ -363,7 +364,7 @@ static int ov02e10_set_ctrl(struct v4l2_ctrl *ctrl)
 	cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
 		  OV02E10_COMMAND_UPDATE, &ret);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02e10->dev);
 
 	return ret;
 }
@@ -374,7 +375,6 @@ static const struct v4l2_ctrl_ops ov02e10_ctrl_ops = {
 
 static int ov02e10_init_controls(struct ov02e10 *ov02e10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov02e10->ctrl_handler;
 	const struct ov02e10_mode *mode = ov02e10->cur_mode;
 	u32 vblank_min, vblank_max, vblank_def;
@@ -442,7 +442,7 @@ static int ov02e10_init_controls(struct ov02e10 *ov02e10)
 				     ARRAY_SIZE(ov02e10_test_pattern_menu) - 1,
 				     0, 0, ov02e10_test_pattern_menu);
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov02e10->dev, &props);
 	if (ret)
 		return ret;
 
@@ -481,12 +481,11 @@ static int ov02e10_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  u32 pad, u64 streams_mask)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov02e10 *ov02e10 = to_ov02e10(sd);
 	const struct reg_sequence_list *reg_list;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&client->dev);
+	ret = pm_runtime_resume_and_get(ov02e10->dev);
 	if (ret)
 		return ret;
 
@@ -494,7 +493,7 @@ static int ov02e10_enable_streams(struct v4l2_subdev *sd,
 	ret = regmap_multi_reg_write(ov02e10->regmap, reg_list->regs,
 				     reg_list->num_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(ov02e10->dev, "failed to set mode\n");
 		goto out;
 	}
 
@@ -506,7 +505,7 @@ static int ov02e10_enable_streams(struct v4l2_subdev *sd,
 
 out:
 	if (ret)
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov02e10->dev);
 
 	return ret;
 }
@@ -515,11 +514,10 @@ static int ov02e10_disable_streams(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   u32 pad, u64 streams_mask)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov02e10 *ov02e10 = to_ov02e10(sd);
 
 	ov02e10_set_stream_mode(ov02e10, 0);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02e10->dev);
 
 	return 0;
 }
@@ -724,7 +722,6 @@ static const struct v4l2_subdev_internal_ops ov02e10_internal_ops = {
 
 static int ov02e10_identify_module(struct ov02e10 *ov02e10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
 	int ret;
 	u64 val;
 
@@ -735,7 +732,7 @@ static int ov02e10_identify_module(struct ov02e10 *ov02e10)
 		return ret;
 
 	if (val != OV02E10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(ov02e10->dev, "chip id mismatch: %x!=%x\n",
 			OV02E10_CHIP_ID, (u32)val);
 		return -ENXIO;
 	}
@@ -743,11 +740,12 @@ static int ov02e10_identify_module(struct ov02e10 *ov02e10)
 	return 0;
 }
 
-static int ov02e10_check_hwcfg(struct device *dev, struct ov02e10 *ov02e10)
+static int ov02e10_check_hwcfg(struct ov02e10 *ov02e10)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	struct device *dev = ov02e10->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned long link_freq_bitmap;
@@ -823,16 +821,17 @@ static int ov02e10_check_hwcfg(struct device *dev, struct ov02e10 *ov02e10)
 static void ov02e10_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov02e10->dev);
 
-	if (!pm_runtime_status_suspended(&client->dev)) {
-		ov02e10_power_off(&client->dev);
-		pm_runtime_set_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(ov02e10->dev)) {
+		ov02e10_power_off(ov02e10->dev);
+		pm_runtime_set_suspended(ov02e10->dev);
 	}
 }
 
@@ -845,10 +844,12 @@ static int ov02e10_probe(struct i2c_client *client)
 	if (!ov02e10)
 		return -ENOMEM;
 
+	ov02e10->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&ov02e10->sd, client, &ov02e10_subdev_ops);
 
 	/* Check HW config */
-	ret = ov02e10_check_hwcfg(&client->dev, ov02e10);
+	ret = ov02e10_check_hwcfg(ov02e10);
 	if (ret)
 		return ret;
 
@@ -857,27 +858,27 @@ static int ov02e10_probe(struct i2c_client *client)
 	if (IS_ERR(ov02e10->regmap))
 		return PTR_ERR(ov02e10->regmap);
 
-	ret = ov02e10_get_pm_resources(&client->dev);
+	ret = ov02e10_get_pm_resources(ov02e10->dev);
 	if (ret)
 		return ret;
 
-	ret = ov02e10_power_on(&client->dev);
+	ret = ov02e10_power_on(ov02e10->dev);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "failed to power on\n");
+		dev_err_probe(ov02e10->dev, ret, "failed to power on\n");
 		return ret;
 	}
 
 	/* Check module identity */
 	ret = ov02e10_identify_module(ov02e10);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		dev_err(ov02e10->dev, "failed to find sensor: %d\n", ret);
 		goto probe_error_power_off;
 	}
 
 	ov02e10->cur_mode = &supported_modes[0];
 	ret = ov02e10_init_controls(ov02e10);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d\n", ret);
+		dev_err(ov02e10->dev, "failed to init controls: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -891,33 +892,33 @@ static int ov02e10_probe(struct i2c_client *client)
 	ov02e10->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov02e10->sd.entity, 1, &ov02e10->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov02e10->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ov02e10->sd.state_lock = ov02e10->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&ov02e10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		dev_err(ov02e10->dev, "failed to init subdev: %d", ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
+	pm_runtime_set_active(ov02e10->dev);
+	pm_runtime_enable(ov02e10->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov02e10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov02e10->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_v4l2_subdev_cleanup;
 	}
 
-	pm_runtime_idle(&client->dev);
+	pm_runtime_idle(ov02e10->dev);
 	return 0;
 
 probe_error_v4l2_subdev_cleanup:
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov02e10->dev);
+	pm_runtime_set_suspended(ov02e10->dev);
 	v4l2_subdev_cleanup(&ov02e10->sd);
 
 probe_error_media_entity_cleanup:
@@ -927,7 +928,7 @@ static int ov02e10_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov02e10->sd.ctrl_handler);
 
 probe_error_power_off:
-	ov02e10_power_off(&client->dev);
+	ov02e10_power_off(ov02e10->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


