Return-Path: <linux-media+bounces-5045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1282851DA8
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 20:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB431C21799
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 19:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C590F45BEC;
	Mon, 12 Feb 2024 19:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sC3SLe0j"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765945BF0
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707765132; cv=none; b=VMCHIWAqmWbPb0dNA+5rKh7Ws2Swv+1LXyW+rgq+r1oNhRxCYp6b5KEuym4lxyyM7ea2VCfmgdbgm7g48HWMp2ko/IEMH6mqA/yHDH6z4haehyO9p5AV3wLNYiM9Oa+vJTdkEJp+tw/X2ZIhQ6V3l4fxrt1x1oNVnZIjtoEJSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707765132; c=relaxed/simple;
	bh=x9BAPl/Df8D1cncIpzsXo9PXyigAX/Q0BkaKfQMBtoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vCtLh4mj63FJ2QvZZ/UrX7FxtMp81hv9oXuMbCdhADuNssYO5JDxAE1D2F0GD2fnizDQrcHP2+CnbzlbbM3aVLoGPVSmAa4ZKLTUmAlMhlkhpWAv39Ad5F2Em4CZdTI9t4f7KyI/GoNqwh/Cu1pq8p1CMsSOeq7nSl3pkClgFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sC3SLe0j; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707765128;
	bh=x9BAPl/Df8D1cncIpzsXo9PXyigAX/Q0BkaKfQMBtoI=;
	h=From:To:Cc:Subject:Date:From;
	b=sC3SLe0jKWQ509+GezFy4N/wAN+BhqYmmZMTl01JMhxRdOZ9su7zZeMJKI7sXMTAI
	 +yXItIxehcsik2jMD3qoRg9E9/ajumBWntF0tbOMRgxENqrTng8HOAckqxt8KNeBsr
	 hxL1DidciggtFVOouB3MJv/uxpf+obvkBwbqdkrN5S+70Grv8MdhZ/P6+hF+naJqHO
	 w9xBOqAd+VC/K97uV6sXyT1ZPATQdxqNP5XRqDZ9FJ4zPZYsIO8UtJTWQGA1t1U9jC
	 aNrn05PluNNSeBWoSqftzWwW6zFfeF9dm/nN5iUJBFEGiD5+zb8NFVHONUi588uWrJ
	 jPmGgfGb736SQ==
Received: from ropotamo.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B9A83782059;
	Mon, 12 Feb 2024 19:12:08 +0000 (UTC)
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	kernel@collabora.com
Subject: [PATCH v2] media: videobuf2: Add missing doc comment for waiting_in_dqbuf
Date: Mon, 12 Feb 2024 20:12:03 +0100
Message-Id: <20240212191203.39238-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at it rearrange other comments to match the order of struct members.

Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
v2: - rebased onto latest media_tree
    - reformulated the actual doc comment according to Tomasz
      Figa's suggestion (thx Tomasz)
 include/media/videobuf2-core.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 56719a26a46c..bec8c3a1ed82 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -72,6 +72,10 @@ struct vb2_buffer;
  *		 argument to other ops in this structure.
  * @put_userptr: inform the allocator that a USERPTR buffer will no longer
  *		 be used.
+ * @prepare:	called every time the buffer is passed from userspace to the
+ *		driver, useful for cache synchronisation, optional.
+ * @finish:	called every time the buffer is passed back from the driver
+ *		to the userspace, also optional.
  * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
  *		   used for DMABUF memory types; dev is the alloc device
  *		   dbuf is the shared dma_buf; returns ERR_PTR() on failure;
@@ -86,10 +90,6 @@ struct vb2_buffer;
  *		dmabuf.
  * @unmap_dmabuf: releases access control to the dmabuf - allocator is notified
  *		  that this driver is done using the dmabuf for now.
- * @prepare:	called every time the buffer is passed from userspace to the
- *		driver, useful for cache synchronisation, optional.
- * @finish:	called every time the buffer is passed back from the driver
- *		to the userspace, also optional.
  * @vaddr:	return a kernel virtual address to a given memory buffer
  *		associated with the passed private structure or NULL if no
  *		such mapping exists.
@@ -484,7 +484,6 @@ struct vb2_buf_ops {
  *		caller. For example, for V4L2, it should match
  *		the types defined on &enum v4l2_buf_type.
  * @io_modes:	supported io methods (see &enum vb2_io_modes).
- * @alloc_devs:	&struct device memory type/allocator-specific per-plane device
  * @dev:	device to use for the default allocation context if the driver
  *		doesn't fill in the @alloc_devs array.
  * @dma_attrs:	DMA attributes to use for the DMA.
@@ -553,6 +552,7 @@ struct vb2_buf_ops {
  *		VIDIOC_REQBUFS will ensure at least @min_queued_buffers
  *		buffers will be allocated. Note that VIDIOC_CREATE_BUFS will not
  *		modify the requested buffer count.
+ * @alloc_devs:	&struct device memory type/allocator-specific per-plane device
  */
 /*
  * Private elements (won't appear at the uAPI book):
@@ -577,6 +577,9 @@ struct vb2_buf_ops {
  * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
  *		buffers. Only set for capture queues if qbuf has not yet been
  *		called since poll() needs to return %EPOLLERR in that situation.
+ * @waiting_in_dqbuf: set by the core for the duration of a blocking DQBUF, when
+ *		it has to wait for a buffer to become available with vb2_queue->lock
+ *		released. Used to prevent destroying the queue by other threads.
  * @is_multiplanar: set if buffer type is multiplanar
  * @is_output:	set if buffer type is output
  * @copy_timestamp: set if vb2-core should set timestamps
-- 
2.34.1


