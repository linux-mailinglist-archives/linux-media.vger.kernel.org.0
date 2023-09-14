Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B777A0C90
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241579AbjINSSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241580AbjINSSF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3531FFE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66031881F;
        Thu, 14 Sep 2023 20:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715387;
        bh=JpvxaqSM7m1WZbjtxtnRBNYSXTdEExMDcYgR2NuCyQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g6cln+Yf8duCaX7UCXWUuNpLnJcWn+XIre8Jz6HD+amwcuQjx9pVHfVbhMoNsvRFq
         xlStNlr3COKnMR0aRUzoJMc41/mBavpIczrfUqJU+HXg1YM9dmIew0cbj0ix/iOI+K
         9//ZJR7u960dzXj0nlFtjrDjhXpWzHBcy3Gv5vjM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Jimmy Su <jimmy.su@intel.com>
Subject: [PATCH 49/57] media: i2c: ov08d10: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:56 +0300
Message-ID: <20230914181704.4811-50-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stopping streaming on a camera pipeline at system suspend time, and
restarting it at system resume time, requires coordinated action between
the bridge driver and the camera sensor driver. This is handled by the
bridge driver calling the sensor's .s_stream() handler at system suspend
and resume time. There is thus no need for the sensor to independently
implement system sleep PM operations. Drop them.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov08d10.c | 49 -------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index ef811711549c..3d49e3fa8e56 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -536,9 +536,6 @@ struct ov08d10 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* lanes index */
 	u8 nlanes;
 
@@ -1122,8 +1119,6 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov08d10->streaming = enable;
-
 	/* vflip and hflip cannot change during streaming */
 	__v4l2_ctrl_grab(ov08d10->vflip, enable);
 	__v4l2_ctrl_grab(ov08d10->hflip, enable);
@@ -1133,45 +1128,6 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused ov08d10_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov08d10 *ov08d10 = to_ov08d10(sd);
-
-	mutex_lock(&ov08d10->mutex);
-	if (ov08d10->streaming)
-		ov08d10_stop_streaming(ov08d10);
-
-	mutex_unlock(&ov08d10->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused ov08d10_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov08d10 *ov08d10 = to_ov08d10(sd);
-	int ret;
-
-	mutex_lock(&ov08d10->mutex);
-
-	if (ov08d10->streaming) {
-		ret = ov08d10_start_streaming(ov08d10);
-		if (ret) {
-			ov08d10->streaming = false;
-			ov08d10_stop_streaming(ov08d10);
-			mutex_unlock(&ov08d10->mutex);
-			return ret;
-		}
-	}
-
-	mutex_unlock(&ov08d10->mutex);
-
-	return 0;
-}
-
 static int ov08d10_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
@@ -1498,10 +1454,6 @@ static int ov08d10_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops ov08d10_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov08d10_suspend, ov08d10_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08d10_acpi_ids[] = {
 	{ "OVTI08D1" },
@@ -1514,7 +1466,6 @@ MODULE_DEVICE_TABLE(acpi, ov08d10_acpi_ids);
 static struct i2c_driver ov08d10_i2c_driver = {
 	.driver = {
 		.name = "ov08d10",
-		.pm = &ov08d10_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
 	},
 	.probe = ov08d10_probe,
-- 
Regards,

Laurent Pinchart

