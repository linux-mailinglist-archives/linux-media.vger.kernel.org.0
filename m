Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 549C3D3C5C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfJKJct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:32:49 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55371 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726885AbfJKJct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:32:49 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrHxixmWhjZ8vIrHyiRKiy; Fri, 11 Oct 2019 11:32:47 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 1/6] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
Date:   Fri, 11 Oct 2019 11:32:40 +0200
Message-Id: <20191011093245.33366-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
References: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFv/7qNpfmVbnIJ/xmr9gUdIdi33yDJQ9mfG03ySrqcndY7GpTCgB697IjgR55ob4jHfPPDO4c9aONuhGHEiQ7rnoWv/4S4l8pcVM924VrlxEGQ+L3dy
 qnbf4xhH17soiy8VW29pfyad9zvbR0J3fbb9jtxuoQdRYonjlnmay+mx33L/H3gv5xCmWj5c4h1k41m2Tsigb40BP5Vg78WSoP7419I/qum8VgjJhuKPQjRi
 jwuq5xlDzGP+BM9B2lFR3cZE6NA2IQtS1GX+QOdViC1TzYluBVjwU6JQa2eY3wumNYT/FhTdc4OFhz1P35hC5TIthxgB0Q047qfUteJJ+dDhIokqxyzKH1uB
 ndrhrBUeNslspSbo2b6tWOJ0rQbNLLJLDwdgau6m6Ihy6NUZUZFHTUToMscci/8ahnir24A3QRc94tQQvXroC+NA2K4/DyS806T881DbD+r2BVp0vjmHrP3x
 LaIs/YVYpO95jPGC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.

Drivers should set vb2_queue->subsystem_flags to
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF to indicate support for this flag.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/buffer.rst         | 13 +++++++++++++
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst |  6 ++++++
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 12 ++++++++++--
 include/media/videobuf2-core.h                  |  3 +++
 include/media/videobuf2-v4l2.h                  |  5 +++++
 include/uapi/linux/videodev2.h                  | 13 ++++++++-----
 6 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 1cbd9cde57f3..9149b57728e5 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -607,6 +607,19 @@ Buffer Flags
 	applications shall use this flag for output buffers if the data in
 	this buffer has not been created by the CPU but by some
 	DMA-capable unit, in which case caches have not been used.
+    * .. _`V4L2-BUF-FLAG-M2M-HOLD-CAPTURE-BUF`:
+
+      - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
+      - 0x00000200
+      - Only valid if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
+	set. It is typically used with stateless decoders where multiple
+	output buffers each decode to a slice of the decoded frame.
+	Applications can set this flag when queueing the output buffer
+	to prevent the driver from dequeueing the capture buffer after
+	the output buffer has been decoded (i.e. the capture buffer is
+	'held'). If the timestamp of this output buffer differs from that
+	of the previous output buffer, then that indicates the start of a
+	new frame and the previously held capture buffer is dequeued.
     * .. _`V4L2-BUF-FLAG-LAST`:
 
       - ``V4L2_BUF_FLAG_LAST``
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index d7faef10e39b..d0c643db477a 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -125,6 +125,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-DMABUF:
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
+.. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
 
 .. cssclass:: longtable
 
@@ -150,6 +151,11 @@ aborting or finishing any DMA in progress, an implicit
       - The kernel allows calling :ref:`VIDIOC_REQBUFS` while buffers are still
         mapped or exported via DMABUF. These orphaned buffers will be freed
         when they are unmapped or when the exported DMABUF fds are closed.
+    * - ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF``
+      - 0x00000020
+      - Only valid for stateless decoders. If set, then userspace can set the
+        ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
+	capture buffer until the OUTPUT timestamp changes.
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 5a9ba3846f0a..e652f4318284 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -49,8 +49,11 @@ module_param(debug, int, 0644);
 				 V4L2_BUF_FLAG_REQUEST_FD | \
 				 V4L2_BUF_FLAG_TIMESTAMP_MASK)
 /* Output buffer flags that should be passed on to the driver */
-#define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME | \
-				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
+#define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | \
+				 V4L2_BUF_FLAG_BFRAME | \
+				 V4L2_BUF_FLAG_KEYFRAME | \
+				 V4L2_BUF_FLAG_TIMECODE | \
+				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
 
 /*
  * __verify_planes_array() - verify that the planes array passed in struct
@@ -194,6 +197,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	}
 	vbuf->sequence = 0;
 	vbuf->request_fd = -1;
+	vbuf->is_held = false;
 
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
 		switch (b->memory) {
@@ -321,6 +325,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 		 */
 		vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
 		vbuf->field = b->field;
+		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
+			vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	} else {
 		/* Zero any output buffer flags as this is a capture buffer */
 		vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
@@ -654,6 +660,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_USERPTR;
 	if (q->io_modes & VB2_DMABUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
+	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 640aabe69450..a2b2208b02da 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -505,6 +505,8 @@ struct vb2_buf_ops {
  * @buf_ops:	callbacks to deliver buffer information.
  *		between user-space and kernel-space.
  * @drv_priv:	driver private data.
+ * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). Not used
+ *		by the vb2 core.
  * @buf_struct_size: size of the driver-specific buffer structure;
  *		"0" indicates the driver doesn't want to use a custom buffer
  *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
@@ -571,6 +573,7 @@ struct vb2_queue {
 	const struct vb2_buf_ops	*buf_ops;
 
 	void				*drv_priv;
+	u32				subsystem_flags;
 	unsigned int			buf_struct_size;
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 8a10889dc2fd..59bf33a12648 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -33,6 +33,7 @@
  * @timecode:	frame timecode.
  * @sequence:	sequence count of this frame.
  * @request_fd:	the request_fd associated with this buffer
+ * @is_held:	if true, then this capture buffer was held
  * @planes:	plane information (userptr/fd, length, bytesused, data_offset).
  *
  * Should contain enough information to be able to cover all the fields
@@ -46,9 +47,13 @@ struct vb2_v4l2_buffer {
 	struct v4l2_timecode	timecode;
 	__u32			sequence;
 	__s32			request_fd;
+	bool			is_held;
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 };
 
+/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
+#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
+
 /*
  * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_buffer *
  */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b3c0961b62a0..9f4e66affac4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -920,11 +920,12 @@ struct v4l2_requestbuffers {
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
@@ -1046,6 +1047,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_IN_REQUEST		0x00000080
 /* timecode field is valid */
 #define V4L2_BUF_FLAG_TIMECODE			0x00000100
+/* Don't return the capture buffer until OUTPUT timestamp changes */
+#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF	0x00000200
 /* Buffer is prepared for queuing */
 #define V4L2_BUF_FLAG_PREPARED			0x00000400
 /* Cache handling flags */
-- 
2.23.0

