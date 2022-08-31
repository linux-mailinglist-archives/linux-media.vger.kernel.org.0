Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEEBB5A7FC7
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbiHaOQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbiHaOPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A1055AA
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:14:49 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E86DCB60;
        Wed, 31 Aug 2022 16:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955260;
        bh=yjSrO6OSTwc+NPk3H3rzZ6xj11Kj17WSLAI5ZR4Vf5c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cKwVxHVDJoS/ywyI9YPd5uvIpUSTDQTF2PTd9VlvrwWBPPU7P4jr7fM5UNlne624c
         qTGmwfIGUnYDRK/a/Q3mg+XRUJXw03BzbcRapcNXVM4b/vRQOSP9HWfTCglN1/jFsb
         vWd6PQEGc+WFIDAPJpOl2nMBGHlJp7i42FUvg1ck=
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
Subject: [PATCH v14 06/34] media: mc: entity: Merge media_entity_enum_init and __media_entity_enum_init
Date:   Wed, 31 Aug 2022 17:13:29 +0300
Message-Id: <20220831141357.1396081-7-tomi.valkeinen@ideasonboard.com>
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

The media_entity_enum_init() function is a wrapper around
__media_entity_enum_init() that turns a media_device pointer argument
into the maximum entity ID in the corresponding media graph.
__media_entity_enum_init() is never used outside of
media_entity_enum_init(), so the two functions can be merged together.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 10 ++++++----
 include/media/media-device.h | 15 ---------------
 include/media/media-entity.h | 10 +++++-----
 3 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 682f424a15ca..48d8cc98ae04 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -59,10 +59,12 @@ static inline const char *link_type_name(struct media_link *link)
 	}
 }
 
-__must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
-					  int idx_max)
+__must_check int media_entity_enum_init(struct media_entity_enum *ent_enum,
+					struct media_device *mdev)
 {
-	idx_max = ALIGN(idx_max, BITS_PER_LONG);
+	int idx_max;
+
+	idx_max = ALIGN(mdev->entity_internal_idx_max + 1, BITS_PER_LONG);
 	ent_enum->bmap = bitmap_zalloc(idx_max, GFP_KERNEL);
 	if (!ent_enum->bmap)
 		return -ENOMEM;
@@ -71,7 +73,7 @@ __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(__media_entity_enum_init);
+EXPORT_SYMBOL_GPL(media_entity_enum_init);
 
 void media_entity_enum_cleanup(struct media_entity_enum *ent_enum)
 {
diff --git a/include/media/media-device.h b/include/media/media-device.h
index a10b30507524..86716ee7cc6c 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -191,21 +191,6 @@ struct usb_device;
 #define MEDIA_DEV_NOTIFY_PRE_LINK_CH	0
 #define MEDIA_DEV_NOTIFY_POST_LINK_CH	1
 
-/**
- * media_entity_enum_init - Initialise an entity enumeration
- *
- * @ent_enum: Entity enumeration to be initialised
- * @mdev: The related media device
- *
- * Return: zero on success or a negative error code.
- */
-static inline __must_check int media_entity_enum_init(
-	struct media_entity_enum *ent_enum, struct media_device *mdev)
-{
-	return __media_entity_enum_init(ent_enum,
-					mdev->entity_internal_idx_max + 1);
-}
-
 /**
  * media_device_init() - Initializes a media device element
  *
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index a5a50350e954..1030e45e8ee6 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -439,15 +439,15 @@ static inline bool is_media_entity_v4l2_subdev(struct media_entity *entity)
 }
 
 /**
- * __media_entity_enum_init - Initialise an entity enumeration
+ * media_entity_enum_init - Initialise an entity enumeration
  *
  * @ent_enum: Entity enumeration to be initialised
- * @idx_max: Maximum number of entities in the enumeration
+ * @mdev: The related media device
  *
- * Return: Returns zero on success or a negative error code.
+ * Return: zero on success or a negative error code.
  */
-__must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
-					  int idx_max);
+__must_check int media_entity_enum_init(struct media_entity_enum *ent_enum,
+					struct media_device *mdev);
 
 /**
  * media_entity_enum_cleanup - Release resources of an entity enumeration
-- 
2.34.1

