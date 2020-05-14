Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4FD1D35DA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgENQCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59584C061A0C;
        Thu, 14 May 2020 09:02:30 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so1493075pfx.7;
        Thu, 14 May 2020 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nRxVz0Tz30cjvXMeYztWae2hdLtVm4GWG5AnsWwh9o=;
        b=bVyzPlijkSkZlbCvdUbf1g+pH293J7R1MR8vpSY6yJo/rBafYOozJh46NVAdvgp75R
         Uy/urpjq4AIVjgHm0HboabzXqZ5tvRJdh5EBxcQERTwZY/mCZ0YwXhhGIFfRloKyzznB
         eGhZ5FdH1LfO5Bk932yyGpHrARbJnQ7J47k3hhfGQa5ZcMEUHCtePxK7dc5qbWY+POjm
         aCaitRFYEg6oZzAcAqgDTjc8PDnJYHHMJc8fFTfdRzyLJvHGiRK4q4d2fiedfTA0tQvK
         6g01uat2W5EOOCoDql8Q1Jpo5BqYfYGxUO97CTOyang8PaHiOz6YzIoMstXPbiUHgAuz
         AF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nRxVz0Tz30cjvXMeYztWae2hdLtVm4GWG5AnsWwh9o=;
        b=hP/x5n0sO0ipvzskhWi90BvnRAqTT27bfjL/mvMnLTc3Dg2UOzP0R0akY8SVR7S1pk
         AZHodOP3Yr0Xo7Im5CEiTYek03K3iJgao8kxwn26YqQx8hdvCpLYpsPs2AH0Sg1h4b8b
         0yP3SeW98uBVd3tKkjFeJ2CRXfKtdhOml8hYUbOKMYRBfZunGL120OG2PL1R7gy5BgLq
         uEva5juM26a7eJMdIpThqbYJz+nuWdjNPBMQjDI+SK4toEzOu0z7naKFzBwIEsBxyQVy
         eUsj+dpRQ428KTzH95YpAImCVXAL9mFXYKlv9tEU4ETpNHwWplEIkg7TFJP5ClnPsvfp
         WzKA==
X-Gm-Message-State: AOAM533ou3vdKI/vgkXs30C4K4uKUVhWUHuxZz3P9SVPXFemI0y5H8xe
        UjtWKT+3p9qA5CT/ZSXSfnk=
X-Google-Smtp-Source: ABdhPJxZxaWwQYEORNOgkUWk+iNUbo0rhFHvJ3rFEVel+iotEuGDoB8UiwWcBiY6b+sE0Bav5PThXw==
X-Received: by 2002:a63:1160:: with SMTP id 32mr4509278pgr.441.1589472149580;
        Thu, 14 May 2020 09:02:29 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:28 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 04/14] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Fri, 15 May 2020 01:01:43 +0900
Message-Id: <20200514160153.3646-5-sergey.senozhatsky@gmail.com>
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

By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
user-space should be able to set or clear queue's NON_CONSISTENT
->dma_attrs. Queue's ->dma_attrs are passed to the underlying
allocator in __vb2_buf_mem_alloc(), so thus user-space is able
to request vb2 buffer's memory to be either consistent (coherent)
or non-consistent.

The patch set also adds a corresponding capability flag:
fill_buf_caps() reports V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
when queue supports user-space cache management hints. Note,
however, that MMAP_CACHE_HINTS capability only valid when the
queue is used for memory MMAP-ed streaming I/O.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../userspace-api/media/v4l/buffer.rst        | 40 ++++++++++++++++++-
 .../media/v4l/vidioc-reqbufs.rst              | 10 +++++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  2 +
 include/uapi/linux/videodev2.h                |  3 ++
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 951ae1ed485f..5088393b5a5c 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -577,7 +577,10 @@ Buffer Flags
 	applications shall use this flag if the data captured in the
 	buffer is not going to be touched by the CPU, instead the buffer
 	will, probably, be passed on to a DMA-capable hardware unit for
-	further processing or output.
+	further processing or output. This flag is ignored unless the
+	queue is used for :ref:`memory mapping <mmap>` streaming I/O and
+	reports :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
+	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
     * .. _`V4L2-BUF-FLAG-NO-CACHE-CLEAN`:
 
       - ``V4L2_BUF_FLAG_NO_CACHE_CLEAN``
@@ -585,7 +588,10 @@ Buffer Flags
       - Caches do not have to be cleaned for this buffer. Typically
 	applications shall use this flag for output buffers if the data in
 	this buffer has not been created by the CPU but by some
-	DMA-capable unit, in which case caches have not been used.
+	DMA-capable unit, in which case caches have not been used. This flag
+	is ignored unless the queue is used for :ref:`memory mapping <mmap>`
+	streaming I/O and reports :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
+	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
     * .. _`V4L2-BUF-FLAG-M2M-HOLD-CAPTURE-BUF`:
 
       - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
@@ -681,6 +687,36 @@ Buffer Flags
 
     \normalsize
 
+.. _memory-flags:
+
+Memory Consistency Flags
+========================
+
+.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * .. _`V4L2-FLAG-MEMORY-NON-CONSISTENT`:
+
+      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
+      - 0x00000001
+      - A buffer is allocated either in consistent (it will be automatically
+	coherent between the CPU and the bus) or non-consistent memory. The
+	latter can provide performance gains, for instance the CPU cache
+	sync/flush operations can be avoided if the buffer is accessed by the
+	corresponding device only and the CPU does not read/write to/from that
+	buffer. However, this requires extra care from the driver -- it must
+	guarantee memory consistency by issuing a cache flush/sync when
+	consistency is needed. If this flag is set V4L2 will attempt to
+	allocate the buffer in non-consistent memory. The flag takes effect
+	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
+	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
+	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
 
 .. c:type:: v4l2_memory
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index b6d52083707b..96a59793d857 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -126,6 +126,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
+.. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
 
 .. cssclass:: longtable
 
@@ -156,6 +157,15 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS``
+      - 0x00000040
+      - This capability is set by the driver to indicate that the queue supports
+        cache and memory management hints. However, it's only valid when the
+        queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
+        :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT <V4L2-FLAG-MEMORY-NON-CONSISTENT>`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f13851212cc8..e4b4354b42b8 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -710,6 +710,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3a1cf1c507f..34ba1017b89b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -189,6 +189,8 @@ enum v4l2_memory {
 	V4L2_MEMORY_DMABUF           = 4,
 };
 
+#define V4L2_FLAG_MEMORY_NON_CONSISTENT		(1 << 0)
+
 /* see also http://vektor.theorem.ca/graphics/ycbcr/ */
 enum v4l2_colorspace {
 	/*
@@ -954,6 +956,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
+#define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.26.2

