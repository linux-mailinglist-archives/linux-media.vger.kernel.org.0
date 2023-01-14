Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4DB66ACF4
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjANRSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjANRSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F08EB752
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B09134DD;
        Sat, 14 Jan 2023 18:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716683;
        bh=Fz0zTnhXhap1MkVqIiwV6njxBpiOBSShi6NzEOrkNcU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CfcbpEk/CoujuK+QOw4Y6j9KYIrYfYQc16NStCiBV1fIc1fl8nJEylUldI3QEHS1B
         uNgkKKkave6bpEC1KGfDsNh3ZfztCW9X1i+RTj8q+mfgpiRtovaiZiwMbl14F721l+
         nAyjZnuFlT7j5JktUKv0paFK+GH3yJFUkgZ05KXg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 02/17] media: i2c: imx290: Factor out subdev init and cleanup to functions
Date:   Sat, 14 Jan 2023 19:17:47 +0200
Message-Id: <20230114171802.13878-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
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

The probe() function is large. Make it more readable by factoring the
subdev initialization code out. While at it, rename the error labels as
the "free_" prefix isn't accurate.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Free control handler in imx290_subdev_init() error path
---
 drivers/media/i2c/imx290.c | 108 +++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ca2fa57c28fe..5529bd39238f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1015,6 +1015,47 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static int imx290_subdev_init(struct imx290 *imx290)
+{
+	struct i2c_client *client = to_i2c_client(imx290->dev);
+	int ret;
+
+	/*
+	 * Initialize the frame format. In particular, imx290->current_mode
+	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
+	 * below relies on these fields.
+	 */
+	imx290_entity_init_cfg(&imx290->sd, NULL);
+
+	ret = imx290_ctrl_init(imx290);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Control initialization error %d\n", ret);
+		return ret;
+	}
+
+	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
+	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx290->sd.dev = imx290->dev;
+	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
+	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not register media entity\n");
+		v4l2_ctrl_handler_free(&imx290->ctrls);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void imx290_subdev_cleanup(struct imx290 *imx290)
+{
+	media_entity_cleanup(&imx290->sd.entity);
+	v4l2_ctrl_handler_free(&imx290->ctrls);
+}
+
 /* ----------------------------------------------------------------------------
  * Power management
  */
@@ -1147,10 +1188,10 @@ static int imx290_probe(struct i2c_client *client)
 	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(dev, "Unsupported bus type, should be CSI2\n");
-		goto free_err;
+		goto err_endpoint;
 	} else if (ret) {
 		dev_err(dev, "Parsing endpoint node failed\n");
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	/* Get number of data lanes */
@@ -1158,7 +1199,7 @@ static int imx290_probe(struct i2c_client *client)
 	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
 		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
 		ret = -EINVAL;
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
@@ -1166,7 +1207,7 @@ static int imx290_probe(struct i2c_client *client)
 	if (!ep.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	/* Check that link frequences for all the modes are in device tree */
@@ -1174,7 +1215,7 @@ static int imx290_probe(struct i2c_client *client)
 	if (fq) {
 		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
 		ret = -EINVAL;
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	/* get system clock (xclk) */
@@ -1182,14 +1223,14 @@ static int imx290_probe(struct i2c_client *client)
 	if (IS_ERR(imx290->xclk)) {
 		dev_err(dev, "Could not get xclk");
 		ret = PTR_ERR(imx290->xclk);
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 				       &xclk_freq);
 	if (ret) {
 		dev_err(dev, "Could not get xclk frequency\n");
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	/* external clock must be 37.125 MHz */
@@ -1197,19 +1238,19 @@ static int imx290_probe(struct i2c_client *client)
 		dev_err(dev, "External clock frequency %u is not supported\n",
 			xclk_freq);
 		ret = -EINVAL;
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	ret = clk_set_rate(imx290->xclk, xclk_freq);
 	if (ret) {
 		dev_err(dev, "Could not set xclk frequency\n");
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	ret = imx290_get_regulators(dev, imx290);
 	if (ret < 0) {
 		dev_err(dev, "Cannot get regulators\n");
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -1217,48 +1258,26 @@ static int imx290_probe(struct i2c_client *client)
 	if (IS_ERR(imx290->rst_gpio)) {
 		dev_err(dev, "Cannot get reset gpio\n");
 		ret = PTR_ERR(imx290->rst_gpio);
-		goto free_err;
+		goto err_endpoint;
 	}
 
 	mutex_init(&imx290->lock);
 
-	/*
-	 * Initialize the frame format. In particular, imx290->current_mode
-	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
-	 * below relies on these fields.
-	 */
-	imx290_entity_init_cfg(&imx290->sd, NULL);
-
-	ret = imx290_ctrl_init(imx290);
-	if (ret < 0) {
-		dev_err(dev, "Control initialization error %d\n", ret);
-		goto free_mutex;
-	}
-
-	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
-	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	imx290->sd.dev = &client->dev;
-	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
-	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-
-	imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
-	if (ret < 0) {
-		dev_err(dev, "Could not register media entity\n");
-		goto free_ctrl;
-	}
+	ret = imx290_subdev_init(imx290);
+	if (ret)
+		goto err_mutex;
 
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
 		dev_err(dev, "Could not register v4l2 device\n");
-		goto free_entity;
+		goto err_subdev;
 	}
 
 	/* Power on the device to match runtime PM state below */
 	ret = imx290_power_on(dev);
 	if (ret < 0) {
 		dev_err(dev, "Could not power on the device\n");
-		goto free_entity;
+		goto err_subdev;
 	}
 
 	pm_runtime_set_active(dev);
@@ -1269,13 +1288,11 @@ static int imx290_probe(struct i2c_client *client)
 
 	return 0;
 
-free_entity:
-	media_entity_cleanup(&imx290->sd.entity);
-free_ctrl:
-	v4l2_ctrl_handler_free(&imx290->ctrls);
-free_mutex:
+err_subdev:
+	imx290_subdev_cleanup(imx290);
+err_mutex:
 	mutex_destroy(&imx290->lock);
-free_err:
+err_endpoint:
 	v4l2_fwnode_endpoint_free(&ep);
 
 	return ret;
@@ -1287,8 +1304,7 @@ static void imx290_remove(struct i2c_client *client)
 	struct imx290 *imx290 = to_imx290(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	imx290_subdev_cleanup(imx290);
 
 	mutex_destroy(&imx290->lock);
 
-- 
Regards,

Laurent Pinchart

