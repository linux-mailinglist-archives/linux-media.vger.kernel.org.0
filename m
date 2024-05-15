Return-Path: <linux-media+bounces-11490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FA8C681B
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 16:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3DC51F23E99
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 14:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD53A1420DE;
	Wed, 15 May 2024 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcvfAYs4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412391420CC;
	Wed, 15 May 2024 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781484; cv=none; b=JNgtkOrWUIfct9FYNcdTvm0KgVK4rFlrxZBZU4uH+iyrtwFL/bhwFQ0gkwDBcao9YNktFfg03P0gA/udab0nTGIyvKSK/6cJvCqapMFEGPcBD+EPvCa2q4hqaOYG12xZLOu/bJ2JozLsC+Y2enA8B61KhUBh4g6uCf368YwTQrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781484; c=relaxed/simple;
	bh=YUErc85/2hAb52W29W1xwDRHgxBJ9b98hEp6JztRUTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJmodLjlZDGDU05WESPQMIDcqQooInuUEiPzDCdGaOuMNXFSYeiGV+LEHnauMIMzEHDGxkWbXwFmpRk/lFyzgUZl+uT7gRS4coO+LQWtM+rdRQUa4JDUcCwK8maTGhEb9YATJ+dBn4FPjR+UsCPrEKdJs8v6eEuIDzrLgXacviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcvfAYs4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7AEC116B1;
	Wed, 15 May 2024 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781483;
	bh=YUErc85/2hAb52W29W1xwDRHgxBJ9b98hEp6JztRUTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YcvfAYs4MQ/iPuLlDRw7jerxbsdvqmH1YeUKSESyTVc25nYwLnn998MVTf8yNGoPt
	 CyPLk+6ErqwaAA51LtcDUbMLO6TFCHeN4Or/PCPvWSlwVVX2cTUoGxhQFra104sMzM
	 /7xjmWYePVTITzjvZL/qnMttRS1kPOKZ2kIFAYA1Gigux2Mb4B/du15eP2gq81Yl56
	 ZK3cXYmhs1Evg2FaP+ud6/SgQ3wtav4CxWHQ7NakmSB6rriIF3A37c1e7X3fPkenBG
	 6l85/xnA0Gyc4AqpRauj3YgokQ6ZvDilnyQaA5Gnd+gdBT2SMHIyr8G96gShdeoWmg
	 LCbVU0tNoLIWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:02 +0200
Subject: [PATCH 7/8] dma-buf: heaps: cma: Handle ECC flags
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-7-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YUErc85/2hAb52W29W1xwDRHgxBJ9b98hEp6JztRUTU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+wN1TUXfl925deTd7NccCpoPdkYUelmaHTfbsyOfP
 3CzlKhDx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIj8+MtaI9fU+M9Ka2bpzl
 /X6HxNXHXQWLmC+06wTFNtyf2hLyfKKRZZLul5cJzAmVcU/ZLbfvYGz4pXzj6bz5vcs7rdg8QoM
 NN0cLCe15IqKW25RYvCJyztwXz7J31R3Q/H5bwcduyeWo93YA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have introduced ECC-related flags for the dma-heaps buffer
allocations, let's honour these flags depending on the memory setup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..1e6babbd8eb5 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -24,10 +24,11 @@
 
 
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
+	bool ecc_enabled;
 };
 
 struct cma_heap_buffer {
 	struct cma_heap *heap;
 	struct list_head attachments;
@@ -286,10 +287,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	struct page *cma_pages;
 	struct dma_buf *dmabuf;
 	int ret = -ENOMEM;
 	pgoff_t pg;
 
+	if (!cma_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
+		return -EINVAL;
+
+	if (cma_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return -EINVAL;
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
@@ -374,10 +381,13 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
+	if (of_memory_get_ecc_correction_bits() > 0)
+		cma_heap->ecc_enabled = true;
+
 	exp_info.name = cma_get_name(cma);
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
 	cma_heap->heap = dma_heap_add(&exp_info);

-- 
2.44.0


