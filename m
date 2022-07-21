Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6976157C658
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiGUIfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGUIfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C0B1180F
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 024E2825;
        Thu, 21 Jul 2022 10:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392548;
        bh=gM1ztLPMvFlQU+2XPl4hD5NaeJG2KTI/qFMcJVgcajY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uxTtBHRlRxLytZ7+i2oeiCYYoMjbscLGaK33ioYOYINVPuuZJR3MZm9blmLI4xuFm
         aYwf1o0Sd1DTHec7EanXR7gASDR4zdNWI+zO/6dfYGH2jEiJaCerkelrjYe58RomUo
         BMfFzPDMXvWHqX+1odHkztyPvxSPGEfgWLCol7qg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 04/19] media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
Date:   Thu, 21 Jul 2022 11:35:25 +0300
Message-Id: <20220721083540.1525-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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

Use ARRAY_SIZE(imx290->supplies) for code that needs the size of the
array, instead of relying on the IMX290_NUM_SUPPLIES. The result is less
error-prone as it ties the size to the array.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f60a4135dc9c..9a0c458a3af0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -790,10 +790,10 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
 {
 	unsigned int i;
 
-	for (i = 0; i < IMX290_NUM_SUPPLIES; i++)
+	for (i = 0; i < ARRAY_SIZE(imx290->supplies); i++)
 		imx290->supplies[i].supply = imx290_supply_name[i];
 
-	return devm_regulator_bulk_get(dev, IMX290_NUM_SUPPLIES,
+	return devm_regulator_bulk_get(dev, ARRAY_SIZE(imx290->supplies),
 				       imx290->supplies);
 }
 
@@ -852,7 +852,8 @@ static int imx290_power_on(struct device *dev)
 		return ret;
 	}
 
-	ret = regulator_bulk_enable(IMX290_NUM_SUPPLIES, imx290->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx290->supplies),
+				    imx290->supplies);
 	if (ret) {
 		dev_err(dev, "Failed to enable regulators\n");
 		clk_disable_unprepare(imx290->xclk);
@@ -876,7 +877,7 @@ static int imx290_power_off(struct device *dev)
 
 	clk_disable_unprepare(imx290->xclk);
 	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
-	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies), imx290->supplies);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

