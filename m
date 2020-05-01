Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C741C1B69
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgEARQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729827AbgEARQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42880C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so146464pjb.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G/XXGIuGgcwbyVpd/73oRJYypIhJKFb7odYO+w6RndI=;
        b=dDDWKN1LIrO/L9p3B0VJN5nmEj5uvr0VEXLZtjYv54xb5TK4DMcKdj4m+BdT43+oQg
         Pq6QNXmGbOxnx+vyPoEh5zwUpmskEemkjur5/DHHdhtlfbMNITCFgYWpcWJrcT7djwlt
         K271eamq3KjBL+L5KgUoKo0ksv6zy0Wd/Lv5FBh5I8wc2UWv9ABfQm0Q/eVt9jzGcYPh
         7huIMG4Mjo+2yUXnwv0fm87zMzTpBjG5hnGmBtwr4i6zPmtQ8dDu1nNBOOUVs04YNR6R
         JNPWMIcXtXyVg69oYy88IqROChbPUI5hxqSMs+7R75OctkjiB8qGvs4QXcoo5gOCfqcO
         6naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G/XXGIuGgcwbyVpd/73oRJYypIhJKFb7odYO+w6RndI=;
        b=TvM+JpBtR05xmSGu+xun5QnNyMuxIV+BQHEFWDwJvz28Ej6d+FLVENXEhej0PVc3gZ
         nOcAneZT2xZYTzzkX6g63Tn7HDPo6ZqzgHXRvzfW0RvlitXpmWWbjbd755MFEEAK8cNC
         rzUz2W2FoAhNSWWUINcY38VLm/wiY99t/QsUfPCZh1q+ATMGS9uaHjQdM1urK3xGS+qB
         WQKFRHPovZiHCe2YNO1kbEtcmeH516kEpL41xOjpx2uGqJzRMaYkSuScBeKSNghXAiR6
         9ZRloh9gwmm7U19KZLay76gOHgzA2aBSVvNrC+xSlemR/XAfm5whL8movbhNQBG7IE45
         96qg==
X-Gm-Message-State: AGi0Pua2wQBgWgzArrgi6uKSvGuk8tAJocXgmkY3sZFBLCEp+kzwrfo3
        9OVnEZ+DJzr9bwqUNjqfKtSjOKdk
X-Google-Smtp-Source: APiQypLBokWMBCKG1MmFUNKLKlEYuONr44JSDjHxvxronpFf9Kbhpfebn+RUObLtLlSfWgqCBGOG0A==
X-Received: by 2002:a17:90a:a796:: with SMTP id f22mr760949pjq.42.1588353385443;
        Fri, 01 May 2020 10:16:25 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:24 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 17/22] media: imx7: csi: Remove imx7_csi_get_upstream_endpoint()
Date:   Fri,  1 May 2020 10:15:51 -0700
Message-Id: <20200501171556.14731-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function imx7_csi_get_upstream_endpoint() is not necessary for
imx7. First, the imx7 CSI only receives from the CSI mux, so much of
the code in there is pointless. Second, it is only used to determine
whether the CSI mux has selected the CSI-2 input or the parallel input.
This can be accomplished much more simply by getting the function type
of selected input entity to the CSI mux.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 77 ++++------------------
 1 file changed, 12 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 21a86fa3d89b..69f7abb32ae1 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -169,8 +169,6 @@ struct imx7_csi {
 
 	struct media_entity *sink;
 
-	struct v4l2_fwnode_endpoint upstream_ep;
-
 	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
 	const struct imx_media_pixfmt *cc[IMX7_CSI_PADS_NUM];
 	struct v4l2_fract frame_interval[IMX7_CSI_PADS_NUM];
@@ -435,61 +433,6 @@ static void imx7_csi_deinit(struct imx7_csi *csi)
 	csi->is_init = false;
 }
 
-static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
-					  struct v4l2_fwnode_endpoint *ep,
-					  bool skip_mux)
-{
-	struct device_node *endpoint, *port;
-	struct media_entity *src;
-	struct v4l2_subdev *sd;
-	struct media_pad *pad;
-
-	if (!csi->src_sd)
-		return -EPIPE;
-
-	src = &csi->src_sd->entity;
-
-	/*
-	 * if the source is neither a mux or csi2 get the one directly upstream
-	 * from this csi
-	 */
-	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
-	    src->function != MEDIA_ENT_F_VID_MUX)
-		src = &csi->sd.entity;
-
-skip_video_mux:
-	/* get source pad of entity directly upstream from src */
-	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (!pad)
-		return -ENODEV;
-
-	sd = media_entity_to_v4l2_subdev(pad->entity);
-
-	/* To get bus type we may need to skip video mux */
-	if (skip_mux && src->function == MEDIA_ENT_F_VID_MUX) {
-		src = &sd->entity;
-		goto skip_video_mux;
-	}
-
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
-
-	v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), ep);
-	of_node_put(endpoint);
-
-	return 0;
-}
-
 static int imx7_csi_link_setup(struct media_entity *entity,
 			       const struct media_pad *local,
 			       const struct media_pad *remote, u32 flags)
@@ -556,23 +499,27 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_fwnode_endpoint upstream_ep = {};
+	struct media_pad *pad;
 	int ret;
 
 	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
 	if (ret)
 		return ret;
 
-	ret = imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
-	if (ret) {
-		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
-		return ret;
-	}
+	if (!csi->src_sd)
+		return -EPIPE;
+
+	/*
+	 * find the entity that is selected by the CSI mux. This is needed
+	 * to distinguish between a parallel or CSI-2 pipeline.
+	 */
+	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
+	if (!pad)
+		return -ENODEV;
 
 	mutex_lock(&csi->lock);
 
-	csi->upstream_ep = upstream_ep;
-	csi->is_csi2 = (upstream_ep.bus_type == V4L2_MBUS_CSI2_DPHY);
+	csi->is_csi2 = (pad->entity->function == MEDIA_ENT_F_VID_IF_BRIDGE);
 
 	mutex_unlock(&csi->lock);
 
-- 
2.17.1

