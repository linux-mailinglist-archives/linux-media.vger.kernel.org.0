Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597F8570333
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbiGKMpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbiGKMpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED2F21251
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:53 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEE0E1B3F;
        Mon, 11 Jul 2022 14:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543427;
        bh=6SMlAvs+yRBz6lY+aRVcA8GR5qhX2rLh9MEc+kUtftU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fA5SdH3SSr3PZ2DwoUO4wzmoVSPFUPpzzVaTGiSJA/xROokmQgWsjUc0OKo+DHizu
         TLqcowa4T7B+9GBn6ZPIGT86svZ+6lvcqXURwZTg4Tzx6zlrA8zZE5L01O7wCHOn6i
         5pPp0W+l40Wb6TjCwSo0YtLMdnL3QZ5A//ymglpI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 45/46] media: rkisp1: Make the internal CSI-2 receiver optional
Date:   Mon, 11 Jul 2022 15:42:47 +0300
Message-Id: <20220711124248.2683-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

Not all ISP versions integrate a MIPI CSI-2 receiver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 50 +++++++++++++------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index bc278b49fefc..f2475c6235ea 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -205,6 +205,14 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
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
 
@@ -330,13 +338,16 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
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
@@ -379,7 +390,8 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 
 static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
 {
-	rkisp1_csi_unregister(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_unregister(rkisp1);
 	rkisp1_params_unregister(rkisp1);
 	rkisp1_stats_unregister(rkisp1);
 	rkisp1_capture_devs_unregister(rkisp1);
@@ -411,9 +423,11 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
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
@@ -576,9 +590,11 @@ static int rkisp1_probe(struct platform_device *pdev)
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
@@ -595,7 +611,8 @@ static int rkisp1_probe(struct platform_device *pdev)
 err_unreg_entities:
 	rkisp1_entities_unregister(rkisp1);
 err_cleanup_csi:
-	rkisp1_csi_cleanup(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_cleanup(rkisp1);
 err_unreg_media_dev:
 	media_device_unregister(&rkisp1->media_dev);
 err_unreg_v4l2_dev:
@@ -613,7 +630,8 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&rkisp1->notifier);
 
 	rkisp1_entities_unregister(rkisp1);
-	rkisp1_csi_cleanup(rkisp1);
+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
+		rkisp1_csi_cleanup(rkisp1);
 	rkisp1_debug_cleanup(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
-- 
Regards,

Laurent Pinchart

