Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4D81DE15A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEVH4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbgEVH4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:56:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732D7C05BD43
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 00:56:09 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 443A22A3537
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: [PATCH v4 1/5] media: mc-entity.c: add media_graph_walk_next_stream()
Date:   Fri, 22 May 2020 09:55:18 +0200
Message-Id: <20200522075522.6190-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Helen Koike <helen.koike@collabora.com>

Add media_graph_walk_next_stream() function to follow links only from
sink to source (not the opposite) to allow iteration only through the
entities participating in a given stream.

This is useful to allow calling .s_stream() callback only in the
subdevices that requires to be enabled/disabled, and avoid calling this
callback when not required.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Dafna: fixing coding style issues]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++++++++++++++---
 include/media/media-entity.h | 15 +++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 12b45e669bcc..555f9dd9f7f2 100644
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
 
+	if (type == MEDIA_GRAPH_WALK_STREAM_NODES &&
+	    next == link->sink->entity) {
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
+	return __media_graph_walk_next(graph, MEDIA_GRAPH_WALK_STREAM_NODES);
+}
+EXPORT_SYMBOL_GPL(media_graph_walk_next_stream);
+
 int media_entity_get_fwnode_pad(struct media_entity *entity,
 				struct fwnode_handle *fwnode,
 				unsigned long direction_flags)
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cde80ad029b7..9035a36e9442 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -928,6 +928,21 @@ void media_graph_walk_start(struct media_graph *graph,
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
2.17.1

