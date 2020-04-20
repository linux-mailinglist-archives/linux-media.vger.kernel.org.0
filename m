Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4EC1AFF4E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDTAkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:04 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E502C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:04 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so3683003pjb.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQiJWYDZBbUPZ7HiwC9ohaLu2KA+CJB23qe7/YkynpE=;
        b=udzIy9HbT817NB7ZrBvMCt/YoAjxmLyxDuWavBGGlch1uxEFb5IT2tZn9qMN/9t7DP
         IGzTPa3Zrrc0c/kreAWVLDjLSbJ7Mo5Q1huvlca2nS00zK97N76BtPUqDd+Umi4sfiAn
         cmLiJHZeSS30cjGRTYbxUmYLaI4lXfoRGUs+/44SJgI4gM3rcd4DGp7LZtBAu+dQKpE6
         9ypGStYs7Tjd1aeBFcJMsRW01pepTp8yWEUNxpby4ZLh+fWnho72Q9d0xDe6B+vzaoXW
         OxgJw2GPzBYKXer7At8L/eCHVDeA78bXqygyM4IToVRNM9dgZ/JKfuEqhM6LEj1SN5BE
         EuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQiJWYDZBbUPZ7HiwC9ohaLu2KA+CJB23qe7/YkynpE=;
        b=QnzzkYdkhsY+GQAZwu4LISsTN7Vw4E1jSRhNTn8HuipOEDKcNUjxRxsiTOszOejuuj
         vsgUc634wC9p3VMilBQqp+NCiHs7VjZ43sE2j9lBGeH6BDV4Ud+qxnyzzpMwzdk80D/o
         kq7myQSB8wDhJZWHAg+/h1uHZHBRESL0aOhDE0MSQ5zB11QSaXd5D2hIZllr0uplSo68
         i9HszCflaSdiX0A5z+qUtviFCjgMJVp0Ed0DdWD4tV8LX+N2SNEWS7hUDkfeOwXuB/Q8
         vKVFhI04aB5jbk6kupTgvQS0xglUv39mYZEbHq5bpFdgBx1hnH3kq1OM8y2AamhNUQhh
         IyGw==
X-Gm-Message-State: AGi0PubEtNwDD1lQcqwQ6QZOP6IDTxRFHxs1MbVgH+g4D7W6tDuZgGU5
        70VERBBfudpoAazCB5jmHvQ07UTLWO0=
X-Google-Smtp-Source: APiQypIMafuArKUWhOwYh7CleqIEkORQS+Pr/0JvlEpdIg6GPlWaIgJLRJjhXtbqkHkfG+qtrMOFSQ==
X-Received: by 2002:a17:902:421:: with SMTP id 30mr13933009ple.271.1587343203757;
        Sun, 19 Apr 2020 17:40:03 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:40:02 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 19/23] media: imx5/6/7: csi: Mark a bound video mux as a CSI mux
Date:   Sun, 19 Apr 2020 17:39:26 -0700
Message-Id: <20200420003930.11463-20-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For i.MX5/6, if the bound subdev is a video mux, it must be one of the
CSI muxes, and for i.MX7, the bound subdev must always be a CSI mux.

So if the bound subdev is a video mux, mark it as a CSI mux with a new
group id IMX_MEDIA_GRP_ID_CSI_MUX.

In the process use the new group id in csi_get_upstream_endpoint(), and
do some cleanup in that function for better readability.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 45 +++++++++++++---------
 drivers/staging/media/imx/imx-media.h      |  1 +
 drivers/staging/media/imx/imx7-media-csi.c |  7 ++++
 3 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 8153ae5935cf..303f92ef4d9c 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -165,7 +165,6 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 				     struct v4l2_fwnode_endpoint *ep)
 {
 	struct device_node *endpoint, *port;
-	struct media_entity *src;
 	struct v4l2_subdev *sd;
 	struct media_pad *pad;
 
@@ -176,30 +175,33 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 		return -EPIPE;
 
 	sd = priv->src_sd;
-	src = &sd->entity;
 
-	if (src->function == MEDIA_ENT_F_VID_MUX) {
+	switch (sd->grp_id) {
+	case IMX_MEDIA_GRP_ID_CSI_MUX:
 		/*
-		 * CSI is connected directly to video mux, skip up to
+		 * CSI is connected directly to CSI mux, skip up to
 		 * CSI-2 receiver if it is in the path, otherwise stay
-		 * with video mux.
+		 * with the CSI mux.
 		 */
-		sd = imx_media_pipeline_subdev(src, IMX_MEDIA_GRP_ID_CSI2,
+		sd = imx_media_pipeline_subdev(&sd->entity,
+					       IMX_MEDIA_GRP_ID_CSI2,
 					       true);
-		if (!IS_ERR(sd))
-			src = &sd->entity;
+		if (IS_ERR(sd))
+			sd = priv->src_sd;
+		break;
+	case IMX_MEDIA_GRP_ID_CSI2:
+		break;
+	default:
+		/*
+		 * the source is neither the CSI mux nor the CSI-2 receiver,
+		 * get the source pad directly upstream from CSI itself.
+		 */
+		sd = &priv->sd;
+		break;
 	}
 
-	/*
-	 * If the source is neither the video mux nor the CSI-2 receiver,
-	 * get the source pad directly upstream from CSI itself.
-	 */
-	if (src->function != MEDIA_ENT_F_VID_MUX &&
-	    sd->grp_id != IMX_MEDIA_GRP_ID_CSI2)
-		src = &priv->sd.entity;
-
-	/* get source pad of entity directly upstream from src */
-	pad = imx_media_pipeline_pad(src, 0, 0, true);
+	/* get source pad of entity directly upstream from sd */
+	pad = imx_media_pipeline_pad(&sd->entity, 0, 0, true);
 	if (!pad)
 		return -ENODEV;
 
@@ -1904,6 +1906,13 @@ static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	struct csi_priv *priv = notifier_to_dev(notifier);
 	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
 
+	/*
+	 * If the subdev is a video mux, it must be one of the CSI
+	 * muxes. Mark it as such via its group id.
+	 */
+	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
+		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+
 	return v4l2_create_fwnode_links_to_pad(sd, sink);
 }
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 11861191324a..d89026bb99a8 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -292,5 +292,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRP    BIT(13)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPENC BIT(14)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPVF  BIT(15)
+#define IMX_MEDIA_GRP_ID_CSI_MUX       BIT(16)
 
 #endif
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 7a9bad7b71d3..7a398e0e56e3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1163,6 +1163,13 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
 
+	/* The bound subdev must always be the CSI mux */
+	if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
+		return -ENXIO;
+
+	/* Mark it as such via its group id */
+	sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+
 	return v4l2_create_fwnode_links_to_pad(sd, sink);
 }
 
-- 
2.17.1

