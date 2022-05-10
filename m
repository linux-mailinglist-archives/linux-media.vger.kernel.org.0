Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3C52149B
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241362AbiEJMDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241270AbiEJMDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6888D5046D
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:20 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83C13E0C;
        Tue, 10 May 2022 13:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183955;
        bh=g1HSzGVKOFmiTz3acZlXrvGDr9k5S9lpIAwIEIkpp9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IGg2/1nYFSWINsoBkH9C621lW6eeOFDAlaxaIXg0FxUnuiUsx/oJV1Dc3CQSECS4o
         om8QTUAQNMYaHEUxIw5JR4MmG07gmaVvwGQMjrG0/cN+yYcuxrsIvq4B/LdvGHu0Ar
         vjcMBwMFwCAKFJ0xXbt+HeW79MV0kDGvCdRfZpnU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de, Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 06/50] staging: media: imx: imx7-media-csi: Move misc init out of probe()
Date:   Tue, 10 May 2022 14:58:15 +0300
Message-Id: <20220510115859.19777-7-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

There is a chunk of miscellaneous initializations related to the CSI
subdev and media pads directly in the probe function. Move them into the
imx7_csi_media_init() function to clean up the probe function.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 49 +++++++++++-----------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 984f7bec15af..042dd4c0cb4d 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1342,7 +1342,7 @@ static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 static int imx7_csi_media_init(struct imx7_csi *csi)
 {
 	struct imx_media_dev *imxmd;
-	int ret;
+	int i, ret;
 
 	/* add media device */
 	imxmd = imx_media_dev_init(csi->dev, NULL);
@@ -1357,14 +1357,33 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 
 	csi->imxmd = imxmd;
 
-	return 0;
+	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
+	v4l2_set_subdevdata(&csi->sd, csi);
+	csi->sd.internal_ops = &imx7_csi_internal_ops;
+	csi->sd.entity.ops = &imx7_csi_entity_ops;
+	csi->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	csi->sd.dev = csi->dev;
+	csi->sd.owner = THIS_MODULE;
+	csi->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
+
+	for (i = 0; i < IMX7_CSI_PADS_NUM; i++)
+		csi->pad[i].flags = (i == IMX7_CSI_PAD_SINK) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&csi->sd.entity, IMX7_CSI_PADS_NUM,
+				     csi->pad);
+	if (ret < 0)
+		return ret;
+
+	return v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
 }
 
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct imx7_csi *csi;
-	int i, ret;
+	int ret;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1410,28 +1429,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret)
 		goto destroy_mutex;
 
-	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
-	v4l2_set_subdevdata(&csi->sd, csi);
-	csi->sd.internal_ops = &imx7_csi_internal_ops;
-	csi->sd.entity.ops = &imx7_csi_entity_ops;
-	csi->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	csi->sd.dev = &pdev->dev;
-	csi->sd.owner = THIS_MODULE;
-	csi->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
-	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
-
-	for (i = 0; i < IMX7_CSI_PADS_NUM; i++)
-		csi->pad[i].flags = (i == IMX7_CSI_PAD_SINK) ?
-			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
-
-	ret = media_entity_pads_init(&csi->sd.entity, IMX7_CSI_PADS_NUM,
-				     csi->pad);
-	if (ret < 0)
-		goto cleanup;
-
 	ret = v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
 	if (ret)
-		goto cleanup;
+		goto media_cleanup;
 
 	ret = imx7_csi_async_register(csi);
 	if (ret)
@@ -1442,8 +1442,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 subdev_notifier_cleanup:
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
-
-cleanup:
+media_cleanup:
 	imx7_csi_media_cleanup(csi);
 
 destroy_mutex:
-- 
Regards,

Laurent Pinchart

