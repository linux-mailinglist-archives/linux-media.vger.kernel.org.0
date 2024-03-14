Return-Path: <linux-media+bounces-7087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C587C056
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 16:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660511F235AD
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E1674BF0;
	Thu, 14 Mar 2024 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mVt6mO5u"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F37353D;
	Thu, 14 Mar 2024 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430362; cv=none; b=tLMj1YfIEpFZ41ohYNGVGwHWY6hkz5IRnW4Umj+MrcsZdMrSvd0lrUE1N6gTrmsG98FzWi1fbRKszo4ZvtgiThwJFEzDEOeqMfA+539wnM6wwKaFmxgL4a+UA3nfJB6Id2/ib2qCeN6zsdnJp70DrRA04WBQAmyKWmw14Ciwk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430362; c=relaxed/simple;
	bh=Q9HUxcOowkHc7BcjiEBnFMFMiMUMuxk/xPBjLZFLMEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zv1m0IUHQdEwjDiNXfjBM+ZAYakW3BwnbwKD1oi8DrssMWh/CWyrbUq0JEdgHUW/i5UYwgpPidVLpNQD8PG6NIJdXL450f5NRV3nd0Wgd3Rk9odMrmsWB6ymQqUaKZLXUWwi9HMDJGWQRpzCJjDBjhe69oC6026+tLCLjI5vYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mVt6mO5u; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710430358;
	bh=Q9HUxcOowkHc7BcjiEBnFMFMiMUMuxk/xPBjLZFLMEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVt6mO5u4mPsqCFMdy3fRaElavj4WMhilCGKi0phnTUlmk+tmAYSeFHJZR7pGsqtl
	 nYHinpPt3jXDBjFzQp3W3tQqVI6bBTt7xAA6n6yJOunSGFF0E50MoarnxeFPTdA+X0
	 eA1uckH3UWLCx7R6guZ7JzvXWPooenqYf/wfZoZFQOfn3uKh1Vrsq7QCKDg+kASSrw
	 f/jRny1Wa59cIVS4F0Ds8GZYUNwllVJeNSh7M1Q/8m4a8Y7yQkT1MVM7iC9kgubjww
	 NpejXw6QseKKsKz8bYoMC5fFKtCmx4ZhKnniotwRWgnJSHiAGrwFJAUBIK6j+KKIIu
	 04D/0Lk/weqlg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D247C378210D;
	Thu, 14 Mar 2024 15:32:37 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v21 7/9] media: v4l2: Add REMOVE_BUFS ioctl
Date: Thu, 14 Mar 2024 16:32:24 +0100
Message-Id: <20240314153226.197445-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240314153226.197445-1-benjamin.gaignard@collabora.com>
References: <20240314153226.197445-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_REMOVE_BUFS ioctl allows to remove buffers from a queue.
The number of buffers to remove in given by count field of
struct v4l2_remove_buffers and the range start at the index
specified in the same structure.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 21:
- Be more careful about checking remove_bufs type field vs queue type.
- Add documentation about type checking error.
- Always set capabilities flags field.

 .../userspace-api/media/v4l/user-func.rst     |  1 +
 .../media/v4l/vidioc-remove-bufs.rst          | 85 +++++++++++++++++++
 .../media/v4l/vidioc-reqbufs.rst              |  1 +
 .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 20 ++++-
 drivers/media/v4l2-core/v4l2-dev.c            |  3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          | 30 +++++++
 include/media/v4l2-ioctl.h                    |  4 +
 include/media/videobuf2-core.h                | 10 +++
 include/media/videobuf2-v4l2.h                |  2 +
 include/uapi/linux/videodev2.h                | 17 ++++
 11 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 15ff0bf7bbe6..6f661138801c 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -62,6 +62,7 @@ Function Reference
     vidioc-query-dv-timings
     vidioc-querystd
     vidioc-reqbufs
+    vidioc-remove-bufs
     vidioc-s-hw-freq-seek
     vidioc-streamon
     vidioc-subdev-enum-frame-interval
diff --git a/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
new file mode 100644
index 000000000000..0cbc8c7313b7
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _VIDIOC_REMOVE_BUFS:
+
+************************
+ioctl VIDIOC_REMOVE_BUFS
+************************
+
+Name
+====
+
+VIDIOC_REMOVE_BUFS - Removes buffers from a queue
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_REMOVE_BUFS
+
+``int ioctl(int fd, VIDIOC_REMOVE_BUFS, struct v4l2_remove_buffers *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_remove_buffers`.
+
+Description
+===========
+
+Applications can optionally call the :ref:`VIDIOC_REMOVE_BUFS` ioctl to
+remove buffers from a queue.
+:ref:`VIDIOC_CREATE_BUFS` ioctl support is mandatory to enable :ref:`VIDIOC_REMOVE_BUFS`.
+This ioctl is available if the ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS`` capability
+is set on the queue when :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CREATE_BUFS`
+are invoked.
+
+.. c:type:: v4l2_remove_buffers
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
+
+.. flat-table:: struct v4l2_remove_buffers
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``index``
+      - The starting buffer index to remove. This field is ignored if count == 0.
+    * - __u32
+      - ``count``
+      - The number of buffers to be removed with indices 'index' until 'index + count - 1'.
+        All buffers in this range must be valid and in DEQUEUED state.
+        :ref:`VIDIOC_REMOVE_BUFS` will always check the validity of ``type`, if it is
+        invalid it returns ``EINVAL`` error code.
+        If count is set to 0 :ref:`VIDIOC_REMOVE_BUFS` will do nothing and return 0.
+    * - __u32
+      - ``type``
+      - Type of the stream or buffers, this is the same as the struct
+	:c:type:`v4l2_format` ``type`` field. See
+	:c:type:`v4l2_buf_type` for valid values.
+    * - __u32
+      - ``reserved``\ [13]
+      - A place holder for future extensions. Drivers and applications
+	must set the array to zero.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+EBUSY
+    File I/O is in progress.
+    One or more of the buffers in the range ``index`` to ``index + count - 1`` are not
+    in DEQUEUED state.
+
+EINVAL
+    One or more of the buffers in the range ``index`` to ``index + count - 1`` do not
+    exist in the queue.
+    The buffer type (``type`` field) is not valid.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 0b3a41a45d05..bbc22dd76032 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -121,6 +121,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
 .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
+.. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:
 
 .. raw:: latex
 
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 009cea95d662..0b2b48e1b2df 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1691,6 +1691,44 @@ int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
 }
 EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
 
+int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int count)
+{
+	unsigned int i, ret = 0;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+
+	if (count == 0)
+		return 0;
+
+	if (count > q_num_bufs)
+		return -EINVAL;
+
+	if (start > q->max_num_buffers - count)
+		return -EINVAL;
+
+	mutex_lock(&q->mmap_lock);
+
+	/* Check that all buffers in the range exist */
+	for (i = start; i < start + count; i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+
+		if (!vb) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		if (vb->state != VB2_BUF_STATE_DEQUEUED) {
+			ret = -EBUSY;
+			goto unlock;
+		}
+	}
+	__vb2_queue_free(q, start, count);
+	dprintk(q, 2, "%u buffers removed\n", count);
+
+unlock:
+	mutex_unlock(&q->mmap_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vb2_core_remove_bufs);
+
 /*
  * vb2_start_streaming() - Attempt to start streaming.
  * @q:		videobuf2 queue
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 03e8080a68a8..293f3d5f1c4e 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -685,7 +685,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
 		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
 	}
 
-	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
+	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
 	if (q->io_modes & VB2_MMAP)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
 	if (q->io_modes & VB2_USERPTR)
@@ -1001,6 +1001,24 @@ EXPORT_SYMBOL_GPL(vb2_poll);
 
 /* vb2 ioctl helpers */
 
+int vb2_ioctl_remove_bufs(struct file *file, void *priv,
+			  struct v4l2_remove_buffers *d)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->queue->type != d->type)
+		return -EINVAL;
+
+	if (d->count == 0)
+		return 0;
+
+	if (vb2_queue_is_busy(vdev->queue, file))
+		return -EBUSY;
+
+	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
+
 int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p)
 {
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d13954bd31fd..e39e9742fdb5 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -722,6 +722,9 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
+		/* VIDIOC_CREATE_BUFS support is mandatory to enable VIDIOC_REMOVE_BUFS */
+		if (ops->vidioc_create_bufs)
+			SET_VALID_IOCTL(ops, VIDIOC_REMOVE_BUFS, vidioc_remove_bufs);
 	}
 
 	if (is_vid || is_vbi || is_meta) {
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6e7b8b682d13..5aeff5519407 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -489,6 +489,14 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
 	v4l_print_format(&p->format, write_only);
 }
 
+static void v4l_print_remove_buffers(const void *arg, bool write_only)
+{
+	const struct v4l2_remove_buffers *p = arg;
+
+	pr_cont("type=%s, index=%u, count=%u\n",
+		prt_names(p->type, v4l2_type_names), p->index, p->count);
+}
+
 static void v4l_print_streamparm(const void *arg, bool write_only)
 {
 	const struct v4l2_streamparm *p = arg;
@@ -2092,6 +2100,7 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
 static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	struct video_device *vfd = video_devdata(file);
 	struct v4l2_requestbuffers *p = arg;
 	int ret = check_fmt(file, p->type);
 
@@ -2100,6 +2109,10 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 
 	memset_after(p, 0, flags);
 
+	p->capabilities = 0;
+	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
+		p->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
+
 	return ops->vidioc_reqbufs(file, fh, p);
 }
 
@@ -2133,6 +2146,7 @@ static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
 static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	struct video_device *vfd = video_devdata(file);
 	struct v4l2_create_buffers *create = arg;
 	int ret = check_fmt(file, create->format.type);
 
@@ -2143,6 +2157,10 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 
 	v4l_sanitize_format(&create->format);
 
+	create->capabilities = 0;
+	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
+		create->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
+
 	ret = ops->vidioc_create_bufs(file, fh, create);
 
 	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
@@ -2161,6 +2179,17 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
 	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
 }
 
+static int v4l_remove_bufs(const struct v4l2_ioctl_ops *ops,
+			   struct file *file, void *fh, void *arg)
+{
+	struct v4l2_remove_buffers *remove = arg;
+
+	if (ops->vidioc_remove_bufs)
+		return ops->vidioc_remove_bufs(file, fh, remove);
+
+	return -ENOTTY;
+}
+
 static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2910,6 +2939,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
 	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
 	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
+	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
 };
 #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..bdbb7e542321 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -163,6 +163,8 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
  * @vidioc_prepare_buf: pointer to the function that implements
  *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
+ * @vidioc_remove_bufs: pointer to the function that implements
+ *	:ref:`VIDIOC_REMOVE_BUFS <vidioc_remove_bufs>` ioctl
  * @vidioc_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
  * @vidioc_g_fbuf: pointer to the function that implements
@@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
 				  struct v4l2_create_buffers *b);
 	int (*vidioc_prepare_buf)(struct file *file, void *fh,
 				  struct v4l2_buffer *b);
+	int (*vidioc_remove_bufs)(struct file *file, void *fh,
+				  struct v4l2_remove_buffers *d);
 
 	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
 	int (*vidioc_g_fbuf)(struct file *file, void *fh,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index b9333e2c7797..955237ac503d 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -870,6 +870,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
  */
 int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
 
+/**
+ * vb2_core_remove_bufs() -
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @start:	first index of the range of buffers to remove.
+ * @count:	number of buffers to remove.
+ *
+ *  Return: returns zero on success; an error code otherwise.
+ */
+int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int count);
+
 /**
  * vb2_core_qbuf() - Queue a buffer from userspace
  *
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 5a845887850b..77ce8238ab30 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -334,6 +334,8 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *p);
+int vb2_ioctl_remove_bufs(struct file *file, void *priv,
+			  struct v4l2_remove_buffers *p);
 
 /* struct v4l2_file_operations helpers */
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a8015e5e7fa4..2663213b76a4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1036,6 +1036,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
+#define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2624,6 +2625,20 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
 };
 
+/**
+ * struct v4l2_remove_buffers - VIDIOC_REMOVE_BUFS argument
+ * @index:	the first buffer to be removed
+ * @count:	number of buffers to removed
+ * @type:	enum v4l2_buf_type
+ * @reserved:	future extensions
+ */
+struct v4l2_remove_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2723,6 +2738,8 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
+
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
-- 
2.40.1


