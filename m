Return-Path: <linux-media+bounces-39689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 846AFB23B38
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1442A7209E2
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED652E62B8;
	Tue, 12 Aug 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="alHId2uN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E32E613D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035291; cv=none; b=h2LnqqBt0PA0eHdF0Xucsf7qW2ZWB+OLjlWWZdgUpUXIICcYKARKQXIpgjX5oEvUbvwTdIAZC+pQ6kbgb+bX+OnpZ+fFtk9pDioXX2AmDgA4/aBjd++LIfOYgsl5wuGxgA05k0b6qbAdfE+NaNAzudLszjdeZTWfA7aa8iBr3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035291; c=relaxed/simple;
	bh=qIleCqttfmZBreURbxJSiG3yTPq44kv3Zx0787ktmsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2trhOzQ3ZkjJX0JhAJYje/XsYr7JmmL/ifmAtFwegcM6TfvCq77TgPICffIfDY+kYjt/3w0QzQK9180N6FyuTcna3a+y6vWYtGYUFV4YftCYde4wUKK1JuFeHFe3Qyc/4imojhkzy3+DgxqKaN5cG1wn3rfei8Bx5zeqhYp9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=alHId2uN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9FFC81123;
	Tue, 12 Aug 2025 23:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035235;
	bh=qIleCqttfmZBreURbxJSiG3yTPq44kv3Zx0787ktmsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=alHId2uN3y1tBkJU+SliRCIb44D1dZFaMSkFfuus/CaG3puYSKQJH3EFAwuQ+detB
	 btyR82ui9NZHLVH6nNmp34lIVKW6A4sYI1X5i7Iq/b6pqsnLEF4TKJf95AULxbjNvr
	 Eu506DmzvFA8ulQqscpY2esdRSYw2Tijk/bslRJk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 53/72] media: i2c: ov02a10: Replace client->dev usage
Date: Wed, 13 Aug 2025 00:46:01 +0300
Message-ID: <20250812214620.30425-54-laurent.pinchart@ideasonboard.com>
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
v4l2_get_subdevdata(). Store it as a pointer in struct ov02a10 and
access it from there instead, to simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02a10.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 74fc0687c849..6217164a7492 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -100,6 +100,8 @@ struct ov02a10_mode {
 };
 
 struct ov02a10 {
+	struct device *dev;
+
 	u32 eclk_freq;
 	/* Indication of MIPI transmission speed select */
 	u32 mipi_clock_voltage;
@@ -392,7 +394,7 @@ static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
 	chip_id = le16_to_cpu((__force __le16)ret);
 
 	if ((chip_id & OV02A10_ID_MASK) != OV02A10_ID) {
-		dev_err(&client->dev, "unexpected sensor id(0x%04x)\n", chip_id);
+		dev_err(ov02a10->dev, "unexpected sensor id(0x%04x)\n", chip_id);
 		return -EINVAL;
 	}
 
@@ -481,7 +483,7 @@ static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
 		ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
 						REG_MIRROR_FLIP_ENABLE);
 		if (ret < 0) {
-			dev_err(&client->dev, "failed to set orientation\n");
+			dev_err(ov02a10->dev, "failed to set orientation\n");
 			return ret;
 		}
 		ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
@@ -530,7 +532,6 @@ static int ov02a10_init_state(struct v4l2_subdev *sd,
 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
 	int ret;
 
 	mutex_lock(&ov02a10->mutex);
@@ -541,7 +542,7 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 	}
 
 	if (on) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov02a10->dev);
 		if (ret < 0)
 			goto unlock_and_return;
 
@@ -553,7 +554,7 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 		}
 	} else {
 		__ov02a10_stop_stream(ov02a10);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov02a10->dev);
 	}
 
 	ov02a10->streaming = on;
@@ -562,7 +563,7 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02a10->dev);
 unlock_and_return:
 	mutex_unlock(&ov02a10->mutex);
 
@@ -662,7 +663,6 @@ static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
 					       struct ov02a10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
 	s64 max_expo;
 	int ret;
 
@@ -678,7 +678,7 @@ static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov02a10->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -699,7 +699,7 @@ static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov02a10->dev);
 
 	return ret;
 }
@@ -734,7 +734,6 @@ static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
 
 static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
 	const struct ov02a10_mode *mode;
 	struct v4l2_ctrl_handler *handler;
 	struct v4l2_ctrl *ctrl;
@@ -790,7 +789,7 @@ static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
 
 	if (handler->error) {
 		ret = handler->error;
-		dev_err(&client->dev, "failed to init controls(%d)\n", ret);
+		dev_err(ov02a10->dev, "failed to init controls(%d)\n", ret);
 		goto err_free_handler;
 	}
 
@@ -866,6 +865,8 @@ static int ov02a10_probe(struct i2c_client *client)
 	if (!ov02a10)
 		return -ENOMEM;
 
+	ov02a10->dev = dev;
+
 	ret = ov02a10_check_hwcfg(dev, ov02a10);
 	if (ret)
 		return dev_err_probe(dev, ret,
@@ -985,10 +986,10 @@ static void ov02a10_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		ov02a10_power_off(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(ov02a10->dev);
+	if (!pm_runtime_status_suspended(ov02a10->dev))
+		ov02a10_power_off(ov02a10->dev);
+	pm_runtime_set_suspended(ov02a10->dev);
 	mutex_destroy(&ov02a10->mutex);
 }
 
-- 
Regards,

Laurent Pinchart


