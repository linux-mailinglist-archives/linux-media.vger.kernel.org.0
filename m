Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F5C30790A
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhA1PE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbhA1PEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:04:02 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B154C061756;
        Thu, 28 Jan 2021 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=JmJ5AAeO5IhBGr/vCqCfTKy9ZVGFTS0PwUNjpSHPNIA=; b=btMv30pS82HD6TeEiv4wsHlDWc
        vM0/8RQFIbJCK+P6q4FPXbFCiG69UhlRwK+QBIeGUiKfX/McL/o570hOyttRrdcULTHHWqF86YKv8
        T1mOTo+E5B9wP6zJFkmSC8NvfrCJGcVBWI8GT8PlDhrzU/1ybl1E8XDUGJRYYqo29T9wY42LHWszN
        jAoOhsX+zwZQUMW7iVRlwZI/XIMqry/+JLF6DbwEdmDFJK05eM1Lg1VaI2BffYGIdqwiJt53F8fmd
        3azxJgBJi9xH91bPXQ6/GHCYQRndJNCLZVJsiXUKuqClyo95eJ7nI/BFN7NfvshRUzjpaAhgkyexV
        nPU3Bf8g==;
Received: from [2001:4bb8:18c:25a3:5b32:95f:aa1f:ea4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l58pC-008bKy-Vy; Thu, 28 Jan 2021 15:03:12 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/6] dma-mapping: add a dma_alloc_noncontiguous API
Date:   Thu, 28 Jan 2021 15:58:34 +0100
Message-Id: <20210128145837.2250561-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128145837.2250561-1-hch@lst.de>
References: <20210128145837.2250561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new API that returns a potentiall virtually non-contigous sg_table
and a DMA address.  This API is only properly implemented for dma-iommu
and will simply return a contigious chunk as a fallback.

The intent is that media drivers can use this API if either:

 - no kernel mapping or only temporary kernel mappings are required.
   That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
 - a kernel mapping is required for cached and DMA mapped pages, but
   the driver also needs the pages to e.g. map them to userspace.
   In that sense it is a replacement for some aspects of the recently
   removed and never fully implemented DMA_ATTR_NON_CONSISTENT

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/core-api/dma-api.rst | 72 +++++++++++++++++++++++
 include/linux/dma-map-ops.h        | 20 +++++++
 include/linux/dma-mapping.h        | 34 +++++++++++
 kernel/dma/mapping.c               | 92 ++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 157a474ae54416..1dd676a8217137 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -594,6 +594,78 @@ dev, size, dma_handle and dir must all be the same as those passed into
 dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
 dma_alloc_noncoherent().
 
+::
+
+	struct sg_table *
+	dma_alloc_noncontiguous(struct device *dev, size_t size,
+				dma_addr_t *dma_handle,
+				enum dma_data_direction dir, gfp_t gfp)
+
+This routine allocates  <size> bytes of non-coherent and possibly non-contiguous
+memory.  It returns a pointer to struct sg_table that describes the allocated
+memory , or NULL if the allocation failed. The resulting memory can be used for
+everything a struct page is suitable for.
+
+It also returns a <dma_handle> which may be cast to an unsigned integer the
+same width as the bus and given to the device as the DMA address base of
+the region.
+
+The dir parameter specified if data is read and/or written by the device,
+see dma_map_single() for details.
+
+The gfp parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation, but rejects flags used to specify a memory
+zone such as GFP_DMA or GFP_HIGHMEM.
+
+Before giving the memory to the device, dma_sync_sgtable_for_device() needs
+to be called, and before reading memory written by the device,
+dma_sync_sgtable_for_cpu(), just like for streaming DMA mappings that are
+reused.
+
+::
+
+	void
+	dma_free_noncontiguous(struct device *dev, size_t size,
+			       struct sg_table *sgt, dma_addr_t dma_handle,
+			       enum dma_data_direction dir)
+
+Free memory previously allocated using dma_alloc_noncontiguous().  dev, size,
+dma_handle and dir must all be the same as those passed into
+dma_alloc_noncontiguous().  sgt must be the pointer returned by
+dma_alloc_noncontiguous().
+
+::
+
+	void *
+	dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt)
+
+Return a contiguous kernel mapping for an allocation returned from
+dma_alloc_noncontiguous().  dev and size must be the same as those passed into
+dma_alloc_noncontiguous().  sgt must be the pointer returned by
+dma_alloc_noncontiguous().
+
+::
+
+	void
+	dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
+
+Unmap a kernel mapping returned by dma_vmap_noncontiguous().  dev must be the
+same the one passed into dma_alloc_noncontiguous().  vaddr must be the pointer
+returned by dma_vmap_noncontiguous().
+
+
+::
+
+	int
+	dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
+			       size_t size, struct sg_table *sgt)
+
+Map an allocation returned from dma_alloc_noncontiguous() into a user address
+space.  dev and size must be the same as those passed into
+dma_alloc_noncontiguous().  sgt must be the pointer returned by
+dma_alloc_noncontiguous().
+
 ::
 
 	int
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 11e02537b9e01b..82efa36d8b09c4 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -22,6 +22,12 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
+	struct sg_table *(*alloc_noncontiguous)(struct device *dev, size_t size,
+			dma_addr_t *dma_handle, enum dma_data_direction dir,
+			gfp_t gfp);
+	void (*free_noncontiguous)(struct device *dev, size_t size,
+			struct sg_table *sgt, dma_addr_t dma_handle,
+			enum dma_data_direction dir);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
@@ -198,6 +204,20 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
+/*
+ * This is the actual return value from the ->alloc_noncontiguous method.
+ * The users of the DMA API should only care about the sg_table, but to make
+ * the DMA-API internal vmaping and freeing easier we stash away the page
+ * array as well (except for the fallback case).  This can go away any time,
+ * e.g. when a vmap-variant that takes a scatterlist comes along.
+ */
+struct dma_sgt_handle {
+	struct sg_table sgt;
+	struct page **pages;
+};
+#define sgt_handle(sgt) \
+	container_of((sgt), struct dma_sgt_handle, sgt)
+
 int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4977a748cb9483..8694c938e7c271 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -144,6 +144,16 @@ u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
 bool dma_need_sync(struct device *dev, dma_addr_t dma_addr);
 unsigned long dma_get_merge_boundary(struct device *dev);
+struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, dma_addr_t dma_handle,
+		enum dma_data_direction dir);
+void *dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt);
+void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
+int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct sg_table *sgt);
 #else /* CONFIG_HAS_DMA */
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
@@ -257,6 +267,30 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 {
 	return 0;
 }
+static inline struct sg_table *dma_alloc_noncontiguous(struct device *dev,
+		size_t size, dma_addr_t *dma_handle,
+		enum dma_data_direction dir, gfp_t gfp)
+{
+	return NULL;
+}
+static inline void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, dma_addr_t dma_handle,
+		enum dma_data_direction dir)
+{
+}
+static inline void *dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt)
+{
+	return NULL;
+}
+static inline void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
+{
+}
+static inline int dma_mmap_noncontiguous(struct device *dev,
+		struct vm_area_struct *vma, size_t size, struct sg_table *sgt)
+{
+	return -EINVAL;
+}
 #endif /* CONFIG_HAS_DMA */
 
 struct page *dma_alloc_pages(struct device *dev, size_t size,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index c1e515496c067b..d34dfd2ba6e320 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -528,6 +528,98 @@ int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL_GPL(dma_mmap_pages);
 
+static struct sg_table *alloc_single_sgt(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	struct sg_table *sgt;
+	struct page *page;
+
+	sgt = kmalloc(sizeof(*sgt), gfp);
+	if (!sgt)
+		return NULL;
+	if (sg_alloc_table(sgt, 1, gfp))
+		goto out_free_sgt;
+	page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
+	if (!page)
+		goto out_free_table;
+	sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+	return sgt;
+out_free_table:
+	sg_free_table(sgt);
+out_free_sgt:
+	kfree(sgt);
+	return NULL;
+}
+
+static void free_single_sgt(struct device *dev, size_t size,
+		struct sg_table *sgt, dma_addr_t dma_handle,
+		enum dma_data_direction dir)
+{
+	dma_free_pages(dev, size, sg_page(sgt->sgl), dma_handle, dir);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (!ops || !ops->alloc_noncontiguous)
+		return alloc_single_sgt(dev, size, dma_handle, dir, gfp);
+	return ops->alloc_noncontiguous(dev, size, dma_handle, dir, gfp);
+}
+EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
+
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, dma_addr_t dma_handle,
+		enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (!ops || !ops->free_noncontiguous)
+		free_single_sgt(dev, size, sgt, dma_handle, dir);
+	else
+		ops->free_noncontiguous(dev, size, sgt, dma_handle, dir);
+}
+EXPORT_SYMBOL_GPL(dma_free_noncontiguous);
+
+void *dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	if (!ops || !ops->alloc_noncontiguous)
+		return page_address(sg_page(sgt->sgl));
+	return vmap(sgt_handle(sgt)->pages, count, VM_MAP, PAGE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(dma_vmap_noncontiguous);
+
+void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (ops && ops->alloc_noncontiguous)
+		vunmap(vaddr);
+}
+EXPORT_SYMBOL_GPL(dma_vunmap_noncontiguous);
+
+int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct sg_table *sgt)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	if (!ops || !ops->alloc_noncontiguous)
+		return dma_mmap_pages(dev, vma, size, sg_page(sgt->sgl));
+
+	if (vma->vm_pgoff >= count || vma_pages(vma) > count - vma->vm_pgoff)
+		return -ENXIO;
+	return vm_map_pages(vma, sgt_handle(sgt)->pages, count);
+}
+EXPORT_SYMBOL_GPL(dma_mmap_noncontiguous);
+
 int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.29.2

