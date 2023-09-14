Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDB77A0BF2
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 19:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239714AbjINRqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 13:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238757AbjINRqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 13:46:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76781FF5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 10:46:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18B410FE;
        Thu, 14 Sep 2023 19:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694713500;
        bh=cUsJr2DhLpxwb10UV8/oGTxlrrucD7/sehzrRsgT2ms=;
        h=From:To:Cc:Subject:Date:From;
        b=oavRFVSOqnVXk0P952PZIS3OTxsBaizfHBnSOKf+ulWH0GSXOEPhg3D1LeTiMQokw
         aki8o9i/VXqFssUPUXqL0pqZnZ+PnwLWy/4C1aQz2NrDEp3hraHutFKOFAN5kpLTDA
         CXXMa+Tp3RrUNb3m4X8Yjj//wO9EL+onK5Ag928g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] media: i2c: imx296: Replace streaming flag with runtime PM check
Date:   Thu, 14 Sep 2023 20:46:47 +0300
Message-ID: <20230914174647.954-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx296.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 3b4539b622b4..94aac9d2732f 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -201,8 +201,6 @@ struct imx296 {
 	const struct imx296_clk_params *clk_params;
 	bool mono;
 
-	bool streaming;
-
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
 
@@ -321,7 +319,7 @@ static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int vmax;
 	int ret = 0;
 
-	if (!sensor->streaming)
+	if (!pm_runtime_get_if_in_use(sensor->dev))
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
@@ -376,6 +374,8 @@ static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(sensor->dev);
+
 	return ret;
 }
 
@@ -607,8 +607,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_mark_last_busy(sensor->dev);
 		pm_runtime_put_autosuspend(sensor->dev);
 
-		sensor->streaming = false;
-
 		goto unlock;
 	}
 
@@ -620,13 +618,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret < 0)
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
@@ -646,7 +637,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
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

