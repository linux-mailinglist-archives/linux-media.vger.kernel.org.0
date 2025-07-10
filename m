Return-Path: <linux-media+bounces-37383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC8B00A97
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8BAF189B058
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852DF2F3C29;
	Thu, 10 Jul 2025 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j7FNlYF7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5506F2F1FFD
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169788; cv=none; b=At6aHUEZcjjQf/c6AzpMh5OGMeTaq27CDM1HkOCzMIcnVN0+eVhPiqfnU6rRK3cBksitxHgdnFLvGFWFR5wkxXDQyk0X0Obwjdea5e7Sb7vS4RSxNeZ6ixyF3ffMa+m/DisjevNcJ0Yn80c9ytlPraeAxbydwArU7KrRayNedtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169788; c=relaxed/simple;
	bh=BbdoTglGBs3G/CbidcmxF0tl/BhEgKV3E6HQjxNJqZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnkOKjfaub1DCZyO7KWgTrMmtE96CPIfySgqA+Gvft/KCSrt+A1dfUwVFSXsChe0UjiP4KPoDhAAGx7v2DHethpWhZLXCN0aoJ3As46La3/JZrBrensNa86QeFcPdDgGoq47kRWhMOK9Aele01M2RxcUysARY/7P/t0F0fkAdzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j7FNlYF7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E333E3DC;
	Thu, 10 Jul 2025 19:49:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169755;
	bh=BbdoTglGBs3G/CbidcmxF0tl/BhEgKV3E6HQjxNJqZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j7FNlYF7+1VprmWFqpyqVmfzapyqhaGXE7ufDUGCoWskuk8IFxVGf+BFfff8K4pva
	 EuWMUUwNYrqp+BxI3wOa5dltQu/1AHRrWhUf7SuouqnUMXDhCR9ro8+4RwCVHyBT7r
	 AMVz2OMKLTrpg3OA9Fs+DH91VVR8RyoR1hfCZ1xE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 40/72] media: i2c: ov13858: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:36 +0300
Message-ID: <20250710174808.5361-41-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov13858 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov13858.c | 50 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 7a3fc1d28514..d93ad730d633 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1028,6 +1028,8 @@ static const struct ov13858_mode supported_modes[] = {
 };
 
 struct ov13858 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -1117,7 +1119,6 @@ static int ov13858_write_reg(struct ov13858 *ov13858, u16 reg, u32 len,
 static int ov13858_write_regs(struct ov13858 *ov13858,
 			      const struct ov13858_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	int ret;
 	u32 i;
 
@@ -1126,7 +1127,7 @@ static int ov13858_write_regs(struct ov13858 *ov13858,
 					regs[i].val);
 		if (ret) {
 			dev_err_ratelimited(
-				&client->dev,
+				ov13858->dev,
 				"Failed to write reg 0x%4.4x. error = %d\n",
 				regs[i].address, ret);
 
@@ -1209,7 +1210,6 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov13858 *ov13858 = container_of(ctrl->handler,
 					       struct ov13858, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	s64 max;
 	int ret;
 
@@ -1228,7 +1228,7 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov13858->dev))
 		return 0;
 
 	ret = 0;
@@ -1256,13 +1256,13 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov13858_enable_test_pattern(ov13858, ctrl->val);
 		break;
 	default:
-		dev_info(&client->dev,
+		dev_info(ov13858->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
 			 ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov13858->dev);
 
 	return ret;
 }
@@ -1408,7 +1408,6 @@ static int ov13858_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 /* Start streaming */
 static int ov13858_start_streaming(struct ov13858 *ov13858)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	const struct ov13858_reg_list *reg_list;
 	int ret, link_freq_index;
 
@@ -1416,7 +1415,7 @@ static int ov13858_start_streaming(struct ov13858 *ov13858)
 	ret = ov13858_write_reg(ov13858, OV13858_REG_SOFTWARE_RST,
 				OV13858_REG_VALUE_08BIT, OV13858_SOFTWARE_RST);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set powerup registers\n",
+		dev_err(ov13858->dev, "%s failed to set powerup registers\n",
 			__func__);
 		return ret;
 	}
@@ -1426,7 +1425,7 @@ static int ov13858_start_streaming(struct ov13858 *ov13858)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov13858_write_reg_list(ov13858, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(ov13858->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
@@ -1434,7 +1433,7 @@ static int ov13858_start_streaming(struct ov13858 *ov13858)
 	reg_list = &ov13858->cur_mode->reg_list;
 	ret = ov13858_write_reg_list(ov13858, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(ov13858->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
@@ -1458,13 +1457,12 @@ static int ov13858_stop_streaming(struct ov13858 *ov13858)
 static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov13858 *ov13858 = to_ov13858(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&ov13858->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov13858->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -1477,7 +1475,7 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		ov13858_stop_streaming(ov13858);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov13858->dev);
 	}
 
 	mutex_unlock(&ov13858->mutex);
@@ -1485,7 +1483,7 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov13858->dev);
 err_unlock:
 	mutex_unlock(&ov13858->mutex);
 
@@ -1495,7 +1493,6 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 /* Verify chip ID */
 static int ov13858_identify_module(struct ov13858 *ov13858)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	int ret;
 	u32 val;
 
@@ -1505,7 +1502,7 @@ static int ov13858_identify_module(struct ov13858 *ov13858)
 		return ret;
 
 	if (val != OV13858_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(ov13858->dev, "chip id mismatch: %x!=%x\n",
 			OV13858_CHIP_ID, val);
 		return -EIO;
 	}
@@ -1552,7 +1549,6 @@ static const struct v4l2_subdev_internal_ops ov13858_internal_ops = {
 /* Initialize control handlers */
 static int ov13858_init_controls(struct ov13858 *ov13858)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
@@ -1626,12 +1622,12 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 				     0, 0, ov13858_test_pattern_menu);
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
+		dev_err(ov13858->dev, "%s control init failed (%d)\n",
 			__func__, ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov13858->dev, &props);
 	if (ret)
 		goto error;
 
@@ -1671,13 +1667,15 @@ static int ov13858_probe(struct i2c_client *client)
 	if (!ov13858)
 		return -ENOMEM;
 
+	ov13858->dev = &client->dev;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13858->sd, client, &ov13858_subdev_ops);
 
 	/* Check module identity */
 	ret = ov13858_identify_module(ov13858);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		dev_err(ov13858->dev, "failed to find sensor: %d\n", ret);
 		return ret;
 	}
 
@@ -1699,7 +1697,7 @@ static int ov13858_probe(struct i2c_client *client)
 	ov13858->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov13858->sd.entity, 1, &ov13858->pad);
 	if (ret) {
-		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+		dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);
 		goto error_handler_free;
 	}
 
@@ -1711,9 +1709,9 @@ static int ov13858_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(ov13858->dev);
+	pm_runtime_enable(ov13858->dev);
+	pm_runtime_idle(ov13858->dev);
 
 	return 0;
 
@@ -1722,7 +1720,7 @@ static int ov13858_probe(struct i2c_client *client)
 
 error_handler_free:
 	ov13858_free_controls(ov13858);
-	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+	dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);
 
 	return ret;
 }
@@ -1736,7 +1734,7 @@ static void ov13858_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	ov13858_free_controls(ov13858);
 
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(ov13858->dev);
 }
 
 static const struct i2c_device_id ov13858_id_table[] = {
-- 
Regards,

Laurent Pinchart


