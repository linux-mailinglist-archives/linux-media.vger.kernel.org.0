Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1D5214AD
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbiEJMDq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240353AbiEJMDp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69A55131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:48 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0C341248;
        Tue, 10 May 2022 13:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183975;
        bh=Q5pLB1e2XYYIIIEjFrPhWLsfrzF2a4m2XFlEvoFIpmM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vcWdDFsz0NdCD/QybPsZejelS6fwRaKHYuIlXramhVr+B53ro9eiT5o3MgvNcvydw
         e3aQ4k81GnnAIDu0XJrgq1Pt7ucsb6A4qzJ22Be11Pn637h5wkyEzw0xlcnhK2WHkY
         mQOBTZeGeD/RLfjKVSc7cuyjm//cd+XJDhOowxyM=
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
Subject: [PATCH 29/50] staging: media: imx: imx7-media-csi: Store imx7_csi in drv data
Date:   Tue, 10 May 2022 14:58:38 +0300
Message-Id: <20220510115859.19777-30-laurent.pinchart@ideasonboard.com>
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

Replace the subdev pointer stored in platform drv data with the imx7_csi
pointer. Drop a now redundant dev_set_drvdata() call.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 14683a15e003..5a5157d8b27b 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1842,8 +1842,6 @@ static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 {
 	int ret;
 
-	dev_set_drvdata(csi->dev, csi);
-
 	strscpy(csi->mdev.model, "imx-media", sizeof(csi->mdev.model));
 	csi->mdev.ops = &imx7_csi_media_ops;
 	csi->mdev.dev = csi->dev;
@@ -1913,7 +1911,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	csi->dev = dev;
-	platform_set_drvdata(pdev, &csi->sd);
+	platform_set_drvdata(pdev, csi);
 
 	spin_lock_init(&csi->irqlock);
 	mutex_init(&csi->lock);
@@ -1977,14 +1975,13 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 static int imx7_csi_remove(struct platform_device *pdev)
 {
-	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct imx7_csi *csi = platform_get_drvdata(pdev);
 
 	imx7_csi_media_cleanup(csi);
 
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
-	v4l2_async_unregister_subdev(sd);
+	v4l2_async_unregister_subdev(&csi->sd);
 
 	mutex_destroy(&csi->lock);
 
-- 
Regards,

Laurent Pinchart

