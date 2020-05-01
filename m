Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6498C1C1B5B
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgEARQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728933AbgEARQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:07 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E10C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a31so149202pje.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xqvf4AG0d588UR2GuJsbJfkppVg9/Oc7aooELImZjbU=;
        b=uquU//BogVT0nU0tS4uIPqkl9/OVN6rQkiGCeQAbmQAA6L09W4UWD3qrugnZ6M87pN
         OKDC4RZc/XMOV+nV3JwzsTIH+Zoq4kfub/BcXiC256MYsLqSvO8a4jfj/6fQ12j6OT25
         CmpsvGt/UFjH9IzgDfqHYQocDHssnoqNOe0BBiCIZcqQ7HWuGFi4AQrH9682xv8Yh7SO
         TDm42Qes3VXL5O/YBFww/bD7BOyxqOESfGgLhf/yRJ+cDopaOCoIyb6xwTUNZQ5ohtVF
         l9lxGR48kSg+lWsA23cLExhYWeJNJ/uWZaOnxpj+XxNMZICAcY8NrDZc0FA337j99usK
         4jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xqvf4AG0d588UR2GuJsbJfkppVg9/Oc7aooELImZjbU=;
        b=c8MyYOStwpmg/+8Q9d8VPH+fZWmgXQCRbZJdEjhERO5rySf9z8tsdObGhHiUQzlCZO
         Fwp7klIbF+894SKmS5CM8HYu2ZU8cJm1y40cUZmjVFhXINl+bisnZrUmVXNuS3CL2tyC
         ep+uztnNxLDeTsB2wj3FG2AMykg8loOGZwYKPfe+tGoQvoYTRonRSURDsOPWoUC84jT/
         Q4n6mlv9IjnV4kIwSSg55FMel7VB1gZJsUdpQuucxbvIaCeHEmnfey1uXS+w0lAI5KME
         y8grINr28YUV8Act5oxZlEFvcb5YOI0IrbuqPMSXPQF+723m9Zavv11uLFDRRVLMXZw7
         8mIw==
X-Gm-Message-State: AGi0Pua6DYK+JgiFLVq9xOa+WWLSOTCL0oM17+8SDBizI0WVsBS9oRbG
        Kn1/t8gmPYVnXLZUzrdocZqlbK4y
X-Google-Smtp-Source: APiQypIqpbYTSWTACXVDOXk191yY0HXzwIuDncNAnf/GN+y1mpSvC9orqhzQZIoGlPM2TWe/S4s+gQ==
X-Received: by 2002:a17:902:b20e:: with SMTP id t14mr5329434plr.223.1588353366353;
        Fri, 01 May 2020 10:16:06 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:05 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 03/22] media: v4l2-mc: add v4l2_create_fwnode_links helpers
Date:   Fri,  1 May 2020 10:15:37 -0700
Message-Id: <20200501171556.14731-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create media links between source and sink subdevices,
based on the fwnode endpoint connections between them:

v4l2_create_fwnode_links_to_pad() - create links from a source subdev to
                                    a single sink pad based on fwnode
                                    endpoint connections.

v4l2_create_fwnode_links() - create all links from a source to sink subdev
                             based on fwnode endpoint connections.

These functions can be used in a sink's v4l2-async notifier subdev
bound callback to make the links from the bound subdev.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 95 +++++++++++++++++++++++++++++++
 include/media/v4l2-mc.h           | 48 ++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 0fffdd3ce6a4..ba2f2b8dcc8c 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -309,6 +309,101 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q)
 }
 EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 
+int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
+				    struct media_pad *sink)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_subdev *sink_sd;
+
+	if (!(sink->flags & MEDIA_PAD_FL_SINK) ||
+	    !is_media_entity_v4l2_subdev(sink->entity))
+		return -EINVAL;
+
+	sink_sd = media_entity_to_v4l2_subdev(sink->entity);
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
+		struct fwnode_handle *remote_ep;
+		int src_idx, sink_idx, ret;
+		struct media_pad *src;
+
+		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
+						      endpoint,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0)
+			continue;
+
+		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
+		if (!remote_ep)
+			continue;
+
+		/*
+		 * ask the sink to verify it owns the remote endpoint,
+		 * and translate to a sink pad.
+		 */
+		sink_idx = media_entity_get_fwnode_pad(&sink_sd->entity,
+						       remote_ep,
+						       MEDIA_PAD_FL_SINK);
+		fwnode_handle_put(remote_ep);
+
+		if (sink_idx < 0 || sink_idx != sink->index)
+			continue;
+
+		/*
+		 * the source endpoint corresponds to one of its source pads,
+		 * the source endpoint connects to an endpoint at the sink
+		 * entity, and the sink endpoint corresponds to the sink
+		 * pad requested, so we have found an endpoint connection
+		 * that works, create the media link for it.
+		 */
+
+		src = &src_sd->entity.pads[src_idx];
+
+		/* skip if link already exists */
+		if (media_entity_find_link(src, sink))
+			continue;
+
+		dev_dbg(sink_sd->dev, "creating link %s:%d -> %s:%d\n",
+			src_sd->entity.name, src_idx,
+			sink_sd->entity.name, sink_idx);
+
+		ret = media_create_pad_link(&src_sd->entity, src_idx,
+					    &sink_sd->entity, sink_idx, 0);
+		if (ret) {
+			dev_err(sink_sd->dev,
+				"link %s:%d -> %s:%d failed with %d\n",
+				src_sd->entity.name, src_idx,
+				sink_sd->entity.name, sink_idx, ret);
+
+			fwnode_handle_put(endpoint);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links_to_pad);
+
+int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
+			     struct v4l2_subdev *sink_sd)
+{
+	unsigned int i;
+
+	for (i = 0; i < sink_sd->entity.num_pads; i++) {
+		struct media_pad *pad = &sink_sd->entity.pads[i];
+		int ret;
+
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		ret = v4l2_create_fwnode_links_to_pad(src_sd, pad);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_create_fwnode_links);
+
 /* -----------------------------------------------------------------------------
  * Pipeline power management
  *
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index 5e73eb8e28f6..246eed398648 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -12,6 +12,7 @@
 
 #include <media/media-device.h>
 #include <media/v4l2-dev.h>
+#include <media/v4l2-subdev.h>
 #include <linux/types.h>
 
 /* We don't need to include pci.h or usb.h here */
@@ -84,6 +85,53 @@ void v4l_disable_media_source(struct video_device *vdev);
  */
 int v4l_vb2q_enable_media_source(struct vb2_queue *q);
 
+/**
+ * v4l2_create_fwnode_links_to_pad - Create fwnode-based links from a
+ *                                   source subdev to a sink subdev pad.
+ *
+ * @src_sd - pointer to a source subdev
+ * @sink - pointer to a subdev sink pad
+ *
+ * This function searches for fwnode endpoint connections from a source
+ * subdevice to a single sink pad, and if suitable connections are found,
+ * translates them into media links to that pad. The function can be
+ * called by the sink subdevice, in its v4l2-async notifier subdev bound
+ * callback, to create links from a bound source subdevice.
+ *
+ * .. note::
+ *
+ *    Any sink subdevice that calls this function must implement the
+ *    .get_fwnode_pad media operation in order to verify endpoints passed
+ *    to the sink are owned by the sink.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
+				    struct media_pad *sink);
+
+/**
+ * v4l2_create_fwnode_links - Create fwnode-based links from a source
+ *                            subdev to a sink subdev.
+ *
+ * @src_sd - pointer to a source subdevice
+ * @sink_sd - pointer to a sink subdevice
+ *
+ * This function searches for any and all fwnode endpoint connections
+ * between source and sink subdevices, and translates them into media
+ * links. The function can be called by the sink subdevice, in its
+ * v4l2-async notifier subdev bound callback, to create all links from
+ * a bound source subdevice.
+ *
+ * .. note::
+ *
+ *    Any sink subdevice that calls this function must implement the
+ *    .get_fwnode_pad media operation in order to verify endpoints passed
+ *    to the sink are owned by the sink.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
+			     struct v4l2_subdev *sink_sd);
 
 /**
  * v4l2_pipeline_pm_get - Increase the use count of a pipeline
-- 
2.17.1

