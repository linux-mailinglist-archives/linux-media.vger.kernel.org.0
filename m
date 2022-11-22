Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E518634A16
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiKVWd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbiKVWd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F001B9DB94
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 825CE18E5;
        Tue, 22 Nov 2022 23:33:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156404;
        bh=0wVo+hQoXZWB1MTjD9E8sSSysBzai42Ac9XfVHfDgFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SYTrzOCgWMJmzq87AS6KRUCBZNqaNwRqsjj2FLmWPZBntp+UK0jq1Bk/xceF1FmdR
         5YYjzm1Cdoom9W8gvssPJw13sKp1S2Mt4heBU4SMzMsjVcvvI+Gr767NzyyCFCtMkg
         /KYBH+kSKOEytJI1c4pnQSLLBqfoYyon4yQRoQpA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 13/15] media: i2c: imx290: Use runtime PM autosuspend
Date:   Wed, 23 Nov 2022 00:32:48 +0200
Message-Id: <20221122223250.21233-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/i2c/imx290.c | 55 ++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index d279d6dd0cb4..dbed703fa199 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -817,12 +817,13 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
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
@@ -1250,18 +1251,16 @@ static int imx290_probe(struct i2c_client *client)
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
+	 * the sensor on manually here, identify it, and fully initialize it.
+	 */
 	ret = imx290_power_on(dev);
 	if (ret < 0) {
 		dev_err(dev, "Could not power on the device\n");
@@ -1271,21 +1270,45 @@ static int imx290_probe(struct i2c_client *client)
 	ret = imx290_read(imx290, IMX290_CHIP_ID, &chip_id);
 	if (ret) {
 		dev_err(dev, "Could not read chip ID: %d\n", ret);
-		imx290_power_off(dev);
-		goto err_subdev;
+		goto err_power;
 	}
 
 	dev_info(dev, "chip ID 0x%04x\n", chip_id);
 
+	/*
+	 * Enable runtime PM. As the device has been powered manually, mark it
+	 * as active, and increase the usage count without resuming the device.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
+
+	/* Register the V4L2 subdev. */
+	ret = v4l2_async_register_subdev(&imx290->sd);
+	if (ret < 0) {
+		dev_err(dev, "Could not register v4l2 device\n");
+		goto err_pm;
+	}
+
+	/*
+	 * Finally, enable autosuspend and decrease the usage count. The device
+	 * will get suspended after the autosuspend delay, turning the power
+	 * off.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
+err_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+err_power:
+	imx290_power_off(dev);
 err_subdev:
 	imx290_subdev_cleanup(imx290);
-
 	return ret;
 }
 
@@ -1297,6 +1320,10 @@ static void imx290_remove(struct i2c_client *client)
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

