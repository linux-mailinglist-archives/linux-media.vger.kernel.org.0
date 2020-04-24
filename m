Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4744D1B70E5
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgDXJbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:31:05 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D93C09B045;
        Fri, 24 Apr 2020 02:31:05 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so4520019pfc.12;
        Fri, 24 Apr 2020 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPEZSYjn+WtLhsReT/texBQ751H/RxS2UXPSFd6gB1M=;
        b=cNeRtb9kYzMPSdTkXRY5JKPnpCTz/8HD+eL8wusXHqXSp6EfHm1L3SgI59bo/8QY07
         5dQBY1UDb3PsG75n7Hy31eHxi0xyGdojH6EnIcJ9UkOUuX0j/+6mywflIyc4An9e7Sv6
         ZaIwFd6i9O9msiK3sOBOWsQgqwGGToz+W10Zqjcf+5TEsW+aOUdYmCswkujvcb/RLBr6
         /HWNAqfKRO10v33Ut9vAVUhd7UNW1TWItrsV/TCZX19a43PamLt+hVrePQ9f5glgTM3t
         mrm+WvQLlmw/Ao2P/jCN9SnO+UC1H10hhNpRt/A6Q8LUTYmUck3oiqwqk7Wj1RsMCbw+
         975w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPEZSYjn+WtLhsReT/texBQ751H/RxS2UXPSFd6gB1M=;
        b=DHkANJQQS/ZnVxlwU+mM6yEn5eGHxhKu3GnOpFOf89IWKrhTlwzfcUWMU2JhxyEAS0
         t40iszq/zwmN0mCZKlf02fAT+luDDnN8Tkub5Llk01CyWNjfORgB6hFjdu61dt4iyMwE
         jn0NGSThsj6CMreeG8c6jA5WV5ggrcvBXLlBzW+YDFAnSmELhTFORxin0kPcszHzbcMo
         Dv32OZkvMHedbBmKHe56zUyuXxgDaB41kpEU9dRdQbF7LmkgANWWhMbKtlW/KJoEh8zW
         Xrb/tSsJZkW0txvFbtZg9Oqd7dH+gJvMHf5r/6aUQDsCDFOEcAKhX0kwiXCK/a9rK3Nh
         DB2A==
X-Gm-Message-State: AGi0PuaFfOS6poCuivEFjgy6GNGUJ/b4vZy8mT1g8r6jGxfQu7alBUaw
        lkS9yD/llxlGGAx9FzV8Aug=
X-Google-Smtp-Source: APiQypLcxm/wAIl8BywbmY78/iUqZf8yZpiKPoA3//haU4AORueSzM4KxElh9Sm3eSBMXce7n5D0xA==
X-Received: by 2002:a65:611a:: with SMTP id z26mr8046715pgu.341.1587720664462;
        Fri, 24 Apr 2020 02:31:04 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:31:03 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 06/13] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Fri, 24 Apr 2020 18:29:13 +0900
Message-Id: <20200424092920.4801-7-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
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
 .../media/v4l/vidioc-create-bufs.rst          |  7 ++-
 .../media/v4l/vidioc-reqbufs.rst              | 11 ++++-
 .../media/common/videobuf2/videobuf2-core.c   |  6 +++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 43 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +--
 include/uapi/linux/videodev2.h                | 10 ++++-
 7 files changed, 76 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index bd580232be10..4ece2551b355 100644
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
index 893570af617b..a933a72dab1f 100644
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
index f1a65925bc17..d16f47022552 100644
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
index 04ea332567b1..aeb29c33984e 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -718,12 +718,36 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 #endif
 }
 
+/*
+ * vb2_core_reqbufs()/vb2_core_create_bufs() can re-initialize the queue,
+ * change its memory, type and invoke driver's ->queue_setup(), so we need
+ * to adjust consistency flag and caps accordingly.
+ */
+static void fixup_consistency_attr(struct vb2_queue *q, unsigned int *flags)
+{
+	if (!vb2_queue_allows_cache_hints(q))
+		*flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
+}
+
+static void fixup_cache_hints_cap(struct vb2_queue *q, unsigned int *caps)
+{
+	if (!vb2_queue_allows_cache_hints(q))
+		*caps &= ~V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
+	else
+		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
+}
+
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
+	if (ret)
+		return ret;
+	ret = vb2_core_reqbufs(q, req->memory, req->flags, &req->count);
+	fixup_consistency_attr(q, &req->flags);
+	fixup_cache_hints_cap(q, &req->capabilities);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -797,8 +821,16 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
-		&create->count, requested_planes, requested_sizes);
+
+	if (ret)
+		return ret;
+
+	ret = vb2_core_create_bufs(q, create->memory,
+				   create->flags, &create->count,
+				   requested_planes, requested_sizes);
+	fixup_consistency_attr(q, &create->flags);
+	fixup_cache_hints_cap(q, &create->capabilities);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
 
@@ -973,7 +1005,10 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
+
+	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
+	fixup_consistency_attr(vdev->queue, &p->flags);
+	fixup_cache_hints_cap(vdev->queue, &p->capabilities);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a99e82ec9ab6..aa162ed6d01c 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -246,6 +246,8 @@ struct v4l2_format32 {
  * @memory:	buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored if queue
+ *		does not have V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers32 {
@@ -254,7 +256,8 @@ struct v4l2_create_buffers32 {
 	__u32			memory;	/* enum v4l2_memory */
 	struct v4l2_format32	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 static int __bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
@@ -355,7 +358,8 @@ static int get_v4l2_create32(struct v4l2_create_buffers __user *p64,
 {
 	if (!access_ok(p32, sizeof(*p32)) ||
 	    copy_in_user(p64, p32,
-			 offsetof(struct v4l2_create_buffers32, format)))
+			 offsetof(struct v4l2_create_buffers32, format)) ||
+	    assign_in_user(&p64->flags, &p32->flags))
 		return -EFAULT;
 	return __get_v4l2_format32(&p64->format, &p32->format,
 				   aux_buf, aux_space);
@@ -417,6 +421,7 @@ static int put_v4l2_create32(struct v4l2_create_buffers __user *p64,
 	    copy_in_user(p32, p64,
 			 offsetof(struct v4l2_create_buffers32, format)) ||
 	    assign_in_user(&p32->capabilities, &p64->capabilities) ||
+	    assign_in_user(&p32->flags, &p64->flags) ||
 	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
 		return -EFAULT;
 	return __put_v4l2_format32(&p64->format, &p32->format);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 833e79a2cb98..4c2dadbeefdc 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1978,9 +1978,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 
 	if (ret)
 		return ret;
-
-	CLEAR_AFTER_FIELD(p, capabilities);
-
 	return ops->vidioc_reqbufs(file, fh, p);
 }
 
@@ -2020,7 +2017,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 0d4deba8fe30..f0a4694dd7c6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -943,7 +943,10 @@ struct v4l2_requestbuffers {
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
@@ -2447,6 +2450,8 @@ struct v4l2_dbg_chip_info {
  * @memory:	enum v4l2_memory; buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored if queue
+ *		does not have V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2455,7 +2460,8 @@ struct v4l2_create_buffers {
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

