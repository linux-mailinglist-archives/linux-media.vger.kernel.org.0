Return-Path: <linux-media+bounces-44457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0221BDACF8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE4174EA9B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B318930B51C;
	Tue, 14 Oct 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uubpsQOC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB5286415
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463656; cv=none; b=EhSeL+UStBBFtBFEE/FbG8COiqum28szhEmhTG7eckuifBLjdKpHDM+K8WxLA6h4slQwyzs2EHoeT4gsWtdOoGcXbt/0tFEPg5EA5pCuG+C/M/WKFbgFpctRNrn/06FGjXZq7oD/fGezBRknqvBZu72mm+ndVzesQj7QY2Z+kfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463656; c=relaxed/simple;
	bh=z8eqLZxW7Rq6mfQWf3AnpoIuS8rlMmTPJl7hcMUDVBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyMBECYHTfhpMtv9MwkGK0qYXDHGvv1sm/BtNeE+6amioiYaLqP/5zVYsLuSb8MdcGy2vo2greEcc8i81v6lGg0mv31q/TxDzBw+3ZWPlA0PvCej6TJEbC+ipQ/YspO/rlyVURZ3ql8hdJXcascZUJQqb7ukBCVSlaXm54v4/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uubpsQOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789A3C4CEE7;
	Tue, 14 Oct 2025 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463655;
	bh=z8eqLZxW7Rq6mfQWf3AnpoIuS8rlMmTPJl7hcMUDVBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uubpsQOCiyfO6Z9sNQcGmEiAFP9SM7Enk8dQfb3HlXW5BdWfj5Iz2fiGR8OvzZN7d
	 gOSoEjHHizwKQtZ0Of2bEfWHN+feg+bC9LXcqkeD8tbyBXaEe6WzMIsdiG027zeHFK
	 i5z5CCv9dwfcGLAbBA+7sISv7+fvvSaf3Mkum4phBDHla4iMHNCibLlm2vtCzmWx0i
	 BOF4w0CwelPwAcYf3qqFbIumBV+a3G+ktVRLHzJq8WOJumAYAgI383yjzLrP1xrE07
	 VdB2d42mZGSBuFgjkn1psVgYH0Cwoks4S2WbhrW3dZSCcd3Cm5S+MsvMYet1JcCtQ1
	 Coe4oSn5XZmXQ==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 10/25] media: i2c: ov01a10: Store dev pointer in struct ov01a10
Date: Tue, 14 Oct 2025 19:40:18 +0200
Message-ID: <20251014174033.20534-11-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the cci_* register access helpers are used we no longer need
the i2c_client in various functions.

Some code is still getting the client just to be able to get to the device
pointer. Directly store a struct device *dev pointing to &client->dev
inside struct ov01a10 to make the code simpler.

This also fixes a mismatch of using dev vs &client->dev in the
runtime_pm_*() calls in probe().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 52e1f3e0e4e5..de293e2431e9 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -280,6 +280,7 @@ static const struct ov01a10_mode supported_modes[] = {
 };
 
 struct ov01a10 {
+	struct device *dev;
 	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -357,7 +358,6 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov01a10 *ov01a10 = container_of(ctrl->handler,
 					       struct ov01a10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -370,7 +370,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov01a10->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -410,7 +410,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov01a10->dev);
 
 	return ret;
 }
@@ -421,7 +421,6 @@ static const struct v4l2_ctrl_ops ov01a10_ctrl_ops = {
 
 static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	struct v4l2_fwnode_device_properties props;
 	u32 vblank_min, vblank_max, vblank_default;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
@@ -430,7 +429,7 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	int ret = 0;
 	int size;
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov01a10->dev, &props);
 	if (ret)
 		return ret;
 
@@ -524,7 +523,6 @@ static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
 
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	const struct ov01a10_reg_list *reg_list;
 	int link_freq_index;
 	int ret = 0;
@@ -534,7 +532,7 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
 				     reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls\n");
+		dev_err(ov01a10->dev, "failed to set plls\n");
 		return ret;
 	}
 
@@ -542,7 +540,7 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
 				     reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(ov01a10->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -563,25 +561,24 @@ static void ov01a10_stop_streaming(struct ov01a10 *ov01a10)
 static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov01a10 *ov01a10 = to_ov01a10(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov01a10->dev);
 		if (ret < 0)
 			goto unlock;
 
 		ret = ov01a10_start_streaming(ov01a10);
 		if (ret) {
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov01a10->dev);
 			goto unlock;
 		}
 	} else {
 		ov01a10_stop_streaming(ov01a10);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov01a10->dev);
 	}
 
 unlock:
@@ -733,7 +730,6 @@ static const struct media_entity_operations ov01a10_subdev_entity_ops = {
 
 static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	int ret;
 	u64 val;
 
@@ -742,7 +738,7 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 		return ret;
 
 	if (val != OV01A10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
+		dev_err(ov01a10->dev, "chip id mismatch: %x!=%llx\n",
 			OV01A10_CHIP_ID, val);
 		return -EIO;
 	}
@@ -765,14 +761,15 @@ static void ov01a10_remove(struct i2c_client *client)
 
 static int ov01a10_probe(struct i2c_client *client)
 {
-	struct device *dev = &client->dev;
 	struct ov01a10 *ov01a10;
 	int ret = 0;
 
-	ov01a10 = devm_kzalloc(dev, sizeof(*ov01a10), GFP_KERNEL);
+	ov01a10 = devm_kzalloc(&client->dev, sizeof(*ov01a10), GFP_KERNEL);
 	if (!ov01a10)
 		return -ENOMEM;
 
+	ov01a10->dev = &client->dev;
+
 	ov01a10->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov01a10->regmap))
 		return PTR_ERR(ov01a10->regmap);
@@ -809,8 +806,8 @@ static int ov01a10_probe(struct i2c_client *client)
 	 * Enable runtime PM and turn off the device.
 	 */
 	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
 	if (ret)
@@ -819,7 +816,7 @@ static int ov01a10_probe(struct i2c_client *client)
 	return 0;
 
 err_pm_disable:
-	pm_runtime_disable(dev);
+	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	v4l2_subdev_cleanup(&ov01a10->sd);
 
-- 
2.51.0


