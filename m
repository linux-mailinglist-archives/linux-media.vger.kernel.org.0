Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A203FB43C
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbhH3LDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbhH3LDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:22 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E05AB9C;
        Mon, 30 Aug 2021 13:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321341;
        bh=61dap9zqutL5mt0qTjlPX+iadUGRqz29iP2NJxjjFAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K5K3VZiiJs2jFcUEPE+pYekc4a0WigaY5a0WElCdmHZ3BvUKGd3jj6kJd2tYuwbH1
         HS77KSgR0q5L4iHFt86sZedISLuFbB4ibAXo2QAWap5TKVBpG4KIIvplCHTnJzW13Q
         F2C2EUgaLzUou3DgzGrBSOfGXa0oXFbqKyIjMrvw=
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
Subject: [PATCH v8 12/36] media: entity: Add iterator helper for entity pads
Date:   Mon, 30 Aug 2021 14:00:52 +0300
Message-Id: <20210830110116.488338-13-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add an iterator helper to easily cycle through all pads in an entity and
use it in media-entity and media-device code where appropriate.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 13 ++++++-------
 drivers/media/mc/mc-entity.c | 11 ++++++-----
 include/media/media-entity.h | 12 ++++++++++++
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index cf5e459b1d96..cb569beab99e 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -581,7 +581,7 @@ static void __media_device_unregister_entity(struct media_entity *entity)
 	struct media_device *mdev = entity->graph_obj.mdev;
 	struct media_link *link, *tmp;
 	struct media_interface *intf;
-	unsigned int i;
+	struct media_pad *iter;
 
 	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
 
@@ -597,8 +597,8 @@ static void __media_device_unregister_entity(struct media_entity *entity)
 	__media_entity_remove_links(entity);
 
 	/* Remove all pads that belong to this entity */
-	for (i = 0; i < entity->num_pads; i++)
-		media_gobj_destroy(&entity->pads[i].graph_obj);
+	media_entity_for_each_pad(entity, iter)
+		media_gobj_destroy(&iter->graph_obj);
 
 	/* Remove the entity */
 	media_gobj_destroy(&entity->graph_obj);
@@ -617,7 +617,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 					      struct media_entity *entity)
 {
 	struct media_entity_notify *notify, *next;
-	unsigned int i;
+	struct media_pad *iter;
 	int ret;
 
 	if (entity->function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN ||
@@ -646,9 +646,8 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 	media_gobj_create(mdev, MEDIA_GRAPH_ENTITY, &entity->graph_obj);
 
 	/* Initialize objects at the pads */
-	for (i = 0; i < entity->num_pads; i++)
-		media_gobj_create(mdev, MEDIA_GRAPH_PAD,
-			       &entity->pads[i].graph_obj);
+	media_entity_for_each_pad(entity, iter)
+		media_gobj_create(mdev, MEDIA_GRAPH_PAD, &iter->graph_obj);
 
 	/* invoke entity_notify callbacks */
 	list_for_each_entry_safe(notify, next, &mdev->entity_notify, list)
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 06147f38ce2e..2b438c481812 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -198,7 +198,8 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 			   struct media_pad *pads)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
-	unsigned int i;
+	struct media_pad *iter;
+	unsigned int i = 0;
 
 	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
 		return -E2BIG;
@@ -209,12 +210,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	if (mdev)
 		mutex_lock(&mdev->graph_mutex);
 
-	for (i = 0; i < num_pads; i++) {
-		pads[i].entity = entity;
-		pads[i].index = i;
+	media_entity_for_each_pad(entity, iter) {
+		iter->entity = entity;
+		iter->index = i++;
 		if (mdev)
 			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
-					&entity->pads[i].graph_obj);
+					&iter->graph_obj);
 	}
 
 	if (mdev)
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 926fd201eae3..5f6eed24e63f 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1107,3 +1107,15 @@ void media_remove_intf_links(struct media_interface *intf);
 	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
 
 #endif
+
+/**
+ * media_entity_for_each_pad - Iterate on all pads in an entity
+ * @entity: The entity the pads belong to
+ * @iter: The iterator pad
+ *
+ * Iterate on all pads in a media entity.
+ */
+#define media_entity_for_each_pad(entity, iter)			\
+	for (iter = (entity)->pads;				\
+	     iter < &(entity)->pads[(entity)->num_pads];	\
+	     ++iter)
-- 
2.25.1

