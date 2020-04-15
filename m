Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BBB1A9075
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 03:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392591AbgDOBbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 21:31:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50086 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392569AbgDOBbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 21:31:02 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C18502A1C4B;
        Wed, 15 Apr 2020 02:30:57 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v3 1/4] media: mc-entity.c: add media_graph_walk_next_stream()
Date:   Tue, 14 Apr 2020 22:30:41 -0300
Message-Id: <20200415013044.1778572-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415013044.1778572-1-helen.koike@collabora.com>
References: <20200415013044.1778572-1-helen.koike@collabora.com>
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

Changes in v3:
- Patch re-added in the series from version 1

Changes in v2: None

 drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++++++++++++++---
 include/media/media-entity.h | 15 +++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 211279c5fd77d..0d44c2de23e6f 100644
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
index 8cb2c504a05c7..f17a5180ce524 100644
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
2.26.0

