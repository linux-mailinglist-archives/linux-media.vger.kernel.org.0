Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD5166C2EE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbjAPO4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbjAPO4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18222685A
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BF8310B1;
        Mon, 16 Jan 2023 15:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880305;
        bh=a5GyEItpp3BdOsbla+ytBRNpsZEG+MpPypnBp8Fuc4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OViVZgCSquMwFhS3FHvMzDMqgU+f9Po26//t+mC/x71LS8fhBFp7sJ8piZEX2N8rV
         NZziPusUQeAq2U0XeHZL5FguyW8f8ibo3kkBHOJr9YtgQNX+kbFgxM2LCVRIxAg4ys
         w8isHJ/tjUTALTLDQBPhTbFfShnjNadlgd5M2Ry8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 08/17] media: i2c: imx290: Factor out DT parsing to separate function
Date:   Mon, 16 Jan 2023 16:44:45 +0200
Message-Id: <20230116144454.1012-9-laurent.pinchart@ideasonboard.com>
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

Make the probe() function more readable by factoring out the DT parsing
code to a separate function. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 95 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e7043e9a8fd5..530da5b03e61 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1142,111 +1142,124 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
 	return 0;
 }
 
-static int imx290_probe(struct i2c_client *client)
+static int imx290_parse_dt(struct imx290 *imx290)
 {
-	struct device *dev = &client->dev;
-	struct fwnode_handle *endpoint;
 	/* Only CSI2 is supported for now: */
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct imx290 *imx290;
-	u32 xclk_freq;
+	struct fwnode_handle *endpoint;
+	int ret;
 	s64 fq;
-	int ret;
 
-	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
-	if (!imx290)
-		return -ENOMEM;
-
-	imx290->dev = dev;
-	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
-	if (IS_ERR(imx290->regmap)) {
-		dev_err(dev, "Unable to initialize I2C\n");
-		return -ENODEV;
-	}
-
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
 	if (!endpoint) {
-		dev_err(dev, "Endpoint node not found\n");
+		dev_err(imx290->dev, "Endpoint node not found\n");
 		return -EINVAL;
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
 	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
-		dev_err(dev, "Unsupported bus type, should be CSI2\n");
-		goto err_endpoint;
+		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
+		goto done;
 	} else if (ret) {
-		dev_err(dev, "Parsing endpoint node failed\n");
-		goto err_endpoint;
+		dev_err(imx290->dev, "Parsing endpoint node failed\n");
+		goto done;
 	}
 
 	/* Get number of data lanes */
 	imx290->nlanes = ep.bus.mipi_csi2.num_data_lanes;
 	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
-		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
+		dev_err(imx290->dev, "Invalid data lanes: %d\n", imx290->nlanes);
 		ret = -EINVAL;
-		goto err_endpoint;
+		goto done;
 	}
 
-	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
+	dev_dbg(imx290->dev, "Using %u data lanes\n", imx290->nlanes);
 
 	if (!ep.nr_of_link_frequencies) {
-		dev_err(dev, "link-frequency property not found in DT\n");
+		dev_err(imx290->dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
-		goto err_endpoint;
+		goto done;
 	}
 
 	/* Check that link frequences for all the modes are in device tree */
 	fq = imx290_check_link_freqs(imx290, &ep);
 	if (fq) {
-		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
+		dev_err(imx290->dev, "Link frequency of %lld is not supported\n",
+			fq);
 		ret = -EINVAL;
-		goto err_endpoint;
+		goto done;
 	}
 
+	ret = 0;
+
+done:
+	v4l2_fwnode_endpoint_free(&ep);
+	return ret;
+}
+
+static int imx290_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct imx290 *imx290;
+	u32 xclk_freq;
+	int ret;
+
+	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
+	if (!imx290)
+		return -ENOMEM;
+
+	imx290->dev = dev;
+	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
+	if (IS_ERR(imx290->regmap)) {
+		dev_err(dev, "Unable to initialize I2C\n");
+		return -ENODEV;
+	}
+
+	ret = imx290_parse_dt(imx290);
+	if (ret)
+		return ret;
+
 	/* get system clock (xclk) */
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk)) {
 		dev_err(dev, "Could not get xclk");
-		ret = PTR_ERR(imx290->xclk);
-		goto err_endpoint;
+		return PTR_ERR(imx290->xclk);
 	}
 
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 				       &xclk_freq);
 	if (ret) {
 		dev_err(dev, "Could not get xclk frequency\n");
-		goto err_endpoint;
+		return ret;
 	}
 
 	/* external clock must be 37.125 MHz */
 	if (xclk_freq != 37125000) {
 		dev_err(dev, "External clock frequency %u is not supported\n",
 			xclk_freq);
-		ret = -EINVAL;
-		goto err_endpoint;
+		return -EINVAL;
 	}
 
 	ret = clk_set_rate(imx290->xclk, xclk_freq);
 	if (ret) {
 		dev_err(dev, "Could not set xclk frequency\n");
-		goto err_endpoint;
+		return ret;
 	}
 
 	ret = imx290_get_regulators(dev, imx290);
 	if (ret < 0) {
 		dev_err(dev, "Cannot get regulators\n");
-		goto err_endpoint;
+		return ret;
 	}
 
 	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(imx290->rst_gpio)) {
 		dev_err(dev, "Cannot get reset gpio\n");
-		ret = PTR_ERR(imx290->rst_gpio);
-		goto err_endpoint;
+		return PTR_ERR(imx290->rst_gpio);
 	}
 
 	mutex_init(&imx290->lock);
@@ -1272,16 +1285,12 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
-	v4l2_fwnode_endpoint_free(&ep);
-
 	return 0;
 
 err_subdev:
 	imx290_subdev_cleanup(imx290);
 err_mutex:
 	mutex_destroy(&imx290->lock);
-err_endpoint:
-	v4l2_fwnode_endpoint_free(&ep);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

