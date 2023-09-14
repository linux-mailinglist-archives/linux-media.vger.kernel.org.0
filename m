Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503447A0C85
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241521AbjINSRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241500AbjINSRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AA71FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 811F987E8;
        Thu, 14 Sep 2023 20:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715376;
        bh=li+Vmb2brQUYoBVQ5h0+IwQu258ykmA/Dl+ApxhOlv8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PNuOhecoqOpWxBkuYhuaiCQ2/DAijJK5vUFm3CEaHDG2zLf8f2zjaXO6GqMj5TnIy
         kZt2qtLi6VIiwSgUW5TLdU9UZRvvwD0IN2T8ez+ilQkaR+rD7MxZQAVHFWn69bBsUG
         lzuK4RrYMyzJsbybgVsmaHZOVOxwzNcER6jv6CbM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH 41/57] media: i2c: imx214: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:48 +0300
Message-ID: <20230914181704.4811-42-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx214.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e2805173f4b1..4f77ea02cc27 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -58,8 +58,6 @@ struct imx214 {
 	 * and start streaming.
 	 */
 	struct mutex mutex;
-
-	bool streaming;
 };
 
 struct reg_8 {
@@ -790,7 +788,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		pm_runtime_put(imx214->dev);
 	}
 
-	imx214->streaming = enable;
 	return 0;
 
 err_rpm_put:
@@ -906,39 +903,6 @@ static int imx214_parse_fwnode(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused imx214_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx214 *imx214 = to_imx214(sd);
-
-	if (imx214->streaming)
-		imx214_stop_streaming(imx214);
-
-	return 0;
-}
-
-static int __maybe_unused imx214_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx214 *imx214 = to_imx214(sd);
-	int ret;
-
-	if (imx214->streaming) {
-		ret = imx214_start_streaming(imx214);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx214_stop_streaming(imx214);
-	imx214->streaming = 0;
-	return ret;
-}
-
 static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1099,7 +1063,6 @@ static const struct of_device_id imx214_of_match[] = {
 MODULE_DEVICE_TABLE(of, imx214_of_match);
 
 static const struct dev_pm_ops imx214_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx214_suspend, imx214_resume)
 	SET_RUNTIME_PM_OPS(imx214_power_off, imx214_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

