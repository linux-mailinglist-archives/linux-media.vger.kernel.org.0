Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B3B2EAED0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbhAEPiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:38:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbhAEPiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:38:19 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 860131BE5;
        Tue,  5 Jan 2021 16:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860614;
        bh=LP++87BuB83m9pwfhVBpLAYed3/yVvKGBvfHiO0iEWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bmqfuJZ9ajyRZ5KlWuWWocSnVyORDlEJUqZrL9KyyLwL5lAFLW4eAc58WTbz6f58Y
         nP4Zr982o1l0nv279L29wh2Gjv8wGPLbl4IRSe67ufRnJJjco4ZRZrrxyfaDKd4TYY
         ahEsJTasZ4+85WSETl9bP1Bo7DgCl+cdwtNf1k9w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 56/75] media: imx: imx7_media-csi: Create immutable link to source device
Date:   Tue,  5 Jan 2021 17:28:33 +0200
Message-Id: <20210105152852.5733-57-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI subdev has a single source, the input video mux. There's thus a
single link between the source and the CSI, which can be made immutable
and enabled to simplify configuration.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 45 ++--------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ed11d405c98c..b82275af0d3e 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1050,47 +1050,7 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
  * Media Entity Operations
  */
 
-static int imx7_csi_link_setup(struct media_entity *entity,
-			       const struct media_pad *local,
-			       const struct media_pad *remote, u32 flags)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev *remote_sd;
-	int ret = 0;
-
-	dev_dbg(csi->dev, "link setup %s -> %s\n", remote->entity->name,
-		local->entity->name);
-
-	mutex_lock(&csi->lock);
-
-	if (local->flags & MEDIA_PAD_FL_SINK) {
-		if (!is_media_entity_v4l2_subdev(remote->entity)) {
-			ret = -EINVAL;
-			goto unlock;
-		}
-
-		remote_sd = media_entity_to_v4l2_subdev(remote->entity);
-
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi->src_sd) {
-				ret = -EBUSY;
-				goto unlock;
-			}
-			csi->src_sd = remote_sd;
-		} else {
-			csi->src_sd = NULL;
-		}
-	}
-
-unlock:
-	mutex_unlock(&csi->lock);
-
-	return ret;
-}
-
 static const struct media_entity_operations imx7_csi_entity_ops = {
-	.link_setup	= imx7_csi_link_setup,
 	.link_validate	= v4l2_subdev_link_validate,
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
@@ -1113,7 +1073,10 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	/* Mark it as such via its group id */
 	sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
 
-	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
+	csi->src_sd = sd;
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
+					       MEDIA_LNK_FL_IMMUTABLE);
 }
 
 static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
-- 
Regards,

Laurent Pinchart

