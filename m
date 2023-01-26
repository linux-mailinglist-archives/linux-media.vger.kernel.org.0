Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238EC67CF3D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjAZPHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjAZPHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479256B9B5
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0031CB81DEF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27C8C4339B;
        Thu, 26 Jan 2023 15:07:09 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH 09/17] media: nxp: imx-jpeg: replace dummy gotos by returns
Date:   Thu, 26 Jan 2023 16:06:49 +0100
Message-Id: <20230126150657.367921-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The err_irq and err_clk labels just did a 'return ret'. So
drop these and replace them by just a return.

This fixes a smatch warning:

mxc-jpeg.c:2492 mxc_jpeg_probe() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 6cd015a35f7c..552d0900cb26 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2445,7 +2445,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "No suitable DMA available.\n");
-		goto err_irq;
+		return ret;
 	}
 
 	jpeg->base_reg = devm_platform_ioremap_resource(pdev, 0);
@@ -2454,16 +2454,14 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 
 	for (slot = 0; slot < MXC_MAX_SLOTS; slot++) {
 		dec_irq = platform_get_irq(pdev, slot);
-		if (dec_irq < 0) {
-			ret = dec_irq;
-			goto err_irq;
-		}
+		if (dec_irq < 0)
+			return dec_irq;
 		ret = devm_request_irq(&pdev->dev, dec_irq, mxc_jpeg_dec_irq,
 				       0, pdev->name, jpeg);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to request irq %d (%d)\n",
 				dec_irq, ret);
-			goto err_irq;
+			return ret;
 		}
 	}
 
@@ -2475,15 +2473,13 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->clk_ipg = devm_clk_get(dev, "ipg");
 	if (IS_ERR(jpeg->clk_ipg)) {
 		dev_err(dev, "failed to get clock: ipg\n");
-		ret = PTR_ERR(jpeg->clk_ipg);
-		goto err_clk;
+		return PTR_ERR(jpeg->clk_ipg);
 	}
 
 	jpeg->clk_per = devm_clk_get(dev, "per");
 	if (IS_ERR(jpeg->clk_per)) {
 		dev_err(dev, "failed to get clock: per\n");
-		ret = PTR_ERR(jpeg->clk_per);
-		goto err_clk;
+		return PTR_ERR(jpeg->clk_per);
 	}
 
 	ret = mxc_jpeg_attach_pm_domains(jpeg);
@@ -2569,9 +2565,6 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 
 err_register:
 	mxc_jpeg_detach_pm_domains(jpeg);
-
-err_irq:
-err_clk:
 	return ret;
 }
 
-- 
2.39.0

