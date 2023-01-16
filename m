Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611D766C2F0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbjAPO4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbjAPO4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C629227B9
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A631C121A;
        Mon, 16 Jan 2023 15:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880306;
        bh=O/yK5biMyjs94Bq97vLFe4qhgU1kL4St0i1wF5hnk2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r1inEuWmT/9bcJpy8ui6+0eIy4w7AhGvGhM5ncbmPUKuSgkl4wGrfmhajW6Cx7sze
         kcw/wVupTUe4aFWQ6XvSyUdJMybnpk7ohsvKmlfO9eCk0zXcL/jXDIM6AvAfaWM/Fo
         QWLlDUhdOUFN1Scn17D8P2tgCuSE/G4rLpTUKK7I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 09/17] media: i2c: imx290: Use dev_err_probe()
Date:   Mon, 16 Jan 2023 16:44:46 +0200
Message-Id: <20230116144454.1012-10-laurent.pinchart@ideasonboard.com>
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

Improve error handling in the probe() function with dev_err_probe().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 530da5b03e61..51f430ca3652 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1224,10 +1224,9 @@ static int imx290_probe(struct i2c_client *client)
 
 	/* get system clock (xclk) */
 	imx290->xclk = devm_clk_get(dev, "xclk");
-	if (IS_ERR(imx290->xclk)) {
-		dev_err(dev, "Could not get xclk");
-		return PTR_ERR(imx290->xclk);
-	}
+	if (IS_ERR(imx290->xclk))
+		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
+				     "Could not get xclk");
 
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 				       &xclk_freq);
@@ -1250,17 +1249,14 @@ static int imx290_probe(struct i2c_client *client)
 	}
 
 	ret = imx290_get_regulators(dev, imx290);
-	if (ret < 0) {
-		dev_err(dev, "Cannot get regulators\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot get regulators\n");
 
 	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_OUT_HIGH);
-	if (IS_ERR(imx290->rst_gpio)) {
-		dev_err(dev, "Cannot get reset gpio\n");
-		return PTR_ERR(imx290->rst_gpio);
-	}
+	if (IS_ERR(imx290->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
+				     "Cannot get reset gpio\n");
 
 	mutex_init(&imx290->lock);
 
-- 
Regards,

Laurent Pinchart

