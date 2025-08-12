Return-Path: <linux-media+bounces-39662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7AB23B00
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D0F1AA5D26
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AFD2D8363;
	Tue, 12 Aug 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwXbNmgp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082972D73B8
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035245; cv=none; b=LYPwCWl1mFSEr6Vd4NApZe6lGS0fl18OBplqWPE6z3qFCb0JH060ZCWLNDWHzFDdwKBFy1e0ntXy/X5u9hR4p/LYpzk85bd/sjhZZwQM4798zPS3AFMCtXosXjv03Mawc4ErS724T+5OeyZi3W2qrSPfru/8EToNKt4RdO/sTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035245; c=relaxed/simple;
	bh=wmOsI0IEHaXWBWF93a0+YpINBdaB5RMuZI+j25hXcUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W13UIGDXZ3bDlZoOFqSs8I/LAZ10azVCnpd3jpEnXvQ02JSXsi+NwhK+YutzGdZqxh4Is2/EYQEo5TnW0GHLs/8Wj0kLwPCD638zDMjd+iVatuNsNHZ2BTQYEjsezRYTIsljfCRIpBXAWDtjg2D06+hNKDvlCN9jcJcM9ZlvY3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QwXbNmgp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9FD341123;
	Tue, 12 Aug 2025 23:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035189;
	bh=wmOsI0IEHaXWBWF93a0+YpINBdaB5RMuZI+j25hXcUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwXbNmgp4zDMCcGwIto9AhMqoyRwhrlN/cL+FSC4qkh+I10TgM8yGxJk18BBkyZZY
	 aJOutjfq8aRgBe69Pf+GU8HK4HmgaWmU4XuzyQWRQcf1U0ZiXkf/1fqQ4RFRDXevMg
	 rn+RYDRRn3rRROXZrjFSwgguVyUrIDnj5HgUZly0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jimmy Su <jimmy.su@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 26/72] media: i2c: ov08d10: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:34 +0300
Message-ID: <20250812214620.30425-27-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov08d10 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov08d10.c | 59 +++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 1bacbdfa4298..2523adcaacf7 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -515,6 +515,8 @@ static const char * const ov08d10_test_pattern_menu[] = {
 };
 
 struct ov08d10 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -663,7 +665,7 @@ static int ov08d10_write_reg_list(struct ov08d10 *ov08d10,
 		ret = i2c_smbus_write_byte_data(client, r_list->regs[i].address,
 						r_list->regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov08d10->dev,
 					    "failed to write reg 0x%2.2x. error = %d",
 					    r_list->regs[i].address, ret);
 			return ret;
@@ -849,7 +851,6 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov08d10 *ov08d10 = container_of(ctrl->handler,
 					     struct ov08d10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08d10->sd);
 	s64 exposure_max;
 	int ret;
 
@@ -865,7 +866,7 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov08d10->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -901,7 +902,7 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov08d10->dev);
 
 	return ret;
 }
@@ -1025,32 +1026,32 @@ static int ov08d10_start_streaming(struct ov08d10 *ov08d10)
 	/* soft reset */
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x00);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor");
 		return ret;
 	}
 	ret = i2c_smbus_write_byte_data(client, 0x20, 0x0e);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor");
 		return ret;
 	}
 	usleep_range(3000, 4000);
 	ret = i2c_smbus_write_byte_data(client, 0x20, 0x0b);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor");
 		return ret;
 	}
 
 	/* update sensor setting */
 	ret = ov08d10_write_reg_list(ov08d10, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(ov08d10->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &ov08d10->cur_mode->reg_list;
 	ret = ov08d10_write_reg_list(ov08d10, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(ov08d10->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -1077,19 +1078,19 @@ static void ov08d10_stop_streaming(struct ov08d10 *ov08d10)
 
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x00);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming");
 		return;
 	}
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_MODE_SELECT,
 					OV08D10_MODE_STANDBY);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming");
 		return;
 	}
 
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x01);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming");
 		return;
 	}
 }
@@ -1097,12 +1098,11 @@ static void ov08d10_stop_streaming(struct ov08d10 *ov08d10)
 static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov08d10 *ov08d10 = to_ov08d10(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov08d10->mutex);
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov08d10->dev);
 		if (ret < 0) {
 			mutex_unlock(&ov08d10->mutex);
 			return ret;
@@ -1112,11 +1112,11 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret) {
 			enable = 0;
 			ov08d10_stop_streaming(ov08d10);
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov08d10->dev);
 		}
 	} else {
 		ov08d10_stop_streaming(ov08d10);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov08d10->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1293,7 +1293,7 @@ static int ov08d10_identify_module(struct ov08d10 *ov08d10)
 	chip_id = val | ret;
 
 	if ((chip_id & OV08D10_ID_MASK) != OV08D10_CHIP_ID) {
-		dev_err(&client->dev, "unexpected sensor id(0x%04x)\n",
+		dev_err(ov08d10->dev, "unexpected sensor id(0x%04x)\n",
 			chip_id);
 		return -EINVAL;
 	}
@@ -1301,8 +1301,9 @@ static int ov08d10_identify_module(struct ov08d10 *ov08d10)
 	return 0;
 }
 
-static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10, struct device *dev)
+static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10)
 {
+	struct device *dev = ov08d10->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1380,7 +1381,7 @@ static void ov08d10_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov08d10->dev);
 	mutex_destroy(&ov08d10->mutex);
 }
 
@@ -1393,9 +1394,11 @@ static int ov08d10_probe(struct i2c_client *client)
 	if (!ov08d10)
 		return -ENOMEM;
 
-	ret = ov08d10_get_hwcfg(ov08d10, &client->dev);
+	ov08d10->dev = &client->dev;
+
+	ret = ov08d10_get_hwcfg(ov08d10);
 	if (ret) {
-		dev_err(&client->dev, "failed to get HW configuration: %d",
+		dev_err(ov08d10->dev, "failed to get HW configuration: %d",
 			ret);
 		return ret;
 	}
@@ -1404,7 +1407,7 @@ static int ov08d10_probe(struct i2c_client *client)
 
 	ret = ov08d10_identify_module(ov08d10);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
 		return ret;
 	}
 
@@ -1412,7 +1415,7 @@ static int ov08d10_probe(struct i2c_client *client)
 	ov08d10->cur_mode = &ov08d10->priv_lane->sp_modes[0];
 	ret = ov08d10_init_controls(ov08d10);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(ov08d10->dev, "failed to init controls: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1422,13 +1425,13 @@ static int ov08d10_probe(struct i2c_client *client)
 	ov08d10->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov08d10->sd.entity, 1, &ov08d10->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov08d10->dev, "failed to init entity pads: %d", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
@@ -1437,9 +1440,9 @@ static int ov08d10_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(ov08d10->dev);
+	pm_runtime_enable(ov08d10->dev);
+	pm_runtime_idle(ov08d10->dev);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart


