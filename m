Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE338E459
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhEXKqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbhEXKqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:05 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E8FC182C;
        Mon, 24 May 2021 12:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853076;
        bh=42iWgqFuvWapOenz3DNYYikBnIU+Hq9VIvpPL35LLsk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U8dgiKx66HXroRVdlXcBKk9wE/5XhoZj5Nrny3zbJRotZTeo08Y0c9U4hUB6T2TyS
         DUvlqGhlDwGbeyJzgkyEC4VIuS/RP768myw3fH6cpkDa/Vsk4zocuySgUQQP9wP+ra
         snfIahk77VqTmLp6vwXc0GTZrZbiHaqeRtjieJnE=
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
Subject: [PATCH v7 12/27] media: entity: Add an iterator helper for connected pads
Date:   Mon, 24 May 2021 13:43:53 +0300
Message-Id: <20210524104408.599645-13-tomi.valkeinen@ideasonboard.com>
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

Add a helper macro for iterating over pads that are connected through
enabled routes. This can be used to find all the connected pads within an
entity, for instance starting from the pad which has been obtained during
the graph walk.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

- Make __media_entity_next_routed_pad() return NULL and adjust the
  iterator to handle that
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 14 ++++++++++++++
 include/media/media-entity.h | 26 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 2ff0ae4c13c1..71dd14dd6c4d 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -248,6 +248,20 @@ bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
 }
 EXPORT_SYMBOL_GPL(media_entity_has_route);
 
+struct media_pad *__media_entity_next_routed_pad(struct media_pad *root,
+						 struct media_pad *iter)
+{
+	struct media_entity *entity = root->entity;
+
+	for (; iter < &entity->pads[entity->num_pads]; iter++) {
+		if (media_entity_has_route(entity, root->index, iter->index))
+			return iter;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__media_entity_next_routed_pad);
+
 /* push an entity to traversal stack */
 static void stack_push(struct media_graph *graph, struct media_pad *pad)
 {
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index b3069eef7fdb..cd1750e495df 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -921,6 +921,32 @@ __must_check int media_graph_walk_init(
 bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
 			    unsigned int pad1);
 
+/**
+ * __media_entity_next_routed_pad - Get next pad connected to @root
+ *
+ * @root: The root pad to which the iterated pads have a route
+ * @iter: The iterator pad
+ *
+ * Get next pad which has a route to @root.
+ */
+struct media_pad *__media_entity_next_routed_pad(struct media_pad *root,
+						 struct media_pad *iter);
+
+/**
+ * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
+ *
+ * @root: The root pad to which the iterated pads have a route
+ * @iter: The iterator pad
+ *
+ * Iterate over all pads of an entity which have an internal route to @root pad.
+ * The iteration will include the @root pad itself.
+ */
+#define media_entity_for_each_routed_pad(root, iter)                           \
+	for (iter = __media_entity_next_routed_pad(root,                       \
+						   (root)->entity->pads);      \
+	     iter != NULL;                                                     \
+	     iter = __media_entity_next_routed_pad(root, iter + 1))
+
 /**
  * media_graph_walk_cleanup - Release resources used by graph walk.
  *
-- 
2.25.1

