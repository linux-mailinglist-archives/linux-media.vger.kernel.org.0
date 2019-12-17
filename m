Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DEB122282
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfLQDVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:05 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39847 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfLQDVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:05 -0500
Received: by mail-pj1-f67.google.com with SMTP id v93so3899686pjb.6
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XSIy5bU94C7ExHq7Mxstf+ZVIzUJSJLIevrqaI1BwGQ=;
        b=i/ffzUXfVt9ZVc0stEesFNrjgw0DgFTgnazWdSmVjUdaF4UrOQ8Dx/ZZc1CEuUCPuT
         mCPabxbaIHgCWY0xCCjYAoWVl/gSJBIqwpvrDwpa6USXPGH+8OaZiutiAoXWRlv9u1nn
         q1mMlBvhiYlY0fOPqOM/R+6fKPHw4oxi3PwWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XSIy5bU94C7ExHq7Mxstf+ZVIzUJSJLIevrqaI1BwGQ=;
        b=QvcRqQPSxBF3XxJb9VMX/ng59KZA0BoNHk26Tif7cOR7O0ufRkfnch1jECRvlo0HgC
         QjTnkbx3A5Gbn2QJz2PPZOowS9RMQRCQYRu0Fr32B5dZ8wwqQ4VJQFgROEOlF6vnVIsW
         y26K19LK7BNtmJKPRsKG5ULC9qJdA3GdVSoZeVUQXZFwgIY/wmOJSleYiYLVyYukago4
         fcSj34YL3/JNwcZCOiz7D7awtcHZsCbX4WFdT54k2aKAIBqx+oMkICVdZVb+8Bz3gPLh
         9BXTb+5IQSp5+xchJQGgbHNOTIcLQEILE3DLKlOi7hJHqFEwZDM2O1/zv2nGsoX9JGz6
         frAQ==
X-Gm-Message-State: APjAAAU6V8CtsJW7tM8Sgwllj9TnxzhFAvmeGUIgVoU8MwWOTZZm40Aj
        Xzbs/1Bq5JAtCSNMgfcKs19Z4Q==
X-Google-Smtp-Source: APXvYqw7z1newpbr75KraDdAFl8jI8gFHUGldCPXISbX2B+3Bvi/c6fT5pmaTId5yAiaOHSv8AHUzw==
X-Received: by 2002:a17:902:70c1:: with SMTP id l1mr5558074plt.26.1576552864564;
        Mon, 16 Dec 2019 19:21:04 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:04 -0800 (PST)
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
Subject: [RFC][PATCH 06/15] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT in CREATE_BUFS
Date:   Tue, 17 Dec 2019 12:20:25 +0900
Message-Id: <20191217032034.54897-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch lets user-space to request a non-consistent memory
allocation during CREATE_BUFS ioctl call. struct v4l2_create_buffers
has seven 4-byte reserved areas, so reserved[0] is renamed to ->flags.
The struct, thus, now has six reserved 4-byte regions.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/uapi/v4l/vidioc-create-bufs.rst     |  8 +++++-
 .../media/common/videobuf2/videobuf2-core.c   | 27 +++++++++++++++----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  7 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +-
 include/media/videobuf2-core.h                |  4 ++-
 include/uapi/linux/videodev2.h                |  3 ++-
 6 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
index bd08e4f77ae4..c56e80659b4a 100644
--- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
@@ -121,7 +121,13 @@ than the number requested.
 	other changes, then set ``count`` to 0, ``memory`` to
 	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
     * - __u32
-      - ``reserved``\ [7]
+      - ``flags``
+      - Specifies additional buffer management attributes. E.g. when
+        ``V4L2_FLAG_MEMORY_NON_CONSISTENT`` set vb2 backends may be allocated
+        in non-consistent memory.
+
+    * - __u32
+      - ``reserved``\ [6]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 668c56df13f6..d1012a24755d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -812,9 +812,21 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 }
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
+static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
+{
+	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
+
+	if (consistent_mem != queue_attr) {
+		dprintk(1, "memory consistency model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-		unsigned int *count, unsigned requested_planes,
-		const unsigned requested_sizes[])
+			 bool consistent_mem, unsigned int *count,
+			 unsigned requested_planes,
+			 const unsigned requested_sizes[])
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
@@ -832,10 +844,15 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		}
 		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 		q->memory = memory;
+		__set_queue_consistency(q, consistent_mem);
 		q->waiting_for_buffers = !q->is_output;
-	} else if (q->memory != memory) {
-		dprintk(1, "memory model mismatch\n");
-		return -EINVAL;
+	} else {
+		if (q->memory != memory) {
+			dprintk(1, "memory model mismatch\n");
+			return -EINVAL;
+		}
+		if (!verify_consistency_attr(q, consistent_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 0eabb589684f..48d123a1ac2a 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -730,6 +730,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned requested_sizes[VIDEO_MAX_PLANES];
 	struct v4l2_format *f = &create->format;
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
+	bool consistent = true;
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
@@ -775,7 +776,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory,
+
+	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 225d06819bce..793cb6534de4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2012,7 +2012,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 810af5cf5742..5e5450bdabbd 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -757,6 +757,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
  * @q: pointer to &struct vb2_queue with videobuf2 queue.
  * @memory: memory type, as defined by &enum vb2_memory.
+ * @consistent_mem: memory consistency model.
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
@@ -774,7 +775,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int *count, unsigned int requested_planes,
+			 bool consistent_mem, unsigned int *count,
+			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
 /**
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 73a4854f71bd..82e2ded5a136 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2419,7 +2419,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 /*
-- 
2.24.1.735.g03f4e72817-goog

