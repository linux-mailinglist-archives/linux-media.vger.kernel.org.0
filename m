Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF073609F4
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhDONFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbhDONFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:33 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2282089D;
        Thu, 15 Apr 2021 15:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491908;
        bh=xKiH245R3Ah+fayZP6PPuAQf/Rk1m2dSWnfcL4HzV2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P7YZYExtD8r3+fGBgyWMBtNS4fFl++mPWZBRspM5q+NshGscTjFDXFLZZbOistjeC
         8QFy+Bpgn32ECNMMCXGpta7JYWYf+r0kyr9FAZh4npyjeBSp5pbJLsQyRGXRb4Ufrl
         Pbag3auKuGt8aMbdfCs8x99TADf0jSqWK1erPtuw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 01/24] media: entity: Use pad as a starting point for graph walk
Date:   Thu, 15 Apr 2021 16:04:27 +0300
Message-Id: <20210415130450.421168-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the upcoming use of the recently added has_route() media entity op, all
the pads in an entity will no longer be considered interconnected. This has
an effect where the media graph is traversed: the starting pad does make a
difference.

Prepare for this change by using pad instead of the entity as an argument
for the graph walk operations. The actual graph traversal algorithm change
is in further patches.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
index 12b45e669bcc..459a5bb4ab41 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -291,17 +291,16 @@ void media_graph_walk_cleanup(struct media_graph *graph)
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
 
@@ -419,7 +418,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 			goto error_graph_walk_start;
 	}
 
-	media_graph_walk_start(&pipe->graph, entity);
+	media_graph_walk_start(&pipe->graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
@@ -503,7 +502,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 	 * Link validation on graph failed. We revert what we did and
 	 * return the error.
 	 */
-	media_graph_walk_start(graph, entity_err);
+	media_graph_walk_start(graph, entity_err->pads);
 
 	while ((entity_err = media_graph_walk_next(graph))) {
 		/* Sanity check for negative stream_count */
@@ -554,7 +553,7 @@ void __media_pipeline_stop(struct media_entity *entity)
 	if (WARN_ON(!pipe))
 		return;
 
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		/* Sanity check for negative stream_count */
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 13d192ba4aa6..d90663b65932 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1175,7 +1175,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
 	 * through active links. This is needed as we cannot power on/off the
 	 * subdevs in random order.
 	 */
-	media_graph_walk_start(graph, entity);
+	media_graph_walk_start(graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(graph))) {
 		if (!is_media_entity_v4l2_video_device(entity))
@@ -1190,7 +1190,7 @@ static int __fimc_md_modify_pipelines(struct media_entity *entity, bool enable,
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
index 2a56201cb853..d64c3bee8b95 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -190,7 +190,7 @@ static int xvip_pipeline_validate(struct xvip_pipeline *pipe,
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
index 66975a37dc85..77bf1b8a56f7 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -217,7 +217,7 @@ iss_video_far_end(struct iss_video *video)
 		return NULL;
 	}
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 
 	while ((entity = media_graph_walk_next(&graph))) {
 		if (entity == &video->video.entity)
@@ -890,7 +890,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (ret < 0)
 		goto err_media_pipeline_start;
 
-	media_graph_walk_start(&graph, entity);
+	media_graph_walk_start(&graph, entity->pads);
 	while ((entity = media_graph_walk_next(&graph)))
 		media_entity_enum_set(&pipe->ent_enum, entity);
 
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cbdfcb79d0d0..83c4fd93f349 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -897,22 +897,20 @@ __must_check int media_graph_walk_init(
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

