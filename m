Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435E545E3A5
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 01:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351757AbhKZAVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 19:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237036AbhKZATj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 19:19:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D35C061746
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:20 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p18so6788454wmq.5
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0Izz8KH3j327RlKK4TwK19uTSmxVKmRVDkq2hLcddk=;
        b=ZPSP60X5v4XZgNoeDenlTFOqIk2FZwsr2EKfGw035cMwDVoQoWkJZL+UIA/75wkruZ
         09gGEm0SkdikuBASxGcfW3VLRslcBgkc8IBc4lErQVpjZFUU6tGI+sfkZCsqf3j/Vsmv
         47aVIZX8753gISMo3mXDjMxuxU60cjSLA1ReUfRAEp/IvVwDNcjueumZG+XFASgNYJEe
         sFhy+7RtZr/z/B2uJKRN6xtKrar294jF5l4cm9Wh/rkSt0T3rc1FPBdbUp4dDNJNF7EW
         lKEMLhjNsILxh6PL3lCu9rVMjE09ruMZcFbSMWG0W/a4pIKK6Y5QLgprgzSO30X6EES8
         b9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0Izz8KH3j327RlKK4TwK19uTSmxVKmRVDkq2hLcddk=;
        b=XgJY2H9Prq619bgzZ+riUIHMklzg4AOrka+xFGjuPvh7mQfFmGvzvcKEdCoEblXcIR
         NETKjr+vEz2zEkhnZ80B2bx1n4SlvogptF/fgciIp172TJBS23KnHRf6+0RnasajPdo7
         8JZRK8bEgj7T8+dv2K2RhdM/EOQGumx2ypxGK6U4kFn1QwHkNjXiMKTIXtMLIUVM48bf
         QWZWjyE5sShclIhe2d2BKjH+g6B8S8tq8TUttY+lvmZE48GhMCYvWdjd9VkCDiTwsO1+
         oNEWrr1sMIVZ08FWJ9A8E3JsxmOT0Nq4HORc4GXOPDu9N3InvOaijRiRHxFj1pKXdEBo
         DAZQ==
X-Gm-Message-State: AOAM5327aizhy0O/DMIM6aOnTxcUCB9zF3mbc1epxar/aJAFCbe/04jc
        aqmokyrubEGlZjgc/P/iXlj6vW22Zt4=
X-Google-Smtp-Source: ABdhPJx5aXsJr4gK3HseSFEI8dNiA+HezXXYWrq1rlhVqYUKaTru0n8qBM0/JBb+Eo6VJu32w2+TcQ==
X-Received: by 2002:a1c:98ca:: with SMTP id a193mr11875097wme.162.1637885779202;
        Thu, 25 Nov 2021 16:16:19 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p14sm8693728wms.29.2021.11.25.16.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 16:16:18 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
Subject: [RFC PATCH 1/2] media: entity: Add support for ancillary links
Date:   Fri, 26 Nov 2021 00:16:02 +0000
Message-Id: <20211126001603.41148-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126001603.41148-1-djrscally@gmail.com>
References: <20211126001603.41148-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To describe in the kernel the connection between devices and their
supporting peripherals (for example, a camera sensor and the vcm
driving the focusing lens for it), add a new type of media link
which connects two instances of struct media_entity.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

I was tempted to 'fix' the spaces between # and define in
include/uapi/linux/media.h but eventually decided they were probably deliberate
but if that's not true I'd fix those too.

 drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
 include/media/media-entity.h | 30 ++++++++++++++++++++++++++++++
 include/uapi/linux/media.h   |  1 +
 3 files changed, 61 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f40f41977142..9c18b974e117 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1032,3 +1032,33 @@ void media_remove_intf_links(struct media_interface *intf)
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_remove_intf_links);
+
+struct media_link *media_create_ancillary_link(struct media_entity *primary,
+					       struct media_entity *ancillary,
+					       u32 flags)
+{
+	struct media_link *link;
+
+	link = media_add_link(&primary->links);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	link->primary = primary;
+	link->ancillary = ancillary;
+	link->flags = flags | MEDIA_LNK_FL_ANCILLARY_LINK;
+
+	/* Initialize graph object embedded at the new link */
+	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
+			  &link->graph_obj);
+
+	return link;
+}
+EXPORT_SYMBOL_GPL(media_create_ancillary_link);
+
+void media_remove_ancillary_link(struct media_link *link)
+{
+	list_del(&link->list);
+	media_gobj_destroy(&link->graph_obj);
+	kfree(link);
+}
+EXPORT_SYMBOL_GPL(media_remove_ancillary_link);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fea489f03d57..400b864857ee 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -119,12 +119,16 @@ struct media_pipeline {
  *		a pad. In that case, it represents the source pad.
  * @intf:	Part of a union. Used only if the first object (gobj0) is
  *		an interface.
+ * @primary:	Part of a union. Used only if the first object (gobj0) is
+ *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
  * @gobj1:	Part of a union. Used to get the pointer for the second
  *		graph_object of the link.
  * @sink:	Part of a union. Used only if the second object (gobj1) is
  *		a pad. In that case, it represents the sink pad.
  * @entity:	Part of a union. Used only if the second object (gobj1) is
  *		an entity.
+ * @ancillary:	Part of a union. Used only if the second object (gobj1) is
+ *		an entity and the link type is MEDIA_LNK_FL_ANCILLARY_LINK.
  * @reverse:	Pointer to the link for the reverse direction of a pad to pad
  *		link.
  * @flags:	Link flags, as defined in uapi/media.h (MEDIA_LNK_FL_*)
@@ -137,11 +141,13 @@ struct media_link {
 		struct media_gobj *gobj0;
 		struct media_pad *source;
 		struct media_interface *intf;
+		struct media_entity *primary;
 	};
 	union {
 		struct media_gobj *gobj1;
 		struct media_pad *sink;
 		struct media_entity *entity;
+		struct media_entity *ancillary;
 	};
 	struct media_link *reverse;
 	unsigned long flags;
@@ -1104,6 +1110,30 @@ void media_remove_intf_links(struct media_interface *intf);
  * it will issue a call to @operation\(@entity, @args\).
  */
 
+/**
+ * media_create_ancillary_link() - creates a link between two entities
+ *
+ * @primary:	pointer to the primary %media_entity
+ * @ancillary:	pointer to the ancillary %media_entity
+ * @flags:	Link flags, as defined in
+ *		:ref:`include/uapi/linux/media.h <media_header>`
+ *		( seek for ``MEDIA_LNK_FL_*``)
+ *
+ *
+ * Valid values for flags:
+ *
+ * %MEDIA_LNK_FL_ENABLED
+ *   Indicates that the two entities are connected pieces of hardware that form
+ *   a single logical unit.
+ *
+ *   A typical example is a camera lens being linked to the sensor that it is
+ *   supporting.
+ */
+struct media_link *
+media_create_ancillary_link(struct media_entity *primary,
+			    struct media_entity *ancillary,
+			    u32 flags);
+
 #define media_entity_call(entity, operation, args...)			\
 	(((entity)->ops && (entity)->ops->operation) ?			\
 	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..afbae7213d35 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -226,6 +226,7 @@ struct media_pad_desc {
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
 #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
+#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
-- 
2.25.1

