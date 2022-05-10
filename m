Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207FA5214B5
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241447AbiEJMDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbiEJMDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DFC54BFB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03579B9A;
        Tue, 10 May 2022 13:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183970;
        bh=D5kh5m5dVFSdvWBJedF03x3RCtpo2Vy/S76Gby0LnNI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pvH/EnMul8dQHfXufRAV8zjYPDEREsVNIw7QnyoNiRIohzbBDJFubs0zEgrS2xM1H
         6T/G8/kBVT1AbcDWRZAM1ryn3pfA6J2mZAV+08WYXkH9OGbp+dLh+DzC+wjHNID75h
         45VcWCrJvqQhOVbh7DEJde8OdjpE308urfY2sB0o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 24/50] staging: media: imx: imx7-media-csi: Avoid unnecessary casts
Date:   Tue, 10 May 2022 14:58:33 +0300
Message-Id: <20220510115859.19777-25-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the imx7_csi_media_pipeline_set_stream() function by passing it
the imx7_csi pointer, which avoids going from subdev to entity and back
to subdev.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 31 +++++++---------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 1c8ee7c88f46..8600fc4d6be2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1067,33 +1067,24 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	return 0;
 }
 
-/*
- * Turn current pipeline streaming on/off starting from entity.
- */
-static int imx7_csi_media_pipeline_set_stream(struct imx_media_dev *imxmd,
-					      struct media_entity *entity,
-					      bool on)
+static int imx7_csi_media_pipeline_set_stream(struct imx7_csi *csi, bool on)
 {
-	struct v4l2_subdev *sd;
+	struct imx_media_dev *imxmd = &csi->imxmd;
 	int ret = 0;
 
-	if (!is_media_entity_v4l2_subdev(entity))
-		return -EINVAL;
-	sd = media_entity_to_v4l2_subdev(entity);
-
 	mutex_lock(&imxmd->md.graph_mutex);
 
 	if (on) {
-		ret = __media_pipeline_start(entity, &imxmd->pipe);
+		ret = __media_pipeline_start(&csi->sd.entity, &imxmd->pipe);
 		if (ret)
 			goto out;
-		ret = v4l2_subdev_call(sd, video, s_stream, 1);
+		ret = v4l2_subdev_call(&csi->sd, video, s_stream, 1);
 		if (ret)
-			__media_pipeline_stop(entity);
+			__media_pipeline_stop(&csi->sd.entity);
 	} else {
-		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (entity->pipe)
-			__media_pipeline_stop(entity);
+		v4l2_subdev_call(&csi->sd, video, s_stream, 0);
+		if (csi->sd.entity.pipe)
+			__media_pipeline_stop(&csi->sd.entity);
 	}
 
 out:
@@ -1115,8 +1106,7 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 		goto return_bufs;
 	}
 
-	ret = imx7_csi_media_pipeline_set_stream(&csi->imxmd, &csi->sd.entity,
-						 true);
+	ret = imx7_csi_media_pipeline_set_stream(csi, true);
 	if (ret) {
 		dev_err(csi->dev, "pipeline start failed with %d\n", ret);
 		goto return_bufs;
@@ -1142,8 +1132,7 @@ static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
-	ret = imx7_csi_media_pipeline_set_stream(&csi->imxmd, &csi->sd.entity,
-						 false);
+	ret = imx7_csi_media_pipeline_set_stream(csi, false);
 	if (ret)
 		dev_warn(csi->dev, "pipeline stop failed with %d\n", ret);
 
-- 
Regards,

Laurent Pinchart

