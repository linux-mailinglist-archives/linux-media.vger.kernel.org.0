Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43A736C6CE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbhD0NPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbhD0NOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:14:55 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BF3C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:10 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so7186753pjv.1
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=twEtiGE/LXdE8jfiqGXA38mrxL6G2yxH430D+ICmMyo=;
        b=W3oAc/VK5V2VfLUI9nJ3MtuRQrO0peRii4VGPzurpu5Od5SPhoQ2Ff/0eYZ2MyD6Y9
         rdCbom4UGSpvnk2Je2vMs6rmOBhQGFvBvKC43BBIthTz8lhL2rxZr7ltaop7kDVij0lB
         MeaUUgXFu+RaKoYsMWpJppuAr68kvQG+hbq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twEtiGE/LXdE8jfiqGXA38mrxL6G2yxH430D+ICmMyo=;
        b=X4yIqEqze70yVOOqG/K/4Q+DSV5R1aB32cPwfOipkRd4aU3jW1eOSc4QcPPXGDZkGh
         +EpIbYi6sDrPzGntwZhJnT92daFmF42tYGg5Ukwg2FKLLkQWJrqcrJamkfCbgPFM5nIC
         pyo2MCsd/RiTmxPqcrheTovC63QfGDd4QoG31z9vfgchd9Kv8JXNvg9278x8/8eCj8c+
         4bHJpMdV3bXkas+Nff2FZ9XGd49z6FCwLokS+oxHAsM2Ut2QG66eZGwpSRNnQ5uvuZ9J
         trKSGqKRpPbveXknfZ2sqZqLxx0CEnzjwfLMMpHrcDDTJgT9BGB8kQlDchfsMWmkkSOd
         16Xg==
X-Gm-Message-State: AOAM5303H3gydvJBM4MGj5Hsx/tDpHz//iH00A+OUxenM7uVvMsEloOw
        Yb2u40NnSm/sK6ev89StSGZ4AA==
X-Google-Smtp-Source: ABdhPJyWYZcLbKreZhJoMQSBCb3bPeu1ynQwR284uILEccVYiKtR+g21L2adX9oqso/Wf1R3+w2H7A==
X-Received: by 2002:a17:90a:e298:: with SMTP id d24mr3111639pjz.144.1619529250313;
        Tue, 27 Apr 2021 06:14:10 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8192:3566:9cd4:8ed7])
        by smtp.gmail.com with ESMTPSA id c8sm2755313pfp.160.2021.04.27.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:14:08 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 5/8] videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
Date:   Tue, 27 Apr 2021 22:13:40 +0900
Message-Id: <20210427131344.139443-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427131344.139443-1-senozhatsky@chromium.org>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By setting or clearing V4L2_MEMORY_FLAG_NON_COHERENT flag
user-space should be able to hint vb2 that either a non-coherent
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
index 311a01cc5775..15f9c9df35d5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -956,6 +956,8 @@ struct v4l2_requestbuffers {
 	__u32			reserved[1];
 };
 
+#define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
+
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
 #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
 #define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
-- 
2.31.1.498.g6c1eba8ee3d-goog

