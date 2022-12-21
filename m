Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A333D652E9C
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 10:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbiLUJdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 04:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbiLUJdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 04:33:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3419621891
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 01:33:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC4E4B2;
        Wed, 21 Dec 2022 10:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671615228;
        bh=9p+RZm40ivvLdT38EO5ZrAuS6ao61QhItww4lwP84jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f6HxlO1IkY9h3g2pQn/cg7QC3mAoErVykxFNAb3qY25ti/hzyFoGfkYZHon9vApZI
         QoJnTxVdOyzgUPGLiCXOT9Cpsv81IzH6b2iqgHRS0Ci/VzzVuiOWcMADUolETYaf2B
         4kvqjbIOckamgTeE7PtBoo/x0g6PlKyN6mOzaCP8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 2/5] media: mc: entity: Add entity iterator for media_pipeline
Date:   Wed, 21 Dec 2022 11:33:38 +0200
Message-Id: <20221221093341.7580-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221221093341.7580-1-laurent.pinchart@ideasonboard.com>
References: <20221221093341.7580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a media_pipeline_for_each_entity() macro to iterate over entities in
a pipeline. This should be used by driver as a replacement of the
media_graph_walk API, as iterating over the media_pipeline uses the
cached list of pads and is thus more efficient.

Deprecate the media_graph_walk API to indicate it shouldn't be used in
new drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix media entity enum test in __media_pipeline_entity_iter_next()
---
 drivers/media/mc/mc-entity.c | 37 +++++++++++++++++++
 include/media/media-entity.h | 69 ++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 70df2050951c..380144d7f84d 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -950,6 +950,43 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_pad_iter_next);
 
+int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
+				    struct media_pipeline_entity_iter *iter)
+{
+	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
+
+void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
+{
+	media_entity_enum_cleanup(&iter->ent_enum);
+}
+EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
+
+struct media_entity *
+__media_pipeline_entity_iter_next(struct media_pipeline *pipe,
+				  struct media_pipeline_entity_iter *iter,
+				  struct media_entity *entity)
+{
+	if (!entity)
+		iter->cursor = pipe->pads.next;
+
+	while (iter->cursor != &pipe->pads) {
+		struct media_pipeline_pad *ppad;
+		struct media_entity *entity;
+
+		ppad = list_entry(iter->cursor, struct media_pipeline_pad, list);
+		entity = ppad->pad->entity;
+		iter->cursor = iter->cursor->next;
+
+		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
+			return entity;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index e881e483b550..1b820cb6fed1 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -139,6 +139,17 @@ struct media_pipeline_pad_iter {
 	struct list_head *cursor;
 };
 
+/**
+ * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
+ *
+ * @ent_enum: The entity enumeration tracker
+ * @cursor: The current element
+ */
+struct media_pipeline_entity_iter {
+	struct media_entity_enum ent_enum;
+	struct list_head *cursor;
+};
+
 /**
  * struct media_link - A link object part of a media graph.
  *
@@ -1075,6 +1086,8 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
  * @graph: Media graph structure that will be used to walk the graph
  * @mdev: Pointer to the &media_device that contains the object
  *
+ * This function is deprecated, use media_pipeline_for_each_pad() instead.
+ *
  * The caller is required to hold the media_device graph_mutex during the graph
  * walk until the graph state is released.
  *
@@ -1087,6 +1100,8 @@ __must_check int media_graph_walk_init(
  * media_graph_walk_cleanup - Release resources used by graph walk.
  *
  * @graph: Media graph structure that will be used to walk the graph
+ *
+ * This function is deprecated, use media_pipeline_for_each_pad() instead.
  */
 void media_graph_walk_cleanup(struct media_graph *graph);
 
@@ -1097,6 +1112,8 @@ void media_graph_walk_cleanup(struct media_graph *graph);
  * @graph: Media graph structure that will be used to walk the graph
  * @entity: Starting entity
  *
+ * This function is deprecated, use media_pipeline_for_each_pad() instead.
+ *
  * Before using this function, media_graph_walk_init() must be
  * used to allocate resources used for walking the graph. This
  * function initializes the graph traversal structure to walk the
@@ -1112,6 +1129,8 @@ void media_graph_walk_start(struct media_graph *graph,
  * media_graph_walk_next - Get the next entity in the graph
  * @graph: Media graph structure
  *
+ * This function is deprecated, use media_pipeline_for_each_pad() instead.
+ *
  * Perform a depth-first traversal of the given media entities graph.
  *
  * The graph structure must have been previously initialized with a call to
@@ -1192,6 +1211,56 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 	     pad != NULL;						\
 	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
 
+/**
+ * media_pipeline_entity_iter_init - Initialize a pipeline entity iterator
+ * @pipe: The pipeline
+ * @iter: The iterator
+ *
+ * This function must be called to initialize the iterator before using it in a
+ * media_pipeline_for_each_entity() loop. The iterator must be destroyed by a
+ * call to media_pipeline_entity_iter_cleanup after the loop (including in code
+ * paths that break from the loop).
+ *
+ * The same iterator can be used in multiple consecutive loops without being
+ * destroyed and reinitialized.
+ *
+ * Return: 0 on success or a negative error code otherwise.
+ */
+int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
+				    struct media_pipeline_entity_iter *iter);
+
+/**
+ * media_pipeline_entity_iter_cleanup - Destroy a pipeline entity iterator
+ * @iter: The iterator
+ *
+ * This function must be called to destroy iterators initialized with
+ * media_pipeline_entity_iter_init().
+ */
+void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter);
+
+struct media_entity *
+__media_pipeline_entity_iter_next(struct media_pipeline *pipe,
+				  struct media_pipeline_entity_iter *iter,
+				  struct media_entity *entity);
+
+/**
+ * media_pipeline_for_each_entity - Iterate on all entities in a media pipeline
+ * @pipe: The pipeline
+ * @iter: The iterator (struct media_pipeline_entity_iter)
+ * @entity: The iterator entity
+ *
+ * Iterate on all entities in a media pipeline. This is only valid after the
+ * pipeline has been built with media_pipeline_start() and before it gets
+ * destroyed with media_pipeline_stop(). The iterator must be initialized with
+ * media_pipeline_entity_iter_init() before iteration, and destroyed with
+ * media_pipeline_entity_iter_cleanup() after (including in code paths that
+ * break from the loop).
+ */
+#define media_pipeline_for_each_entity(pipe, iter, entity)			\
+	for (entity = __media_pipeline_entity_iter_next((pipe), iter, NULL);	\
+	     entity != NULL;							\
+	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
+
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming
  * @pad: Starting pad
-- 
Regards,

Laurent Pinchart

