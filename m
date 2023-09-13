Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EA879EA3B
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241184AbjIMN4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241183AbjIMN4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B26E19BF
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59BF916C4;
        Wed, 13 Sep 2023 15:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613314;
        bh=dQUSD/YYCY9h3IZ+acUf3duigGsGxUMIM7n6OkCy7dc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FybeT2XA+zfVmCJO6hdNjgbpIHmhqOPmqUh28p7vZTySxmNV+UWVdk4L2CLegbX5a
         3Rg5fSO4hbR0PgUQOGvi5EIgT79fRL81zxerzXEEDRsmM2blj1fnQYqA36Af6bY97N
         rL5hfoEOH6yWMh2xh0YaqFIiKCYpjcnV6CM4MNbY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 15/20] media: i2c: imx219: Drop system suspend/resume operations
Date:   Wed, 13 Sep 2023 16:56:33 +0300
Message-ID: <20230913135638.26277-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to stop streaming at system suspend time, or restart it
when the system is resumed, as the host-side driver is responsible for
stopping and restarting the pipeline in a controlled way by calling the
.s_stream() operation. Drop the system suspend and resume handlers, and
simplify the .s_stream() handler as a result.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 56 ++------------------------------------
 1 file changed, 2 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8c928202a23b..a12ebf288dd2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -358,9 +358,6 @@ struct imx219 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* Two or Four lanes */
 	u8 lanes;
 };
@@ -763,24 +760,11 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	if (imx219->streaming == enable)
-		goto unlock;
-
-	if (enable) {
-		/*
-		 * Apply default & customized values
-		 * and then start streaming.
-		 */
+	if (enable)
 		ret = imx219_start_streaming(imx219, state);
-		if (ret)
-			goto unlock;
-	} else {
+	else
 		imx219_stop_streaming(imx219);
-	}
 
-	imx219->streaming = enable;
-
-unlock:
 	v4l2_subdev_unlock_state(state);
 	return ret;
 }
@@ -1014,41 +998,6 @@ static int imx219_power_off(struct device *dev)
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
 /* -----------------------------------------------------------------------------
  * Probe & remove
  */
@@ -1294,7 +1243,6 @@ static const struct of_device_id imx219_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, imx219_dt_ids);
 
 static const struct dev_pm_ops imx219_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
 	SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

