Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CED4C8FC3
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236012AbiCAQNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236010AbiCAQNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9A53B281
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:31 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C03911B61;
        Tue,  1 Mar 2022 17:12:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151145;
        bh=mh6+tc5t6JywNcnbIf6ustsC5VQkThjczU/MrEhLTOw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RWG0oWECY47wYGTps1V7ciEdnpO5dTTvb8TNdwEugaRD1A4waS6LsoQEsSSX1bLqi
         Z3iooGvNkAn2n1HNYQsuFDZTugJWN3IZYtPqCg5wrdlPlv0z4lnW9hZZTRwf+swr4e
         5/f7t7C05CRQoAniRVibdR+qHqXV5yjklMkoVM00=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 05/36] media: entity: Add iterator helper for entity pads
Date:   Tue,  1 Mar 2022 18:11:25 +0200
Message-Id: <20220301161156.1119557-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index a1ead81c1b0c..9115c21729f0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -180,7 +180,8 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 			   struct media_pad *pads)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
-	unsigned int i;
+	struct media_pad *iter;
+	unsigned int i = 0;
 
 	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
 		return -E2BIG;
@@ -191,12 +192,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
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
index 802459a5ad0a..ff9f1181991e 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1108,3 +1108,15 @@ void media_remove_intf_links(struct media_interface *intf);
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

