Return-Path: <linux-media+bounces-21290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061A9C5219
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 10:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6C31F2242F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFF020E039;
	Tue, 12 Nov 2024 09:33:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323720DD7B
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404005; cv=none; b=IYVqVVh1hLHuKp4LN8EnATKq/30BaKXcycPN9Vm6rl0pImxT72zVCw7W8SgFJ8U0UxzT0lEzx6k0Tn20ffiYWXmubtC/n5Ats/wHL1x68OiQvFLsn5VKkiIzK3u/rdzrf/O96mgbkVQ93E3DSxM5jh/0UcEbwxCORXdtIeEP5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404005; c=relaxed/simple;
	bh=fB2PomdAzt/DzHHPe6DJp4oV43MOnlpIo/E9fNbMbak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clyW4Vpk6GWsIT3l7wzLNkfBIbxmB9Yz6ChSbMJZCpo1pIzVcgOvjb4FPO30gvt7F9ILoH4c0Nb00SzXzPxm34vbncJMU3lawK2sXM0y/+scoM1IAkLHE1chLgh+OXWe0obbhskpCUQae2I3sZMusczQbcDX62MgpV1a5M5rSFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB22C4CECD;
	Tue, 12 Nov 2024 09:33:23 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCHv2 2/5] Documentation: media: document min/rec_num_buffers
Date: Tue, 12 Nov 2024 10:22:13 +0100
Message-ID: <bd12fb592925ecfec862bb53e99c44c6e9022828.1731403336.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1731403336.git.hverkuil@xs4all.nl>
References: <cover.1731403336.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new min_num_buffers and rec_num_buffers fields and the
corresponding V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS capability flag.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/v4l/vidioc-create-bufs.rst          | 34 +++++++++++++++----
 .../media/v4l/vidioc-reqbufs.rst              |  6 ++++
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index 49232c9006c2..a400d464cc9f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -68,7 +68,12 @@ When the ioctl is called with a pointer to this structure the driver
 will attempt to allocate up to the requested number of buffers and store
 the actual number allocated and the starting index in the ``count`` and
 the ``index`` fields respectively. On return ``count`` can be smaller
-than the number requested.
+than the number requested, but never larger. If no buffers could be
+allocated, then -1 is returned and errno is set to the ``ENOMEM`` error code.
+
+If ``count`` was set to 0, then no buffers are allocated, and instead
+it just sets the various informative fields, e.g. ``capabilities``,
+``max_num_buffers``, etc.
 
 .. c:type:: v4l2_create_buffers
 
@@ -88,9 +93,9 @@ than the number requested.
 	:ref:`VIDIOC_CREATE_BUFS` will set ``index`` to the current number of
 	created buffers, and it will check the validity of ``memory`` and
 	``format.type``. If those are invalid -1 is returned and errno is
-	set to ``EINVAL`` error code, otherwise :ref:`VIDIOC_CREATE_BUFS` returns
-	0. It will never set errno to ``EBUSY`` error code in this particular
-	case.
+	set to the ``EINVAL`` error code, otherwise :ref:`VIDIOC_CREATE_BUFS`
+	returns	0. It will never set errno to the ``EBUSY`` error code in this
+	particular case.
     * - __u32
       - ``memory``
       - Applications set this field to ``V4L2_MEMORY_MMAP``,
@@ -118,11 +123,26 @@ than the number requested.
 	See :ref:`memory-flags`.
     * - __u32
       - ``max_num_buffers``
-      - If the V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
-        this field indicates the maximum possible number of buffers
+      - If the ``V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS`` capability flag is
+        set this field indicates the maximum possible number of buffers
         for this queue.
+    * - __u16
+      - ``min_num_buffers``
+      - If the ``V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS`` capability flag is
+        set this field indicates the minimum number of buffers for this queue.
+	Allocating this number of buffers will allow video streaming, but frame
+	drops might happen.
+    * - __u16
+      - ``rec_num_buffers``
+      - If the ``V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS`` capability flag is
+        set this field indicates the recommended number of buffers for this
+	queue.
+	The :ref:`VIDIOC_REQBUFS` will use this value if the requested number of
+	buffers	is less than this value. This value ensures reliable video
+	streaming without frame drops, provided the application can process
+	a dequeued buffer within a single frame period.
     * - __u32
-      - ``reserved``\ [5]
+      - ``reserved``\ [4]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index daf9a6621b50..4c5bb303b5a2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -124,6 +124,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
 .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
 .. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:
+.. _V4L2-BUF-CAP-SUPPORTS-MIN-REC-NUM-BUFFERS:
 
 .. flat-table:: V4L2 Buffer Capabilities Flags
     :header-rows:  0
@@ -167,6 +168,11 @@ aborting or finishing any DMA in progress, an implicit
     * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
       - 0x00000100
       - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.
+    * - ``V4L2_BUF_CAP_SUPPORTS_MIN_REC_NUM_BUFFERS``
+      - 0x00000200
+      - If set, then the ``min_num_buffers`` and ``rec_num_buffers`` fields in
+        ``struct v4l2_create_buffers`` are valid. If not set, then these fields
+	are 0.
 
 .. _memory-flags:
 .. _V4L2-MEMORY-FLAG-NON-COHERENT:
-- 
2.45.2


