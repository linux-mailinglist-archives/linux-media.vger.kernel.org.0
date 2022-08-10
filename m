Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6383D58EBAF
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbiHJMLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiHJMLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103876AA08
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:44 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C78DF8A3;
        Wed, 10 Aug 2022 14:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133500;
        bh=LAIrU9OhUQaPcRtF6RBDZsO+f/XsqK18cD+XVS58LPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c1Jb3Nn2jQUa09xo/Jm5XjCf+vMRfvjBatZuCRoeLEFIgeUq6r0HFXZumjQrjlUEj
         pH6L+CBnNTdpp/9MlDCr9H+GK8USdbgrpj3/sL2OyNFk8+N++SWYldsz0KrtRqVc/X
         foFcwJ9SslK+agSAo93IlhpOwWHqiT2G5lDyG2Po=
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
Subject: [PATCH v13 05/34] media: mc: entity: Add iterator helper for entity pads
Date:   Wed, 10 Aug 2022 15:10:53 +0300
Message-Id: <20220810121122.3149086-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
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
index b8176a3b76d3..25020d58eb06 100644
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
@@ -610,7 +610,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 					      struct media_entity *entity)
 {
 	struct media_entity_notify *notify, *next;
-	unsigned int i;
+	struct media_pad *iter;
 	int ret;
 
 	if (entity->function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN ||
@@ -639,9 +639,8 @@ int __must_check media_device_register_entity(struct media_device *mdev,
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
index d284f616a456..8ffc964b42c6 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -192,7 +192,8 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 			   struct media_pad *pads)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
-	unsigned int i;
+	struct media_pad *iter;
+	unsigned int i = 0;
 
 	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
 		return -E2BIG;
@@ -203,12 +204,12 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
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
+					  &iter->graph_obj);
 	}
 
 	if (mdev)
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 68a8ecb2b397..00f2f0c98e68 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -316,6 +316,18 @@ struct media_entity {
 	} info;
 };
 
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
+
 /**
  * struct media_interface - A media interface graph object.
  *
-- 
2.34.1

