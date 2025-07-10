Return-Path: <linux-media+bounces-37375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC1B00A8F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1AF5C1815
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5942F365D;
	Thu, 10 Jul 2025 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mdWO5Eyb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD82F365A
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169774; cv=none; b=UxrEg3LcnBRe3oIFkYedVZREzVb+0XDdqjGAzaj6Ln0lFsD+e1j7pnTcdVlY+Fv16nw8psnAl81wHFJ1xwQwIZEKskdHvpFiNLU6crEuniHF9mxPLuHNTKQzvOLjtEsNm0Io7Vkod/MynNIw7fUf7s3M7qVnp23NzqtrVJjuh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169774; c=relaxed/simple;
	bh=p14WWzQBIuegYLxkZNVYhABdPQ3IMJ9rP/+RWpCxudA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGNOvA9cdJIyaAvKiCbK0VRiHppFmDSkqFSXWQD/sWg2xr+eE/f+3AVSsq5W/Km6wEM3rUjebG/Tee/IRp9LVdYU0CtLjI9NEeu8475GTkwC4MiPw+hdBdCWg051IecA0OQidyUVi1zFHtAKRnh06xxIxrm6aj1tdtTPsQxjoow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mdWO5Eyb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F0ECB2B;
	Thu, 10 Jul 2025 19:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169741;
	bh=p14WWzQBIuegYLxkZNVYhABdPQ3IMJ9rP/+RWpCxudA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdWO5EybO2sTcWe+SZGtpCFc0HzLAPpOeAkO7V2y9HqFABJ8LKUlF5I+wtEOzVFfh
	 R2W3myoyh4uZQ+z2TCQLrUy6Yh7wrl4O/iaBrCB3aEUS24TnTS971WmNl61O3Sx+Zy
	 /AcBE0/TdX6v4JtF0iO8LNfI68SA56u/6C/KACqs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH 32/72] media: i2c: ov02c10: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:28 +0300
Message-ID: <20250710174808.5361-33-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov02c10 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02c10.c | 69 +++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 089a4fd9627c..88ddfaaa1dea 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -373,6 +373,8 @@ static const char * const ov02c10_supply_names[] = {
 };
 
 struct ov02c10 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -418,7 +420,6 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov02c10 *ov02c10 = container_of(ctrl->handler,
 					     struct ov02c10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
 	const u32 height = supported_modes[0].height;
 	s64 exposure_max;
 	int ret = 0;
@@ -434,7 +435,7 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov02c10->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -467,7 +468,7 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02c10->dev);
 
 	return ret;
 }
@@ -478,7 +479,6 @@ static const struct v4l2_ctrl_ops ov02c10_ctrl_ops = {
 
 static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov02c10->ctrl_handler;
 	const struct ov02c10_mode *mode = &supported_modes[0];
 	u32 vblank_min, vblank_max, vblank_default, vts_def;
@@ -542,7 +542,7 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 				     ARRAY_SIZE(ov02c10_test_pattern_menu) - 1,
 				     0, 0, ov02c10_test_pattern_menu);
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov02c10->dev, &props);
 	if (ret)
 		return ret;
 
@@ -570,12 +570,11 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	const struct ov02c10_mode *mode = &supported_modes[0];
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	const struct reg_sequence *reg_sequence;
 	int ret, sequence_length;
 
-	ret = pm_runtime_resume_and_get(&client->dev);
+	ret = pm_runtime_resume_and_get(ov02c10->dev);
 	if (ret)
 		return ret;
 
@@ -584,7 +583,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	ret = regmap_multi_reg_write(ov02c10->regmap,
 				     reg_sequence, sequence_length);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(ov02c10->dev, "failed to set mode\n");
 		goto out;
 	}
 
@@ -593,7 +592,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	ret = regmap_multi_reg_write(ov02c10->regmap,
 				     reg_sequence, sequence_length);
 	if (ret) {
-		dev_err(&client->dev, "failed to write lane settings\n");
+		dev_err(ov02c10->dev, "failed to write lane settings\n");
 		goto out;
 	}
 
@@ -604,7 +603,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 out:
 	if (ret)
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov02c10->dev);
 
 	return ret;
 }
@@ -613,11 +612,10 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   u32 pad, u64 streams_mask)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02c10->dev);
 
 	return 0;
 }
@@ -778,7 +776,6 @@ static const struct v4l2_subdev_internal_ops ov02c10_internal_ops = {
 
 static int ov02c10_identify_module(struct ov02c10 *ov02c10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
 	u64 chip_id;
 	int ret;
 
@@ -787,7 +784,7 @@ static int ov02c10_identify_module(struct ov02c10 *ov02c10)
 		return ret;
 
 	if (chip_id != OV02C10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx",
+		dev_err(ov02c10->dev, "chip id mismatch: %x!=%llx",
 			OV02C10_CHIP_ID, chip_id);
 		return -ENXIO;
 	}
@@ -795,11 +792,12 @@ static int ov02c10_identify_module(struct ov02c10 *ov02c10)
 	return 0;
 }
 
-static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
+static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	struct device *dev = ov02c10->dev;
 	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
 	unsigned long link_freq_bitmap;
 	u32 mclk;
@@ -873,15 +871,16 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 static void ov02c10_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev)) {
-		ov02c10_power_off(&client->dev);
-		pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov02c10->dev);
+	if (!pm_runtime_status_suspended(ov02c10->dev)) {
+		ov02c10_power_off(ov02c10->dev);
+		pm_runtime_set_suspended(ov02c10->dev);
 	}
 }
 
@@ -894,14 +893,16 @@ static int ov02c10_probe(struct i2c_client *client)
 	if (!ov02c10)
 		return -ENOMEM;
 
+	ov02c10->dev = &client->dev;
+
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
 	/* Check HW config */
-	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
+	ret = ov02c10_check_hwcfg(ov02c10);
 	if (ret)
 		return ret;
 
-	ret = ov02c10_get_pm_resources(&client->dev);
+	ret = ov02c10_get_pm_resources(ov02c10->dev);
 	if (ret)
 		return ret;
 
@@ -909,21 +910,21 @@ static int ov02c10_probe(struct i2c_client *client)
 	if (IS_ERR(ov02c10->regmap))
 		return PTR_ERR(ov02c10->regmap);
 
-	ret = ov02c10_power_on(&client->dev);
+	ret = ov02c10_power_on(ov02c10->dev);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "failed to power on\n");
+		dev_err_probe(ov02c10->dev, ret, "failed to power on\n");
 		return ret;
 	}
 
 	ret = ov02c10_identify_module(ov02c10);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(ov02c10->dev, "failed to find sensor: %d", ret);
 		goto probe_error_power_off;
 	}
 
 	ret = ov02c10_init_controls(ov02c10);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(ov02c10->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -934,33 +935,33 @@ static int ov02c10_probe(struct i2c_client *client)
 	ov02c10->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov02c10->sd.entity, 1, &ov02c10->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov02c10->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&ov02c10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		dev_err(ov02c10->dev, "failed to init subdev: %d", ret);
 		goto probe_error_media_entity_cleanup;
 	}
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
+	pm_runtime_set_active(ov02c10->dev);
+	pm_runtime_enable(ov02c10->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov02c10->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_v4l2_subdev_cleanup;
 	}
 
-	pm_runtime_idle(&client->dev);
+	pm_runtime_idle(ov02c10->dev);
 	return 0;
 
 probe_error_v4l2_subdev_cleanup:
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov02c10->dev);
+	pm_runtime_set_suspended(ov02c10->dev);
 	v4l2_subdev_cleanup(&ov02c10->sd);
 
 probe_error_media_entity_cleanup:
@@ -970,7 +971,7 @@ static int ov02c10_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
 
 probe_error_power_off:
-	ov02c10_power_off(&client->dev);
+	ov02c10_power_off(ov02c10->dev);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


