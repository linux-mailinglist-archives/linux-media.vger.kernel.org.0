Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90ED54C8FC0
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbiCAQNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiCAQNK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9C513CD4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:27 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5AB1010;
        Tue,  1 Mar 2022 17:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151142;
        bh=Uqif8cAOvEVhHTIYxQ2vbsDJc9RcrTKBItRiIGKg3gs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WYQxkwDm/9UBsKRNpp8R8RhIFOtBD2lhGXR93/HRFL+2Q//T3D3Wz++z5zteCOjqW
         6G54K5K6EU01wAd34r4CIR+Byx6XL2tW/l6VeKNkI6YGUYkHheYug3aXs0rv+6q8MQ
         pBIawmvvhQ30Y6MzoFZZEbQ98d92j5J+pd8yL2Qs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 02/36] media: entity: Use pads instead of entities in the media graph walk stack
Date:   Tue,  1 Mar 2022 18:11:22 +0200
Message-Id: <20220301161156.1119557-3-tomi.valkeinen@ideasonboard.com>
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

Change the media graph walk stack structure to use media pads instead of
using media entities. In addition to the entity, the pad contains the
information which pad in the entity are being dealt with.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 55 ++++++++++++++++++------------------
 include/media/media-entity.h |  8 +++---
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 6873dfc367d0..885918ffd762 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -210,40 +210,39 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
-static struct media_entity *
-media_entity_other(struct media_entity *entity, struct media_link *link)
+static struct media_pad *
+media_pad_other(struct media_pad *pad, struct media_link *link)
 {
-	if (link->source->entity == entity)
-		return link->sink->entity;
+	if (link->source == pad)
+		return link->sink;
 	else
-		return link->source->entity;
+		return link->source;
 }
 
 /* push an entity to traversal stack */
-static void stack_push(struct media_graph *graph,
-		       struct media_entity *entity)
+static void stack_push(struct media_graph *graph, struct media_pad *pad)
 {
 	if (graph->top == MEDIA_ENTITY_ENUM_MAX_DEPTH - 1) {
 		WARN_ON(1);
 		return;
 	}
 	graph->top++;
-	graph->stack[graph->top].link = entity->links.next;
-	graph->stack[graph->top].entity = entity;
+	graph->stack[graph->top].link = pad->entity->links.next;
+	graph->stack[graph->top].pad = pad;
 }
 
-static struct media_entity *stack_pop(struct media_graph *graph)
+static struct media_pad *stack_pop(struct media_graph *graph)
 {
-	struct media_entity *entity;
+	struct media_pad *pad;
 
-	entity = graph->stack[graph->top].entity;
+	pad = graph->stack[graph->top].pad;
 	graph->top--;
 
-	return entity;
+	return pad;
 }
 
 #define link_top(en)	((en)->stack[(en)->top].link)
-#define stack_top(en)	((en)->stack[(en)->top].entity)
+#define stack_top(en)	((en)->stack[(en)->top].pad)
 
 /**
  * media_graph_walk_init - Allocate resources for graph walk
@@ -279,8 +278,8 @@ void media_graph_walk_start(struct media_graph *graph, struct media_pad *pad)
 	media_entity_enum_set(&graph->ent_enum, pad->entity);
 
 	graph->top = 0;
-	graph->stack[graph->top].entity = NULL;
-	stack_push(graph, pad->entity);
+	graph->stack[graph->top].pad = NULL;
+	stack_push(graph, pad);
 	dev_dbg(pad->graph_obj.mdev->dev,
 		"begin graph walk at '%s':%u\n", pad->entity->name, pad->index);
 }
@@ -288,16 +287,16 @@ EXPORT_SYMBOL_GPL(media_graph_walk_start);
 
 static void media_graph_walk_iter(struct media_graph *graph)
 {
-	struct media_entity *entity = stack_top(graph);
+	struct media_pad *pad = stack_top(graph);
 	struct media_link *link;
-	struct media_entity *next;
+	struct media_pad *next;
 
 	link = list_entry(link_top(graph), typeof(*link), list);
 
 	/* The link is not enabled so we do not follow. */
 	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
 		link_top(graph) = link_top(graph)->next;
-		dev_dbg(entity->graph_obj.mdev->dev,
+		dev_dbg(pad->graph_obj.mdev->dev,
 			"walk: skipping disabled link '%s':%u -> '%s':%u\n",
 			link->source->entity->name, link->source->index,
 			link->sink->entity->name, link->sink->index);
@@ -305,23 +304,23 @@ static void media_graph_walk_iter(struct media_graph *graph)
 	}
 
 	/* Get the entity at the other end of the link. */
-	next = media_entity_other(entity, link);
+	next = media_pad_other(pad, link);
 
 	/* Has the entity already been visited? */
-	if (media_entity_enum_test_and_set(&graph->ent_enum, next)) {
+	if (media_entity_enum_test_and_set(&graph->ent_enum, next->entity)) {
 		link_top(graph) = link_top(graph)->next;
-		dev_dbg(entity->graph_obj.mdev->dev,
+		dev_dbg(pad->graph_obj.mdev->dev,
 			"walk: skipping entity '%s' (already seen)\n",
-			next->name);
+			next->entity->name);
 		return;
 	}
 
 	/* Push the new entity to stack and start over. */
 	link_top(graph) = link_top(graph)->next;
 	stack_push(graph, next);
-	dev_dbg(entity->graph_obj.mdev->dev, "walk: pushing '%s' on stack\n",
-		next->name);
-	lockdep_assert_held(&entity->graph_obj.mdev->graph_mutex);
+	dev_dbg(next->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
+		next->entity->name, next->index);
+	lockdep_assert_held(&next->graph_obj.mdev->graph_mutex);
 }
 
 struct media_entity *media_graph_walk_next(struct media_graph *graph)
@@ -336,10 +335,10 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
 	 * top of the stack until no more entities on the level can be
 	 * found.
 	 */
-	while (link_top(graph) != &stack_top(graph)->links)
+	while (link_top(graph) != &stack_top(graph)->entity->links)
 		media_graph_walk_iter(graph);
 
-	entity = stack_pop(graph);
+	entity = stack_pop(graph)->entity;
 	dev_dbg(entity->graph_obj.mdev->dev,
 		"walk: returning entity '%s'\n", entity->name);
 
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 726dfef1d038..56bd46dd6394 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -79,16 +79,16 @@ struct media_entity_enum {
  * struct media_graph - Media graph traversal state
  *
  * @stack:		Graph traversal stack; the stack contains information
- *			on the path the media entities to be walked and the
- *			links through which they were reached.
- * @stack.entity:	pointer to &struct media_entity at the graph.
+ *			on the media pads to be walked and the links through
+ *			which they were reached.
+ * @stack.pad:		pointer to &struct media_pad at the graph.
  * @stack.link:		pointer to &struct list_head.
  * @ent_enum:		Visited entities
  * @top:		The top of the stack
  */
 struct media_graph {
 	struct {
-		struct media_entity *entity;
+		struct media_pad *pad;
 		struct list_head *link;
 	} stack[MEDIA_ENTITY_ENUM_MAX_DEPTH];
 
-- 
2.25.1

