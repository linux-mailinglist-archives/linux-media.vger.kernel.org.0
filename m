Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DA52487CD
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgHROhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:35 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52029 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727899AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jqkcewL; Tue, 18 Aug 2020 16:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761442; bh=gKaFXl2Yd18gOgP8eY4gteEKy3374ENDrhfq4+1jX9k=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NzRkt0GXRy3wP9Evi9mcOEW7UGCVRbOzyhHEs0bcDb+H9HD9PlBuI39OXxkPABajL
         5C2Ol8qAjho2HSeChDW6L2lzzKk0t8yfCpkhZIrlNJjsMriVFxvKEMdgkkXoLoIfOb
         /avlJM3oqiy14MiF10KbmwSe3224GZZtcAogUbO/mhdAeSZrE7RH/mpyns6jejVqb8
         e5teUYFEpgtKgvXev5aDNrMIm9YbWDlX+b4n1KsZzhLeg4sZAYr4NT1uCdEO8DC2dS
         CkvH8r8PmN4PsZdoazIu/RF9vMXrhg7Hel9Q46yWvZZnfQ8ndjhxl1nc8ofL/pE9mj
         HuclntPrz1nlA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 12/12] vicodec: add support for read-only requests
Date:   Tue, 18 Aug 2020 16:37:19 +0200
Message-Id: <20200818143719.102128-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfP7+giVF2yARMvQzXdrB71WPzNzQPnB2vBNV1zfb1go6qlHWCQCw4uRfchZzAtnyfp0sjerWlDwxlnd+NRkCSGe+Ssx86NCHGizcu7rYZjJtzqBclj53
 r5W8DV3IokiHycHwkfLGx7GvawPyJu7LvgeL0v+J5Zub5V9htD1Y7Lvh9xeGR9Cd4EmXY/ZOgOaWpXOFuskI4fyg06+A9NTsUNGJHKcnAJEnkBnNbpMlquh6
 RSPY9OPI6N0AfK25Z0Ua34xg2WwfPoGnKMLfHaEK/11FnxpdlEvGGMBQWw4nEX0/ro4KOZzEG/+iGxGiB8Qu7HaGmA2IF0gVJ8N25ZZqX0btdRWZiCCj9pku
 dZHPYtPI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for read-only requests for the stateless decoder capture
queue in order to test this feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vicodec/vicodec-core.c | 70 +++++++++----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 71928e30dae8..c377d5fdfd07 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -267,6 +267,11 @@ static int device_process(struct vicodec_ctx *ctx,
 	if (ctx->is_stateless) {
 		struct media_request *src_req = src_vb->vb2_buf.req_obj.req;
 
+		/*
+		 * Apply request controls if any.
+		 * The dst_vb queue has read-only requests, so no need to
+		 * setup any controls for that buffer.
+		 */
 		ret = v4l2_ctrl_request_setup(src_req, &ctx->hdl);
 		if (ret)
 			return ret;
@@ -408,11 +413,12 @@ static void device_run(void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct vicodec_q_data *q_src, *q_dst;
 	u32 state;
-	struct media_request *src_req;
+	struct media_request *src_req, *dst_req;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	src_req = src_buf->vb2_buf.req_obj.req;
+	dst_req = dst_buf->vb2_buf.req_obj.req;
 
 	q_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	q_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
@@ -452,6 +458,8 @@ static void device_run(void *priv)
 	spin_unlock(ctx->lock);
 	if (ctx->is_stateless && src_req)
 		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
+	if (ctx->is_stateless && dst_req)
+		v4l2_ctrl_request_complete(dst_req, &ctx->hdl);
 
 	if (ctx->is_enc)
 		v4l2_m2m_job_finish(dev->stateful_enc.m2m_dev, ctx->fh.m2m_ctx);
@@ -1733,6 +1741,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = src_vq->lock;
+	dst_vq->supports_requests = ctx->is_stateless;
+	dst_vq->supports_ro_requests = ctx->is_stateless;
 
 	return vb2_queue_init(dst_vq);
 }
@@ -1910,6 +1920,7 @@ static int vicodec_open(struct file *file)
 	} else if (ctx->is_stateless) {
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->stateless_dec.m2m_dev,
 						    ctx, &queue_init);
+		ctx->fh.m2m_ctx->req_ctrl_handler = hdl;
 		ctx->lock = &dev->stateless_dec.lock;
 	} else {
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->stateful_dec.m2m_dev,
@@ -1952,34 +1963,19 @@ static int vicodec_release(struct file *file)
 
 static int vicodec_request_validate(struct media_request *req)
 {
-	struct media_request_object *obj;
+	struct vb2_buffer *vb = vb2_request_buffer_first(req);
 	struct v4l2_ctrl_handler *parent_hdl, *hdl;
-	struct vicodec_ctx *ctx = NULL;
+	struct vicodec_ctx *ctx;
 	struct v4l2_ctrl *ctrl;
-	unsigned int count;
-
-	list_for_each_entry(obj, &req->objects, list) {
-		struct vb2_buffer *vb;
-
-		if (vb2_request_object_is_buffer(obj)) {
-			vb = container_of(obj, struct vb2_buffer, req_obj);
-			ctx = vb2_get_drv_priv(vb->vb2_queue);
-
-			break;
-		}
-	}
 
-	if (!ctx) {
-		pr_err("No buffer was provided with the request\n");
+	if (!vb) {
+		dev_info(req->mdev->dev,
+			 "No buffer was provided with the request\n");
 		return -ENOENT;
 	}
+	ctx = vb2_get_drv_priv(vb->vb2_queue);
 
-	count = vb2_request_buffer_cnt(req);
-	if (!count) {
-		v4l2_info(&ctx->dev->v4l2_dev,
-			  "No buffer was provided with the request\n");
-		return -ENOENT;
-	} else if (count > 1) {
+	if (vb2_request_buffer_cnt(req) > 1) {
 		v4l2_info(&ctx->dev->v4l2_dev,
 			  "More than one buffer was provided with the request\n");
 		return -EINVAL;
@@ -1987,21 +1983,23 @@ static int vicodec_request_validate(struct media_request *req)
 
 	parent_hdl = &ctx->hdl;
 
-	hdl = v4l2_ctrl_request_hdl_find(req, parent_hdl);
-	if (!hdl) {
-		v4l2_info(&ctx->dev->v4l2_dev, "Missing codec control\n");
-		return -ENOENT;
-	}
-	ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
-					       vicodec_ctrl_stateless_state.id);
-	v4l2_ctrl_request_hdl_put(hdl);
-	if (!ctrl) {
-		v4l2_info(&ctx->dev->v4l2_dev,
-			  "Missing required codec control\n");
-		return -ENOENT;
+	if (vb->vb2_queue->is_output) {
+		hdl = v4l2_ctrl_request_hdl_find(req, parent_hdl);
+		if (!hdl) {
+			v4l2_info(&ctx->dev->v4l2_dev, "Missing codec control\n");
+			return -ENOENT;
+		}
+		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
+						       vicodec_ctrl_stateless_state.id);
+		v4l2_ctrl_request_hdl_put(hdl);
+		if (!ctrl) {
+			v4l2_info(&ctx->dev->v4l2_dev,
+				  "Missing required codec control\n");
+			return -ENOENT;
+		}
 	}
 
-	return vb2_request_validate(req);
+	return v4l2_m2m_request_validate(req);
 }
 
 static const struct v4l2_file_operations vicodec_fops = {
-- 
2.27.0

