Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDCF1AFF3F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDTAjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgDTAjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338DDC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so3677004pjb.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J52njaf4Sck+4xYqFKEBcgHGmI8LLr2X5QELOOLASRU=;
        b=DfYoynp++Fe52ng/x6PhYC3ADkhrIvJJkOsw5YxQ/knf+Xy9cOYVJxtAivdMFzkPHv
         53TfLZCa0X+jC7omuMHh+fZh8JCsqPXCGas3QMZD1MpvtLYaIw+NZq5uo7tuaDpbPv1/
         cJF5zpRfYws2w3mONcwp10lV4EJcWHidPBUP/TVl66jWY8CjDMNtI623WZ8lHPidWVYo
         FC5s8NC4vfw8+k1xlEVLXMGGienkJ1WE5rZmmzDfyM7Mt8FIzBml5RXmoWySS10BP7FS
         vs0Q7af4xt73pTKQxoZbWtfS0sRuRbyqF2P0cf1WQ9S48Zb6RzHeCNEEZ2HLZZomDKht
         IQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J52njaf4Sck+4xYqFKEBcgHGmI8LLr2X5QELOOLASRU=;
        b=LeXX+U8sm2dnWCgATbIiNllukBi3l/8B4OKarlWlwiEJcvDTGAxuhrdhhA2Upc2+J2
         OLFmN19RL9VzQBNZ/wvKve2/saTKxCy6jneJX4667memzSA7qiRqTl62dmfe9txBnaQg
         W14pB/7aqU/neSXvK18AXfWviCS7Lm8ObobH8HnkwKaA0WrEtJXxPlyVZ1A7PgquLJ0l
         S0BaUO/ZoRxkHUo6iO/QMSIkpN3AdFo/Gyo8szBrTUB5ab+WA90bI7J26BRraTPVyL+e
         wnhdX1C81Lry+AGORnUMrKBVw5XaGyeqUwIG5HwXaq+WDWtxKGZE4WaWfl8MZsPDK2Yy
         +RWQ==
X-Gm-Message-State: AGi0PuaqO2XWfUHhvNQ1T6K860IamG6KZrfmbwwEkkEkzq8N+ZBTovI9
        Wy5/3sZ3Q+56NAjZP0QSBWM9sftL4Lw=
X-Google-Smtp-Source: APiQypLD2+HhnuprZnE/D0tw2j+7+q5/E2ygXPJBvSUPPKjtv9gFBJHhX8O2zA+SIx4snDaQ6iFI4w==
X-Received: by 2002:a17:90b:297:: with SMTP id az23mr18003902pjb.85.1587343182363;
        Sun, 19 Apr 2020 17:39:42 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:41 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 04/23] media: v4l2-mc: add v4l2_create_fwnode_links helpers
Date:   Sun, 19 Apr 2020 17:39:11 -0700
Message-Id: <20200420003930.11463-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 5e73eb8e28f6..302674d2a619 100644
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
+ *    Any sink that calls this function must implement the .get_fwnode_pad
+ *    media operation in order to verify endpoints passed to it are owned
+ *    by it.
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
+ *    Any sink that calls this function must implement the .get_fwnode_pad
+ *    media operation in order to verify endpoints passed to it are owned
+ *    by it.
+ *
+ * Return 0 on success or a negative error code on failure.
+ */
+int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
+			     struct v4l2_subdev *sink_sd);
 
 /**
  * v4l2_pipeline_pm_get - Increase the use count of a pipeline
-- 
2.17.1

