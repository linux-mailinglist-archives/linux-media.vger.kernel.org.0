Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5587A0C83
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241457AbjINSRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241500AbjINSRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43251FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D09958201;
        Thu, 14 Sep 2023 20:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715374;
        bh=aZQwSL/SuYgXsOsIB7zGaM+qk4kLbSJ820eztjl1a88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JydEVX4KO1y1xYgw+Kntkd2s2t9yEgCmoeA9m2pfFECVSIoRFccDbuFrvk9sOcAQG
         C+jN1OO6FNi3SEsH5O3uOyzGALrcdMC/RzLy2o5xao0y3/2ZNwMYkCDE2XdsVBN+KD
         0ZINw/hdxfxZ7Hemh93rGhz8kNoL6M2osvKYdXz4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 39/57] media: i2c: hi847: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:46 +0300
Message-ID: <20230914181704.4811-40-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/hi847.c | 52 ---------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 32547d7a2659..35a334646ff5 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2184,9 +2184,6 @@ struct hi847 {
 
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 static u64 to_pixel_rate(u32 f_index)
@@ -2618,9 +2615,6 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (hi847->streaming == enable)
-		return 0;
-
 	mutex_lock(&hi847->mutex);
 	if (enable) {
 		ret = pm_runtime_get_sync(&client->dev);
@@ -2641,52 +2635,11 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	hi847->streaming = enable;
 	mutex_unlock(&hi847->mutex);
 
 	return ret;
 }
 
-static int __maybe_unused hi847_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi847 *hi847 = to_hi847(sd);
-
-	mutex_lock(&hi847->mutex);
-	if (hi847->streaming)
-		hi847_stop_streaming(hi847);
-
-	mutex_unlock(&hi847->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused hi847_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi847 *hi847 = to_hi847(sd);
-	int ret;
-
-	mutex_lock(&hi847->mutex);
-	if (hi847->streaming) {
-		ret = hi847_start_streaming(hi847);
-		if (ret)
-			goto error;
-	}
-
-	mutex_unlock(&hi847->mutex);
-
-	return 0;
-
-error:
-	hi847_stop_streaming(hi847);
-	hi847->streaming = 0;
-	mutex_unlock(&hi847->mutex);
-	return ret;
-}
-
 static int hi847_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
@@ -2980,10 +2933,6 @@ static int hi847_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops hi847_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(hi847_suspend, hi847_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi847_acpi_ids[] = {
 	{"HYV0847"},
@@ -2996,7 +2945,6 @@ MODULE_DEVICE_TABLE(acpi, hi847_acpi_ids);
 static struct i2c_driver hi847_i2c_driver = {
 	.driver = {
 		.name = "hi847",
-		.pm = &hi847_pm_ops,
 		.acpi_match_table = ACPI_PTR(hi847_acpi_ids),
 	},
 	.probe = hi847_probe,
-- 
Regards,

Laurent Pinchart

