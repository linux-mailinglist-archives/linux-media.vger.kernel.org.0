Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D55B3C216A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhGIJXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhGIJXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:31 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F556C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:48 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id k20so2378787pgg.7
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAmRcbaeeTJjhJGcVBh7oioKghH7S05ftzUdU5WTJx4=;
        b=oUw1WP7NqxifoEcHeIl/ELb3bduD4HfDt/fOlwwJ8V6e7HRdPDviRFNowEYtvcIBbh
         CfhXhe3CtsPtn+EaI/9K7qV87HEadVcRuQKBknUKp25FGDrqoazKCdK88W6034EeK9VR
         OeQBmAws5JlYIXkz1cBnzFNMafu4X9Kw4Dopk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAmRcbaeeTJjhJGcVBh7oioKghH7S05ftzUdU5WTJx4=;
        b=cgnRyXCc4rru6Fl8KL4/OJpJDDO/50BFD8wFzvfDXu5Pn3LccmVQiWqJcPzjGSYH20
         5gd0oLS1OA3a2Z15wemSTjVO+aLW+hWhm5JEWjluJTSnEylpvYhzzo4pVLp6xVl++zny
         4YFZF9d/x48rVuIRAtrTRVqkAmpDc5Vvuflb/KpIWAtt0Ai8fKcmaZ0SC9X9q8VMu5w4
         ZW7H0s269Ot5vENxk1AZIRgoPWak1QlxP1HDLArLAkMBu6bBcfRnM+3c5c6k8R9ev/Tw
         d071Ob4xkzyvEDJl/MwUWh3I+s//Cec5G8p1HWSNF64g/X5w6OJiReOaYFfQSp4hOE54
         HEqg==
X-Gm-Message-State: AOAM5322wie/QLsszu0rXMjhJvtY9CGidcLu8te5+pU+GBCeK0BIhz1Q
        qkXCMkWs2VfCzYnj4+ZVKYyj2A==
X-Google-Smtp-Source: ABdhPJzO1nASMzj6MPp3FSju9sWhHis1VKSBSUNcPWJtJzLZcxPGwM2q8ILS4YMIoc5LW+zBpvauiQ==
X-Received: by 2002:a63:234c:: with SMTP id u12mr36511673pgm.345.1625822448007;
        Fri, 09 Jul 2021 02:20:48 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:47 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 5/8] videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
Date:   Fri,  9 Jul 2021 18:20:24 +0900
Message-Id: <20210709092027.1050834-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709092027.1050834-1-senozhatsky@chromium.org>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
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
index 9260791b8438..9d11e1d9c934 100644
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
2.32.0.93.g670b81a890-goog

