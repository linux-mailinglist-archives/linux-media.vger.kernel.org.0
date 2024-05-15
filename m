Return-Path: <linux-media+bounces-11491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE378C6820
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 16:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5DA31F23F3F
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 14:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376C31422BC;
	Wed, 15 May 2024 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwfJbMJr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C1420CC;
	Wed, 15 May 2024 13:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781487; cv=none; b=HQVnhEuWKx0IpOtHQC8Djt4NBwxrmJ3bSVwVpZh5+zsX85FNdkv+oj8fOkkexdr9vMic1qCOSQa91EB7yDNfKku9ZfPqGsBWzSFMByfVQ33qypD82WPi31EG4ze/ssqs90AGn8H6JJAgf5/JDxrO/LHBE4342TIxx11D1REyaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781487; c=relaxed/simple;
	bh=N5UwfZ1hKMI6+ZrGSh9smBi+SvvW9VpZtds2AMuGHos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8D51Wh/k2IJB0Y8ddDaI5l3C1gp2twFCqztAG+1lvm6GtrOp/o3qgZBx4ppqyh4BhqGfHSnHJ+aI/wNlc5eexL37L3MTXRNJya6tXKGiNd22AYt3eqGMlM7jSIdeJb8UrkIfdJizYNT8PvTsw/OaSZ1Cbk3vlcSMpiBGHtydnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwfJbMJr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3B1C2BD11;
	Wed, 15 May 2024 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781487;
	bh=N5UwfZ1hKMI6+ZrGSh9smBi+SvvW9VpZtds2AMuGHos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TwfJbMJr2eudO50gB4jtqCfWmhQ4amIjE1zaF6WRdIcpHwO5rxvJbZJuVPBjUSigc
	 8TO0sFjBMWieujTeWTcuXI80s/WdCooRLCshP+Q/b0ITdjgasFFSNbNxExZovj+gwM
	 MqxQyWjQ9L4GKUH5za52rqgOSxbjtXji1bS6WDBU09KLKF6xXnGxBua7W8KBwKwYTv
	 kTyJG45a37w38lAwA6FHp1phbWKUmqeti4YPxDNtGMpGRIPOYhZd/GFlbyoIEyxavY
	 r47jnKx51PjUmobjfH+JRFKkFOOn0ocJkOqbql9gO5OBozz9g9Hmqn6m9vT+dk6kVi
	 oqdf60asXfERQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:03 +0200
Subject: [PATCH 8/8] dma-buf: heaps: carveout: Handle ECC flags
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-8-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N5UwfZ1hKMI6+ZrGSh9smBi+SvvW9VpZtds2AMuGHos=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+wOVf9vPYLP0PMqdtrWoJ7LZR7Lp+cNXh60Z5vbwa
 D3c2HqlYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkbh5jnYYCo0VUtc+Dd+uE
 2daUX+142sf9ZzNr7g5joTNPPvPvWLjxoFSLysFas91tCT8vZjzoYaxmSWWJajqzSnUrN69XyMV
 0Lukrn8/LlLqZ6FROnnTgt2SU9adC6ZaXZtJ3NbLWr572kQ0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have introduced ECC-related flags for the dma-heaps buffer
allocations, let's honour these flags depending on the memory setup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/carveout_heap.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
index 896ca67e6bd9..81b167785999 100644
--- a/drivers/dma-buf/heaps/carveout_heap.c
+++ b/drivers/dma-buf/heaps/carveout_heap.c
@@ -6,10 +6,11 @@
 #include <linux/of_reserved_mem.h>
 
 struct carveout_heap_priv {
 	struct dma_heap *heap;
 	struct gen_pool *pool;
+	bool ecc_enabled;
 };
 
 struct carveout_heap_buffer_priv {
 	struct mutex lock;
 	struct list_head attachments;
@@ -182,10 +183,16 @@ static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
 	struct dma_buf *buf;
 	dma_addr_t daddr;
 	void *buffer;
 	int ret;
 
+	if (!heap_priv->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
+		return ERR_PTR(-EINVAL);
+
+	if (heap_priv->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return ERR_PTR(-EINVAL);
+
 	buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
 	if (!buffer_priv)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer_priv->attachments);
@@ -235,20 +242,29 @@ static int __init carveout_heap_setup(struct device_node *node)
 	const struct reserved_mem *rmem;
 	struct carveout_heap_priv *priv;
 	struct dma_heap *heap;
 	struct gen_pool *pool;
 	void *base;
+	u32 val = 0;
 	int ret;
 
 	rmem = of_reserved_mem_lookup(node);
 	if (!rmem)
 		return -EINVAL;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	of_property_read_u32(node, "ecc-correction-bits", &val);
+	if (val <= 0) {
+		if (of_memory_get_ecc_correction_bits() > 0)
+			priv->ecc_enabled = true;
+	} else {
+		priv->ecc_enabled = true;
+	}
+
 	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
 	if (!pool) {
 		ret = -ENOMEM;
 		goto err_cleanup_heap;
 	}

-- 
2.44.0


