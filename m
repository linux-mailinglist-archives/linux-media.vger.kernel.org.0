Return-Path: <linux-media+bounces-37385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BAB00A9A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C5A3ADFB2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA90A2F3C33;
	Thu, 10 Jul 2025 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I8ibw2Q4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905CB2F2359
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169791; cv=none; b=NnRGWgehGxM4tEnaaPe8gzURBMk+3Tt3shdF/omu1dYJKfcii619HJISv3qnZOFm/RW7lfrzzb4nzeIaDhhfMQO8UtYRra0lFeuZZFysBwntHaXSYLZBXMnulabYH660mFSw7g7Sqg21bbgw+qrrKJ1gBJjUv8qzFsortWf3EH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169791; c=relaxed/simple;
	bh=iImIYfXnhGJXo2w8jGCymyqixjLNmVHNoj36uGsxSDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brFhHQhOhtz8aX0ZtPII7DjFBRAxMrnPU6LEY3c563Ya1MSJaxGaGabzm4TXovkY+6acIyeakDh+9Oqp/9VIDnmJ+uvW0A9v3i3VtgPpe82y5t1vc2gj2A2W5HCw5T07IRqZKvvM/Ry1DoDK0jrK5+rX7EiZ0FWDOHHDWo/ylJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I8ibw2Q4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 18EC8111D;
	Thu, 10 Jul 2025 19:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169758;
	bh=iImIYfXnhGJXo2w8jGCymyqixjLNmVHNoj36uGsxSDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8ibw2Q4ESyJSVi65tW/RwL41yiU5gnL3f5qS3PphFCBwoEr2B/G6xyE6yc85ddbT
	 6B+ItjE3J9c4/PciI+ASuivrknGzEmXvUfNBaWBdQxMa/9Wrtiie0T9A6Zwuo+IBMW
	 mPQtHZDBmS/3I1TmIbQWxpc9xjiVwh4xukAEKzEA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 42/72] media: i2c: ov13b10: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:38 +0300
Message-ID: <20250710174808.5361-43-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov13b10 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov13b10.c | 89 ++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index e85c7d33a670..3f17cdd9f42c 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -700,6 +700,8 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
 };
 
 struct ov13b10 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -805,7 +807,6 @@ static int ov13b10_write_reg(struct ov13b10 *ov13b,
 static int ov13b10_write_regs(struct ov13b10 *ov13b,
 			      const struct ov13b10_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	int ret;
 	u32 i;
 
@@ -813,7 +814,7 @@ static int ov13b10_write_regs(struct ov13b10 *ov13b,
 		ret = ov13b10_write_reg(ov13b, regs[i].address, 1,
 					regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(ov13b->dev,
 					    "Failed to write reg 0x%4.4x. error = %d\n",
 					    regs[i].address, ret);
 
@@ -968,7 +969,6 @@ static int ov13b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov13b10 *ov13b = container_of(ctrl->handler,
 					     struct ov13b10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	s64 max;
 	int ret;
 
@@ -987,7 +987,7 @@ static int ov13b10_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov13b->dev))
 		return 0;
 
 	ret = 0;
@@ -1021,13 +1021,13 @@ static int ov13b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ov13b10_set_ctrl_vflip(ov13b, ctrl->val);
 		break;
 	default:
-		dev_info(&client->dev,
+		dev_info(ov13b->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
 			 ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov13b->dev);
 
 	return ret;
 }
@@ -1166,7 +1166,6 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 /* Verify chip ID */
 static int ov13b10_identify_module(struct ov13b10 *ov13b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	int ret;
 	u32 val;
 
@@ -1179,7 +1178,7 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
 		return ret;
 
 	if (val != OV13B10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(ov13b->dev, "chip id mismatch: %x!=%x\n",
 			OV13B10_CHIP_ID, val);
 		return -EIO;
 	}
@@ -1234,7 +1233,6 @@ static int ov13b10_power_on(struct device *dev)
 
 static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	const struct ov13b10_reg_list *reg_list;
 	int ret, link_freq_index;
 
@@ -1246,7 +1244,7 @@ static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 	ret = ov13b10_write_reg(ov13b, OV13B10_REG_SOFTWARE_RST,
 				OV13B10_REG_VALUE_08BIT, OV13B10_SOFTWARE_RST);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set powerup registers\n",
+		dev_err(ov13b->dev, "%s failed to set powerup registers\n",
 			__func__);
 		return ret;
 	}
@@ -1255,7 +1253,7 @@ static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov13b10_write_reg_list(ov13b, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(ov13b->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
@@ -1263,7 +1261,7 @@ static int ov13b10_start_streaming(struct ov13b10 *ov13b)
 	reg_list = &ov13b->cur_mode->reg_list;
 	ret = ov13b10_write_reg_list(ov13b, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(ov13b->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
@@ -1287,13 +1285,12 @@ static int ov13b10_stop_streaming(struct ov13b10 *ov13b)
 static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov13b10 *ov13b = to_ov13b10(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov13b->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov13b->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -1306,7 +1303,7 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		ov13b10_stop_streaming(ov13b);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov13b->dev);
 	}
 
 	mutex_unlock(&ov13b->mutex);
@@ -1314,7 +1311,7 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov13b->dev);
 err_unlock:
 	mutex_unlock(&ov13b->mutex);
 
@@ -1360,7 +1357,6 @@ static const struct v4l2_subdev_internal_ops ov13b10_internal_ops = {
 /* Initialize control handlers */
 static int ov13b10_init_controls(struct ov13b10 *ov13b)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
@@ -1443,12 +1439,12 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
+		dev_err(ov13b->dev, "%s control init failed (%d)\n",
 			__func__, ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov13b->dev, &props);
 	if (ret)
 		goto error;
 
@@ -1474,39 +1470,38 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
 	mutex_destroy(&ov13b->mutex);
 }
 
-static int ov13b10_get_pm_resources(struct device *dev)
+static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov13b10 *ov13b = to_ov13b10(sd);
 	int ret;
 
-	ov13b->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ov13b->reset))
-		return dev_err_probe(dev, PTR_ERR(ov13b->reset),
+		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
 				     "failed to get reset gpio\n");
 
-	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
+	ov13b->img_clk = devm_clk_get_optional(ov13b->dev, NULL);
 	if (IS_ERR(ov13b->img_clk))
-		return dev_err_probe(dev, PTR_ERR(ov13b->img_clk),
+		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov13b->avdd = devm_regulator_get_optional(dev, "avdd");
+	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
 	if (IS_ERR(ov13b->avdd)) {
 		ret = PTR_ERR(ov13b->avdd);
 		ov13b->avdd = NULL;
 		if (ret != -ENODEV)
-			return dev_err_probe(dev, ret,
+			return dev_err_probe(ov13b->dev, ret,
 					     "failed to get avdd regulator\n");
 	}
 
 	return 0;
 }
 
-static int ov13b10_check_hwcfg(struct device *dev, struct ov13b10 *ov13b)
+static int ov13b10_check_hwcfg(struct ov13b10 *ov13b)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	struct device *dev = ov13b->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned int i, j;
@@ -1602,32 +1597,34 @@ static int ov13b10_probe(struct i2c_client *client)
 	if (!ov13b)
 		return -ENOMEM;
 
+	ov13b->dev = &client->dev;
+
 	/* Check HW config */
-	ret = ov13b10_check_hwcfg(&client->dev, ov13b);
+	ret = ov13b10_check_hwcfg(ov13b);
 	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
+		dev_err(ov13b->dev, "failed to check hwcfg: %d", ret);
 		return ret;
 	}
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
 
-	ret = ov13b10_get_pm_resources(&client->dev);
+	ret = ov13b10_get_pm_resources(ov13b);
 	if (ret)
 		return ret;
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(ov13b->dev);
 	if (full_power) {
-		ret = ov13b10_power_on(&client->dev);
+		ret = ov13b10_power_on(ov13b->dev);
 		if (ret) {
-			dev_err(&client->dev, "failed to power on\n");
+			dev_err(ov13b->dev, "failed to power on\n");
 			return ret;
 		}
 
 		/* Check module identity */
 		ret = ov13b10_identify_module(ov13b);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+			dev_err(ov13b->dev, "failed to find sensor: %d\n", ret);
 			goto error_power_off;
 		}
 	}
@@ -1646,7 +1643,7 @@ static int ov13b10_probe(struct i2c_client *client)
 	ov13b->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov13b->sd.entity, 1, &ov13b->pad);
 	if (ret) {
-		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+		dev_err(ov13b->dev, "%s failed:%d\n", __func__, ret);
 		goto error_handler_free;
 	}
 
@@ -1657,9 +1654,9 @@ static int ov13b10_probe(struct i2c_client *client)
 	 */
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(ov13b->dev);
+	pm_runtime_enable(ov13b->dev);
+	pm_runtime_idle(ov13b->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov13b->sd);
 	if (ret < 0)
@@ -1668,17 +1665,17 @@ static int ov13b10_probe(struct i2c_client *client)
 	return 0;
 
 error_media_entity_runtime_pm:
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov13b->dev);
 	if (full_power)
-		pm_runtime_set_suspended(&client->dev);
+		pm_runtime_set_suspended(ov13b->dev);
 	media_entity_cleanup(&ov13b->sd.entity);
 
 error_handler_free:
 	ov13b10_free_controls(ov13b);
-	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+	dev_err(ov13b->dev, "%s failed:%d\n", __func__, ret);
 
 error_power_off:
-	ov13b10_power_off(&client->dev);
+	ov13b10_power_off(ov13b->dev);
 
 	return ret;
 }
@@ -1692,8 +1689,8 @@ static void ov13b10_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	ov13b10_free_controls(ov13b);
 
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov13b->dev);
+	pm_runtime_set_suspended(ov13b->dev);
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
-- 
Regards,

Laurent Pinchart


