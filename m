Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE419A04F
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392136AbfHVTpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:15 -0400
Received: from mailoutvs32.siol.net ([185.57.226.223]:56070 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732015AbfHVTpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B63495249EF;
        Thu, 22 Aug 2019 21:45:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gAv2Nio5_ecb; Thu, 22 Aug 2019 21:45:12 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id B32D452481F;
        Thu, 22 Aug 2019 21:45:11 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id BE0045249EF;
        Thu, 22 Aug 2019 21:45:08 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se, Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 1/8] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
Date:   Thu, 22 Aug 2019 21:44:53 +0200
Message-Id: <20190822194500.2071-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability =
and
a v4l2_m2m_release_capture_buf() helper function.

Drivers should set vb2_queue->subsystem_flags to
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF to indicate support for this fl=
ag.

The device_run() function should look like this:

if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
	v4l2_m2m_dst_buf_remove(m2m_ctx);
	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
	cap_vb =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
}
cap_vb->is_held =3D out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;

...

v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
if (!cap_vb->is_held) {
	v4l2_m2m_dst_buf_remove(m2m_ctx);
	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
}

In order to handle the corner case where V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_B=
UF
is always set for the output buffer, and you reached the last frame (so n=
o
new output buffer will be queued with a new timestamp), the driver must
implement support for the V4L2_DEC_CMD_FLUSH command, and that should do:

struct vb2_v4l2_buffer *out_vb =3D v4l2_m2m_last_src_buf(m2m_ctx);
struct vb2_v4l2_buffer *cap_vb =3D v4l2_m2m_last_dst_buf(m2m_ctx);

if (out_vb)
	out_vb->flags &=3D ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
else if (cap_vb && cap_vb->is_held)
	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);

For formats that do not support slicing (e.g. VP8), the FLUSH command
just does nothing.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
[Adjust example code]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/media/uapi/v4l/buffer.rst       | 13 ++++++
 .../media/uapi/v4l/vidioc-reqbufs.rst         |  6 +++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
 include/media/v4l2-mem2mem.h                  | 42 +++++++++++++++++++
 include/media/videobuf2-core.h                |  3 ++
 include/media/videobuf2-v4l2.h                |  5 +++
 include/uapi/linux/videodev2.h                | 13 +++---
 7 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/medi=
a/uapi/v4l/buffer.rst
index 1cbd9cde57f3..afb03906ead9 100644
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
+        set. It is typically used with stateless decoders where multiple
+	output buffers each decode to a slice of the decoded frame.
+	Applications can set this flag when queueing the output buffer
+	to prevent the driver from dequeueing the capture buffer after
+	the output buffer has been decoded (i.e. the capture buffer is
+	'held'). If the timestamp of this output buffer differs from that
+	of the previous output buffer, then that indicates the start of a
+	new frame and the previously held capture buffer is dequeued.
     * .. _`V4L2-BUF-FLAG-LAST`:
=20
       - ``V4L2_BUF_FLAG_LAST``
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentat=
ion/media/uapi/v4l/vidioc-reqbufs.rst
index d7faef10e39b..d0c643db477a 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -125,6 +125,7 @@ aborting or finishing any DMA in progress, an implici=
t
 .. _V4L2-BUF-CAP-SUPPORTS-DMABUF:
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
+.. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
=20
 .. cssclass:: longtable
=20
@@ -150,6 +151,11 @@ aborting or finishing any DMA in progress, an implic=
it
       - The kernel allows calling :ref:`VIDIOC_REQBUFS` while buffers ar=
e still
         mapped or exported via DMABUF. These orphaned buffers will be fr=
eed
         when they are unmapped or when the exported DMABUF fds are close=
d.
+    * - ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF``
+      - 0x00000020
+      - Only valid for stateless decoders. If set, then userspace can se=
t the
+        ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on retur=
ning the
+	capture buffer until the OUTPUT timestamp changes.
=20
 Return Value
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
index 5a9ba3846f0a..699787f48f46 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -50,7 +50,8 @@ module_param(debug, int, 0644);
 				 V4L2_BUF_FLAG_TIMESTAMP_MASK)
 /* Output buffer flags that should be passed on to the driver */
 #define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRA=
ME | \
-				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
+				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
+				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
=20
 /*
  * __verify_planes_array() - verify that the planes array passed in stru=
ct
@@ -194,6 +195,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer=
 *vb, struct v4l2_buffer *b
 	}
 	vbuf->sequence =3D 0;
 	vbuf->request_fd =3D -1;
+	vbuf->is_held =3D false;
=20
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
 		switch (b->memory) {
@@ -321,6 +323,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer=
 *vb, struct v4l2_buffer *b
 		 */
 		vbuf->flags &=3D ~V4L2_BUF_FLAG_TIMECODE;
 		vbuf->field =3D b->field;
+		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
+			vbuf->flags &=3D ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	} else {
 		/* Zero any output buffer flags as this is a capture buffer */
 		vbuf->flags &=3D ~V4L2_BUFFER_OUT_FLAGS;
@@ -654,6 +658,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *c=
aps)
 		*caps |=3D V4L2_BUF_CAP_SUPPORTS_USERPTR;
 	if (q->io_modes & VB2_DMABUF)
 		*caps |=3D V4L2_BUF_CAP_SUPPORTS_DMABUF;
+	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
+		*caps |=3D V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |=3D V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 0b9c3a287061..c9fa96c8eed1 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -644,6 +644,48 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l=
2_buffer *out_vb,
 				struct vb2_v4l2_buffer *cap_vb,
 				bool copy_frame_flags);
=20
+/**
+ * v4l2_m2m_release_capture_buf() - check if the capture buffer should b=
e
+ * released
+ *
+ * @out_vb: the output buffer
+ * @cap_vb: the capture buffer
+ *
+ * This helper function returns true if the current capture buffer shoul=
d
+ * be released to vb2. This is the case if the output buffer specified t=
hat
+ * the capture buffer should be held (i.e. not returned to vb2) AND if t=
he
+ * timestamp of the capture buffer differs from the output buffer timest=
amp.
+ *
+ * This helper is to be called at the start of the device_run callback:
+ *
+ * .. code-block:: c
+ *
+ *	if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
+ *		v4l2_m2m_dst_buf_remove(m2m_ctx);
+ *		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+ *		cap_vb =3D v4l2_m2m_next_dst_buf(m2m_ctx);
+ *	}
+ *	cap_vb->is_held =3D out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BU=
F;
+ *
+ *	...
+ *
+ *	v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
+ *	if (!cap_vb->is_held) {
+ *		v4l2_m2m_dst_buf_remove(m2m_ctx);
+ *		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+ *	}
+ *
+ * This allows for multiple output buffers to be used to fill in a singl=
e
+ * capture buffer. This is typically used by stateless decoders where
+ * multiple e.g. H.264 slices contribute to a single decoded frame.
+ */
+static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_bu=
ffer *out_vb,
+						const struct vb2_v4l2_buffer *cap_vb)
+{
+	return cap_vb->is_held && cap_vb->vb2_buf.copied_timestamp &&
+	       out_vb->vb2_buf.timestamp !=3D cap_vb->vb2_buf.timestamp;
+}
+
 /* v4l2 request helper */
=20
 void v4l2_m2m_request_queue(struct media_request *req);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
index 640aabe69450..a2b2208b02da 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -505,6 +505,8 @@ struct vb2_buf_ops {
  * @buf_ops:	callbacks to deliver buffer information.
  *		between user-space and kernel-space.
  * @drv_priv:	driver private data.
+ * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). No=
t used
+ *		by the vb2 core.
  * @buf_struct_size: size of the driver-specific buffer structure;
  *		"0" indicates the driver doesn't want to use a custom buffer
  *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
@@ -571,6 +573,7 @@ struct vb2_queue {
 	const struct vb2_buf_ops	*buf_ops;
=20
 	void				*drv_priv;
+	u32				subsystem_flags;
 	unsigned int			buf_struct_size;
 	u32				timestamp_flags;
 	gfp_t				gfp_flags;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l=
2.h
index 8a10889dc2fd..13ab101864aa 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -33,6 +33,7 @@
  * @timecode:	frame timecode.
  * @sequence:	sequence count of this frame.
  * @request_fd:	the request_fd associated with this buffer
+ * @is_held:	if true, then this buffer was held
  * @planes:	plane information (userptr/fd, length, bytesused, data_offse=
t).
  *
  * Should contain enough information to be able to cover all the fields
@@ -46,9 +47,13 @@ struct vb2_v4l2_buffer {
 	struct v4l2_timecode	timecode;
 	__u32			sequence;
 	__s32			request_fd;
+	bool			is_held;
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 };
=20
+/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
+#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
+
 /*
  * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_bu=
ffer *
  */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
index 530638dffd93..4fa9f543742d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -915,11 +915,12 @@ struct v4l2_requestbuffers {
 };
=20
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers *=
/
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
=20
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -1041,6 +1042,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct=
 timeval *tv)
 #define V4L2_BUF_FLAG_IN_REQUEST		0x00000080
 /* timecode field is valid */
 #define V4L2_BUF_FLAG_TIMECODE			0x00000100
+/* Don't return the capture buffer until OUTPUT timestamp changes */
+#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF	0x00000200
 /* Buffer is prepared for queuing */
 #define V4L2_BUF_FLAG_PREPARED			0x00000400
 /* Cache handling flags */
--=20
2.22.1

