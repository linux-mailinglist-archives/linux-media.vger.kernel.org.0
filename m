Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165EA66ACFB
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjANRST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjANRSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEABBB85
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC8021752;
        Sat, 14 Jan 2023 18:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716694;
        bh=NiUwLp/8TYSvuuqS8g9Tz71O1HCAVwZEQPnHzDz/CFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hfLMMkXXwF9xCBNGcXK8wfJu0dsCFPQzhzTO9vLGq48E8Nb6gezDl5mBL92iSsv1j
         V95+nBve4s5NjFoLTBodUhn+A+XKq+Mlxda/Ri+wvmBqEETKTDtnjeCEFp6/na8QWT
         lVoDuoBbXt+WfEOkg45gzoKh769U2B/H43NDN4LI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/17] media: i2c: imx290: Use dev_err_probe()
Date:   Sat, 14 Jan 2023 19:17:54 +0200
Message-Id: <20230114171802.13878-9-laurent.pinchart@ideasonboard.com>
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

Improve error handling in the probe() function with dev_err_probe().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 18c1e5c429a2..adccd0662afe 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1226,10 +1226,9 @@ static int imx290_probe(struct i2c_client *client)
 
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
@@ -1252,17 +1251,14 @@ static int imx290_probe(struct i2c_client *client)
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

