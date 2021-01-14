Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D71C2F6915
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbhANSIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbhANSIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:08:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAAAC0613C1;
        Thu, 14 Jan 2021 10:08:10 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 70E5F1F45D07
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 05/11] media: videobuf2: Expose helpers for Ext qbuf/dqbuf
Date:   Thu, 14 Jan 2021 15:07:32 -0300
Message-Id: <20210114180738.1758707-6-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To overcome the limitations of Ext ioctls, that is being converted to
classic hooks, add helpers to allow applications support layouts such as
using the same buffer with planes in different offsets.

To use the new hooks, drivers should:

 static const struct v4l2_ioctl_ops ioctl_ops = {
 ...
 +	.vidioc_ext_qbuf = vb2_ioctl_ext_qbuf,
 +	.vidioc_ext_dqbuf = vb2_ioctl_ext_dqbuf,
 ...
 }

 +	vb2_set_pixelformat(dev->pixelformat)

The old hooks should be kept to keep the driver compatible with classic
Api.

Add mem_offset field to struct vb2_plane, to allow tracking where the plane
starts in a buffer, as defined from userspace.
When returning the buffer to userspace, this offset can be adjusted
depending on the data_offset returned from the driver.

Add pixelformat field to struct vb2_buffer, to allow vb2 to know how to
decompose the payload set with vb2_set_plane_payload() into color planes
when a single memory buffer is used.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Changes in v6:
This patch is based on original "media: videobuf2: Expose helpers to implement the _ext_fmt and _ext_buf hooks"

- This patch was completly refactored
- Conversions from v4l2_buffer to v4l2_ext_buffer was removed from vb2.
  Both v4l2_buffer and v4l2_ext_buffer need to be supported, since Ext is only valid
  for video devices, v4l2_buffer needs to be supported for vbi, meta, and others.
- Zero v4l2_ext_buffer.planes.m field (Tomasz for DMA-fd)

Changes in v5:
- Update with new format and buffer structs
- Updated commit message with the uAPI prefix

Changes in v4:
- Update with new format and buffer structs
- Fix some bugs caught by v4l2-compliance
- Rebased on top of media/master (post 5.8-rc1)

Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 .../media/common/videobuf2/videobuf2-core.c   |  46 ++-
 .../media/common/videobuf2/videobuf2-v4l2.c   | 326 +++++++++++++++++-
 include/media/videobuf2-core.h                |  33 +-
 include/media/videobuf2-v4l2.h                |   8 +-
 4 files changed, 388 insertions(+), 25 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 02281d13505f..b034bd525ea4 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1569,8 +1569,10 @@ static int vb2_start_streaming(struct vb2_queue *q)
 	return ret;
 }
 
-int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
-		  struct media_request *req)
+static int
+vb2_core_qbuf_common(struct vb2_queue *q, unsigned int index,
+		     struct v4l2_buffer *pb, struct v4l2_ext_buffer *eb,
+		     struct media_request *req)
 {
 	struct vb2_buffer *vb;
 	int ret;
@@ -1642,6 +1644,9 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 		if (pb) {
 			call_void_bufop(q, copy_timestamp, vb, pb);
 			call_void_bufop(q, fill_user_buffer, vb, pb);
+		} else if (eb) {
+			call_void_bufop(q, copy_timestamp_ext, vb, eb);
+			call_void_bufop(q, fill_user_ext_buffer, vb, eb);
 		}
 
 		dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
@@ -1680,6 +1685,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 
 	if (pb)
 		call_void_bufop(q, copy_timestamp, vb, pb);
+	else if (eb)
+		call_void_bufop(q, copy_timestamp_ext, vb, eb);
 
 	trace_vb2_qbuf(q, vb);
 
@@ -1693,6 +1700,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 	/* Fill buffer information for the userspace */
 	if (pb)
 		call_void_bufop(q, fill_user_buffer, vb, pb);
+	else if (eb)
+		call_void_bufop(q, fill_user_ext_buffer, vb, eb);
 
 	/*
 	 * If streamon has been called, and we haven't yet called
@@ -1710,8 +1719,21 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 	dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
 	return 0;
 }
+
+int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
+		  struct media_request *req)
+{
+	return vb2_core_qbuf_common(q, index, pb, NULL, req);
+}
 EXPORT_SYMBOL_GPL(vb2_core_qbuf);
 
+int vb2_core_ext_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
+		      struct media_request *req)
+{
+	return vb2_core_qbuf_common(q, index, NULL, pb, req);
+}
+EXPORT_SYMBOL_GPL(vb2_core_ext_qbuf);
+
 /*
  * __vb2_wait_for_done_vb() - wait for a buffer to become available
  * for dequeuing
@@ -1861,8 +1883,10 @@ static void __vb2_dqbuf(struct vb2_buffer *vb)
 	call_void_bufop(q, init_buffer, vb);
 }
 
-int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
-		   bool nonblocking)
+static int
+vb2_core_dqbuf_common(struct vb2_queue *q, unsigned int *pindex,
+		      struct v4l2_buffer *pb, struct v4l2_ext_buffer *eb,
+		      bool nonblocking)
 {
 	struct vb2_buffer *vb = NULL;
 	int ret;
@@ -1893,6 +1917,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	/* Fill buffer information for the userspace */
 	if (pb)
 		call_void_bufop(q, fill_user_buffer, vb, pb);
+	else if (eb)
+		call_void_bufop(q, fill_user_ext_buffer, vb, eb);
 
 	/* Remove from videobuf queue */
 	list_del(&vb->queued_entry);
@@ -1915,10 +1941,22 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		vb->index, vb2_state_name(vb->state));
 
 	return 0;
+}
 
+int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
+		   bool nonblocking)
+{
+	return vb2_core_dqbuf_common(q, pindex, pb, NULL, nonblocking);
 }
 EXPORT_SYMBOL_GPL(vb2_core_dqbuf);
 
+int vb2_core_ext_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
+		   bool nonblocking)
+{
+	return vb2_core_dqbuf_common(q, pindex, NULL, pb, nonblocking);
+}
+EXPORT_SYMBOL_GPL(vb2_core_ext_dqbuf);
+
 /*
  * __vb2_queue_cancel() - cancel and stop (pause) streaming
  *
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index aa4f17ec0982..0b0e4fe41f0a 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -158,6 +158,23 @@ static void __copy_timestamp(struct vb2_buffer *vb, const void *pb)
 	}
 };
 
+static void __copy_timestamp_ext(struct vb2_buffer *vb, const void *pb)
+{
+	const struct v4l2_ext_buffer *eb = pb;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *q = vb->vb2_queue;
+
+	if (q->is_output) {
+		/*
+		 * For output buffers copy the timestamp if needed,
+		 * and the timecode field and flag if needed.
+		 */
+		if (q->copy_timestamp)
+			vb->timestamp = eb->timestamp;
+		vbuf->flags |= eb->flags & V4L2_BUF_FLAG_TIMECODE;
+	}
+};
+
 static void vb2_warn_zero_bytesused(struct vb2_buffer *vb)
 {
 	static bool check_once;
@@ -211,6 +228,68 @@ vb2_fill_vb2_v4l2_buffer_flags(struct vb2_buffer *vb,
 	}
 }
 
+static int vb2_fill_vb2_v4l2_buffer_ext(struct vb2_buffer *vb,
+					const struct v4l2_ext_buffer *eb)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_plane *planes = vbuf->planes;
+	unsigned int i;
+
+	if (eb->field == V4L2_FIELD_ALTERNATE && q->is_output) {
+		/*
+		 * If the format's field is ALTERNATE, then the buffer's field
+		 * should be either TOP or BOTTOM, not ALTERNATE since that
+		 * makes no sense. The driver has to know whether the
+		 * buffer represents a top or a bottom field in order to
+		 * program any DMA correctly. Using ALTERNATE is wrong, since
+		 * that just says that it is either a top or a bottom field,
+		 * but not which of the two it is.
+		 */
+		dprintk(q, 1, "the field is incorrectly set to ALTERNATE for an output buffer\n");
+		return -EINVAL;
+	}
+	vbuf->sequence = 0;
+	vbuf->request_fd = -1;
+	vbuf->is_held = false;
+
+	for (i = 0; i < VIDEO_MAX_PLANES && eb->planes[i].m.userptr; i++) {
+		if (eb->memory == VB2_MEMORY_MMAP) {
+			planes[i].m.userptr = vb->planes[i].m.userptr;
+			planes[i].length = vb->planes[i].length;
+			planes[i].mem_offset = vb->planes[i].mem_offset;
+		} else {
+			planes[i].m.userptr = eb->planes[i].m.userptr;
+			/*
+			 * TODO: get dmabuf/mmap length, assing to max only for
+			 * userptr, that we assume userspace passed the right
+			 * size (can we assume that?)
+			 */
+			planes[i].length = UINT_MAX;
+			planes[i].mem_offset = eb->planes[i].offset;
+		}
+
+		planes[i].data_offset = 0;
+		if (V4L2_TYPE_IS_OUTPUT(eb->type)) {
+			if (eb->planes[i].bytesused == 0)
+				vb2_warn_zero_bytesused(vb);
+
+			if (vb->vb2_queue->allow_zero_bytesused)
+				planes[i].bytesused = eb->planes[i].bytesused;
+			else
+				planes[i].bytesused = eb->planes[i].bytesused ?
+						      eb->planes[i].bytesused :
+						      planes[i].length;
+		} else {
+			planes[i].bytesused = 0;
+		}
+	}
+
+	vb2_fill_vb2_v4l2_buffer_flags(vb, eb->type, eb->field, eb->flags);
+
+	return 0;
+}
+
 static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b)
 {
 	struct vb2_queue *q = vb->vb2_queue;
@@ -399,8 +478,35 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 		vb->need_cache_sync_on_prepare = 0;
 }
 
-static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
-				    struct v4l2_buffer *b, bool is_prepare,
+static enum v4l2_buf_type vb2_ext_to_queue_type(unsigned int type,
+						bool is_multiplanar)
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
+static enum v4l2_buf_type vb2_queue_to_ext_type(unsigned int type)
+{
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	else if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
+
+	return type;
+}
+
+static int vb2_queue_or_prepare_buf(struct vb2_queue *q,
+				    struct media_device *mdev,
+				    struct v4l2_buffer *b,
+				    struct v4l2_ext_buffer *eb,
+				    bool is_prepare,
 				    struct media_request **p_req)
 {
 	const char *opname = is_prepare ? "prepare_buf" : "qbuf";
@@ -408,46 +514,68 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb;
 	int ret;
+	u32 index, memory, type, request_fd;
+	u32 *flags;
+
+	/* TODO: see how to improve this */
+	if (eb) {
+		index = eb->index;
+		type = vb2_ext_to_queue_type(eb->type, q->is_multiplanar);
+		memory = eb->memory;
+		flags = (u32*)&eb->flags;
+		request_fd = eb->request_fd;
+	} else {
+		index = b->index;
+		type = b->type;
+		memory = b->memory;
+		flags = &b->flags;
+		request_fd = b->request_fd;
+	}
 
-	if (b->type != q->type) {
+	if (type != q->type) {
 		dprintk(q, 1, "%s: invalid buffer type\n", opname);
 		return -EINVAL;
 	}
 
-	if (b->index >= q->num_buffers) {
+	if (index >= q->num_buffers) {
 		dprintk(q, 1, "%s: buffer index out of range\n", opname);
 		return -EINVAL;
 	}
 
-	if (q->bufs[b->index] == NULL) {
+	if (q->bufs[index] == NULL) {
 		/* Should never happen */
 		dprintk(q, 1, "%s: buffer is NULL\n", opname);
 		return -EINVAL;
 	}
 
-	if (b->memory != q->memory) {
+	if (memory != q->memory) {
 		dprintk(q, 1, "%s: invalid memory type\n", opname);
 		return -EINVAL;
 	}
 
-	vb = q->bufs[b->index];
+	vb = q->bufs[index];
 	vbuf = to_vb2_v4l2_buffer(vb);
-	ret = __verify_planes_array(vb, b);
-	if (ret)
-		return ret;
+	if (b) {
+		ret = __verify_planes_array(vb, b);
+		if (ret)
+			return ret;
+	}
 
-	if (!is_prepare && (b->flags & V4L2_BUF_FLAG_REQUEST_FD) &&
+	if (!is_prepare && (*flags & V4L2_BUF_FLAG_REQUEST_FD) &&
 	    vb->state != VB2_BUF_STATE_DEQUEUED) {
 		dprintk(q, 1, "%s: buffer is not in dequeued state\n", opname);
 		return -EINVAL;
 	}
 
 	if (!vb->prepared) {
-		set_buffer_cache_hints(q, vb, &b->flags);
+		set_buffer_cache_hints(q, vb, flags);
 		/* Copy relevant information provided by the userspace */
 		memset(vbuf->planes, 0,
 		       sizeof(vbuf->planes[0]) * vb->num_planes);
-		ret = vb2_fill_vb2_v4l2_buffer(vb, b);
+		if (b)
+			ret = vb2_fill_vb2_v4l2_buffer(vb, b);
+		else
+			ret = vb2_fill_vb2_v4l2_buffer_ext(vb, eb);
 		if (ret)
 			return ret;
 	}
@@ -455,7 +583,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	if (is_prepare)
 		return 0;
 
-	if (!(b->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
+	if (!(*flags & V4L2_BUF_FLAG_REQUEST_FD)) {
 		if (q->requires_requests) {
 			dprintk(q, 1, "%s: queue requires requests\n", opname);
 			return -EBADR;
@@ -498,7 +626,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		    !q->ops->buf_out_validate))
 		return -EINVAL;
 
-	req = media_request_get_by_fd(mdev, b->request_fd);
+	req = media_request_get_by_fd(mdev, request_fd);
 	if (IS_ERR(req)) {
 		dprintk(q, 1, "%s: invalid request_fd\n", opname);
 		return PTR_ERR(req);
@@ -516,7 +644,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	}
 
 	*p_req = req;
-	vbuf->request_fd = b->request_fd;
+	vbuf->request_fd = request_fd;
 
 	return 0;
 }
@@ -573,6 +701,91 @@ static void v4l2_clear_buffer_flags(struct vb2_buffer *vb, u32 *flags,
 	}
 }
 
+/*
+ * v4l2_decompose_planes - decompose format into color components
+ *
+ * @eplanes: pointer to struct v4l2_ext_plane to fill.
+ * @sizeimage: size of the image when using a single plane.
+ * @pixelformat: forcc to consider when decomposing @sizeimage.
+ * @data_offset: offset of data in buffer
+ * @membuf: buffer to fill in eplanes[i].m
+ *
+ * Fill out @eplanes, dividing @sizeimage according to @pixelformat, where
+ * @sizeimage is the size of all planes in a contiguous manner.
+ */
+static int v4l2_decompose_planes(struct v4l2_ext_plane *eplanes,
+				 unsigned int sizeimage,
+				 const struct v4l2_format_info *info,
+				 unsigned int data_offset, u64 membuf)
+{
+	unsigned int i, y_plane_size, chroma_plane_size;
+
+	/*
+	 * Considering:
+	 * sizeimage = Y_plane_size + (comp_planes - 1) * chroma_plane_size
+	 * Y_plane_size = chroma_plane_size * (hdiv*vdiv)
+	 * Then:
+	 * chroma_plane_size = sizeimage / (hdiv*vdiv + comp_planes - 1)
+	 */
+	chroma_plane_size = sizeimage /
+			((info->hdiv * info->vdiv) + info->comp_planes - 1);
+	y_plane_size = chroma_plane_size * info->hdiv * info->vdiv;
+	eplanes[0].m.userptr = membuf;
+	eplanes[0].bytesused = y_plane_size;
+	eplanes[0].offset = data_offset;
+
+	for (i = 1; i < info->comp_planes; i++) {
+		eplanes[i].m.userptr = membuf;
+		eplanes[i] = eplanes[0];
+		eplanes[i].offset = data_offset + y_plane_size +
+				    chroma_plane_size * (i - 1);
+		eplanes[i].bytesused = chroma_plane_size;
+	}
+	return 0;
+}
+
+/*
+ * __fill_v4l2_ext_buffer() - fill in a struct v4l2_ext_buffer with information to be
+ * returned to userspace
+ */
+static void __fill_v4l2_ext_buffer(struct vb2_buffer *vb, void *pb)
+{
+	const struct v4l2_format_info *pix_info =
+					v4l2_format_info(vb->pixelformat);
+	struct v4l2_ext_buffer *eb = pb;
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *q = vb->vb2_queue;
+	unsigned int i;
+
+	memset(eb, 0, sizeof(*eb));
+
+	/* Copy back data such as timestamp, flags, etc. */
+	eb->index = vb->index;
+	eb->type = vb2_queue_to_ext_type(vb->type);
+	eb->flags = vbuf->flags;
+	eb->field = vbuf->field;
+	eb->timestamp = vb->timestamp;
+	eb->sequence = vbuf->sequence;
+	eb->request_fd = 0;
+	eb->memory = vb->memory;
+
+	if (vb->num_planes == 1 && pix_info)
+		v4l2_decompose_planes(eb->planes,
+			vb->planes[0].bytesused - vb->planes[0].data_offset,
+			pix_info, vb->planes[i].data_offset,
+			vb->planes[0].m.userptr);
+	else
+		for (i = 0; i < vb->num_planes; i++) {
+			eb->planes[i].m.userptr = vb->planes[i].m.userptr;
+			eb->planes[i].bytesused = vb->planes[i].bytesused -
+						  vb->planes[i].data_offset;
+			eb->planes[i].offset = vb->planes[i].mem_offset +
+					       vb->planes[i].data_offset;
+		}
+
+	v4l2_clear_buffer_flags(vb, (u32*)&eb->flags, q, vbuf, &eb->request_fd);
+}
+
 /*
  * __fill_v4l2_buffer() - fill in a struct v4l2_buffer with information to be
  * returned to userspace
@@ -665,8 +878,10 @@ static const struct vb2_buf_ops v4l2_buf_ops = {
 	.verify_planes_array	= __verify_planes_array_core,
 	.init_buffer		= __init_vb2_v4l2_buffer,
 	.fill_user_buffer	= __fill_v4l2_buffer,
+	.fill_user_ext_buffer	= __fill_v4l2_ext_buffer,
 	.fill_vb2_buffer	= __fill_vb2_buffer,
 	.copy_timestamp		= __copy_timestamp,
+	.copy_timestamp_ext	= __copy_timestamp_ext,
 };
 
 int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
@@ -758,7 +973,7 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 	if (b->flags & V4L2_BUF_FLAG_REQUEST_FD)
 		return -EINVAL;
 
-	ret = vb2_queue_or_prepare_buf(q, mdev, b, true, NULL);
+	ret = vb2_queue_or_prepare_buf(q, mdev, b, NULL, true, NULL);
 
 	return ret ? ret : vb2_core_prepare_buf(q, b->index, b);
 }
@@ -833,7 +1048,7 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		return -EBUSY;
 	}
 
-	ret = vb2_queue_or_prepare_buf(q, mdev, b, false, &req);
+	ret = vb2_queue_or_prepare_buf(q, mdev, b, NULL, false, &req);
 	if (ret)
 		return ret;
 	ret = vb2_core_qbuf(q, b->index, b, req);
@@ -843,6 +1058,27 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(vb2_qbuf);
 
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *eb)
+{
+	struct media_request *req = NULL;
+	int ret;
+
+	if (vb2_fileio_is_active(q)) {
+		dprintk(q, 1, "file io in progress\n");
+		return -EBUSY;
+	}
+
+	ret = vb2_queue_or_prepare_buf(q, mdev, NULL, eb, false, &req);
+	if (ret)
+		return ret;
+	ret = vb2_core_ext_qbuf(q, eb->index, eb, req);
+	if (req)
+		media_request_put(req);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vb2_ext_qbuf);
+
 int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 {
 	int ret;
@@ -874,6 +1110,39 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 }
 EXPORT_SYMBOL_GPL(vb2_dqbuf);
 
+int
+vb2_ext_dqbuf(struct vb2_queue *q, struct v4l2_ext_buffer *eb, bool nonblocking)
+{
+	unsigned int i;
+	int ret;
+
+	if (vb2_fileio_is_active(q)) {
+		dprintk(q, 1, "file io in progress\n");
+		return -EBUSY;
+	}
+
+	if (vb2_ext_to_queue_type(eb->type, q->is_multiplanar) != q->type) {
+		dprintk(q, 1, "invalid buffer type\n");
+		return -EINVAL;
+	}
+
+	ret = vb2_core_ext_dqbuf(q, NULL, eb, nonblocking);
+
+	if (!q->is_output &&
+	    eb->flags & V4L2_BUF_FLAG_DONE &&
+	    eb->flags & V4L2_BUF_FLAG_LAST)
+		q->last_buffer_dequeued = true;
+
+	/*
+	 *  After calling the VIDIOC_DQBUF V4L2_BUF_FLAG_DONE must be
+	 *  cleared.
+	 */
+	eb->flags &= ~V4L2_BUF_FLAG_DONE;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vb2_ext_dqbuf);
+
 int vb2_streamon(struct vb2_queue *q, enum v4l2_buf_type type)
 {
 	if (vb2_fileio_is_active(q)) {
@@ -1070,6 +1339,16 @@ int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
 
+int vb2_ioctl_ext_qbuf(struct file *file, void *priv, struct v4l2_ext_buffer *p)
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
@@ -1080,6 +1359,17 @@ int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
 
+int
+vb2_ioctl_ext_dqbuf(struct file *file, void *priv, struct v4l2_ext_buffer *p)
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
index 61969402a0e3..d3bb34fe8b7d 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -165,8 +165,12 @@ struct vb2_mem_ops {
  *		pointing to this plane.
  * @m.fd:	when memory is %VB2_MEMORY_DMABUF, a userspace file
  *		descriptor associated with this plane.
+ * @mem_offset:	offset where the plane starts. Usually 0, unless the buffer
+ *		is shared by all planes of a multi-planar format.
  * @data_offset:	offset in the plane to the start of data; usually 0,
- *		unless there is a header in front of the data.
+ *		unless there is a header in front of the data. In Ext API, this
+ *		is used by the driver to update the offset value from
+ *		v4l2_ext_buffer accordinly.
  *
  * Should contain enough information to be able to cover all the fields
  * of &struct v4l2_plane at videodev2.h.
@@ -183,6 +187,7 @@ struct vb2_plane {
 		unsigned long	userptr;
 		int		fd;
 	} m;
+	unsigned int		mem_offset;
 	unsigned int		data_offset;
 };
 
@@ -235,12 +240,14 @@ struct vb2_queue;
  * @index:		id number of the buffer.
  * @type:		buffer type.
  * @memory:		the method, in which the actual data is passed.
- * @num_planes:		number of planes in the buffer
+ * @num_planes:		number of memory planes in the buffer
  *			on an internal driver queue.
  * @timestamp:		frame timestamp in ns.
  * @request:		the request this buffer is associated with.
  * @req_obj:		used to bind this buffer to a request. This
  *			request object has a refcount.
+ * @pixelformat		pixelformat so vb2 can calculate the number of color
+ *			planes.
  */
 struct vb2_buffer {
 	struct vb2_queue	*vb2_queue;
@@ -251,6 +258,7 @@ struct vb2_buffer {
 	u64			timestamp;
 	struct media_request	*request;
 	struct media_request_object	req_obj;
+	u32			pixelformat;
 
 	/* private: internal use only
 	 *
@@ -447,18 +455,24 @@ struct vb2_ops {
  *			For V4L2 this is a &struct vb2_v4l2_buffer.
  * @fill_user_buffer:	given a &vb2_buffer fill in the userspace structure.
  *			For V4L2 this is a &struct v4l2_buffer.
+ * @fill_user_ext_buffer:given a &vb2_buffer fill in the userspace structure.
+ *			For V4L2 this is a &struct v4l2_ext_buffer.
  * @fill_vb2_buffer:	given a userspace structure, fill in the &vb2_buffer.
  *			If the userspace structure is invalid, then this op
  *			will return an error.
  * @copy_timestamp:	copy the timestamp from a userspace structure to
  *			the &struct vb2_buffer.
+ * @copy_timestamp_ext:	copy the timestamp from a userspace structure to
+ *			the &struct vb2_buffer.
  */
 struct vb2_buf_ops {
 	int (*verify_planes_array)(struct vb2_buffer *vb, const void *pb);
 	void (*init_buffer)(struct vb2_buffer *vb);
 	void (*fill_user_buffer)(struct vb2_buffer *vb, void *pb);
+	void (*fill_user_ext_buffer)(struct vb2_buffer *vb, void *pb);
 	int (*fill_vb2_buffer)(struct vb2_buffer *vb, struct vb2_plane *planes);
 	void (*copy_timestamp)(struct vb2_buffer *vb, const void *pb);
+	void (*copy_timestamp_ext)(struct vb2_buffer *vb, const void *eb);
 };
 
 /**
@@ -845,6 +859,8 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb);
  */
 int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 		  struct media_request *req);
+int vb2_core_ext_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
+		      struct media_request *req);
 
 /**
  * vb2_core_dqbuf() - Dequeue a buffer to the userspace
@@ -871,6 +887,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
  */
 int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		   bool nonblocking);
+int vb2_core_ext_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
+		       bool nonblocking);
 
 /**
  * vb2_core_streamon() - Implements VB2 stream ON logic
@@ -1149,6 +1167,17 @@ static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
 		vb->planes[plane_no].bytesused = size;
 }
 
+/**
+ * vb2_set_pixelformat() - set pixelformat for the buffer
+ * @vb:			pointer to &struct vb2_buffer.
+ * @pixelformat:	pixelformat to associate with the buffer.
+ */
+static inline void vb2_set_pixelformat(struct vb2_buffer *vb,
+				       u32 pixelformat)
+{
+	vb->pixelformat = pixelformat;
+}
+
 /**
  * vb2_get_plane_payload() - get bytesused for the plane plane_no
  * @vb:		pointer to &struct vb2_buffer to which the plane in
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index c203047eb834..96b4c67b2110 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -39,7 +39,7 @@ struct video_device;
  * @planes:	plane information (userptr/fd, length, bytesused, data_offset).
  *
  * Should contain enough information to be able to cover all the fields
- * of &struct v4l2_buffer at ``videodev2.h``.
+ * of &struct v4l2_buffer and &struct v4l2_ext_buffer at ``videodev2.h``.
  */
 struct vb2_v4l2_buffer {
 	struct vb2_buffer	vb2_buf;
@@ -150,6 +150,8 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
  */
 int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 	     struct v4l2_buffer *b);
+int vb2_ext_qbuf(struct vb2_queue *q, struct media_device *mdev,
+		 struct v4l2_ext_buffer *b);
 
 /**
  * vb2_expbuf() - Export a buffer as a file descriptor
@@ -187,6 +189,8 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb);
  * from &v4l2_ioctl_ops->vidioc_dqbuf handler in driver.
  */
 int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking);
+int vb2_ext_dqbuf(struct vb2_queue *q, struct v4l2_ext_buffer *b,
+		  bool nonblocking);
 
 /**
  * vb2_streamon - start streaming
@@ -300,7 +304,9 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 			  struct v4l2_buffer *p);
 int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p);
 int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p);
+int vb2_ioctl_ext_qbuf(struct file *file, void *priv, struct v4l2_ext_buffer *p);
 int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p);
+int vb2_ioctl_ext_dqbuf(struct file *file, void *priv, struct v4l2_ext_buffer *p);
 int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_expbuf(struct file *file, void *priv,
-- 
2.29.2

