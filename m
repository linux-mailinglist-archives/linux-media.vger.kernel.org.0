Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C2016FD18
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgBZLPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:15:55 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50178 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgBZLPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:15:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so1133308pjb.0
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dInyMMiO3B5Auyp+XoZ00SzbOn+qaqzJwnevTdhh3/M=;
        b=DDbUrQU25+ManguKFK0CSk1hrAdVVy3sv/5QFIwJ058MEcyjNp3E0kVkB9u6Nm25E6
         aBjieYH4r5sICujusOPMbRZPVVyX7d3kTMWT848r6lM318DpmRaYCg5KrymIcPZV8qCZ
         AEuJkTSNb/9V0Y18tDFapDvev/+XjrxFegonA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dInyMMiO3B5Auyp+XoZ00SzbOn+qaqzJwnevTdhh3/M=;
        b=MJIWwzPEpUKsMGsiyT7cCWvEcJMOQCj1VOPrEEQSbVSJgAwBNTNxRI4T9Ora8fUAdS
         KuJ5PX4vyDmV4rj4AP79TT6x+PozoaqllaMRLWCaVwiLfV5/1UAN3k1Hn2Dhw+gVtcdG
         xqWJ3fHuKVR3Vh7eTqs77w6jQlyvDvFA95Pz2DGVjjncsjvQB6SmY7Dro8GlNmP18tpQ
         HvgOQjdnVrDE2y3J9odlxiLldaCnKoadZ4aweL7uVZZjp+yoF2/BK4SRHm5+ZCvd4B3N
         aE6xVjSGUZsEzJVRUi0jvIUPY7LQp++8+eTpEhVFJF94oIiLG2aYLEPl/jB+3GDYqRc6
         1XeA==
X-Gm-Message-State: APjAAAUIGhPQpNTAeVLK2aHxxrJFXJr2I6NW+0klG5xxPJjq32arLWEm
        YxQvedG7IDSO+D9TZcfuq4T05A==
X-Google-Smtp-Source: APXvYqzlE+0Xt04PkiDpaAzoFzh8Y4KU3UmBvPjsCEuiitF9ae2DzHMuIZBhRog3SH06R2E1eFeYfA==
X-Received: by 2002:a17:90a:1e63:: with SMTP id w90mr4595296pjw.36.1582715753766;
        Wed, 26 Feb 2020 03:15:53 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:15:53 -0800 (PST)
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
Subject: [PATCHv3 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Wed, 26 Feb 2020 20:15:21 +0900
Message-Id: <20200226111529.180197-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
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
index 3112300c2fa0..6b629ac59bf2 100644
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
+      - vb2 buffer is allocated either in consistent (it will be automatically
+	coherent between CPU and bus) or non-consistent memory. The latter
+	can provide performance gains, for instance CPU cache sync/flush
+	operations can be avoided if the buffer is accessed by the corresponding
+	device only and CPU does not read/write to/from that buffer. However,
+	this requires extra care from the driver -- it must guarantee memory
+	consistency by issuing cache flush/sync when consistency is needed.
+	If this flag is set V4L2 will attempt to allocate vb2 buffer in
+	non-consistent memory. The flag takes effect only if the buffer is
+	used for :ref:`memory mapping <mmap>` I/O and the queue reports
+	:ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
 
 .. c:type:: v4l2_memory
 
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index d0c643db477a..917df6fb6486 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -156,6 +156,13 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
+      - 0x00000040
+      - Set when the queue/buffer support memory consistency and cache
+        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 2a604bd7793a..f91cba37e223 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -711,6 +711,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if ((q->allow_cache_hints != 0) && (q->io_modes & VB2_MMAP))
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

