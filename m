Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F225166C2F3
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjAPO4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjAPO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2E922031
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AC9D1211;
        Mon, 16 Jan 2023 15:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880312;
        bh=chk4lwu76avjoora6WI50YHlzUsWp+N10fd4v4VY9AU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sJIYqG5KJsW2jhLHyxSLahjIcyhBMo7L3oAcr/9Y0jpMGAIHo8T60qbLZRrL43Jxb
         Kxm4QC5buUXRFXioPFCqm+Jw6OsI0Om4ZR96j/jtyO8EdAG28tsM2BHH6+uczYdP8g
         WhjOhJibp+t5zFnsFGGgds4IiUD8bZDpfU5Z9iFI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 13/17] media: i2c: imx290: Use runtime PM autosuspend
Date:   Mon, 16 Jan 2023 16:44:50 +0200
Message-Id: <20230116144454.1012-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use runtime PM autosuspend to avoid powering off the sensor during fast
stop-reconfigure-restart cycles. This also fixes runtime PM handling in
the probe function that didn't suspend the device, effectively leaving
it resumed forever.

While at it, improve documentation of power management in probe() and
remove().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v2:

- Use the correct error label when subdev registration fails

Changes since v1:

- Enable autosuspend before registering the subdev
- Decrease the PM usage count after registering the subdev
- Use pm_runtime_put_autosuspend() in imx290_set_ctrl()
---
 drivers/media/i2c/imx290.c | 58 +++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7356279822e8..324d30ed5617 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -626,7 +626,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(imx290->dev);
+	pm_runtime_mark_last_busy(imx290->dev);
+	pm_runtime_put_autosuspend(imx290->dev);
 
 	return ret;
 }
@@ -827,12 +828,13 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 		ret = imx290_start_streaming(imx290, state);
 		if (ret) {
 			dev_err(imx290->dev, "Start stream failed\n");
-			pm_runtime_put(imx290->dev);
+			pm_runtime_put_sync(imx290->dev);
 			goto unlock;
 		}
 	} else {
 		imx290_stop_streaming(imx290);
-		pm_runtime_put(imx290->dev);
+		pm_runtime_mark_last_busy(imx290->dev);
+		pm_runtime_put_autosuspend(imx290->dev);
 	}
 
 unlock:
@@ -1269,33 +1271,59 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	/* Initialize and register subdev. */
+	/* Initialize the V4L2 subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)
 		return ret;
 
-	ret = v4l2_async_register_subdev(&imx290->sd);
-	if (ret < 0) {
-		dev_err(dev, "Could not register v4l2 device\n");
-		goto err_subdev;
-	}
-
-	/* Power on the device to match runtime PM state below */
+	/*
+	 * Enable power management. The driver supports runtime PM, but needs to
+	 * work when runtime PM is disabled in the kernel. To that end, power
+	 * the sensor on manually here.
+	 */
 	ret = imx290_power_on(dev);
 	if (ret < 0) {
 		dev_err(dev, "Could not power on the device\n");
 		goto err_subdev;
 	}
 
+	/*
+	 * Enable runtime PM with autosuspend. As the device has been powered
+	 * manually, mark it as active, and increase the usage count without
+	 * resuming the device.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
+	/*
+	 * Finally, register the V4L2 subdev. This must be done after
+	 * initializing everything as the subdev can be used immediately after
+	 * being registered.
+	 */
+	ret = v4l2_async_register_subdev(&imx290->sd);
+	if (ret < 0) {
+		dev_err(dev, "Could not register v4l2 device\n");
+		goto err_pm;
+	}
+
+	/*
+	 * Decrease the PM usage count. The device will get suspended after the
+	 * autosuspend delay, turning the power off.
+	 */
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
+err_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	imx290_power_off(dev);
 err_subdev:
 	imx290_subdev_cleanup(imx290);
-
 	return ret;
 }
 
@@ -1307,6 +1335,10 @@ static void imx290_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	imx290_subdev_cleanup(imx290);
 
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
 	pm_runtime_disable(imx290->dev);
 	if (!pm_runtime_status_suspended(imx290->dev))
 		imx290_power_off(imx290->dev);
-- 
Regards,

Laurent Pinchart

