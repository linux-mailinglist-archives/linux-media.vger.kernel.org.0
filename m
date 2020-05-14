Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9841D35DE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgENQCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:40 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B2FC061A0C;
        Thu, 14 May 2020 09:02:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n18so1503156pfa.2;
        Thu, 14 May 2020 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/nDwNvXr4FS6HqLEsFTMtUWrI4iLPFgT1txuDcLdyIs=;
        b=MBJye/egwR6TxGrbtL0w/Q4nb5bnV4gLNqPzm/2vbO1WM9hA3pTewxdbboZSYN+aO6
         oFqjfW4XgVVK3FkOSfBSZfsCg6ELdGhCuGVHnc6ha3iEIerTE04xtCQiUfEQMRcDxY3s
         ZwJT4wyLkLdAg2Y0/tezBeH6xhM7rmT07kDowv9NxCEx/cyQBp8EWWK6xnWw/RyLBXhS
         BVm/0NsH/HjxUgOiDle6lojI4uxOXIsTpkC+yfuJeH+0ojrjMUWaMjK2gZv47FNzdPMw
         yYw+UHRLBE/dN4jvzHMeFRiuM/R1ddDlBgj7v3HpLNVqdM49mWfeFeze69G78SnchiHi
         b+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/nDwNvXr4FS6HqLEsFTMtUWrI4iLPFgT1txuDcLdyIs=;
        b=HaJ+kSk9PHbJTWplholcgibpyyo/aPT4DwfJjtbFwdF3GdJVD4+Bmz1ETc6KE9ct62
         IAZ19fZ7bJUVR/M2fq2gMmCaE88n4guUsoNZ96faUUhu+LvD9fnEtJ0yt41yGoatxksz
         gvbKrinE/sEogInKvSZd3IqnHtaD01HgB/E6CbSZWH18NlcXw3f4O43sO0XLrqO3S2uw
         Z4hXHOq2bFCyX+xBX1axvk25M8TK3p+dzy5hHC30SXIJ86WdkUN78HUNx8Jgh4oYe82t
         IWiMvcmZm2jIran0entTcWxc9Ds+R1/8rZeX3UpzieZmrYORv1xM9olUhtf5rIfhRXnl
         j5cw==
X-Gm-Message-State: AOAM531thfpTGRhPVhkhwaEs5KPdFS4L/lw7NXYtw3nZkRQTe1kdiCOa
        0EbnTqeDDACZSpGF+habSDo=
X-Google-Smtp-Source: ABdhPJy9V7+BBnL1yo2cmrr5jKObiD1Fls7tfCvJ8hi9EaEnNuM3iD9psR/hqlXAircY1GqwTkNI+Q==
X-Received: by 2002:a63:f242:: with SMTP id d2mr923438pgk.212.1589472159758;
        Thu, 14 May 2020 09:02:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:38 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 06/14] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Fri, 15 May 2020 01:01:45 +0900
Message-Id: <20200514160153.3646-7-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

This patch lets user-space to request a non-consistent memory
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

 We use one bit of a ->reserved[1] member of struct v4l2_requestbuffers,
 which is now renamed to ->flags. Unlike v4l2_create_buffers, struct
 v4l2_requestbuffers does not have enough reserved room. Therefore for
 backward compatibility  ->reserved and ->flags were put into anonymous
 union.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/vidioc-create-bufs.rst          |  7 +++++-
 .../media/v4l/vidioc-reqbufs.rst              | 11 +++++++--
 .../media/common/videobuf2/videobuf2-core.c   |  6 +++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 24 +++++++++++++++----
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 10 ++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +---
 include/uapi/linux/videodev2.h                | 11 +++++++--
 7 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index e1afc5b504c2..f2a702870fad 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -121,7 +121,12 @@ than the number requested.
 	other changes, then set ``count`` to 0, ``memory`` to
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
index 96a59793d857..75d894d9c36c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -112,10 +112,17 @@ aborting or finishing any DMA in progress, an implicit
 	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
 	free any previously allocated buffers, so this is typically something
 	that will be done at the start of the application.
+    * - union {
+      - (anonymous)
+    * - __u32
+      - ``flags``
+      - Specifies additional buffer management attributes.
+	See :ref:`memory-flags`.
     * - __u32
       - ``reserved``\ [1]
-      - A place holder for future extensions. Drivers and applications
-	must set the array to zero.
+      - Kept for backwards compatibility. Use ``flags`` instead.
+    * - }
+      -
 
 .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b1332f7f1aad..6efac531006f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -695,6 +695,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned int i;
 	int ret;
 
+	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent_mem = false;
+
 	if (q->streaming) {
 		dprintk(1, "streaming active\n");
 		return -EBUSY;
@@ -838,6 +841,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	bool consistent_mem = true;
 	int ret;
 
+	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent_mem = false;
+
 	if (q->num_buffers == VB2_MAX_FRAME) {
 		dprintk(1, "maximum number of buffers already allocated\n");
 		return -ENOBUFS;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 26a3ec333bb7..559a229cac41 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -718,12 +718,22 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 #endif
 }
 
+static void clear_consistency_attr(struct vb2_queue *q,
+				   int memory,
+				   unsigned int *flags)
+{
+	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
+		*flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
+}
+
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
+	clear_consistency_attr(q, req->memory, &req->flags);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory,
+					    req->flags, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -755,6 +765,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
+	clear_consistency_attr(q, create->memory, &create->flags);
 	create->index = q->num_buffers;
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;
@@ -797,8 +808,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory, 0,
-		&create->count, requested_planes, requested_sizes);
+	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+						create->flags,
+						&create->count,
+						requested_planes,
+						requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
 
@@ -969,11 +983,12 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
+	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
+	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
@@ -991,6 +1006,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 
 	p->index = vdev->queue->num_buffers;
 	fill_buf_caps(vdev->queue, &p->capabilities);
+	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a99e82ec9ab6..593bcf6c3735 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -246,6 +246,9 @@ struct v4l2_format32 {
  * @memory:	buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored unless the
+ *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability and
+ *		configured for MMAP streaming I/O).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers32 {
@@ -254,7 +257,8 @@ struct v4l2_create_buffers32 {
 	__u32			memory;	/* enum v4l2_memory */
 	struct v4l2_format32	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 static int __bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
@@ -355,7 +359,8 @@ static int get_v4l2_create32(struct v4l2_create_buffers __user *p64,
 {
 	if (!access_ok(p32, sizeof(*p32)) ||
 	    copy_in_user(p64, p32,
-			 offsetof(struct v4l2_create_buffers32, format)))
+			 offsetof(struct v4l2_create_buffers32, format)) ||
+	    assign_in_user(&p64->flags, &p32->flags))
 		return -EFAULT;
 	return __get_v4l2_format32(&p64->format, &p32->format,
 				   aux_buf, aux_space);
@@ -417,6 +422,7 @@ static int put_v4l2_create32(struct v4l2_create_buffers __user *p64,
 	    copy_in_user(p32, p64,
 			 offsetof(struct v4l2_create_buffers32, format)) ||
 	    assign_in_user(&p32->capabilities, &p64->capabilities) ||
+	    assign_in_user(&p32->flags, &p64->flags) ||
 	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
 		return -EFAULT;
 	return __put_v4l2_format32(&p64->format, &p32->format);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2322f08a98be..02bfef0da76d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2038,9 +2038,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 
 	if (ret)
 		return ret;
-
-	CLEAR_AFTER_FIELD(p, capabilities);
-
 	return ops->vidioc_reqbufs(file, fh, p);
 }
 
@@ -2080,7 +2077,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 34ba1017b89b..fec2607a07e3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -946,7 +946,10 @@ struct v4l2_requestbuffers {
 	__u32			type;		/* enum v4l2_buf_type */
 	__u32			memory;		/* enum v4l2_memory */
 	__u32			capabilities;
-	__u32			reserved[1];
+	union {
+		__u32		flags;
+		__u32		reserved[1];
+	};
 };
 
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
@@ -2450,6 +2453,9 @@ struct v4l2_dbg_chip_info {
  * @memory:	enum v4l2_memory; buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored unless the
+ *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
+ *		and configured for MMAP streaming I/O).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2458,7 +2464,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 /*
-- 
2.26.2

