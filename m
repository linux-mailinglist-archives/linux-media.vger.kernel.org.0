Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D0B2487CB
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgHROhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50585 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727896AbgHROhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcew1; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=fOG75HIP+EF9pGp26Mn9ojSGNwrexItK78pswOM0QZc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=pXIT/ktyXFYoXCli9QnZt6hwAXt7gnkeBXQ4LlKy4dkVsir81P0oJoDvStx4VTGWx
         KBPPRe9WFkB///IoyWNH8tVnKCto4U/9RHwXl3HsDc8Aq+V3+Kq/scdR8XuUsdhW99
         IVNGhfxXzSNMq1YsTxKzXVtGZyaOB8yxNs++7CveuTlhhStxmmC8OgwcwOS8aAGd7g
         vBx3CF82IulQbCNELR48HiaDMbVZH9aITfB7qR92dS3+F2H/DIDn4Oe6ZAhRA4kLl5
         +U7GY54XTRuZJBg9heUA6Gq57sqJzirIkbuejqwDAkAFizTETr3GgVSvpKb8W5lXGh
         V3h7Hx0sHV8NA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 09/12] v4l2-mem2mem.c: add v4l2_m2m_request_validate()
Date:   Tue, 18 Aug 2020 16:37:16 +0200
Message-Id: <20200818143719.102128-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the new helper function v4l2_m2m_request_validate().

This function adds a control handler object if it is missing
in the request.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 42 +++++++++++++++++++++++---
 include/media/v4l2-mem2mem.h           | 28 ++++++++++++++++-
 2 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 48f87cfe2f63..b8d7746a0c21 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -20,6 +20,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-ctrls.h>
 
 MODULE_DESCRIPTION("Mem to mem device framework for videobuf");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
@@ -1230,6 +1231,35 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_buf_copy_metadata);
 
+int v4l2_m2m_request_validate(struct media_request *req)
+{
+	struct vb2_buffer *vb = vb2_request_buffer_first(req);
+	struct v4l2_m2m_ctx *m2m_ctx;
+	int ret;
+
+	if (!vb)
+		return -ENOENT;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		m2m_ctx = container_of(vb->vb2_queue,
+				       struct v4l2_m2m_ctx,
+				       out_q_ctx.q);
+	else
+		m2m_ctx = container_of(vb->vb2_queue,
+				       struct v4l2_m2m_ctx,
+				       cap_q_ctx.q);
+
+	WARN_ON_ONCE(!m2m_ctx->req_ctrl_handler);
+
+	/*
+	 * Add a control handler object if it was missing in the request.
+	 */
+	ret = v4l2_ctrl_request_add_handler(req, m2m_ctx->req_ctrl_handler,
+					    vb->vb2_queue->supports_ro_requests);
+	return ret ? ret : vb2_request_validate(req);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_request_validate);
+
 void v4l2_m2m_request_queue(struct media_request *req)
 {
 	struct media_request_object *obj, *obj_safe;
@@ -1253,10 +1283,14 @@ void v4l2_m2m_request_queue(struct media_request *req)
 		if (vb2_request_object_is_buffer(obj)) {
 			/* Sanity checks */
 			vb = container_of(obj, struct vb2_buffer, req_obj);
-			WARN_ON(!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type));
-			m2m_ctx_obj = container_of(vb->vb2_queue,
-						   struct v4l2_m2m_ctx,
-						   out_q_ctx.q);
+			if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+							   struct v4l2_m2m_ctx,
+							   out_q_ctx.q);
+			else
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+							   struct v4l2_m2m_ctx,
+							   cap_q_ctx.q);
 			WARN_ON(m2m_ctx && m2m_ctx_obj != m2m_ctx);
 			m2m_ctx = m2m_ctx_obj;
 		}
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 98753f00df7e..e1274d0550d0 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -84,6 +84,8 @@ struct v4l2_m2m_queue_ctx {
  * @last_src_buf: indicate the last source buffer for draining
  * @next_buf_last: next capture queud buffer will be tagged as last
  * @has_stopped: indicate the device has been stopped
+ * @req_ctrl_handler: the control handler to use with requests.
+ *	Must be set when using v4l2_m2m_request_validate().
  * @m2m_dev: opaque pointer to the internal data to handle M2M context
  * @cap_q_ctx: Capture (output to memory) queue context
  * @out_q_ctx: Output (input from memory) queue context
@@ -106,6 +108,7 @@ struct v4l2_m2m_ctx {
 	struct vb2_v4l2_buffer		*last_src_buf;
 	bool				next_buf_last;
 	bool				has_stopped;
+	struct v4l2_ctrl_handler	*req_ctrl_handler;
 
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
@@ -809,8 +812,31 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
 				struct vb2_v4l2_buffer *cap_vb,
 				bool copy_frame_flags);
 
-/* v4l2 request helper */
+/* v4l2 request helpers */
 
+/**
+ * v4l2_m2m_request_validate() - validate the request
+ *
+ * @req: the request
+ *
+ * This validates the request. If the request does not contain a
+ * control handler object, then this object is created. This function
+ * can be set as the media_device req_validate op. If the driver
+ * already requires (and checks) that one or more controls must be present
+ * in the request, then there is no need to use this function.
+ *
+ * If this helper is called, then the driver must set the @req_ctrl_handler
+ * field of struct v4l2_m2m_ctx.
+ */
+int v4l2_m2m_request_validate(struct media_request *req);
+
+/**
+ * v4l2_m2m_request_queue() - queue the request
+ *
+ * @req: the request
+ *
+ * Set this function as the media_device req_queue op.
+ */
 void v4l2_m2m_request_queue(struct media_request *req);
 
 /* v4l2 ioctl helpers */
-- 
2.27.0

