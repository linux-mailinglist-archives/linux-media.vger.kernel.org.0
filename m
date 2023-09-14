Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3577A0C96
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241611AbjINSSP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241609AbjINSSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04CF1FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C32E08823;
        Thu, 14 Sep 2023 20:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715395;
        bh=rkAFeMqLpIu1LCI/KDOSQPoAE8v9CRMmiwbK+LEAaxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ajOhteqScQ0Epo6P49LT0If02dd4V3HRId2Q8jWSC0CmOHW3dSEqgvqGL1666NIkS
         IWTNk0Bp4NJmIvI56i0QM6UQhZB77LtXzoV5ZPTN4VzMol6HYUI/yCRc2Mn8WuWBg/
         lZ9IoPIs6ThAGcjmfLE2UxWld9YvRfCYGhrpv3qw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 55/57] media: i2c: ov5675: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:17:02 +0300
Message-ID: <20230914181704.4811-56-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5675.c | 41 --------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index f608ee0c0cec..e63d9d402d34 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -513,9 +513,6 @@ struct ov5675 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -968,7 +965,6 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov5675->streaming = enable;
 	mutex_unlock(&ov5675->mutex);
 
 	return ret;
@@ -1024,42 +1020,6 @@ static int ov5675_power_on(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ov5675_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov5675 *ov5675 = to_ov5675(sd);
-
-	mutex_lock(&ov5675->mutex);
-	if (ov5675->streaming)
-		ov5675_stop_streaming(ov5675);
-
-	mutex_unlock(&ov5675->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused ov5675_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov5675 *ov5675 = to_ov5675(sd);
-	int ret;
-
-	mutex_lock(&ov5675->mutex);
-	if (ov5675->streaming) {
-		ret = ov5675_start_streaming(ov5675);
-		if (ret) {
-			ov5675->streaming = false;
-			ov5675_stop_streaming(ov5675);
-			mutex_unlock(&ov5675->mutex);
-			return ret;
-		}
-	}
-
-	mutex_unlock(&ov5675->mutex);
-
-	return 0;
-}
-
 static int ov5675_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
@@ -1406,7 +1366,6 @@ static int ov5675_probe(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops ov5675_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov5675_suspend, ov5675_resume)
 	SET_RUNTIME_PM_OPS(ov5675_power_off, ov5675_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

