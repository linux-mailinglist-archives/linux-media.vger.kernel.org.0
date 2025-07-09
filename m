Return-Path: <linux-media+bounces-37203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C714AFE943
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A421BC0BD2
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534F12DEA68;
	Wed,  9 Jul 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sL1zhxns"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4802DC32D;
	Wed,  9 Jul 2025 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065107; cv=none; b=T36fQU4abiHgg+7uxdqwOsUihIKGYZjzdft+fT1bEGPU1aSAa52DEvKq58T9Ffm33W6eSvBBWReyuxkKQ+/jlK6DEKv6LrUvyA4u2bkingKt7SZX3C2qZOXG6iLgAU+ND+9bQXo1nMAgIl108z9sBuR89mWKxRePXG9oxuSuGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065107; c=relaxed/simple;
	bh=j+rGaVFrKh/wTsIEN6Y/GVKJC3e6Fd+LYTBCSBZnuHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpihggiKU/4HfBdKee6kNpt3mSo5L4meLRulxsyCqYwnI7HWs0oMjAf2CryUpxdkFZ2HBXJxn8SUTYLLGyCKOIL9MQPIDv3FD5RubDrTCXTGluNnKhP5nMh9u+tJSaK1K6XoiTbxYT9Ujc+hp2OJEgnIQsQRyNv7Fo6j/36za8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sL1zhxns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D9AC4CEF5;
	Wed,  9 Jul 2025 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065107;
	bh=j+rGaVFrKh/wTsIEN6Y/GVKJC3e6Fd+LYTBCSBZnuHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sL1zhxnslztVR22EPFjnTP6BdUV5LwKMHzA3KxXOgOvl/b6YkoPfXPm8aysatlzru
	 NrY5V62cE/KFyEZBYQnKluajc/VbrV6xEfVN50Rr+THqg0a1rk+P3M+yiEMnrLJnXt
	 egMjis+tIKukv4U4z/7sDF9mQUteQGv2JvkLC66LiP8ggXOMMy3pY8vbkItOviitPC
	 Ge4SbRIx0xV886Gqcl7Dr0DshooNtOPMQij6rs1pWCWQkLISbJ9SDWpL23XRXsJufg
	 ie0FdGcuWkV6/JoCrlU1bo6BLlaG2KHTBSmEj2KaDLzCPV3y+Z3SxB0OcTEMqjrPnn
	 KQ8Gc/GBZgatQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 09 Jul 2025 14:44:51 +0200
Subject: [PATCH v6 1/2] dma/contiguous: Add helper to test reserved memory
 type
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-dma-buf-ecc-heap-v6-1-dac9bf80f35d@kernel.org>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
In-Reply-To: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383; i=mripard@kernel.org;
 h=from:subject:message-id; bh=j+rGaVFrKh/wTsIEN6Y/GVKJC3e6Fd+LYTBCSBZnuHw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl5KT4HohnkJMt+6Nb9K714wOrC4+ebL4qcKzJMCZN74
 LfVMXVCx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI1zTGhgNi7EItlyQL2mL0
 7Lf8smE4lOX7Zur/3KVHN06+vqJ8Qez8gnvzXlqo1a9apzT/1Ju4uYz1wUmqAZsvSvFpcXVNVL+
 3wov5hs/EfbmNuwVuVjJ9+q4575hJFs+NYz9Wls1wcjwdknIQAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A given reserved-memory region can be of multiple types.

We have currently four types defined in the tree: contiguous, backed by
CMA, coherent and swiotlb, backed by their respective allocators, and a
platform-specific one for tegra.

However, some users, like dma-buf heaps, might be interested in the
exact type of a reserved memory region they are getting. It would thus
be useful to have helpers to test if a given region is of a given type.

Since we only care about CMA for now though, let's create one for CMA
only.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 13 +++++++++++++
 kernel/dma/contiguous.c     |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index f48e5fb88bd5dd346094bbf2ce1b79e5f5bfe1a6..ea646acb6367bd062619b337013db221749f85ab 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -153,10 +153,23 @@ static inline void dma_free_contiguous(struct device *dev, struct page *page,
 {
 	__free_pages(page, get_order(size));
 }
 #endif /* CONFIG_DMA_CMA*/
 
+#if defined(CONFIG_DMA_CMA) && defined(CONFIG_OF_RESERVED_MEM)
+struct reserved_mem;
+
+bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem);
+#else
+struct reserved_mem;
+
+static inline bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_addr_t device_addr, size_t size);
 void dma_release_coherent_memory(struct device *dev);
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18eeb0a20145512ba64425d2e7601e..ace4982e928e404315cf38551e1596f7ed445156 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -493,6 +493,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 
 	return 0;
 }
 RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
+
+bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem)
+{
+	return rmem->ops == &rmem_cma_ops;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_is_contiguous);
+
 #endif

-- 
2.50.0


