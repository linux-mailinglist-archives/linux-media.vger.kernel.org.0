Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5561A614C
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 03:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgDMBOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 21:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgDMBOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 21:14:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6506C008778
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2020 18:14:36 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC4E351A;
        Mon, 13 Apr 2020 03:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586740473;
        bh=2DDJy70JoYarpdN7XHs4DMndJoOb0+fyT3lDUEjxP3A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oCiKBesUZzDufzPWJUNpMnAmT+cxPUMJEvA1+nit9+81Boaucq0TsJWlFguCeFfrS
         IFPnHVFbZMqamPH+fpG6nv/x7Va2fdh38HSWHWlYEzYETnM+cBUa3nmFDlndsGQVEM
         JZFh6vaD5Z/rVqDcoDg6UmrymiPvHkXHfdgQ9w4U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] media: staging/imx: Don't assume OF port id equals pad index
Date:   Mon, 13 Apr 2020 04:14:15 +0300
Message-Id: <20200413011416.2355-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
References: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When parsing the graph and linking entities, the driver assumes that an
OF port if is always equal to the entity pad index. This isn't a valid
assumption, as for instance a CSI-2 source could be a SMIA++-compatible
sensor that creates two or more subdevs but has a single DT node.

Media entities should provide an operation to map port ids to pad
indexes. Until this is available, work around the issue locally by
picking the first pad that has the expected direction if the pad pointed
to by the port id doesn't have the right direction.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 10 ++++-
 drivers/staging/media/imx/imx-media-of.c  | 52 ++++++++++++++++++++---
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 66468326bcbc..d275decc79be 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -199,10 +199,16 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
 	/*
-	 * NOTE: this assumes an OF-graph port id is the same as a
-	 * media pad index.
+	 * Find the port corresponding to the pad. Start by assuming that the
+	 * port id is equal to the pad index. If there's no such port, use the
+	 * first port.
+	 *
+	 * FIXME: Media entities should provide an operation to translate from
+	 * pad index to fwnode port id.
 	 */
 	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
+	if (!port)
+		port = of_graph_get_port_by_id(sd->dev->of_node, 0);
 	if (!port)
 		return -ENODEV;
 
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 2d3efd2a6dde..f07bd05b8fa5 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -78,9 +78,8 @@ EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
 /*
  * Create a single media link to/from sd using a fwnode link.
  *
- * NOTE: this function assumes an OF port node is equivalent to
- * a media pad (port id equal to media pad index), and that an
- * OF endpoint node is equivalent to a media link.
+ * NOTE: this function assumes that an OF endpoint node is equivalent to a
+ * media link.
  */
 static int create_of_link(struct imx_media_dev *imxmd,
 			  struct v4l2_subdev *sd,
@@ -88,6 +87,8 @@ static int create_of_link(struct imx_media_dev *imxmd,
 {
 	struct v4l2_subdev *remote, *src, *sink;
 	int src_pad, sink_pad;
+	int remote_pad;
+	u32 pad_flags;
 
 	if (link->local_port >= sd->entity.num_pads)
 		return -EINVAL;
@@ -96,19 +97,56 @@ static int create_of_link(struct imx_media_dev *imxmd,
 	if (!remote)
 		return 0;
 
-	if (sd->entity.pads[link->local_port].flags & MEDIA_PAD_FL_SINK) {
+	/*
+	 * Find the remote pad. Try the pad corresponding to the fwnode port id
+	 * first. If its direction doesn't correspond to what we expect, use the
+	 * first pad that has the right direction.
+	 *
+	 * FIXME: Media entities should provide an operation to translate from
+	 * fwnode port id to pad index.
+	 */
+	pad_flags = sd->entity.pads[link->local_port].flags;
+	pad_flags = pad_flags & MEDIA_PAD_FL_SINK
+		  ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	if (link->remote_port < remote->entity.num_pads &&
+	    remote->entity.pads[link->remote_port].flags & pad_flags) {
+		remote_pad = link->remote_port;
+	} else {
+		unsigned int i;
+
+		remote_pad = -1;
+		for (i = 0; i < remote->entity.num_pads; ++i) {
+			if (remote->entity.pads[i].flags & pad_flags) {
+				remote_pad = i;
+				break;
+			}
+		}
+
+		if (remote_pad == -1) {
+			v4l2_err(sd->v4l2_dev,
+				 "remote entity %s has no %s pad\n",
+				 remote->name,
+				 pad_flags & MEDIA_PAD_FL_SOURCE ?
+				 "source" : "sink");
+			return -EINVAL;
+		}
+	}
+
+	/* Mad the local and remote entities to source and sink. */
+	if (pad_flags & MEDIA_PAD_FL_SOURCE) {
 		src = remote;
-		src_pad = link->remote_port;
+		src_pad = remote_pad;
 		sink = sd;
 		sink_pad = link->local_port;
 	} else {
 		src = sd;
 		src_pad = link->local_port;
 		sink = remote;
-		sink_pad = link->remote_port;
+		sink_pad = remote_pad;
 	}
 
-	/* make sure link doesn't already exist before creating */
+	/* Make sure link doesn't already exist before creating it. */
 	if (media_entity_find_link(&src->entity.pads[src_pad],
 				   &sink->entity.pads[sink_pad]))
 		return 0;
-- 
Regards,

Laurent Pinchart

