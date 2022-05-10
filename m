Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5344521EA8
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345651AbiEJPdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345839AbiEJPdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:33:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFE08FD43
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:26:28 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2B49B60;
        Tue, 10 May 2022 17:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652196386;
        bh=u4oHCgowD/dbv9QHhq1MuIZ9m5AdxkACQZsDjcALtKM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=POJGJyDExRm4RaLi16j96BVRydZfmH1UNziOvf52AT/jCGG22IxjTDxcMXmEZuZLX
         U9yCihDvVDVvyITlh/1OiphJcxcx5ial7vlbmUpIOGFwTkESAh5qqV6rRqRWjzRay/
         5GhKZRF3rTBFt2/hFln80In/jkZvx+OSscah4R0g=
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
Subject: [PATCH v1.1 06/50] staging: media: imx: imx7-media-csi: Move misc init out of probe()
Date:   Tue, 10 May 2022 18:26:16 +0300
Message-Id: <20220510152616.4139-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-7-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-7-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Fix error handling in imx7_csi_media_init()
---
 drivers/staging/media/imx/imx7-media-csi.c | 60 ++++++++++++----------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9551cf37a1a9..1b801f39f568 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1342,6 +1342,7 @@ static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 static int imx7_csi_media_init(struct imx7_csi *csi)
 {
 	struct imx_media_dev *imxmd;
+	unsigned int i;
 	int ret;
 
 	/* add media device */
@@ -1352,19 +1353,44 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 	csi->imxmd = imxmd;
 
 	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
-	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
-		imx7_csi_media_cleanup(csi);
-		return ret;
-	}
+	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
+		goto error;
+
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
+	if (ret)
+		goto error;
+
+	ret = v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
+	if (ret)
+		goto error;
 
 	return 0;
+
+error:
+	imx7_csi_media_cleanup(csi);
+	return ret;
 }
 
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct imx7_csi *csi;
-	int i, ret;
+	int ret;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1410,28 +1436,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
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
@@ -1442,8 +1449,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
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

