Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080DD1CA3BC
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 08:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgEHGWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 02:22:15 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:18276 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727118AbgEHGWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 02:22:14 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 May 2020 11:52:06 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 May 2020 11:51:57 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 221CD3AD3; Fri,  8 May 2020 11:51:56 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 3/3] Enable Request API for Capture Buffers
Date:   Fri,  8 May 2020 11:51:30 +0530
Message-Id: <1588918890-673-4-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Removed restrictions from V4l2 Framework to allow
  request APIs on Capture buffers.

Change-Id: I9ba37e948eed027344ba2ceb7eb1ff117793ae31
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 +---
 drivers/media/platform/qcom/venus/helpers.c     |  2 +-
 drivers/media/platform/qcom/venus/venc.c        |  6 ++++--
 drivers/media/v4l2-core/v4l2-mem2mem.c          | 17 +++++++++++------
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 5a9ba38..00f6970 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -424,9 +424,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	 * It's easy to forget this callback, but is it important to correctly
 	 * validate the 'field' value at QBUF time.
 	 */
-	if (WARN_ON((q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
-		     q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
-		    !q->ops->buf_out_validate))
+	if (WARN_ON(!q->ops->buf_out_validate))
 		return -EINVAL;
 
 	if (b->request_fd < 0) {
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index c966c24..a27e9bf 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -609,7 +609,7 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 		fdata.filled_len = 0;
 		fdata.offset = 0;
 	}
-	if(req && type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if(req)
 	{
 		ret = v4l2_ctrl_request_setup(req, &inst->ctrl_handler);
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 599cfae..10a07bc 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1085,8 +1085,8 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-	if (buf_type == HFI_BUFFER_INPUT)
-		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req, &inst->ctrl_handler);
+	//if (buf_type == HFI_BUFFER_INPUT)
+	v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req, &inst->ctrl_handler);
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 }
 
@@ -1146,6 +1146,8 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->core->dev;
+	dst_vq->supports_requests = 1;
+	dst_vq->requires_requests = 1;
 	dst_vq->lock = src_vq->lock;
 	ret = vb2_queue_init(dst_vq);
 	if (ret) {
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 19937dd..ffacb29 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -493,12 +493,12 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
-	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	/*if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
 	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
 		dprintk("%s: requests cannot be used with capture buffers\n",
 			__func__);
 		return -EPERM;
-	}
+	}*/
 	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
 	if (!ret && !(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
 		v4l2_m2m_try_schedule(m2m_ctx);
@@ -1019,10 +1019,15 @@ void v4l2_m2m_request_queue(struct media_request *req)
 		if (vb2_request_object_is_buffer(obj)) {
 			/* Sanity checks */
 			vb = container_of(obj, struct vb2_buffer, req_obj);
-			WARN_ON(!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type));
-			m2m_ctx_obj = container_of(vb->vb2_queue,
-						   struct v4l2_m2m_ctx,
-						   out_q_ctx.q);
+			//WARN_ON(!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type));
+			if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+						struct v4l2_m2m_ctx,
+						out_q_ctx.q);
+			else
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+						struct v4l2_m2m_ctx,
+						cap_q_ctx.q);
 			WARN_ON(m2m_ctx && m2m_ctx_obj != m2m_ctx);
 			m2m_ctx = m2m_ctx_obj;
 		}
-- 
1.9.1

