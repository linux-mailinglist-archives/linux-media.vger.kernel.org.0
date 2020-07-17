Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BDA223ADB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGQLzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:55:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56774 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQLzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:55:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 88D342A5766
From:   Helen Koike <helen.koike@collabora.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Helen Koike <helen.koike@collabora.com>, tfiga@chromium.org,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
Subject: [PATCH v4 3/6] media: videobuf2: Expose helpers to implement the _ext_fmt and _ext_buf hooks
Date:   Fri, 17 Jul 2020 08:54:32 -0300
Message-Id: <20200717115435.2632623-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200717115435.2632623-1-helen.koike@collabora.com>
References: <20200717115435.2632623-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

The VB2 layer is used by a lot of drivers. Patch it to support the
_EXT_FMT and _EXT_BUF ioctls in order to ease conversion of existing
drivers to these new APIs.

Note that internally, the VB2 core is now only using ext structs and old
APIs are supported through conversion wrappers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v4:
- Update with new format and buffer structs
- Fix some bugs caught by v4l2-compliance
- Rebased on top of media/master (post 5.8-rc1)

Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 .../media/common/videobuf2/videobuf2-core.c   |   2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   | 549 ++++++++++--------
 include/media/videobuf2-core.h                |   6 +-
 include/media/videobuf2-v4l2.h                |  21 +-
 4 files changed, 335 insertions(+), 243 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index abaf28e057ebe..1e81efdddcf08 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1253,6 +1253,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].length = 0;
 		vb->planes[plane].m.fd = 0;
 		vb->planes[plane].data_offset = 0;
+		vb->planes[plane].dbuf_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(vb, attach_dmabuf,
@@ -1296,6 +1297,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].length = planes[plane].length;
 		vb->planes[plane].m.fd = planes[plane].m.fd;
 		vb->planes[plane].data_offset = planes[plane].data_offset;
+		vb->planes[plane].dbuf_offset = planes[plane].dbuf_offset;
 	}
 
 	if (reacquired) {
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 57aa183bd1983..928d754fb89e8 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -29,6 +29,7 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-ioctl.h>
 
 #include <media/videobuf2-v4l2.h>
 
@@ -56,42 +57,17 @@ module_param(debug, int, 0644);
 				 V4L2_BUF_FLAG_TIMECODE | \
 				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
 
-/*
- * __verify_planes_array() - verify that the planes array passed in struct
- * v4l2_buffer from userspace can be safely used
- */
-static int __verify_planes_array(struct vb2_buffer *vb, const struct v4l2_buffer *b)
-{
-	if (!V4L2_TYPE_IS_MULTIPLANAR(b->type))
-		return 0;
-
-	/* Is memory for copying plane information present? */
-	if (b->m.planes == NULL) {
-		dprintk(vb->vb2_queue, 1,
-			"multi-planar buffer passed but planes array not provided\n");
-		return -EINVAL;
-	}
-
-	if (b->length < vb->num_planes || b->length > VB2_MAX_PLANES) {
-		dprintk(vb->vb2_queue, 1,
-			"incorrect planes array length, expected %d, got %d\n",
-			vb->num_planes, b->length);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int __verify_planes_array_core(struct vb2_buffer *vb, const void *pb)
 {
-	return __verify_planes_array(vb, pb);
+	return 0;
 }
 
 /*
  * __verify_length() - Verify that the bytesused value for each plane fits in
  * the plane length and that the data offset doesn't exceed the bytesused value.
  */
-static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
+static int __verify_length(struct vb2_buffer *vb,
+			   const struct v4l2_ext_buffer *b)
 {
 	unsigned int length;
 	unsigned int bytesused;
@@ -100,28 +76,19 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
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
-
-			if (b->m.planes[plane].bytesused > length)
-				return -EINVAL;
-
-			if (b->m.planes[plane].data_offset > 0 &&
-			    b->m.planes[plane].data_offset >= bytesused)
-				return -EINVAL;
-		}
-	} else {
+	for (plane = 0; plane < vb->num_planes; ++plane) {
 		length = (b->memory == VB2_MEMORY_USERPTR ||
-			  b->memory == VB2_MEMORY_DMABUF)
-			? b->length : vb->planes[0].length;
+			  b->memory == VB2_MEMORY_DMABUF) ?
+			 b->planes[plane].buffer_length :
+			 vb->planes[plane].length;
+		bytesused = b->planes[plane].plane_length ?
+			    b->planes[plane].plane_length : length;
 
-		if (b->bytesused > length)
+		if (bytesused > length)
+			return -EINVAL;
+
+		if (b->memory != V4L2_MEMORY_MMAP &&
+		    b->planes[plane].offset + bytesused > length)
 			return -EINVAL;
 	}
 
@@ -140,21 +107,12 @@ static void __init_vb2_v4l2_buffer(struct vb2_buffer *vb)
 
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
-			vb->timestamp = v4l2_buffer_get_timestamp(b);
-		vbuf->flags |= b->flags & V4L2_BUF_FLAG_TIMECODE;
-		if (b->flags & V4L2_BUF_FLAG_TIMECODE)
-			vbuf->timecode = b->timecode;
-	}
+	/* For output buffers copy the timestamp if needed. */
+	if (q->is_output && q->copy_timestamp)
+		vb->timestamp = b->timestamp;
 };
 
 static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
@@ -173,7 +131,8 @@ static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
 		pr_warn("use the actual size instead.\n");
 }
 
-static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b)
+static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb,
+				    struct v4l2_ext_buffer *b)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -203,110 +162,60 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	vbuf->request_fd = -1;
 	vbuf->is_held = false;
 
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
+			planes[plane].length = b->planes[plane].buffer_length;
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
+			planes[plane].m.fd = b->planes[plane].m.dmabuf_fd;
+			planes[plane].dbuf_offset = b->planes[plane].offset;
+			planes[plane].length = b->planes[plane].buffer_length;
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
+			if (psrc->plane_length == 0)
 				vb2_warn_zero_bytesused(vb);
 
 			if (vb->vb2_queue->allow_zero_bytesused)
-				planes[0].bytesused = b->bytesused;
+				pdst->bytesused = psrc->plane_length;
 			else
-				planes[0].bytesused = b->bytesused ?
-					b->bytesused : planes[0].length;
-		} else
-			planes[0].bytesused = 0;
-
+				pdst->bytesused = psrc->plane_length ?
+						  psrc->plane_length :
+						  pdst->length;
+		}
 	}
 
 	/* Zero flags that we handle */
@@ -343,7 +252,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 
 static void set_buffer_cache_hints(struct vb2_queue *q,
 				   struct vb2_buffer *vb,
-				   struct v4l2_buffer *b)
+				   struct v4l2_ext_buffer *b)
 {
 	/*
 	 * DMA exporter should take care of cache syncs, so we can avoid
@@ -388,8 +297,34 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 		vb->need_cache_sync_on_prepare = 0;
 }
 
+static enum v4l2_buf_type vb2_ext_qtype(struct vb2_queue *q)
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
+static enum v4l2_buf_type vb2_ext_type(unsigned int type, bool is_multiplanar)
+{
+	if (!is_multiplanar)
+		return type;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	else if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+
+	return type;
+}
+
 static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
-				    struct v4l2_buffer *b, bool is_prepare,
+				    struct v4l2_ext_buffer *b, bool is_prepare,
 				    struct media_request **p_req)
 {
 	const char *opname = is_prepare ? "prepare_buf" : "qbuf";
@@ -398,7 +333,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	struct vb2_buffer *vb;
 	int ret;
 
-	if (b->type != q->type) {
+	if (b->type != vb2_ext_qtype(q)) {
 		dprintk(q, 1, "%s: invalid buffer type\n", opname);
 		return -EINVAL;
 	}
@@ -421,9 +356,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 
 	vb = q->bufs[b->index];
 	vbuf = to_vb2_v4l2_buffer(vb);
-	ret = __verify_planes_array(vb, b);
-	if (ret)
-		return ret;
 
 	if (!is_prepare && (b->flags & V4L2_BUF_FLAG_REQUEST_FD) &&
 	    vb->state != VB2_BUF_STATE_DEQUEUED) {
@@ -487,11 +419,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		    !q->ops->buf_out_validate))
 		return -EINVAL;
 
-	if (b->request_fd < 0) {
-		dprintk(q, 1, "%s: request_fd < 0\n", opname);
-		return -EINVAL;
-	}
-
 	req = media_request_get_by_fd(mdev, b->request_fd);
 	if (IS_ERR(req)) {
 		dprintk(q, 1, "%s: invalid request_fd\n", opname);
@@ -516,64 +443,47 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
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
 
 	/* Copy back data such as timestamp, flags, etc. */
 	b->index = vb->index;
-	b->type = vb->type;
+	b->type = vb2_ext_qtype(q);
 	b->memory = vb->memory;
-	b->bytesused = 0;
 
 	b->flags = vbuf->flags;
 	b->field = vbuf->field;
-	v4l2_buffer_set_timestamp(b, vb->timestamp);
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
-
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
+	/*
+	 * Fill in plane-related data if userspace provided an array
+	 * for it. The caller has already verified memory and size.
+	 */
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		struct v4l2_ext_plane *pdst = &b->planes[plane];
+		struct vb2_plane *psrc = &vb->planes[plane];
+
+		pdst->plane_length = psrc->bytesused;
+		pdst->buffer_length = psrc->length;
+		if (q->memory == VB2_MEMORY_MMAP) {
+			pdst->offset = psrc->m.offset;
+		} else if (q->memory == VB2_MEMORY_USERPTR) {
+			pdst->m.userptr = psrc->m.userptr;
+		} else if (q->memory == VB2_MEMORY_DMABUF) {
+			pdst->m.dmabuf_fd = psrc->m.fd;
+			pdst->offset = psrc->dbuf_offset;
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
+		memset(pdst->reserved, 0, sizeof(pdst->reserved));
 	}
 
 	/*
@@ -668,6 +578,35 @@ int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
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
+		ret = v4l2_ext_buffer_to_buffer(&eb, b,			\
+						q->is_multiplanar);	\
+	ret;								\
+})
+
+int vb2_ext_querybuf(struct vb2_queue *q, struct v4l2_ext_buffer *b)
+{
+	if (b->type != vb2_ext_qtype(q)) {
+		dprintk(q, 1, "wrong buffer type\n");
+		return -EINVAL;
+	}
+
+	if (b->index >= q->num_buffers) {
+		dprintk(q, 1, "buffer index out of range\n");
+		return -EINVAL;
+	}
+	vb2_core_querybuf(q, b->index, b);
+	return 0;
+}
+EXPORT_SYMBOL(vb2_ext_querybuf);
+
 /*
  * vb2_querybuf() - query video buffer information
  * @q:		videobuf queue
@@ -683,23 +622,9 @@ EXPORT_SYMBOL_GPL(vb2_find_timestamp);
  */
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 {
-	struct vb2_buffer *vb;
-	int ret;
+	struct v4l2_ext_buffer eb;
 
-	if (b->type != q->type) {
-		dprintk(q, 1, "wrong buffer type\n");
-		return -EINVAL;
-	}
-
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
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
 
@@ -741,8 +666,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
-int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
-		    struct v4l2_buffer *b)
+int vb2_ext_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
+			struct v4l2_ext_buffer *b)
 {
 	int ret;
 
@@ -758,16 +683,59 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 
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
 
+int vb2_ext_create_bufs(struct vb2_queue *q,
+			struct v4l2_ext_create_buffers *create)
+{
+	unsigned int requested_sizes[VIDEO_MAX_PLANES];
+	struct v4l2_ext_pix_format *f = &create->format;
+	int ret = vb2_verify_memory_type(q, create->memory,
+				vb2_ext_type(f->type, q->is_multiplanar));
+	unsigned i;
+
+	if (create->format.type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    create->format.type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	fill_buf_caps(q, &create->capabilities);
+	clear_consistency_attr(q, create->memory, &create->flags);
+	create->index = q->num_buffers;
+	if (create->count == 0)
+		return ret != -EBUSY ? ret : 0;
+
+	if (!f->plane_fmt[0].sizeimage)
+		return -EINVAL;
+	for (i = 0; i < VIDEO_MAX_PLANES &&
+		    f->plane_fmt[i].sizeimage; i++)
+		requested_sizes[i] = f->plane_fmt[i].sizeimage;
+
+	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+						create->flags,
+						&create->count,
+						i,
+						requested_sizes);
+}
+EXPORT_SYMBOL_GPL(vb2_ext_create_bufs);
+
 int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 {
+	struct v4l2_format *f = &create->format;
 	unsigned requested_planes = 1;
 	unsigned requested_sizes[VIDEO_MAX_PLANES];
-	struct v4l2_format *f = &create->format;
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
 	unsigned i;
 
+
 	fill_buf_caps(q, &create->capabilities);
 	clear_consistency_attr(q, create->memory, &create->flags);
 	create->index = q->num_buffers;
@@ -777,18 +745,29 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		requested_planes = f->fmt.pix_mp.num_planes;
-		if (requested_planes == 0 ||
-		    requested_planes > VIDEO_MAX_PLANES)
-			return -EINVAL;
-		for (i = 0; i < requested_planes; i++)
-			requested_sizes[i] =
-				f->fmt.pix_mp.plane_fmt[i].sizeimage;
-		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		requested_sizes[0] = f->fmt.pix.sizeimage;
-		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT: {
+		struct v4l2_ext_create_buffers ecreate = {
+			.count = create->count,
+			.memory = create->memory,
+			.flags = create->flags,
+		};
+
+		ret = v4l2_format_to_ext_pix_format(&create->format,
+						    &ecreate.format, true);
+		if (ret)
+			return ret;
+
+		ret = vb2_ext_create_bufs(q, &ecreate);
+		if (ret)
+			return ret;
+
+		create->index = ecreate.index;
+		create->count = ecreate.count;
+		create->flags = ecreate.flags;
+		create->capabilities = ecreate.capabilities;
+		return 0;
+	}
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		requested_sizes[0] = f->fmt.vbi.samples_per_line *
@@ -820,8 +799,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
 
-int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
-	     struct v4l2_buffer *b)
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *b)
 {
 	struct media_request *req = NULL;
 	int ret;
@@ -839,9 +818,19 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
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
 
@@ -850,7 +839,7 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 		return -EBUSY;
 	}
 
-	if (b->type != q->type) {
+	if (b->type != vb2_ext_qtype(q)) {
 		dprintk(q, 1, "invalid buffer type\n");
 		return -EINVAL;
 	}
@@ -870,6 +859,14 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 
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
 
 int vb2_streamon(struct vb2_queue *q, enum v4l2_buf_type type)
@@ -1040,6 +1037,33 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
 
+int vb2_ioctl_ext_create_bufs(struct file *file, void *priv,
+			      struct v4l2_ext_create_buffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int res = vb2_verify_memory_type(vdev->queue, p->memory,
+		vb2_ext_type(p->format.type, vdev->queue->is_multiplanar));
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
@@ -1051,6 +1075,17 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
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
@@ -1060,6 +1095,16 @@ int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
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
@@ -1070,6 +1115,17 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
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
@@ -1080,6 +1136,17 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
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
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 52ef92049073e..f334767785bd9 100644
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
@@ -446,7 +449,8 @@ struct vb2_ops {
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
index b7b5a9cb5a280..1bfde6e391bf0 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -37,7 +37,7 @@
  * @planes:	plane information (userptr/fd, length, bytesused, data_offset).
  *
  * Should contain enough information to be able to cover all the fields
- * of &struct v4l2_buffer at ``videodev2.h``.
+ * of &struct v4l2_buffer and &struct v4l2_ext_buffer at ``videodev2.h``.
  */
 struct vb2_v4l2_buffer {
 	struct vb2_buffer	vb2_buf;
@@ -77,6 +77,7 @@ int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
 		       unsigned int start_idx);
 
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
+int vb2_ext_querybuf(struct vb2_queue *q, struct v4l2_ext_buffer *b);
 
 /**
  * vb2_reqbufs() - Wrapper for vb2_core_reqbufs() that also verifies
@@ -97,6 +98,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req);
  *		&v4l2_ioctl_ops->vidioc_create_bufs handler in driver
  */
 int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
+int vb2_ext_create_bufs(struct vb2_queue *q,
+			struct v4l2_ext_create_buffers *create);
 
 /**
  * vb2_prepare_buf() - Pass ownership of a buffer from userspace to the kernel
@@ -122,6 +125,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
  */
 int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 		    struct v4l2_buffer *b);
+int vb2_ext_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
+			struct v4l2_ext_buffer *b);
 
 /**
  * vb2_qbuf() - Queue a buffer from userspace
@@ -148,6 +153,8 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
  */
 int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 	     struct v4l2_buffer *b);
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *b);
 
 /**
  * vb2_expbuf() - Export a buffer as a file descriptor
@@ -185,6 +192,8 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb);
  * from &v4l2_ioctl_ops->vidioc_dqbuf handler in driver.
  */
 int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking);
+int vb2_ext_dqbuf(struct vb2_queue *q, struct v4l2_ext_buffer *b,
+		  bool nonblocking);
 
 /**
  * vb2_streamon - start streaming
@@ -294,11 +303,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
-- 
2.26.0

