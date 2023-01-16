Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EFF66C2F1
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjAPO4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbjAPO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D453122A1C
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CAD1802;
        Mon, 16 Jan 2023 15:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880308;
        bh=RBGJ8KrH4cLXCrEs1R5tdbqqmAjnrcfGq1QbCZdTM5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GhxeO8Y7NjxuRUnPsMZHMRxQV0kPeQPwcfKMExs185Fbw6v/ly24S9bxGqC6VQU9t
         QNc7EF1UWjQEroxl2m2RmdHP66fuReV9GNSREqFajGt9LZ5t0Oo1MceWqr/oUJCR5H
         tH2d15ar8gKhXlgVNDYIfhVXKn6gLbN9NNJFCTRU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 10/17] media: i2c: imx290: Factor out clock initialization to separate function
Date:   Mon, 16 Jan 2023 16:44:47 +0200
Message-Id: <20230116144454.1012-11-laurent.pinchart@ideasonboard.com>
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

Move the external clock initialization code from probe() to a separate
function to improve readability. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 57 +++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 51f430ca3652..c1d18ec51e41 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1120,6 +1120,34 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
 				       imx290->supplies);
 }
 
+static int imx290_init_clk(struct imx290 *imx290)
+{
+	u32 xclk_freq;
+	int ret;
+
+	ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
+				       "clock-frequency", &xclk_freq);
+	if (ret) {
+		dev_err(imx290->dev, "Could not get xclk frequency\n");
+		return ret;
+	}
+
+	/* external clock must be 37.125 MHz */
+	if (xclk_freq != 37125000) {
+		dev_err(imx290->dev, "External clock frequency %u is not supported\n",
+			xclk_freq);
+		return -EINVAL;
+	}
+
+	ret = clk_set_rate(imx290->xclk, xclk_freq);
+	if (ret) {
+		dev_err(imx290->dev, "Could not set xclk frequency\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Returns 0 if all link frequencies used by the driver for the given number
  * of MIPI data lanes are mentioned in the device tree, or the value of the
@@ -1204,7 +1232,6 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx290 *imx290;
-	u32 xclk_freq;
 	int ret;
 
 	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
@@ -1222,32 +1249,12 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	/* get system clock (xclk) */
+	/* Acquire resources. */
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
 				     "Could not get xclk");
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &xclk_freq);
-	if (ret) {
-		dev_err(dev, "Could not get xclk frequency\n");
-		return ret;
-	}
-
-	/* external clock must be 37.125 MHz */
-	if (xclk_freq != 37125000) {
-		dev_err(dev, "External clock frequency %u is not supported\n",
-			xclk_freq);
-		return -EINVAL;
-	}
-
-	ret = clk_set_rate(imx290->xclk, xclk_freq);
-	if (ret) {
-		dev_err(dev, "Could not set xclk frequency\n");
-		return ret;
-	}
-
 	ret = imx290_get_regulators(dev, imx290);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Cannot get regulators\n");
@@ -1258,8 +1265,14 @@ static int imx290_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
 				     "Cannot get reset gpio\n");
 
+	/* Initialize external clock frequency. */
+	ret = imx290_init_clk(imx290);
+	if (ret)
+		return ret;
+
 	mutex_init(&imx290->lock);
 
+	/* Initialize and register subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)
 		goto err_mutex;
-- 
Regards,

Laurent Pinchart

