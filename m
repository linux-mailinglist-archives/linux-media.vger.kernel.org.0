Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F07F5FFD77
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiJPGP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiJPGP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:15:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC19A3846D
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:15:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EA70BB3;
        Sun, 16 Oct 2022 08:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900955;
        bh=XX7iVu1rjCVujnNc0BvwN8j44mW7wxcqxtpsQn5Hubc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=prdXkRDUxq4Gc6TPL68rbTe4odE5j/axiebpuM5Dmvwz36Y/hDg8ZEWOZPIrJOucO
         0bUnRS77h2cZyGyto9R/MQbwfjJeRIA2+BzzSNwDjVPO9nrYAnRmvRUsUWbxM8AtAe
         N1jRk9Z6rNbotuB8PzhscIC9JGO9elF47BvXYm6c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 04/20] media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
Date:   Sun, 16 Oct 2022 09:15:07 +0300
Message-Id: <20221016061523.30127-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 64bd43813dbf..0f32f391b2e7 100644
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

