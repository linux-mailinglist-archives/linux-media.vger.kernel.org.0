Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828F35A7FC8
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiHaOQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiHaOPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D312BF55
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:14:50 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF6CBBB3;
        Wed, 31 Aug 2022 16:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955261;
        bh=lzhuOec+8OdSsVkeJkH12byfqYUwPQbWPxX1uic4zus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tO7ozSS5LkZG4B6rpxjVCq8+GE+8b2mWr6ZsHLQMaA+pnXBAtjOwQWw5vouBQmA03
         HbgcabBb6GhGGv6RV6v103ipR4fdpLOLnr31e+VeShLlO6ZvAw/VTsmuepzFX0OU0D
         VRDC2gWrqlbu1qzyFkJFB5gApBtpJNRFjTn9ulYM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 07/34] media: mc: entity: Move media_entity_get_fwnode_pad() out of graph walk section
Date:   Wed, 31 Aug 2022 17:13:30 +0300
Message-Id: <20220831141357.1396081-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The media_entity_get_fwnode_pad() function is unrelated to the graph
traversal code that it is currently bundled with. Move it with the
media_entity_remote_pad() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 70 ++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 48d8cc98ae04..c5c66befed0f 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -370,41 +370,6 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
 }
 EXPORT_SYMBOL_GPL(media_graph_walk_next);
 
-int media_entity_get_fwnode_pad(struct media_entity *entity,
-				struct fwnode_handle *fwnode,
-				unsigned long direction_flags)
-{
-	struct fwnode_endpoint endpoint;
-	unsigned int i;
-	int ret;
-
-	if (!entity->ops || !entity->ops->get_fwnode_pad) {
-		for (i = 0; i < entity->num_pads; i++) {
-			if (entity->pads[i].flags & direction_flags)
-				return i;
-		}
-
-		return -ENXIO;
-	}
-
-	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
-	if (ret)
-		return ret;
-
-	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
-	if (ret < 0)
-		return ret;
-
-	if (ret >= entity->num_pads)
-		return -ENXIO;
-
-	if (!(entity->pads[ret].flags & direction_flags))
-		return -ENXIO;
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
-
 /* -----------------------------------------------------------------------------
  * Pipeline management
  */
@@ -994,6 +959,41 @@ struct media_pad *media_pad_remote_pad_unique(const struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_pad_remote_pad_unique);
 
+int media_entity_get_fwnode_pad(struct media_entity *entity,
+				struct fwnode_handle *fwnode,
+				unsigned long direction_flags)
+{
+	struct fwnode_endpoint endpoint;
+	unsigned int i;
+	int ret;
+
+	if (!entity->ops || !entity->ops->get_fwnode_pad) {
+		for (i = 0; i < entity->num_pads; i++) {
+			if (entity->pads[i].flags & direction_flags)
+				return i;
+		}
+
+		return -ENXIO;
+	}
+
+	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
+	if (ret)
+		return ret;
+
+	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
+	if (ret < 0)
+		return ret;
+
+	if (ret >= entity->num_pads)
+		return -ENXIO;
+
+	if (!(entity->pads[ret].flags & direction_flags))
+		return -ENXIO;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
+
 static void media_interface_init(struct media_device *mdev,
 				 struct media_interface *intf,
 				 u32 gobj_type,
-- 
2.34.1

