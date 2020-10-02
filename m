Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3877281AF7
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 20:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733260AbgJBSmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 14:42:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52446 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBSmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 14:42:33 -0400
Received: from guri.fritz.box (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E21129DEF1;
        Fri,  2 Oct 2020 19:42:30 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 1/6] media: staging: rkisp1: validate links before powering and streaming
Date:   Fri,  2 Oct 2020 20:42:17 +0200
Message-Id: <20201002184222.7094-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index b6f497ce3e95..9b4a12e13f13 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -921,7 +921,6 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 	mutex_lock(&cap->rkisp1->stream_lock);
 
 	rkisp1_stream_stop(cap);
-	media_pipeline_stop(&node->vdev.entity);
 	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
 					rkisp1_pipeline_disable_cb);
 	if (ret)
@@ -937,6 +936,8 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	rkisp1_dummy_buf_destroy(cap);
 
+	media_pipeline_stop(&node->vdev.entity);
+
 	mutex_unlock(&cap->rkisp1->stream_lock);
 }
 
@@ -986,9 +987,15 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 
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
@@ -1009,18 +1016,10 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
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
@@ -1028,6 +1027,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
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

