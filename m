Return-Path: <linux-media+bounces-37367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05DB00A89
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A084E01F8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFC52F2C7A;
	Thu, 10 Jul 2025 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kgqRVFyV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51966279DB6
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169762; cv=none; b=Xl7tXig5f582QAr/1ZRKA+UHMdkrVm1BK8Bd6f/w7LFtcIrXT+4o+QXjOOMbCtpzDkJGytofcrwL34m9G6UA4lqFadtaTA14aU0P5ipZI+YR1naHxTTHI+2R23kZkggru17hmxXcke+4eGBJnMzUXLBThpIRoQHJw5qdiqvS5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169762; c=relaxed/simple;
	bh=mdrxnI5q7VPiYUjk2XGUf33Tm2fX56imzGr20iGNj34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUtUSizvakOYS48E9d3t7DjQtWX8V1cvJTDCFmwH7bWl4i2euInGab6HH8oRd2Fv06a8v5rNCULiY87ccUkrCj0NVOK0C5VlKTKnXBXfM7kRtOaSK2Mnx3tx6nCQ5x6sI5PO4Ut35YS1qS5BpGBhtFDQQg94esutdY5STZWs8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kgqRVFyV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA29D2391;
	Thu, 10 Jul 2025 19:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169729;
	bh=mdrxnI5q7VPiYUjk2XGUf33Tm2fX56imzGr20iGNj34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgqRVFyVKLW3iXLqI/KwBuu/HLZI/Ozy4oUE7hXJbpcW30CDm9TiV+FP44ewStLkv
	 c7ZFzo8zlZtpqZt89brnuC3tSe0t1gQuGQSNswp6qDsrb1Rz/cGvt9Kij6IuBBYNAz
	 sbDRh07Y77Z4HH3idpxujxE20rI2moLkioer/gNc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 24/72] media: i2c: imx208: Replace client->dev usage
Date: Thu, 10 Jul 2025 20:47:20 +0300
Message-ID: <20250710174808.5361-25-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct imx208 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx208.c | 68 ++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 2b5a6ce7b1ae..5399a2549b3f 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -6,9 +6,10 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/unaligned.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <linux/unaligned.h>
 
 #define IMX208_REG_MODE_SELECT		0x0100
 #define IMX208_MODE_STANDBY		0x00
@@ -268,6 +269,8 @@ static const struct imx208_mode supported_modes[] = {
 };
 
 struct imx208 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -372,7 +375,6 @@ static int imx208_write_reg(struct imx208 *imx208, u16 reg, u32 len, u32 val)
 static int imx208_write_regs(struct imx208 *imx208,
 			     const struct imx208_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	unsigned int i;
 	int ret;
 
@@ -380,7 +382,7 @@ static int imx208_write_regs(struct imx208 *imx208,
 		ret = imx208_write_reg(imx208, regs[i].address, 1,
 				       regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(imx208->dev,
 					    "Failed to write reg 0x%4.4x. error = %d\n",
 					    regs[i].address, ret);
 
@@ -431,14 +433,13 @@ static int imx208_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx208 *imx208 =
 		container_of(ctrl->handler, struct imx208, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	int ret;
 
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(imx208->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -471,13 +472,13 @@ static int imx208_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		ret = -EINVAL;
-		dev_err(&client->dev,
+		dev_err(imx208->dev,
 			"ctrl(id:0x%x,val:0x%x) is not handled\n",
 			ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx208->dev);
 
 	return ret;
 }
@@ -620,7 +621,6 @@ static int imx208_set_pad_format(struct v4l2_subdev *sd,
 
 static int imx208_identify_module(struct imx208 *imx208)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	int ret;
 	u32 val;
 
@@ -630,13 +630,13 @@ static int imx208_identify_module(struct imx208 *imx208)
 	ret = imx208_read_reg(imx208, IMX208_REG_CHIP_ID,
 			      2, &val);
 	if (ret) {
-		dev_err(&client->dev, "failed to read chip id %x\n",
+		dev_err(imx208->dev, "failed to read chip id %x\n",
 			IMX208_CHIP_ID);
 		return ret;
 	}
 
 	if (val != IMX208_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(imx208->dev, "chip id mismatch: %x!=%x\n",
 			IMX208_CHIP_ID, val);
 		return -EIO;
 	}
@@ -649,7 +649,6 @@ static int imx208_identify_module(struct imx208 *imx208)
 /* Start streaming */
 static int imx208_start_streaming(struct imx208 *imx208)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	const struct imx208_reg_list *reg_list;
 	int ret, link_freq_index;
 
@@ -662,7 +661,7 @@ static int imx208_start_streaming(struct imx208 *imx208)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = imx208_write_regs(imx208, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set plls\n", __func__);
+		dev_err(imx208->dev, "%s failed to set plls\n", __func__);
 		return ret;
 	}
 
@@ -670,7 +669,7 @@ static int imx208_start_streaming(struct imx208 *imx208)
 	reg_list = &imx208->cur_mode->reg_list;
 	ret = imx208_write_regs(imx208, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		dev_err(imx208->dev, "%s failed to set mode\n", __func__);
 		return ret;
 	}
 
@@ -687,14 +686,13 @@ static int imx208_start_streaming(struct imx208 *imx208)
 /* Stop streaming */
 static int imx208_stop_streaming(struct imx208 *imx208)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	int ret;
 
 	/* set stream off register */
 	ret = imx208_write_reg(imx208, IMX208_REG_MODE_SELECT,
 			       1, IMX208_MODE_STANDBY);
 	if (ret)
-		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+		dev_err(imx208->dev, "%s failed to set stream\n", __func__);
 
 	/*
 	 * Return success even if it was an error, as there is nothing the
@@ -706,13 +704,12 @@ static int imx208_stop_streaming(struct imx208 *imx208)
 static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx208 *imx208 = to_imx208(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&imx208->imx208_mx);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(imx208->dev);
 		if (ret) {
 			mutex_unlock(&imx208->imx208_mx);
 			return ret;
@@ -727,7 +724,7 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx208_stop_streaming(imx208);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(imx208->dev);
 	}
 
 	mutex_unlock(&imx208->imx208_mx);
@@ -739,7 +736,7 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx208->dev);
 	mutex_unlock(&imx208->imx208_mx);
 
 	return ret;
@@ -778,7 +775,7 @@ static int imx208_read_otp(struct imx208 *imx208)
 	if (imx208->otp_read)
 		goto out_unlock;
 
-	ret = pm_runtime_resume_and_get(&client->dev);
+	ret = pm_runtime_resume_and_get(imx208->dev);
 	if (ret)
 		goto out_unlock;
 
@@ -805,7 +802,7 @@ static int imx208_read_otp(struct imx208 *imx208)
 	}
 
 out_pm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx208->dev);
 
 out_unlock:
 	mutex_unlock(&imx208->imx208_mx);
@@ -835,7 +832,6 @@ static const BIN_ATTR_RO(otp, IMX208_OTP_SIZE);
 /* Initialize control handlers */
 static int imx208_init_controls(struct imx208 *imx208)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr = &imx208->ctrl_handler;
 	s64 exposure_max;
 	s64 vblank_def;
@@ -914,7 +910,7 @@ static int imx208_init_controls(struct imx208 *imx208)
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
+		dev_err(imx208->dev, "%s control init failed (%d)\n",
 			__func__, ret);
 		goto error;
 	}
@@ -954,15 +950,17 @@ static int imx208_probe(struct i2c_client *client)
 	if (!imx208)
 		return -ENOMEM;
 
+	imx208->dev = &client->dev;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx208->sd, client, &imx208_subdev_ops);
 
-	full_power = acpi_dev_state_d0(&client->dev);
+	full_power = acpi_dev_state_d0(imx208->dev);
 	if (full_power) {
 		/* Check module identity */
 		ret = imx208_identify_module(imx208);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			dev_err(imx208->dev, "failed to find sensor: %d", ret);
 			goto error_probe;
 		}
 	}
@@ -972,7 +970,7 @@ static int imx208_probe(struct i2c_client *client)
 
 	ret = imx208_init_controls(imx208);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(imx208->dev, "failed to init controls: %d", ret);
 		goto error_probe;
 	}
 
@@ -985,7 +983,7 @@ static int imx208_probe(struct i2c_client *client)
 	imx208->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx208->sd.entity, 1, &imx208->pad);
 	if (ret) {
-		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+		dev_err(imx208->dev, "%s failed:%d\n", __func__, ret);
 		goto error_handler_free;
 	}
 
@@ -993,17 +991,17 @@ static int imx208_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_media_entity;
 
-	ret = device_create_bin_file(&client->dev, &bin_attr_otp);
+	ret = device_create_bin_file(imx208->dev, &bin_attr_otp);
 	if (ret) {
-		dev_err(&client->dev, "sysfs otp creation failed\n");
+		dev_err(imx208->dev, "sysfs otp creation failed\n");
 		goto error_async_subdev;
 	}
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+		pm_runtime_set_active(imx208->dev);
+	pm_runtime_enable(imx208->dev);
+	pm_runtime_idle(imx208->dev);
 
 	return 0;
 
@@ -1027,13 +1025,13 @@ static void imx208_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct imx208 *imx208 = to_imx208(sd);
 
-	device_remove_bin_file(&client->dev, &bin_attr_otp);
+	device_remove_bin_file(imx208->dev, &bin_attr_otp);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	imx208_free_controls(imx208);
 
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(imx208->dev);
+	pm_runtime_set_suspended(imx208->dev);
 
 	mutex_destroy(&imx208->imx208_mx);
 }
-- 
Regards,

Laurent Pinchart


