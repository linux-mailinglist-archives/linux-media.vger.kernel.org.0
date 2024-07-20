Return-Path: <linux-media+bounces-15200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BA9380CD
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 12:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A101F21F0B
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 10:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5858583A0E;
	Sat, 20 Jul 2024 10:46:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12DE4779E
	for <linux-media@vger.kernel.org>; Sat, 20 Jul 2024 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721472414; cv=none; b=VTV3JgMBGd7JsEjvcIgpjForCAgh4HzgcjR1y6Nv2LEXSaE1ULGMvRMVbEK/4y7DVEirHLdOvMUi+VbPG42dUK2Fyea6ZnP3Zl3xhkTQGbPI/4xNKb84wZgB4x/4WE3o5jBxHdoa8d3Nx6pV3NfN6WY1YkM9SROY1vrX6B2lyKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721472414; c=relaxed/simple;
	bh=ai6KA+Q5bk24vyOJ9J1YmjM3jFW/oOsltb6LRlBYiNM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=aqNLlPnLpliDkmbKkEoHMSJkm1w3evSg8GUNYZ5gmMjQprhLfnvNJQ1HwPdjTnE35t4HPHjRhqdQ636Zmm3n/y/D3S2JNKxQPkACHQPdzoxt9qZy5TBfL829Kmi+Shmw+qWbHs5BpH24a35w/3bT5upiwAqKLJFKxk2SeXQrCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B194C2BD10
	for <linux-media@vger.kernel.org>; Sat, 20 Jul 2024 10:46:53 +0000 (UTC)
Message-ID: <f4725b81-ee8a-4d4c-903d-ecbc7d58dea9@xs4all.nl>
Date: Sat, 20 Jul 2024 12:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] Documentation: media: move Memory Consistency Flags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The documentation of the Memory Consistency Flags was part of the struct
v4l2_buffer documentation, but that struct doesn't use those flags. Instead
it is used by VIDIOC_CREATE_BUFS and VIDIOC_REQBUFS. Move the documentation
from buffer.rst to vidioc-reqbufs.rst which is where it belongs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 52bbee81c080..856874341882 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -694,41 +694,6 @@ enum v4l2_memory
       - 4
       - The buffer is used for :ref:`DMA shared buffer <dmabuf>` I/O.

-.. _memory-flags:
-
-Memory Consistency Flags
-------------------------
-
-.. raw:: latex
-
-    \small
-
-.. tabularcolumns:: |p{7.0cm}|p{2.1cm}|p{8.4cm}|
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       3 1 4
-
-    * .. _`V4L2-MEMORY-FLAG-NON-COHERENT`:
-
-      - ``V4L2_MEMORY_FLAG_NON_COHERENT``
-      - 0x00000001
-      - A buffer is allocated either in coherent (it will be automatically
-	coherent between the CPU and the bus) or non-coherent memory. The
-	latter can provide performance gains, for instance the CPU cache
-	sync/flush operations can be avoided if the buffer is accessed by the
-	corresponding device only and the CPU does not read/write to/from that
-	buffer. However, this requires extra care from the driver -- it must
-	guarantee memory consistency by issuing a cache flush/sync when
-	consistency is needed. If this flag is set V4L2 will attempt to
-	allocate the buffer in non-coherent memory. The flag takes effect
-	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
-	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
-	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
-
 .. raw:: latex

     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index bbc22dd76032..634c2517221a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -73,6 +73,8 @@ aborting or finishing any DMA in progress, an implicit

 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|

+.. cssclass:: longtable
+
 .. flat-table:: struct v4l2_requestbuffers
     :header-rows:  0
     :stub-columns: 0
@@ -123,14 +125,6 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
 .. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:

-.. raw:: latex
-
-   \footnotesize
-
-.. tabularcolumns:: |p{8.1cm}|p{2.2cm}|p{7.0cm}|
-
-.. cssclass:: longtable
-
 .. flat-table:: V4L2 Buffer Capabilities Flags
     :header-rows:  0
     :stub-columns: 0
@@ -167,6 +161,29 @@ aborting or finishing any DMA in progress, an implicit
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
         :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.

+.. _memory-flags:
+.. _V4L2-MEMORY-FLAG-NON-COHERENT:
+
+.. flat-table:: Memory Consistency Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - ``V4L2_MEMORY_FLAG_NON_COHERENT``
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
 .. raw:: latex

    \normalsize

