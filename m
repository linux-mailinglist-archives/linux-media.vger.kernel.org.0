Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E27127EE8B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbgI3QJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbgI3QJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0D8C0613D1;
        Wed, 30 Sep 2020 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=xYVAS8gqHWqs3QJ5Ea1gOgq+YCGQh2QxwGDstR65vcw=; b=bgqyEOvcazknkjXu+XD34eM9kU
        2/Qxq/Ch1RrqStmO/H7aFX7eocn3B89NDrAYzUEelsKifeeuNjSmMbIjr9nZKUMXphR59qJj0b2EV
        +vjB15gtEiWZOBEZ69jetp6DC/qBJi8ZDTT8+GHAGZiJfOsx6zYi1YjsmygpEdZIaonLbnjFmkfw6
        GnBouNenkOqKlq/0ckJqygNI3j5c9iaL2eHbTDr/HRhxdV+/KBSFCzUgyDOPYrZPCN27eazHVcpbo
        KcvepWMlyEidZqfNgm+mBlP7eRHXJ5cOki4RRZb8PfPaU683fAqLTH6FStWpnRCt0oCqpMS2TT4vH
        SK+TbjCw==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefS-0003Ct-A7; Wed, 30 Sep 2020 16:09:22 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/8] dma-mapping: remove the {alloc,free}_noncoherent methods
Date:   Wed, 30 Sep 2020 18:09:10 +0200
Message-Id: <20200930160917.1234225-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It turns out allowing non-contigous allocations here was a rather bad
idea, as we'll now need to define ways to get the pages for mmaping
or dma_buf sharing.  Revert this change and stick to the original
concept.  A different API for the use case of non-contigous allocations
will be added back later.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c   | 30 ------------------------------
 include/linux/dma-mapping.h |  5 -----
 kernel/dma/mapping.c        | 33 ++++++---------------------------
 3 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c12c1dc43d312e..b363b20a9f41ce 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1055,34 +1055,6 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	return cpu_addr;
 }
 
-#ifdef CONFIG_DMA_REMAP
-static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
-		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
-{
-	if (!gfpflags_allow_blocking(gfp)) {
-		struct page *page;
-
-		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
-		if (!page)
-			return NULL;
-		return page_address(page);
-	}
-
-	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
-				     PAGE_KERNEL, 0);
-}
-
-static void iommu_dma_free_noncoherent(struct device *dev, size_t size,
-		void *cpu_addr, dma_addr_t handle, enum dma_data_direction dir)
-{
-	__iommu_dma_unmap(dev, handle, size);
-	__iommu_dma_free(dev, size, cpu_addr);
-}
-#else
-#define iommu_dma_alloc_noncoherent		NULL
-#define iommu_dma_free_noncoherent		NULL
-#endif /* CONFIG_DMA_REMAP */
-
 static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
@@ -1153,8 +1125,6 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
-	.alloc_noncoherent	= iommu_dma_alloc_noncoherent,
-	.free_noncoherent	= iommu_dma_free_noncoherent,
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 7c77cd6f3604a7..4b9b1d64f5ec9e 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -74,11 +74,6 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
-	void* (*alloc_noncoherent)(struct device *dev, size_t size,
-			dma_addr_t *dma_handle, enum dma_data_direction dir,
-			gfp_t gfp);
-	void (*free_noncoherent)(struct device *dev, size_t size, void *vaddr,
-			dma_addr_t dma_handle, enum dma_data_direction dir);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			  void *, dma_addr_t, size_t,
 			  unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9669550656a0b4..06115f59f4ffbf 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -513,40 +513,19 @@ EXPORT_SYMBOL_GPL(dma_free_pages);
 void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-	void *vaddr;
-
-	if (!ops || !ops->alloc_noncoherent) {
-		struct page *page;
-
-		page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
-		if (!page)
-			return NULL;
-		return page_address(page);
-	}
+	struct page *page;
 
-	size = PAGE_ALIGN(size);
-	vaddr = ops->alloc_noncoherent(dev, size, dma_handle, dir, gfp);
-	if (vaddr)
-		debug_dma_map_page(dev, virt_to_page(vaddr), 0, size, dir,
-				   *dma_handle);
-	return vaddr;
+	page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
+	if (!page)
+		return NULL;
+	return page_address(page);
 }
 EXPORT_SYMBOL_GPL(dma_alloc_noncoherent);
 
 void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, enum dma_data_direction dir)
 {
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	if (!ops || !ops->free_noncoherent) {
-		dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
-		return;
-	}
-
-	size = PAGE_ALIGN(size);
-	debug_dma_unmap_page(dev, dma_handle, size, dir);
-	ops->free_noncoherent(dev, size, vaddr, dma_handle, dir);
+	dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
 }
 EXPORT_SYMBOL_GPL(dma_free_noncoherent);
 
-- 
2.28.0

