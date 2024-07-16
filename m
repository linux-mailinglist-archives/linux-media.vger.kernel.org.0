Return-Path: <linux-media+bounces-15052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825B932680
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7723B2292F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC5E19A2AE;
	Tue, 16 Jul 2024 12:28:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29D19923E
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132900; cv=none; b=q1iaHaJBzpG4cI7Cy7W/PB2FQDk+V4im5qm5qsWE157XJX/pHG6IZaVwXyUlQOYt88DgTrgzPi0l9v21NfUJhQFKAMka5Zc/67pLepoJlDwmcoFXrR5vWFvjhOTsPYP/6ub5D13+UMWG6qlj2M541QPAkM4AwNflY5ledR2E4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132900; c=relaxed/simple;
	bh=hcSCKkZizPe9TytpNTp2/1JayG8KEQSDz7zi1txCbEQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Nm3XyoBWaldQXC6gC+bOCOvG3sc4Am9VxGJiLtvJr5gphqJYJbiRT4MixH8RncO2q0c0xV85kdQFx9r3+ZYoYZ43FKwo48nCDO+Q15JLCvxBoHxkFtlxudn/D8CBrfQ228+CeFVtjHO5BNrOWS8dTfWgkNc60KaydDVZIKZqOVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBA3C4AF0C;
	Tue, 16 Jul 2024 12:28:19 +0000 (UTC)
Message-ID: <47829e6f-4749-4259-abd3-6cb5b5713006@xs4all.nl>
Date: Tue, 16 Jul 2024 14:28:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] Documentation: media: add missing V4L2_BUF_CAP_ flags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:
- Report what the maximum is if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS is not set
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
+        is valid. If not set, then the maximum is ``VIDEO_MAX_FRAME`` buffers.
+    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
+      - 0x00000100
+      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.

 .. raw:: latex

-- 
2.43.0


