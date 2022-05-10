Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7CF521485
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbiEJMDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240118AbiEJMDP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B71165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:17 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4A72D18;
        Tue, 10 May 2022 13:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183953;
        bh=pcHJ/iHL8mYCDutTvm2V49TLbx7X/i0r5Te2u6dAS1Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=txmdQ+kWcu/zbqaNrqv8W8Y/lZTULi9dha3om5d2MzyRVHNJgIahwQm8C92ffF9vS
         xnbFtXkvH6R8IuP/GR6EBrlvex9XweAgPE91HMQq1VrCYdvWwRFj3hXlRaHax52VcK
         Dyp+Lekg+HeaTMDHLFwHOLtlAGjBVo32uwxsfl6c=
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
Subject: [PATCH 04/50] staging: media: imx: imx7-media-csi: Drop duplicate link creation
Date:   Tue, 10 May 2022 14:58:13 +0300
Message-Id: <20220510115859.19777-5-laurent.pinchart@ideasonboard.com>
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

The imx_media_create_csi2_links() creates a media controller link
between the CSI-2 receiver and the next entity in the pipeline, which
can be either a video mux (handled by the video-mux driver) or the CSI
bridge itself. This isn't needed, as the link is already created either
by the video-mux driver or by the imx7-media-csi driver itself (in
imx7_csi_notify_bound()).

Drop imx_media_create_csi2_links(), which allows dropping the CSI bridge
subdev grp_id.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 708076b7045a..e2d6dabad007 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -726,34 +726,6 @@ static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct imx_media_dev, notifier);
 }
 
-/*
- * Create the missing media links from the CSI-2 receiver.
- * Called after all async subdevs have bound.
- */
-static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
-{
-	struct v4l2_subdev *sd, *csi2 = NULL;
-
-	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
-		if (sd->grp_id == IMX_MEDIA_GRP_ID_CSI2) {
-			csi2 = sd;
-			break;
-		}
-	}
-	if (!csi2)
-		return;
-
-	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
-		/* skip if not a CSI or a CSI mux */
-		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
-		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
-		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI_MUX))
-			continue;
-
-		v4l2_create_fwnode_links(csi2, sd);
-	}
-}
-
 /*
  * adds given video device to given imx-media source pad vdev list.
  * Continues upstream from the pad entity's sink pads.
@@ -883,8 +855,6 @@ static int __imx_media_probe_complete(struct v4l2_async_notifier *notifier)
 
 	mutex_lock(&imxmd->mutex);
 
-	imx_media_create_csi2_links(imxmd);
-
 	ret = imx_media_create_pad_vdev_lists(imxmd);
 	if (ret)
 		goto unlock;
@@ -1477,7 +1447,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->sd.dev = &pdev->dev;
 	csi->sd.owner = THIS_MODULE;
 	csi->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
-	csi->sd.grp_id = IMX_MEDIA_GRP_ID_CSI;
 	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
 
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++)
-- 
Regards,

Laurent Pinchart

