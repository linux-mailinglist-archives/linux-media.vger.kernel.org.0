Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F807A0C98
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjINSSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241646AbjINSSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EC11FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8409A8822;
        Thu, 14 Sep 2023 20:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715399;
        bh=/j3yxfeZb+sfseFCb7b2LyfAGjaTzrBmvoAaziELFxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NUBO7a44Qf7zJBMLVlf79aoinukusxXy+EzyPR8sM1NpJEL4+6bWJOv0HLLN+D/jr
         5JNTLtaT+znqz7JnQt7WYXo270D59+J4Dphk8iMoZPLQtbEv6GIUm8FvAYH/HcjmRe
         jPiTPWWoWC4kYWgZdo39UuK/M/R7N4pcXRyW8xdo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 57/57] media: i2c: ov9734: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:17:04 +0300
Message-ID: <20230914181704.4811-58-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov9734.c | 46 --------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index a5f91499bce4..ee3315299605 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -337,9 +337,6 @@ struct ov9734 {
 
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 static inline struct ov9734 *to_ov9734(struct v4l2_subdev *subdev)
@@ -679,49 +676,11 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov9734->streaming = enable;
 	mutex_unlock(&ov9734->mutex);
 
 	return ret;
 }
 
-static int __maybe_unused ov9734_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9734 *ov9734 = to_ov9734(sd);
-
-	mutex_lock(&ov9734->mutex);
-	if (ov9734->streaming)
-		ov9734_stop_streaming(ov9734);
-
-	mutex_unlock(&ov9734->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused ov9734_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9734 *ov9734 = to_ov9734(sd);
-	int ret = 0;
-
-	mutex_lock(&ov9734->mutex);
-	if (!ov9734->streaming)
-		goto exit;
-
-	ret = ov9734_start_streaming(ov9734);
-	if (ret) {
-		ov9734->streaming = false;
-		ov9734_stop_streaming(ov9734);
-	}
-
-exit:
-	mutex_unlock(&ov9734->mutex);
-	return ret;
-}
-
 static int ov9734_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
@@ -1007,10 +966,6 @@ static int ov9734_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops ov9734_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov9734_suspend, ov9734_resume)
-};
-
 static const struct acpi_device_id ov9734_acpi_ids[] = {
 	{ "OVTI9734", },
 	{}
@@ -1021,7 +976,6 @@ MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
 static struct i2c_driver ov9734_i2c_driver = {
 	.driver = {
 		.name = "ov9734",
-		.pm = &ov9734_pm_ops,
 		.acpi_match_table = ov9734_acpi_ids,
 	},
 	.probe = ov9734_probe,
-- 
Regards,

Laurent Pinchart

