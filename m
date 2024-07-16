Return-Path: <linux-media+bounces-15049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49B93263D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5A228555A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0823A19A294;
	Tue, 16 Jul 2024 12:08:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9D1990DE
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131705; cv=none; b=PYYPl4WAnA3RAfuSzyM/oZJHgPdmYZso3SBVXqmkXosOl7soVAFogY5mFTtebB5i6CURTxN3TOBUYrQcosvKciTGFIBE9EcFa3MybUDQsN4uyl02k8Rg7K+dNsktgxp84Uxl2RTStvB9L5dcCDPylcWyW4VXQAtiCNy9JtTgh1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131705; c=relaxed/simple;
	bh=OXtGVjTCe3PRLhQbFCX2Y45acfbh5qRTQXI1WIVQGQQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=P0LIcm0tIiboNtp+rXWHbWOJpDVZff4sYiq2f8Fl2/YfTdWn+bW+yxx5PNHlLLz4lJvy8t9AbJTZ5geqgul0cybHD8TtDKPNjkcg31etAEbBRzJuU31E+SFbirl0EXwFjgjjpwQwlpbH9oYqavx+8J0AmzClo/jjODx3srgS3w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA83AC116B1;
	Tue, 16 Jul 2024 12:08:24 +0000 (UTC)
Message-ID: <df3f1c25-5956-4273-9e0a-5db712583f30@xs4all.nl>
Date: Tue, 16 Jul 2024 14:08:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1] Documentation: media: add missing V4L2_BUF_CAP_ flags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index bbc22dd76032..1df3ce1fe93e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -166,6 +166,13 @@ aborting or finishing any DMA in progress, an implicit
         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
         :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
+    * - ``V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS``
+      - 0x00000080
+      - If set, then the ``max_num_buffers`` field in ``struct v4l2_create_buffers``
+        is valid.
+    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
+      - 0x00000100
+      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.

 .. raw:: latex

-- 
2.43.0


