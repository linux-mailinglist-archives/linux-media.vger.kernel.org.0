Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21D07A0C86
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241535AbjINSR4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241496AbjINSRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B380A1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0DB8880E;
        Thu, 14 Sep 2023 20:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715378;
        bh=INdLoKdAMoqgv3bNlMtMOBQIN5g9jwLiuoUZ3pUZ6Ac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mj0dRFkd6rYpYjoMUOV9karOZQH3Kv82Nc2VBzi2g7RnqhjZRQLfryX8JtviZ1UUh
         guUSsBxpzwAYlE46xCu1uHwxVcVxkABy6reBwYrLWiFZRmLuZhiEYXbZFxEHoSh27n
         /xUJyo6MEBO6S5Ws8tJjqFyJN153eiTxg71njHow=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 42/57] media: i2c: imx219: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:49 +0300
Message-ID: <20230914181704.4811-43-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx219.c | 41 --------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 5715bbbc0820..a431dace0f33 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -479,9 +479,6 @@ struct imx219 {
 	/* Current mode */
 	const struct imx219_mode *mode;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* Two or Four lanes */
 	u8 lanes;
 };
@@ -991,8 +988,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 		imx219_stop_streaming(imx219);
 	}
 
-	imx219->streaming = enable;
-
 unlock:
 	v4l2_subdev_unlock_state(state);
 	return ret;
@@ -1044,41 +1039,6 @@ static int imx219_power_off(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused imx219_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx219 *imx219 = to_imx219(sd);
-
-	if (imx219->streaming)
-		imx219_stop_streaming(imx219);
-
-	return 0;
-}
-
-static int __maybe_unused imx219_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (imx219->streaming) {
-		state = v4l2_subdev_lock_and_get_active_state(sd);
-		ret = imx219_start_streaming(imx219, state);
-		v4l2_subdev_unlock_state(state);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx219_stop_streaming(imx219);
-	imx219->streaming = false;
-
-	return ret;
-}
-
 static int imx219_get_regulators(struct imx219 *imx219)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
@@ -1464,7 +1424,6 @@ static const struct of_device_id imx219_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, imx219_dt_ids);
 
 static const struct dev_pm_ops imx219_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
 	SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

