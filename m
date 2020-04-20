Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589091AFF4D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDTAkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:02 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B3DC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:02 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so479031pfx.6
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g4Yd3Fh0FSdhep9EpnQRUl0LoCywYLakOXNIVirmsmU=;
        b=G/UIjr/W1FbNoZdwiz0dfjclSGKlpt7n/AwLnYTwM2aPAEOoqbE3olqaAeA3ikTh8D
         swqvlfHNm2mgkM+6J0krxBYfGQQLWFzdxJM7vSZSBc4ZbD9284fNU7v3teYvtJupJI7v
         4h7XANZLQ9stVxmj7a+tV6LjhoLqJEjMuCRUU0VY5BgI2PI+DZXe/dBLzO+ISrLXOgTt
         SVQhAi/6PY66L2dze86byL+tGvRzbFbDwUm07uMoPutE+VNtqPYKy2Pfp7J5dfGFClwJ
         ZG3bsQ5Z9TUxtSrsvsQwVdwfQ+nsmS6oF0GCw83XK01lEosH+JK4ruIM0vju0n0AlMMv
         pZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g4Yd3Fh0FSdhep9EpnQRUl0LoCywYLakOXNIVirmsmU=;
        b=Yk/jWbEQslPZaARyf6A1dtTAylMNTOz+N11GBR9JLe8+H8wqOBr7r2C1kpv+tpDpA5
         n4/7d3X9SGOIr60Sfal2whyH0DZiI4Nd5zuQ7MjwrA3+Vj7y52wuO/6U8d0gF0hBQnZk
         20N9OBgMJhO0PS+liAi7XmG6KRxS8Nfi5suRFpv9CznbV9yQ4cOuQdMUOwe3kjTUhhpW
         PI3GRTsrBYZwawyf4b7YeRshNWVK5siGLgWjHCZtb4ft4qq0nRIT+7QudxwP5RHa1UQd
         B02QA4i13OK0acw1kxWcs7TTGNaxlgcZoiKDg6ZoOym4PLKAGtu78g6yKh1gcpQ0MkAr
         /tfQ==
X-Gm-Message-State: AGi0PubsiJyvHDAQFvHJOGhZFqByWCuSmRCPcp/k0mq+8lfT85ngL0es
        2+GPt95mwdP8kjojag9iBf8XGKhsUHA=
X-Google-Smtp-Source: APiQypKvgqkg6ROrg7+ANe9G7zKzF1JdAVdds28RG7rnUVutBxvi3DaCBwNHO0YVEngagM7SrGmd1g==
X-Received: by 2002:a62:5b87:: with SMTP id p129mr14252549pfb.5.1587343202005;
        Sun, 19 Apr 2020 17:40:02 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:40:01 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 18/23] media: imx7: csi: Remove imx7_csi_get_upstream_endpoint()
Date:   Sun, 19 Apr 2020 17:39:25 -0700
Message-Id: <20200420003930.11463-19-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 357475de4e0c..7a9bad7b71d3 100644
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

