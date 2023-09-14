Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135D67A0BEB
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 19:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239679AbjINRpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 13:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238757AbjINRpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 13:45:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACFA1FF5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 10:45:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F007A10FE;
        Thu, 14 Sep 2023 19:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694713454;
        bh=khoondCDmEFnZz4oX7t8mIIPRDQKNys9Y1UKRnE99BQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Nz8InAGYOBpxDI6EeDJOTQoR5KrbavE/BqIck9qyxdEyW8/jRMCU0YC9LjoeiDaX6
         WbXPBZ048OPqKaf38MpqfBei9RNNhZuu4MAw2DqIVcJsaUuelgX49mBMM4bT15tYq+
         0yFSqd8om7tkN2JKKVLsArKLTypjMwrdlgoX5Ap8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH] media: i2c: imx415: Replace streaming flag with runtime PM check
Date:   Thu, 14 Sep 2023 20:46:00 +0300
Message-ID: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The streaming flag in the driver private structure is used for the sole
purpose of gating register writes when setting a V4L2 control. This is
better handled by checking if the sensor is powered up using the runtime
PM API. Do so and drop the streaming flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx415.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 3f00172df3cc..346f623c1331 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -353,8 +353,6 @@ struct imx415 {
 
 	const struct imx415_clk_params *clk_params;
 
-	bool streaming;
-
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
 
@@ -542,8 +540,9 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	unsigned int vmax;
 	unsigned int flip;
+	int ret;
 
-	if (!sensor->streaming)
+	if (!pm_runtime_get_if_in_use(sensor->dev))
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
@@ -554,24 +553,33 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* clamp the exposure value to VMAX. */
 		vmax = format->height + sensor->vblank->cur.val;
 		ctrl->val = min_t(int, ctrl->val, vmax);
-		return imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
+		ret = imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
+		break;
 
 	case V4L2_CID_ANALOGUE_GAIN:
 		/* analogue gain in 0.3 dB step size */
 		return imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
+		break;
 
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
 		flip = (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
 		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
-		return imx415_write(sensor, IMX415_REVERSE, flip);
+		ret = imx415_write(sensor, IMX415_REVERSE, flip);
+		break;
 
 	case V4L2_CID_TEST_PATTERN:
-		return imx415_set_testpattern(sensor, ctrl->val);
+		ret = imx415_set_testpattern(sensor, ctrl->val);
+		break;
 
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
+
+	pm_runtime_put(sensor->dev);
+
+	return ret;
 }
 
 static const struct v4l2_ctrl_ops imx415_ctrl_ops = {
@@ -766,8 +774,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_mark_last_busy(sensor->dev);
 		pm_runtime_put_autosuspend(sensor->dev);
 
-		sensor->streaming = false;
-
 		goto unlock;
 	}
 
@@ -779,13 +785,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		goto err_pm;
 
-	/*
-	 * Set streaming to true to ensure __v4l2_ctrl_handler_setup() will set
-	 * the controls. The flag is reset to false further down if an error
-	 * occurs.
-	 */
-	sensor->streaming = true;
-
 	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls);
 	if (ret < 0)
 		goto err_pm;
@@ -807,7 +806,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
 	 * likely has no other chance to recover.
 	 */
 	pm_runtime_put_sync(sensor->dev);
-	sensor->streaming = false;
 
 	goto unlock;
 }

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
Regards,

Laurent Pinchart

