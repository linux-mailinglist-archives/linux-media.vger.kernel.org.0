Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF75634A0D
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbiKVWdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbiKVWdV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7812BA13F2
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0FEA133C;
        Tue, 22 Nov 2022 23:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156399;
        bh=wr+HqB/J6QkGFyok9rE1gdPJAwT/Fi8FatG0ujOnSVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IgfoizAB/hubWjEELuuCkj92X+QAyIsq2GgWNy8brOn7mzau/lnyNHZ4hcKwBXUZL
         hAfLENY9o+ofRKB2Uz3GO7xqtwXVST72+jpO8GH9C/YOHkoGuSp+EVNiwula0Jk7ad
         Nj9sgC+aJRFZIqcjyFZmDciX7lABMxooa0MoMWEI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 09/15] media: i2c: imx290: Use dev_err_probe()
Date:   Wed, 23 Nov 2022 00:32:44 +0200
Message-Id: <20221122223250.21233-10-laurent.pinchart@ideasonboard.com>
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

Improve error handling in the probe() function with dev_err_probe().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 655f676df3d2..d423860402fd 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1222,10 +1222,9 @@ static int imx290_probe(struct i2c_client *client)
 
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
@@ -1248,17 +1247,14 @@ static int imx290_probe(struct i2c_client *client)
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

