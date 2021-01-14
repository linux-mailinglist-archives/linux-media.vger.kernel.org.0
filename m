Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889A32F6913
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbhANSIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:08:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51508 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbhANSIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:08:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2B42C1F45BDC
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 04/11] media: videobuf2-v4l2: reorganize flags handling
Date:   Thu, 14 Jan 2021 15:07:31 -0300
Message-Id: <20210114180738.1758707-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reorganize flags handling to be easily reuseble when Ext functions get
added.
No logic is changed, just moving around code.

- Two new functions:
	v4l2_clear_buffer_flags()
	vb2_fill_vb2_v4l2_buffer_flags()
- set_buffer_cache_hints() receives a pointer to flags instead of the
  v4l2_buffer object, making it undependent of this struct.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Changes in v6:
- New patch
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 176 ++++++++++--------
 1 file changed, 97 insertions(+), 79 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index bb642c0775d1..aa4f17ec0982 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -174,6 +174,43 @@ static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
 		pr_warn("use the actual size instead.\n");
 }
 
+static void
+vb2_fill_vb2_v4l2_buffer_flags(struct vb2_buffer *vb,
+			       u32 type, u32 field, u32 flags)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	/* Zero flags that we handle */
+	vbuf->flags = flags & ~V4L2_BUFFER_MASK_FLAGS;
+	if (!vb->vb2_queue->copy_timestamp || V4L2_TYPE_IS_CAPTURE(type)) {
+		/*
+		 * Non-COPY timestamps and non-OUTPUT queues will get
+		 * their timestamp and timestamp source flags from the
+		 * queue.
+		 */
+		vbuf->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		/*
+		 * For output buffers mask out the timecode flag:
+		 * this will be handled later in vb2_qbuf().
+		 * The 'field' is valid metadata for this output buffer
+		 * and so that needs to be copied here.
+		 */
+		vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
+		vbuf->field = field;
+		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
+			vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	} else {
+		/* Zero any output buffer flags as this is a capture buffer */
+		vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
+		/* Zero last flag, this is a signal from driver to userspace */
+		vbuf->flags &= ~V4L2_BUF_FLAG_LAST;
+	}
+}
+
 static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b)
 {
 	struct vb2_queue *q = vb->vb2_queue;
@@ -310,41 +347,14 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 
 	}
 
-	/* Zero flags that we handle */
-	vbuf->flags = b->flags & ~V4L2_BUFFER_MASK_FLAGS;
-	if (!vb->vb2_queue->copy_timestamp || V4L2_TYPE_IS_CAPTURE(b->type)) {
-		/*
-		 * Non-COPY timestamps and non-OUTPUT queues will get
-		 * their timestamp and timestamp source flags from the
-		 * queue.
-		 */
-		vbuf->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-	}
-
-	if (V4L2_TYPE_IS_OUTPUT(b->type)) {
-		/*
-		 * For output buffers mask out the timecode flag:
-		 * this will be handled later in vb2_qbuf().
-		 * The 'field' is valid metadata for this output buffer
-		 * and so that needs to be copied here.
-		 */
-		vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
-		vbuf->field = b->field;
-		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
-			vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
-	} else {
-		/* Zero any output buffer flags as this is a capture buffer */
-		vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
-		/* Zero last flag, this is a signal from driver to userspace */
-		vbuf->flags &= ~V4L2_BUF_FLAG_LAST;
-	}
+	vb2_fill_vb2_v4l2_buffer_flags(vb, b->type, b->field, b->flags);
 
 	return 0;
 }
 
 static void set_buffer_cache_hints(struct vb2_queue *q,
 				   struct vb2_buffer *vb,
-				   struct v4l2_buffer *b)
+				   u32 *flags)
 {
 	/*
 	 * DMA exporter should take care of cache syncs, so we can avoid
@@ -370,8 +380,8 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 		 * space hints. That's to indicate to userspace that these
 		 * flags won't work.
 		 */
-		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
-		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
+		*flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		*flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
 		return;
 	}
 
@@ -382,10 +392,10 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 	if (q->dma_dir == DMA_TO_DEVICE)
 		vb->need_cache_sync_on_finish = 0;
 
-	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
+	if (*flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
 		vb->need_cache_sync_on_finish = 0;
 
-	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
+	if (*flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
 		vb->need_cache_sync_on_prepare = 0;
 }
 
@@ -433,7 +443,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	}
 
 	if (!vb->prepared) {
-		set_buffer_cache_hints(q, vb, b);
+		set_buffer_cache_hints(q, vb, &b->flags);
 		/* Copy relevant information provided by the userspace */
 		memset(vbuf->planes, 0,
 		       sizeof(vbuf->planes[0]) * vb->num_planes);
@@ -511,6 +521,58 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	return 0;
 }
 
+/*
+ * Clear any buffer state related flags.
+ */
+static void v4l2_clear_buffer_flags(struct vb2_buffer *vb, u32 *flags,
+				    struct vb2_queue *q,
+				    struct vb2_v4l2_buffer *vbuf,
+				    u32* request_fd)
+{
+	*flags &= ~V4L2_BUFFER_MASK_FLAGS;
+	*flags |= q->timestamp_flags & V4L2_BUF_FLAG_TIMESTAMP_MASK;
+	if (!q->copy_timestamp) {
+		/*
+		 * For non-COPY timestamps, drop timestamp source bits
+		 * and obtain the timestamp source from the queue.
+		 */
+		*flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+		*flags |= q->timestamp_flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	}
+
+	switch (vb->state) {
+	case VB2_BUF_STATE_QUEUED:
+	case VB2_BUF_STATE_ACTIVE:
+		*flags |= V4L2_BUF_FLAG_QUEUED;
+		break;
+	case VB2_BUF_STATE_IN_REQUEST:
+		*flags |= V4L2_BUF_FLAG_IN_REQUEST;
+		break;
+	case VB2_BUF_STATE_ERROR:
+		*flags |= V4L2_BUF_FLAG_ERROR;
+		fallthrough;
+	case VB2_BUF_STATE_DONE:
+		*flags |= V4L2_BUF_FLAG_DONE;
+		break;
+	case VB2_BUF_STATE_PREPARING:
+	case VB2_BUF_STATE_DEQUEUED:
+		/* nothing */
+		break;
+	}
+
+	if ((vb->state == VB2_BUF_STATE_DEQUEUED ||
+	     vb->state == VB2_BUF_STATE_IN_REQUEST) &&
+	    vb->synced && vb->prepared)
+		*flags |= V4L2_BUF_FLAG_PREPARED;
+
+	if (vb2_buffer_in_use(q, vb))
+		*flags |= V4L2_BUF_FLAG_MAPPED;
+	if (vbuf->request_fd >= 0) {
+		*flags |= V4L2_BUF_FLAG_REQUEST_FD;
+		*request_fd = vbuf->request_fd;
+	}
+}
+
 /*
  * __fill_v4l2_buffer() - fill in a struct v4l2_buffer with information to be
  * returned to userspace
@@ -572,51 +634,7 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 			b->m.fd = vb->planes[0].m.fd;
 	}
 
-	/*
-	 * Clear any buffer state related flags.
-	 */
-	b->flags &= ~V4L2_BUFFER_MASK_FLAGS;
-	b->flags |= q->timestamp_flags & V4L2_BUF_FLAG_TIMESTAMP_MASK;
-	if (!q->copy_timestamp) {
-		/*
-		 * For non-COPY timestamps, drop timestamp source bits
-		 * and obtain the timestamp source from the queue.
-		 */
-		b->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-		b->flags |= q->timestamp_flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-	}
-
-	switch (vb->state) {
-	case VB2_BUF_STATE_QUEUED:
-	case VB2_BUF_STATE_ACTIVE:
-		b->flags |= V4L2_BUF_FLAG_QUEUED;
-		break;
-	case VB2_BUF_STATE_IN_REQUEST:
-		b->flags |= V4L2_BUF_FLAG_IN_REQUEST;
-		break;
-	case VB2_BUF_STATE_ERROR:
-		b->flags |= V4L2_BUF_FLAG_ERROR;
-		fallthrough;
-	case VB2_BUF_STATE_DONE:
-		b->flags |= V4L2_BUF_FLAG_DONE;
-		break;
-	case VB2_BUF_STATE_PREPARING:
-	case VB2_BUF_STATE_DEQUEUED:
-		/* nothing */
-		break;
-	}
-
-	if ((vb->state == VB2_BUF_STATE_DEQUEUED ||
-	     vb->state == VB2_BUF_STATE_IN_REQUEST) &&
-	    vb->synced && vb->prepared)
-		b->flags |= V4L2_BUF_FLAG_PREPARED;
-
-	if (vb2_buffer_in_use(q, vb))
-		b->flags |= V4L2_BUF_FLAG_MAPPED;
-	if (vbuf->request_fd >= 0) {
-		b->flags |= V4L2_BUF_FLAG_REQUEST_FD;
-		b->request_fd = vbuf->request_fd;
-	}
+	v4l2_clear_buffer_flags(vb, &b->flags, q, vbuf, &b->request_fd);
 }
 
 /*
-- 
2.29.2

