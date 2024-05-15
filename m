Return-Path: <linux-media+bounces-11489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3108C6814
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15C71C204F9
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE3A1420A2;
	Wed, 15 May 2024 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIEWiQt3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9514199C;
	Wed, 15 May 2024 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781481; cv=none; b=Be3vBx0MxyDuTbuhcXSE1EdeeVeVdl5nXT33eHM9LojUsGjIb37tjae8aoEXCiveAml+xZtNlVSlqa+XG93ZZBfWQrcdiaSSfTLFo7VO7+yycILIeN5/bzqSQkuxeAb8/P6OZkxm116aszkLtxMQ65szDBDz1CXrV6DYv1w7LL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781481; c=relaxed/simple;
	bh=5mlKKVq2eJW/2EfLe5DfEKj2I4ZhUMzP6qbNsK6waI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IN5smj/uWZQ2hxTw2bW65Av2jhgka3+gcCY70ZNeAbcmrj4aGE7CKiuAvcAVrE4qkIZzgk4ot7U3tYv3IHJvfXrPO63uBNGPir66Pgwk7Yj4smG3LjO7jWB146oMmo1+hUi9QZRi45a+AF7zoDQxISRyHdam9O1iK6IADaViIOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIEWiQt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40576C32786;
	Wed, 15 May 2024 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781480;
	bh=5mlKKVq2eJW/2EfLe5DfEKj2I4ZhUMzP6qbNsK6waI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nIEWiQt3XuLSsZQZbWwRK/SZdLBw0yS/Z0FGjHBgaacZPjdEhuvlesyZ8P2aS0pKQ
	 srv93C5wQVlqvWYipTMZJtZkgbHq/VwWSyr800bzc1x5redx59NQJdYgwBXAAOXVp3
	 bd/xYluu06uM4adros5GaK5yunJRLnzDWy3zsrWOlhAz4ooJ7GaW7Refb43pAaAke+
	 pD4dZONJjf5kqS7QGfLgjzNkk8J9bmYLNCnLz4HFQBSobuX9Ph5jn4qfMdiIkcX4Fa
	 sMtVnTiOpr2gkKTD8v9lNzqDJXZ5ixtZSVg6BTB/p1gmSmVvl0HWAyEOChq5jbIPfh
	 dJB3NWSekMMSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:01 +0200
Subject: [PATCH 6/8] dma-buf: heaps: system: Handle ECC flags
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-6-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5mlKKVq2eJW/2EfLe5DfEKj2I4ZhUMzP6qbNsK6waI0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+wMqyhNdctYvMNP72vKxoNKqpU9Xykhq7o8rXG6Tn
 j5n3OvTMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACai9oKxviBz/06PH5mvm05b
 6tktPvglcFHO/COB24oK7X9dO274mbmNbaropF3il/T3vueOYvK4zlhnOz+6QcGIT+jg7wdWG/p
 ro9hjbR7cPlj0R+6uyrtsn7LCnum7/dcYenOmb/x/NPNHRxkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have introduced ECC-related flags for the dma-heaps buffer
allocations, let's honour these flags depending on the memory setup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 8b5e6344eea4..dd7c8b6f9cf6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -18,13 +18,15 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/of.h>
 
 struct system_heap {
 	struct dma_heap *heap;
+	bool ecc_enabled;
 };
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
@@ -336,10 +338,11 @@ static struct page *alloc_largest_available(unsigned long size,
 static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 					    unsigned long len,
 					    unsigned long fd_flags,
 					    unsigned long heap_flags)
 {
+	struct system_heap *sys_heap = dma_heap_get_drvdata(heap);
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	unsigned long size_remaining = len;
 	unsigned int max_order = orders[0];
 	struct dma_buf *dmabuf;
@@ -347,10 +350,16 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct scatterlist *sg;
 	struct list_head pages;
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	if (!sys_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
+		return ERR_PTR(-EINVAL);
+
+	if (sys_heap->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return ERR_PTR(-EINVAL);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
@@ -430,10 +439,13 @@ static int system_heap_create(void)
 
 	sys_heap = kzalloc(sizeof(*sys_heap), GFP_KERNEL);
 	if (!sys_heap)
 		return -ENOMEM;
 
+	if (of_memory_get_ecc_correction_bits() > 0)
+		sys_heap->ecc_enabled = true;
+
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
 	exp_info.priv = sys_heap;
 
 	sys_heap->heap = dma_heap_add(&exp_info);

-- 
2.44.0


