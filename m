Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9276C1AFF4F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgDTAkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AE4C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d24so3301943pll.8
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HgXvXiGmx8JKUwSpgz+/fWmB1fVB5yi28upGLJmCYnY=;
        b=uk0SgZhyBnLdHMel6L1Ia238gs2AdRKbJwxLDT0t832HY8j+6pyMlMXOD11tDGPa5s
         2lic/LsIXbGqAGj7gRkxdk6+0K0eC/aEXPKdjySYuDpVtqv8DbGIQkXZhGOKtiYeKR9T
         FyyKz5m9SC8WMqqtfNzl8WsqbIZTubbWS8lf/yjY8M7lSuesZjo+xV+n7uB6ETcKqNUs
         En44YDrO8JjqAjvXzIVXTJzlTldidSsgo2kwKhzOdSL0ozLnhozme8Vd1okHOKl0q6mX
         610V4j35Fb35FiSntAHDaR7+y4RWZSDd1DkzZ4N6J+CBfH8OQ/s5yPdUHh5QtOE70R2L
         eyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HgXvXiGmx8JKUwSpgz+/fWmB1fVB5yi28upGLJmCYnY=;
        b=JWcLjsaEoDzlIZYeKzO8ODmp3vkf5UmqnNo4YJFDkeXBjbAEqruGKUCCVzLU5QhlV+
         UmHHCPw/G3dPRT0TjquM9rIM2GBDiQ0xAm2fo7QFw1LAOiao0nTPI/TnF2KT9xcqIS+s
         +MQ02Kf4fD6AKSw/7Aqj2ROXhUPycgO0OrfM+weYwvRrnp7c/XmOzbLuQitBAFziId3b
         tPDXSpVrY63jpUTMN/sFLKvfoMoLWEbLSS+s40O6ylGqdI/ZLeUP0rgWGrqefX0negfE
         M5mfialJr0pwFVRMFN/20xrVE6eLsLecX0ceKYcMO/SsjQwsQ+N3OvAyh1K80QsDhuNo
         nbSg==
X-Gm-Message-State: AGi0PuZcHCA3Ey8Xm5HgMZK1PaszX/htc1Ux3VnyB1+OxCiVu5kpfwP9
        jV2k6oR3i3MgFCLcPNtW/PRZgnGV2oo=
X-Google-Smtp-Source: APiQypLr1ljc+teUYNt49H79DLWn0abRog/7eIWFERBqJveQxYEKM4GB6KRIE32bpIH3k/76pPhjuA==
X-Received: by 2002:a17:902:8643:: with SMTP id y3mr14183902plt.149.1587343205034;
        Sun, 19 Apr 2020 17:40:05 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:40:04 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 20/23] media: imx: csi: Lookup upstream endpoint with imx_media_get_pad_fwnode
Date:   Sun, 19 Apr 2020 17:39:27 -0700
Message-Id: <20200420003930.11463-21-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 303f92ef4d9c..a7640a5d7791 100644
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
index fae981698c49..cc47591a5f0b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -923,6 +923,39 @@ imx_media_pipeline_video_device(struct media_entity *start_entity,
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
index d89026bb99a8..058a41e3d941 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -201,6 +201,7 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
 struct video_device *
 imx_media_pipeline_video_device(struct media_entity *start_entity,
 				enum v4l2_buf_type buftype, bool upstream);
+struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
 
 struct imx_media_dma_buf {
 	void          *virt;
-- 
2.17.1

