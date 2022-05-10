Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6945352149A
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239953AbiEJMDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239016AbiEJMDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F546165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:16 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04FBBBA9;
        Tue, 10 May 2022 13:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183952;
        bh=DQNnAnAdnM1VsPNzt3WveXXRzKRWpGwQ+Fq/1O4hhtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nY6exofT1OG/msOiGBtb+xnLD29Nr7lELmZP9mSKfjytbeQJiNz3HtYBK15LYd4BC
         YqKC7SybJv9oP5FahGqoce6hROLOrUBZiyIAZVRG7bExBkZcc8LuDnmvoVvz0/IEK5
         zvFs9exTeSkyK+oOdPUybs3vLyef69jTWc1yP/sI=
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
Subject: [PATCH 03/50] staging: media: imx: imx7-media-csi: Import notifier helpers
Date:   Tue, 10 May 2022 14:58:12 +0300
Message-Id: <20220510115859.19777-4-laurent.pinchart@ideasonboard.com>
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

To prepare for code refactoring, copy the V4L2 async notifier helper
code used by this driver verbatim from imx-media-dev-common.c. Rename
some functions to avoid name clashes. No functional change included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 210 ++++++++++++++++++++-
 1 file changed, 209 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index d7c65b8bb3c9..708076b7045a 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -717,6 +717,214 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* -----------------------------------------------------------------------------
+ * Temporary copy of imx_media_dev helpers
+ */
+
+static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct imx_media_dev, notifier);
+}
+
+/*
+ * Create the missing media links from the CSI-2 receiver.
+ * Called after all async subdevs have bound.
+ */
+static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
+{
+	struct v4l2_subdev *sd, *csi2 = NULL;
+
+	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
+		if (sd->grp_id == IMX_MEDIA_GRP_ID_CSI2) {
+			csi2 = sd;
+			break;
+		}
+	}
+	if (!csi2)
+		return;
+
+	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
+		/* skip if not a CSI or a CSI mux */
+		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI_MUX))
+			continue;
+
+		v4l2_create_fwnode_links(csi2, sd);
+	}
+}
+
+/*
+ * adds given video device to given imx-media source pad vdev list.
+ * Continues upstream from the pad entity's sink pads.
+ */
+static int imx_media_add_vdev_to_pad(struct imx_media_dev *imxmd,
+				     struct imx_media_video_dev *vdev,
+				     struct media_pad *srcpad)
+{
+	struct media_entity *entity = srcpad->entity;
+	struct imx_media_pad_vdev *pad_vdev;
+	struct list_head *pad_vdev_list;
+	struct media_link *link;
+	struct v4l2_subdev *sd;
+	int i, ret;
+
+	/* skip this entity if not a v4l2_subdev */
+	if (!is_media_entity_v4l2_subdev(entity))
+		return 0;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+
+	pad_vdev_list = to_pad_vdev_list(sd, srcpad->index);
+	if (!pad_vdev_list) {
+		v4l2_warn(&imxmd->v4l2_dev, "%s:%u has no vdev list!\n",
+			  entity->name, srcpad->index);
+		/*
+		 * shouldn't happen, but no reason to fail driver load,
+		 * just skip this entity.
+		 */
+		return 0;
+	}
+
+	/* just return if we've been here before */
+	list_for_each_entry(pad_vdev, pad_vdev_list, list) {
+		if (pad_vdev->vdev == vdev)
+			return 0;
+	}
+
+	dev_dbg(imxmd->md.dev, "adding %s to pad %s:%u\n",
+		vdev->vfd->entity.name, entity->name, srcpad->index);
+
+	pad_vdev = devm_kzalloc(imxmd->md.dev, sizeof(*pad_vdev), GFP_KERNEL);
+	if (!pad_vdev)
+		return -ENOMEM;
+
+	/* attach this vdev to this pad */
+	pad_vdev->vdev = vdev;
+	list_add_tail(&pad_vdev->list, pad_vdev_list);
+
+	/* move upstream from this entity's sink pads */
+	for (i = 0; i < entity->num_pads; i++) {
+		struct media_pad *pad = &entity->pads[i];
+
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		list_for_each_entry(link, &entity->links, list) {
+			if (link->sink != pad)
+				continue;
+			ret = imx_media_add_vdev_to_pad(imxmd, vdev,
+							link->source);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * For every subdevice, allocate an array of list_head's, one list_head
+ * for each pad, to hold the list of video devices reachable from that
+ * pad.
+ */
+static int imx_media_alloc_pad_vdev_lists(struct imx_media_dev *imxmd)
+{
+	struct list_head *vdev_lists;
+	struct media_entity *entity;
+	struct v4l2_subdev *sd;
+	int i;
+
+	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
+		entity = &sd->entity;
+		vdev_lists = devm_kcalloc(imxmd->md.dev,
+					  entity->num_pads, sizeof(*vdev_lists),
+					  GFP_KERNEL);
+		if (!vdev_lists)
+			return -ENOMEM;
+
+		/* attach to the subdev's host private pointer */
+		sd->host_priv = vdev_lists;
+
+		for (i = 0; i < entity->num_pads; i++)
+			INIT_LIST_HEAD(to_pad_vdev_list(sd, i));
+	}
+
+	return 0;
+}
+
+/* form the vdev lists in all imx-media source pads */
+static int imx_media_create_pad_vdev_lists(struct imx_media_dev *imxmd)
+{
+	struct imx_media_video_dev *vdev;
+	struct media_link *link;
+	int ret;
+
+	ret = imx_media_alloc_pad_vdev_lists(imxmd);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(vdev, &imxmd->vdev_list, list) {
+		link = list_first_entry(&vdev->vfd->entity.links,
+					struct media_link, list);
+		ret = imx_media_add_vdev_to_pad(imxmd, vdev, link->source);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* async subdev complete notifier */
+static int __imx_media_probe_complete(struct v4l2_async_notifier *notifier)
+{
+	struct imx_media_dev *imxmd = notifier2dev(notifier);
+	int ret;
+
+	mutex_lock(&imxmd->mutex);
+
+	imx_media_create_csi2_links(imxmd);
+
+	ret = imx_media_create_pad_vdev_lists(imxmd);
+	if (ret)
+		goto unlock;
+
+	ret = v4l2_device_register_subdev_nodes(&imxmd->v4l2_dev);
+unlock:
+	mutex_unlock(&imxmd->mutex);
+	if (ret)
+		return ret;
+
+	return media_device_register(&imxmd->md);
+}
+
+static const struct v4l2_async_notifier_operations imx_media_notifier_ops = {
+	.complete = __imx_media_probe_complete,
+};
+
+static int __imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
+			    const struct v4l2_async_notifier_operations *ops)
+{
+	int ret;
+
+	/* no subdevs? just bail */
+	if (list_empty(&imxmd->notifier.asd_list)) {
+		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
+		return -ENODEV;
+	}
+
+	/* prepare the async subdev notifier and register it */
+	imxmd->notifier.ops = ops ? ops : &imx_media_notifier_ops;
+	ret = v4l2_async_nf_register(&imxmd->v4l2_dev, &imxmd->notifier);
+	if (ret) {
+		v4l2_err(&imxmd->v4l2_dev,
+			 "v4l2_async_nf_register failed with %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev Operations
  */
@@ -1200,7 +1408,7 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 		return ret;
 	}
 
-	ret = imx_media_dev_notifier_register(imxmd, NULL);
+	ret = __imx_media_dev_notifier_register(imxmd, NULL);
 	if (ret < 0) {
 		imx7_csi_media_cleanup(csi);
 		return ret;
-- 
Regards,

Laurent Pinchart

