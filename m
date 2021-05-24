Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014A938E452
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhEXKqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhEXKqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05030C061574
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 03:44:31 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 911F9182C;
        Mon, 24 May 2021 12:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853068;
        bh=7fR4JzssU6ZybYXSvkIfq8QlK5WtaQGH821wAcaAfzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tVXZQiSiK99uC07E8oxwlTp7UeSo3IQv9amYah0oih/E9IfYU3QlEucrgw2cUKYe6
         e08s/LVBLQ9NGQvCmum/DjYUvaQgy/zI3yOquZwoS36fEHOhvd6u/JDVANlc5jDV5d
         CCbUnH26ILiIN7DVtGILnr404SIN+l67qMhJHOr4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 04/27] v4l: mc: Start walk from a specific pad in use count calculation
Date:   Mon, 24 May 2021 13:43:45 +0300
Message-Id: <20210524104408.599645-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
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

