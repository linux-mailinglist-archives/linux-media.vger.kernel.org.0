Return-Path: <linux-media+bounces-3251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D786825493
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 14:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F701B22C13
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7E2D78B;
	Fri,  5 Jan 2024 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ur4a6sif"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6F2D788
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704462030;
	bh=kH/6I+0MxEJFhDe4+jvN3LS8dK0bGVVf13LXRW2gb7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=ur4a6sifdCymy/LMuRU0Ap945qbhO9rVexclWLIVozNDd/rSig/7NNZ0VbDv2k7AS
	 /Fh0DC2RRHHM/0Br11jqnQNQcwB1u2uRAauSh6E0gz8GbAL6LxCTRZuXQR72F5WfVU
	 pvFaIcobJNnu6Xv/U+d+peAQjnapSll+iezS7KpvHywGtaaEv1AB6FynBvvGjYAMU9
	 PfZni9d6fvDJ7buy0/htgrXdw7wXxtz4mZQ0cciDuOwWaLFAKoeA81kFL795c0uNyp
	 Oox3XmQgo4RzvpySled/C3z6p8D5uPvc34eK+LBoH3d5pV3qZMlAoW6K2Lx/yBWTSV
	 bODp/YS+HIDIA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4283E378045F;
	Fri,  5 Jan 2024 13:40:30 +0000 (UTC)
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	kernel@collabora.com
Subject: [PATCH] media: videobuf2: Add missing doc comment for waiting_in_dqbuf
Date: Fri,  5 Jan 2024 14:40:20 +0100
Message-Id: <20240105134020.34312-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
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
 include/media/videobuf2-core.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index e41204df19f0..5020e052eda0 100644
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
@@ -550,6 +549,7 @@ struct vb2_buf_ops {
  *		@start_streaming can be called. Used when a DMA engine
  *		cannot be started unless at least this number of buffers
  *		have been queued into the driver.
+ * @alloc_devs:	&struct device memory type/allocator-specific per-plane device
  */
 /*
  * Private elements (won't appear at the uAPI book):
@@ -571,6 +571,8 @@ struct vb2_buf_ops {
  * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
  *		buffers. Only set for capture queues if qbuf has not yet been
  *		called since poll() needs to return %EPOLLERR in that situation.
+ * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while waiting for
+ *		a buffer to arrive so that -EBUSY can be returned when appropriate
  * @is_multiplanar: set if buffer type is multiplanar
  * @is_output:	set if buffer type is output
  * @copy_timestamp: set if vb2-core should set timestamps
-- 
2.25.1


