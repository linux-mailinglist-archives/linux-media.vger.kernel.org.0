Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C19422173
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhJEJAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbhJEJAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:18 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D546140C;
        Tue,  5 Oct 2021 10:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424307;
        bh=WfNNqbtlD9WLVh/jXPaVCZ6hgKEw1491aKMzPa4gO1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gRI5YMkGdoHr0Chiu+v+zEvZ+SJFJ13OeuBgowGRmP3esDWvVXIbXRU/fr9oVsqu3
         dsLo8iuGjbA7OO68/2CSDGy9xQpRvyvKi0ZKkCTUwm1EYXUZRq0cLpmM6Uc3Hnamu7
         obQoclKTIw5LZdqjeAHZjYjNaf7noHT6NPUg+7QY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v9 15/36] media: entity: Add media_entity_has_route() function
Date:   Tue,  5 Oct 2021 11:57:29 +0300
Message-Id: <20211005085750.138151-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This is a wrapper around the media entity has_route operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 19 +++++++++++++++++++
 include/media/media-entity.h | 17 +++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b44ab423b49b..a83f004efd37 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -229,6 +229,25 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
+bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
+			    unsigned int pad1)
+{
+	if (pad0 >= entity->num_pads || pad1 >= entity->num_pads)
+		return false;
+
+	if (pad0 == pad1)
+		return true;
+
+	if (!entity->ops || !entity->ops->has_route)
+		return true;
+
+	if (entity->pads[pad1].index < entity->pads[pad0].index)
+		swap(pad0, pad1);
+
+	return entity->ops->has_route(entity, pad0, pad1);
+}
+EXPORT_SYMBOL_GPL(media_entity_has_route);
+
 static struct media_pad *
 media_pad_other(struct media_pad *pad, struct media_link *link)
 {
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index ad4020b2df65..b3069eef7fdb 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -904,6 +904,23 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 __must_check int media_graph_walk_init(
 	struct media_graph *graph, struct media_device *mdev);
 
+/**
+ * media_entity_has_route - Check if two entity pads are connected internally
+ *
+ * @entity: The entity
+ * @pad0: The first pad index
+ * @pad1: The second pad index
+ *
+ * This function can be used to check whether two pads of an entity are
+ * connected internally in the entity.
+ *
+ * The caller must hold entity->graph_obj.mdev->mutex.
+ *
+ * Return: true if the pads are connected internally and false otherwise.
+ */
+bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
+			    unsigned int pad1);
+
 /**
  * media_graph_walk_cleanup - Release resources used by graph walk.
  *
-- 
2.25.1

