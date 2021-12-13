Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9869547387B
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244200AbhLMX3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244154AbhLMX3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:10 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7DCC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u1so29550090wru.13
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPmh++1yGOyffVNvBSBuVqzTMZyztDE2gAwt3atAco0=;
        b=jZw8QXwrR4JYgOck8siYAetE+xqhNFOOHpiMs4vysQyrym/KsUzR5sDe34pI2nrOy7
         X4WokiJPeGPmrcu2RD6VOr66Fhlkc0K9HtcXHvaoC+vQZGG5vOi3WPM079kUKDiZWysc
         2OP8Ox+DGgHkdNcMReO7h6lewL+9MnX4hq04789HxRUHYESPDoKEJ+V0Yfw+GDkBLHT3
         EG3xzDTxCcAxj9PxLUv1k0SlWsJ+Jvz2BKB2WEwn4CbhHBP5AiTDZBgfkTq07/Ir0iOW
         lRASh0cQ670rur9OZ3rj81y8Cu+dewMBysnjYnnvsgtNCthIp4+rM0klQ7mahb9frrmR
         ceeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPmh++1yGOyffVNvBSBuVqzTMZyztDE2gAwt3atAco0=;
        b=4YHhNFE95KlfReVao5OUlPmR+ja7HuFp9kQZBpSDJQUhXOyATncgJijB3QpD2wlSfG
         ze2yiUSeIMLVnB/LkHE69DnNeQvmw5kSmeM8XBo6ubRTe5XeMprj/NNcM1JcwpCcs5eU
         PCtledZB01aHcQRqG6fwt5NTatJiKKHHcRPz4F3K8+mr/sHJ1tT881hdSzscF0mt0t9E
         Ws9LZdlXKzmXesBVJSqaeGaaPzASIQSoiB4uH3ZUeJ+VglKRn9QGQH2sCZxS9j60Psw0
         7/bJy2CdrjONIKDWRdx2afzXIp8NQ8MBPazOD3LMHwyg1q/2MNvjZDi27eZu9S/xEm57
         WOiw==
X-Gm-Message-State: AOAM530MoVhWnIFz9eFNC3hYxxBiI56kEw9ftUPWFCanaeAIV6RLv75U
        U5pRzM0qLuar65H4LcK9Abpzpcq3pIE=
X-Google-Smtp-Source: ABdhPJz/eyzP7nXkcRU67Nqk5nWkb5g2NtYqBejosKNlZW51Y0l8ElFV4zOVxORJrzW052JZ+wv+rQ==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr1767621wrj.554.1639438148418;
        Mon, 13 Dec 2021 15:29:08 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:07 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 4/5] media: entity: Add support for ancillary links
Date:   Mon, 13 Dec 2021 23:28:48 +0000
Message-Id: <20211213232849.40071-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create and destroy ancillary links, so that they
don't need to be manually created by users.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since the rfc:

	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
	members
	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
	create function

 drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
 include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index aeddc3f6310e..4e39e100ea03 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1052,3 +1052,33 @@ void media_remove_intf_links(struct media_interface *intf)
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
+	link->gobj0 = &primary->graph_obj;
+	link->gobj1 = &ancillary->graph_obj;
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
index fea489f03d57..f7b1738cef88 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1104,6 +1104,35 @@ void media_remove_intf_links(struct media_interface *intf);
  * it will issue a call to @operation\(@entity, @args\).
  */
 
+/**
+ * media_create_ancillary_link() - creates a link between two entities
+ *
+ * @primary:	pointer to the primary &media_entity
+ * @ancillary:	pointer to the ancillary &media_entity
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
+ *
+ * %MEDIA_LNK_FL_IMMUTABLE
+ *   Indicates that the link enabled state can't be modified at runtime. If
+ *   %MEDIA_LNK_FL_IMMUTABLE is set, then %MEDIA_LNK_FL_ENABLED must also be
+ *   set, since an immutable link is always enabled.
+ */
+struct media_link *
+media_create_ancillary_link(struct media_entity *primary,
+			    struct media_entity *ancillary,
+			    u32 flags);
+
 #define media_entity_call(entity, operation, args...)			\
 	(((entity)->ops && (entity)->ops->operation) ?			\
 	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
-- 
2.25.1

