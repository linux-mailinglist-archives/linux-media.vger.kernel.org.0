Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2AFD4C8FCA
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236028AbiCAQNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbiCAQNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D28A3BBFE
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:41 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2F541010;
        Tue,  1 Mar 2022 17:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151151;
        bh=+s8EAYHLnJ5ql76UV9E7kt1Gc9tT1SYUgbUG41GZFTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V11S6XO1bmoEmEU5V6rJpewCcv3VCDP6+FVcCev8rDdGtZuGwbMc67se5F7sJwEvo
         hKVSiUqsY6sFP06kbXLq2NoZoQEDdp/Kcp70wbiCXZI5Z+sJMFYLM0B5CA7QYH8Sg1
         37Y+aaeNX3TOixOc5EjLCogxY7gI/ZOOm+OJ+U0c=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 12/36] media: entity: Add an iterator helper for connected pads
Date:   Tue,  1 Mar 2022 18:11:32 +0200
Message-Id: <20220301161156.1119557-13-tomi.valkeinen@ideasonboard.com>
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
 include/media/media-entity.h | 27 +++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 6a4e1bbfd961..4e1f4d3cbf6e 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -243,6 +243,20 @@ static bool media_entity_has_route(struct media_entity *entity,
 	return entity->ops->has_route(entity, pad0, pad1);
 }
 
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
index d74acd50361f..b126b3f1c42b 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -904,6 +904,33 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 __must_check int media_graph_walk_init(
 	struct media_graph *graph, struct media_device *mdev);
 
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
+ * media_entity_for_each_routed_pad - Iterate over entity pads connected by
+ *				      routes
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

