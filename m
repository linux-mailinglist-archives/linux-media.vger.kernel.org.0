Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F2C5214A9
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241430AbiEJMDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241445AbiEJMDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EEF165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:44 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D66781869;
        Tue, 10 May 2022 13:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183971;
        bh=FoyLYFnys/3AHuA1i8+u18sJF+/odDK5/oJembX9Pbs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h6JjiuUtYPtcBLFU/+tLEJIDooOmPksUQ8YrvAQ8JRBjcuhyHDRWhexX/JI8BvhAp
         8UoTaxeoz39yOQWZam5DhweGBm1Zk8i0dflSMDv1AU4+vvIwh+r9sjmFP6rSsuZh2F
         z4VjCgLfLr0o9g6aj8MNvrLCKbWbEw9V/domhyoQ=
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
Subject: [PATCH 25/50] staging: media: imx: imx7-media-csi: Inline pipeline start/stop
Date:   Tue, 10 May 2022 14:58:34 +0300
Message-Id: <20220510115859.19777-26-laurent.pinchart@ideasonboard.com>
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

The imx7_csi_media_pipeline_set_stream() function has separate branches
for the start and stop paths, surrounded by mutex lock/unlock. That is
very little shared code, inline the locking and corresponding branch in
each of the two callers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 58 ++++++++--------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8600fc4d6be2..44c19c73da97 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1067,31 +1067,6 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	return 0;
 }
 
-static int imx7_csi_media_pipeline_set_stream(struct imx7_csi *csi, bool on)
-{
-	struct imx_media_dev *imxmd = &csi->imxmd;
-	int ret = 0;
-
-	mutex_lock(&imxmd->md.graph_mutex);
-
-	if (on) {
-		ret = __media_pipeline_start(&csi->sd.entity, &imxmd->pipe);
-		if (ret)
-			goto out;
-		ret = v4l2_subdev_call(&csi->sd, video, s_stream, 1);
-		if (ret)
-			__media_pipeline_stop(&csi->sd.entity);
-	} else {
-		v4l2_subdev_call(&csi->sd, video, s_stream, 0);
-		if (csi->sd.entity.pipe)
-			__media_pipeline_stop(&csi->sd.entity);
-	}
-
-out:
-	mutex_unlock(&imxmd->md.graph_mutex);
-	return ret;
-}
-
 static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 					  unsigned int count)
 {
@@ -1103,18 +1078,29 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 	ret = imx7_csi_video_validate_fmt(csi);
 	if (ret) {
 		dev_err(csi->dev, "capture format not valid\n");
-		goto return_bufs;
+		goto err_buffers;
 	}
 
-	ret = imx7_csi_media_pipeline_set_stream(csi, true);
-	if (ret) {
-		dev_err(csi->dev, "pipeline start failed with %d\n", ret);
-		goto return_bufs;
-	}
+	mutex_lock(&csi->imxmd.md.graph_mutex);
+
+	ret = __media_pipeline_start(&csi->sd.entity, &csi->imxmd.pipe);
+	if (ret)
+		goto err_unlock;
+
+	ret = v4l2_subdev_call(&csi->sd, video, s_stream, 1);
+	if (ret)
+		goto err_stop;
+
+	mutex_unlock(&csi->imxmd.md.graph_mutex);
 
 	return 0;
 
-return_bufs:
+err_stop:
+	__media_pipeline_stop(&csi->sd.entity);
+err_unlock:
+	mutex_unlock(&csi->imxmd.md.graph_mutex);
+	dev_err(csi->dev, "pipeline start failed with %d\n", ret);
+err_buffers:
 	spin_lock_irqsave(&csi->q_lock, flags);
 	list_for_each_entry_safe(buf, tmp, &csi->ready_q, list) {
 		list_del(&buf->list);
@@ -1130,11 +1116,11 @@ static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 	struct imx_media_buffer *frame;
 	struct imx_media_buffer *tmp;
 	unsigned long flags;
-	int ret;
 
-	ret = imx7_csi_media_pipeline_set_stream(csi, false);
-	if (ret)
-		dev_warn(csi->dev, "pipeline stop failed with %d\n", ret);
+	mutex_lock(&csi->imxmd.md.graph_mutex);
+	v4l2_subdev_call(&csi->sd, video, s_stream, 0);
+	__media_pipeline_stop(&csi->sd.entity);
+	mutex_unlock(&csi->imxmd.md.graph_mutex);
 
 	/* release all active buffers */
 	spin_lock_irqsave(&csi->q_lock, flags);
-- 
Regards,

Laurent Pinchart

