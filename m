Return-Path: <linux-media+bounces-4753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149284AF89
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 09:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 759841C2345E
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 08:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965FA12D157;
	Tue,  6 Feb 2024 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nlphf9UB"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDDF12BE95;
	Tue,  6 Feb 2024 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707206559; cv=none; b=uAuvAbzW9EnRV63bqS64eTrPUDeYhOPHOhTYNMym0yIqoMino4vqfAyUpCn36f9kawKPhfwT4ORLVEDs4Cw1j5kfzIHwjEgaeiKxK0BWScl8rFBqQ0MzIH7of0vPwAJff+7Rll/+h8RxRhqBJPJflMSGy8ALvvpxyanZZNE89xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707206559; c=relaxed/simple;
	bh=GWxQq9cdwZMg27lCcjXNdFGfissZ/bK38L1X9yZMB1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kVlDfn0464Zx974c1BwMr/s9xHKIb4uw5tb81miqszp1xOLGUZ3WAhqWEVMS/iLo+Gx5rbFA0NVmdXKnMqnjHJUCvpEXDsMojp80W3Lhoh17VUT0xbBsfrn1CsSyuTrHIlgVKChglaiFkwk87dgmIhWqKeTqj4zU+WVjINbPmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nlphf9UB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707206549;
	bh=GWxQq9cdwZMg27lCcjXNdFGfissZ/bK38L1X9yZMB1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nlphf9UBH710Tc32kSrUWSqsfkcNi7DveYyg1NOltHIR/GDJ0DFUV7Kzd/F8Yaxxr
	 skV5GJhOgm5ppBrkrBwlSPSlYfE+yVCXHS8P2mNFA46RFZ3z0Kn/pTjPXVxVBS022V
	 RT2zQC2WL5FVe6GM70Gm+n/PCNWjzjxqtDwGtK4334ifNuBcExIFRqbsIWZpMvyRKm
	 bu87fwWvgp0uevXzd6cGq1yCV5h1F/te5uRaxSCim8FKlSkg4/KVmh8VTjMEAeGC7p
	 7jsO5h1sJRT31rVPIWK2Md93IEj1nVUAaPZjc3uGFCnFbFrnrzpGS1S0dA2ChMrDnR
	 lZIGzSxNqOspA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1AFC03782080;
	Tue,  6 Feb 2024 08:02:29 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v19 7/9] media: v4l2: Add DELETE_BUFS ioctl
Date: Tue,  6 Feb 2024 09:02:17 +0100
Message-Id: <20240206080219.11951-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240206080219.11951-1-benjamin.gaignard@collabora.com>
References: <20240206080219.11951-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_DELETE_BUFS ioctl allows to delete buffers from a queue.
The number of buffers to delete in given by count field of
struct v4l2_delete_buffers and the range start at the index
specified in the same structure.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 19:
- Fix documentation
- Change where DELETE_BUFS is enabled

 .../userspace-api/media/v4l/user-func.rst     |  1 +
 .../media/v4l/vidioc-delete-bufs.rst          | 79 +++++++++++++++++++
 .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 12 +++
 drivers/media/v4l2-core/v4l2-dev.c            |  3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          | 24 ++++++
 include/media/v4l2-ioctl.h                    |  4 +
 include/media/videobuf2-core.h                | 10 +++
 include/media/videobuf2-v4l2.h                |  2 +
 include/uapi/linux/videodev2.h                | 16 ++++
 10 files changed, 189 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 15ff0bf7bbe6..3fd567695477 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -17,6 +17,7 @@ Function Reference
     vidioc-dbg-g-chip-info
     vidioc-dbg-g-register
     vidioc-decoder-cmd
+    vidioc-delete-bufs
     vidioc-dqevent
     vidioc-dv-timings-cap
     vidioc-encoder-cmd
diff --git a/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
new file mode 100644
index 000000000000..7900a86bb576
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
@@ -0,0 +1,79 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _VIDIOC_DELETE_BUFS:
+
+************************
+ioctl VIDIOC_DELETE_BUFS
+************************
+
+Name
+====
+
+VIDIOC_DELETE_BUFS - Deletes buffers from a queue
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_DELETE_BUFS
+
+``int ioctl(int fd, VIDIOC_DELETE_BUFS, struct v4l2_delete_buffers *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_delete_buffers`.
+
+Description
+===========
+
+Applications can optionally call the :ref:`VIDIOC_DELETE_BUFS` ioctl to
+delete buffers from a queue.
+:ref:`VIDIOC_CREATE_BUFS` ioctl support is mandatory to enable :ref:`VIDIOC_DELETE_BUFS`.
+
+.. c:type:: v4l2_delete_buffers
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
+
+.. flat-table:: struct v4l2_delete_buffers
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``index``
+      - The starting buffer index to delete.
+    * - __u32
+      - ``count``
+      - The number of buffers to be deleted with indices 'index' until 'index + count - 1'.
+        All buffers in this range must be valid and in DEQUEUED state.
+        If count is set to 0 :ref:`VIDIOC_DELETE_BUFS` will do nothing and return 0.
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
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 009cea95d662..da1fc84c13c3 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1691,6 +1691,44 @@ int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
 }
 EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
 
+int vb2_core_delete_bufs(struct vb2_queue *q, unsigned int start, unsigned int count)
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
+	dprintk(q, 2, "%u buffers deleted\n", count);
+
+unlock:
+	mutex_unlock(&q->mmap_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vb2_core_delete_bufs);
+
 /*
  * vb2_start_streaming() - Attempt to start streaming.
  * @q:		videobuf2 queue
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 03e8080a68a8..8e437104f9c1 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1001,6 +1001,18 @@ EXPORT_SYMBOL_GPL(vb2_poll);
 
 /* vb2 ioctl helpers */
 
+int vb2_ioctl_delete_bufs(struct file *file, void *priv,
+			  struct v4l2_delete_buffers *d)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vb2_queue_is_busy(vdev->queue, file))
+		return -EBUSY;
+
+	return vb2_core_delete_bufs(vdev->queue, d->index, d->count);
+}
+EXPORT_SYMBOL_GPL(vb2_ioctl_delete_bufs);
+
 int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p)
 {
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d13954bd31fd..af83424ae8cd 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -722,6 +722,9 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
+		/* VIDIOC_CREATE_BUFS support is mandatory to enable VIDIOC_DELETE_BUFS */
+		if (ops->vidioc_create_bufs)
+			SET_VALID_IOCTL(ops, VIDIOC_DELETE_BUFS, vidioc_delete_bufs);
 	}
 
 	if (is_vid || is_vbi || is_meta) {
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 33076af4dfdb..a172d33edd19 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -489,6 +489,14 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
 	v4l_print_format(&p->format, write_only);
 }
 
+static void v4l_print_delete_buffers(const void *arg, bool write_only)
+{
+	const struct v4l2_delete_buffers *p = arg;
+
+	pr_cont("type=%s, index=%u, count=%u\n",
+		prt_names(p->type, v4l2_type_names), p->index, p->count);
+}
+
 static void v4l_print_streamparm(const void *arg, bool write_only)
 {
 	const struct v4l2_streamparm *p = arg;
@@ -2161,6 +2169,21 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
 	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
 }
 
+static int v4l_delete_bufs(const struct v4l2_ioctl_ops *ops,
+			   struct file *file, void *fh, void *arg)
+{
+	struct v4l2_delete_buffers *delete = arg;
+	int ret = check_fmt(file, delete->type);
+
+	if (ret)
+		return ret;
+
+	if (ops->vidioc_delete_bufs)
+		return ops->vidioc_delete_bufs(file, fh, delete);
+
+	return -ENOTTY;
+}
+
 static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2910,6 +2933,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
 	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
 	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
+	IOCTL_INFO(VIDIOC_DELETE_BUFS, v4l_delete_bufs, v4l_print_delete_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_delete_buffers, type)),
 };
 #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..55afbde54211 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -163,6 +163,8 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
  * @vidioc_prepare_buf: pointer to the function that implements
  *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
+ * @vidioc_delete_bufs: pointer to the function that implements
+ *	:ref:`VIDIOC_DELETE_BUFS <vidioc_delete_bufs>` ioctl
  * @vidioc_overlay: pointer to the function that implements
  *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
  * @vidioc_g_fbuf: pointer to the function that implements
@@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
 				  struct v4l2_create_buffers *b);
 	int (*vidioc_prepare_buf)(struct file *file, void *fh,
 				  struct v4l2_buffer *b);
+	int (*vidioc_delete_bufs)(struct file *file, void *fh,
+				  struct v4l2_delete_buffers *d);
 
 	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
 	int (*vidioc_g_fbuf)(struct file *file, void *fh,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 88e35a3b7730..0d17e5605c09 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -867,6 +867,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
  */
 int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
 
+/**
+ * vb2_core_delete_bufs() -
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @start:	first index of the range of buffers to delete.
+ * @count:	number of buffers to delete.
+ *
+ *  Return: returns zero on success; an error code otherwise.
+ */
+int vb2_core_delete_bufs(struct vb2_queue *q, unsigned int start, unsigned int count);
+
 /**
  * vb2_core_qbuf() - Queue a buffer from userspace
  *
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 5a845887850b..ddc08623606c 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -334,6 +334,8 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
 int vb2_ioctl_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *p);
+int vb2_ioctl_delete_bufs(struct file *file, void *priv,
+			  struct v4l2_delete_buffers *p);
 
 /* struct v4l2_file_operations helpers */
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 68e7ac178cc2..47fdd17babbb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2624,6 +2624,20 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
 };
 
+/**
+ * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
+ * @index:	the first buffer to be deleted
+ * @count:	number of buffers to delete
+ * @type:	enum v4l2_buf_type
+ * @reserved:	future extensions
+ */
+struct v4l2_delete_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2723,6 +2737,8 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
+
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
-- 
2.40.1


