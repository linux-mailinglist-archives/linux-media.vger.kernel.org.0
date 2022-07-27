Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922D858247A
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiG0KhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbiG0KhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17560474E8
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:06 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0090D37;
        Wed, 27 Jul 2022 12:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918221;
        bh=61HrzoINm6i+Fv7lqsU4LS45z/4gL32PdMRhZLX29Ik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=upkuHTjCR07sD5r2hONUP4lcBzBjZ7X7kOYv8nVMCP5Ti5oUf6UIZ5ZfZIvTXjc9w
         /DqC8igy5ogmSmKtKgkBr1MAXkYoLwau8zT6Uv3pcGD++3nlt5XGIAclKa65HsjrWB
         A+0WjG3rY+8p3yGoh0frRrrfReB3RqW2rvw+pWr4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 06/30] media: mc: entity: Add has_route entity operation and media_entity_has_route() helper
Date:   Wed, 27 Jul 2022 13:36:15 +0300
Message-Id: <20220727103639.581567-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The optional operation can be used by entities to report whether a
source pad and a sink pad are internally connected.

media_entity_has_route() is a wrapper around the media entity has_route operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 37 ++++++++++++++++++++++++++++++++++++
 include/media/media-entity.h |  8 ++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 50872d953cf9..4f02f1247762 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -225,6 +225,43 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
+/**
+ * media_entity_has_route - Check if two entity pads are connected internally
+ *
+ * @entity: The entity
+ * @pad0: The first pad index
+ * @pad1: The second pad index
+ *
+ * This function uses the &media_entity_operations.has_route() operation to
+ * check connectivity inside the entity between @pad0 and @pad1.
+ *
+ * One of @pad0 and @pad1 must be a sink pad and the other one a source pad.
+ * The function returns 0 if both pads are sinks or sources.
+ *
+ * If the has_route operation is not implemented, all pads of the entity are
+ * considered as connected.
+ *
+ * The caller must hold entity->graph_obj.mdev->mutex.
+ *
+ * Return: true if the pads are connected internally and false otherwise.
+ */
+__maybe_unused
+static bool media_entity_has_route(struct media_entity *entity,
+				   unsigned int pad0, unsigned int pad1)
+{
+	if (pad0 >= entity->num_pads || pad1 >= entity->num_pads)
+		return false;
+
+	if (entity->pads[pad0].flags & entity->pads[pad1].flags &
+	    (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE))
+		return false;
+
+	if (!entity->ops || !entity->ops->has_route)
+		return true;
+
+	return entity->ops->has_route(entity, pad0, pad1);
+}
+
 static struct media_entity *
 media_entity_other(struct media_entity *entity, struct media_link *link)
 {
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 96f5fcda1985..5764aadd2c42 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -206,6 +206,12 @@ struct media_pad {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
+ * @has_route:		Return whether a route exists inside the entity between
+ *			pad0 and pad1. pad0 and pad1 are guaranteed to not both
+ *			be sinks or sources. Never call the .has_route()
+ *			operation directly, always use media_entity_has_route().
+ *			Optional: If the operation isn't implemented all pads
+ *			will be considered as connected, with the same streams.
  *
  * .. note::
  *
@@ -219,6 +225,8 @@ struct media_entity_operations {
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
 	int (*link_validate)(struct media_link *link);
+	bool (*has_route)(struct media_entity *entity, unsigned int pad0,
+			  unsigned int pad1);
 };
 
 /**
-- 
2.34.1

