Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE6254BA34
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351461AbiFNTM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347305AbiFNTMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:12:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C79AE5F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:46 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068AA825;
        Tue, 14 Jun 2022 21:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233965;
        bh=JZYZDIgU+Gckh67qts/TBvqvAJZkut3JlM+0PM/Pgo0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NHwHkPRKW3sgYSC+3woTshC56JAcUFX2y7GMWVkSMH/sh1DkO3j/IZTCGdRm4kTVs
         GM2nfCV88U5aXEETZrGfG5gWpbjOpsoptbWQnQP72KnPyw1Q7bTQCqBeK0J/9r+X62
         ayJXJdTrixaKk/hxplvZBAVUMK7hr8AoeFXJAUD0=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 14/55] media: rkisp1: Create internal links at probe time
Date:   Wed, 15 Jun 2022 04:10:46 +0900
Message-Id: <20220614191127.3420492-15-paul.elder@ideasonboard.com>
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

There's no need to wait until all async subdevs are bound before
creating internal links. Create them at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 105 ++++++++----------
 1 file changed, 49 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 4501aea265cb..7bb1235cddea 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -109,50 +109,6 @@ struct rkisp1_isr_data {
  * Sensor DT bindings
  */
 
-static int rkisp1_create_links(struct rkisp1_device *rkisp1)
-{
-	unsigned int i;
-	int ret;
-
-	/* create ISP->RSZ->CAP links */
-	for (i = 0; i < 2; i++) {
-		struct media_entity *resizer =
-			&rkisp1->resizer_devs[i].sd.entity;
-		struct media_entity *capture =
-			&rkisp1->capture_devs[i].vnode.vdev.entity;;
-
-		ret = media_create_pad_link(&rkisp1->isp.sd.entity,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO,
-					    resizer, RKISP1_RSZ_PAD_SINK,
-					    MEDIA_LNK_FL_ENABLED);
-		if (ret)
-			return ret;
-
-		ret = media_create_pad_link(resizer, RKISP1_RSZ_PAD_SRC,
-					    capture, 0,
-					    MEDIA_LNK_FL_ENABLED |
-					    MEDIA_LNK_FL_IMMUTABLE);
-		if (ret)
-			return ret;
-	}
-
-	/* params links */
-	ret = media_create_pad_link(&rkisp1->params.vnode.vdev.entity, 0,
-				    &rkisp1->isp.sd.entity,
-				    RKISP1_ISP_PAD_SINK_PARAMS,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret)
-		return ret;
-
-	/* 3A stats links */
-	return media_create_pad_link(&rkisp1->isp.sd.entity,
-				     RKISP1_ISP_PAD_SOURCE_STATS,
-				     &rkisp1->stats.vnode.vdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
-}
-
 static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *sd,
 					struct v4l2_async_subdev *asd)
@@ -210,19 +166,8 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rkisp1_device *rkisp1 =
 		container_of(notifier, struct rkisp1_device, notifier);
-	int ret;
-
-	ret = rkisp1_create_links(rkisp1);
-	if (ret)
-		return ret;
-
-	ret = v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
-	if (ret)
-		return ret;
-
-	dev_dbg(rkisp1->dev, "Async subdev notifier completed\n");
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
@@ -332,6 +277,50 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
  * Core
  */
 
+static int rkisp1_create_links(struct rkisp1_device *rkisp1)
+{
+	unsigned int i;
+	int ret;
+
+	/* create ISP->RSZ->CAP links */
+	for (i = 0; i < 2; i++) {
+		struct media_entity *resizer =
+			&rkisp1->resizer_devs[i].sd.entity;
+		struct media_entity *capture =
+			&rkisp1->capture_devs[i].vnode.vdev.entity;;
+
+		ret = media_create_pad_link(&rkisp1->isp.sd.entity,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO,
+					    resizer, RKISP1_RSZ_PAD_SINK,
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			return ret;
+
+		ret = media_create_pad_link(resizer, RKISP1_RSZ_PAD_SRC,
+					    capture, 0,
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+		if (ret)
+			return ret;
+	}
+
+	/* params links */
+	ret = media_create_pad_link(&rkisp1->params.vnode.vdev.entity, 0,
+				    &rkisp1->isp.sd.entity,
+				    RKISP1_ISP_PAD_SINK_PARAMS,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
+
+	/* 3A stats links */
+	return media_create_pad_link(&rkisp1->isp.sd.entity,
+				     RKISP1_ISP_PAD_SOURCE_STATS,
+				     &rkisp1->stats.vnode.vdev.entity, 0,
+				     MEDIA_LNK_FL_ENABLED |
+				     MEDIA_LNK_FL_IMMUTABLE);
+}
+
 static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
 {
 	rkisp1_params_unregister(rkisp1);
@@ -365,6 +354,10 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto error;
 
+	ret = rkisp1_create_links(rkisp1);
+	if (ret)
+		goto error;
+
 	ret = rkisp1_subdev_notifier(rkisp1);
 	if (ret) {
 		dev_err(rkisp1->dev,
-- 
2.30.2

