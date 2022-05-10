Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4551152149F
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiEJMDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbiEJMDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA91146163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:12 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57F8DB60;
        Tue, 10 May 2022 13:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183951;
        bh=ID7KsvsOkIXuQ4cSOB4gIYwOWmaaua/BqNjfCaF7y3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1oe320a/YvZwL2x4zvkz6kY37pWyHxXrpdvkNZ8yX08ROY2vGP4JDxrSy9ufdHTA
         mKpOBF9SnSTD/ak9OGgyy+sZewjPmdWShgLqxrBBy7vWY3KUQfWMxsgPxoxS2ziNzh
         chv55gSvdm4vNaU5ojWAUECbKr8Yph3a9rMlC17o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 01/50] staging: media: imx: imx7-media-csi: Initialize locks early on
Date:   Tue, 10 May 2022 14:58:10 +0300
Message-Id: <20220510115859.19777-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Group all the direct initialization of imx7_csi fields at the beginning
of the imx7_csi_probe() function instead of spreading them around.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8467a1491048..893620e8fc03 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1188,27 +1188,32 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	csi->dev = dev;
+	platform_set_drvdata(pdev, &csi->sd);
+
+	spin_lock_init(&csi->irqlock);
+	mutex_init(&csi->lock);
 
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(csi->mclk)) {
 		ret = PTR_ERR(csi->mclk);
 		dev_err(dev, "Failed to get mclk: %d", ret);
-		return ret;
+		goto destroy_mutex;
 	}
 
 	csi->irq = platform_get_irq(pdev, 0);
-	if (csi->irq < 0)
-		return csi->irq;
+	if (csi->irq < 0) {
+		ret = csi->irq;
+		goto destroy_mutex;
+	}
 
 	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regbase))
-		return PTR_ERR(csi->regbase);
+	if (IS_ERR(csi->regbase)) {
+		ret = PTR_ERR(csi->regbase);
+		goto destroy_mutex;
+	}
 
 	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
-	spin_lock_init(&csi->irqlock);
-	mutex_init(&csi->lock);
-
 	/* install interrupt handler */
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
@@ -1223,7 +1228,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		ret = PTR_ERR(imxmd);
 		goto destroy_mutex;
 	}
-	platform_set_drvdata(pdev, &csi->sd);
 
 	ret = imx_media_of_add_csi(imxmd, node);
 	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
-- 
Regards,

Laurent Pinchart

