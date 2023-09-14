Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF50C7A0C97
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbjINSSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241612AbjINSSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E231FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2253287E0;
        Thu, 14 Sep 2023 20:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715398;
        bh=e+g2UnWSpfpZA7YjPTz1i8nn38diio8lyD2V9Q1g7N0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wHDruZxcm2HIX3r3OuRr8EmcSNvk5QavnZ2VjKztkORexYV65aPrc/ZjDkv1rSyfM
         COVCY4SJapC/vaB0CRVX7w6CNAw+PAycC/og2DURsrvAh4kaYo1XNSw6w8jIUWN5FU
         OJY3iB/4TCgbwJ6ZF2uOE1LS1bGqiT647QMLEAc0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 56/57] media: i2c: ov8856: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:17:03 +0300
Message-ID: <20230914181704.4811-57-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov8856.c | 44 --------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 5447a3361976..a0f673a24e52 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1438,9 +1438,6 @@ struct ov8856 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* lanes index */
 	u8 nlanes;
 
@@ -2061,7 +2058,6 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov8856->streaming = enable;
 	mutex_unlock(&ov8856->mutex);
 
 	return ret;
@@ -2122,45 +2118,6 @@ static int ov8856_power_off(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ov8856_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov8856 *ov8856 = to_ov8856(sd);
-
-	mutex_lock(&ov8856->mutex);
-	if (ov8856->streaming)
-		ov8856_stop_streaming(ov8856);
-
-	ov8856_power_off(dev);
-	mutex_unlock(&ov8856->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused ov8856_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov8856 *ov8856 = to_ov8856(sd);
-	int ret;
-
-	mutex_lock(&ov8856->mutex);
-
-	ov8856_power_on(dev);
-	if (ov8856->streaming) {
-		ret = ov8856_start_streaming(ov8856);
-		if (ret) {
-			ov8856->streaming = false;
-			ov8856_stop_streaming(ov8856);
-			mutex_unlock(&ov8856->mutex);
-			return ret;
-		}
-	}
-
-	mutex_unlock(&ov8856->mutex);
-
-	return 0;
-}
-
 static int ov8856_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
@@ -2498,7 +2455,6 @@ static int ov8856_probe(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops ov8856_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov8856_suspend, ov8856_resume)
 	SET_RUNTIME_PM_OPS(ov8856_power_off, ov8856_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

