Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C60415145A
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgBDC5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:10 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40722 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgBDC5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:09 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so8662196pfh.7
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GvJQz/sjsiNa3Q1UEmIdKwgVvFAZeh869jBsgc8r4pg=;
        b=UfB4HPscgZp/SJ7PW6PIQO1t6SGzG/PhSmnkSl1HmtHTSgzcbFVp0J+Scn5VXlhHPz
         Nu3yBbP7PYddEFrl3WGnl4WvAO/PymsNFCG9cD58XWJzm7iHNyj0Hynf3Mw9qOV7zoHH
         mlIq1Dbp29L7B8k/pBGUo+0ZLyaGXjaEaYT9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GvJQz/sjsiNa3Q1UEmIdKwgVvFAZeh869jBsgc8r4pg=;
        b=MLYDVYWyFl5nzcnIu+CnXShDzEu5Q4CYMMCW4d/oFay7Flt/fim3+LjRY8gO6+TIgG
         RcoeNPxC0CNYx+Rwwz/VLY2YN77PxUAONmVfENjtxVPDVcL6Kd0tHHISyzafuy3YXhzZ
         7HdPw724nD8x1eewAUhPYFrcAxsi4WfWKJvTYFTRAwS7evsmxC6ZMBRerY+N25xrE23t
         ZJroUs8vedcymi5W/xU0MDcELbCeGTA8Veb/cfN6UEDu0cdUt745ZtL0IRaO3hqfyqc7
         p6mR4CD5rCDgIBRLiLVvn29l7pZJN9lyNPxof5XzSycCgO+7+BeRbcJMI9RJxe6qq0+B
         /llw==
X-Gm-Message-State: APjAAAV44728yOL5UJMtC3p3dkoRti2/frrAVH3pq4g6C+nuiLNqSXgh
        gGeCCQoZuKko7tsBjdrRfXKDKA==
X-Google-Smtp-Source: APXvYqwpw9CNzxMlyf5JStAP2sZ6crtBiybGq9mMXiWx3QEyjfSSqKG38CdAdhtco9UzVHYRlPs1kQ==
X-Received: by 2002:a63:4b49:: with SMTP id k9mr28771860pgl.269.1580785027062;
        Mon, 03 Feb 2020 18:57:07 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:06 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 05/12] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Tue,  4 Feb 2020 11:56:34 +0900
Message-Id: <20200204025641.218376-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch lets user-space to request a non-consistent memory
allocation during CREATE_BUFS and REQBUFS ioctl calls.

= CREATE_BUFS

  struct v4l2_create_buffers has seven 4-byte reserved areas,
  so reserved[0] is renamed to ->flags. The struct, thus, now
  has six reserved 4-byte regions.

= REQBUFS

 We use one bit of a ->reserved[1] member of struct v4l2_requestbuffers,
 which is now renamed to ->flags. Unlike v4l2_create_buffers, struct
 v4l2_requestbuffers does not have enough reserved room. Therefore for
 backward compatibility  ->reserved and ->flags were put into anonymous
 union.

Change-Id: I0eaab3428de499ce1bce6fc6b26c5ca5ff405882
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/uapi/v4l/vidioc-create-bufs.rst     |  9 +++++++-
 .../media/uapi/v4l/vidioc-reqbufs.rst         | 15 ++++++++++---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 21 ++++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +----
 include/uapi/linux/videodev2.h                |  8 +++++--
 5 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
index bd08e4f77ae4..68185e94b686 100644
--- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
@@ -121,7 +121,14 @@ than the number requested.
 	other changes, then set ``count`` to 0, ``memory`` to
 	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
     * - __u32
-      - ``reserved``\ [7]
+      - ``flags``
+      - Specifies additional buffer management attributes. Valid only when
+	queue reports :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
+	Old drivers and applications must set it to zero.
+
+
+    * - __u32
+      - ``reserved``\ [6]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index d0c643db477a..9741dac0d5b3 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -112,10 +112,19 @@ aborting or finishing any DMA in progress, an implicit
 	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
 	free any previously allocated buffers, so this is typically something
 	that will be done at the start of the application.
-    * - __u32
+    * - union
+      - (anonymous)
+    * -
+      - __u32
+      - ``flags``\ [1]
+      - Specifies additional buffer management attributes. Valid only when
+	queue reports :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
+	Old drivers and applications must set it to zero.
+
+    * -
+      - __u32
       - ``reserved``\ [1]
-      - A place holder for future extensions. Drivers and applications
-	must set the array to zero.
+      - Kept for backwards compatibility. Use ``flags`` instead.
 
 .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 7cdfcd1baf82..eb5d1306cb03 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -707,9 +707,15 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
+	bool consistent = true;
+
+	if (req->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
+	if (ret)
+		return ret;
+	return vb2_core_reqbufs(q, req->memory, consistent, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -738,6 +744,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned requested_sizes[VIDEO_MAX_PLANES];
 	struct v4l2_format *f = &create->format;
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
+	bool consistent = true;
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
@@ -783,7 +790,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
+
+	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
@@ -953,13 +964,17 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	bool consistent = true;
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
+	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index aaf83e254272..9791e2882382 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1973,9 +1973,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 
 	if (ret)
 		return ret;
-
-	CLEAR_AFTER_FIELD(p, capabilities);
-
 	return ops->vidioc_reqbufs(file, fh, p);
 }
 
@@ -2015,7 +2012,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 72efc1c544cd..169a8cf345ed 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -938,7 +938,10 @@ struct v4l2_requestbuffers {
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
@@ -2445,7 +2448,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 /*
-- 
2.25.0.341.g760bfbb309-goog

