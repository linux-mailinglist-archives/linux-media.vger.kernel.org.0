Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2445D1DE160
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgEVH4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgEVH4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:56:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DDAC061A0E
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 00:56:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A660B2A356A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: [PATCH v4 4/5] media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable} helpers
Date:   Fri, 22 May 2020 09:55:21 +0200
Message-Id: <20200522075522.6190-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Helen Koike <helen.koike@collabora.com>

Use v4l2_pipeline_stream_{enable,disable} to call .s_stream()
subdevice callbacks through the pipeline.
Those helpers are called only if the other capture is not streaming.

If the other capture is streaming then he already did that for us
so we call s_stream only on the resizer that is connected to the
capture node.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 104 ++++++------------
 1 file changed, 32 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 008c070373f8..d53a8549da77 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -806,71 +806,6 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 	spin_unlock_irqrestore(&cap->buf.lock, flags);
 }
 
-/*
- * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
- * @from: entity at which to start pipeline walk
- * @until: entity at which to stop pipeline walk
- *
- * Walk the entities chain starting at the pipeline video node and stop
- * all subdevices in the chain.
- *
- * If the until argument isn't NULL, stop the pipeline walk when reaching the
- * until entity. This is used to disable a partially started pipeline due to a
- * subdev start error.
- */
-static int rkisp1_pipeline_sink_walk(struct media_entity *from,
-				     struct media_entity *until,
-				     int (*cb)(struct media_entity *from,
-					       struct media_entity *curr))
-{
-	struct media_entity *entity = from;
-	struct media_pad *pad;
-	unsigned int i;
-	int ret;
-
-	while (1) {
-		pad = NULL;
-		/* Find remote source pad */
-		for (i = 0; i < entity->num_pads; i++) {
-			struct media_pad *spad = &entity->pads[i];
-
-			if (!(spad->flags & MEDIA_PAD_FL_SINK))
-				continue;
-			pad = media_entity_remote_pad(spad);
-			if (pad && is_media_entity_v4l2_subdev(pad->entity))
-				break;
-		}
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		if (entity == until)
-			break;
-
-		ret = cb(from, entity);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int rkisp1_pipeline_disable_cb(struct media_entity *from,
-				      struct media_entity *curr)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
-
-	return v4l2_subdev_call(sd, video, s_stream, false);
-}
-
-static int rkisp1_pipeline_enable_cb(struct media_entity *from,
-				     struct media_entity *curr)
-{
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
-
-	return v4l2_subdev_call(sd, video, s_stream, true);
-}
-
 static void rkisp1_stream_stop(struct rkisp1_capture *cap)
 {
 	int ret;
@@ -888,6 +823,36 @@ static void rkisp1_stream_stop(struct rkisp1_capture *cap)
 	}
 }
 
+static int rkisp1_s_stream_subdev(struct rkisp1_capture *cap, int enable)
+{
+	struct rkisp1_device *rkisp1 = cap->rkisp1;
+	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
+	int ret;
+
+	/*
+	 * if the other capture is already streaming then we only need to
+	 * call s_stream of our reszier
+	 */
+	if (other->is_streaming) {
+		struct v4l2_subdev *rsz_sd  = &rkisp1->resizer_devs[cap->id].sd;
+
+		ret = v4l2_subdev_call(rsz_sd, video, s_stream, enable);
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(rkisp1->dev,
+				"stream %s resizer '%s' failed (%d)\n",
+				enable ? "on" : "off", rsz_sd->name, ret);
+	} else {
+		if (enable)
+			ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev);
+		else
+			ret = v4l2_pipeline_stream_disable(&cap->vnode.vdev);
+		if (ret < 0)
+			dev_err(rkisp1->dev, "stream subdevs %s failed %d\n",
+				enable ? "on" : "off", ret);
+	}
+	return ret;
+}
+
 static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 {
 	struct rkisp1_capture *cap = queue->drv_priv;
@@ -898,11 +863,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 	mutex_lock(&cap->rkisp1->stream_lock);
 
 	rkisp1_stream_stop(cap);
-	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
-					rkisp1_pipeline_disable_cb);
-	if (ret)
-		dev_err(rkisp1->dev,
-			"pipeline stream-off failed error:%d\n", ret);
+	rkisp1_s_stream_subdev(cap, 0);
 
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
 
@@ -986,8 +947,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	rkisp1_stream_start(cap);
 
 	/* start sub-devices */
-	ret = rkisp1_pipeline_sink_walk(entity, NULL,
-					rkisp1_pipeline_enable_cb);
+	ret = rkisp1_s_stream_subdev(cap, 1);
 	if (ret)
 		goto err_stop_stream;
 
-- 
2.17.1

