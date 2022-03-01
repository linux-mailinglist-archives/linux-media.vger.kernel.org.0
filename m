Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DB74C8FBF
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbiCAQNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiCAQNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EB613CD4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:24 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62504E41;
        Tue,  1 Mar 2022 17:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151142;
        bh=KGxiJekEIl/3nh3hBpF659jAlA/adyyPc8BdLVw9kAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=scd26nxAv18UoB7uXxFWYmLVM9cBXEoaYB/LPcvnNSS7ijf9VsAOVRvBa9yF2OtSU
         fvb9Fv5ffpq8Ixdabp3TNJgdPLdqdPULNDIpMc7uFND/vE1XXfV+zrys3IK4aEUKcn
         VMJ/3LBV3ftKToHz+MdJf+drJvFBdeazC+A/uFJ8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 01/36] media: entity: Use pad as a starting point for graph walk
Date:   Tue,  1 Mar 2022 18:11:21 +0200
Message-Id: <20220301161156.1119557-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the upcoming use of the recently added has_route() media entity op,
all the pads in an entity will no longer be considered interconnected.
This has an effect where the media graph is traversed: the starting pad
does make a difference.

Prepare for this change by using pad instead of the entity as an argument
for the graph walk operations. The actual graph traversal algorithm change
is in further patches.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst    |  2 +-
 drivers/media/mc/mc-entity.c                  | 17 ++++++++---------
 drivers/media/platform/exynos4-is/media-dev.c |  4 ++--
 drivers/media/platform/omap3isp/ispvideo.c    |  2 +-
 drivers/media/platform/vsp1/vsp1_video.c      |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
 drivers/media/v4l2-core/v4l2-mc.c             |  6 +++---
 drivers/staging/media/omap4iss/iss_video.c    |  4 ++--
 include/media/media-entity.h                  | 10 ++++------
 9 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 57b5bbba944e..ba0aee982124 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -167,7 +167,7 @@ Drivers initiate a graph traversal by calling
 :c:func:`media_graph_walk_start()`
 
 The graph structure, provided by the caller, is initialized to start graph
-traversal at the given entity.
+traversal at the given pad in an entity.
 
 Drivers can then retrieve the next entity by calling
 :c:func:`media_graph_walk_next()`
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b411f9796191..6873dfc367d0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -273,17 +273,16 @@ void media_graph_walk_cleanup(struct media_graph *graph)
 }
 EXPORT_SYMBOL_GPL(media_graph_walk_cleanup);
 
-void media_graph_walk_start(struct media_graph *graph,
-			    struct media_entity *entity)
+void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad)
 {
 	media_entity_enum_zero(&graph->ent_enum);
-	media_entity_enum_set(&graph->ent_enum, entity);
+	media_entity_enum_set(&graph->ent_enum, pad->entity);
 
 	graph->top = 0;
 	graph->stack[graph->top].entity = NULL;
-	stack_push(graph, entity);
-	dev_dbg(entity->graph_obj.mdev->dev,
-		"begin graph walk at '%s'\n", entity->name);
+	stack_push(graph, pad->entity);
+	dev_dbg(pad->graph_obj.mdev->dev,
+		"begin graph walk at '%s':%u\n", pad->entity->name, pad->index);
 }
 EXPORT_SYMBOL_GPL(media_graph_walk_start);
 
@@ -402,7 +401,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 			goto error_graph_walk_start;
 	}
 
-	media_graph_walk_start(&pipe->graph, entity);
+	media_graph_walk_start(&pipe->graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
@@ -486,7 +485,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 	 * Link validation on graph failed. We revert what we did and
 	 * return the error.
 	 */
-	media_graph_walk_start(graph, entity_err);
+	media_graph_walk_start(graph, entity_err->pads);
 
 	while ((entity_err = media_graph_walk_next(graph))) {
 		/* Sanity check for negative stream_count */
@@ -537,7 +536,7 @@ void __media_pipeline_stop(struct media_entity *entity)
 	if (WARN_ON(!pipe))
 		return;
 
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		/* Sanity check for negative stream_count */
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 544b54e428c9..9a762779da49 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1173,7 +1173,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
 	 * through active links. This is needed as we cannot power on/off the
 	 * subdevs in random order.
 	 */
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		if (!is_media_entity_v4l2_video_device(entity))
@@ -1188,7 +1188,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
 	return 0;
 
 err:
-	media_graph_walk_start(graph, entity_err);
+	media_graph_walk_start(graph, entity_err->pads);
 
 	while ((entity_err = media_graph_walk_next(graph))) {
 		if (!is_media_entity_v4l2_video_device(entity_err))
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index 8811d6dd4ee7..3c1485d59404 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -234,7 +234,7 @@ static int isp_video_get_graph_data(struct isp_video *video,
 		return ret;
 	}
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(&graph))) {
 		struct isp_video *__video;
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 044eb5778820..61e4fbaba7b7 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -569,7 +569,7 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 	if (ret)
 		return ret;
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(&graph))) {
 		struct v4l2_subdev *subdev;
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 338c3661d809..af0d55ab6c15 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -189,7 +189,7 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
 		return ret;
 	}
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(&graph))) {
 		struct xvip_dma *dma;
diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index b01474717dca..d215fe31b9a2 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -436,7 +436,7 @@ static int pipeline_pm_use_count(struct media_entity *entity,
 {
 	int use = 0;
 
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		if (is_media_entity_v4l2_video_device(entity))
@@ -499,7 +499,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
 	if (!change)
 		return 0;
 
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while (!ret && (entity = media_graph_walk_next(graph)))
 		if (is_media_entity_v4l2_subdev(entity))
@@ -508,7 +508,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
 	if (!ret)
 		return ret;
 
-	media_graph_walk_start(graph, first);
+	media_graph_walk_start(graph, first->pads);
 
 	while ((first = media_graph_walk_next(graph))
 	       && first != entity)
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index d0da083deed5..760cd0ab1feb 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -217,7 +217,7 @@ iss_video_far_end(struct iss_video *video)
 		return NULL;
 	}
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(&graph))) {
 		if (entity == &video->video.entity)
@@ -892,7 +892,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		goto err_media_pipeline_start;
 
 	mutex_lock(&mdev->graph_mutex);
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 	while ((entity = media_graph_walk_next(&graph)))
 		media_entity_enum_set(&pipe->ent_enum, entity);
 	mutex_unlock(&mdev->graph_mutex);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fea489f03d57..726dfef1d038 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -903,22 +903,20 @@ __must_check int media_graph_walk_init(
 void media_graph_walk_cleanup(struct media_graph *graph);
 
 /**
- * media_graph_walk_start - Start walking the media graph at a
- *	given entity
+ * media_graph_walk_start - Start walking the media graph at a given pad
  *
  * @graph: Media graph structure that will be used to walk the graph
- * @entity: Starting entity
+ * @pad: Starting pad
  *
  * Before using this function, media_graph_walk_init() must be
  * used to allocate resources used for walking the graph. This
  * function initializes the graph traversal structure to walk the
- * entities graph starting at the given entity. The traversal
+ * entities graph starting at the given pad. The traversal
  * structure must not be modified by the caller during graph
  * traversal. After the graph walk, the resources must be released
  * using media_graph_walk_cleanup().
  */
-void media_graph_walk_start(struct media_graph *graph,
-			    struct media_entity *entity);
+void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad);
 
 /**
  * media_graph_walk_next - Get the next entity in the graph
-- 
2.25.1

