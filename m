Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8002D1C1B6B
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgEARQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729865AbgEARQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:29 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009E5C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:29 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u22so3840147plq.12
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R/JI0aS56V9pQ1I8WLqOQx9B/h2i55Iy3v4YpaXKhJk=;
        b=Q9HiZtALbPgIu6T8W0xXlfBFTUcIM2rpnLaNjCZ7QQmiQFGQQnegLFbM0RFB2dBS0g
         4+dUuv7RVR6dIECR+oF1kjE2TjcZQLe46ssHw5DzWvmT3rHg9GA7deV9NbTLa2yIf3YQ
         wkBcN0BipxLHNToOJYXu75dSfKIN+5tWcmtNKFJLSCvqrm8tTNJJ9mzFAgqQAw+4JboT
         jYwDaiiK6XTHGeBoXCqnfXn8D8n7X4qz3ZQ7wV8JDikEvjp9A8W1A2L+FeR6PQfeHvGX
         dKHvOqZe+QuM5B0F3RY7PCxWG7FM0isF+MoTx5sULcOfC/RTElPVLkWv6nX4Ra9gf1Jx
         ludw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R/JI0aS56V9pQ1I8WLqOQx9B/h2i55Iy3v4YpaXKhJk=;
        b=ouJvMS83CkpTCQXmdmA6bqJeOj7EWlAFHA1F7m0jMP8RObKoHF+V1InovnrTSpfdTH
         LQMl2ZlnpxqeYpcDxtpSSrRm58vaQBqFQk6P57J6ITEG/3I0RuoP9fvua3D3vOErpq/y
         U92RqRDocyO8pQzIHvvgYgjzLWwaChpL4xfvuK08Opa86Ke8FKj61C4eQudRhOYvFeEQ
         ZSqe1jbgzdTq1lzwU+VDhn0ISCWbZ/iCRmqCvexo9Lh3FPEFMziG8mjakPenAMV7Ub82
         /aUurwm+6zCK+RcyFOthMPVTRarrArp7oWU9Ni2DRKIIMcOqriyJD8n1S/vI1OyV/cMZ
         z7cA==
X-Gm-Message-State: AGi0PuZva5cuTlb0KZ9BYHIzXwXK/kOC9JuafQJzZdfZPRysSnm+FKOm
        /7Lmf368QIvvS+gW116XiKg5whzV
X-Google-Smtp-Source: APiQypKmWvyCmJV3/n3Qnl9iBJwxnN4ueVT5JkZY8grcAss0ulRLJxgBBiBcFkcjUjRprtd5Gj6MpA==
X-Received: by 2002:a17:90a:210b:: with SMTP id a11mr719243pje.31.1588353388175;
        Fri, 01 May 2020 10:16:28 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:27 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 19/22] media: imx: csi: Lookup upstream endpoint with imx_media_get_pad_fwnode
Date:   Fri,  1 May 2020 10:15:53 -0700
Message-Id: <20200501171556.14731-20-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the 1:1 port-id:pad-index assumption for the upstream subdevice, by
searching the upstream subdevice's endpoints for one that maps to the
pad's index. This is carried out by a new reverse mapping function
imx_media_get_pad_fwnode().

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c   | 22 ++++----------
 drivers/staging/media/imx/imx-media-utils.c | 33 +++++++++++++++++++++
 drivers/staging/media/imx/imx-media.h       |  1 +
 3 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 6cfbe67c43d1..d7e5b9ed27b8 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -164,7 +164,7 @@ static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
 static int csi_get_upstream_endpoint(struct csi_priv *priv,
 				     struct v4l2_fwnode_endpoint *ep)
 {
-	struct device_node *endpoint, *port;
+	struct fwnode_handle *endpoint;
 	struct v4l2_subdev *sd;
 	struct media_pad *pad;
 
@@ -205,23 +205,13 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 	if (!pad)
 		return -ENODEV;
 
-	sd = media_entity_to_v4l2_subdev(pad->entity);
+	endpoint = imx_media_get_pad_fwnode(pad);
+	if (IS_ERR(endpoint))
+		return PTR_ERR(endpoint);
 
-	/*
-	 * NOTE: this assumes an OF-graph port id is the same as a
-	 * media pad index.
-	 */
-	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
-	if (!port)
-		return -ENODEV;
-
-	endpoint = of_get_next_child(port, NULL);
-	of_node_put(port);
-	if (!endpoint)
-		return -ENODEV;
+	v4l2_fwnode_endpoint_parse(endpoint, ep);
 
-	v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), ep);
-	of_node_put(endpoint);
+	fwnode_handle_put(endpoint);
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 42e64b618a61..7c058db41f7c 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -835,6 +835,39 @@ imx_media_pipeline_video_device(struct media_entity *start_entity,
 }
 EXPORT_SYMBOL_GPL(imx_media_pipeline_video_device);
 
+/*
+ * Find a fwnode endpoint that maps to the given subdevice's pad.
+ * If there are multiple endpoints that map to the pad, only the
+ * first endpoint encountered is returned.
+ *
+ * On success the refcount of the returned fwnode endpoint is
+ * incremented.
+ */
+struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_subdev *sd;
+
+	if (!is_media_entity_v4l2_subdev(pad->entity))
+		return ERR_PTR(-ENODEV);
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), endpoint) {
+		int pad_idx = media_entity_get_fwnode_pad(&sd->entity,
+							  endpoint,
+							  pad->flags);
+		if (pad_idx < 0)
+			continue;
+
+		if (pad_idx == pad->index)
+			return endpoint;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(imx_media_get_pad_fwnode);
+
 /*
  * Turn current pipeline streaming on/off starting from entity.
  */
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index b5b7d3245727..c5f2aa2f0e98 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -220,6 +220,7 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
 struct video_device *
 imx_media_pipeline_video_device(struct media_entity *start_entity,
 				enum v4l2_buf_type buftype, bool upstream);
+struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
 
 struct imx_media_dma_buf {
 	void          *virt;
-- 
2.17.1

