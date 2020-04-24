Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68C01B70E1
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgDXJa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:30:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7C5C09B045;
        Fri, 24 Apr 2020 02:30:56 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so3527465plr.11;
        Fri, 24 Apr 2020 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G0xctamNJu1msFWVd4QpdKYPAbJYyEVk/cdrZOhkeOk=;
        b=Nwhmm0A7B7gwomsfkbhj63eHPp79fr/MSsyAn9ss1PIVfOIgum1MaPG+xmmyW2OYjZ
         L4HKsb7RiUoG4Hy35+iYX8jc0182OCUIt3Ir38eVJ5ix8NSgcwFsb6pr3qD0o3pipsOQ
         TXVRgxYxk0LU6FittisZ24au4KJpOEhporFJ8XBc3S+Dm08uL8ctAEMKDnnZKaUF/Hgu
         PheUDX7Q+/M2r3V2ruPLsPW56I8WbkawfFvwTJsYkzx7E+hEssVZU2K48/99dk50QGio
         QTELmI6Lr+8+ivS1Z9zubVfbpnGnTsu82DSmNaQbSW7VmpShRK/sb6E6DxA4DZ4pnbay
         m8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0xctamNJu1msFWVd4QpdKYPAbJYyEVk/cdrZOhkeOk=;
        b=IyffHgsCWN3n2wC0DbhIGTNCNZUto4c+Ut2jW5kPjefJ8FP1o/6ynjqcDdMxG8pQ4x
         Hh4bfMc7GAmDUr9QbQVdJZjLbCkczwblHfwXeOfd+x2e20MM7vTW8xDbXS1HZ0FwvaSs
         1HgoRxrzQvpTetsmRz+ukOTCavvPUgVqysuRf1Qgct+pWyJIFI01AMq0GH3OvZJcLJ9w
         dljllVzt2hEohW0MlV7y/WTXWhNn6pbhf7tJnbnyLnL4VvHGJo/uG9VUXvnp3a6MzGeQ
         k5gOZee6Zjyz8IS5XKGK7/K+wZ88ZuhZR9Hwaa9onBY7sUr+sUwvFPsoInwsL44xGYZy
         O3DQ==
X-Gm-Message-State: AGi0PuZxBrZCe6vtGuSWKay/H+z1iTQXdI1t3xAGIJFiIQD0sKql9hNh
        Er7u717omi2BO4McvKu2vlA=
X-Google-Smtp-Source: APiQypJIfv0iYz1m19Gj3STtOVVkn50bVrZVXIn7taeUg0X9qe3iez8oNlrLzwIRbewi4DLDlKOcdA==
X-Received: by 2002:a17:90a:ce05:: with SMTP id f5mr5320802pju.39.1587720655730;
        Fri, 24 Apr 2020 02:30:55 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:30:55 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 04/13] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Fri, 24 Apr 2020 18:29:11 +0900
Message-Id: <20200424092920.4801-5-sergey.senozhatsky@gmail.com>
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

By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
user-space should be able to set or clear queue's NON_CONSISTENT
->dma_attrs. Queue's ->dma_attrs are passed to the underlying
allocator in __vb2_buf_mem_alloc(), so thus user-space is able
to request vb2 buffer's memory to be either consistent (coherent)
or non-consistent.

The patch set also adds a corresponding capability flag:
fill_buf_caps() reports V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS when
queue supports user-space cache management hints. Note that
queue should be set up and initialized, since it's the driver
that sets ->allow_cache_hints.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../userspace-api/media/v4l/buffer.rst        | 41 ++++++++++++++++++-
 .../media/v4l/vidioc-reqbufs.rst              |  9 ++++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  2 +
 include/uapi/linux/videodev2.h                |  3 ++
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 951ae1ed485f..66023658270c 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -577,7 +577,10 @@ Buffer Flags
 	applications shall use this flag if the data captured in the
 	buffer is not going to be touched by the CPU, instead the buffer
 	will, probably, be passed on to a DMA-capable hardware unit for
-	further processing or output.
+	further processing or output. This flag is ignored unless the
+	queue reports
+	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS <V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS>`
+	capability.
     * .. _`V4L2-BUF-FLAG-NO-CACHE-CLEAN`:
 
       - ``V4L2_BUF_FLAG_NO_CACHE_CLEAN``
@@ -585,7 +588,10 @@ Buffer Flags
       - Caches do not have to be cleaned for this buffer. Typically
 	applications shall use this flag for output buffers if the data in
 	this buffer has not been created by the CPU but by some
-	DMA-capable unit, in which case caches have not been used.
+	DMA-capable unit, in which case caches have not been used. This flag
+	is ignored unless the queue reports
+	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS <V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS>`
+	capability.
     * .. _`V4L2-BUF-FLAG-M2M-HOLD-CAPTURE-BUF`:
 
       - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
@@ -681,6 +687,37 @@ Buffer Flags
 
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
+	queue reports the
+	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS <V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS>`
+	capability.
 
 .. c:type:: v4l2_memory
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 79884bb4893b..893570af617b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -126,6 +126,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
+.. _V4L2-BUF-CAP-SUPPORTS-CACHE-HINTS:
 
 .. cssclass:: longtable
 
@@ -156,6 +157,14 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
+      - 0x00000040
+      - Set for ``V4L2_MEMORY_MMAP`` queues which support memory consistency
+        and cache management hints. See
+        :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT <V4L2-FLAG-MEMORY-NON-CONSISTENT>`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f13851212cc8..26716055d914 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -710,6 +710,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9817b7e2c968..0d4deba8fe30 100644
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
@@ -951,6 +953,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
+#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.26.2

