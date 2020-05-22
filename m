Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9577D1DE15D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgEVH4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgEVH4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:56:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9437C05BD43
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 00:56:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D13712A3550
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: [PATCH v4 3/5] media: staging: rkisp1: validate links before powering and streaming
Date:   Fri, 22 May 2020 09:55:20 +0200
Message-Id: <20200522075522.6190-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In function rkisp1_vb2_start_streaming, the call to
media_pipeline_start should be the first thing in order
to validate the links and prevents their state from being modified
before power up and streaming.

Adjust stop streaming to the same logic, call media_pipeline_stop
after we disable streaming on the entities in the topology.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index f69235f82c45..008c070373f8 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -898,7 +898,6 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 	mutex_lock(&cap->rkisp1->stream_lock);
 
 	rkisp1_stream_stop(cap);
-	media_pipeline_stop(&node->vdev.entity);
 	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
 					rkisp1_pipeline_disable_cb);
 	if (ret)
@@ -914,6 +913,8 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_dummy_buf_destroy(cap);
 
+	media_pipeline_stop(&node->vdev.entity);
+
 	mutex_unlock(&cap->rkisp1->stream_lock);
 }
 
@@ -961,9 +962,15 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 
 	mutex_lock(&cap->rkisp1->stream_lock);
 
+	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
+	if (ret) {
+		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
+		goto err_ret_buffers;
+	}
+
 	ret = rkisp1_dummy_buf_create(cap);
 	if (ret)
-		goto err_ret_buffers;
+		goto err_pipeline_stop;
 
 	ret = pm_runtime_get_sync(cap->rkisp1->dev);
 	if (ret < 0) {
@@ -984,18 +991,10 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	if (ret)
 		goto err_stop_stream;
 
-	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
-	if (ret) {
-		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
-		goto err_pipe_disable;
-	}
-
 	mutex_unlock(&cap->rkisp1->stream_lock);
 
 	return 0;
 
-err_pipe_disable:
-	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
 err_stop_stream:
 	rkisp1_stream_stop(cap);
 	v4l2_pipeline_pm_put(entity);
@@ -1003,6 +1002,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	pm_runtime_put(cap->rkisp1->dev);
 err_destroy_dummy:
 	rkisp1_dummy_buf_destroy(cap);
+err_pipeline_stop:
+	media_pipeline_stop(entity);
 err_ret_buffers:
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&cap->rkisp1->stream_lock);
-- 
2.17.1

