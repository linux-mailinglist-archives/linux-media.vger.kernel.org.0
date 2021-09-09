Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2C140493E
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbhIIL0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbhIIL0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:26:03 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB006C061756
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:24:53 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1199226pjc.3
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0z+xAl8TBWOblx8EQFOc7DA5ndExlKG16qGdAhcTw4k=;
        b=KIqKlWJ9AhCGKUZHkvsIYEdOyFphbN8Obq1xleTyiHby/e7OYnXAC5Nnut2v90TpOS
         hCzcZztAJdye8M1cdIyyvs5fXU1heM6JFS8LFQSyYDhT6u78nZqYDGcIopIUClX+pNJO
         9DiNSphLv5fpFtyx7YkESXclYjlv1WcrKjINg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0z+xAl8TBWOblx8EQFOc7DA5ndExlKG16qGdAhcTw4k=;
        b=EJXs0b+TjKhApg4r0m1fZrokzRSKb83YiwO6iB4muXB/jUAw78En8yzndnYHvSHNYp
         xkHFZjZkw7B5ZpZmWjAkAzyrRhAcPV9XofqVHnizK8ab5MVbwlSumVHZoLn8F4KKvUNU
         zWZ8HVKl6zMkyOUMZovIkzb3nC61rB9hSmsQIP++ZlllGW0z41PqnBVKjxnJIVHNSc8u
         RCeOJFfyf0O2Mkiem+/7fqynEngCYGdsmYIv9KRGIjBfeCrR2XRKDdadMReDx8f3Djlg
         MzdGvCdt9EHN7KcZU5eSBAjjHQibO2fwxzdEE5e1zDl5uqvPKilg51zQeaqDwEnWEhYw
         Ctyw==
X-Gm-Message-State: AOAM531jK1gOmdawSRX20Zhc1WRdP41ryFLwNmxz2RHYpK0MCq8EhUyT
        FcxqfIDz7VF3gop+w8OMkFD5VVjfaLmeZQ==
X-Google-Smtp-Source: ABdhPJz1hkxUCfnCXXB/PqeJyW8EkAMmShIJg0e5kURcKrw9bzPnpqFOBV0XIvi5SdEhGPBHa4BKCw==
X-Received: by 2002:a17:902:bb10:b0:13a:3cc4:8242 with SMTP id im16-20020a170902bb1000b0013a3cc48242mr2248513plb.58.1631186693340;
        Thu, 09 Sep 2021 04:24:53 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:24:52 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 5/8] videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
Date:   Thu,  9 Sep 2021 20:24:27 +0900
Message-Id: <20210909112430.61243-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By setting or clearing the V4L2_MEMORY_FLAG_NON_COHERENT flag
user-space should be able to hint vb2 that either non-coherent
(if supported) or coherent memory should be used for the buffer
allocation.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../userspace-api/media/v4l/buffer.rst        | 40 ++++++++++++++++++-
 .../media/v4l/vidioc-reqbufs.rst              |  5 ++-
 include/uapi/linux/videodev2.h                |  2 +
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index e991ba73d873..4638ec64db00 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -676,8 +676,6 @@ Buffer Flags
 
     \normalsize
 
-.. _memory-flags:
-
 enum v4l2_memory
 ================
 
@@ -701,6 +699,44 @@ enum v4l2_memory
       - 4
       - The buffer is used for :ref:`DMA shared buffer <dmabuf>` I/O.
 
+.. _memory-flags:
+
+Memory Consistency Flags
+------------------------
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{7.0cm}|p{2.1cm}|p{8.4cm}|
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * .. _`V4L2-MEMORY-FLAG-NON-COHERENT`:
+
+      - ``V4L2_MEMORY_FLAG_NON_COHERENT``
+      - 0x00000001
+      - A buffer is allocated either in coherent (it will be automatically
+	coherent between the CPU and the bus) or non-coherent memory. The
+	latter can provide performance gains, for instance the CPU cache
+	sync/flush operations can be avoided if the buffer is accessed by the
+	corresponding device only and the CPU does not read/write to/from that
+	buffer. However, this requires extra care from the driver -- it must
+	guarantee memory consistency by issuing a cache flush/sync when
+	consistency is needed. If this flag is set V4L2 will attempt to
+	allocate the buffer in non-coherent memory. The flag takes effect
+	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
+	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
+	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
+
+.. raw:: latex
+
+    \normalsize
 
 Timecodes
 =========
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 50ea72043bb0..e59306aba2b0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -158,8 +158,9 @@ aborting or finishing any DMA in progress, an implicit
       - This capability is set by the driver to indicate that the queue supports
         cache and memory management hints. However, it's only valid when the
         queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
-        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
-        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
+        :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5cc9545feb40..9b7032abb2c7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -962,6 +962,8 @@ struct v4l2_requestbuffers {
 	__u32			reserved[1];
 };
 
+#define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
+
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
 #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
 #define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
-- 
2.33.0.153.gba50c8fa24-goog

