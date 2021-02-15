Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF6E31B4C5
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBOEiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhBOEiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:38:13 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA671B08;
        Mon, 15 Feb 2021 05:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363335;
        bh=wnuuBoYiv0Q98m8kUS+NNutTtBfByEcB76VpIFE7Q7c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuQW+hJoNEWcUIz01O1hV443pw2NI99mh8OQZQWiLcSTwjr6x+xdkDVtZYEYL6bqt
         j16S4wcTbj3/Es1gb8wKZtOSRFQ7DE+mi1EahS4OI1+bvNtzrH310gIUkVpWMWw8K0
         v/n3BdyCJxX4E9qqcEZNpHtD/dFU2c998BlEVzEI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 57/77] media: imx: imx7_media-csi: Create immutable link to source device
Date:   Mon, 15 Feb 2021 06:27:21 +0200
Message-Id: <20210215042741.28850-58-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI subdev has a single source, the input video mux. There's thus a
single link between the source and the CSI, which can be made immutable
and enabled to simplify configuration.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 45 ++--------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 69eac1cb4599..f85a2f5f1413 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1065,47 +1065,7 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
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
@@ -1128,7 +1088,10 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
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

