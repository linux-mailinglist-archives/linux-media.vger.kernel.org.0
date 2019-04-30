Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9519DF20A
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 10:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfD3IbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 04:31:21 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36281 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725769AbfD3IbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 04:31:20 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id LOAUhXlsQb8gSLOAXhFCX5; Tue, 30 Apr 2019 10:31:18 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
Message-ID: <87ad5e5c-088c-c5b6-f653-8936b8f334ab@xs4all.nl>
Date:   Tue, 30 Apr 2019 10:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEz5Kowc0XKGqE0Y4zGN2o4ixX/EUiU3bxkhyG6A85RcFDUPWvzlqIeGbJRCP9bIbqKMEqBvDbEP2tenJc7NtyJEXnbVd1VkrHO44cEprWt5/3DLGBC0
 8S1WFkqUDSzbT6/QtzPqPyowZaARzE46lVJQbdKrdR7jcK6ErXoe2b9LNuqR3Gn1mj7kJkN7tJ9slCcUb8pjn3yPLqCZwskFJj0YYMNItaxKiJdQ8XDgjv+C
 KYzF8bPsVj5FF2O8djyIsrB2M1iM5n2Ycl3KZl3kVxj64gl8Lz2cx32lQqFT5fLK0Q51p6t6oP6BWHQQ5yKyq62J567WJtx2eeCguim6BIZkTxx6PAwTq1Aj
 rmoNFcO8tO0YqQgpfqZk9Zz00MhybJDbtvuJ8BJN95EpeRvkGXDpjU8LfptvZTdCbOo/GZwADltLvIa6QpYofTIx6i/jIg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This RFC patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability and
a v4l2_m2m_release_capture_buf() helper function.

Drivers should set vb2_queue->subsystem_flags to VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
to indicate support for this flag.

At the start of the device_run function drivers should first check if the
current capture buffer should be released:

if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
	v4l2_m2m_job_finish(...);
	return;
}

And at the end they should check (out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
and, if set, skip returning the capture buffer to vb2.

This has only been compile tested, and this is missing the documentation. I would
like to know if this works in a real driver first before turning this into a proper
patch series.

Regards,

	Hans

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index fb9ac7696fc6..83372de9b815 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -50,7 +50,8 @@ module_param(debug, int, 0644);
 				 V4L2_BUF_FLAG_TIMESTAMP_MASK)
 /* Output buffer flags that should be passed on to the driver */
 #define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME | \
-				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
+				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
+				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)

 /*
  * __verify_planes_array() - verify that the planes array passed in struct
@@ -321,6 +322,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 		 */
 		vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
 		vbuf->field = b->field;
+		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
+			vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	} else {
 		/* Zero any output buffer flags as this is a capture buffer */
 		vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
@@ -659,6 +662,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_USERPTR;
 	if (q->io_modes & VB2_DMABUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
+	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index bb3e63d6bd1a..6af1d519938f 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -648,6 +648,38 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
 				struct vb2_v4l2_buffer *cap_vb,
 				bool copy_frame_flags);

+/**
+ * v4l2_m2m_release_capture_buf() - check if the capture buffer should be
+ * released
+ *
+ * @out_vb: the output buffer
+ * @cap_vb: the capture buffer
+ *
+ * This helper function returns true if the current capture buffer should
+ * be released to vb2. This is the case if the output buffer specified that
+ * the capture buffer should be held (i.e. not returned to vb2) AND if the
+ * timestamp of the capture buffer differs from the output buffer timestamp.
+ *
+ * This helper is to be called at the start of the device_run callback:
+ *
+ * if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
+ *	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+ *	v4l2_m2m_job_finish(...);
+ *	return;
+ * }
+ *
+ * This allows for multiple output buffers to be used to fill in a single
+ * capture buffer. This is typically used by stateless decoders where
+ * multiple e.g. H.264 slices contribute to a single decoded frame.
+ */
+static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_buffer *out_vb,
+						const struct vb2_v4l2_buffer *cap_vb)
+{
+	return (out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) &&
+		cap_vb->vb2_buf.copied_timestamp &&
+		out_vb->vb2_buf.timestamp != cap_vb->vb2_buf.timestamp;
+}
+
 /* v4l2 request helper */

 void v4l2_m2m_request_queue(struct media_request *req);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 22f3ff76a8b5..e9d99023c637 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -504,6 +504,8 @@ struct vb2_buf_ops {
  * @buf_ops:	callbacks to deliver buffer information.
  *		between user-space and kernel-space.
  * @drv_priv:	driver private data.
+ * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). Not used
+ *		by the vb2 core.
  * @buf_struct_size: size of the driver-specific buffer structure;
  *		"0" indicates the driver doesn't want to use a custom buffer
  *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
@@ -570,6 +572,7 @@ struct vb2_queue {
 	const struct vb2_buf_ops	*buf_ops;

 	void				*drv_priv;
+	u32				subsystem_flags;
 	unsigned int			buf_struct_size;
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 8a10889dc2fd..4e52427a4114 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -49,6 +49,9 @@ struct vb2_v4l2_buffer {
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 };

+/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
+#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
+
 /*
  * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_buffer *
  */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..26925d63ea05 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -907,11 +907,12 @@ struct v4l2_requestbuffers {
 };

 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
-#define V4L2_BUF_CAP_SUPPORTS_MMAP	(1 << 0)
-#define V4L2_BUF_CAP_SUPPORTS_USERPTR	(1 << 1)
-#define V4L2_BUF_CAP_SUPPORTS_DMABUF	(1 << 2)
-#define V4L2_BUF_CAP_SUPPORTS_REQUESTS	(1 << 3)
-#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS (1 << 4)
+#define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
+#define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
+#define V4L2_BUF_CAP_SUPPORTS_DMABUF			(1 << 2)
+#define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
+#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
+#define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)

 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -1033,6 +1034,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_IN_REQUEST		0x00000080
 /* timecode field is valid */
 #define V4L2_BUF_FLAG_TIMECODE			0x00000100
+/* Don't return the capture buffer until OUTPUT timestamp changes */
+#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF	0x00000200
 /* Buffer is prepared for queuing */
 #define V4L2_BUF_FLAG_PREPARED			0x00000400
 /* Cache handling flags */
