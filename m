Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59D558EBB1
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiHJMLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiHJMLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4EE6AA30
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:46 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2364CDFA;
        Wed, 10 Aug 2022 14:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133501;
        bh=h2CUIhMly2WIDJgZkdMGS+dT5uoImVIRD25wIGes4SM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SEBInS6OKrpMLiLEPa3cfEIsveoi2Il9lAjULrZir39PfIzj4CbeNSa4Gpb6McJFl
         VG6I5Onzxwkxf6BpSYTvSlIXZrS7nq2mdqhvyajvj1Ajb+8ORpuUjXXVULsxsLgOb5
         LscYLbJYn4jSD+rDa8WyRxskUQ3TTAx5EHj8ONPQ=
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
Subject: [PATCH v13 07/34] media: mc: entity: Move media_entity_get_fwnode_pad() out of graph walk section
Date:   Wed, 10 Aug 2022 15:10:55 +0300
Message-Id: <20220810121122.3149086-8-tomi.valkeinen@ideasonboard.com>
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
index d048c3661421..40e302513aa0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -369,41 +369,6 @@ struct media_entity *media_graph_walk_next(struct media_graph *graph)
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
@@ -923,6 +888,41 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_entity_remote_pad);
 
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

