Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727553A2A69
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhFJLi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48209 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230460AbhFJLiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz2lXjUY; Thu, 10 Jun 2021 13:36:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324985; bh=85tFRZIUb4tjOJx8+D9sTtTcNfehYR8loLRNuHcj+M0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=fHMW9APEemfpJ/YQmlzLGi+nIlbw1yaEnbAu94JVmR/cb6KOc7R55T64Hn7g5DHal
         H3t306lurvecJ1WKIcPDvbkNNSmxtswX56RWhrbB3JgPFD912ykZDNFe35qTOAwd32
         lNMeXB73EzQJthUVuzx6niN/dd/sX4Hccr7mEkAuH4us1eAEqPwYA6OUaJqG2WQFtw
         87VeHXJyCvdecWvsGTInO/s78GYyPzsxUS94DOqjWkBvLf2x619trJPlikTulweAqR
         j3B+F8EGW50z0kaUDKDYvejrPMrBzg2LagIqjkTOF9eBUrDoUYMGvRehW0XYvzXiI7
         McEhBwCJr+YWw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 11/11] vicodec: add support for read-only requests
Date:   Thu, 10 Jun 2021 13:36:15 +0200
Message-Id: <20210610113615.785359-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDxK31ooAj0obmUdfQS8J4nbSu/fBMje5dqcNyONF9lq0ZcxAYv/NIEyVvE9C7sxEQlz/1ezU5wmHzkGx9gwm0GG8WHNPDRs+qjNji+NIjlwQhO6JjRc
 7Pqu4iCjn6nXJGmhjURj/v+azToPI8v2j6zrkw9WTuq3wr1Pg1YTPAH2kZC3S/EtdIEMFgb5HFZ9zw8gwZdvn9nJ1Lw6KF5shIGPa4ZMJrSKGPNjo5plI+kH
 Bys6aQAJGuhjfbGeHWAqO7+JUVoXpDMxlEgyR5bxq9DdN6PT07QSy/fedW77G8jtTYIwJ5i0MKhmnGR4ig1mJPyGrGD5jfOsVtld97mpZXZa1v6PjIkUzCl1
 qeXcGb4MAjghzCTxJKs/6sxAd2AQEv9FE9Nj1g6cFq2IVoDZjPKzD1j1gX6A4w4s4S7GIikD
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for read-only requests for the stateless decoder capture
queue in order to test this feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vicodec/vicodec-core.c | 67 +++++++++----------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 33f1c893c1b6..d4d2b9535d05 100644
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
@@ -1728,6 +1736,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = src_vq->lock;
+	dst_vq->supports_requests = ctx->is_stateless;
+	dst_vq->supports_ro_requests = ctx->is_stateless;
 
 	return vb2_queue_init(dst_vq);
 }
@@ -1947,34 +1957,19 @@ static int vicodec_release(struct file *file)
 
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
@@ -1982,18 +1977,20 @@ static int vicodec_request_validate(struct media_request *req)
 
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
 
 	return vb2_request_validate(req);
-- 
2.30.2

