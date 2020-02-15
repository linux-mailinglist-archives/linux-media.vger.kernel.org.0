Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BEE16003A
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgBOTm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:57 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51784 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgBOTmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id fa20so5447340pjb.1;
        Sat, 15 Feb 2020 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rpOa6ZNketVlDD1fVg7Q22Hn4Eag+44bEMCsUONO9O8=;
        b=nKDR2CfF6RrgkcLnn63uYsZxcW77AmH8l4sxM7DwuSPDobUhKmcRG/TGLwFzziD2XJ
         m0RpfI1jb7nTB2DtiG+2RKuVBeHXgRXEUk0ykiklAN2hjthxfiqa4I5a4RT6nwUxqfmt
         3Uaq5pDz8OjKGOfOiWC8L0NHygd/vMzr+WfVZ/yO9lqOFpYp51v6WtVlyHh0cvYOHKK3
         Y8bTVhtC690S2fPTR0I0f3KkTn8wY1Kyje0AbpA13T0ETiJ10XP7pM1EOZSbb4Il0dKP
         uhdvzcPVQ8YTCamR27pyTduRPRdk912YTOo9NMIpKJzkkyuFfcAXlEV9zWTlmRq78hKE
         TFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rpOa6ZNketVlDD1fVg7Q22Hn4Eag+44bEMCsUONO9O8=;
        b=iK2Aopz9oT5V893Lpa6uCM+6YGhuxonZ4IG5r7o1zvinbaW5LxBxR3hKsQoBsqpj1J
         JNgvwrnoee5zLKv50bPGSdQ5SdRZYOr1t5rQW8+0SFDYyyjnrNHGiebOUWRULsEiZt9E
         evly4f8pQyu/NBYXYBnGqrVvWFZMyuCsqjkKZ9tNdmq5pBwCEkWB758NhFtK3zU4Y7Ic
         fAlsaoulIFAaHMfCWRtIDZzd0QZ0VTdLZEfALdTzoS0i53MsVMA1wkbRHlvH0aMhyYK+
         J0qZdI2jLBxQVnTlmx6ZjRX7PYIagnRR1OHeG64xZ/uUh91BVYLdVVmv/7uc2FcHb/Oq
         mTkA==
X-Gm-Message-State: APjAAAWhLfWLL4vewTfVbVFSZ+PC9O3rlXfGcFYSHNIxuJetzHfmDEp+
        JtdMuv1qYKaGpuUK4nf6XyAf/1X4iVo=
X-Google-Smtp-Source: APXvYqztop9U0pT2U3t3Oc5/2L3GdOytArOUtcGT+g2w7GTRTohiGs0EUjeIy7TbV+D0iGBfeKUnAA==
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr9034740plt.223.1581795773871;
        Sat, 15 Feb 2020 11:42:53 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:53 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 14/17] media: imx: csi: Lookup upstream endpoint with imx_media_get_pad_fwnode
Date:   Sat, 15 Feb 2020 11:41:33 -0800
Message-Id: <20200215194136.10131-15-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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
index 2a8f01375f78..7d4c1c9640dd 100644
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
index cf9f675c53a3..f2ed13aca2b0 100644
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

