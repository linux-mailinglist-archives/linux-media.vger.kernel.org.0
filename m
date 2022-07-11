Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE105702F3
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiGKMne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiGKMnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CB860536
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:24 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E078A87F;
        Mon, 11 Jul 2022 14:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543401;
        bh=jotMXSHy3q0Hj0KwIvP1tGaPsx9R35OcUNtbxnUUm2w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qsp3gi5zZqg2ZhLt6/EnT32nAvh3CsuhQQtvvwYM0QeHT5XLJJvSFEvm2Mn6Hcm2t
         U6Uk3bkPRJ84EXw7hDT/yI/Nv7iYQHKKLMtrj0hx7nUAqVa4sFN/U2/P/UAzqcz+Oj
         TtGU20B2FF+5pOQcbXtP8udy2vfUGqH+18u3kyOI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 03/46] media: mc-entity: Add a new helper function to get a remote pad
Date:   Mon, 11 Jul 2022 15:42:05 +0300
Message-Id: <20220711124248.2683-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

The media_entity_remote_pad_first() helper function returns the first
remote pad it finds connected to a given pad. Beside being possibly
non-deterministic (as it stops at the first enabled link), the fact that
it returns the first match makes it unsuitable for drivers that need to
guarantee that a single link is enabled, for instance when an entity can
process data from one of multiple sources at a time.

For those use cases, add a new helper function,
media_entity_remote_pad_unique(), that operates on an entity and returns
a remote pad, with a guarantee that only one link is enabled. To ease
its use in drivers, also add an inline wrapper that locates source pads
specifically. A wrapper that locates sink pads can easily be added when
needed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Changes since v2:

- Update commit message

Changes since v1:

- Rename media_entity_remote_source_pad() to
  media_entity_remote_source_pad_unique()
- Skip non-data links
---
 Documentation/driver-api/media/mc-core.rst |  3 +-
 drivers/media/mc/mc-entity.c               | 40 +++++++++++++++++++
 include/media/media-entity.h               | 46 ++++++++++++++++++++++
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 6eea6a3b6441..66801506b2dd 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -186,7 +186,8 @@ is required and the graph structure can be freed normally.
 
 Helper functions can be used to find a link between two given pads, or a pad
 connected to another pad through an enabled link
-:c:func:`media_entity_find_link()` and :c:func:`media_pad_remote_pad_first()`.
+(:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()` and
+:c:func:`media_entity_remote_source_pad_unique()`).
 
 Use count and power handling
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 55076fea7b58..bd7145932137 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/list.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
@@ -920,6 +921,45 @@ struct media_pad *media_pad_remote_pad_first(const struct media_pad *pad)
 }
 EXPORT_SYMBOL_GPL(media_pad_remote_pad_first);
 
+struct media_pad *
+media_entity_remote_pad_unique(const struct media_entity *entity,
+			       unsigned int type)
+{
+	struct media_pad *pad = NULL;
+	struct media_link *link;
+
+	list_for_each_entry(link, &entity->links, list) {
+		struct media_pad *local_pad;
+		struct media_pad *remote_pad;
+
+		if (((link->flags & MEDIA_LNK_FL_LINK_TYPE) !=
+		     MEDIA_LNK_FL_DATA_LINK) ||
+		    !(link->flags & MEDIA_LNK_FL_ENABLED))
+			continue;
+
+		if (type == MEDIA_PAD_FL_SOURCE) {
+			local_pad = link->sink;
+			remote_pad = link->source;
+		} else {
+			local_pad = link->source;
+			remote_pad = link->sink;
+		}
+
+		if (local_pad->entity == entity) {
+			if (pad)
+				return ERR_PTR(-ENOTUNIQ);
+
+			pad = remote_pad;
+		}
+	}
+
+	if (!pad)
+		return ERR_PTR(-ENOLINK);
+
+	return pad;
+}
+EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
+
 static void media_interface_init(struct media_device *mdev,
 				 struct media_interface *intf,
 				 u32 gobj_type,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index ab84476b25c8..aecd1691b297 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -859,6 +859,52 @@ struct media_link *media_entity_find_link(struct media_pad *source,
  */
 struct media_pad *media_pad_remote_pad_first(const struct media_pad *pad);
 
+/**
+ * media_entity_remote_pad_unique - Find a remote pad connected to an entity
+ * @entity: The entity
+ * @type: The type of pad to find (MEDIA_PAD_FL_SINK or MEDIA_PAD_FL_SOURCE)
+ *
+ * Search for and return a remote pad of @type connected to @entity through an
+ * enabled link. If multiple (or no) remote pads match these criteria, an error
+ * is returned.
+ *
+ * The uniqueness constraint makes this helper function suitable for entities
+ * that support a single active source or sink at a time.
+ *
+ * Return: A pointer to the remote pad, or one of the following error pointers
+ * if an error occurs:
+ *
+ * * -ENOTUNIQ - Multiple links are enabled
+ * * -ENOLINK - No connected pad found
+ */
+struct media_pad *
+media_entity_remote_pad_unique(const struct media_entity *entity,
+			       unsigned int type);
+
+/**
+ * media_entity_remote_source_pad_unique - Find a remote source pad connected to
+ *	an entity
+ * @entity: The entity
+ *
+ * Search for and return a remote source pad connected to @entity through an
+ * enabled link. If multiple (or no) remote pads match these criteria, an error
+ * is returned.
+ *
+ * The uniqueness constraint makes this helper function suitable for entities
+ * that support a single active source at a time.
+ *
+ * Return: A pointer to the remote pad, or one of the following error pointers
+ * if an error occurs:
+ *
+ * * -ENOTUNIQ - Multiple links are enabled
+ * * -ENOLINK - No connected pad found
+ */
+static inline struct media_pad *
+media_entity_remote_source_pad_unique(const struct media_entity *entity)
+{
+	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
+}
+
 /**
  * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
  * @entity: The entity
-- 
Regards,

Laurent Pinchart

