Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D4A7A0C89
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbjINSR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241552AbjINSR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6681D1FFE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8570E2D14;
        Thu, 14 Sep 2023 20:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715380;
        bh=U/8KNOp8jcJRqqk8Hoje49qddH6OWBmQ50cvk9pAGp0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nCkhPGAdwH9/uz0jLpG+Zr4URwN9fFcFZlMpgzTttz3vE0e2bWDFFY02Fi/6tethQ
         TIaOXjCMzxm51I32UwBElueoTthlpL7OPoTUg0JJlqhArGpxvblD3YHla31oqbDgES
         2wej6BloaR0tOUGhZfjbFXvHNJEVmWUqpokX7mAI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 44/57] media: i2c: imx319: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:51 +0300
Message-ID: <20230914181704.4811-45-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx319.c | 40 --------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 935bcbacd62e..5378f607f340 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -138,8 +138,6 @@ struct imx319 {
 	 */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -2184,8 +2182,6 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	imx319->streaming = enable;
-
 	/* vflip and hflip cannot change during streaming */
 	__v4l2_ctrl_grab(imx319->vflip, enable);
 	__v4l2_ctrl_grab(imx319->hflip, enable);
@@ -2202,37 +2198,6 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused imx319_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx319 *imx319 = to_imx319(sd);
-
-	if (imx319->streaming)
-		imx319_stop_streaming(imx319);
-
-	return 0;
-}
-
-static int __maybe_unused imx319_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx319 *imx319 = to_imx319(sd);
-	int ret;
-
-	if (imx319->streaming) {
-		ret = imx319_start_streaming(imx319);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx319_stop_streaming(imx319);
-	imx319->streaming = 0;
-	return ret;
-}
-
 static const struct v4l2_subdev_core_ops imx319_subdev_core_ops = {
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
@@ -2538,10 +2503,6 @@ static void imx319_remove(struct i2c_client *client)
 	mutex_destroy(&imx319->mutex);
 }
 
-static const struct dev_pm_ops imx319_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx319_suspend, imx319_resume)
-};
-
 static const struct acpi_device_id imx319_acpi_ids[] __maybe_unused = {
 	{ "SONY319A" },
 	{ /* sentinel */ }
@@ -2551,7 +2512,6 @@ MODULE_DEVICE_TABLE(acpi, imx319_acpi_ids);
 static struct i2c_driver imx319_i2c_driver = {
 	.driver = {
 		.name = "imx319",
-		.pm = &imx319_pm_ops,
 		.acpi_match_table = ACPI_PTR(imx319_acpi_ids),
 	},
 	.probe = imx319_probe,
-- 
Regards,

Laurent Pinchart

