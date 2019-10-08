Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC59FCF5B9
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729935AbfJHJL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:11:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42874 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729767AbfJHJL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:11:29 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 280A528F7FC;
        Tue,  8 Oct 2019 10:11:26 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH v3 3/6] media: videobuf2: Expose helpers to implement the _ext_fmt and _ext_buf hooks
Date:   Tue,  8 Oct 2019 11:11:16 +0200
Message-Id: <20191008091119.7294-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VB2 layer is used by a lot of drivers. Patch it to support the
_EXT_FMT and _EXT_BUF ioctls in order to ease conversion of existing
drivers to these new APIs.

Note that internally, the VB2 core is now only using ext structs and old
APIs are supported through conversion wrappers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 .../media/common/videobuf2/videobuf2-core.c   |   2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   | 534 +++++++++++-------
 include/media/videobuf2-core.h                |   6 +-
 include/media/videobuf2-v4l2.h                |  26 +-
 4 files changed, 352 insertions(+), 216 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..898d01b4dcb4 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1181,6 +1181,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].length = 0;
 		vb->planes[plane].m.fd = 0;
 		vb->planes[plane].data_offset = 0;
+		vb->planes[plane].dbuf_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(vb, attach_dmabuf,
@@ -1224,6 +1225,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].length = planes[plane].length;
 		vb->planes[plane].m.fd = planes[plane].m.fd;
 		vb->planes[plane].data_offset = planes[plane].data_offset;
+		vb->planes[plane].dbuf_offset = planes[plane].dbuf_offset;
 	}
 
 	if (reacquired) {
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 5a9ba3846f0a..ac5ba5f0a254 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -29,6 +29,7 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-ioctl.h>
 
 #include <media/videobuf2-v4l2.h>
 
@@ -54,22 +55,14 @@ module_param(debug, int, 0644);
 
 /*
  * __verify_planes_array() - verify that the planes array passed in struct
- * v4l2_buffer from userspace can be safely used
+ * v4l2_ext_buffer from userspace can be safely used
  */
-static int __verify_planes_array(struct vb2_buffer *vb, const struct v4l2_buffer *b)
+static int __verify_planes_array(struct vb2_buffer *vb,
+				 const struct v4l2_ext_buffer *b)
 {
-	if (!V4L2_TYPE_IS_MULTIPLANAR(b->type))
-		return 0;
-
-	/* Is memory for copying plane information present? */
-	if (b->m.planes == NULL) {
-		dprintk(1, "multi-planar buffer passed but planes array not provided\n");
-		return -EINVAL;
-	}
-
-	if (b->length < vb->num_planes || b->length > VB2_MAX_PLANES) {
+	if (b->num_planes < vb->num_planes || b->num_planes > VB2_MAX_PLANES) {
 		dprintk(1, "incorrect planes array length, expected %d, got %d\n",
-			vb->num_planes, b->length);
+			vb->num_planes, b->num_planes);
 		return -EINVAL;
 	}
 
@@ -85,7 +78,8 @@ static int __verify_planes_array_core(struct vb2_buffer *vb, const void *pb)
  * __verify_length() - Verify that the bytesused value for each plane fits in
  * the plane length and that the data offset doesn't exceed the bytesused value.
  */
-static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
+static int __verify_length(struct vb2_buffer *vb,
+			   const struct v4l2_ext_buffer *b)
 {
 	unsigned int length;
 	unsigned int bytesused;
@@ -94,27 +88,19 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 	if (!V4L2_TYPE_IS_OUTPUT(b->type))
 		return 0;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			length = (b->memory == VB2_MEMORY_USERPTR ||
-				  b->memory == VB2_MEMORY_DMABUF)
-			       ? b->m.planes[plane].length
-				: vb->planes[plane].length;
-			bytesused = b->m.planes[plane].bytesused
-				  ? b->m.planes[plane].bytesused : length;
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		length = (b->memory == VB2_MEMORY_USERPTR ||
+			  b->memory == VB2_MEMORY_DMABUF) ?
+			 b->planes[plane].length :
+			 vb->planes[plane].length;
+		bytesused = b->planes[plane].bytesused ?
+			    b->planes[plane].bytesused : length;
 
-			if (b->m.planes[plane].bytesused > length)
-				return -EINVAL;
+		if (b->planes[plane].bytesused > length)
+			return -EINVAL;
 
-			if (b->m.planes[plane].data_offset > 0 &&
-			    b->m.planes[plane].data_offset >= bytesused)
-				return -EINVAL;
-		}
-	} else {
-		length = (b->memory == VB2_MEMORY_USERPTR)
-			? b->length : vb->planes[0].length;
-
-		if (b->bytesused > length)
+		if (b->planes[plane].data_offset > 0 &&
+		    b->planes[plane].data_offset >= bytesused)
 			return -EINVAL;
 	}
 
@@ -133,21 +119,12 @@ static void __init_vb2_v4l2_buffer(struct vb2_buffer *vb)
 
 static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
 {
-	const struct v4l2_buffer *b = pb;
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	const struct v4l2_ext_buffer *b = pb;
 	struct vb2_queue *q = vb->vb2_queue;
 
-	if (q->is_output) {
-		/*
-		 * For output buffers copy the timestamp if needed,
-		 * and the timecode field and flag if needed.
-		 */
-		if (q->copy_timestamp)
-			vb->timestamp = v4l2_timeval_to_ns(&b->timestamp);
-		vbuf->flags |= b->flags & V4L2_BUF_FLAG_TIMECODE;
-		if (b->flags & V4L2_BUF_FLAG_TIMECODE)
-			vbuf->timecode = b->timecode;
-	}
+	/* For output buffers copy the timestamp if needed. */
+	if (q->is_output && q->copy_timestamp)
+		vb->timestamp = b->timestamp;
 };
 
 static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
@@ -166,7 +143,8 @@ static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
 		pr_warn("use the actual size instead.\n");
 }
 
-static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b)
+static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb,
+				    struct v4l2_ext_buffer *b)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -195,110 +173,61 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	vbuf->sequence = 0;
 	vbuf->request_fd = -1;
 
-	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
-		switch (b->memory) {
-		case VB2_MEMORY_USERPTR:
-			for (plane = 0; plane < vb->num_planes; ++plane) {
-				planes[plane].m.userptr =
-					b->m.planes[plane].m.userptr;
-				planes[plane].length =
-					b->m.planes[plane].length;
-			}
-			break;
-		case VB2_MEMORY_DMABUF:
-			for (plane = 0; plane < vb->num_planes; ++plane) {
-				planes[plane].m.fd =
-					b->m.planes[plane].m.fd;
-				planes[plane].length =
-					b->m.planes[plane].length;
-			}
-			break;
-		default:
-			for (plane = 0; plane < vb->num_planes; ++plane) {
-				planes[plane].m.offset =
-					vb->planes[plane].m.offset;
-				planes[plane].length =
-					vb->planes[plane].length;
-			}
-			break;
+	switch (b->memory) {
+	case VB2_MEMORY_USERPTR:
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			planes[plane].m.userptr = b->planes[plane].m.userptr;
+			planes[plane].length = b->planes[plane].length;
 		}
-
-		/* Fill in driver-provided information for OUTPUT types */
-		if (V4L2_TYPE_IS_OUTPUT(b->type)) {
-			/*
-			 * Will have to go up to b->length when API starts
-			 * accepting variable number of planes.
-			 *
-			 * If bytesused == 0 for the output buffer, then fall
-			 * back to the full buffer size. In that case
-			 * userspace clearly never bothered to set it and
-			 * it's a safe assumption that they really meant to
-			 * use the full plane sizes.
-			 *
-			 * Some drivers, e.g. old codec drivers, use bytesused == 0
-			 * as a way to indicate that streaming is finished.
-			 * In that case, the driver should use the
-			 * allow_zero_bytesused flag to keep old userspace
-			 * applications working.
-			 */
-			for (plane = 0; plane < vb->num_planes; ++plane) {
-				struct vb2_plane *pdst = &planes[plane];
-				struct v4l2_plane *psrc = &b->m.planes[plane];
-
-				if (psrc->bytesused == 0)
-					vb2_warn_zero_bytesused(vb);
-
-				if (vb->vb2_queue->allow_zero_bytesused)
-					pdst->bytesused = psrc->bytesused;
-				else
-					pdst->bytesused = psrc->bytesused ?
-						psrc->bytesused : pdst->length;
-				pdst->data_offset = psrc->data_offset;
-			}
+		break;
+	case VB2_MEMORY_DMABUF:
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			planes[plane].m.fd = b->planes[plane].m.dmabuf.fd;
+			planes[plane].dbuf_offset = b->planes[plane].m.dmabuf.offset;
+			planes[plane].length = b->planes[plane].length;
 		}
-	} else {
+		break;
+	default:
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			planes[plane].m.offset = vb->planes[plane].m.offset;
+			planes[plane].length = vb->planes[plane].length;
+		}
+		break;
+	}
+
+	/* Fill in driver-provided information for OUTPUT types */
+	if (V4L2_TYPE_IS_OUTPUT(b->type)) {
 		/*
-		 * Single-planar buffers do not use planes array,
-		 * so fill in relevant v4l2_buffer struct fields instead.
-		 * In videobuf we use our internal V4l2_planes struct for
-		 * single-planar buffers as well, for simplicity.
+		 * Will have to go up to b->length when API starts
+		 * accepting variable number of planes.
 		 *
-		 * If bytesused == 0 for the output buffer, then fall back
-		 * to the full buffer size as that's a sensible default.
+		 * If bytesused == 0 for the output buffer, then fall
+		 * back to the full buffer size. In that case
+		 * userspace clearly never bothered to set it and
+		 * it's a safe assumption that they really meant to
+		 * use the full plane sizes.
 		 *
-		 * Some drivers, e.g. old codec drivers, use bytesused == 0 as
-		 * a way to indicate that streaming is finished. In that case,
-		 * the driver should use the allow_zero_bytesused flag to keep
-		 * old userspace applications working.
+		 * Some drivers, e.g. old codec drivers, use bytesused == 0
+		 * as a way to indicate that streaming is finished.
+		 * In that case, the driver should use the
+		 * allow_zero_bytesused flag to keep old userspace
+		 * applications working.
 		 */
-		switch (b->memory) {
-		case VB2_MEMORY_USERPTR:
-			planes[0].m.userptr = b->m.userptr;
-			planes[0].length = b->length;
-			break;
-		case VB2_MEMORY_DMABUF:
-			planes[0].m.fd = b->m.fd;
-			planes[0].length = b->length;
-			break;
-		default:
-			planes[0].m.offset = vb->planes[0].m.offset;
-			planes[0].length = vb->planes[0].length;
-			break;
-		}
+		for (plane = 0; plane < vb->num_planes; ++plane) {
+			struct vb2_plane *pdst = &planes[plane];
+			struct v4l2_ext_plane *psrc = &b->planes[plane];
 
-		planes[0].data_offset = 0;
-		if (V4L2_TYPE_IS_OUTPUT(b->type)) {
-			if (b->bytesused == 0)
+			if (psrc->bytesused == 0)
 				vb2_warn_zero_bytesused(vb);
 
 			if (vb->vb2_queue->allow_zero_bytesused)
-				planes[0].bytesused = b->bytesused;
+				pdst->bytesused = psrc->bytesused;
 			else
-				planes[0].bytesused = b->bytesused ?
-					b->bytesused : planes[0].length;
-		} else
-			planes[0].bytesused = 0;
-
+				pdst->bytesused = psrc->bytesused ?
+						  psrc->bytesused :
+						  pdst->length;
+			pdst->data_offset = psrc->data_offset;
+		}
 	}
 
 	/* Zero flags that we handle */
@@ -331,8 +260,21 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	return 0;
 }
 
+enum v4l2_buf_type vb2_ext_qtype(struct vb2_queue *q)
+{
+	if (!q->is_multiplanar)
+		return q->type;
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	else if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+	return q->type;
+}
+
 static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
-				    struct v4l2_buffer *b, bool is_prepare,
+				    struct v4l2_ext_buffer *b, bool is_prepare,
 				    struct media_request **p_req)
 {
 	const char *opname = is_prepare ? "prepare_buf" : "qbuf";
@@ -341,7 +283,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	struct vb2_buffer *vb;
 	int ret;
 
-	if (b->type != q->type) {
+	if (b->type != vb2_ext_qtype(q)) {
 		dprintk(1, "%s: invalid buffer type\n", opname);
 		return -EINVAL;
 	}
@@ -458,12 +400,12 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 }
 
 /*
- * __fill_v4l2_buffer() - fill in a struct v4l2_buffer with information to be
- * returned to userspace
+ * __fill_v4l2_buffer() - fill in a struct v4l2_ext_buffer with information to
+ * be returned to userspace
  */
 static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 {
-	struct v4l2_buffer *b = pb;
+	struct v4l2_ext_buffer *b = pb;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vb2_queue *q = vb->vb2_queue;
 	unsigned int plane;
@@ -472,50 +414,35 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 	b->index = vb->index;
 	b->type = vb->type;
 	b->memory = vb->memory;
-	b->bytesused = 0;
 
 	b->flags = vbuf->flags;
 	b->field = vbuf->field;
-	b->timestamp = ns_to_timeval(vb->timestamp);
-	b->timecode = vbuf->timecode;
+	b->timestamp = vb->timestamp;
 	b->sequence = vbuf->sequence;
-	b->reserved2 = 0;
 	b->request_fd = 0;
+	memset(b->reserved, 0, sizeof(b->reserved));
 
-	if (q->is_multiplanar) {
-		/*
-		 * Fill in plane-related data if userspace provided an array
-		 * for it. The caller has already verified memory and size.
-		 */
-		b->length = vb->num_planes;
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			struct v4l2_plane *pdst = &b->m.planes[plane];
-			struct vb2_plane *psrc = &vb->planes[plane];
+	/*
+	 * Fill in plane-related data if userspace provided an array
+	 * for it. The caller has already verified memory and size.
+	 */
+	b->num_planes = vb->num_planes;
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		struct v4l2_ext_plane *pdst = &b->planes[plane];
+		struct vb2_plane *psrc = &vb->planes[plane];
 
-			pdst->bytesused = psrc->bytesused;
-			pdst->length = psrc->length;
-			if (q->memory == VB2_MEMORY_MMAP)
-				pdst->m.mem_offset = psrc->m.offset;
-			else if (q->memory == VB2_MEMORY_USERPTR)
-				pdst->m.userptr = psrc->m.userptr;
-			else if (q->memory == VB2_MEMORY_DMABUF)
-				pdst->m.fd = psrc->m.fd;
-			pdst->data_offset = psrc->data_offset;
-			memset(pdst->reserved, 0, sizeof(pdst->reserved));
+		pdst->bytesused = psrc->bytesused;
+		pdst->length = psrc->length;
+		if (q->memory == VB2_MEMORY_MMAP) {
+			pdst->m.mem_offset = psrc->m.offset;
+		} else if (q->memory == VB2_MEMORY_USERPTR) {
+			pdst->m.userptr = psrc->m.userptr;
+		} else if (q->memory == VB2_MEMORY_DMABUF) {
+			pdst->m.dmabuf.fd = psrc->m.fd;
+			pdst->m.dmabuf.offset = psrc->dbuf_offset;
 		}
-	} else {
-		/*
-		 * We use length and offset in v4l2_planes array even for
-		 * single-planar buffers, but userspace does not.
-		 */
-		b->length = vb->planes[0].length;
-		b->bytesused = vb->planes[0].bytesused;
-		if (q->memory == VB2_MEMORY_MMAP)
-			b->m.offset = vb->planes[0].m.offset;
-		else if (q->memory == VB2_MEMORY_USERPTR)
-			b->m.userptr = vb->planes[0].m.userptr;
-		else if (q->memory == VB2_MEMORY_DMABUF)
-			b->m.fd = vb->planes[0].m.fd;
+		pdst->data_offset = psrc->data_offset;
+		memset(pdst->reserved, 0, sizeof(pdst->reserved));
 	}
 
 	/*
@@ -610,6 +537,40 @@ int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
 }
 EXPORT_SYMBOL_GPL(vb2_find_timestamp);
 
+#define vb2_buf_to_ext_buf_op(_name, ...)				\
+({									\
+	int ret;							\
+									\
+	ret = v4l2_buffer_to_ext_buffer(b, &eb);			\
+	if (!ret)							\
+		ret = _name(__VA_ARGS__);				\
+	if (!ret)							\
+		v4l2_ext_buffer_to_buffer(&eb, b, q->is_multiplanar);	\
+	ret;								\
+})
+
+int vb2_ext_querybuf(struct vb2_queue *q, struct v4l2_ext_buffer *b)
+{
+	struct vb2_buffer *vb;
+	int ret;
+
+	if (b->type != vb2_ext_qtype(q)) {
+		dprintk(1, "wrong buffer type\n");
+		return -EINVAL;
+	}
+
+	if (b->index >= q->num_buffers) {
+		dprintk(1, "buffer index out of range\n");
+		return -EINVAL;
+	}
+	vb = q->bufs[b->index];
+	ret = __verify_planes_array(vb, b);
+	if (!ret)
+		vb2_core_querybuf(q, b->index, b);
+	return ret;
+}
+EXPORT_SYMBOL(vb2_ext_querybuf);
+
 /*
  * vb2_querybuf() - query video buffer information
  * @q:		videobuf queue
@@ -625,23 +586,9 @@ EXPORT_SYMBOL_GPL(vb2_find_timestamp);
  */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 {
-	struct vb2_buffer *vb;
-	int ret;
+	struct v4l2_ext_buffer eb;
 
-	if (b->type != q->type) {
-		dprintk(1, "wrong buffer type\n");
-		return -EINVAL;
-	}
-
-	if (b->index >= q->num_buffers) {
-		dprintk(1, "buffer index out of range\n");
-		return -EINVAL;
-	}
-	vb = q->bufs[b->index];
-	ret = __verify_planes_array(vb, b);
-	if (!ret)
-		vb2_core_querybuf(q, b->index, b);
-	return ret;
+	return vb2_buf_to_ext_buf_op(vb2_ext_querybuf, q, &eb);
 }
 EXPORT_SYMBOL(vb2_querybuf);
 
@@ -669,8 +616,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
-int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
-		    struct v4l2_buffer *b)
+int vb2_ext_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
+			struct v4l2_ext_buffer *b)
 {
 	int ret;
 
@@ -686,13 +633,23 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 
 	return ret ? ret : vb2_core_prepare_buf(q, b->index, b);
 }
+EXPORT_SYMBOL_GPL(vb2_ext_prepare_buf);
+
+int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
+		    struct v4l2_buffer *b)
+{
+	struct v4l2_ext_buffer eb;
+
+	return vb2_buf_to_ext_buf_op(vb2_ext_prepare_buf, q, mdev, &eb);
+}
 EXPORT_SYMBOL_GPL(vb2_prepare_buf);
 
-int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
+int vb2_ext_create_bufs(struct vb2_queue *q,
+			struct v4l2_ext_create_buffers *create)
 {
 	unsigned requested_planes = 1;
 	unsigned requested_sizes[VIDEO_MAX_PLANES];
-	struct v4l2_format *f = &create->format;
+	struct v4l2_ext_format *f = &create->format;
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
 	unsigned i;
 
@@ -702,19 +659,15 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 		return ret != -EBUSY ? ret : 0;
 
 	switch (f->type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		requested_planes = f->fmt.pix_mp.num_planes;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		requested_planes = f->fmt.pix.num_planes;
 		if (requested_planes == 0 ||
 		    requested_planes > VIDEO_MAX_PLANES)
 			return -EINVAL;
 		for (i = 0; i < requested_planes; i++)
 			requested_sizes[i] =
-				f->fmt.pix_mp.plane_fmt[i].sizeimage;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		requested_sizes[0] = f->fmt.pix.sizeimage;
+				f->fmt.pix.plane_fmt[i].sizeimage;
 		break;
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
@@ -742,10 +695,34 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	return ret ? ret : vb2_core_create_bufs(q, create->memory,
 		&create->count, requested_planes, requested_sizes);
 }
+EXPORT_SYMBOL_GPL(vb2_ext_create_bufs);
+
+int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
+{
+	struct v4l2_ext_create_buffers ecreate = {
+		.count = create->count,
+		.memory = create->memory,
+	};
+	int ret;
+
+	ret = v4l2_format_to_ext_format(&create->format,
+					&ecreate.format, true);
+	if (ret)
+		return ret;
+
+	ret = vb2_ext_create_bufs(q, &ecreate);
+	if (ret)
+		return ret;
+
+	create->index = ecreate.index;
+	create->count = ecreate.count;
+	create->capabilities = ecreate.capabilities;
+	return 0;
+}
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
 
-int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
-	     struct v4l2_buffer *b)
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *b)
 {
 	struct media_request *req = NULL;
 	int ret;
@@ -763,9 +740,19 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		media_request_put(req);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vb2_ext_qbuf);
+
+int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
+	     struct v4l2_buffer *b)
+{
+	struct v4l2_ext_buffer eb;
+
+	return vb2_buf_to_ext_buf_op(vb2_ext_qbuf, q, mdev, &eb);
+}
 EXPORT_SYMBOL_GPL(vb2_qbuf);
 
-int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
+int vb2_ext_dqbuf(struct vb2_queue *q, struct v4l2_ext_buffer *b,
+		  bool nonblocking)
 {
 	int ret;
 
@@ -774,7 +761,7 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 		return -EBUSY;
 	}
 
-	if (b->type != q->type) {
+	if (b->type != vb2_ext_qtype(q)) {
 		dprintk(1, "invalid buffer type\n");
 		return -EINVAL;
 	}
@@ -794,8 +781,17 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vb2_ext_dqbuf);
+
+int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
+{
+	struct v4l2_ext_buffer eb;
+
+	return vb2_buf_to_ext_buf_op(vb2_ext_dqbuf, q, &eb, nonblocking);
+}
 EXPORT_SYMBOL_GPL(vb2_dqbuf);
 
+
 int vb2_streamon(struct vb2_queue *q, enum v4l2_buf_type type)
 {
 	if (vb2_fileio_is_active(q)) {
@@ -823,6 +819,37 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 }
 EXPORT_SYMBOL_GPL(vb2_expbuf);
 
+int vb2_ext_expbuf(struct vb2_queue *q, struct v4l2_ext_exportbuffer *eb)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = eb->first_plane; i < eb->first_plane + eb->num_planes; i++) {
+		ret = vb2_core_expbuf(q, &eb->fds[i], eb->type, eb->index,
+				      i, eb->flags);
+		if (ret)
+			goto err_put_dmabufs;
+	}
+
+	return 0;
+
+err_put_dmabufs:
+	for (; i > eb->first_plane; i--) {
+	        struct dma_buf *dmabuf;
+
+		/*
+		 * FIXME: Find a better way to close the FD returned by
+		 * dma_buf_fb().
+		 */
+		dmabuf = dma_buf_get(eb->fds[i - 1]);
+		dma_buf_put(dmabuf);
+		dma_buf_put(dmabuf);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vb2_ext_expbuf);
+
 int vb2_queue_init(struct vb2_queue *q)
 {
 	/*
@@ -951,6 +978,33 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
 
+int vb2_ioctl_ext_create_bufs(struct file *file, void *priv,
+			      struct v4l2_ext_create_buffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int res = vb2_verify_memory_type(vdev->queue, p->memory,
+			p->format.type);
+
+	p->index = vdev->queue->num_buffers;
+	fill_buf_caps(vdev->queue, &p->capabilities);
+	/*
+	 * If count == 0, then just check if memory and type are valid.
+	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
+	 */
+	if (p->count == 0)
+		return res != -EBUSY ? res : 0;
+	if (res)
+		return res;
+	if (vb2_queue_is_busy(vdev, file))
+		return -EBUSY;
+
+	res = vb2_ext_create_bufs(vdev->queue, p);
+	if (res == 0)
+		vdev->queue->owner = file->private_data;
+	return res;
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_create_bufs);
+
 int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 			  struct v4l2_buffer *p)
 {
@@ -962,6 +1016,17 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
 
+int vb2_ioctl_ext_prepare_buf(struct file *file, void *priv,
+			      struct v4l2_ext_buffer *p)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vb2_queue_is_busy(vdev, file))
+		return -EBUSY;
+	return vb2_ext_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_prepare_buf);
+
 int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -971,6 +1036,16 @@ int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
 
+int vb2_ioctl_ext_querybuf(struct file *file, void *priv,
+			   struct v4l2_ext_buffer *p)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	/* No need to call vb2_queue_is_busy(), anyone can query buffers. */
+	return vb2_ext_querybuf(vdev->queue, p);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_querybuf);
+
 int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -981,6 +1056,17 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
 
+int vb2_ioctl_ext_qbuf(struct file *file, void *priv,
+		       struct v4l2_ext_buffer *p)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vb2_queue_is_busy(vdev, file))
+		return -EBUSY;
+	return vb2_ext_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_qbuf);
+
 int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -991,6 +1077,17 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
 
+int vb2_ioctl_ext_dqbuf(struct file *file, void *priv,
+			struct v4l2_ext_buffer *p)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vb2_queue_is_busy(vdev, file))
+		return -EBUSY;
+	return vb2_ext_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_dqbuf);
+
 int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -1021,6 +1118,17 @@ int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
 
+int vb2_ioctl_ext_expbuf(struct file *file, void *priv,
+			 struct v4l2_ext_exportbuffer *p)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vb2_queue_is_busy(vdev, file))
+		return -EBUSY;
+	return vb2_ext_expbuf(vdev->queue, p);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_ext_expbuf);
+
 /* v4l2_file_operations helpers */
 
 int vb2_fop_mmap(struct file *file, struct vm_area_struct *vma)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 640aabe69450..6411fb2c89fe 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -152,6 +152,8 @@ struct vb2_mem_ops {
  * @mem_priv:	private data with this plane.
  * @dbuf:	dma_buf - shared buffer object.
  * @dbuf_mapped:	flag to show whether dbuf is mapped or not
+ * @dbuf_offset: offset where the plane starts. Usually 0, unless the buffer
+ *		 is shared by all planes of a multi-planar format.
  * @bytesused:	number of bytes occupied by data in the plane (payload).
  * @length:	size of this plane (NOT the payload) in bytes.
  * @min_length:	minimum required size of this plane (NOT the payload) in bytes.
@@ -175,6 +177,7 @@ struct vb2_plane {
 	void			*mem_priv;
 	struct dma_buf		*dbuf;
 	unsigned int		dbuf_mapped;
+	unsigned int		dbuf_offset;
 	unsigned int		bytesused;
 	unsigned int		length;
 	unsigned int		min_length;
@@ -440,7 +443,8 @@ struct vb2_ops {
  *			struct vb2_buffer.
  *			For V4L2 this is a &struct vb2_v4l2_buffer.
  * @fill_user_buffer:	given a &vb2_buffer fill in the userspace structure.
- *			For V4L2 this is a &struct v4l2_buffer.
+ *			For V4L2 this is a &struct v4l2_buffer or
+ *			&struct v4l2_ext_buffer.
  * @fill_vb2_buffer:	given a userspace structure, fill in the &vb2_buffer.
  *			If the userspace structure is invalid, then this op
  *			will return an error.
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 8a10889dc2fd..99eff4639dc5 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -36,7 +36,7 @@
  * @planes:	plane information (userptr/fd, length, bytesused, data_offset).
  *
  * Should contain enough information to be able to cover all the fields
- * of &struct v4l2_buffer at ``videodev2.h``.
+ * of &struct v4l2_buffer and &struct v4l2_ext_buffer at ``videodev2.h``.
  */
 struct vb2_v4l2_buffer {
 	struct vb2_buffer	vb2_buf;
@@ -72,6 +72,7 @@ int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
 		       unsigned int start_idx);
 
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
+int vb2_ext_querybuf(struct vb2_queue *q, struct v4l2_ext_buffer *b);
 
 /**
  * vb2_reqbufs() - Wrapper for vb2_core_reqbufs() that also verifies
@@ -92,6 +93,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req);
  *		&v4l2_ioctl_ops->vidioc_create_bufs handler in driver
  */
 int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
+int vb2_ext_create_bufs(struct vb2_queue *q,
+			struct v4l2_ext_create_buffers *create);
 
 /**
  * vb2_prepare_buf() - Pass ownership of a buffer from userspace to the kernel
@@ -117,6 +120,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
  */
 int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 		    struct v4l2_buffer *b);
+int vb2_ext_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
+			struct v4l2_ext_buffer *b);
 
 /**
  * vb2_qbuf() - Queue a buffer from userspace
@@ -143,6 +148,8 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
  */
 int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 	     struct v4l2_buffer *b);
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *b);
 
 /**
  * vb2_expbuf() - Export a buffer as a file descriptor
@@ -154,6 +161,7 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
  * from &v4l2_ioctl_ops->vidioc_expbuf handler in driver.
  */
 int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb);
+int vb2_ext_expbuf(struct vb2_queue *q, struct v4l2_ext_exportbuffer *eb);
 
 /**
  * vb2_dqbuf() - Dequeue a buffer to the userspace
@@ -180,6 +188,8 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb);
  * from &v4l2_ioctl_ops->vidioc_dqbuf handler in driver.
  */
 int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking);
+int vb2_ext_dqbuf(struct vb2_queue *q, struct v4l2_ext_buffer *b,
+		  bool nonblocking);
 
 /**
  * vb2_streamon - start streaming
@@ -276,15 +286,27 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p);
 int vb2_ioctl_create_bufs(struct file *file, void *priv,
 			  struct v4l2_create_buffers *p);
+int vb2_ioctl_ext_create_bufs(struct file *file, void *priv,
+			      struct v4l2_ext_create_buffers *p);
 int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 			  struct v4l2_buffer *p);
+int vb2_ioctl_ext_prepare_buf(struct file *file, void *priv,
+			      struct v4l2_ext_buffer *p);
 int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p);
+int vb2_ioctl_ext_querybuf(struct file *file, void *priv,
+			   struct v4l2_ext_buffer *p);
 int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p);
+int vb2_ioctl_ext_qbuf(struct file *file, void *priv,
+		       struct v4l2_ext_buffer *p);
 int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p);
+int vb2_ioctl_ext_dqbuf(struct file *file, void *priv,
+			struct v4l2_ext_buffer *p);
 int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_expbuf(struct file *file, void *priv,
-	struct v4l2_exportbuffer *p);
+		     struct v4l2_exportbuffer *p);
+int vb2_ioctl_ext_expbuf(struct file *file, void *priv,
+			 struct v4l2_ext_exportbuffer *p);
 
 /* struct v4l2_file_operations helpers */
 
-- 
2.21.0

