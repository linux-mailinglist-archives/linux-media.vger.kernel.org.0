Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847E93FB443
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236498AbhH3LDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbhH3LD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:26 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED5CD156A;
        Mon, 30 Aug 2021 13:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321347;
        bh=iIYIEOjyYGKMALl/dDuwMxeOh/aW9HsBxJIVF9D5BsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GpDssssO+MlpGatoSV2U9g0AoajvyGBhe8OTSLu0slTFB0sTaS5G4/OJPEFR+Qn/1
         FZALrPsghpjYU58CUZYJxQEuj1aQQDNNrjug5uNqtViKN8yq4vyX8vEoYLj/wK1dvd
         tJdkQEUYSyhaObi81qFVG9YgJQ6LU9nZWvU4K/1U=
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
Subject: [PATCH v8 19/36] media: entity: Add an iterator helper for connected pads
Date:   Mon, 30 Aug 2021 14:00:59 +0300
Message-Id: <20210830110116.488338-20-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
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
index e963850b32df..072f017b399a 100644
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

