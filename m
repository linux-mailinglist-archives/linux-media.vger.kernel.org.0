Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974CF1786A1
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgCCXnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:32 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:56169 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgCCXnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:32 -0500
Received: by mail-pj1-f65.google.com with SMTP id a18so34693pjs.5
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dRqJL2C3GC4fAf71WIWo2Omz+fN++LTYE3PdtWw52Eo=;
        b=nk4HT+Rke6LljjPVPR8nTWLbUnjHgZ9el1cwccffqPsWqUAd6t9yv8ZPBJFJqrFQBJ
         BxRWqcPt8zYkOvMpyRp1DdlqpIFkaFYD9boIronIIAckFsQCiQXrUwW5hvac7cnBJsWL
         v/luY8iWfdYwYfJLtkIh3hCKlw0AGthCV8KZAwqzu3rWtuOjHX/cLBpkUIQi2cVjmuvm
         6Q2Vli3jzX1DlR59bvHOqjGWa0MTA5YLbww77gtziAnlZhQMXyJLXLmgwAGoSG72COpL
         YXPnfkXSEbdlZPeNZDFPPFYuXMCNxYz6IzMeBdjcCX8gpXTC+E+jsNPK9NfOm6RJU7Ie
         1iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dRqJL2C3GC4fAf71WIWo2Omz+fN++LTYE3PdtWw52Eo=;
        b=sxs6fGjR4w/sr7xv40J5BQM5q8A2Ik5DzxRobfT6COdQKjDO8TCAAH9JLHzvdFccDm
         ZlOyWUbaFvxi7iB2Zs52ROglc1/RwcPWzWQpVKJOJxXcqP5/fg4xsit78HrIF1T92feM
         yzXkS2AzDXh+aob4Yg8xNvJbGFzLh9a6/bc/4qlwMRlM6tq5geRNPmjWvUmdbV56zCg8
         uiP7B8nvEYY1voWSihhnq0KKqyAFFXqoSofSB8R1INRkPnwOP3xtWTu+ZAgUxRBGRWkW
         2QK0/NZ0F533Eb31Es6tclAVzwMUiBRK3TOKJ3Yr+PxXyjfluXd1mE8tLSEG/d/62fjE
         bGlw==
X-Gm-Message-State: ANhLgQ3NIHfMa37iKopkvLPT7tNs0Zh29GMUPMbRqeYSBV+LxpZK1o9B
        5BFoy7XZt53iQI++LlgNdEQqO7tvxAg=
X-Google-Smtp-Source: ADFU+vswq1p/dVipgUiYcboT7+3+5k0VZANXa22gict4ykJTW6ny+cZggY9X0rLiHbKkMCBqSI2d5w==
X-Received: by 2002:a17:902:9a85:: with SMTP id w5mr327724plp.323.1583279011047;
        Tue, 03 Mar 2020 15:43:31 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:30 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 14/17] media: imx: csi: Lookup upstream endpoint with imx_media_get_pad_fwnode
Date:   Tue,  3 Mar 2020 15:42:53 -0800
Message-Id: <20200303234256.8928-15-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx7-media-csi.c  | 25 +++++-----------
 4 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 59ab1cf72841..0388d73e916c 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -164,7 +164,7 @@ static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
 static int csi_get_upstream_endpoint(struct csi_priv *priv,
 				     struct v4l2_fwnode_endpoint *ep)
 {
-	struct device_node *endpoint, *port;
+	struct fwnode_handle *endpoint;
 	struct media_entity *src;
 	struct v4l2_subdev *sd;
 	struct media_pad *pad;
@@ -203,23 +203,13 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
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
index 87152bd9af22..61752c6b074d 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -1007,6 +1007,39 @@ imx_media_pipeline_video_device(struct media_entity *start_entity,
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
index f90a65ba4ced..5f23d852122f 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -205,6 +205,7 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
 struct video_device *
 imx_media_pipeline_video_device(struct media_entity *start_entity,
 				enum v4l2_buf_type buftype, bool upstream);
+struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
 
 struct imx_media_dma_buf {
 	void          *virt;
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 88e21c13e420..9b31379611ac 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -439,9 +439,8 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 					  struct v4l2_fwnode_endpoint *ep,
 					  bool skip_mux)
 {
-	struct device_node *endpoint, *port;
+	struct fwnode_handle *endpoint;
 	struct media_entity *src;
-	struct v4l2_subdev *sd;
 	struct media_pad *pad;
 
 	if (!csi->src_sd)
@@ -463,29 +462,19 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 	if (!pad)
 		return -ENODEV;
 
-	sd = media_entity_to_v4l2_subdev(pad->entity);
-
 	/* To get bus type we may need to skip video mux */
 	if (skip_mux && src->function == MEDIA_ENT_F_VID_MUX) {
-		src = &sd->entity;
+		src = pad->entity;
 		goto skip_video_mux;
 	}
 
-	/*
-	 * NOTE: this assumes an OF-graph port id is the same as a
-	 * media pad index.
-	 */
-	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
-	if (!port)
-		return -ENODEV;
+	endpoint = imx_media_get_pad_fwnode(pad);
+	if (IS_ERR(endpoint))
+		return PTR_ERR(endpoint);
 
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
-- 
2.17.1

