Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1F3521489
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240917AbiEJMDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239016AbiEJMDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DB85131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:19 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE853DFF;
        Tue, 10 May 2022 13:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183954;
        bh=vVaxZhjLlAQkxGPt/Aih151SXhS9D/3jxSOJe0M5h7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b8VFH61X5lom5ZlofxBIME9wI1etiLg50NJK6QzON+wKzXy6j93jNcAnR0WcHHsvL
         h8JRJ8+fbpKIb8Yu2hUiZ/9Qeysg9CyV+IbNycEOIycA9cNre/n1bo0z+oNYsBkVHR
         UahNLcEoI/gP9v0X7DrhMq/FTw5dzbcK/jIPUuM0=
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
Subject: [PATCH 05/50] staging: media: imx: imx7-media-csi: Drop the imx_media notifier
Date:   Tue, 10 May 2022 14:58:14 +0300
Message-Id: <20220510115859.19777-6-laurent.pinchart@ideasonboard.com>
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

The V4L2 async notifier embedded in the imx_media_dev structure is
triggered when the CSI bridge subdev is registered. We don't need an
async notifier for this, as we can call the .complete() handler directly
from the CSI bridge subdev .registered() handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 63 +++++++---------------
 1 file changed, 19 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e2d6dabad007..984f7bec15af 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -721,11 +721,6 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
  * Temporary copy of imx_media_dev helpers
  */
 
-static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
-{
-	return container_of(n, struct imx_media_dev, notifier);
-}
-
 /*
  * adds given video device to given imx-media source pad vdev list.
  * Continues upstream from the pad entity's sink pads.
@@ -848,9 +843,8 @@ static int imx_media_create_pad_vdev_lists(struct imx_media_dev *imxmd)
 }
 
 /* async subdev complete notifier */
-static int __imx_media_probe_complete(struct v4l2_async_notifier *notifier)
+static int __imx_media_probe_complete(struct imx_media_dev *imxmd)
 {
-	struct imx_media_dev *imxmd = notifier2dev(notifier);
 	int ret;
 
 	mutex_lock(&imxmd->mutex);
@@ -868,33 +862,6 @@ static int __imx_media_probe_complete(struct v4l2_async_notifier *notifier)
 	return media_device_register(&imxmd->md);
 }
 
-static const struct v4l2_async_notifier_operations imx_media_notifier_ops = {
-	.complete = __imx_media_probe_complete,
-};
-
-static int __imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops)
-{
-	int ret;
-
-	/* no subdevs? just bail */
-	if (list_empty(&imxmd->notifier.asd_list)) {
-		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
-		return -ENODEV;
-	}
-
-	/* prepare the async subdev notifier and register it */
-	imxmd->notifier.ops = ops ? ops : &imx_media_notifier_ops;
-	ret = v4l2_async_nf_register(&imxmd->v4l2_dev, &imxmd->notifier);
-	if (ret) {
-		v4l2_err(&imxmd->v4l2_dev,
-			 "v4l2_async_nf_register failed with %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev Operations
  */
@@ -1247,10 +1214,12 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 
 	ret = imx_media_capture_device_register(csi->vdev,
 						MEDIA_LNK_FL_IMMUTABLE);
-	if (ret)
+	if (ret) {
 		imx_media_capture_device_remove(csi->vdev);
+		return ret;
+	}
 
-	return ret;
+	return __imx_media_probe_complete(csi->imxmd);
 }
 
 static void imx7_csi_unregistered(struct v4l2_subdev *sd)
@@ -1316,8 +1285,16 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 					       MEDIA_LNK_FL_IMMUTABLE);
 }
 
+static int imx7_csi_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
+
+	return v4l2_device_register_subdev_nodes(&csi->imxmd->v4l2_dev);
+}
+
 static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
 	.bound = imx7_csi_notify_bound,
+	.complete = imx7_csi_notify_complete,
 };
 
 static int imx7_csi_async_register(struct imx7_csi *csi)
@@ -1346,11 +1323,11 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 	csi->notifier.ops = &imx7_csi_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&csi->sd, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->imxmd->v4l2_dev, &csi->notifier);
 	if (ret)
 		return ret;
 
-	return v4l2_async_register_subdev(&csi->sd);
+	return 0;
 }
 
 static void imx7_csi_media_cleanup(struct imx7_csi *csi)
@@ -1378,12 +1355,6 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 		return ret;
 	}
 
-	ret = __imx_media_dev_notifier_register(imxmd, NULL);
-	if (ret < 0) {
-		imx7_csi_media_cleanup(csi);
-		return ret;
-	}
-
 	csi->imxmd = imxmd;
 
 	return 0;
@@ -1458,6 +1429,10 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto cleanup;
 
+	ret = v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
+	if (ret)
+		goto cleanup;
+
 	ret = imx7_csi_async_register(csi);
 	if (ret)
 		goto subdev_notifier_cleanup;
-- 
Regards,

Laurent Pinchart

