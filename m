Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1975166C2F6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjAPO4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbjAPO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3321822A0F
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7D8AE7B;
        Mon, 16 Jan 2023 15:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880313;
        bh=c0ZZ8wsBeQ6eBljoEGCtuwjhuG80H1IwisAC/6peUDM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lsyw7ZOJoB8FoLDxHh+XeMscKI7IgdF8ETrhhd/W4jnrC4y5ZmDKGzJ9l2TzIZcPh
         yyMEJdq4DNYNSTAkYnb9Mr9opAOd11rnOQ8UyWRp+oesB9coYkWdxeinBbpcCPsuTN
         vQYnicsLFZRFmQXFgCb7Yl7z3417HkZf1apuuAac=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM before subdev
Date:   Mon, 16 Jan 2023 16:44:51 +0200
Message-Id: <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
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

Initializing the subdev before runtime PM means that no subdev
initialization can interact with the runtime PM framework. This can be
problematic when modifying controls, as the .s_ctrl() handler commonly
calls pm_runtime_get_if_in_use(). These code paths are not trivial,
making the driver fragile and possibly causing subtle bugs.

To make the subdev initialization more robust, initialize runtime PM
first.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v1:

    - Use the correct error label when subdev registration fails
---
 drivers/media/i2c/imx290.c | 59 ++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 324d30ed5617..4185835f065d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -581,9 +581,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	/*
 	 * Return immediately for controls that don't need to be applied to the
-	 * device. Those controls are modified in imx290_ctrl_update(), which
-	 * is called at probe time before runtime PM is initialized, so we
-	 * can't proceed to the pm_runtime_get_if_in_use() call below.
+	 * device.
 	 */
 	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
 		return 0;
@@ -1049,22 +1047,20 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
  * Power management
  */
 
-static int imx290_power_on(struct device *dev)
+static int imx290_power_on(struct imx290 *imx290)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx290 *imx290 = to_imx290(sd);
 	int ret;
 
 	ret = clk_prepare_enable(imx290->xclk);
 	if (ret) {
-		dev_err(dev, "Failed to enable clock\n");
+		dev_err(imx290->dev, "Failed to enable clock\n");
 		return ret;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(imx290->supplies),
 				    imx290->supplies);
 	if (ret) {
-		dev_err(dev, "Failed to enable regulators\n");
+		dev_err(imx290->dev, "Failed to enable regulators\n");
 		clk_disable_unprepare(imx290->xclk);
 		return ret;
 	}
@@ -1079,20 +1075,33 @@ static int imx290_power_on(struct device *dev)
 	return 0;
 }
 
-static int imx290_power_off(struct device *dev)
+static void imx290_power_off(struct imx290 *imx290)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx290 *imx290 = to_imx290(sd);
-
 	clk_disable_unprepare(imx290->xclk);
 	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies), imx290->supplies);
+}
+
+static int imx290_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx290 *imx290 = to_imx290(sd);
+
+	return imx290_power_on(imx290);
+}
+
+static int imx290_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx290 *imx290 = to_imx290(sd);
+
+	imx290_power_off(imx290);
 
 	return 0;
 }
 
 static const struct dev_pm_ops imx290_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
+	SET_RUNTIME_PM_OPS(imx290_runtime_suspend, imx290_runtime_resume, NULL)
 };
 
 /* ----------------------------------------------------------------------------
@@ -1271,20 +1280,15 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	/* Initialize the V4L2 subdev. */
-	ret = imx290_subdev_init(imx290);
-	if (ret)
-		return ret;
-
 	/*
 	 * Enable power management. The driver supports runtime PM, but needs to
 	 * work when runtime PM is disabled in the kernel. To that end, power
 	 * the sensor on manually here.
 	 */
-	ret = imx290_power_on(dev);
+	ret = imx290_power_on(imx290);
 	if (ret < 0) {
 		dev_err(dev, "Could not power on the device\n");
-		goto err_subdev;
+		return ret;
 	}
 
 	/*
@@ -1298,6 +1302,11 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	/* Initialize the V4L2 subdev. */
+	ret = imx290_subdev_init(imx290);
+	if (ret)
+		goto err_pm;
+
 	/*
 	 * Finally, register the V4L2 subdev. This must be done after
 	 * initializing everything as the subdev can be used immediately after
@@ -1306,7 +1315,7 @@ static int imx290_probe(struct i2c_client *client)
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
 		dev_err(dev, "Could not register v4l2 device\n");
-		goto err_pm;
+		goto err_subdev;
 	}
 
 	/*
@@ -1318,12 +1327,12 @@ static int imx290_probe(struct i2c_client *client)
 
 	return 0;
 
+err_subdev:
+	imx290_subdev_cleanup(imx290);
 err_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-	imx290_power_off(dev);
-err_subdev:
-	imx290_subdev_cleanup(imx290);
+	imx290_power_off(imx290);
 	return ret;
 }
 
@@ -1341,7 +1350,7 @@ static void imx290_remove(struct i2c_client *client)
 	 */
 	pm_runtime_disable(imx290->dev);
 	if (!pm_runtime_status_suspended(imx290->dev))
-		imx290_power_off(imx290->dev);
+		imx290_power_off(imx290);
 	pm_runtime_set_suspended(imx290->dev);
 }
 
-- 
Regards,

Laurent Pinchart

