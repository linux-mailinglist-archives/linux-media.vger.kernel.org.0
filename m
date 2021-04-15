Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BECF3609FF
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhDONFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbhDONFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:41 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB1638DF;
        Thu, 15 Apr 2021 15:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491917;
        bh=3Ig6m+iot6xp4e06LuSygbsiLiWGmcvYUeHxIH3mNGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QTre8x4iEWBJ9pr3oN1FdNthDbapNjZ5UnQU8y037JD5f9ovnFMDwBEGXewHrGGFS
         ye8OsTzu7tsXR9irRYs95YJP2xOZj+xAarJUen++9w1SaYucIOHp09GEb5D2E0+Tpd
         /YakgSipoHyVjFu/YcnDL6waps8/wO0dwYd+NlxE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v5 10/24] media: entity: Use routing information during graph traversal
Date:   Thu, 15 Apr 2021 16:04:36 +0300
Message-Id: <20210415130450.421168-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
---
 drivers/media/mc/mc-entity.c | 44 ++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 9a3587f25894..28d7fd254c77 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -248,15 +248,6 @@ bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
 }
 EXPORT_SYMBOL_GPL(media_entity_has_route);
 
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
@@ -327,7 +318,8 @@ static void media_graph_walk_iter(struct media_graph *graph)
 {
 	struct media_pad *pad = stack_top(graph);
 	struct media_link *link;
-	struct media_pad *next;
+	struct media_pad *remote;
+	struct media_pad *local;
 
 	link = list_entry(link_top(graph), typeof(*link), list);
 
@@ -341,23 +333,41 @@ static void media_graph_walk_iter(struct media_graph *graph)
 		return;
 	}
 
-	/* Get the entity in the other end of the link . */
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
+	stack_push(graph, remote);
+	dev_dbg(remote->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
+		remote->entity->name, remote->index);
 }
 
 struct media_pad *media_graph_walk_next(struct media_graph *graph)
-- 
2.25.1

