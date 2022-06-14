Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35DB54BA55
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357853AbiFNTO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357829AbiFNTO4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F65764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:55 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43A4B825;
        Tue, 14 Jun 2022 21:14:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234094;
        bh=EG0U4nHqxwGlJmaOm9q7pgjmOJ4qGSCMRWmGBWC+C8E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q86Xja8JKk2RFys5yEk+mzSSX1efewrDVQThh8bG/sO0zFE6ACbSfMU5E9wO0N9ZV
         VvqNCfBpTNGyBtsXdzWjTpTtG35+bQC8WHex2Uw1tP8/DCGGu7KQgiEa7uf1eJvCpm
         NecY0+H1wdgesO8NO2cHo5yl9iDjQzPyuYpCPiew=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 46/55] media: rkisp1: Make the internal CSI-2 receiver optional
Date:   Wed, 15 Jun 2022 04:11:18 +0900
Message-Id: <20220614191127.3420492-47-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Not all ISP versions integrate a MIPI CSI-2 receiver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 50 +++++++++++++------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 8ccd4042f3f3..62fa2bd275fe 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -195,6 +195,14 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
 		switch (reg) {
 		case 0:
+			/* MIPI CSI-2 port */
+			if (!(rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)) {
+				dev_err(rkisp1->dev,
+					"internal CSI must be available for port 0\n");
+				ret = -EINVAL;
+				break;
+			}
+
 			vep.bus_type = V4L2_MBUS_CSI2_DPHY;
 			break;
 
@@ -320,13 +328,16 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 	unsigned int i;
 	int ret;
 
-	/* Link the CSI receiver to the ISP. */
-	ret = media_create_pad_link(&rkisp1->csi.sd.entity, RKISP1_CSI_PAD_SRC,
-				    &rkisp1->isp.sd.entity,
-				    RKISP1_ISP_PAD_SINK_VIDEO,
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		return ret;
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
+		/* Link the CSI receiver to the ISP. */
+		ret = media_create_pad_link(&rkisp1->csi.sd.entity,
+					    RKISP1_CSI_PAD_SRC,
+					    &rkisp1->isp.sd.entity,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			return ret;
+	}
 
 	/* create ISP->RSZ->CAP links */
 	for (i = 0; i < 2; i++) {
@@ -369,7 +380,8 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 
 static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
 {
-	rkisp1_csi_unregister(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_unregister(rkisp1);
 	rkisp1_params_unregister(rkisp1);
 	rkisp1_stats_unregister(rkisp1);
 	rkisp1_capture_devs_unregister(rkisp1);
@@ -401,9 +413,11 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto error;
 
-	ret = rkisp1_csi_register(rkisp1);
-	if (ret)
-		goto error;
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
+		ret = rkisp1_csi_register(rkisp1);
+		if (ret)
+			goto error;
+	}
 
 	ret = rkisp1_create_links(rkisp1);
 	if (ret)
@@ -566,9 +580,11 @@ static int rkisp1_probe(struct platform_device *pdev)
 		goto err_unreg_v4l2_dev;
 	}
 
-	ret = rkisp1_csi_init(rkisp1);
-	if (ret)
-		goto err_unreg_media_dev;
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
+		ret = rkisp1_csi_init(rkisp1);
+		if (ret)
+			goto err_unreg_media_dev;
+	}
 
 	ret = rkisp1_entities_register(rkisp1);
 	if (ret)
@@ -585,7 +601,8 @@ static int rkisp1_probe(struct platform_device *pdev)
 err_unreg_entities:
 	rkisp1_entities_unregister(rkisp1);
 err_cleanup_csi:
-	rkisp1_csi_cleanup(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_cleanup(rkisp1);
 err_unreg_media_dev:
 	media_device_unregister(&rkisp1->media_dev);
 err_unreg_v4l2_dev:
@@ -603,7 +620,8 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&rkisp1->notifier);
 
 	rkisp1_entities_unregister(rkisp1);
-	rkisp1_csi_cleanup(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_cleanup(rkisp1);
 	rkisp1_debug_cleanup(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
-- 
2.30.2

