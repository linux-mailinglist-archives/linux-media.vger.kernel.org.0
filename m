Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8A364AA13
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 23:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbiLLWR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 17:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiLLWRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 17:17:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53C81706B
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 14:17:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60D1C6CF;
        Mon, 12 Dec 2022 23:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670883442;
        bh=H4LTNCrpavcWbIFuxWDeXh0hqlrmWCNbZddmcI86LZ0=;
        h=From:To:Cc:Subject:Date:From;
        b=BGu/aJiJz01q0AIzGWfB1m2f/eRYpnWsepxLoDOuHMlglcSUhbeJsxVOfr/7nuslx
         0PwcNnMx1/AlN8Z7yMz2zRJVFHyPIdBzj66D/yXMDnuT/a2/f5jnctNHi47MsQfanf
         V5oCTSIFBNX62OmuuJorifMGBwh0XsV49ongBAaI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: mc: Improve the media_entity_has_pad_interdep() documentation
Date:   Tue, 13 Dec 2022 00:17:19 +0200
Message-Id: <20221212221719.18053-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
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

Document the function parameters, the requirements on the pad0 and pad1
arguments, the locking requirements and the return value. Also improve
the documentation of the corresponding .has_pad_interdep() operation,
stating clearly that the operation must be called through the
media_entity_has_pad_interdep() function only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 15 ++++++++++++++-
 include/media/media-entity.h |  4 +++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f19bb98071b2..e9b71b895f98 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -226,7 +226,13 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * Graph traversal
  */
 
-/*
+/**
+ * media_entity_has_pad_interdep - Check interdependency between two pads
+ *
+ * @entity: The entity
+ * @pad0: The first pad index
+ * @pad1: The second pad index
+ *
  * This function checks the interdependency inside the entity between @pad0
  * and @pad1. If two pads are interdependent they are part of the same pipeline
  * and enabling one of the pads means that the other pad will become "locked"
@@ -236,6 +242,13 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
  * to check the dependency inside the entity between @pad0 and @pad1. If the
  * has_pad_interdep operation is not implemented, all pads of the entity are
  * considered to be interdependent.
+ *
+ * One of @pad0 and @pad1 must be a sink pad and the other one a source pad.
+ * The function returns false if both pads are sinks or sources.
+ *
+ * The caller must hold entity->graph_obj.mdev->mutex.
+ *
+ * Return: true if the pads are connected internally and false otherwise.
  */
 static bool media_entity_has_pad_interdep(struct media_entity *entity,
 					  unsigned int pad0, unsigned int pad1)
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 1b820cb6fed1..741f9c629c6f 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -262,7 +262,9 @@ struct media_pad {
  *			part of the same pipeline and enabling one of the pads
  *			means that the other pad will become "locked" and
  *			doesn't allow configuration changes. pad0 and pad1 are
- *			guaranteed to not both be sinks or sources.
+ *			guaranteed to not both be sinks or sources. Never call
+ *			the .has_pad_interdep() operation directly, always use
+ *			media_entity_has_pad_interdep().
  *			Optional: If the operation isn't implemented all pads
  *			will be considered as interdependent.
  *
-- 
Regards,

Laurent Pinchart

