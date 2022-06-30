Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0912562679
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiF3XH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiF3XH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:07:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B7B57239
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:07:52 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4FCF832;
        Fri,  1 Jul 2022 01:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630460;
        bh=j+3ZrtP0d8WL1IFfwyhIbmDB62PiXxGJI5Umbm5Fudo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PEsmZ0z3mE2xA/IcSEhg998oDR2vt7YeYqIUuvCEWk2jxX1PvpQac8+Y8/6rkBmPa
         gqxtDt9PBPaWzElCKXy5Pda1RSka2/03/s2FMliC+cfUv35oRtriNwN7epFVNyZviB
         qg4FonpoLesYJg4xTX0i0HlS8pq1M+f5xDMNJOoQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 04/55] media: mc-entity: Add a new helper function to get a remote pad for a pad
Date:   Fri,  1 Jul 2022 02:06:22 +0300
Message-Id: <20220630230713.10580-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

The newly added media_entity_remote_source_pad() helper function handles
use cases where the entity has a link enabled uniqueness constraint
covering all pads. There are use cases where the constraint covers a
specific pad only. Add a new media_pad_remote_pad_unique() function to
handle this. It operates as media_entity_remote_source_pad(), but on a
given pad instead of on the entity.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:

- Rename media_pad_remote_pad() to media_pad_remote_pad_unique()
---
 Documentation/driver-api/media/mc-core.rst |  5 ++--
 drivers/media/mc/mc-entity.c               | 31 ++++++++++++++++++++++
 include/media/media-entity.h               | 18 +++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 66801506b2dd..644911936ad9 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -186,8 +186,9 @@ is required and the graph structure can be freed normally.
 
 Helper functions can be used to find a link between two given pads, or a pad
 connected to another pad through an enabled link
-(:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()` and
-:c:func:`media_entity_remote_source_pad_unique()`).
+(:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`n
+:c:func:`media_entity_remote_source_pad_unique()` and
+:c:func:`media_pad_remote_pad_unique()`).
 
 Use count and power handling
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index bd7145932137..7082403d5800 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -960,6 +960,37 @@ media_entity_remote_pad_unique(const struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
 
+struct media_pad *media_pad_remote_pad_unique(const struct media_pad *pad)
+{
+	struct media_pad *found_pad = NULL;
+	struct media_link *link;
+
+	list_for_each_entry(link, &pad->entity->links, list) {
+		struct media_pad *remote_pad;
+
+		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+			continue;
+
+		if (link->sink == pad)
+			remote_pad = link->source;
+		else if (link->source == pad)
+			remote_pad = link->sink;
+		else
+			continue;
+
+		if (found_pad)
+			return ERR_PTR(-ENOTUNIQ);
+
+		found_pad = remote_pad;
+	}
+
+	if (!found_pad)
+		return ERR_PTR(-ENOLINK);
+
+	return found_pad;
+}
+EXPORT_SYMBOL_GPL(media_pad_remote_pad_unique);
+
 static void media_interface_init(struct media_device *mdev,
 				 struct media_interface *intf,
 				 u32 gobj_type,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index aecd1691b297..cd0690cff4c2 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -859,6 +859,24 @@ struct media_link *media_entity_find_link(struct media_pad *source,
  */
 struct media_pad *media_pad_remote_pad_first(const struct media_pad *pad);
 
+/**
+ * media_pad_remote_pad_unique - Find a remote pad connected to a pad
+ * @pad: The pad
+ *
+ * Search for and return a remote pad connected to @pad through an enabled
+ * link. If multiple (or no) remote pads are found, an error is returned.
+ *
+ * The uniqueness constraint makes this helper function suitable for entities
+ * that support a single active source at a time on a given pad.
+ *
+ * Return: A pointer to the remote pad, or one of the following error pointers
+ * if an error occurs:
+ *
+ * * -ENOTUNIQ - Multiple links are enabled
+ * * -ENOLINK - No connected pad found
+ */
+struct media_pad *media_pad_remote_pad_unique(const struct media_pad *pad);
+
 /**
  * media_entity_remote_pad_unique - Find a remote pad connected to an entity
  * @entity: The entity
-- 
Regards,

Laurent Pinchart

