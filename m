Return-Path: <linux-media+bounces-37403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0559B00AAA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F183E5C2BF5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C942D2F19A9;
	Thu, 10 Jul 2025 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eAv55/c3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3812F2C51
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169819; cv=none; b=OPSqeN1Z5l7adJICDCp/fubwJA3kbZFrJHDyPETMl2LL1tPkAePGMtz0S6hYSGhR6Z/XPX9J6EO2+O9gXdD0+hsL6A5LPb8tt9Re6Wgp6gtYP2mF3fY1+Hfws0COD8pdCsO9fYACZ7xf1u9waZlxyZltNnBhU0WI4rivjFREQN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169819; c=relaxed/simple;
	bh=lvk3r/Y9AYITfyox2gonot8Gbz4i6XqKzryuMDRhPkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPC5KalyVnqaKfpWQVZOh8V/QSjFJmbf6gDWBAlvIL2Gn2SEZrK42gaBdt6vHNLC7gWh5p0zghH+uc26Y7zplQNSMy0Zozm5T5YiFTpzr1VmUL8c4n7H9LRw9uenIrceJuTHrlRJ3FG16RCy3kEH18TDMMzCQtxsZw6bMvTskLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eAv55/c3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 357ED1A9A;
	Thu, 10 Jul 2025 19:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169787;
	bh=lvk3r/Y9AYITfyox2gonot8Gbz4i6XqKzryuMDRhPkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAv55/c3vVpGfZ2A1IAk7nZQ4ECVORYqneJsQpXd8t4WbgbGPNN7VM1YvijLo2EWV
	 K4Wsn3/bxiLUbmNwTasl3Jxy3RvWx5q5gYQ2tBqbcWip6PXT8SD78tRBvbCnz5sL1e
	 cU9PFpnjURCWrWHOCjg2LxeNTmNB7RghWVbNl1gM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 60/72] media: i2c: imx258: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:56 +0300
Message-ID: <20250710174808.5361-61-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct imx258 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 100 ++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 9e30fce1f223..88d0d7f9d4be 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -8,11 +8,12 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
-#include <linux/unaligned.h>
 
 #define IMX258_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define IMX258_MODE_STANDBY		0x00
@@ -645,6 +646,8 @@ static const struct imx258_mode supported_modes[] = {
 };
 
 struct imx258 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regmap *regmap;
@@ -751,7 +754,6 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx258 *imx258 =
 		container_of(ctrl->handler, struct imx258, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	int ret = 0;
 
 	/*
@@ -765,7 +767,7 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (pm_runtime_get_if_in_use(&client->dev) == 0)
+	if (pm_runtime_get_if_in_use(imx258->dev) == 0)
 		return 0;
 
 	switch (ctrl->id) {
@@ -811,14 +813,14 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 				NULL);
 		break;
 	default:
-		dev_info(&client->dev,
+		dev_info(imx258->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
 			 ctrl->id, ctrl->val);
 		ret = -EINVAL;
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx258->dev);
 
 	return ret;
 }
@@ -1013,14 +1015,13 @@ static int imx258_get_selection(struct v4l2_subdev *sd,
 /* Start streaming */
 static int imx258_start_streaming(struct imx258 *imx258)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	const struct imx258_reg_list *reg_list;
 	const struct imx258_link_freq_config *link_freq_cfg;
 	int ret, link_freq_index;
 
 	ret = cci_write(imx258->regmap, IMX258_REG_RESET, 0x01, NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to reset sensor\n", __func__);
+		dev_err(imx258->dev, "%s failed to reset sensor\n", __func__);
 		return ret;
 	}
 
@@ -1034,21 +1035,21 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	reg_list = &link_freq_cfg->link_cfg[imx258->lane_mode_idx].reg_list;
 	ret = cci_multi_reg_write(imx258->regmap, reg_list->regs, reg_list->num_of_regs, NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(imx258->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
 	ret = cci_multi_reg_write(imx258->regmap, mode_common_regs,
 				  ARRAY_SIZE(mode_common_regs), NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set common regs\n", __func__);
+		dev_err(imx258->dev, "%s failed to set common regs\n", __func__);
 		return ret;
 	}
 
 	ret = cci_multi_reg_write(imx258->regmap, imx258->variant_cfg->regs,
 				  imx258->variant_cfg->num_regs, NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set variant config\n",
+		dev_err(imx258->dev, "%s failed to set variant config\n",
 			__func__);
 		return ret;
 	}
@@ -1057,7 +1058,7 @@ static int imx258_start_streaming(struct imx258 *imx258)
 			!!(imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK),
 			NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set clock lane mode\n", __func__);
+		dev_err(imx258->dev, "%s failed to set clock lane mode\n", __func__);
 		return ret;
 	}
 
@@ -1065,7 +1066,7 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	reg_list = &imx258->cur_mode->reg_list;
 	ret = cci_multi_reg_write(imx258->regmap, reg_list->regs, reg_list->num_of_regs, NULL);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(imx258->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
@@ -1082,14 +1083,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
 /* Stop streaming */
 static int imx258_stop_streaming(struct imx258 *imx258)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	int ret;
 
 	/* set stream off register */
 	ret = cci_write(imx258->regmap, IMX258_REG_MODE_SELECT,
 			IMX258_MODE_STANDBY, NULL);
 	if (ret)
-		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+		dev_err(imx258->dev, "%s failed to set stream\n", __func__);
 
 	/*
 	 * Return success even if it was an error, as there is nothing the
@@ -1135,13 +1135,12 @@ static int imx258_power_off(struct device *dev)
 static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx258 *imx258 = to_imx258(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&imx258->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(imx258->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -1154,7 +1153,7 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx258_stop_streaming(imx258);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(imx258->dev);
 	}
 
 	mutex_unlock(&imx258->mutex);
@@ -1162,7 +1161,7 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx258->dev);
 err_unlock:
 	mutex_unlock(&imx258->mutex);
 
@@ -1172,20 +1171,19 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 /* Verify chip ID */
 static int imx258_identify_module(struct imx258 *imx258)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	int ret;
 	u64 val;
 
 	ret = cci_read(imx258->regmap, IMX258_REG_CHIP_ID,
 		       &val, NULL);
 	if (ret) {
-		dev_err(&client->dev, "failed to read chip id %x\n",
+		dev_err(imx258->dev, "failed to read chip id %x\n",
 			IMX258_CHIP_ID);
 		return ret;
 	}
 
 	if (val != IMX258_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
+		dev_err(imx258->dev, "chip id mismatch: %x!=%llx\n",
 			IMX258_CHIP_ID, val);
 		return -EIO;
 	}
@@ -1217,7 +1215,6 @@ static const struct v4l2_subdev_internal_ops imx258_internal_ops = {
 /* Initialize control handlers */
 static int imx258_init_controls(struct imx258 *imx258)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	const struct imx258_link_freq_config *link_freq_cfgs;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
@@ -1308,12 +1305,12 @@ static int imx258_init_controls(struct imx258 *imx258)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
+		dev_err(imx258->dev, "%s control init failed (%d)\n",
 				__func__, ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(imx258->dev, &props);
 	if (ret)
 		goto error;
 
@@ -1339,15 +1336,14 @@ static void imx258_free_controls(struct imx258 *imx258)
 	mutex_destroy(&imx258->mutex);
 }
 
-static int imx258_get_regulators(struct imx258 *imx258,
-				 struct i2c_client *client)
+static int imx258_get_regulators(struct imx258 *imx258)
 {
 	unsigned int i;
 
 	for (i = 0; i < IMX258_NUM_SUPPLIES; i++)
 		imx258->supplies[i].supply = imx258_supply_name[i];
 
-	return devm_regulator_bulk_get(&client->dev,
+	return devm_regulator_bulk_get(imx258->dev,
 				    IMX258_NUM_SUPPLIES, imx258->supplies);
 }
 
@@ -1365,27 +1361,29 @@ static int imx258_probe(struct i2c_client *client)
 	if (!imx258)
 		return -ENOMEM;
 
+	imx258->dev = &client->dev;
+
 	imx258->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx258->regmap)) {
 		ret = PTR_ERR(imx258->regmap);
-		dev_err(&client->dev, "failed to initialize CCI: %d\n", ret);
+		dev_err(imx258->dev, "failed to initialize CCI: %d\n", ret);
 		return ret;
 	}
 
-	ret = imx258_get_regulators(imx258, client);
+	ret = imx258_get_regulators(imx258);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(imx258->dev, ret,
 				     "failed to get regulators\n");
 
-	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
+	imx258->clk = devm_clk_get_optional(imx258->dev, NULL);
 	if (IS_ERR(imx258->clk))
-		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
+		return dev_err_probe(imx258->dev, PTR_ERR(imx258->clk),
 				     "error getting clock\n");
 	if (!imx258->clk) {
-		dev_dbg(&client->dev,
+		dev_dbg(imx258->dev,
 			"no clock provided, using clock-frequency property\n");
 
-		device_property_read_u32(&client->dev, "clock-frequency", &val);
+		device_property_read_u32(imx258->dev, "clock-frequency", &val);
 	} else {
 		val = clk_get_rate(imx258->clk);
 	}
@@ -1400,32 +1398,32 @@ static int imx258_probe(struct i2c_client *client)
 		imx258->link_freq_menu_items = link_freq_menu_items_24;
 		break;
 	default:
-		dev_err(&client->dev, "input clock frequency of %u not supported\n",
+		dev_err(imx258->dev, "input clock frequency of %u not supported\n",
 			val);
 		return -EINVAL;
 	}
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx258->dev), NULL);
 	if (!endpoint) {
-		dev_err(&client->dev, "Endpoint node not found\n");
+		dev_err(imx258->dev, "Endpoint node not found\n");
 		return -EINVAL;
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
 	fwnode_handle_put(endpoint);
 	if (ret) {
-		dev_err(&client->dev, "Parsing endpoint node failed\n");
+		dev_err(imx258->dev, "Parsing endpoint node failed\n");
 		return ret;
 	}
 
-	ret = v4l2_link_freq_to_bitmap(&client->dev,
+	ret = v4l2_link_freq_to_bitmap(imx258->dev,
 				       ep.link_frequencies,
 				       ep.nr_of_link_frequencies,
 				       imx258->link_freq_menu_items,
 				       ARRAY_SIZE(link_freq_menu_items_19_2),
 				       &imx258->link_freq_bitmap);
 	if (ret) {
-		dev_err(&client->dev, "Link frequency not supported\n");
+		dev_err(imx258->dev, "Link frequency not supported\n");
 		goto error_endpoint_free;
 	}
 
@@ -1438,7 +1436,7 @@ static int imx258_probe(struct i2c_client *client)
 		imx258->lane_mode_idx = IMX258_4_LANE_MODE;
 		break;
 	default:
-		dev_err(&client->dev, "Invalid data lanes: %u\n",
+		dev_err(imx258->dev, "Invalid data lanes: %u\n",
 			ep.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto error_endpoint_free;
@@ -1446,7 +1444,7 @@ static int imx258_probe(struct i2c_client *client)
 
 	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
 
-	imx258->variant_cfg = device_get_match_data(&client->dev);
+	imx258->variant_cfg = device_get_match_data(imx258->dev);
 	if (!imx258->variant_cfg)
 		imx258->variant_cfg = &imx258_cfg;
 
@@ -1454,7 +1452,7 @@ static int imx258_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
 	/* Will be powered off via pm_runtime_idle */
-	ret = imx258_power_on(&client->dev);
+	ret = imx258_power_on(imx258->dev);
 	if (ret)
 		goto error_endpoint_free;
 
@@ -1486,9 +1484,9 @@ static int imx258_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_media_entity;
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(imx258->dev);
+	pm_runtime_enable(imx258->dev);
+	pm_runtime_idle(imx258->dev);
 	v4l2_fwnode_endpoint_free(&ep);
 
 	return 0;
@@ -1500,7 +1498,7 @@ static int imx258_probe(struct i2c_client *client)
 	imx258_free_controls(imx258);
 
 error_identify:
-	imx258_power_off(&client->dev);
+	imx258_power_off(imx258->dev);
 
 error_endpoint_free:
 	v4l2_fwnode_endpoint_free(&ep);
@@ -1517,10 +1515,10 @@ static void imx258_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	imx258_free_controls(imx258);
 
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		imx258_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(imx258->dev);
+	if (!pm_runtime_status_suspended(imx258->dev))
+		imx258_power_off(imx258->dev);
+	pm_runtime_set_suspended(imx258->dev);
 }
 
 static const struct dev_pm_ops imx258_pm_ops = {
-- 
Regards,

Laurent Pinchart


