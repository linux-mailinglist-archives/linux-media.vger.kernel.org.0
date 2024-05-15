Return-Path: <linux-media+bounces-11487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E098C680A
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63AA2822A4
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06713F42D;
	Wed, 15 May 2024 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXu68TXf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136913F427;
	Wed, 15 May 2024 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781475; cv=none; b=IsIhDa7+lo1LU0BkuFsgz+gmeOtLJt37bRS8BXsV9qNXREt4p0z/W4Wr0kJoqAHQ2np4nugzpWMJslAfhWfN7IAE/RxUhlhJAaXNv9pYCCgbtNjhku2zzLdB4lRFUDLPSpGve26IlwydtJ1yppNLg2NqB+hC2dSvGtTiOstpqhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781475; c=relaxed/simple;
	bh=3a1PkEj7cE+sch219RIbB9Jk0bMgUp62q1dLoyBXtNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DogI8Qe+m21FvAnqLO+tMIdSQ+NfwRgoUS5D9uRGTZbBPpr5YrWl7T2t6mZ6bUYmo+ErKpbDu6rZvYpN3vL/yWqh9Da48pt8Euc2sHUwBKbE6WiyEL/qvuFQkJ8dijXyX8jIZSJD2o1zdy6FmmaTE+Ds0Ad4iLxGLkT18BQ58Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXu68TXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF92C116B1;
	Wed, 15 May 2024 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781474;
	bh=3a1PkEj7cE+sch219RIbB9Jk0bMgUp62q1dLoyBXtNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QXu68TXftiz2lZOlszefjpiO6hArafdb17Coy3vmlIKkWX1OTyUhmaxRP9Gkg92cH
	 htkRgOtHMIewMzwPQE9UXTJz7jkSgrRdaRpNs0HD7mkSCmw/NSbr2Me1iPuizOTvpX
	 xjJWdWNZYkbmCExVJkX80T7at917TAo29YHxraWuxwC2hZpBJgWFRWj74MZU/a8K62
	 QTjhcN9n27uj0cTaUj/VBMnC+dlSa1CYn1E21Pyj6lT5FL6CFXiVAOC/didMJdwlPG
	 RBqhC1ZopZGwWC3mrWGmGpxAHYPFEWTByZ60XzEqdIDZGy3iq3Xe5j9uxQt4n+DeHT
	 R9aKXFT8gVe5g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:59 +0200
Subject: [PATCH 4/8] dma-buf: heaps: Add ECC protection flags
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-4-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3a1PkEj7cE+sch219RIbB9Jk0bMgUp62q1dLoyBXtNE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/2nKmw4Xr3PpCAtJ9HX6rfW47R9Dit2ez1IiU7p5
 phpe8G3YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykhImxYfev3IBfD6+9YDuc
 2t2+614VF/dWOcUVfXc41n2rveHQrVlV4x7Qz73kL6f+39v2hZt6GRv+mvRsZot9yu0tP9m/82P
 TvNeat1UCvjcpnVfI+cYVKSlxuihVdOniK7tfLn0moneHYxYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Some systems run with ECC enabled on the memory by default, but with
some memory regions with ECC disabled to mitigate the downsides of
enabling ECC (reduced performances, increased memory usage) for buffers
that don't require it.

Let's create some allocation flags to ask for a particular ECC setup
when allocate a dma-buf through a heap.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/dma-heap.c    | 4 ++++
 include/uapi/linux/dma-heap.h | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..a96c1865b627 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -106,10 +106,14 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 		return -EINVAL;
 
 	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
 		return -EINVAL;
 
+	if ((heap_allocation->heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED) &&
+	    (heap_allocation->heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return -EINVAL;
+
 	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
 				   heap_allocation->fd_flags,
 				   heap_allocation->heap_flags);
 	if (fd < 0)
 		return fd;
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index 6f84fa08e074..677b6355552d 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -16,12 +16,13 @@
  */
 
 /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
-/* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0)
+#define DMA_HEAP_FLAG_ECC_PROTECTED	BIT(0)
+#define DMA_HEAP_FLAG_ECC_UNPROTECTED	BIT(1)
+#define DMA_HEAP_VALID_HEAP_FLAGS (DMA_HEAP_FLAG_ECC_PROTECTED | DMA_HEAP_FLAG_ECC_UNPROTECTED)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
  *                                      allocations
  * @len:		size of the allocation

-- 
2.44.0


