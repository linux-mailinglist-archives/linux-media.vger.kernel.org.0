Return-Path: <linux-media+bounces-12476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD358D85FC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 17:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40CF42839A7
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D6130A79;
	Mon,  3 Jun 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ILUpDM7g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576D1304AB
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717428374; cv=none; b=AX8l6BQjmFDa4beG259jkm5EBVgIZkhf+Fv8zdHi/pz4X/9mSIeuJUl910oGY6Oj5C61ZH/RiOSAA4NLlFRlnQi1NN3RnRmO6KgPbkrN9wZpARpr/2PqpxIa1LX3wNXui5JlPmFjNCuzYavPkUOV7COj0JYY7DCyN5mmXoQQVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717428374; c=relaxed/simple;
	bh=y4loEvae4OFBUxudyLwugcLcy6esOC6dL1h0jU794tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9vGqKvW9RtXet57QP5nPfJXgZywCGNzad5iMCYkjlZoyYQUL7M1g5AjM2F/uy96J/8XfSEyW9RFfZ9JSXlCMgH1P77zow4axPoCPnXJHrf3fLCVgx7toZEv0V4x29EM3huX1ejr+TRIxCbTQZxIbGjAr3oSRiPg9UMM0q0te+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ILUpDM7g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A72EA38;
	Mon,  3 Jun 2024 17:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717428357;
	bh=y4loEvae4OFBUxudyLwugcLcy6esOC6dL1h0jU794tA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ILUpDM7gh/vqdcViDvEP30KqsVUrU6/6fLhdqvhw8Y2JH6b7XKLkbVaX3Qo3WiQ+4
	 TixtPqn8LpPDXS4tWku82MyJeJXwDtoMaPkAiMNZZ5A29QdktHbyRXBPXE50DkbWQi
	 2t2sCWlXj5JuOTA2NpAeC3F2ICX9PqmE/twvIvW0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [RFC 2/3] media: Allow drivers to overwrite vb2_queue.buf_ops
Date: Mon,  3 Jun 2024 17:25:46 +0200
Message-ID: <20240603152548.107158-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'struct vb2_queue.buf_ops' operations are described as
'driver specific callbacks' in the 'struct vb2_buf_ops' documentation
but are actually not overridable by drivers.

Allow driver to override the operations by:

1) Exporting core helper function with the vb2_buf_ naming
2) Conditionally set 'struct vb2_queue.buf_ops' in
   'vb2_queue_init_name()' only if the driver has not set it already
   at queue initialization time

As the videobuf2 framework assumes all the operations to be available,
drivers that are willing to ovveride vb2_queue.buf_ops shall

1) Populate all members of 'struct vb2_buf_ops'
2) Call the core helper as part of their implementations, before or
   after the driver-specific bits
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++--------
 include/media/videobuf2-core.h                |  7 ++++
 include/media/videobuf2-v4l2.h                |  8 +++++
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c575198e8354..30e04ed2e3a5 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -83,10 +83,11 @@ static int __verify_planes_array(struct vb2_buffer *vb, const struct v4l2_buffer
 	return 0;
 }
 
-static int __verify_planes_array_core(struct vb2_buffer *vb, const void *pb)
+int vb2_buf_verify_planes_array(struct vb2_buffer *vb, const void *pb)
 {
 	return __verify_planes_array(vb, pb);
 }
+EXPORT_SYMBOL_GPL(vb2_buf_verify_planes_array);
 
 /*
  * __verify_length() - Verify that the bytesused value for each plane fits in
@@ -129,16 +130,17 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 }
 
 /*
- * __init_vb2_v4l2_buffer() - initialize the vb2_v4l2_buffer struct
+ * vb2_buf_init_buffer() - initialize the vb2_v4l2_buffer struct
  */
-static void __init_vb2_v4l2_buffer(struct vb2_buffer *vb)
+void vb2_buf_init_buffer(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 
 	vbuf->request_fd = -1;
 }
+EXPORT_SYMBOL_GPL(vb2_buf_init_buffer);
 
-static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
+void vb2_buf_copy_timestamp(struct vb2_buffer *vb, const void *pb)
 {
 	const struct v4l2_buffer *b = pb;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -156,6 +158,7 @@ static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
 			vbuf->timecode = b->timecode;
 	}
 };
+EXPORT_SYMBOL_GPL(vb2_buf_copy_timestamp);
 
 static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
 {
@@ -473,10 +476,10 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 }
 
 /*
- * __fill_v4l2_buffer() - fill in a struct v4l2_buffer with information to be
+ * vb2_buf_fill_v4l2_buffer() - fill in a struct v4l2_buffer with information to be
  * returned to userspace
  */
-static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
+void vb2_buf_fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 {
 	struct v4l2_buffer *b = pb;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,13 +582,14 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 		b->request_fd = vbuf->request_fd;
 	}
 }
+EXPORT_SYMBOL_GPL(vb2_buf_fill_v4l2_buffer);
 
 /*
- * __fill_vb2_buffer() - fill a vb2_buffer with information provided in a
+ * vb2_buf_fill_vb2_buffer() - fill a vb2_buffer with information provided in a
  * v4l2_buffer by the userspace. It also verifies that struct
  * v4l2_buffer has a valid number of planes.
  */
-static int __fill_vb2_buffer(struct vb2_buffer *vb, struct vb2_plane *planes)
+int vb2_buf_fill_vb2_buffer(struct vb2_buffer *vb, struct vb2_plane *planes)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	unsigned int plane;
@@ -603,13 +607,14 @@ static int __fill_vb2_buffer(struct vb2_buffer *vb, struct vb2_plane *planes)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vb2_buf_fill_vb2_buffer);
 
 static const struct vb2_buf_ops v4l2_buf_ops = {
-	.verify_planes_array	= __verify_planes_array_core,
-	.init_buffer		= __init_vb2_v4l2_buffer,
-	.fill_user_buffer	= __fill_v4l2_buffer,
-	.fill_vb2_buffer	= __fill_vb2_buffer,
-	.copy_timestamp		= __copy_timestamp,
+	.verify_planes_array	= vb2_buf_verify_planes_array,
+	.init_buffer		= vb2_buf_init_buffer,
+	.fill_user_buffer	= vb2_buf_fill_v4l2_buffer,
+	.fill_vb2_buffer	= vb2_buf_fill_vb2_buffer,
+	.copy_timestamp		= vb2_buf_copy_timestamp,
 };
 
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
@@ -921,7 +926,8 @@ int vb2_queue_init_name(struct vb2_queue *q, const char *name)
 	if (q->buf_struct_size == 0)
 		q->buf_struct_size = sizeof(struct vb2_v4l2_buffer);
 
-	q->buf_ops = &v4l2_buf_ops;
+	if (!q->buf_ops)
+		q->buf_ops = &v4l2_buf_ops;
 	q->is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(q->type);
 	q->is_output = V4L2_TYPE_IS_OUTPUT(q->type);
 	q->copy_timestamp = (q->timestamp_flags & V4L2_BUF_FLAG_TIMESTAMP_MASK)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 8b86996b2719..6f8df9acf6a2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -455,6 +455,13 @@ struct vb2_ops {
 /**
  * struct vb2_buf_ops - driver-specific callbacks.
  *
+ * These operations are called by the videobuf2 framework unconditionally.
+ * Drivers are allowed to override some of the operations but shall:
+ *
+ * a) Populate all the members of this structure
+ * b) Call the generic core helper as part of their own implementations (see
+ *    vb2_buf_* helpers in videobuf2-v4l2.h)
+ *
  * @verify_planes_array: Verify that a given user space structure contains
  *			enough planes for the buffer. This is called
  *			for each dequeued buffer.
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 5a845887850b..7c6cea933e28 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -383,6 +383,14 @@ void vb2_ops_wait_prepare(struct vb2_queue *vq);
  */
 void vb2_ops_wait_finish(struct vb2_queue *vq);
 
+/* struct vb2_buf_ops helpers */
+
+int vb2_buf_verify_planes_array(struct vb2_buffer *vb, const void *pb);
+void vb2_buf_init_buffer(struct vb2_buffer *vb);
+void vb2_buf_fill_v4l2_buffer(struct vb2_buffer *vb, void *pb);
+int vb2_buf_fill_vb2_buffer(struct vb2_buffer *vb, struct vb2_plane *planes);
+void vb2_buf_copy_timestamp(struct vb2_buffer *vb, const void *pb);
+
 struct media_request;
 int vb2_request_validate(struct media_request *req);
 void vb2_request_queue(struct media_request *req);
-- 
2.45.1


