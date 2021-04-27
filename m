Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA0A36C645
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhD0Mqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:46:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236204AbhD0Mqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:46:51 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86B3D3C;
        Tue, 27 Apr 2021 14:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527567;
        bh=7fR4JzssU6ZybYXSvkIfq8QlK5WtaQGH821wAcaAfzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rQJXm5gkg4vCcrpLQJBezVePaphgIfqVFebt167MzYOReaRNytzIP+MEKzbpYzDDN
         uCCz085GaFArxvuy8nFFw1SOVM5xYkULPYLe/hzkdpmFY4w4ErOiw6NEJFUvLfeA+/
         g8Y6lj+U1qxWjrf4bi5ZeMnGwb12fqEeMRybgGOA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 04/24] v4l: mc: Start walk from a specific pad in use count calculation
Date:   Tue, 27 Apr 2021 15:45:03 +0300
Message-Id: <20210427124523.990938-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the addition of the recent has_route() media entity op, the pads of a
media entity are no longer all interconnected. This has to be taken into
account in power management.

Prepare for the addition of a helper function supporting S_ROUTING.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index cbeb580c6754..35d18ed89fa5 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -427,17 +427,16 @@ EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links);
 
 /*
  * pipeline_pm_use_count - Count the number of users of a pipeline
- * @entity: The entity
+ * @pad: Any pad along the pipeline
  *
  * Return the total number of users of all video device nodes in the pipeline.
  */
-static int pipeline_pm_use_count(struct media_entity *entity,
-	struct media_graph *graph)
+static int pipeline_pm_use_count(struct media_pad *pad,
+				 struct media_graph *graph)
 {
-	struct media_pad *pad;
 	int use = 0;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, pad);
 
 	while ((pad = media_graph_walk_next(graph))) {
 		if (is_media_entity_v4l2_video_device(pad->entity))
@@ -483,7 +482,7 @@ static int pipeline_pm_power_one(struct media_entity *entity, int change)
 
 /*
  * pipeline_pm_power - Apply power change to all entities in a pipeline
- * @entity: The entity
+ * @pad: Any pad along the pipeline
  * @change: Use count change
  *
  * Walk the pipeline to update the use count and the power state of all non-node
@@ -491,16 +490,16 @@ static int pipeline_pm_power_one(struct media_entity *entity, int change)
  *
  * Return 0 on success or a negative error code on failure.
  */
-static int pipeline_pm_power(struct media_entity *entity, int change,
-	struct media_graph *graph)
+static int pipeline_pm_power(struct media_pad *pad, int change,
+			     struct media_graph *graph)
 {
-	struct media_pad *tmp_pad, *pad;
+	struct media_pad *tmp_pad, *first = pad;
 	int ret = 0;
 
 	if (!change)
 		return 0;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, pad);
 
 	while (!ret && (pad = media_graph_walk_next(graph)))
 		if (is_media_entity_v4l2_subdev(pad->entity))
@@ -509,7 +508,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
 	if (!ret)
 		return ret;
 
-	media_graph_walk_start(graph, entity->pads);
+	media_graph_walk_start(graph, first);
 
 	while ((tmp_pad = media_graph_walk_next(graph)) && tmp_pad != pad)
 		if (is_media_entity_v4l2_subdev(tmp_pad->entity))
@@ -531,7 +530,7 @@ static int v4l2_pipeline_pm_use(struct media_entity *entity, unsigned int use)
 	WARN_ON(entity->use_count < 0);
 
 	/* Apply power change to connected non-nodes. */
-	ret = pipeline_pm_power(entity, change, &mdev->pm_count_walk);
+	ret = pipeline_pm_power(entity->pads, change, &mdev->pm_count_walk);
 	if (ret < 0)
 		entity->use_count -= change;
 
@@ -557,8 +556,8 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 			      unsigned int notification)
 {
 	struct media_graph *graph = &link->graph_obj.mdev->pm_count_walk;
-	struct media_entity *source = link->source->entity;
-	struct media_entity *sink = link->sink->entity;
+	struct media_pad *source = link->source;
+	struct media_pad *sink = link->sink;
 	int source_use;
 	int sink_use;
 	int ret = 0;
-- 
2.25.1

