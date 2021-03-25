Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B9C3485CB
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 01:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239189AbhCYASv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 20:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239156AbhCYASY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 20:18:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC2AC06174A;
        Wed, 24 Mar 2021 17:18:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 3C1971F40DCA
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, kernel@collabora.com,
        linux-kernel@vger.kernel.org, jc@kynesim.co.uk,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 1/2] media: videobuf2: use dmabuf size for length
Date:   Wed, 24 Mar 2021 21:17:11 -0300
Message-Id: <20210325001712.197837-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Always use dmabuf size when considering the length of the buffer.
Discard userspace provided length.
Fix length check error in _verify_length(), which was handling single and
multiplanar diferently, and also not catching the case where userspace
provides a bigger length and bytesused then the underlying buffer.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Hello,

As discussed on
https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com/

This patch also helps the conversion layer of the Ext API patchset,
where we are not exposing the length field.

It was discussed that userspace might use a smaller length field to
limit the usage of the underlying buffer, but I'm not sure if this is
really usefull and just complicates things.

If this is usefull, then we should also expose a length field in the Ext
API, and document this feature properly.

What do you think?
---
 .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
 .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
 include/uapi/linux/videodev2.h                |  7 +++++--
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 02281d13505f..2cbde14af051 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
 		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
+		unsigned int bytesused;
 
 		if (IS_ERR_OR_NULL(dbuf)) {
 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
@@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 			goto err;
 		}
 
-		/* use DMABUF size if length is not provided */
-		if (planes[plane].length == 0)
-			planes[plane].length = dbuf->size;
+		planes[plane].length = dbuf->size;
+		bytesused = planes[plane].bytesused ?
+			    planes[plane].bytesused : dbuf->size;
+
+		if (planes[plane].bytesused > planes[plane].length) {
+			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane %d\n",
+				plane);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		if (planes[plane].data_offset >= bytesused) {
+			dprintk(q, 1, "data_offset >= bytesused for plane %d\n",
+				plane);
+			ret = -EINVAL;
+			goto err;
+		}
 
 		if (planes[plane].length < vb->planes[plane].min_length) {
 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 7e96f67c60ba..ffc7ed46f74a 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 	unsigned int bytesused;
 	unsigned int plane;
 
-	if (V4L2_TYPE_IS_CAPTURE(b->type))
+	/* length check for dmabuf is performed in _prepare_dmabuf() */
+	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory == VB2_MEMORY_DMABUF)
 		return 0;
 
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
 		for (plane = 0; plane < vb->num_planes; ++plane) {
-			length = (b->memory == VB2_MEMORY_USERPTR ||
-				  b->memory == VB2_MEMORY_DMABUF)
-			       ? b->m.planes[plane].length
+			length = b->memory == VB2_MEMORY_USERPTR
+				? b->m.planes[plane].length
 				: vb->planes[plane].length;
 			bytesused = b->m.planes[plane].bytesused
 				  ? b->m.planes[plane].bytesused : length;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8d15f6ccc4b4..79b3b2893513 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
  * @bytesused:		number of bytes occupied by data in the plane (payload)
- * @length:		size of this plane (NOT the payload) in bytes
+ * @length:		size of this plane (NOT the payload) in bytes. Filled
+ *			by userspace for USERPTR and by the driver for DMABUF
+ *			and MMAP.
  * @mem_offset:		when memory in the associated struct v4l2_buffer is
  *			V4L2_MEMORY_MMAP, equals the offset from the start of
  *			the device memory for this plane (or is a "cookie" that
@@ -1025,7 +1027,8 @@ struct v4l2_plane {
  * @m:		union of @offset, @userptr, @planes and @fd
  * @length:	size in bytes of the buffer (NOT its payload) for single-plane
  *		buffers (when type != *_MPLANE); number of elements in the
- *		planes array for multi-plane buffers
+ *		planes array for multi-plane buffers. Filled by userspace for
+ *		USERPTR and by the driver for DMABUF and MMAP.
  * @reserved2:	drivers and applications must zero this field
  * @request_fd: fd of the request that this buffer should use
  * @reserved:	for backwards compatibility with applications that do not know
-- 
2.30.1

