Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB3187368
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 20:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732489AbgCPTd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 15:33:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51860 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732366AbgCPTd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 15:33:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 29BE6293517
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        niklas.soderlund@ragnatech.se, mchehab@kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 1/4] media: mc-entity.c: add media_graph_walk_next_stream()
Date:   Mon, 16 Mar 2020 16:33:02 -0300
Message-Id: <20200316193305.428378-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316193305.428378-1-helen.koike@collabora.com>
References: <20200316193305.428378-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add media_graph_walk_next_stream() function to follow links only from
sink to source (not the opposite) to allow iteration only through the
entities participating in a given stream.

This is useful to allow calling .s_stream() callback only in the
subdevices that requires to be enabled/disabled, and avoid calling this
callback when not required.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

 drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++++++++++++++---
 include/media/media-entity.h | 15 +++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 211279c5fd77..0d44c2de23e6 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -228,6 +228,11 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
+enum media_graph_walk_type {
+	MEDIA_GRAPH_WALK_CONNECTED_NODES,
+	MEDIA_GRAPH_WALK_STREAM_NODES,
+};
+
 static struct media_entity *
 media_entity_other(struct media_entity *entity, struct media_link *link)
 {
@@ -305,7 +310,8 @@ void media_graph_walk_start(struct media_graph *graph,
 }
 EXPORT_SYMBOL_GPL(media_graph_walk_start);
 
-static void media_graph_walk_iter(struct media_graph *graph)
+static void media_graph_walk_iter(struct media_graph *graph,
+				  enum media_graph_walk_type type)
 {
 	struct media_entity *entity = stack_top(graph);
 	struct media_link *link;
@@ -326,6 +332,15 @@ static void media_graph_walk_iter(struct media_graph *graph)
 	/* Get the entity in the other end of the link . */
 	next = media_entity_other(entity, link);
 
+	if (type == MEDIA_GRAPH_WALK_STREAM_NODES
+	    && next == link->sink->entity) {
+		link_top(graph) = link_top(graph)->next;
+		dev_dbg(entity->graph_obj.mdev->dev,
+			"walk: skipping '%s' (outside of the stream path)\n",
+			link->sink->entity->name);
+		return;
+	}
+
 	/* Has the entity already been visited? */
 	if (media_entity_enum_test_and_set(&graph->ent_enum, next)) {
 		link_top(graph) = link_top(graph)->next;
@@ -342,7 +357,9 @@ static void media_graph_walk_iter(struct media_graph *graph)
 		next->name);
 }
 
-struct media_entity *media_graph_walk_next(struct media_graph *graph)
+static struct media_entity *
+__media_graph_walk_next(struct media_graph *graph,
+			enum media_graph_walk_type type)
 {
 	struct media_entity *entity;
 
@@ -355,7 +372,7 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
 	 * found.
 	 */
 	while (link_top(graph) != &stack_top(graph)->links)
-		media_graph_walk_iter(graph);
+		media_graph_walk_iter(graph, type);
 
 	entity = stack_pop(graph);
 	dev_dbg(entity->graph_obj.mdev->dev,
@@ -363,8 +380,19 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
 
 	return entity;
 }
+
+struct media_entity *media_graph_walk_next(struct media_graph *graph)
+{
+	return __media_graph_walk_next(graph, MEDIA_GRAPH_WALK_CONNECTED_NODES);
+}
 EXPORT_SYMBOL_GPL(media_graph_walk_next);
 
+struct media_entity *media_graph_walk_next_stream(struct media_graph *graph)
+{
+	return __media_graph_walk_next(graph,  MEDIA_GRAPH_WALK_STREAM_NODES);
+}
+EXPORT_SYMBOL_GPL(media_graph_walk_next_stream);
+
 int media_entity_get_fwnode_pad(struct media_entity *entity,
 				struct fwnode_handle *fwnode,
 				unsigned long direction_flags)
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 8cb2c504a05c..f17a5180ce52 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -927,6 +927,21 @@ void media_graph_walk_start(struct media_graph *graph,
  */
 struct media_entity *media_graph_walk_next(struct media_graph *graph);
 
+/**
+ * media_graph_walk_next_stream - Get the next entity in the graph
+ * @graph: Media graph structure
+ *
+ * Perform a depth-first traversal of the given media entities graph only
+ * following links from sink to source (and not the opposite).
+ *
+ * The graph structure must have been previously initialized with a call to
+ * media_graph_walk_start().
+ *
+ * Return: returns the next entity in the graph in the stream path
+ * or %NULL if the whole stream path have been traversed.
+ */
+struct media_entity *media_graph_walk_next_stream(struct media_graph *graph);
+
 /**
  * media_pipeline_start - Mark a pipeline as streaming
  * @entity: Starting entity
-- 
2.25.0

