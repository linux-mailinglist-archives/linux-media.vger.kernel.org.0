Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F053609FA
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhDONFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbhDONFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:36 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAC2D8BA;
        Thu, 15 Apr 2021 15:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491912;
        bh=2AAtZ2ml6RFif4Ht27D7lf+KNWhvhmoPAIRluM5YfNk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSXDZt/RTFshr8azcX1W1gKrTQTYgMH3Zp4OUxYoPM7ZjZLOxFoY3mZi0oK2R2elV
         VkMsx2AxyGej5K7REJh70YZOFmKXiHiBohnnCOCR4vm0gw3halPFNruliXA5ecVaFF
         VQK0+oLcWNvhf3dEvnf4oJ6DkOgDSjVyvHfJ0yuU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 05/24] media: entity: Add iterator helper for entity pads
Date:   Thu, 15 Apr 2021 16:04:31 +0300
Message-Id: <20210415130450.421168-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add an iterator helper to easily cycle through all pads in an entity and
use it in media-entity and media-device code where appropriate.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/mc/mc-device.c | 13 ++++++-------
 drivers/media/mc/mc-entity.c | 11 ++++++-----
 include/media/media-entity.h | 12 ++++++++++++
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 9e56d2ad6b94..704ef1360eba 100644
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
index 401fddf320e7..830841e0cd28 100644
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
index 2d45344ca527..52b1a1cab57a 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1102,3 +1102,15 @@ void media_remove_intf_links(struct media_interface *intf);
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

