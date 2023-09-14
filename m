Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6487A0C84
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbjINSRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbjINSRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC701FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AF232C95;
        Thu, 14 Sep 2023 20:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715375;
        bh=0eobgMieWgyf+zbMonmBtupQFdSevmKGyrJNPs1AYjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GmWTzqluX2xEZ+F20pM8RLX73olGY6abV6IBrJckSXzBElPFHH1r9hmgP+igU6p6O
         I/SE9r8FRvYQpKuQLCL/eY07dZyRvYrg47cz/SLq7pTvFN6GJNorzIrteR+PO1wMhy
         YuJiwC5kP3IvB6mgRaesa5SuyFTXZgjXKC4eK1zw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 40/57] media: i2c: imx208: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:47 +0300
Message-ID: <20230914181704.4811-41-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx208.c | 43 --------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 871f857cf8b6..35e42444351a 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -290,9 +290,6 @@ struct imx208 {
 	 */
 	struct mutex imx208_mx;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* OTP data */
 	bool otp_read;
 	char otp_data[IMX208_OTP_SIZE];
@@ -732,7 +729,6 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	imx208->streaming = enable;
 	mutex_unlock(&imx208->imx208_mx);
 
 	/* vflip and hflip cannot change during streaming */
@@ -748,40 +744,6 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused imx208_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx208 *imx208 = to_imx208(sd);
-
-	if (imx208->streaming)
-		imx208_stop_streaming(imx208);
-
-	return 0;
-}
-
-static int __maybe_unused imx208_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx208 *imx208 = to_imx208(sd);
-	int ret;
-
-	if (imx208->streaming) {
-		ret = imx208_start_streaming(imx208);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx208_stop_streaming(imx208);
-	imx208->streaming = 0;
-
-	return ret;
-}
-
 /* Verify chip ID */
 static const struct v4l2_subdev_video_ops imx208_video_ops = {
 	.s_stream = imx208_set_stream,
@@ -1077,10 +1039,6 @@ static void imx208_remove(struct i2c_client *client)
 	mutex_destroy(&imx208->imx208_mx);
 }
 
-static const struct dev_pm_ops imx208_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx208_suspend, imx208_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id imx208_acpi_ids[] = {
 	{ "INT3478" },
@@ -1093,7 +1051,6 @@ MODULE_DEVICE_TABLE(acpi, imx208_acpi_ids);
 static struct i2c_driver imx208_i2c_driver = {
 	.driver = {
 		.name = "imx208",
-		.pm = &imx208_pm_ops,
 		.acpi_match_table = ACPI_PTR(imx208_acpi_ids),
 	},
 	.probe = imx208_probe,
-- 
Regards,

Laurent Pinchart

