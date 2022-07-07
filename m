Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBE356AEB7
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 00:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236841AbiGGWru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 18:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236155AbiGGWrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 18:47:49 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0EF606B9
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 15:47:48 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o4so28243573wrh.3
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pr7tskyshjOtUfrAvBKNPyBApqCLGXVUJZDWHNfZwSc=;
        b=FrizMJrglTDErxPiNwTNXVfYOF8//4zESmFrlS5SsTd1a6xwCKFdl1nEDt2RZikEoI
         ReED5BtdxfiJCqTFnRhp+p9yftz2S/8W0wrxRYMQfcVVuI+a9giqvN/vK33VkKzwPjEo
         bXe12et0bqqEyo0XgJq87Cz332vydB5txTZMqG0HfAWQcsEWifQSim1TlhmzXXSdsID8
         Q7Tl77NQMYHiRQcTkLo1acSVVfZsonaxPIqOL9x9dsxQFgZZC5XnMv9Jz86aS/o1vowB
         IM8ZWO13ZZ0nqR5RtLWUKJ/8hRFBVxO7vxxkNKWk9b+RrOf/GJI+JLKglgapFFfvomW/
         oqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pr7tskyshjOtUfrAvBKNPyBApqCLGXVUJZDWHNfZwSc=;
        b=ik81pmpPTo+envZlMmBFA1L7aktHGBaRS9zcTpcHFaOwll97RxFylh3g0e7HaezV4P
         pBOBl3eZOn2Sq0IfUljHO2V38kc9gCeY9sISCXA/ou0BwLhvQW5Sbj4Np2IYAGcTccfN
         O/hd0WnfsEnssDqxEoDnnY+bCo1lNIBNeAOXeNzQFZI8XdO2UxcmsmK1MQcd1kro/YGl
         FYcCv2WXa09DTWQIov6wRlqou3IUtYhs1EmsJM/qC9+eAe1cQAVFQsqzxz0GahshKLRJ
         ZyZuZrXwPSdfNsjA4zSY3GVCBrF0rYQ5UfDI5bj7oSdUZAtUPUR9pl+FG0YWpuO3W4JG
         lL+Q==
X-Gm-Message-State: AJIora+fqYo0ioMhB3iEMo9vqrDY32o05GOGUdfic88ivuB5W061Pu6H
        V7Qm9mlusGms0OwzC/vAfzJrvsD+koA=
X-Google-Smtp-Source: AGRyM1t6m3ET0Mn3gWFvS0IrNPe+0KE3zfbzGU7j+74x5xj8S9pk55GBQOnfC1XQuKkk+3pGJXuSwA==
X-Received: by 2002:a5d:528e:0:b0:21b:b85b:5873 with SMTP id c14-20020a5d528e000000b0021bb85b5873mr194089wrv.191.1657234066952;
        Thu, 07 Jul 2022 15:47:46 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id be12-20020a05600c1e8c00b0039c4d022a44sm241694wmb.1.2022.07.07.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:47:46 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v2 1/2] media: entity: Add iterator for entity data links
Date:   Thu,  7 Jul 2022 23:47:32 +0100
Message-Id: <20220707224733.347899-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707224733.347899-1-djrscally@gmail.com>
References: <20220707224733.347899-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Iterating over the links for an entity is a somewhat common need
through the media subsystem, but generally the assumption is that
they will all be data links. To meet that assumption add a new macro
that iterates through an entity's links and skips non-data links.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v1 (suggested by Jacopo and Laurent):

	- Simplified __media_entity_next_link()
	- Added the link_type param to __media_entity_next_link()
	- Moved __media_entity_next_link() to mc-entity.c rather than
	  media-entity.h

 drivers/media/mc/mc-entity.c | 16 ++++++++++++++++
 include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 11f5207f73aa..a247d5679930 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/list.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
@@ -1051,3 +1052,18 @@ struct media_link *media_create_ancillary_link(struct media_entity *primary,
 	return link;
 }
 EXPORT_SYMBOL_GPL(media_create_ancillary_link);
+
+struct media_link *__media_entity_next_link(struct media_entity *entity,
+					    struct media_link *link,
+					    unsigned long link_type)
+{
+	link = link ? list_next_entry(link, list)
+		    : list_first_entry(&entity->links, typeof(*link), list);
+
+	list_for_each_entry_from(link, &entity->links, list)
+		if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == link_type)
+			return link;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__media_entity_next_link);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index a9a1c0ec5d1c..903c9368c50d 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1140,4 +1140,33 @@ struct media_link *
 media_create_ancillary_link(struct media_entity *primary,
 			    struct media_entity *ancillary);
 
+/**
+ * __media_entity_next_link() - iterate through a &media_entity's links,
+ *
+ * @entity:	pointer to the &media_entity
+ * @link:	pointer to a &media_link to hold the iterated values
+ * @link_type:	one of the MEDIA_LNK_FL_LINK_TYPE flags
+ *
+ * Return the next link against an entity matching a specific link type. This
+ * allows iteration through an entity's links whilst guaranteeing all of the
+ * returned links are of the given type.
+ */
+struct media_link *__media_entity_next_link(struct media_entity *entity,
+					    struct media_link *link,
+					    unsigned long link_type);
+
+/**
+ * for_each_media_entity_data_link() - Iterate through an entity's data links
+ *
+ * @entity:	pointer to the &media_entity
+ * @link:	pointer to a &media_link to hold the iterated values
+ *
+ * Iterate over a &media_entity's data links
+ */
+#define for_each_media_entity_data_link(entity, link)			\
+	for (link = __media_entity_next_link(entity, NULL,		\
+					     MEDIA_LNK_FL_DATA_LINK);	\
+	     link;							\
+	     link = __media_entity_next_link(entity, link,		\
+					     MEDIA_LNK_FL_DATA_LINK))
 #endif
-- 
2.25.1

