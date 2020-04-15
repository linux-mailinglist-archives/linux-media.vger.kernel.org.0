Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0347C1A907A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 03:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392599AbgDOBbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 21:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392609AbgDOBbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 21:31:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B01C061A0C;
        Tue, 14 Apr 2020 18:31:07 -0700 (PDT)
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E81B52A1C5B;
        Wed, 15 Apr 2020 02:31:03 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v3 3/4] media: staging: rkisp1: use v4l2_pipeline_stream_{enable,disable} helpers
Date:   Tue, 14 Apr 2020 22:30:43 -0300
Message-Id: <20200415013044.1778572-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415013044.1778572-1-helen.koike@collabora.com>
References: <20200415013044.1778572-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_pipeline_stream_{enable,disable} to call .s_stream() subdevice
callbacks through the pipeline.

Tested by streaming on Scarlet Chromebook.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v3:
- rebase on top of new helpers prototypes

Changes in v2:
- rebase on top of new helpers prototypes

 drivers/staging/media/rkisp1/rkisp1-capture.c | 76 +------------------
 1 file changed, 3 insertions(+), 73 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 24fe6a7888aa4..a18f1668e3563 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -838,71 +838,6 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
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
@@ -929,11 +864,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_stream_stop(cap);
 	media_pipeline_stop(&node->vdev.entity);
-	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
-					rkisp1_pipeline_disable_cb);
-	if (ret)
-		dev_err(rkisp1->dev,
-			"pipeline stream-off failed error:%d\n", ret);
+	v4l2_pipeline_stream_disable(&node->vdev, &cap->rkisp1->pipe);
 
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
 
@@ -1005,8 +936,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	rkisp1_stream_start(cap);
 
 	/* start sub-devices */
-	ret = rkisp1_pipeline_sink_walk(entity, NULL,
-					rkisp1_pipeline_enable_cb);
+	ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev, &cap->rkisp1->pipe);
 	if (ret)
 		goto err_stop_stream;
 
@@ -1019,7 +949,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	return 0;
 
 err_pipe_disable:
-	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
+	v4l2_pipeline_stream_disable(&cap->vnode.vdev, &cap->rkisp1->pipe);
 err_stop_stream:
 	rkisp1_stream_stop(cap);
 	v4l2_pipeline_pm_put(entity);
-- 
2.26.0

