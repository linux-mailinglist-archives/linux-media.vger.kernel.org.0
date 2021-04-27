Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5812636C650
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhD0MrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbhD0Mq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:46:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1297C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:46:16 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28D851178;
        Tue, 27 Apr 2021 14:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527574;
        bh=iz5L76UA1G3cZIz0MJ/kAESaBFwEyJxf6XZUmB4YpsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qY3B9o3y8uejursis7aXOeRggE3OPdILrcBJBo/+l4DgtWtaz5TYwoQ7plp3IggXO
         2r8dP2xjrDDzi5EUciWllpdXYe0fqUSANY6itAXPxNNHCjeEcmZswkIsbWspNSHGLj
         PD67ESPG0bJ+qbVYVTrgInQQiVejzAdoppQAwHo8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 12/24] media: entity: Add an iterator helper for connected pads
Date:   Tue, 27 Apr 2021 15:45:11 +0300
Message-Id: <20210427124523.990938-13-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 include/media/media-entity.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index f8fa952fa38e..42193d6c58e9 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -916,6 +916,34 @@ __must_check int media_graph_walk_init(
 bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
 			    unsigned int pad1);
 
+static inline struct media_pad *__media_entity_next_routed_pad(
+	struct media_pad *start, struct media_pad *iter)
+{
+	struct media_entity *entity = start->entity;
+
+	for (; iter < &entity->pads[entity->num_pads]; iter++) {
+		if (media_entity_has_route(entity, start->index, iter->index))
+			return iter;
+	}
+
+	return NULL;
+}
+
+/**
+ * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
+ *
+ * @start: The starting pad
+ * @iter: The iterator pad
+ *
+ * Iterate over all pads connected through routes from the @start pad
+ * within an entity. The iteration will include the @start pad itself.
+ */
+#define media_entity_for_each_routed_pad(start, iter)			\
+	for (iter = __media_entity_next_routed_pad(			\
+		     start, (start)->entity->pads);			\
+	     iter != NULL;						\
+	     iter = __media_entity_next_routed_pad(start, iter + 1))
+
 /**
  * media_graph_walk_cleanup - Release resources used by graph walk.
  *
-- 
2.25.1

