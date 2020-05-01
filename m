Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0401C1B6A
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgEARQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729792AbgEARQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EDBC061A0E
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:27 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a21so280364pls.4
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iR1mKkkmKIZESgEF8BbzgebbENJGwFXvt3bpadflBeo=;
        b=edc3A13CnaJYaOprnVfOHCkqYgRm7iLAmR2LyO34CUt5jwHga9B39+x1eYl/q6qEm/
         AkQqD9dGXJUvRrzTP1fgp7At4IFvqJD2zeCgxY3QQwgAgvK0i/Dcs9Q3SV4dbD1KhhNW
         Wrq2zHwUW4JLSy7Rvom5vuOKUqzHON/2Gf43GsHK8NIVwksktaQZgLj37abDhTrVudEn
         PsgxPlf4r0CvJlCIugshSs3DunKxEh9lKAWqSP+rjG5OIk8NnVS9l9ya6JefddNq5DF4
         u1qmP3RdYLdLB2FNL+lUV4cYEyTqwL8c/NLtC6cnTttL2Ge436HM1cEjRi/+dMDicj5P
         Hx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iR1mKkkmKIZESgEF8BbzgebbENJGwFXvt3bpadflBeo=;
        b=Qmfy5YoVONs2EOwygQCmtOW7IlNOUFl03JNE08KSW9Vl5oMsJU10dQmeqWH/+nv0/x
         XwMx893eyfJiyG0sZikY6D49dMBbx+sv53fifWMdNmyXrYjjSNBrSLnw+tDgghtKai5W
         sjsBCYuPrArsT0JPbLn2uNuoExpAz7s9MQDT3/2mPfzkbMbEJl7wqWFeXVnU3sgoFbKE
         NjxhnhW5y4t5JjMAF10bd6cpO+nAaEkv5Ru8DDtlzI5jQZlezGrsdzQiphVAKthkRgIN
         kP/GpFgDtJqI6hWtHboZtHp2wKG8SyrGCNzS23aPd9+dP0jq0+ecJacjOseMt3rCptgm
         ZQHQ==
X-Gm-Message-State: AGi0PuZk9Xsv0qVI9KBR1n6Xx7/shq83IMBGt4A9j7eMHI1AL9f3vHAx
        D1dZzTRO9Jw2iz/Hzbmf8CUgTS20
X-Google-Smtp-Source: APiQypIYuKiFBHNTkSqPILyXYmNY4ZFkUStvm/1xe5xdTzTPk4jwmU+nqXCRD6osL4lke2kRBEhvgg==
X-Received: by 2002:a17:90b:30cb:: with SMTP id hi11mr679774pjb.103.1588353386774;
        Fri, 01 May 2020 10:16:26 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:26 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 18/22] media: imx5/6/7: csi: Mark a bound video mux as a CSI mux
Date:   Fri,  1 May 2020 10:15:52 -0700
Message-Id: <20200501171556.14731-19-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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
index a051a063a2db..6cfbe67c43d1 100644
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
 
@@ -1906,6 +1908,13 @@ static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
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
index ca36beca16de..b5b7d3245727 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -311,5 +311,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRP    BIT(13)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPENC BIT(14)
 #define IMX_MEDIA_GRP_ID_IPU_IC_PRPVF  BIT(15)
+#define IMX_MEDIA_GRP_ID_CSI_MUX       BIT(16)
 
 #endif
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 69f7abb32ae1..a3f3df901704 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1164,6 +1164,13 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
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

