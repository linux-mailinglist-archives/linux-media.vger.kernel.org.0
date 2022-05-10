Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2007B5214A7
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbiEJMDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbiEJMDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C354946163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DE80B9A;
        Tue, 10 May 2022 13:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183951;
        bh=biy0GTT1QoP72aKYu5WMI/a8pkSOFL+DXgOcxXmEqYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WueZg0hlIKS7AeDL3TWQgrIv1gkJf1xyvpic8YxVulNS0oqBahamvGWfapbGXYh+R
         lSRaPMOBbBthLvNPNuzmqpfWSJlKhybPDHgJnNTpu0LYKGgKerQbLEAZs0SFBh3Buq
         DXuPgLWpZ1dnC38YG+cRodvPoxHdvA7QXJFs2r3s=
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
Subject: [PATCH 02/50] staging: media: imx: imx7-media-csi: Split imx_media_dev from probe()
Date:   Tue, 10 May 2022 14:58:11 +0300
Message-Id: <20220510115859.19777-3-laurent.pinchart@ideasonboard.com>
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

Prepare for the decoupling of the imx7-media-csi driver from the
IPUv3-based drivers by moving the imx_media_dev handling from probe()
function to separate functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 71 +++++++++++++---------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 893620e8fc03..d7c65b8bb3c9 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1175,11 +1175,45 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 	return v4l2_async_register_subdev(&csi->sd);
 }
 
+static void imx7_csi_media_cleanup(struct imx7_csi *csi)
+{
+	struct imx_media_dev *imxmd = csi->imxmd;
+
+	v4l2_device_unregister(&imxmd->v4l2_dev);
+	media_device_unregister(&imxmd->md);
+	media_device_cleanup(&imxmd->md);
+}
+
+static int imx7_csi_media_init(struct imx7_csi *csi)
+{
+	struct imx_media_dev *imxmd;
+	int ret;
+
+	/* add media device */
+	imxmd = imx_media_dev_init(csi->dev, NULL);
+	if (IS_ERR(imxmd))
+		return PTR_ERR(imxmd);
+
+	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
+	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
+		imx7_csi_media_cleanup(csi);
+		return ret;
+	}
+
+	ret = imx_media_dev_notifier_register(imxmd, NULL);
+	if (ret < 0) {
+		imx7_csi_media_cleanup(csi);
+		return ret;
+	}
+
+	csi->imxmd = imxmd;
+
+	return 0;
+}
+
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	struct imx_media_dev *imxmd;
 	struct imx7_csi *csi;
 	int i, ret;
 
@@ -1193,6 +1227,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	spin_lock_init(&csi->irqlock);
 	mutex_init(&csi->lock);
 
+	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(csi->mclk)) {
 		ret = PTR_ERR(csi->mclk);
@@ -1214,7 +1249,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
-	/* install interrupt handler */
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
 	if (ret < 0) {
@@ -1222,22 +1256,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		goto destroy_mutex;
 	}
 
-	/* add media device */
-	imxmd = imx_media_dev_init(dev, NULL);
-	if (IS_ERR(imxmd)) {
-		ret = PTR_ERR(imxmd);
+	/* Initialize all the media device infrastructure. */
+	ret = imx7_csi_media_init(csi);
+	if (ret)
 		goto destroy_mutex;
-	}
 
-	ret = imx_media_of_add_csi(imxmd, node);
-	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
-		goto cleanup;
-
-	ret = imx_media_dev_notifier_register(imxmd, NULL);
-	if (ret < 0)
-		goto cleanup;
-
-	csi->imxmd = imxmd;
 	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
 	v4l2_set_subdevdata(&csi->sd, csi);
 	csi->sd.internal_ops = &imx7_csi_internal_ops;
@@ -1269,11 +1292,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi->notifier);
 
 cleanup:
-	v4l2_async_nf_unregister(&imxmd->notifier);
-	v4l2_async_nf_cleanup(&imxmd->notifier);
-	v4l2_device_unregister(&imxmd->v4l2_dev);
-	media_device_unregister(&imxmd->md);
-	media_device_cleanup(&imxmd->md);
+	imx7_csi_media_cleanup(csi);
 
 destroy_mutex:
 	mutex_destroy(&csi->lock);
@@ -1285,14 +1304,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct imx_media_dev *imxmd = csi->imxmd;
 
-	v4l2_async_nf_unregister(&imxmd->notifier);
-	v4l2_async_nf_cleanup(&imxmd->notifier);
-
-	media_device_unregister(&imxmd->md);
-	v4l2_device_unregister(&imxmd->v4l2_dev);
-	media_device_cleanup(&imxmd->md);
+	imx7_csi_media_cleanup(csi);
 
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
-- 
Regards,

Laurent Pinchart

