Return-Path: <linux-media+bounces-39654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E7B23AF8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447881AA7618
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEBC2E1C55;
	Tue, 12 Aug 2025 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rPOFc3SV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C32D738F
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035233; cv=none; b=iD1kkPi8c1wrSeXo42u73eAVFWiso2qoc0NcG2jOmncGqlcl1zI4g2GhZTZN68+5VBHNJcsTAtmjM3RPwutWJYtepdvUW/BvOviZ6AIGrT0iULHeW5n4KZu4Ej99xaJu+hoE3HMTZwuDFNz9RMZ/OB5j4JCYf0IQ074hh1LMu+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035233; c=relaxed/simple;
	bh=HUTmjbc235hNvti7QElmlhbTICG13gq2vSrihgD4B90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCvgNaYqH4MOQio94vAE1RpnoLS6fqDq9Jr0/G2BgnRrI3xfM8P4VTQXCKP60JscamPtZP35oAQqphcQqR8I+h0SxU7clsKLvhhS2v+YlDLp/1q11zvTglJ4zEm83ZOvcxahF/IKCQDOE6LRIQ9MIypyt9Q5PbBpfQ0BLf6B39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rPOFc3SV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 10E6D4A4;
	Tue, 12 Aug 2025 23:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035176;
	bh=HUTmjbc235hNvti7QElmlhbTICG13gq2vSrihgD4B90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPOFc3SVPU33g7c5g9JkbtPmUbC+FMuBX+3igvgca5rJMwNryzFrw2gynbAXSgDHd
	 SF8I291IbbCftFOZ7/aDTMlvbNA8nTKFFxUVNR1Iqh43VYxsVQmauizgA93UZ+hu/n
	 2UodaTCgFahvs184ThHVIdUza+Qi7urM7SvMwsgQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 18/72] media: i2c: imx355: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:45:26 +0300
Message-ID: <20250812214620.30425-19-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct imx355 and access
it from there instead, to simplify the driver.

While at it, fix a mistake in the sort order of include statements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b2dce67c0b6b..2315393f32e7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
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
@@ -97,6 +98,8 @@ struct imx355_hwcfg {
 };
 
 struct imx355 {
+	struct device *dev;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -1136,14 +1139,13 @@ static int imx355_write_reg(struct imx355 *imx355, u16 reg, u32 len, u32 val)
 static int imx355_write_regs(struct imx355 *imx355,
 			     const struct imx355_reg *regs, u32 len)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
 	int ret;
 	u32 i;
 
 	for (i = 0; i < len; i++) {
 		ret = imx355_write_reg(imx355, regs[i].address, 1, regs[i].val);
 		if (ret) {
-			dev_err_ratelimited(&client->dev,
+			dev_err_ratelimited(imx355->dev,
 					    "write reg 0x%4.4x return err %d",
 					    regs[i].address, ret);
 
@@ -1178,7 +1180,6 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx355 *imx355 = container_of(ctrl->handler,
 					     struct imx355, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
 	s64 max;
 	int ret;
 
@@ -1197,7 +1198,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
 	 */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(imx355->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1231,12 +1232,12 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		ret = -EINVAL;
-		dev_info(&client->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
+		dev_info(imx355->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
 			 ctrl->id, ctrl->val);
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx355->dev);
 
 	return ret;
 }
@@ -1385,7 +1386,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
 	const struct imx355_reg_list *reg_list;
 	int ret;
 
@@ -1393,7 +1393,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	reg_list = &imx355_global_setting;
 	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set global settings");
+		dev_err(imx355->dev, "failed to set global settings");
 		return ret;
 	}
 
@@ -1401,7 +1401,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	reg_list = &imx355->cur_mode->reg_list;
 	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(imx355->dev, "failed to set mode");
 		return ret;
 	}
 
@@ -1429,13 +1429,12 @@ static int imx355_stop_streaming(struct imx355 *imx355)
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx355 *imx355 = to_imx355(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	mutex_lock(&imx355->mutex);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(imx355->dev);
 		if (ret < 0)
 			goto err_unlock;
 
@@ -1448,7 +1447,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1460,7 +1459,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1470,7 +1469,6 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 /* Verify chip ID */
 static int imx355_identify_module(struct imx355 *imx355)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
 	int ret;
 	u32 val;
 
@@ -1479,7 +1477,7 @@ static int imx355_identify_module(struct imx355 *imx355)
 		return ret;
 
 	if (val != IMX355_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx355->dev, "chip id mismatch: %x!=%x",
 			IMX355_CHIP_ID, val);
 		return -EIO;
 	}
@@ -1519,7 +1517,6 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
@@ -1600,11 +1597,11 @@ static int imx355_init_controls(struct imx355 *imx355)
 				     0, 0, imx355_test_pattern_menu);
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "control init failed: %d", ret);
+		dev_err(imx355->dev, "control init failed: %d", ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(imx355->dev, &props);
 	if (ret)
 		goto error;
 
@@ -1689,6 +1686,8 @@ static int imx355_probe(struct i2c_client *client)
 	if (!imx355)
 		return -ENOMEM;
 
+	imx355->dev = &client->dev;
+
 	mutex_init(&imx355->mutex);
 
 	/* Initialize subdev */
@@ -1697,13 +1696,13 @@ static int imx355_probe(struct i2c_client *client)
 	/* Check module identity */
 	ret = imx355_identify_module(imx355);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err(imx355->dev, "failed to find sensor: %d", ret);
 		goto error_probe;
 	}
 
-	imx355->hwcfg = imx355_get_hwcfg(&client->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
 	if (!imx355->hwcfg) {
-		dev_err(&client->dev, "failed to get hwcfg");
+		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;
 		goto error_probe;
 	}
@@ -1713,7 +1712,7 @@ static int imx355_probe(struct i2c_client *client)
 
 	ret = imx355_init_controls(imx355);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(imx355->dev, "failed to init controls: %d", ret);
 		goto error_probe;
 	}
 
@@ -1728,7 +1727,7 @@ static int imx355_probe(struct i2c_client *client)
 	imx355->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx355->sd.entity, 1, &imx355->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx355->dev, "failed to init entity pads: %d", ret);
 		goto error_handler_free;
 	}
 
@@ -1736,9 +1735,9 @@ static int imx355_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_set_active(imx355->dev);
+	pm_runtime_enable(imx355->dev);
+	pm_runtime_idle(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
@@ -1747,8 +1746,8 @@ static int imx355_probe(struct i2c_client *client)
 	return 0;
 
 error_media_entity_runtime_pm:
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(imx355->dev);
+	pm_runtime_set_suspended(imx355->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1769,8 +1768,8 @@ static void imx355_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(imx355->dev);
+	pm_runtime_set_suspended(imx355->dev);
 
 	mutex_destroy(&imx355->mutex);
 }
-- 
Regards,

Laurent Pinchart


