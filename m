Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2210102333
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfKSLfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:35:01 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56437 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728276AbfKSLfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:35:01 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1mbiD68Hcs92X1mdiz4T2; Tue, 19 Nov 2019 12:34:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163299; bh=ab8zfkJMITpObbt1i394hW56VfOiIBp5Gr5rdYtMVrs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ceS+0oZChAS6Jc/kEUShkswlIuYlthq/cYAylGMqXNUjmxsMJgXSi+EtUjmSf4fV5
         mHV79oWGrYjjqLLFv+IoqdM0uKjGVb7KpGTIoPMfEeRv/1U9oz6wWIWa4ArOHB/14J
         gje3EDW7bsZ9UM2hZZiUru5SbRZUOIYyivLLJzHUxrVYvuvcFVWNnMdv+az2/d1P9Z
         JrNPkcdLGitqD47FWAdP+pGQjaxkoeCV6Wt0cTDC6TP88Z3eOCIs3nfp0BacLc0df7
         TDShYhjNiR6YuLKuXa0K7A2J2Hc9uliFBuMiK0EK8UGfhl24y8oyH8JqTu1XZdN6Sj
         HMn5LTk5nBapg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/5] videodev2.h: add V4L2_BUF_FLAG_TOO_SMALL flag
Date:   Tue, 19 Nov 2019 12:34:56 +0100
Message-Id: <20191119113457.57833-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3Y7RpXC/Wtf53twy38gnVrmrCf/NxR/mfk5WuOJGz6yvR4rJaOru7QsBt0gc21ygyDJ44w6zvd7OpHENeWMom0uyt5K8y3Vs0NwCrvfM0oB02g0VYV
 lLoX1MSSe/JZ+jXSUHM+DPkUXVtXG9IXkgelmJVvZ1rQrfwMTjkPJfDvHGug6W+diFRvHrFkX2KGnW3jdDRdlbHDIwPFG3YFfKyU/zWDiXliri8tsyFV2T/b
 EvYh774a3AWXTOZpI2S452Uo8/RiYj0KTaKKpHhZVRHsyAWaJDLNaCr1U0F226NFPScRVlvYjtJxZUI6VQCP0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stateful encoders need to know if V4L2_BUF_FLAG_ERROR was because
the capture buffer was too small or because there was another
error. Set this flag (always in combination with FLAG_ERROR) to
indicate that the buffer was too small.

A corresponding VB2_BUF_STATE_ERROR_TOO_SMALL vb2 state was added.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/buffer.rst         |  9 +++++++++
 drivers/media/common/videobuf2/videobuf2-core.c | 12 +++++++++---
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++++
 include/media/videobuf2-core.h                  |  4 ++++
 include/uapi/linux/videodev2.h                  |  2 ++
 5 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 9149b57728e5..64a97677ec20 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -540,6 +540,15 @@ Buffer Flags
 	streaming may continue as normal and the buffer may be reused
 	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
 	called.
+    * .. _`V4L2-BUF-FLAG-TOO-SMALL`:
+
+      - ``V4L2_BUF_FLAG_TOO_SMALL``
+      - 0x00080000
+      - When this flag is set, the buffer has been dequeued successfully,
+	but no data was written since the buffer was too small. If this
+	flag is set, then ``V4L2_BUF_FLAG_ERROR`` was also set. This can
+	only happen for capture buffers. Drivers set this flag when
+	the ``VIDIOC_DQBUF`` ioctl is called.
     * .. _`V4L2-BUF-FLAG-IN-REQUEST`:
 
       - ``V4L2_BUF_FLAG_IN_REQUEST``
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..187a4589a7bb 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -929,6 +929,7 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 
 	if (WARN_ON(state != VB2_BUF_STATE_DONE &&
 		    state != VB2_BUF_STATE_ERROR &&
+		    state != VB2_BUF_STATE_ERROR_TOO_SMALL &&
 		    state != VB2_BUF_STATE_QUEUED))
 		state = VB2_BUF_STATE_ERROR;
 
@@ -1816,6 +1817,9 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	case VB2_BUF_STATE_ERROR:
 		dprintk(3, "returning done buffer with errors\n");
 		break;
+	case VB2_BUF_STATE_ERROR_TOO_SMALL:
+		dprintk(3, "returning done buffer that's too small\n");
+		break;
 	default:
 		dprintk(1, "invalid buffer state\n");
 		return -EINVAL;
@@ -2383,8 +2387,9 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
 					done_entry);
 	spin_unlock_irqrestore(&q->done_lock, flags);
 
-	if (vb && (vb->state == VB2_BUF_STATE_DONE
-			|| vb->state == VB2_BUF_STATE_ERROR)) {
+	if (vb && (vb->state == VB2_BUF_STATE_DONE ||
+		   vb->state == VB2_BUF_STATE_ERROR ||
+		   vb->state == VB2_BUF_STATE_ERROR_TOO_SMALL)) {
 		return (q->is_output) ?
 				EPOLLOUT | EPOLLWRNORM :
 				EPOLLIN | EPOLLRDNORM;
@@ -2812,7 +2817,8 @@ static int vb2_thread(void *data)
 			break;
 		try_to_freeze();
 
-		if (vb->state != VB2_BUF_STATE_ERROR)
+		if (vb->state != VB2_BUF_STATE_ERROR &&
+		    vb->state != VB2_BUF_STATE_ERROR_TOO_SMALL)
 			if (threadio->fnc(vb, threadio->priv))
 				break;
 		call_void_qop(q, wait_finish, q);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index e652f4318284..6ac19734e4a2 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -44,6 +44,7 @@ module_param(debug, int, 0644);
 /* Flags that are set by us */
 #define V4L2_BUFFER_MASK_FLAGS	(V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_QUEUED | \
 				 V4L2_BUF_FLAG_DONE | V4L2_BUF_FLAG_ERROR | \
+				 V4L2_BUF_FLAG_ERROR_TOO_SMALL | \
 				 V4L2_BUF_FLAG_PREPARED | \
 				 V4L2_BUF_FLAG_IN_REQUEST | \
 				 V4L2_BUF_FLAG_REQUEST_FD | \
@@ -546,6 +547,9 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 	case VB2_BUF_STATE_IN_REQUEST:
 		b->flags |= V4L2_BUF_FLAG_IN_REQUEST;
 		break;
+	case VB2_BUF_STATE_ERROR_TOO_SMALL:
+		b->flags |= V4L2_BUF_FLAG_TOO_SMALL;
+		/* fall through */
 	case VB2_BUF_STATE_ERROR:
 		b->flags |= V4L2_BUF_FLAG_ERROR;
 		/* fall through */
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index a2b2208b02da..289c3e090257 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -215,6 +215,9 @@ enum vb2_io_modes {
  * @VB2_BUF_STATE_ERROR:	same as above, but the operation on the buffer
  *				has ended with an error, which will be reported
  *				to the userspace when it is dequeued.
+ * @VB2_BUF_STATE_ERROR_TOO_SMALL: same as above, but the operation on the buffer
+ *				has ended with an error because the receiving buffer
+ *				is too small.
  */
 enum vb2_buffer_state {
 	VB2_BUF_STATE_DEQUEUED,
@@ -224,6 +227,7 @@ enum vb2_buffer_state {
 	VB2_BUF_STATE_ACTIVE,
 	VB2_BUF_STATE_DONE,
 	VB2_BUF_STATE_ERROR,
+	VB2_BUF_STATE_ERROR_TOO_SMALL,
 };
 
 struct vb2_queue;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 7aa1293ac7bc..c7c1179eea65 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1064,6 +1064,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE		0x00010000
+/* mem2mem encoder */
+#define V4L2_BUF_FLAG_TOO_SMALL			0x00080000
 /* mem2mem encoder/decoder */
 #define V4L2_BUF_FLAG_LAST			0x00100000
 /* request_fd is valid */
-- 
2.23.0

