Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F2A52149E
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241373AbiEJMDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241345AbiEJMDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355CA5131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:21 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6944B824;
        Tue, 10 May 2022 13:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183956;
        bh=JweyVKZn5hEu99NUVKs8LT0pqn6mT3HILsiBxsegB5s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c30/nRgSUfg/kKQ+uFBMhsLXN6JNADoVIBAj3m2lyeQy62xenDZjMCiW7On+Xz4Vn
         MzbADvR90rbk24feb2IMEspivETYYGesPk38ZoQ93zjYZiJnjbd4jEcrSGISYEjTyW
         tNzECUQuTbg4CFgmlhAvOmbKLmen8Eaq69Aq5caA=
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
Subject: [PATCH 07/50] staging: media: imx: imx7-media-csi: Don't populate vdev lists
Date:   Tue, 10 May 2022 14:58:16 +0300
Message-Id: <20220510115859.19777-8-laurent.pinchart@ideasonboard.com>
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

The imx_media_dev framework maintains a per-pad list of connected video
devices, created once all subdevs have been bound. This is used for two
purposes, updating V4L2 control inheritance when links change, and
relaying subdev events to video nodes. None of these are used by the
imx7-media-csi driver as it implements the MC-centric approach. Drop
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 167 +++------------------
 1 file changed, 17 insertions(+), 150 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 042dd4c0cb4d..e0b600580c21 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -717,151 +717,6 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/* -----------------------------------------------------------------------------
- * Temporary copy of imx_media_dev helpers
- */
-
-/*
- * adds given video device to given imx-media source pad vdev list.
- * Continues upstream from the pad entity's sink pads.
- */
-static int imx_media_add_vdev_to_pad(struct imx_media_dev *imxmd,
-				     struct imx_media_video_dev *vdev,
-				     struct media_pad *srcpad)
-{
-	struct media_entity *entity = srcpad->entity;
-	struct imx_media_pad_vdev *pad_vdev;
-	struct list_head *pad_vdev_list;
-	struct media_link *link;
-	struct v4l2_subdev *sd;
-	int i, ret;
-
-	/* skip this entity if not a v4l2_subdev */
-	if (!is_media_entity_v4l2_subdev(entity))
-		return 0;
-
-	sd = media_entity_to_v4l2_subdev(entity);
-
-	pad_vdev_list = to_pad_vdev_list(sd, srcpad->index);
-	if (!pad_vdev_list) {
-		v4l2_warn(&imxmd->v4l2_dev, "%s:%u has no vdev list!\n",
-			  entity->name, srcpad->index);
-		/*
-		 * shouldn't happen, but no reason to fail driver load,
-		 * just skip this entity.
-		 */
-		return 0;
-	}
-
-	/* just return if we've been here before */
-	list_for_each_entry(pad_vdev, pad_vdev_list, list) {
-		if (pad_vdev->vdev == vdev)
-			return 0;
-	}
-
-	dev_dbg(imxmd->md.dev, "adding %s to pad %s:%u\n",
-		vdev->vfd->entity.name, entity->name, srcpad->index);
-
-	pad_vdev = devm_kzalloc(imxmd->md.dev, sizeof(*pad_vdev), GFP_KERNEL);
-	if (!pad_vdev)
-		return -ENOMEM;
-
-	/* attach this vdev to this pad */
-	pad_vdev->vdev = vdev;
-	list_add_tail(&pad_vdev->list, pad_vdev_list);
-
-	/* move upstream from this entity's sink pads */
-	for (i = 0; i < entity->num_pads; i++) {
-		struct media_pad *pad = &entity->pads[i];
-
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			continue;
-
-		list_for_each_entry(link, &entity->links, list) {
-			if (link->sink != pad)
-				continue;
-			ret = imx_media_add_vdev_to_pad(imxmd, vdev,
-							link->source);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * For every subdevice, allocate an array of list_head's, one list_head
- * for each pad, to hold the list of video devices reachable from that
- * pad.
- */
-static int imx_media_alloc_pad_vdev_lists(struct imx_media_dev *imxmd)
-{
-	struct list_head *vdev_lists;
-	struct media_entity *entity;
-	struct v4l2_subdev *sd;
-	int i;
-
-	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
-		entity = &sd->entity;
-		vdev_lists = devm_kcalloc(imxmd->md.dev,
-					  entity->num_pads, sizeof(*vdev_lists),
-					  GFP_KERNEL);
-		if (!vdev_lists)
-			return -ENOMEM;
-
-		/* attach to the subdev's host private pointer */
-		sd->host_priv = vdev_lists;
-
-		for (i = 0; i < entity->num_pads; i++)
-			INIT_LIST_HEAD(to_pad_vdev_list(sd, i));
-	}
-
-	return 0;
-}
-
-/* form the vdev lists in all imx-media source pads */
-static int imx_media_create_pad_vdev_lists(struct imx_media_dev *imxmd)
-{
-	struct imx_media_video_dev *vdev;
-	struct media_link *link;
-	int ret;
-
-	ret = imx_media_alloc_pad_vdev_lists(imxmd);
-	if (ret)
-		return ret;
-
-	list_for_each_entry(vdev, &imxmd->vdev_list, list) {
-		link = list_first_entry(&vdev->vfd->entity.links,
-					struct media_link, list);
-		ret = imx_media_add_vdev_to_pad(imxmd, vdev, link->source);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-/* async subdev complete notifier */
-static int __imx_media_probe_complete(struct imx_media_dev *imxmd)
-{
-	int ret;
-
-	mutex_lock(&imxmd->mutex);
-
-	ret = imx_media_create_pad_vdev_lists(imxmd);
-	if (ret)
-		goto unlock;
-
-	ret = v4l2_device_register_subdev_nodes(&imxmd->v4l2_dev);
-unlock:
-	mutex_unlock(&imxmd->mutex);
-	if (ret)
-		return ret;
-
-	return media_device_register(&imxmd->md);
-}
-
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev Operations
  */
@@ -1214,12 +1069,24 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 
 	ret = imx_media_capture_device_register(csi->vdev,
 						MEDIA_LNK_FL_IMMUTABLE);
-	if (ret) {
-		imx_media_capture_device_remove(csi->vdev);
-		return ret;
-	}
+	if (ret)
+		goto err_remove;
 
-	return __imx_media_probe_complete(csi->imxmd);
+	ret = v4l2_device_register_subdev_nodes(&csi->imxmd->v4l2_dev);
+	if (ret)
+		goto err_unreg;
+
+	ret = media_device_register(&csi->imxmd->md);
+	if (ret)
+		goto err_unreg;
+
+	return 0;
+
+err_unreg:
+	imx_media_capture_device_unregister(csi->vdev);
+err_remove:
+	imx_media_capture_device_remove(csi->vdev);
+	return ret;
 }
 
 static void imx7_csi_unregistered(struct v4l2_subdev *sd)
-- 
Regards,

Laurent Pinchart

