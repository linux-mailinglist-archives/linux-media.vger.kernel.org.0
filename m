Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03376C7CB8
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 11:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjCXKfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 06:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjCXKf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 06:35:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397EDCA0B
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 03:35:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70C8EA58;
        Fri, 24 Mar 2023 11:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679654123;
        bh=irRViJ6s6qSXGmiC018+CDwDizP6GHZGeGJX5IlgofI=;
        h=From:To:Cc:Subject:Date:From;
        b=f/YUlFho7mu3BDI1KbN1Af8OMq/5pcHU07mGgLEvd7oK3rbOBUOBPgC7gJpjWsNtr
         sSup+Zi/5fh3kX4jC1nlYSmpFQ0ptK8zlkHvvoNnDsD/iFwZh8umkDF6TeH7X0CJRQ
         L7vzbpobxmK9b+c7M4U8cE7UQg0TBN5LMgWx4Zbc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: [PATCH] media: Accept non-subdev sinks in v4l2_create_fwnode_links_to_pad()
Date:   Fri, 24 Mar 2023 12:35:29 +0200
Message-Id: <20230324103529.8704-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_create_fwnode_links_to_pad() helper requires the sink pad
passed to it to belong to a subdev. This requirement can be lifted
easily. Make the function usable for non-subdev sinks, which allows
using it with video_device sinks.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 15 ++++++---------
 include/media/v4l2-mc.h           |  8 ++++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index b01474717dca..bf0c18100664 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -313,14 +313,11 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				    struct media_pad *sink, u32 flags)
 {
 	struct fwnode_handle *endpoint;
-	struct v4l2_subdev *sink_sd;
 
 	if (!(sink->flags & MEDIA_PAD_FL_SINK) ||
 	    !is_media_entity_v4l2_subdev(sink->entity))
 		return -EINVAL;
 
-	sink_sd = media_entity_to_v4l2_subdev(sink->entity);
-
 	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
@@ -340,7 +337,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		 * ask the sink to verify it owns the remote endpoint,
 		 * and translate to a sink pad.
 		 */
-		sink_idx = media_entity_get_fwnode_pad(&sink_sd->entity,
+		sink_idx = media_entity_get_fwnode_pad(sink->entity,
 						       remote_ep,
 						       MEDIA_PAD_FL_SINK);
 		fwnode_handle_put(remote_ep);
@@ -362,17 +359,17 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 		if (media_entity_find_link(src, sink))
 			continue;
 
-		dev_dbg(sink_sd->dev, "creating link %s:%d -> %s:%d\n",
+		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
 			src_sd->entity.name, src_idx,
-			sink_sd->entity.name, sink_idx);
+			sink->entity->name, sink_idx);
 
 		ret = media_create_pad_link(&src_sd->entity, src_idx,
-					    &sink_sd->entity, sink_idx, flags);
+					    sink->entity, sink_idx, flags);
 		if (ret) {
-			dev_err(sink_sd->dev,
+			dev_err(src_sd->dev,
 				"link %s:%d -> %s:%d failed with %d\n",
 				src_sd->entity.name, src_idx,
-				sink_sd->entity.name, sink_idx, ret);
+				sink->entity->name, sink_idx, ret);
 
 			fwnode_handle_put(endpoint);
 			return ret;
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index c181685923d5..b39586dfba35 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -87,17 +87,17 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
 
 /**
  * v4l2_create_fwnode_links_to_pad - Create fwnode-based links from a
- *                                   source subdev to a sink subdev pad.
+ *                                   source subdev to a sink pad.
  *
  * @src_sd: pointer to a source subdev
- * @sink:  pointer to a subdev sink pad
+ * @sink:  pointer to a sink pad
  * @flags: the link flags
  *
  * This function searches for fwnode endpoint connections from a source
  * subdevice to a single sink pad, and if suitable connections are found,
  * translates them into media links to that pad. The function can be
- * called by the sink subdevice, in its v4l2-async notifier subdev bound
- * callback, to create links from a bound source subdevice.
+ * called by the sink, in its v4l2-async notifier bound callback, to create
+ * links from a bound source subdevice.
  *
  * The @flags argument specifies the link flags. The caller shall ensure that
  * the flags are valid regardless of the number of links that may be created.
-- 
Regards,

Laurent Pinchart

