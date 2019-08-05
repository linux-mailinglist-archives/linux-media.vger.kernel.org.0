Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A378282A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbfHEXgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:42 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39135 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730900AbfHEXfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:21 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so37103507pls.6;
        Mon, 05 Aug 2019 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YFQ4AoMFvQmMSyDzoiWHzk59x+QNTk1pRP20/urZlo0=;
        b=Z6jrILgg++NDytvDTNzU7ffPKGYG+xNJz/aNfoeFluS8ytP+Gph24wSxjN4tQdGDPt
         RGfkJ/6Ux7CrEB0hUBmVilI13ZocAUrxnx/bzdbgQTruJm/XKHy7T+pmWiYwb2OK3n8S
         hRC5bzqJDTQOWxOSskUr72/tYu4aAuReXJWD1ITNfgtSb0gpMTCv2GsoHkmyLCf/efd5
         VjkV63HlqMIEFi5vkqSep9mIC3cHAhLQj5nmGv4Zg6tfwMBxWOIuZWD/+LDW0R1RHvcW
         pmyzpuJmTG9CnUN2j5FSlsbphNqoR8xh4jAf06IVEuY9dcSB/PuFROxx9Za9efDRxZE/
         eYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YFQ4AoMFvQmMSyDzoiWHzk59x+QNTk1pRP20/urZlo0=;
        b=RC2Spck+zB/E8omyBlO5B75dKos3hiUB6A4voQB92nIsVxpX72w0Uy1BQYbssGljna
         Mi6zp7zZTW4euHPFVolqP3mhKUME5wyVlooFVlYUSfDD2QY734yjaJpHKILczxnqyWbT
         9a9qryOggiscfg/Rbtjm4h9/NOJRZmDkrriu9755KowW3h2NmZFwEs9ltvGX8HFi4cbd
         ERtfQEuv7/iBPvotADL8f6vN9dObxFiWgf3zVkesuK9ROitcqyc1yWacGdw80J+bEzkw
         UmKeL51S361mQqJZMHuNYiiegL6hquLIBHv9yrbzGvilf2/QW7k7ssWtQCKGSHqC5pEh
         exhQ==
X-Gm-Message-State: APjAAAU1OwnZBq7y1Mr7NfVAwvDkzYEgkG5vrWa/+pLNdHU4n16E32+D
        epGnwfC+NyAlw6c/PulibyVJlbmO
X-Google-Smtp-Source: APXvYqwk6uHxQUupum1kLR2fneJjb9XpXYhfHpsb6IFjE+beuEbsUj6EwqWsKhsllFtRvWk4kgL4YA==
X-Received: by 2002:a17:902:7781:: with SMTP id o1mr233895pll.205.1565048120080;
        Mon, 05 Aug 2019 16:35:20 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:19 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/22] media: entity: Add functions to convert fwnode endpoints to media links
Date:   Mon,  5 Aug 2019 16:34:48 -0700
Message-Id: <20190805233505.21167-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds two functions:

media_create_fwnode_pad_links(), which converts fwnode endpoints that
connect a local pad to all pads on a remote entity into media links.

media_create_fwnode_links(), which converts fwnode endpoints that
connect all pads from a local entity to all pads on a remote entity into
media links.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/mc/mc-entity.c | 178 +++++++++++++++++++++++++++++++++++
 include/media/media-entity.h |  71 ++++++++++++++
 2 files changed, 249 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index e9e090244fd4..45bbd6c91019 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -787,6 +787,184 @@ int media_create_pad_links(const struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(media_create_pad_links);
 
+static int __media_create_fwnode_pad_link(struct media_pad *local_pad,
+					struct media_entity *remote,
+					const struct fwnode_handle *remote_ep,
+					const u32 flags)
+{
+	struct media_entity *local = local_pad->entity;
+	unsigned long local_dir = local_pad->flags;
+	unsigned long remote_dir = (local_dir & MEDIA_PAD_FL_SOURCE) ?
+		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	struct media_entity *src, *sink;
+	int src_pad, sink_pad;
+	int remote_pad;
+	int ret;
+
+	remote_pad = media_entity_get_fwnode_pad(remote, remote_ep,
+						 remote_dir);
+	if (remote_pad < 0)
+		return 0;
+
+	if (local_dir & MEDIA_PAD_FL_SOURCE) {
+		src = local;
+		src_pad = local_pad->index;
+		sink = remote;
+		sink_pad = remote_pad;
+	} else {
+		src = remote;
+		src_pad = remote_pad;
+		sink = local;
+		sink_pad = local_pad->index;
+	}
+
+	/* make sure link doesn't already exist */
+	if (media_entity_find_link(&src->pads[src_pad],
+				   &sink->pads[sink_pad]))
+		return 0;
+
+	ret = media_create_pad_link(src, src_pad, sink, sink_pad, flags);
+	if (ret) {
+		dev_dbg(sink->graph_obj.mdev->dev,
+			"%s:%d -> %s:%d failed with %d\n",
+			src->name, src_pad, sink->name, sink_pad,
+			ret);
+		return ret;
+	}
+
+	dev_dbg(sink->graph_obj.mdev->dev, "%s:%d -> %s:%d\n",
+		src->name, src_pad, sink->name, sink_pad);
+
+	return 0;
+}
+
+int __media_create_fwnode_pad_links(struct media_pad *local_pad,
+				    const struct fwnode_handle *local_fwnode,
+				    struct media_entity *remote,
+				    const struct fwnode_handle *remote_fwnode,
+				    const u32 link_flags)
+{
+	struct fwnode_handle *endpoint;
+
+	fwnode_graph_for_each_endpoint(remote_fwnode, endpoint) {
+		struct fwnode_link link;
+		int ret;
+
+		ret = fwnode_graph_parse_link(endpoint, &link);
+		if (ret)
+			continue;
+
+		/*
+		 * if this endpoint does not link to the local fwnode
+		 * device, ignore it and continue.
+		 */
+		if (link.remote_port_parent != local_fwnode) {
+			fwnode_graph_put_link(&link);
+			continue;
+		}
+
+		ret = __media_create_fwnode_pad_link(local_pad,
+						     remote, endpoint,
+						     link_flags);
+
+		fwnode_graph_put_link(&link);
+
+		if (ret) {
+			fwnode_handle_put(endpoint);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__media_create_fwnode_pad_links);
+
+int media_create_fwnode_pad_links(struct media_pad *local_pad,
+				  const struct fwnode_handle *local_fwnode,
+				  struct media_entity *remote,
+				  const struct fwnode_handle *remote_fwnode,
+				  const u32 link_flags)
+{
+	struct media_device *mdev = local_pad->entity->graph_obj.mdev;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+	ret = __media_create_fwnode_pad_links(local_pad, local_fwnode,
+					      remote, remote_fwnode,
+					      link_flags);
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_create_fwnode_pad_links);
+
+int __media_create_fwnode_links(struct media_entity *local,
+				const struct fwnode_handle *local_fwnode,
+				struct media_entity *remote,
+				const struct fwnode_handle *remote_fwnode,
+				const u32 link_flags)
+{
+	struct fwnode_handle *endpoint;
+
+	fwnode_graph_for_each_endpoint(local_fwnode, endpoint) {
+		struct fwnode_link link;
+		int local_pad;
+		int ret;
+
+		local_pad = media_entity_get_fwnode_pad(local, endpoint,
+							MEDIA_PAD_FL_SINK |
+							MEDIA_PAD_FL_SOURCE);
+		if (local_pad < 0)
+			continue;
+
+		ret = fwnode_graph_parse_link(endpoint, &link);
+		if (ret)
+			continue;
+
+		/*
+		 * if this endpoint does not link to the remote fwnode
+		 * device, ignore it and continue.
+		 */
+		if (link.remote_port_parent != remote_fwnode) {
+			fwnode_graph_put_link(&link);
+			continue;
+		}
+
+		ret = __media_create_fwnode_pad_link(&local->pads[local_pad],
+						     remote,
+						     link.remote.local_fwnode,
+						     link_flags);
+
+		fwnode_graph_put_link(&link);
+
+		if (ret) {
+			fwnode_handle_put(endpoint);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__media_create_fwnode_links);
+
+int media_create_fwnode_links(struct media_entity *local,
+			      const struct fwnode_handle *local_fwnode,
+			      struct media_entity *remote,
+			      const struct fwnode_handle *remote_fwnode,
+			      const u32 link_flags)
+{
+	struct media_device *mdev = local->graph_obj.mdev;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+	ret = __media_create_fwnode_links(local, local_fwnode,
+					  remote, remote_fwnode, link_flags);
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_create_fwnode_links);
+
 void __media_entity_remove_links(struct media_entity *entity)
 {
 	struct media_link *link, *tmp;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index de7fc3676b5a..781ac2df6460 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -772,6 +772,77 @@ int media_create_pad_links(const struct media_device *mdev,
 			   u32 flags,
 			   const bool allow_both_undefined);
 
+/**
+ * media_create_fwnode_links() - create links formed by the fwnode
+ *			     endpoints between a known local pad and
+ *			     a remote entity.
+ *
+ * @local_pad: Pointer to &media_pad of the local media pad.
+ * @local_fwnode: Pointer to the local device's firmware node.
+ * @remote: Pointer to &media_entity of the remote device.
+ * @remote_fwnode: Pointer to the remote device's firmware node.
+ * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
+ *
+ * .. note::
+ *
+ *    Before calling this function, media_entity_pads_init() and
+ *    media_device_register_entity() should be called previously for
+ *    both entities to be linked.
+ *
+ *    Locked (via the mdev graph_mutex) and unlocked versions of this
+ *    function are provided. If this function is called from v4l2-async
+ *    notifier bound handlers, the locked version should be used to
+ *    prevent races with other subdevices loading and binding to their
+ *    notifiers in parallel. The unlocked version can for example be
+ *    called from v4l2-async notifier complete handlers, after all
+ *    subdevices have loaded and bound.
+ */
+int __media_create_fwnode_pad_links(struct media_pad *local_pad,
+				    const struct fwnode_handle *local_fwnode,
+				    struct media_entity *remote,
+				    const struct fwnode_handle *remote_fwnode,
+				    const u32 link_flags);
+int media_create_fwnode_pad_links(struct media_pad *local_pad,
+				  const struct fwnode_handle *local_fwnode,
+				  struct media_entity *remote,
+				  const struct fwnode_handle *remote_fwnode,
+				  const u32 link_flags);
+
+/**
+ * media_create_fwnode_links() - create links formed by the fwnode
+ *			     endpoints between two entities.
+ *
+ * @local: Pointer to &media_entity of the local device.
+ * @local_fwnode: Pointer to the local device's firmware node.
+ * @remote: Pointer to &media_entity of the remote device.
+ * @remote_fwnode: Pointer to the remote device's firmware node.
+ * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
+ *
+ * .. note::
+ *
+ *    Before calling this function, media_entity_pads_init() and
+ *    media_device_register_entity() should be called previously for
+ *    both entities to be linked.
+ *
+ *    Locked (via the mdev graph_mutex) and unlocked versions of this
+ *    function are provided. If this function is called from v4l2-async
+ *    notifier bound handlers, the locked version should be used to
+ *    prevent races with other subdevices loading and binding to their
+ *    notifiers in parallel. The unlocked version can for example be
+ *    called from v4l2-async notifier complete handlers, after all
+ *    subdevices have loaded and bound.
+ */
+int __media_create_fwnode_links(struct media_entity *local,
+				const struct fwnode_handle *local_fwnode,
+				struct media_entity *remote,
+				const struct fwnode_handle *remote_fwnode,
+				const u32 link_flags);
+int media_create_fwnode_links(struct media_entity *local,
+			      const struct fwnode_handle *local_fwnode,
+			      struct media_entity *remote,
+			      const struct fwnode_handle *remote_fwnode,
+			      const u32 link_flags);
+
 void __media_entity_remove_links(struct media_entity *entity);
 
 /**
-- 
2.17.1

