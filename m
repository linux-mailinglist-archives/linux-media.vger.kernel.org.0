Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE68108496
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfKXTHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:21 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:45926 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbfKXTHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:20 -0500
Received: by mail-pj1-f66.google.com with SMTP id m71so5405824pjb.12
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O/5KfUP0LpkEm4DJb+IianL3viLiCU0yRFlJf10usn8=;
        b=qfl7mpn0dtIN16wpxCG2vs/tl1m0pVxpBvfdTTTkvh62cFmYhpqcRhuuIPEI1+hzfn
         FbJyss+kn3HcL/My85UetVEOg1fLafvnDsK96MGhhu+dkWH8AycgNQGePWWVC4ywLpfl
         sDAXb1wdJ8UZShfNXbPKSrEVon6w+0OVTrCav7KplfXtkhbaT8b3vHL0C7iDYITUoyWE
         UpjL4v+7Cy8gSeV9iZfSj4szsP4IxpFJFG4PI9Wk7uL2MINHwJl+a1sSnoUZ16TQEErk
         ESqEq6JGBXc13RA9zIJFhNVlUGzz+H/nnh+Pmr8Y6DklPP9yG7XmJSQ1WtSnbpA3qCGo
         WL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O/5KfUP0LpkEm4DJb+IianL3viLiCU0yRFlJf10usn8=;
        b=AgF+1w/IXffXceXxMY3gnbMwBEtyT3nEUpkDMOAHofGCysgPZCQ1cNaL3RDSw2xkK2
         m8s86KvIlqI2Q65AeNqcxruAeocaVLhqSUdLnrhA3OyQpO3BYWhrHYIWO+7D9bU2wuVd
         m7NH9WEzvpjvhqhz9XdqVZNm+XbrJ0uZ38byLfgLjbnV5Eov1NTK+aeurWDt/dzT8Y8D
         XokU0P0OxhBtCzPB96qfOWnDxZF27CDleHGIxOG4ShB42jca+ENXSZC+p4Cn6AHjaRor
         8/kGcL4/g4ca/f/qXZzvUTIgZGGu84/exHGl4tJ75q8sJOnmHAy2CWGwBYzJxrOnP7V/
         OyWQ==
X-Gm-Message-State: APjAAAUNY+mLtdskj8MzrKPPbOALSfKSybqKXIKIJAYiB6zNVzoio/Th
        gJzpJYUN+0NDIOPWPINVfsXLVeR4z+0=
X-Google-Smtp-Source: APXvYqziMo5OM1bptcjmxrqJHW7BnUYopgZHmnzFq8lyAck+PC0icOGMKSdSQzpC9Efz9zpLnMrFCQ==
X-Received: by 2002:a17:90a:b109:: with SMTP id z9mr33159099pjq.108.1574622438335;
        Sun, 24 Nov 2019 11:07:18 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:17 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 05/23] media: entity: Add functions to convert fwnode endpoints to media links
Date:   Sun, 24 Nov 2019 11:06:45 -0800
Message-Id: <20191124190703.12138-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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
Changes in v2:
- fixed/improved the prototype descriptions.
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
index de7fc3676b5a..100673ad83c4 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -772,6 +772,77 @@ int media_create_pad_links(const struct media_device *mdev,
 			   u32 flags,
 			   const bool allow_both_undefined);
 
+/**
+ * media_create_fwnode_pad_links() - create links between a single local pad
+ *			and a remote entity, using the fwnode endpoints
+ *			between them.
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
+ * media_create_fwnode_links() - create links between two entities, using
+ *				the fwnode endpoints between them.
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

