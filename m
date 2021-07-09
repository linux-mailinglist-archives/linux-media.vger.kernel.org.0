Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D2F3C216F
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhGIJXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbhGIJXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7534C0613E6
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:53 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 37so9394173pgq.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VfmHpuOxZMmMvVhrd5ArvFOEjEKFRrOhEcnLhykFAY4=;
        b=dctuH5Wo7kjL4MxorZL1OqKMi9OYaLEIxrDYTpcwyX6FUElcslqMfNO/6TNybY3vRm
         S5zv3xfRYgxWWJWqRh1gxDPt1kRnWSC3+LTrBU0NrQBEN80uZQqlvzWnjLGeYjKxraOR
         s5nSnDo2vHpnjVX2/owXpSYn10dknswkRLQwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfmHpuOxZMmMvVhrd5ArvFOEjEKFRrOhEcnLhykFAY4=;
        b=pDPtugj5W8S8fYBylkd03/UOF84i0VSltjGYZ/h88EIbR6PEXguNUMctM3wsZf+wJ+
         R0y5+CzHhPb7n+Z1BhtHUIjMrnKEZopy0OzhsfE1i9golay9ECenUGXN/JWFcVnZ55LC
         C0YN26D1DbVpFGbeX4c1fi8rrTMDXpxgs7ZLhEzG4nb4Ye+1gwoZStz7uH6gLc8ynpEO
         2yn3oMj2J5eqfHlJ9yg7XNAhCH5bbSQIzOtrdfHshzB482dehaP6cKbfK560rWoKsCEg
         r4utABWiwqqQnBI+vtcf9XT/gkcH+zAwI7NkKs1Mcq6zNUHpAHxGRVVCbfFWoHctekc5
         5Opw==
X-Gm-Message-State: AOAM532ug+yfIntR+36JAnRGiRHaAFSlQuUBOjaK4qCYdljzzzbKmAlv
        ctnwJA8sQcBAm7YeAL9HUKqK7A==
X-Google-Smtp-Source: ABdhPJxvRf9MoipAFm7jZVDv/sPMS9cvTK2p/9LPaMVp7fzQal/+TAs0335YHQXvqydb3GhMG5bDEg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr37016045pgi.91.1625822453421;
        Fri, 09 Jul 2021 02:20:53 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:53 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
Date:   Fri,  9 Jul 2021 18:20:26 +0900
Message-Id: <20210709092027.1050834-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709092027.1050834-1-senozhatsky@chromium.org>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch lets user-space to request a non-coherent memory
allocation during CREATE_BUFS and REQBUFS ioctl calls.

= CREATE_BUFS

  struct v4l2_create_buffers has seven 4-byte reserved areas,
  so reserved[0] is renamed to ->flags. The struct, thus, now
  has six reserved 4-byte regions.

= CREATE_BUFS32

  struct v4l2_create_buffers32 has seven 4-byte reserved areas,
  so reserved[0] is renamed to ->flags. The struct, thus, now
  has six reserved 4-byte regions.

= REQBUFS

 We use one byte of a 4 byte ->reserved[1] member of struct
 v4l2_requestbuffers. The struct, thus, now has reserved 3 bytes.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/vidioc-create-bufs.rst          |  7 ++++-
 .../media/v4l/vidioc-reqbufs.rst              | 11 ++++---
 .../media/common/videobuf2/videobuf2-core.c   |  4 +--
 .../media/common/videobuf2/videobuf2-v4l2.c   | 31 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
 include/uapi/linux/videodev2.h                |  9 ++++--
 7 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index f98f18c9e91c..a048a9f6b7b6 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -113,7 +113,12 @@ than the number requested.
 	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
 
     * - __u32
-      - ``reserved``\ [7]
+      - ``flags``
+      - Specifies additional buffer management attributes.
+	See :ref:`memory-flags`.
+
+    * - __u32
+      - ``reserved``\ [6]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index e59306aba2b0..099fa6695167 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -104,10 +104,13 @@ aborting or finishing any DMA in progress, an implicit
 	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
 	free any previously allocated buffers, so this is typically something
 	that will be done at the start of the application.
-    * - __u32
-      - ``reserved``\ [1]
-      - A place holder for future extensions. Drivers and applications
-	must set the array to zero.
+    * - __u8
+      - ``flags``
+      - Specifies additional buffer management attributes.
+	See :ref:`memory-flags`.
+    * - __u8
+      - ``reserved``\ [3]
+      - Reserved for future extensions.
 
 .. _v4l2-buf-capabilities:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP:
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index af4db310cf5e..38505783247e 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -762,7 +762,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
-	bool coherent_mem = true;
+	bool coherent_mem = !(flags & V4L2_MEMORY_FLAG_NON_COHERENT);
 	unsigned int i;
 	int ret;
 
@@ -906,7 +906,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
-	bool coherent_mem = true;
+	bool coherent_mem = !(flags & V4L2_MEMORY_FLAG_NON_COHERENT);
 	int ret;
 
 	if (q->num_buffers == VB2_MAX_FRAME) {
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index b4f70ddb09b0..6edf4508c636 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -692,12 +692,32 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 #endif
 }
 
+static void validate_memory_flags(struct vb2_queue *q,
+				  int memory,
+				  u32 *flags)
+{
+	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
+		/*
+		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
+		 * but in order to avoid bugs we zero out all bits.
+		 */
+		*flags = 0;
+	} else {
+		/* Clear all unknown flags. */
+		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
+	}
+}
+
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
+	u32 flags = req->flags;
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
+	validate_memory_flags(q, req->memory, &flags);
+	req->flags = flags;
+	return ret ? ret : vb2_core_reqbufs(q, req->memory,
+					    req->flags, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -729,6 +749,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
+	validate_memory_flags(q, create->memory, &create->flags);
 	create->index = q->num_buffers;
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;
@@ -772,7 +793,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
 	return ret ? ret : vb2_core_create_bufs(q, create->memory,
-						0,
+						create->flags,
 						&create->count,
 						requested_planes,
 						requested_sizes);
@@ -969,13 +990,16 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	u32 flags = p->flags;
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
+	validate_memory_flags(vdev->queue, p->memory, &flags);
+	p->flags = flags;
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
+	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
@@ -993,6 +1017,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 
 	p->index = vdev->queue->num_buffers;
 	fill_buf_caps(vdev->queue, &p->capabilities);
+	validate_memory_flags(vdev->queue, p->memory, &p->flags);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 47aff3b19742..8176769a89fa 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -126,6 +126,9 @@ struct v4l2_format32 {
  * @memory:	buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored unless the
+ *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability and
+ *		configured for MMAP streaming I/O).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers32 {
@@ -134,7 +137,8 @@ struct v4l2_create_buffers32 {
 	__u32			memory;	/* enum v4l2_memory */
 	struct v4l2_format32	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 static int get_v4l2_format32(struct v4l2_format *p64,
@@ -182,6 +186,8 @@ static int get_v4l2_create32(struct v4l2_create_buffers *p64,
 	if (copy_from_user(p64, p32,
 			   offsetof(struct v4l2_create_buffers32, format)))
 		return -EFAULT;
+	if (copy_from_user(&p64->flags, &p32->flags, sizeof(p32->flags)))
+		return -EFAULT;
 	return get_v4l2_format32(&p64->format, &p32->format);
 }
 
@@ -227,6 +233,7 @@ static int put_v4l2_create32(struct v4l2_create_buffers *p64,
 	if (copy_to_user(p32, p64,
 			 offsetof(struct v4l2_create_buffers32, format)) ||
 	    put_user(p64->capabilities, &p32->capabilities) ||
+	    put_user(p64->flags, &p32->flags) ||
 	    copy_to_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
 		return -EFAULT;
 	return put_v4l2_format32(&p64->format, &p32->format);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..6a941da33998 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2004,7 +2004,7 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(p, capabilities);
+	CLEAR_AFTER_FIELD(p, flags);
 
 	return ops->vidioc_reqbufs(file, fh, p);
 }
@@ -2045,7 +2045,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9d11e1d9c934..7973aa0465d2 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -953,7 +953,8 @@ struct v4l2_requestbuffers {
 	__u32			type;		/* enum v4l2_buf_type */
 	__u32			memory;		/* enum v4l2_memory */
 	__u32			capabilities;
-	__u32			reserved[1];
+	__u8			flags;
+	__u8			reserved[3];
 };
 
 #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
@@ -2501,6 +2502,9 @@ struct v4l2_dbg_chip_info {
  * @memory:	enum v4l2_memory; buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored unless the
+ *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
+ *		and configured for MMAP streaming I/O).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2509,7 +2513,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 /*
-- 
2.32.0.93.g670b81a890-goog

