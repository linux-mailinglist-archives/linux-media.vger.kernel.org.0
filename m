Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D55108498
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfKXTHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:21 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40987 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfKXTHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:21 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so6137686pfq.8
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/xV84D2gS7Mwi04w2fDsGDoJh6SY/4m9mQWf3N1HCrs=;
        b=ePp1AkyHRQ/n/tlMVxl/mYo4urZTkb/kcY6+yHVCw6/w1zOBE+VbwFxI9i51TNe+ho
         DmB7cCARc8BCMof29VG/bpr86yQq1CKxi2j/hz5VSwjcXA0pl2+mpJ4Dzg07WJp6di9a
         qztoxs4bSPLZ0ikx1G+fO1kF1M6DxrSs0ibS0a9MkdAja3e8VKvLAapeqImd04eZlyRs
         NbIbNcRlpiJKO4QBwsdu7d/d0zXojoXRmK2RiZGg+1BGqZXad/YOkOqGjKgs2/E4KCCi
         J0CzV8cn3geXAXEH8HvlgTZhuvZDtQIKVmfqP2PH8r/MFH/Il8j2ae/qH4tUe33WgSoi
         W7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/xV84D2gS7Mwi04w2fDsGDoJh6SY/4m9mQWf3N1HCrs=;
        b=sMrUN/bb+/5OPT8Ga+QizW2P1X0xebSe5/xD45G2KBtS5pJYI5J6nbWajjcNVr58U9
         +C5LlS8lUH+vlojFRR+djTERCLGDfIkFs1fHhRiFGlJ1qQULpHxZF0ACkctOVdAv2FJu
         nvqyHgxHjVYmeKDncvbnurFH411DnI83/ncVsUo5JYhw6dtWwKtwHF2mxQEFfZPRw53B
         W35YUhoq4e55g0Q52kzREQYq0wThaSu2maECIWTAoDXWRxGWtNTdAJMa+poanI9GWdTj
         Ta5LI8E9FEx2eGOrgWaRIzoFTOJtgmVgv2snJ8Lui1JAN9sDIRVyVGjmUeLoyzOSzUil
         BSqQ==
X-Gm-Message-State: APjAAAUW2IHifgyH9CqfpH9wwo46KtI9p4iAi29DWuWH6Ecn9advzes/
        cW7hQTYW6uZydEpg0yN3rEhHA13uFl0=
X-Google-Smtp-Source: APXvYqzkpsCS212wpZJ388vdOAMlsN8ApPzMW9DjNqaxanirOo2fN+UiwL/fhXk72sUgesO6v8wh+g==
X-Received: by 2002:a62:180a:: with SMTP id 10mr30684081pfy.40.1574622437646;
        Sun, 24 Nov 2019 11:07:17 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:17 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 04/23] media: Move v4l2_fwnode_parse_link from v4l2 to driver base
Date:   Sun, 24 Nov 2019 11:06:44 -0800
Message-Id: <20191124190703.12138-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is nothing v4l2-specific about v4l2_fwnode_{parse|put}_link().
Make these functions more generally available by moving them to driver
base, with the appropriate name changes to the functions and struct.

In the process embed a 'struct fwnode_endpoint' in 'struct fwnode_link'
for both sides of the link, and make use of fwnode_graph_parse_endpoint()
to fully parse both endpoints. Rename members local_node and
remote_node to more descriptive local_port_parent and
remote_port_parent.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/base/property.c                     | 63 +++++++++++++++++++
 drivers/media/platform/xilinx/xilinx-vipp.c | 69 +++++++++++----------
 drivers/media/v4l2-core/v4l2-fwnode.c       | 39 ------------
 drivers/staging/media/imx/imx-media-of.c    | 49 +++++++--------
 include/linux/fwnode.h                      | 14 +++++
 include/linux/property.h                    |  5 ++
 include/media/v4l2-fwnode.h                 | 44 -------------
 7 files changed, 141 insertions(+), 142 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 81bd01ed4042..dd82cd150d84 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1100,6 +1100,69 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_parse_link() - parse a link between two endpoints
+ * @local_endpoint: the endpoint's fwnode at the local end of the link
+ * @link: pointer to the fwnode link data structure
+ *
+ * Fill the link structure with the parsed local and remote endpoint info
+ * and the local and remote port parent nodes.
+ *
+ * A reference is taken to both the local and remote port parent nodes,
+ * the caller must use fwnode_graph_put_link() to drop the references
+ * when done with the link.
+ *
+ * Return: 0 on success, or -ENOLINK if the remote endpoint fwnode
+ * can't be found.
+ */
+int fwnode_graph_parse_link(struct fwnode_handle *local_endpoint,
+			    struct fwnode_link *link)
+{
+	struct fwnode_handle *remote_endpoint;
+	int ret;
+
+	memset(link, 0, sizeof(*link));
+
+	ret = fwnode_graph_parse_endpoint(local_endpoint, &link->local);
+	if (ret < 0)
+		return ret;
+
+	remote_endpoint = fwnode_graph_get_remote_endpoint(local_endpoint);
+	if (!remote_endpoint)
+		return -ENOLINK;
+
+	ret = fwnode_graph_parse_endpoint(remote_endpoint, &link->remote);
+	if (ret < 0) {
+		fwnode_handle_put(remote_endpoint);
+		return ret;
+	}
+
+	link->local_port_parent =
+		fwnode_graph_get_port_parent(local_endpoint);
+	link->remote_port_parent =
+		fwnode_graph_get_port_parent(remote_endpoint);
+
+	fwnode_handle_put(remote_endpoint);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_parse_link);
+
+/**
+ * fwnode_graph_put_link() - drop references to port parent nodes in a link
+ * @link: pointer to the fwnode link data structure
+ *
+ * Drop references to the local and remote port parent nodes in the link.
+ * This function must be called on every link parsed with
+ * fwnode_graph_parse_link().
+ */
+void fwnode_graph_put_link(struct fwnode_link *link)
+{
+	fwnode_handle_put(link->local_port_parent);
+	fwnode_handle_put(link->remote_port_parent);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_put_link);
+
 const void *device_get_match_data(struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index cc2856efea59..9c0dfc694478 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -74,7 +74,7 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
 	struct media_pad *local_pad;
 	struct media_pad *remote_pad;
 	struct xvip_graph_entity *ent;
-	struct v4l2_fwnode_link link;
+	struct fwnode_link link;
 	struct fwnode_handle *ep = NULL;
 	int ret = 0;
 
@@ -89,7 +89,7 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
 
 		dev_dbg(xdev->dev, "processing endpoint %p\n", ep);
 
-		ret = v4l2_fwnode_parse_link(ep, &link);
+		ret = fwnode_graph_parse_link(ep, &link);
 		if (ret < 0) {
 			dev_err(xdev->dev, "failed to parse link for %p\n",
 				ep);
@@ -99,54 +99,55 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
 		/* Skip sink ports, they will be processed from the other end of
 		 * the link.
 		 */
-		if (link.local_port >= local->num_pads) {
+		if (link.local.port >= local->num_pads) {
 			dev_err(xdev->dev, "invalid port number %u for %p\n",
-				link.local_port, link.local_node);
-			v4l2_fwnode_put_link(&link);
+				link.local.port, link.local_port_parent);
+			fwnode_graph_put_link(&link);
 			ret = -EINVAL;
 			break;
 		}
 
-		local_pad = &local->pads[link.local_port];
+		local_pad = &local->pads[link.local.port];
 
 		if (local_pad->flags & MEDIA_PAD_FL_SINK) {
 			dev_dbg(xdev->dev, "skipping sink port %p:%u\n",
-				link.local_node, link.local_port);
-			v4l2_fwnode_put_link(&link);
+				link.local_port_parent, link.local.port);
+			fwnode_graph_put_link(&link);
 			continue;
 		}
 
 		/* Skip DMA engines, they will be processed separately. */
-		if (link.remote_node == of_fwnode_handle(xdev->dev->of_node)) {
+		if (link.remote_port_parent ==
+		    of_fwnode_handle(xdev->dev->of_node)) {
 			dev_dbg(xdev->dev, "skipping DMA port %p:%u\n",
-				link.local_node, link.local_port);
-			v4l2_fwnode_put_link(&link);
+				link.local_port_parent, link.local.port);
+			fwnode_graph_put_link(&link);
 			continue;
 		}
 
 		/* Find the remote entity. */
-		ent = xvip_graph_find_entity(xdev, link.remote_node);
+		ent = xvip_graph_find_entity(xdev, link.remote_port_parent);
 		if (ent == NULL) {
 			dev_err(xdev->dev, "no entity found for %p\n",
-				link.remote_node);
-			v4l2_fwnode_put_link(&link);
+				link.remote_port_parent);
+			fwnode_graph_put_link(&link);
 			ret = -ENODEV;
 			break;
 		}
 
 		remote = ent->entity;
 
-		if (link.remote_port >= remote->num_pads) {
+		if (link.remote.port >= remote->num_pads) {
 			dev_err(xdev->dev, "invalid port number %u on %p\n",
-				link.remote_port, link.remote_node);
-			v4l2_fwnode_put_link(&link);
+				link.remote.port, link.remote_port_parent);
+			fwnode_graph_put_link(&link);
 			ret = -EINVAL;
 			break;
 		}
 
-		remote_pad = &remote->pads[link.remote_port];
+		remote_pad = &remote->pads[link.remote.port];
 
-		v4l2_fwnode_put_link(&link);
+		fwnode_graph_put_link(&link);
 
 		/* Create the media link. */
 		dev_dbg(xdev->dev, "creating %s:%u -> %s:%u link\n",
@@ -191,7 +192,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 	struct media_pad *source_pad;
 	struct media_pad *sink_pad;
 	struct xvip_graph_entity *ent;
-	struct v4l2_fwnode_link link;
+	struct fwnode_link link;
 	struct device_node *ep = NULL;
 	struct xvip_dma *dma;
 	int ret = 0;
@@ -206,7 +207,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
-		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
+		ret = fwnode_graph_parse_link(of_fwnode_handle(ep), &link);
 		if (ret < 0) {
 			dev_err(xdev->dev, "failed to parse link for %pOF\n",
 				ep);
@@ -214,11 +215,11 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 		}
 
 		/* Find the DMA engine. */
-		dma = xvip_graph_find_dma(xdev, link.local_port);
+		dma = xvip_graph_find_dma(xdev, link.local.port);
 		if (dma == NULL) {
 			dev_err(xdev->dev, "no DMA engine found for port %u\n",
-				link.local_port);
-			v4l2_fwnode_put_link(&link);
+				link.local.port);
+			fwnode_graph_put_link(&link);
 			ret = -EINVAL;
 			break;
 		}
@@ -227,20 +228,20 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 			dma->video.name);
 
 		/* Find the remote entity. */
-		ent = xvip_graph_find_entity(xdev, link.remote_node);
+		ent = xvip_graph_find_entity(xdev, link.remote_port_parent);
 		if (ent == NULL) {
 			dev_err(xdev->dev, "no entity found for %pOF\n",
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
+				to_of_node(link.remote_port_parent));
+			fwnode_graph_put_link(&link);
 			ret = -ENODEV;
 			break;
 		}
 
-		if (link.remote_port >= ent->entity->num_pads) {
+		if (link.remote.port >= ent->entity->num_pads) {
 			dev_err(xdev->dev, "invalid port number %u on %pOF\n",
-				link.remote_port,
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
+				link.remote.port,
+				to_of_node(link.remote_port_parent));
+			fwnode_graph_put_link(&link);
 			ret = -EINVAL;
 			break;
 		}
@@ -249,15 +250,15 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 			source = &dma->video.entity;
 			source_pad = &dma->pad;
 			sink = ent->entity;
-			sink_pad = &sink->pads[link.remote_port];
+			sink_pad = &sink->pads[link.remote.port];
 		} else {
 			source = ent->entity;
-			source_pad = &source->pads[link.remote_port];
+			source_pad = &source->pads[link.remote.port];
 			sink = &dma->video.entity;
 			sink_pad = &dma->pad;
 		}
 
-		v4l2_fwnode_put_link(&link);
+		fwnode_graph_put_link(&link);
 
 		/* Create the media link. */
 		dev_dbg(xdev->dev, "creating %s:%u -> %s:%u link\n",
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 192cac076761..f43f563f9e98 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -557,45 +557,6 @@ int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoint_alloc_parse);
 
-int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
-			   struct v4l2_fwnode_link *link)
-{
-	const char *port_prop = is_of_node(__fwnode) ? "reg" : "port";
-	struct fwnode_handle *fwnode;
-
-	memset(link, 0, sizeof(*link));
-
-	fwnode = fwnode_get_parent(__fwnode);
-	fwnode_property_read_u32(fwnode, port_prop, &link->local_port);
-	fwnode = fwnode_get_next_parent(fwnode);
-	if (is_of_node(fwnode) && of_node_name_eq(to_of_node(fwnode), "ports"))
-		fwnode = fwnode_get_next_parent(fwnode);
-	link->local_node = fwnode;
-
-	fwnode = fwnode_graph_get_remote_endpoint(__fwnode);
-	if (!fwnode) {
-		fwnode_handle_put(fwnode);
-		return -ENOLINK;
-	}
-
-	fwnode = fwnode_get_parent(fwnode);
-	fwnode_property_read_u32(fwnode, port_prop, &link->remote_port);
-	fwnode = fwnode_get_next_parent(fwnode);
-	if (is_of_node(fwnode) && of_node_name_eq(to_of_node(fwnode), "ports"))
-		fwnode = fwnode_get_next_parent(fwnode);
-	link->remote_node = fwnode;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_link);
-
-void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
-{
-	fwnode_handle_put(link->local_node);
-	fwnode_handle_put(link->remote_node);
-}
-EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
-
 static int
 v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 					  struct v4l2_async_notifier *notifier,
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 2d3efd2a6dde..736c954a8ff5 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -84,28 +84,29 @@ EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
  */
 static int create_of_link(struct imx_media_dev *imxmd,
 			  struct v4l2_subdev *sd,
-			  struct v4l2_fwnode_link *link)
+			  struct fwnode_link *link)
 {
 	struct v4l2_subdev *remote, *src, *sink;
 	int src_pad, sink_pad;
 
-	if (link->local_port >= sd->entity.num_pads)
+	if (link->local.port >= sd->entity.num_pads)
 		return -EINVAL;
 
-	remote = imx_media_find_subdev_by_fwnode(imxmd, link->remote_node);
+	remote = imx_media_find_subdev_by_fwnode(imxmd,
+						 link->remote_port_parent);
 	if (!remote)
 		return 0;
 
-	if (sd->entity.pads[link->local_port].flags & MEDIA_PAD_FL_SINK) {
+	if (sd->entity.pads[link->local.port].flags & MEDIA_PAD_FL_SINK) {
 		src = remote;
-		src_pad = link->remote_port;
+		src_pad = link->remote.port;
 		sink = sd;
-		sink_pad = link->local_port;
+		sink_pad = link->local.port;
 	} else {
 		src = sd;
-		src_pad = link->local_port;
+		src_pad = link->local.port;
 		sink = remote;
-		sink_pad = link->remote_port;
+		sink_pad = link->remote.port;
 	}
 
 	/* make sure link doesn't already exist before creating */
@@ -126,17 +127,17 @@ static int create_of_link(struct imx_media_dev *imxmd,
 int imx_media_create_of_links(struct imx_media_dev *imxmd,
 			      struct v4l2_subdev *sd)
 {
-	struct v4l2_fwnode_link link;
-	struct device_node *ep;
+	struct fwnode_handle *endpoint;
+	struct fwnode_link link;
 	int ret;
 
-	for_each_endpoint_of_node(sd->dev->of_node, ep) {
-		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
+	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), endpoint) {
+		ret = fwnode_graph_parse_link(endpoint, &link);
 		if (ret)
 			continue;
 
 		ret = create_of_link(imxmd, sd, &link);
-		v4l2_fwnode_put_link(&link);
+		fwnode_graph_put_link(&link);
 		if (ret)
 			return ret;
 	}
@@ -152,35 +153,33 @@ EXPORT_SYMBOL_GPL(imx_media_create_of_links);
 int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
 				  struct v4l2_subdev *csi)
 {
-	struct device_node *csi_np = csi->dev->of_node;
-	struct device_node *ep;
+	struct fwnode_handle *csi_np = dev_fwnode(csi->dev);
+	struct fwnode_handle *csi_ep;
 
-	for_each_child_of_node(csi_np, ep) {
-		struct fwnode_handle *fwnode, *csi_ep;
-		struct v4l2_fwnode_link link;
+	fwnode_for_each_child_node(csi_np, csi_ep) {
+		struct fwnode_handle *fwnode;
+		struct fwnode_link link;
 		int ret;
 
 		memset(&link, 0, sizeof(link));
 
-		link.local_node = of_fwnode_handle(csi_np);
-		link.local_port = CSI_SINK_PAD;
-
-		csi_ep = of_fwnode_handle(ep);
+		link.local_port_parent = csi_np;
+		link.local.port = CSI_SINK_PAD;
 
 		fwnode = fwnode_graph_get_remote_endpoint(csi_ep);
 		if (!fwnode)
 			continue;
 
 		fwnode = fwnode_get_parent(fwnode);
-		fwnode_property_read_u32(fwnode, "reg", &link.remote_port);
+		fwnode_property_read_u32(fwnode, "reg", &link.remote.port);
 		fwnode = fwnode_get_next_parent(fwnode);
 		if (is_of_node(fwnode) &&
 		    of_node_name_eq(to_of_node(fwnode), "ports"))
 			fwnode = fwnode_get_next_parent(fwnode);
-		link.remote_node = fwnode;
+		link.remote_port_parent = fwnode;
 
 		ret = create_of_link(imxmd, csi, &link);
-		fwnode_handle_put(link.remote_node);
+		fwnode_handle_put(link.remote_port_parent);
 		if (ret)
 			return ret;
 	}
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index ababd6bc82f3..7bafd01b28a4 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -31,6 +31,20 @@ struct fwnode_endpoint {
 	const struct fwnode_handle *local_fwnode;
 };
 
+/**
+ * struct fwnode_link - a link between two fwnode graph endpoints
+ * @local: parsed local endpoint of the link
+ * @local_port_parent: port parent fwnode of local endpoint
+ * @remote: parsed remote endpoint of the link
+ * @remote_port_parent: port parent fwnode of the remote endpoint
+ */
+struct fwnode_link {
+	struct fwnode_endpoint local;
+	struct fwnode_handle *local_port_parent;
+	struct fwnode_endpoint remote;
+	struct fwnode_handle *remote_port_parent;
+};
+
 #define NR_FWNODE_REFERENCE_ARGS	8
 
 /**
diff --git a/include/linux/property.h b/include/linux/property.h
index 9b3d4ca3a73a..1dd5a939bab7 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -374,6 +374,11 @@ fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
+int fwnode_graph_parse_link(struct fwnode_handle *fwnode,
+			    struct fwnode_link *link);
+
+void fwnode_graph_put_link(struct fwnode_link *link);
+
 /* -------------------------------------------------------------------------- */
 /* Software fwnode support - when HW description is incomplete or missing */
 
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f6a7bcd13197..f81f8bf34526 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -109,20 +109,6 @@ struct v4l2_fwnode_endpoint {
 	unsigned int nr_of_link_frequencies;
 };
 
-/**
- * struct v4l2_fwnode_link - a link between two endpoints
- * @local_node: pointer to device_node of this endpoint
- * @local_port: identifier of the port this endpoint belongs to
- * @remote_node: pointer to device_node of the remote endpoint
- * @remote_port: identifier of the port the remote endpoint belongs to
- */
-struct v4l2_fwnode_link {
-	struct fwnode_handle *local_node;
-	unsigned int local_port;
-	struct fwnode_handle *remote_node;
-	unsigned int remote_port;
-};
-
 /**
  * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
  * @fwnode: pointer to the endpoint's fwnode handle
@@ -203,36 +189,6 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
 int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 				     struct v4l2_fwnode_endpoint *vep);
 
-/**
- * v4l2_fwnode_parse_link() - parse a link between two endpoints
- * @fwnode: pointer to the endpoint's fwnode at the local end of the link
- * @link: pointer to the V4L2 fwnode link data structure
- *
- * Fill the link structure with the local and remote nodes and port numbers.
- * The local_node and remote_node fields are set to point to the local and
- * remote port's parent nodes respectively (the port parent node being the
- * parent node of the port node if that node isn't a 'ports' node, or the
- * grand-parent node of the port node otherwise).
- *
- * A reference is taken to both the local and remote nodes, the caller must use
- * v4l2_fwnode_put_link() to drop the references when done with the
- * link.
- *
- * Return: 0 on success, or -ENOLINK if the remote endpoint fwnode can't be
- * found.
- */
-int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
-			   struct v4l2_fwnode_link *link);
-
-/**
- * v4l2_fwnode_put_link() - drop references to nodes in a link
- * @link: pointer to the V4L2 fwnode link data structure
- *
- * Drop references to the local and remote nodes in the link. This function
- * must be called on every link parsed with v4l2_fwnode_parse_link().
- */
-void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
-
 /**
  * typedef parse_endpoint_func - Driver's callback function to be called on
  *	each V4L2 fwnode endpoint.
-- 
2.17.1

