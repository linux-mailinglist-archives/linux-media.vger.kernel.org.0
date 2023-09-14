Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2267A0C8B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241559AbjINSSC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241570AbjINSSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246661FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43A032F6C;
        Thu, 14 Sep 2023 20:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715383;
        bh=nUFMKivnHFavq9y8FfNAbA0pB81+OgIdywYrkiP7WIs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SR4QII+7xnRGbC6fHSP2/7UDNQAt++BM8V3eFfK3DcMHbt3sXH9+jCmASlK6DdRgK
         ASxu9M8dN9pn0mk8v1/1C5jqMuRbZgQBxtMMaFjqWzgAmh7F21/ZEp6qVoXHZLMaEX
         +9Ou4XHywBW1QMYxUYCv90OzGffrbbMiyntVFGto=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 46/57] media: i2c: og01a1b: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:53 +0300
Message-ID: <20230914181704.4811-47-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/og01a1b.c | 47 -------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index ab8381c52503..3e0de797aa4d 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -434,9 +434,6 @@ struct og01a1b {
 
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 static u64 to_pixel_rate(u32 f_index)
@@ -752,50 +749,11 @@ static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	og01a1b->streaming = enable;
 	mutex_unlock(&og01a1b->mutex);
 
 	return ret;
 }
 
-static int __maybe_unused og01a1b_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct og01a1b *og01a1b = to_og01a1b(sd);
-
-	mutex_lock(&og01a1b->mutex);
-	if (og01a1b->streaming)
-		og01a1b_stop_streaming(og01a1b);
-
-	mutex_unlock(&og01a1b->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused og01a1b_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct og01a1b *og01a1b = to_og01a1b(sd);
-	int ret;
-
-	mutex_lock(&og01a1b->mutex);
-	if (og01a1b->streaming) {
-		ret = og01a1b_start_streaming(og01a1b);
-		if (ret) {
-			og01a1b->streaming = false;
-			og01a1b_stop_streaming(og01a1b);
-			mutex_unlock(&og01a1b->mutex);
-			return ret;
-		}
-	}
-
-	mutex_unlock(&og01a1b->mutex);
-
-	return 0;
-}
-
 static int og01a1b_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
@@ -1093,10 +1051,6 @@ static int og01a1b_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops og01a1b_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(og01a1b_suspend, og01a1b_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id og01a1b_acpi_ids[] = {
 	{"OVTI01AC"},
@@ -1109,7 +1063,6 @@ MODULE_DEVICE_TABLE(acpi, og01a1b_acpi_ids);
 static struct i2c_driver og01a1b_i2c_driver = {
 	.driver = {
 		.name = "og01a1b",
-		.pm = &og01a1b_pm_ops,
 		.acpi_match_table = ACPI_PTR(og01a1b_acpi_ids),
 	},
 	.probe = og01a1b_probe,
-- 
Regards,

Laurent Pinchart

