Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA75307906
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhA1PD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhA1PDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:03:54 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C300C061574;
        Thu, 28 Jan 2021 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=C4gwfxOJ/vXre3lN9UufmmjUIasSmHttFaQ+GpK794U=; b=vnSEM1YT0P7LR+hs7ghfNUIsGt
        ku6MRdfPNokdLFb+04SgPjx1olzrpXB9Yj8lWjZPYZQBoDhA6rMhO0qhcZBe/+WcMSe3ys+XiLibP
        8NZUDtbEXGOd6fh6aUlLAKGMJDCaGrZ7Rvkl6Vt+/e1tpt1bVuSQLEbjAYHjTW9MqJTvliQdLWp6V
        W+eKUZcglbPzzKuq8SlGjftR/XyQsLnPSGkHVFsSl4ajgaj+vnx4dV0U6lw/axDqZtpu6N/vh14uc
        jzjIYaaxjDUFaHcSnnHpEXrBYTxA7Kw+Lx8p0XaV56ZvGh2Z6rfUVMTJGKPPI2W5qWMcBJWvkto1O
        KUbbV7TQ==;
Received: from 213-225-36-89.nat.highway.a1.net ([213.225.36.89] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l58p4-008bKj-Tp; Thu, 28 Jan 2021 15:03:04 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/6] dma-mapping: remove the {alloc,free}_noncoherent methods
Date:   Thu, 28 Jan 2021 15:58:32 +0100
Message-Id: <20210128145837.2250561-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128145837.2250561-1-hch@lst.de>
References: <20210128145837.2250561-1-hch@lst.de>
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
 Documentation/core-api/dma-api.rst | 64 ++++++++++--------------------
 drivers/iommu/dma-iommu.c          | 30 --------------
 include/linux/dma-map-ops.h        |  5 ---
 include/linux/dma-mapping.h        | 17 ++++++--
 kernel/dma/mapping.c               | 40 -------------------
 5 files changed, 35 insertions(+), 121 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 75cb757bbff00a..e6d23f117308df 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -528,16 +528,14 @@ an I/O device, you should not be using this part of the API.
 
 ::
 
-	void *
-	dma_alloc_noncoherent(struct device *dev, size_t size,
-			dma_addr_t *dma_handle, enum dma_data_direction dir,
-			gfp_t gfp)
+	struct page *
+	dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
+			enum dma_data_direction dir, gfp_t gfp)
 
-This routine allocates a region of <size> bytes of consistent memory.  It
-returns a pointer to the allocated region (in the processor's virtual address
-space) or NULL if the allocation failed.  The returned memory may or may not
-be in the kernel direct mapping.  Drivers must not call virt_to_page on
-the returned memory region.
+This routine allocates a region of <size> bytes of non-coherent memory.  It
+returns a pointer to first struct page for the region, or NULL if the
+allocation failed. The resulting struct page can be used for everything a
+struct page is suitable for.
 
 It also returns a <dma_handle> which may be cast to an unsigned integer the
 same width as the bus and given to the device as the DMA address base of
@@ -558,51 +556,33 @@ reused.
 ::
 
 	void
-	dma_free_noncoherent(struct device *dev, size_t size, void *cpu_addr,
+	dma_free_pages(struct device *dev, size_t size, struct page *page,
 			dma_addr_t dma_handle, enum dma_data_direction dir)
 
-Free a region of memory previously allocated using dma_alloc_noncoherent().
-dev, size and dma_handle and dir must all be the same as those passed into
-dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
-dma_alloc_noncoherent().
+Free a region of memory previously allocated using dma_alloc_pages().
+dev, size, dma_handle and dir must all be the same as those passed into
+dma_alloc_pages().  page must be the pointer returned by dma_alloc_pages().
 
 ::
 
-	struct page *
-	dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
-			enum dma_data_direction dir, gfp_t gfp)
-
-This routine allocates a region of <size> bytes of non-coherent memory.  It
-returns a pointer to first struct page for the region, or NULL if the
-allocation failed. The resulting struct page can be used for everything a
-struct page is suitable for.
-
-It also returns a <dma_handle> which may be cast to an unsigned integer the
-same width as the bus and given to the device as the DMA address base of
-the region.
-
-The dir parameter specified if data is read and/or written by the device,
-see dma_map_single() for details.
-
-The gfp parameter allows the caller to specify the ``GFP_`` flags (see
-kmalloc()) for the allocation, but rejects flags used to specify a memory
-zone such as GFP_DMA or GFP_HIGHMEM.
+	void *
+	dma_alloc_noncoherent(struct device *dev, size_t size,
+			dma_addr_t *dma_handle, enum dma_data_direction dir,
+			gfp_t gfp)
 
-Before giving the memory to the device, dma_sync_single_for_device() needs
-to be called, and before reading memory written by the device,
-dma_sync_single_for_cpu(), just like for streaming DMA mappings that are
-reused.
+This routine is a convenient wrapper around dma_alloc_pages that returns the
+kernel virtual address for the allocated memory instead of the page structure.
 
 ::
 
 	void
-	dma_free_pages(struct device *dev, size_t size, struct page *page,
+	dma_free_noncoherent(struct device *dev, size_t size, void *cpu_addr,
 			dma_addr_t dma_handle, enum dma_data_direction dir)
 
-Free a region of memory previously allocated using dma_alloc_pages().
-dev, size and dma_handle and dir must all be the same as those passed into
-dma_alloc_noncoherent().  page must be the pointer returned by
-dma_alloc_pages().
+Free a region of memory previously allocated using dma_alloc_noncoherent().
+dev, size, dma_handle and dir must all be the same as those passed into
+dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
+dma_alloc_noncoherent().
 
 ::
 
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4078358ed66ea8..255533faf90599 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1197,34 +1197,6 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
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
@@ -1295,8 +1267,6 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
-	.alloc_noncoherent	= iommu_dma_alloc_noncoherent,
-	.free_noncoherent	= iommu_dma_free_noncoherent,
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 70fcd0f610ea48..11e02537b9e01b 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -22,11 +22,6 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
-	void *(*alloc_noncoherent)(struct device *dev, size_t size,
-			dma_addr_t *dma_handle, enum dma_data_direction dir,
-			gfp_t gfp);
-	void (*free_noncoherent)(struct device *dev, size_t size, void *vaddr,
-			dma_addr_t dma_handle, enum dma_data_direction dir);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 2e49996a8f391a..fbfa3f5abd9498 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -263,10 +263,19 @@ struct page *dma_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
 void dma_free_pages(struct device *dev, size_t size, struct page *page,
 		dma_addr_t dma_handle, enum dma_data_direction dir);
-void *dma_alloc_noncoherent(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
-void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, enum dma_data_direction dir);
+
+static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	struct page *page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
+	return page ? page_address(page) : NULL;
+}
+
+static inline void dma_free_noncoherent(struct device *dev, size_t size,
+		void *vaddr, dma_addr_t dma_handle, enum dma_data_direction dir)
+{
+	dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
+}
 
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index f87a89d086544b..68992e35c8c3a7 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -515,46 +515,6 @@ void dma_free_pages(struct device *dev, size_t size, struct page *page,
 }
 EXPORT_SYMBOL_GPL(dma_free_pages);
 
-void *dma_alloc_noncoherent(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
-{
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
-
-	size = PAGE_ALIGN(size);
-	vaddr = ops->alloc_noncoherent(dev, size, dma_handle, dir, gfp);
-	if (vaddr)
-		debug_dma_map_page(dev, virt_to_page(vaddr), 0, size, dir,
-				   *dma_handle);
-	return vaddr;
-}
-EXPORT_SYMBOL_GPL(dma_alloc_noncoherent);
-
-void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, enum dma_data_direction dir)
-{
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
-}
-EXPORT_SYMBOL_GPL(dma_free_noncoherent);
-
 int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.29.2

