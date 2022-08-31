Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5295A7FCE
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbiHaOQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiHaOPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1FD1274A
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:09 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC5601219;
        Wed, 31 Aug 2022 16:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955267;
        bh=kfbZbiuP7DAwEv1f4YUV8/3V70dxTzU5PRfhzU+XH9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R++h1Y5WVfkRwaMvFxG+mEi5KIHubU8kP83s2ze/7dNupZ5LzmbiQboSPfoq6Bv/c
         lLCHAOejA7ew2DsT6tieOebaJjK/RczHeHzGKzFxkbYt1cQNg8W3B0kGr+9BQOeVIN
         fM37MOwhwwWdoZVo5OCvZjOeRRMNLhEsCAAtxY7Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 14/34] media: mc: entity: Rewrite media_pipeline_start()
Date:   Wed, 31 Aug 2022 17:13:37 +0300
Message-Id: <20220831141357.1396081-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Note: the code is mostly from Laurent but the patch description is from Tomi]

The media_pipeline_start() and media_pipeline_stop() functions use the
media graph walk API to traverse the graph and validate the pipeline.
The graph walk traverses the media graph following links between the
entities.

Also, while the pipeline can't change between the start and stop calls,
the graph is walked again from scratch at stop time, or any time a
driver needs to inspect the pipeline.

With the upcoming multiplexed streams support we will need a bit more
intelligent pipeline construction, as e.g. two independent streams may
be passing through a single entity via separate pads in which case
those pads should not be part of the same pipeline.

This patch essentially rewrites the media_pipeline_start/stop so that
a pipeline is defined as a set of pads instead of entities and the media
graph traversal considers the pad interdependencies when choosing which
links to follow.

Currently all the entity's pads are considered as interdependent. This
means that the behavior with all the current drivers stays the same, but
in the future we can define a more fine-grained pipeline construction.

Additionally the media pipeline's pads are cached at
media_pipeline_start() time, and re-used at media_pipeline_stop() which
avoid the need to re-walk the whole graph as the previous implementation
did.

Also, caching pads in the pipeline can serve in the future as the
foundation to provide a better API than the media graph walk to drivers
to iterate over pads and entities in the pipeline.

Note that the old media_pipeline_start/stop used the media graph walk
API. The new version does not use the media graph walk API, but instead
a new implementation.

There are two reason for not changing the graph walk: it proved to be
rather difficult to change the graph walk to have the features
implemented in this patch, and second, this keeps the backward
compatibility of the graph walk as there are users of the graph walk API

The long term plan is that all the existing code would be converted to
use the new cached pipeline, thus allowing us to remove the graph walk.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst |   7 +-
 drivers/media/mc/mc-entity.c               | 517 ++++++++++++++++++---
 include/media/media-entity.h               |  71 ++-
 3 files changed, 509 insertions(+), 86 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 4bb062d5c2e7..400b8ca29367 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -230,14 +230,13 @@ When starting streaming, drivers must notify all entities in the pipeline to
 prevent link states from being modified during streaming by calling
 :c:func:`media_pipeline_start()`.
 
-The function will mark all entities connected to the given entity through
-enabled links, either directly or indirectly, as streaming.
+The function will mark all the pads which are part of the pipeline as streaming.
 
 The struct media_pipeline instance pointed to by
-the pipe argument will be stored in every entity in the pipeline.
+the pipe argument will be stored in every pad in the pipeline.
 Drivers should embed the struct media_pipeline
 in higher-level pipeline structures and can then access the
-pipeline through the struct media_entity
+pipeline through the struct media_pad
 pipe field.
 
 Calls to :c:func:`media_pipeline_start()` can be nested.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index ad153a426a36..0a5c92b8bbce 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -226,6 +226,27 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
+/*
+ * This function checks the interdependency inside the entity between @pad0
+ * and @pad1. If two pads are interdependent they are part of the same pipeline
+ * and enabling one of the pads means that the other pad will become "locked"
+ * and doesn't allow configuration changes.
+ *
+ * For the time being all pads are considered interdependent.
+ */
+static bool media_entity_has_pad_interdep(struct media_entity *entity,
+					  unsigned int pad0, unsigned int pad1)
+{
+	if (pad0 >= entity->num_pads || pad1 >= entity->num_pads)
+		return false;
+
+	if (entity->pads[pad0].flags & entity->pads[pad1].flags &
+	    (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE))
+		return false;
+
+	return true;
+}
+
 static struct media_entity *
 media_entity_other(struct media_entity *entity, struct media_link *link)
 {
@@ -374,97 +395,436 @@ EXPORT_SYMBOL_GPL(media_graph_walk_next);
  * Pipeline management
  */
 
+/*
+ * The pipeline traversal stack stores pads that are reached during graph
+ * traversal, with a list of links to be visited to continue the traversal.
+ * When a new pad is reached, an entry is pushed on the top of the stack and
+ * points to the incoming pad and the first link of the entity.
+ *
+ * To find further pads in the pipeline, the traversal algorithm follows
+ * internal pad dependencies in the entity, and then links in the graph. It
+ * does so by iterating over all links of the entity, and following enabled
+ * links that originate from a pad that is internally connected to the incoming
+ * pad, as reported by the media_entity_has_pad_interdep() function.
+ */
+
+/**
+ * struct media_pipeline_walk_entry - Entry in the pipeline traversal stack
+ *
+ * @pad: The media pad being visited
+ * @links: Links left to be visited
+ */
+struct media_pipeline_walk_entry {
+	struct media_pad *pad;
+	struct list_head *links;
+};
+
+/**
+ * struct media_pipeline_walk - State used by the media pipeline traversal
+ *				algorithm
+ *
+ * @mdev: The media device
+ * @stack: Depth-first search stack
+ * @stack.size: Number of allocated entries in @stack.entries
+ * @stack.top: Index of the top stack entry (-1 if the stack is empty)
+ * @stack.entries: Stack entries
+ */
+struct media_pipeline_walk {
+	struct media_device *mdev;
+
+	struct {
+		unsigned int size;
+		int top;
+		struct media_pipeline_walk_entry *entries;
+	} stack;
+};
+
+#define MEDIA_PIPELINE_STACK_GROW_STEP		16
+
+static struct media_pipeline_walk_entry *
+media_pipeline_walk_top(struct media_pipeline_walk *walk)
+{
+	return &walk->stack.entries[walk->stack.top];
+}
+
+static bool media_pipeline_walk_empty(struct media_pipeline_walk *walk)
+{
+	return walk->stack.top == -1;
+}
+
+/* Increase the stack size by MEDIA_PIPELINE_STACK_GROW_STEP elements. */
+static int media_pipeline_walk_resize(struct media_pipeline_walk *walk)
+{
+	struct media_pipeline_walk_entry *entries;
+	unsigned int new_size;
+
+	/* Safety check, to avoid stack overflows in case of bugs. */
+	if (walk->stack.size >= 256)
+		return -E2BIG;
+
+	new_size = walk->stack.size + MEDIA_PIPELINE_STACK_GROW_STEP;
+
+	entries = krealloc(walk->stack.entries,
+			   new_size * sizeof(*walk->stack.entries),
+			   GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	walk->stack.entries = entries;
+	walk->stack.size = new_size;
+
+	return 0;
+}
+
+/* Push a new entry on the stack. */
+static int media_pipeline_walk_push(struct media_pipeline_walk *walk,
+				    struct media_pad *pad)
+{
+	struct media_pipeline_walk_entry *entry;
+	int ret;
+
+	if (walk->stack.top + 1 >= walk->stack.size) {
+		ret = media_pipeline_walk_resize(walk);
+		if (ret)
+			return ret;
+	}
+
+	walk->stack.top++;
+	entry = media_pipeline_walk_top(walk);
+	entry->pad = pad;
+	entry->links = pad->entity->links.next;
+
+	dev_dbg(walk->mdev->dev,
+		"media pipeline: pushed entry %u: '%s':%u\n",
+		walk->stack.top, pad->entity->name, pad->index);
+
+	return 0;
+}
+
+/*
+ * Move the top entry link cursor to the next link. If all links of the entry
+ * have been visited, pop the entry itself.
+ */
+static void media_pipeline_walk_pop(struct media_pipeline_walk *walk)
+{
+	struct media_pipeline_walk_entry *entry;
+
+	if (WARN_ON(walk->stack.top < 0))
+		return;
+
+	entry = media_pipeline_walk_top(walk);
+
+	if (entry->links->next == &entry->pad->entity->links) {
+		dev_dbg(walk->mdev->dev,
+			"media pipeline: entry %u has no more links, popping\n",
+			walk->stack.top);
+
+		walk->stack.top--;
+		return;
+	}
+
+	entry->links = entry->links->next;
+
+	dev_dbg(walk->mdev->dev,
+		"media pipeline: moved entry %u to next link\n",
+		walk->stack.top);
+}
+
+/* Free all memory allocated while walking the pipeline. */
+static void media_pipeline_walk_destroy(struct media_pipeline_walk *walk)
+{
+	kfree(walk->stack.entries);
+}
+
+/* Add a pad to the pipeline and push it to the stack. */
+static int media_pipeline_add_pad(struct media_pipeline *pipe,
+				  struct media_pipeline_walk *walk,
+				  struct media_pad *pad)
+{
+	struct media_pipeline_pad *ppad;
+
+	list_for_each_entry(ppad, &pipe->pads, list) {
+		if (ppad->pad == pad) {
+			dev_dbg(pad->graph_obj.mdev->dev,
+				"media pipeline: already contains pad '%s':%u\n",
+				pad->entity->name, pad->index);
+			return 0;
+		}
+	}
+
+	ppad = kzalloc(sizeof(*ppad), GFP_KERNEL);
+	if (!ppad)
+		return -ENOMEM;
+
+	ppad->pipe = pipe;
+	ppad->pad = pad;
+
+	list_add_tail(&ppad->list, &pipe->pads);
+
+	dev_dbg(pad->graph_obj.mdev->dev,
+		"media pipeline: added pad '%s':%u\n",
+		pad->entity->name, pad->index);
+
+	return media_pipeline_walk_push(walk, pad);
+}
+
+/* Explore the next link of the entity at the top of the stack. */
+static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
+					    struct media_pipeline_walk *walk)
+{
+	struct media_pipeline_walk_entry *entry = media_pipeline_walk_top(walk);
+	struct media_pad *pad;
+	struct media_link *link;
+	struct media_pad *local;
+	struct media_pad *remote;
+	int ret;
+
+	pad = entry->pad;
+	link = list_entry(entry->links, typeof(*link), list);
+	media_pipeline_walk_pop(walk);
+
+	dev_dbg(walk->mdev->dev,
+		"media pipeline: exploring link '%s':%u -> '%s':%u\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	/* Skip links that are not enabled. */
+	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
+		dev_dbg(walk->mdev->dev,
+			"media pipeline: skipping link (disabled)\n");
+		return 0;
+	}
+
+	/* Get the local pad and remote pad. */
+	if (link->source->entity == pad->entity) {
+		local = link->source;
+		remote = link->sink;
+	} else {
+		local = link->sink;
+		remote = link->source;
+	}
+
+	/*
+	 * Skip links that originate from a different pad than the incoming pad
+	 * that is not connected internally in the entity to the incoming pad.
+	 */
+	if (pad != local &&
+	    !media_entity_has_pad_interdep(pad->entity, pad->index, local->index)) {
+		dev_dbg(walk->mdev->dev,
+			"media pipeline: skipping link (no route)\n");
+		return 0;
+	}
+
+	/*
+	 * Add the local and remote pads of the link to the pipeline and push
+	 * them to the stack, if they're not already present.
+	 */
+	ret = media_pipeline_add_pad(pipe, walk, local);
+	if (ret)
+		return ret;
+
+	ret = media_pipeline_add_pad(pipe, walk, remote);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void media_pipeline_cleanup(struct media_pipeline *pipe)
+{
+	while (!list_empty(&pipe->pads)) {
+		struct media_pipeline_pad *ppad;
+
+		ppad = list_first_entry(&pipe->pads, typeof(*ppad), list);
+		list_del(&ppad->list);
+		kfree(ppad);
+	}
+}
+
+static int media_pipeline_populate(struct media_pipeline *pipe,
+				   struct media_pad *pad)
+{
+	struct media_pipeline_walk walk = { };
+	struct media_pipeline_pad *ppad;
+	int ret;
+
+	/*
+	 * Populate the media pipeline by walking the media graph, starting
+	 * from @pad.
+	 */
+	INIT_LIST_HEAD(&pipe->pads);
+	pipe->mdev = pad->graph_obj.mdev;
+
+	walk.mdev = pipe->mdev;
+	walk.stack.top = -1;
+	ret = media_pipeline_add_pad(pipe, &walk, pad);
+	if (ret)
+		goto done;
+
+	/*
+	 * Use a depth-first search algorithm: as long as the stack is not
+	 * empty, explore the next link of the top entry. The
+	 * media_pipeline_explore_next_link() function will either move to the
+	 * next link, pop the entry if fully visited, or add new entries on
+	 * top.
+	 */
+	while (!media_pipeline_walk_empty(&walk)) {
+		ret = media_pipeline_explore_next_link(pipe, &walk);
+		if (ret)
+			goto done;
+	}
+
+	dev_dbg(pad->graph_obj.mdev->dev,
+		"media pipeline populated, found pads:\n");
+
+	list_for_each_entry(ppad, &pipe->pads, list)
+		dev_dbg(pad->graph_obj.mdev->dev, "- '%s':%u\n",
+			ppad->pad->entity->name, ppad->pad->index);
+
+	WARN_ON(walk.stack.top != -1);
+
+	ret = 0;
+
+done:
+	media_pipeline_walk_destroy(&walk);
+
+	if (ret)
+		media_pipeline_cleanup(pipe);
+
+	return ret;
+}
+
 __must_check int __media_pipeline_start(struct media_entity *entity,
 					struct media_pipeline *pipe)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
-	struct media_graph *graph = &pipe->graph;
-	struct media_entity *entity_err = entity;
-	struct media_link *link;
+	struct media_pipeline_pad *err_ppad;
+	struct media_pipeline_pad *ppad;
 	int ret;
 
+	lockdep_assert_held(&mdev->graph_mutex);
+
+	/*
+	 * media_pipeline_start(entity) only makes sense with entities that have
+	 * a single pad.
+	 */
+
+	if (WARN_ON(entity->num_pads != 1))
+		return -EINVAL;
+
+	/*
+	 * If the entity is already part of a pipeline, that pipeline must
+	 * be the same as the pipe given to media_pipeline_start().
+	 */
+	if (WARN_ON(entity->pads->pipe && entity->pads->pipe != pipe))
+		return -EINVAL;
+
+	/*
+	 * If the pipeline has already been started, it is guaranteed to be
+	 * valid, so just increase the start count.
+	 */
 	if (pipe->start_count) {
 		pipe->start_count++;
 		return 0;
 	}
 
-	ret = media_graph_walk_init(&pipe->graph, mdev);
+	/*
+	 * Populate the pipeline. This populates the media_pipeline pads list
+	 * with media_pipeline_pad instances for each pad found during graph
+	 * walk.
+	 */
+	ret = media_pipeline_populate(pipe, entity->pads);
 	if (ret)
 		return ret;
 
-	media_graph_walk_start(&pipe->graph, entity);
+	/*
+	 * Now that all the pads in the pipeline have been gathered, perform
+	 * the validation steps.
+	 */
+
+	list_for_each_entry(ppad, &pipe->pads, list) {
+		struct media_pad *pad = ppad->pad;
+		struct media_entity *entity = pad->entity;
+		bool has_enabled_link = false;
+		bool has_link = false;
+		struct media_link *link;
 
-	while ((entity = media_graph_walk_next(graph))) {
-		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
-		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
+		dev_dbg(mdev->dev, "Validating pad '%s':%u\n", pad->entity->name,
+			pad->index);
 
-		if (entity->pipe && entity->pipe != pipe) {
-			pr_err("Pipe active for %s. Can't start for %s\n",
-				entity->name,
-				entity_err->name);
+		/*
+		 * 1. Ensure that the pad doesn't already belong to a different
+		 * pipeline.
+		 */
+		if (pad->pipe) {
+			dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
+				pad->entity->name, pad->index);
 			ret = -EBUSY;
 			goto error;
 		}
 
-		/* Already streaming --- no need to check. */
-		if (entity->pipe)
-			continue;
-
-		entity->pipe = pipe;
-
-		if (!entity->ops || !entity->ops->link_validate)
-			continue;
-
-		bitmap_zero(active, entity->num_pads);
-		bitmap_fill(has_no_links, entity->num_pads);
-
+		/*
+		 * 2. Validate all active links whose sink is the current pad.
+		 * Validation of the source pads is performed in the context of
+		 * the connected sink pad to avoid duplicating checks.
+		 */
 		for_each_media_entity_data_link(entity, link) {
-			struct media_pad *pad = link->sink->entity == entity
-						? link->sink : link->source;
+			/* Skip links unrelated to the current pad. */
+			if (link->sink != pad && link->source != pad)
+				continue;
 
-			/* Mark that a pad is connected by a link. */
-			bitmap_clear(has_no_links, pad->index, 1);
+			/* Record if the pad has links and enabled links. */
+			if (link->flags & MEDIA_LNK_FL_ENABLED)
+				has_enabled_link = true;
+			has_link = true;
 
 			/*
-			 * Pads that either do not need to connect or
-			 * are connected through an enabled link are
-			 * fine.
+			 * Validate the link if it's enabled and has the
+			 * current pad as its sink.
 			 */
-			if (!(pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
-			    link->flags & MEDIA_LNK_FL_ENABLED)
-				bitmap_set(active, pad->index, 1);
+			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+				continue;
 
-			/*
-			 * Link validation will only take place for
-			 * sink ends of the link that are enabled.
-			 */
-			if (link->sink != pad ||
-			    !(link->flags & MEDIA_LNK_FL_ENABLED))
+			if (link->sink != pad)
+				continue;
+
+			if (!entity->ops || !entity->ops->link_validate)
 				continue;
 
 			ret = entity->ops->link_validate(link);
-			if (ret < 0 && ret != -ENOIOCTLCMD) {
-				dev_dbg(entity->graph_obj.mdev->dev,
-					"link validation failed for '%s':%u -> '%s':%u, error %d\n",
+			if (ret) {
+				dev_dbg(mdev->dev,
+					"Link '%s':%u -> '%s':%u failed validation: %d\n",
 					link->source->entity->name,
 					link->source->index,
-					entity->name, link->sink->index, ret);
+					link->sink->entity->name,
+					link->sink->index, ret);
 				goto error;
 			}
-		}
 
-		/* Either no links or validated links are fine. */
-		bitmap_or(active, active, has_no_links, entity->num_pads);
+			dev_dbg(mdev->dev,
+				"Link '%s':%u -> '%s':%u is valid\n",
+				link->source->entity->name,
+				link->source->index,
+				link->sink->entity->name,
+				link->sink->index);
+		}
 
-		if (!bitmap_full(active, entity->num_pads)) {
+		/*
+		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
+		 * ensure that it has either no link or an enabled link.
+		 */
+		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) && has_link &&
+		    !has_enabled_link) {
+			dev_dbg(mdev->dev,
+				"Pad '%s':%u must be connected by an enabled link\n",
+				pad->entity->name, pad->index);
 			ret = -ENOLINK;
-			dev_dbg(entity->graph_obj.mdev->dev,
-				"'%s':%u must be connected by an enabled link\n",
-				entity->name,
-				(unsigned)find_first_zero_bit(
-					active, entity->num_pads));
 			goto error;
 		}
+
+		/* Validation passed, store the pipe pointer in the pad. */
+		pad->pipe = pipe;
 	}
 
 	pipe->start_count++;
@@ -476,20 +836,15 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 	 * Link validation on graph failed. We revert what we did and
 	 * return the error.
 	 */
-	media_graph_walk_start(graph, entity_err);
-
-	while ((entity_err = media_graph_walk_next(graph))) {
-		entity_err->pipe = NULL;
 
-		/*
-		 * We haven't started entities further than this so we quit
-		 * here.
-		 */
-		if (entity_err == entity)
+	list_for_each_entry(err_ppad, &pipe->pads, list) {
+		if (err_ppad == ppad)
 			break;
+
+		err_ppad->pad->pipe = NULL;
 	}
 
-	media_graph_walk_cleanup(graph);
+	media_pipeline_cleanup(pipe);
 
 	return ret;
 }
@@ -510,8 +865,8 @@ EXPORT_SYMBOL_GPL(media_pipeline_start);
 
 void __media_pipeline_stop(struct media_entity *entity)
 {
-	struct media_graph *graph = &entity->pipe->graph;
-	struct media_pipeline *pipe = entity->pipe;
+	struct media_pipeline *pipe = entity->pads->pipe;
+	struct media_pipeline_pad *ppad;
 
 	/*
 	 * If the following check fails, the driver has performed an
@@ -523,12 +878,10 @@ void __media_pipeline_stop(struct media_entity *entity)
 	if (--pipe->start_count)
 		return;
 
-	media_graph_walk_start(graph, entity);
+	list_for_each_entry(ppad, &pipe->pads, list)
+		ppad->pad->pipe = NULL;
 
-	while ((entity = media_graph_walk_next(graph)))
-		entity->pipe = NULL;
-
-	media_graph_walk_cleanup(graph);
+	media_pipeline_cleanup(pipe);
 
 	if (pipe->allocated)
 		kfree(pipe);
@@ -835,7 +1188,7 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 {
 	const u32 mask = MEDIA_LNK_FL_ENABLED;
 	struct media_device *mdev;
-	struct media_entity *source, *sink;
+	struct media_pad *source, *sink;
 	int ret = -EBUSY;
 
 	if (link == NULL)
@@ -851,12 +1204,11 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	if (link->flags == flags)
 		return 0;
 
-	source = link->source->entity;
-	sink = link->sink->entity;
+	source = link->source;
+	sink = link->sink;
 
 	if (!(link->flags & MEDIA_LNK_FL_DYNAMIC) &&
-	    (media_entity_is_streaming(source) ||
-	     media_entity_is_streaming(sink)))
+	    (media_pad_is_streaming(source) || media_pad_is_streaming(sink)))
 		return -EBUSY;
 
 	mdev = source->graph_obj.mdev;
@@ -1034,10 +1386,23 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
 
 struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
 {
-	return entity->pipe;
+	struct media_pad *pad;
+
+	media_entity_for_each_pad(entity, pad) {
+		if (pad->pipe)
+			return pad->pipe;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(media_entity_pipeline);
 
+struct media_pipeline *media_pad_pipeline(struct media_pad *pad)
+{
+	return pad->pipe;
+}
+EXPORT_SYMBOL_GPL(media_pad_pipeline);
+
 static void media_interface_init(struct media_device *mdev,
 				 struct media_interface *intf,
 				 u32 gobj_type,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index a77933afaa48..00990b20b3d5 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -101,13 +101,33 @@ struct media_graph {
  * struct media_pipeline - Media pipeline related information
  *
  * @allocated:		Media pipeline allocated and freed by the framework
+ * @mdev:		The media device the pipeline is part of
+ * @pads:		List of media_pipeline_pad
  * @start_count:	Media pipeline start - stop count
- * @graph:		Media graph walk during pipeline start / stop
  */
 struct media_pipeline {
 	bool allocated;
+	struct media_device *mdev;
+	struct list_head pads;
 	int start_count;
-	struct media_graph graph;
+};
+
+/**
+ * struct media_pipeline_pad - A pad part of a media pipeline
+ *
+ * @list:		Entry in the media_pad pads list
+ * @pipe:		The media_pipeline that the pad is part of
+ * @pad:		The media pad
+ *
+ * This structure associate a pad with a media pipeline. Instances of
+ * media_pipeline_pad are created by media_pipeline_start() when it builds the
+ * pipeline, and stored in the &media_pad.pads list. media_pipeline_stop()
+ * removes the entries from the list and deletes them.
+ */
+struct media_pipeline_pad {
+	struct list_head list;
+	struct media_pipeline *pipe;
+	struct media_pad *pad;
 };
 
 /**
@@ -189,6 +209,8 @@ enum media_pad_signal_type {
  * @flags:	Pad flags, as defined in
  *		:ref:`include/uapi/linux/media.h <media_header>`
  *		(seek for ``MEDIA_PAD_FL_*``)
+ * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
+ *		access this field.
  */
 struct media_pad {
 	struct media_gobj graph_obj;	/* must be first field in struct */
@@ -196,6 +218,12 @@ struct media_pad {
 	u16 index;
 	enum media_pad_signal_type sig_type;
 	unsigned long flags;
+
+	/*
+	 * The fields below are private, and should only be accessed via
+	 * appropriate functions.
+	 */
+	struct media_pipeline *pipe;
 };
 
 /**
@@ -272,7 +300,6 @@ enum media_entity_type {
  * @links:	List of data links.
  * @ops:	Entity operations.
  * @use_count:	Use count for the entity.
- * @pipe:	Pipeline this entity belongs to.
  * @info:	Union with devnode information.  Kept just for backward
  *		compatibility.
  * @info.dev:	Contains device major and minor info.
@@ -308,8 +335,6 @@ struct media_entity {
 
 	int use_count;
 
-	struct media_pipeline *pipe;
-
 	union {
 		struct {
 			u32 major;
@@ -938,6 +963,18 @@ media_entity_remote_source_pad_unique(const struct media_entity *entity)
 	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
 }
 
+/**
+ * media_pad_is_streaming - Test if a pad is part of a streaming pipeline
+ * @pad: The pad
+ *
+ * Return: True if the pad is part of a pipeline started with the
+ * media_pipeline_start() function, false otherwise.
+ */
+static inline bool media_pad_is_streaming(const struct media_pad *pad)
+{
+	return pad->pipe;
+}
+
 /**
  * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
  * @entity: The entity
@@ -947,13 +984,22 @@ media_entity_remote_source_pad_unique(const struct media_entity *entity)
  */
 static inline bool media_entity_is_streaming(const struct media_entity *entity)
 {
-	return entity->pipe;
+	struct media_pad *pad;
+
+	media_entity_for_each_pad(entity, pad) {
+		if (media_pad_is_streaming(pad))
+			return true;
+	}
+
+	return false;
 }
 
 /**
  * media_entity_pipeline - Get the media pipeline an entity is part of
  * @entity: The entity
  *
+ * DEPRECATED: use media_pad_pipeline() instead.
+ *
  * This function returns the media pipeline that an entity has been associated
  * with when constructing the pipeline with media_pipeline_start(). The pointer
  * remains valid until media_pipeline_stop() is called.
@@ -968,6 +1014,19 @@ static inline bool media_entity_is_streaming(const struct media_entity *entity)
  */
 struct media_pipeline *media_entity_pipeline(struct media_entity *entity);
 
+/**
+ * media_pad_pipeline - Get the media pipeline a pad is part of
+ * @pad: The pad
+ *
+ * This function returns the media pipeline that a pad has been associated
+ * with when constructing the pipeline with media_pipeline_start(). The pointer
+ * remains valid until media_pipeline_stop() is called.
+ *
+ * Return: The media_pipeline the pad is part of, or NULL if the pad is
+ * not part of any pipeline.
+ */
+struct media_pipeline *media_pad_pipeline(struct media_pad *pad);
+
 /**
  * media_entity_get_fwnode_pad - Get pad number from fwnode
  *
-- 
2.34.1

