Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC80131B4C4
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhBOEiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhBOEiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:38:13 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66FB11AE8;
        Mon, 15 Feb 2021 05:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363334;
        bh=dTMASuDXfw0yFVNEfOo9LAa50buwDU41gm9Se7XAt/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A4ANOkQKlgmqYXVWOzRf1udWENgaLr9SbGfPL0e8y46o7vftJace+YxqZh2l4572T
         enHaHxOYgCQbFeHiKQuTD5sc15ThoKLsOf5kfBqQxcefUebJr25QvChh+h1TNHXaJf
         QZn8yXILnkwVwK0NSqsA5vATFKic6U7ykqPCD0Ec=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 56/77] media: v4l2-mc: Add link flags to v4l2_create_fwnode_links_to_pad()
Date:   Mon, 15 Feb 2021 06:27:20 +0200
Message-Id: <20210215042741.28850-57-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a flags argument to the v4l2_create_fwnode_links_to_pad() function
to specify the link flags. This allows drivers to create immutable links
for instance.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mc.c          | 6 +++---
 drivers/staging/media/imx/imx-media-csi.c  | 2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c | 2 +-
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 include/media/v4l2-mc.h                    | 8 +++++++-
 6 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index ba2f2b8dcc8c..cba3d8e0bc4a 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -310,7 +310,7 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q)
 EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
-				    struct media_pad *sink)
+				    struct media_pad *sink, u32 flags)
 {
 	struct fwnode_handle *endpoint;
 	struct v4l2_subdev *sink_sd;
@@ -367,7 +367,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 			sink_sd->entity.name, sink_idx);
 
 		ret = media_create_pad_link(&src_sd->entity, src_idx,
-					    &sink_sd->entity, sink_idx, 0);
+					    &sink_sd->entity, sink_idx, flags);
 		if (ret) {
 			dev_err(sink_sd->dev,
 				"link %s:%d -> %s:%d failed with %d\n",
@@ -395,7 +395,7 @@ int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
 			continue;
 
-		ret = v4l2_create_fwnode_links_to_pad(src_sd, pad);
+		ret = v4l2_create_fwnode_links_to_pad(src_sd, pad, 0);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 8d02939aaa23..e3bfd635a89a 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1894,7 +1894,7 @@ static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
 		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
 
-	return v4l2_create_fwnode_links_to_pad(sd, sink);
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
 }
 
 static const struct v4l2_async_notifier_operations csi_notify_ops = {
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 9020541edb89..fc2378ac04b7 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -621,7 +621,7 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 
 	dev_dbg(csi2->dev, "Bound %s pad: %d\n", sd->name, pad);
 
-	return v4l2_create_fwnode_links_to_pad(sd, sink);
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
 }
 
 static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 763235447422..69eac1cb4599 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1128,7 +1128,7 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
 		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
 
-	return v4l2_create_fwnode_links_to_pad(sd, sink);
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
 }
 
 static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a01a7364b4b9..8cf860544b0a 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -962,7 +962,7 @@ static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
 	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
 	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
 
-	return v4l2_create_fwnode_links_to_pad(sd, sink);
+	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
 }
 
 static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index bdaa5f2f8ca2..c181685923d5 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -91,6 +91,7 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
  *
  * @src_sd: pointer to a source subdev
  * @sink:  pointer to a subdev sink pad
+ * @flags: the link flags
  *
  * This function searches for fwnode endpoint connections from a source
  * subdevice to a single sink pad, and if suitable connections are found,
@@ -98,6 +99,11 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
  * called by the sink subdevice, in its v4l2-async notifier subdev bound
  * callback, to create links from a bound source subdevice.
  *
+ * The @flags argument specifies the link flags. The caller shall ensure that
+ * the flags are valid regardless of the number of links that may be created.
+ * For instance, setting the MEDIA_LNK_FL_ENABLED flag will cause all created
+ * links to be enabled, which isn't valid if more than one link is created.
+ *
  * .. note::
  *
  *    Any sink subdevice that calls this function must implement the
@@ -107,7 +113,7 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
  * Return 0 on success or a negative error code on failure.
  */
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
-				    struct media_pad *sink);
+				    struct media_pad *sink, u32 flags);
 
 /**
  * v4l2_create_fwnode_links - Create fwnode-based links from a source
-- 
Regards,

Laurent Pinchart

