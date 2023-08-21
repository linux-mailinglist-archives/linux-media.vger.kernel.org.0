Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B3E7835C5
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjHUWai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjHUWaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B728B189
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EAE087F4;
        Tue, 22 Aug 2023 00:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656939;
        bh=fmE8kvSiGPUvcBXXTx/9/aHNT4B+KkM3dj8vF0/IFp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AOn8snF9uvZQojL1FBpEVUJt4cR0skdm0hq8LmrlJjPjMEeNzIIsZAJtrEyzgESGZ
         oha/fkKhCDAZpVqHfvbZ/anBSNx3WcO+fJaywY2S6UoFW7z1FejMRsGTEl+A2t1VJw
         RhFRAr2llnAgZ7rNEylIIC4kLqcm8URRDpDfv9oY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume operations
Date:   Tue, 22 Aug 2023 01:29:57 +0300
Message-ID: <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 227c227cf4ce..da2a8d0210fa 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -359,9 +359,6 @@ struct imx219 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* Two or Four lanes */
 	u8 lanes;
 };
@@ -764,24 +761,11 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 
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
@@ -1015,41 +999,6 @@ static int imx219_power_off(struct device *dev)
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
@@ -1295,7 +1244,6 @@ static const struct of_device_id imx219_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, imx219_dt_ids);
 
 static const struct dev_pm_ops imx219_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
 	SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

