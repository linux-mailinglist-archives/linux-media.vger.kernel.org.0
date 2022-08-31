Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3362E5A7FCF
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiHaOQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbiHaOPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2A12656A
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:09 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4E2B1356;
        Wed, 31 Aug 2022 16:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955268;
        bh=rLglX0/8JRpaz/ZyxyN9ahR9nv0rTBn9h9cAOUlm/Cw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UGIrMmioMeLYUZma+z+Y6KqEEpUNVbPwUKuFNZWJmQLG2VFNt2o75mHYvJqjV4SNv
         /R+faL9xYiQU6NU3cyED6BibrOmcG8iszmv7jDTcaTw1PLN71OhI73qEy5yKkOrq7G
         rbhkmgHTfJ0iRS+PHzZnfu4gCZ/90egcZUYFB3fU=
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
Subject: [PATCH v14 15/34] media: mc: entity: Add has_pad_interdep entity operation
Date:   Wed, 31 Aug 2022 17:13:38 +0300
Message-Id: <20220831141357.1396081-16-tomi.valkeinen@ideasonboard.com>
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

Add a new media entity operation, has_pad_interdep. The optional op is
used to discover the pad interdependencies inside an entity during the
pipeline construction.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 10 ++++++++--
 include/media/media-entity.h | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0a5c92b8bbce..831076b36847 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -232,7 +232,10 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * and enabling one of the pads means that the other pad will become "locked"
  * and doesn't allow configuration changes.
  *
- * For the time being all pads are considered interdependent.
+ * This function uses the &media_entity_operations.has_pad_interdep() operation
+ * to check the dependency inside the entity between @pad0 and @pad1. If the
+ * has_pad_interdep operation is not implemented, all pads of the entity are
+ * considered to be interdependent.
  */
 static bool media_entity_has_pad_interdep(struct media_entity *entity,
 					  unsigned int pad0, unsigned int pad1)
@@ -244,7 +247,10 @@ static bool media_entity_has_pad_interdep(struct media_entity *entity,
 	    (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE))
 		return false;
 
-	return true;
+	if (!entity->ops || !entity->ops->has_pad_interdep)
+		return true;
+
+	return entity->ops->has_pad_interdep(entity, pad0, pad1);
 }
 
 static struct media_entity *
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 00990b20b3d5..8e9fd309aa65 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -237,6 +237,14 @@ struct media_pad {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
+ * @has_pad_interdep:	Return whether a two pads inside the entity are
+ *			interdependent. If two pads are interdependent they are
+ *			part of the same pipeline and enabling one of the pads
+ *			means that the other pad will become "locked" and
+ *			doesn't allow configuration changes. pad0 and pad1 are
+ *			guaranteed to not both be sinks or sources.
+ *			Optional: If the operation isn't implemented all pads
+ *			will be considered as interdependent.
  *
  * .. note::
  *
@@ -250,6 +258,8 @@ struct media_entity_operations {
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
 	int (*link_validate)(struct media_link *link);
+	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
+				 unsigned int pad1);
 };
 
 /**
-- 
2.34.1

