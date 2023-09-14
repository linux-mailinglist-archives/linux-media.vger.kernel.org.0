Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655FA7A0C87
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241496AbjINSR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241502AbjINSR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0601E1FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23D0D8814;
        Thu, 14 Sep 2023 20:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715379;
        bh=kikZcn4voBaRAW+9NydraGM2AgP6F92GKgle0Xw2tH4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=El4vBrwfeCoG8bsJFOjnavThggj4zczUu5r0JBvPtwi+0jKh2qxW+lakX2Ju1k+rL
         K7E/kETEHm0HPvKQ/TEdQ6RZdruqYfiAmc1yaVS+InK5ZXdw+7TAxA/S02jBT/3kuN
         20aVPDg18hitjXWxOXIt6WC7RVqImcyozNZ1mYeI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 43/57] media: i2c: imx258: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:50 +0300
Message-ID: <20230914181704.4811-44-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx258.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 4be0422b7cda..b3827f4bc0eb 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -622,9 +622,6 @@ struct imx258 {
 	 */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	struct clk *clk;
 };
 
@@ -1053,7 +1050,6 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	imx258->streaming = enable;
 	mutex_unlock(&imx258->mutex);
 
 	return ret;
@@ -1066,37 +1062,6 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused imx258_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx258 *imx258 = to_imx258(sd);
-
-	if (imx258->streaming)
-		imx258_stop_streaming(imx258);
-
-	return 0;
-}
-
-static int __maybe_unused imx258_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx258 *imx258 = to_imx258(sd);
-	int ret;
-
-	if (imx258->streaming) {
-		ret = imx258_start_streaming(imx258);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx258_stop_streaming(imx258);
-	imx258->streaming = 0;
-	return ret;
-}
-
 /* Verify chip ID */
 static int imx258_identify_module(struct imx258 *imx258)
 {
@@ -1365,7 +1330,6 @@ static void imx258_remove(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops imx258_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx258_suspend, imx258_resume)
 	SET_RUNTIME_PM_OPS(imx258_power_off, imx258_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

