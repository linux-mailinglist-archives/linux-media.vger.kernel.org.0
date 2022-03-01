Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9644C8FC8
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbiCAQNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236016AbiCAQNV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D4913CD4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:39 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B271C2F;
        Tue,  1 Mar 2022 17:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151149;
        bh=5xdwFDQUn9TwvoWm7qXnPZKQqwjjqGTMBfUCGBFCZmE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GuhBKNzX3uI/rFU5ncRUJ6sobjHw/gA+tXoSbwJNQw8oD4w1lr6/ERmFqHpmrUIT9
         GnRHL2Yuo0Glh1+4H4FjfoiunwMNUrj4FzIMZNWtfdE4Lbj/0Nj8ma4eRXANSX1jDg
         Vs0YINfj74dXBK99b6HAQFmqPHC/BPrkDDDdglho=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 10/36] media: entity: Use routing information during graph traversal
Date:   Tue,  1 Mar 2022 18:11:30 +0200
Message-Id: <20220301161156.1119557-11-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Take internal routing information as reported by the entity has_route
operation into account during graph traversal to avoid following
unrelated links.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 1ae9252b1b39..323e44d16f7b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -243,15 +243,6 @@ static bool media_entity_has_route(struct media_entity *entity,
 	return entity->ops->has_route(entity, pad0, pad1);
 }
 
-static struct media_pad *
-media_pad_other(struct media_pad *pad, struct media_link *link)
-{
-	if (link->source == pad)
-		return link->sink;
-	else
-		return link->source;
-}
-
 /* push an entity to traversal stack */
 static void stack_push(struct media_graph *graph, struct media_pad *pad)
 {
@@ -322,7 +313,8 @@ static void media_graph_walk_iter(struct media_graph *graph)
 {
 	struct media_pad *pad = stack_top(graph);
 	struct media_link *link;
-	struct media_pad *next;
+	struct media_pad *remote;
+	struct media_pad *local;
 
 	link = list_entry(link_top(graph), typeof(*link), list);
 
@@ -336,24 +328,42 @@ static void media_graph_walk_iter(struct media_graph *graph)
 		return;
 	}
 
-	/* Get the entity at the other end of the link. */
-	next = media_pad_other(pad, link);
+	/*
+	 * Get the local pad, the remote pad and the entity at the other
+	 * end of the link.
+	 */
+	if (link->source->entity == pad->entity) {
+		remote = link->sink;
+		local = link->source;
+	} else {
+		remote = link->source;
+		local = link->sink;
+	}
+
+	/*
+	 * Are the local pad and the pad we came from connected
+	 * internally in the entity ?
+	 */
+	if (!media_entity_has_route(pad->entity, pad->index, local->index)) {
+		link_top(graph) = link_top(graph)->next;
+		return;
+	}
 
 	/* Has the entity already been visited? */
-	if (media_entity_enum_test_and_set(&graph->ent_enum, next->entity)) {
+	if (media_entity_enum_test_and_set(&graph->ent_enum, remote->entity)) {
 		link_top(graph) = link_top(graph)->next;
 		dev_dbg(pad->graph_obj.mdev->dev,
 			"walk: skipping entity '%s' (already seen)\n",
-			next->entity->name);
+			remote->entity->name);
 		return;
 	}
 
 	/* Push the new entity to stack and start over. */
 	link_top(graph) = link_top(graph)->next;
-	stack_push(graph, next);
-	dev_dbg(next->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
-		next->entity->name, next->index);
-	lockdep_assert_held(&next->graph_obj.mdev->graph_mutex);
+	stack_push(graph, remote);
+	dev_dbg(remote->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
+		remote->entity->name, remote->index);
+	lockdep_assert_held(&remote->graph_obj.mdev->graph_mutex);
 }
 
 struct media_pad *media_graph_walk_next(struct media_graph *graph)
-- 
2.25.1

