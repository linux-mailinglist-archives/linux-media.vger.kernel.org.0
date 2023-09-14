Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7AE7A0C95
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241616AbjINSSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241560AbjINSSM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338EA1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37339881A;
        Thu, 14 Sep 2023 20:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715394;
        bh=Af+2wiSLixntu8mVzpz8AHEPCmd34JdNCw7HXU5olsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BmIB+PIyLeBTRfif1gKhMabpWuyPDE3aa8sF/dubnloVDuZ0pT+DqSPQuoGrQwzlf
         OwtHkcBEAPcsRhdXA/vnmL+qKhkHallgpxINQ4lcwv0iggMw49HM5dol0tB+evD/Cm
         uyJWYAXrlbYEaHOWfu2nOkqRHQjqtjJnOEhvOZnQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 54/57] media: i2c: ov5670: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:17:01 +0300
Message-ID: <20230914181704.4811-55-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5670.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index afd84c8e5ee7..e80db3ecd4f8 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1882,8 +1882,6 @@ struct ov5670 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -2484,7 +2482,6 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 		ret = ov5670_stop_streaming(ov5670);
 		pm_runtime_put(&client->dev);
 	}
-	ov5670->streaming = enable;
 	goto unlock_and_return;
 
 error:
@@ -2539,34 +2536,6 @@ static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ov5670_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov5670 *ov5670 = to_ov5670(sd);
-
-	if (ov5670->streaming)
-		ov5670_stop_streaming(ov5670);
-
-	return 0;
-}
-
-static int __maybe_unused ov5670_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov5670 *ov5670 = to_ov5670(sd);
-	int ret;
-
-	if (ov5670->streaming) {
-		ret = ov5670_start_streaming(ov5670);
-		if (ret) {
-			ov5670_stop_streaming(ov5670);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static const struct v4l2_subdev_core_ops ov5670_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
@@ -2769,8 +2738,6 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ov5670->streaming = false;
-
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
 		pm_runtime_set_active(&client->dev);
@@ -2825,7 +2792,6 @@ static void ov5670_remove(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops ov5670_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
 	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

