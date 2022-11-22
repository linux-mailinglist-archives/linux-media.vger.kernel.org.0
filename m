Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFBCB634A18
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbiKVWdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235201AbiKVWdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD749DBA6
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47D5712B9;
        Tue, 22 Nov 2022 23:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156400;
        bh=bigpT0YBq0tsg3EkhLHG03leDGk+cRG9iSNgfqoA7Pg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M9rfnmeKF1CIrg/TiMAkS3dm5OHF5ExDiijBOHRXrhRyMZrSi1M0jD2VcWssaLucT
         LGckDXWH9Dhlp5BrcE8EwHSZdWU7OjrOmErQ1gPPKmZZpYSsi9ZBGkEkzHTO6ul980
         5JSQcZVTBhXzIGR/KCDUYtHleHX1zyCa4fwk10Rg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 10/15] media: i2c: imx290: Factor out clock initialization to separate function
Date:   Wed, 23 Nov 2022 00:32:45 +0200
Message-Id: <20221122223250.21233-11-laurent.pinchart@ideasonboard.com>
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

Move the external clock initialization code from probe() to a separate
function to improve readability. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 57 +++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index d423860402fd..848de4c90d3b 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1117,6 +1117,34 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
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
@@ -1201,7 +1229,6 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx290 *imx290;
-	u32 xclk_freq;
 	u32 chip_id;
 	int ret;
 
@@ -1220,32 +1247,12 @@ static int imx290_probe(struct i2c_client *client)
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
@@ -1256,8 +1263,14 @@ static int imx290_probe(struct i2c_client *client)
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

