Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D77108493
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfKXTHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:17 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42568 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfKXTHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:17 -0500
Received: by mail-pg1-f196.google.com with SMTP id q17so5924736pgt.9
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u/PbVO0GF+3G1LmQDJT1XFH8AmJHxoqEkGwCBY/zSdU=;
        b=k59+alcnR3A0bSusIMmPr6CUlDdeujjQYR7FaJ0HCA97nK5jpX2Js1HzyQtjaMIjCQ
         fUVSvoDEuetjvd3NJijtCYHC+53tVN2leHbwxltNxDiCaZQXeVKhP/vwtWSj20SJnJpp
         kQdjxsm6/z3h4xRreJjutLFdHQr9W5zSWI2drYoUB0hnp5FONKi0deTgPWzOL+7ATew7
         mx9XiHsWlHEOlPBrrZ6hUmW2bL50KXMzc7Ms/wY/5YbMyl5xG6dVhJ6FRBGox0IlGBAo
         DIYin1BIMC4RlUAZ7UFZQhtvyVPeOM5asgQc2AAk2IpIjB7K6iqdALXZqv/ZCMKgn6CQ
         xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u/PbVO0GF+3G1LmQDJT1XFH8AmJHxoqEkGwCBY/zSdU=;
        b=VWhdG9OR6UOxbE1YHwg41oGdrJ85wTSOm9j5zaDuQCgb6YaWI5dEZ8tKtc9wpyLBKx
         N5vrMXYfzqkcCP1ILmqrM7PjM0oWtqXBwuk/3oke0Hn3mW2TFUdgHEjXw14KaUYw89Xl
         oy+2boR19N9MQupDdJ8U/oQJ5bf/DQcexe5dwBRDamMSNL23Dzq2+pzPgMqXAS17Q/F4
         4PW9EUgdqM9dNOj9ooP+wXlV1wd9QfpYayOhpM4OmHbtPhA5lb+Sl0BYF7jgBiMKbIzl
         Vde3m5LRYEBdGOY/70oayfXq4nXoXM+itlJPZKn5CjCbIiSOBlnNPalxLsdoRrgz0vnS
         4Qvw==
X-Gm-Message-State: APjAAAWYeFz7xquGlXHG9E1xgjOGOHgleChJCw19ZHKhGLUZRyicohs2
        LJ9MSOogdt/qjPweBiFhinTm3xTtdI8=
X-Google-Smtp-Source: APXvYqwi6Wi1CBGwUwSHFlA54ykiFIlNYvQ7dLROslQuhCze/XZHPcQolfDKDvSZjhR1Ear8KUawOA==
X-Received: by 2002:a63:d551:: with SMTP id v17mr28933450pgi.365.1574622435534;
        Sun, 24 Nov 2019 11:07:15 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:15 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 02/23] media: entity: Modify default behavior of media_entity_get_fwnode_pad
Date:   Sun, 24 Nov 2019 11:06:42 -0800
Message-Id: <20191124190703.12138-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modify the default behavior of media_entity_get_fwnode_pad() (when the
entity does not provide the get_fwnode_pad op) to first assume the entity
implements a 1:1 mapping between fwnode port number and media pad index.

If the 1:1 mapping is not valid, e.g. the port number falls outside the
entity's pad index range, or the pad at that port number doesn't match the
given direction_flags, fall-back to the previous behavior that searches
the entity for the first pad that matches the given direction_flags.

The previous default behavior can choose the wrong pad for entities with
multiple sink or source pads. With this change the function will choose
the correct pad index if the entity implements a 1:1 port to pad mapping
at that port.

Add some comments to the @get_fwnode_pad operation to make it more clear
under what conditions entities must implement the operation.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
 include/media/media-entity.h | 21 +++++++++++++++------
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index c333320f790a..47a39d9383d8 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 				unsigned long direction_flags)
 {
 	struct fwnode_endpoint endpoint;
-	unsigned int i;
 	int ret;
 
+	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
+	if (ret)
+		return ret;
+
 	if (!entity->ops || !entity->ops->get_fwnode_pad) {
+		unsigned int i;
+
+		/*
+		 * for the default case, first try a 1:1 mapping between
+		 * fwnode port number and pad index.
+		 */
+		ret = endpoint.port;
+		if (ret < entity->num_pads &&
+		    (entity->pads[ret].flags & direction_flags))
+			return ret;
+
+		/*
+		 * if that didn't work search the entity for the first
+		 * pad that matches the @direction_flags.
+		 */
 		for (i = 0; i < entity->num_pads; i++) {
 			if (entity->pads[i].flags & direction_flags)
 				return i;
 		}
 
+		/* else fail */
 		return -ENXIO;
 	}
 
-	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
-	if (ret)
-		return ret;
-
 	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
 	if (ret < 0)
 		return ret;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cde80ad029b7..ed00adb4313b 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -199,6 +199,12 @@ struct media_pad {
  * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
  *			a negative value on error. This operation can be used
  *			to map a fwnode to a media pad number. Optional.
+ *			Entities do not need to implement this operation
+ *			unless two conditions are met:
+ *			- the entity has more than one sink and/or source
+ *			  pad, _and_
+ *			- the entity does not implement a 1:1 mapping of
+ *			  fwnode port numbers to pad indexes.
  * @link_setup:		Notify the entity of link changes. The operation can
  *			return an error, in which case link setup will be
  *			cancelled. Optional.
@@ -858,21 +864,24 @@ struct media_link *media_entity_find_link(struct media_pad *source,
 struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
 
 /**
- * media_entity_get_fwnode_pad - Get pad number from fwnode
+ * media_entity_get_fwnode_pad - Get pad number from an endpoint fwnode
  *
  * @entity: The entity
- * @fwnode: Pointer to the fwnode_handle which should be used to find the pad
+ * @fwnode: Pointer to the endpoint fwnode_handle which should be used to
+ *          find the pad
  * @direction_flags: Expected direction of the pad, as defined in
  *		     :ref:`include/uapi/linux/media.h <media_header>`
  *		     (seek for ``MEDIA_PAD_FL_*``)
  *
  * This function can be used to resolve the media pad number from
- * a fwnode. This is useful for devices which use more complex
- * mappings of media pads.
+ * an endpoint fwnode. This is useful for devices which use more
+ * complex mappings of media pads.
  *
  * If the entity does not implement the get_fwnode_pad() operation
- * then this function searches the entity for the first pad that
- * matches the @direction_flags.
+ * then this function first assumes the entity implements a 1:1 mapping
+ * between fwnode port number and media pad index. If the 1:1 mapping
+ * is not valid, then the function searches the entity for the first pad
+ * that matches the @direction_flags.
  *
  * Return: returns the pad number on success or a negative error code.
  */
-- 
2.17.1

