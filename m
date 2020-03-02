Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12CB17527F
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgCBEMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:12:42 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44686 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgCBEMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:12:42 -0500
Received: by mail-pl1-f194.google.com with SMTP id d9so3652961plo.11
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CoetZS9vuxTZ+PyAPLZRJLnoTD2MnEuUAYGHdJwiBqs=;
        b=LeRfzwHi8oJoYEV2ftWQe6u50EWhhQZErNapDPcIjTb+Sd6R+fd6x2IjxUt+XQhNf8
         j3ZI4/4J3cIKXc7PaiH6lBD/2Pp+QwBfngL7jp79eovCh7kgZhzCiYbhKnbAVb5NPsbJ
         F0Ds2wnMtOJjpW89Q27zB3LGw0t3dUbPoNZ98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CoetZS9vuxTZ+PyAPLZRJLnoTD2MnEuUAYGHdJwiBqs=;
        b=jDT5TyExsuHOaViN1hL2LsOHLtMD91NOo3OEhS3Im5A840Xtqp0wtObqEiCUQ6HzEO
         KSP4y2D2ymncR9ikW+xptaRUkpJ13ztwNYxwxqKWsuMOHa1myIwQZJDULONEDwjSQ7Lm
         mngfp7L46ml6jIQuD3K0qHqKRUpmyy746Nx32jUNGHmjwB72FV+XYkqYt1v4PDgqXN6N
         yupss444U3KxuezDFbv/piYpwgegyP8XGD4TfwyYlmz4/MziWrcjBgywsOciGCnSxgxY
         eL9B9LTSxIq1zIcQWV+Erz0rWVPPPrOT+kamqf0LjbZfSxjoWhPr8J2DICViopK1ibFk
         Vs1g==
X-Gm-Message-State: APjAAAVaP9wHHj402ojADTNQIyqK1b0gKVwXmQ8yGaRG04CoguXyIHYf
        xJaEKmqknN+Xqjpn/KQwYfy24A==
X-Google-Smtp-Source: APXvYqwY5WpLZv1Aq5NZ/mOTGi+TcrYj2pNF50u0UD6ple9/IyZ6BApso8aJfGPcuzqnCQ/dbUaULQ==
X-Received: by 2002:a17:90a:a88d:: with SMTP id h13mr17972603pjq.55.1583122360698;
        Sun, 01 Mar 2020 20:12:40 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:12:40 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Mon,  2 Mar 2020 13:12:05 +0900
Message-Id: <20200302041213.27662-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
user-space should be able to set or clear queue's NON_CONSISTENT
->dma_attrs. Queue's ->dma_attrs are passed to the underlying
allocator in __vb2_buf_mem_alloc(), so thus user-space is able
to request vb2 buffer's memory to be either consistent (coherent)
or non-consistent.

The patch set also adds a corresponding capability flag:
fill_buf_caps() reports V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS when
queue supports user-space cache management hints.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/media/uapi/v4l/buffer.rst       | 29 +++++++++++++++++++
 .../media/uapi/v4l/vidioc-reqbufs.rst         |  7 +++++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  2 ++
 include/uapi/linux/videodev2.h                |  3 ++
 4 files changed, 41 insertions(+)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 3112300c2fa0..8084e3f2a58d 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -681,6 +681,35 @@ Buffer Flags
 
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
+    * .. _`V4L2_FLAG_MEMORY_NON_CONSISTENT`:
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
+	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
 
 .. c:type:: v4l2_memory
 
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index d0c643db477a..21ecacc72487 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -156,6 +156,13 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
+      - 0x00000040
+      - Set when the queue/buffer supports memory consistency and cache
+        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2a604bd7793a..c847bcea6e95 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -711,6 +711,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if (q->allow_cache_hints && (q->io_modes & VB2_MMAP))
+		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5f9357dcb060..e92c29864730 100644
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
@@ -946,6 +948,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
+#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.25.0.265.gbab2e86ba0-goog

