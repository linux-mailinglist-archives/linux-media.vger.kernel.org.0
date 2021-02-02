Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE93730BB77
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBBJxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhBBJwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7B7C061786;
        Tue,  2 Feb 2021 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=8ctc3SQtOdY3GnKsKprPxf0Aq17X8Ps39Pig0nEd4YM=; b=ASpQNkvlmq9AOapGaxK50bnIh1
        iNG3G8YYtR6rz9sPxx+y9j3EJpHQ3jYfp53R6kiPa4oG3K8GAvTgVoNum5rCJ/DdtRKUBGJoD//L2
        nIwNgjhyYWZe7ojtGffc9XMOE0nMHTaMzYcYvqzv3HypGxtXz8B3O43SDwMq0CS1ZdS8i57Bo9h/l
        JLJnUC7rau0Xv6jNBn+weQkE9WFgcIfkNc8qr3laVXkuf/0y6o35/c4TapFOtYg+BXvfspz5iXNEh
        GaR7L78mvL6cTpsRq/ixwhPoC41sIy/YH/bydFjmbh34n/s+lIh8AlaJNTl2AYWNfGZqIus/jFDFq
        WK8o+umA==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sLG-00F0wy-4I; Tue, 02 Feb 2021 09:51:27 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/7] dma-mapping: add a dma_alloc_noncontiguous API
Date:   Tue,  2 Feb 2021 10:51:07 +0100
Message-Id: <20210202095110.1215346-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202095110.1215346-1-hch@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
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
 Documentation/core-api/dma-api.rst |  74 +++++++++++++++++++++
 include/linux/dma-map-ops.h        |  18 +++++
 include/linux/dma-mapping.h        |  31 +++++++++
 kernel/dma/mapping.c               | 103 +++++++++++++++++++++++++++++
 4 files changed, 226 insertions(+)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 157a474ae54416..e24b2447f4bfe6 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -594,6 +594,80 @@ dev, size, dma_handle and dir must all be the same as those passed into
 dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
 dma_alloc_noncoherent().
 
+::
+
+	struct sg_table *
+	dma_alloc_noncontiguous(struct device *dev, size_t size,
+				enum dma_data_direction dir, gfp_t gfp)
+
+This routine allocates  <size> bytes of non-coherent and possibly non-contiguous
+memory.  It returns a pointer to struct sg_table that describes the allocated
+and DMA mapped memory, or NULL if the allocation failed. The resulting memory
+can be used for struct page mapped into a scatterlist are suitable for.
+
+The return sg_table is guaranteed to have 1 single DMA mapped segment as
+indicated by sgt->nents, but it might have multiple CPU side segments as
+indicated by sgt->orig_nents.
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
+			       struct sg_table *sgt,
+			       enum dma_data_direction dir)
+
+Free memory previously allocated using dma_alloc_noncontiguous().  dev, size,
+and dir must all be the same as those passed into dma_alloc_noncontiguous().
+sgt must be the pointer returned by dma_alloc_noncontiguous().
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
+Once a non-contiguous allocation is mapped using this function, the
+flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must be used
+to manage the coherency of the kernel mapping.
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
index 11e02537b9e01b..fe46a41130e662 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -22,6 +22,10 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
+	struct sg_table *(*alloc_noncontiguous)(struct device *dev, size_t size,
+			enum dma_data_direction dir, gfp_t gfp);
+	void (*free_noncontiguous)(struct device *dev, size_t size,
+			struct sg_table *sgt, enum dma_data_direction dir);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
@@ -198,6 +202,20 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
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
index 4977a748cb9483..6f4d34739f5cc6 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -144,6 +144,15 @@ u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
 bool dma_need_sync(struct device *dev, dma_addr_t dma_addr);
 unsigned long dma_get_merge_boundary(struct device *dev);
+struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
+		enum dma_data_direction dir, gfp_t gfp);
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, enum dma_data_direction dir);
+void *dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt);
+void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
+int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct sg_table *sgt);
 #else /* CONFIG_HAS_DMA */
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
@@ -257,6 +266,28 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 {
 	return 0;
 }
+static inline struct sg_table *dma_alloc_noncontiguous(struct device *dev,
+		size_t size, enum dma_data_direction dir, gfp_t gfp)
+{
+	return NULL;
+}
+static inline void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, enum dma_data_direction dir)
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
index 5e87dac6cc6d9a..5a62439ed483af 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -537,6 +537,109 @@ int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL_GPL(dma_mmap_pages);
 
+static struct sg_table *alloc_single_sgt(struct device *dev, size_t size,
+		enum dma_data_direction dir, gfp_t gfp)
+{
+	struct sg_table *sgt;
+	struct page *page;
+
+	sgt = kmalloc(sizeof(*sgt), gfp);
+	if (!sgt)
+		return NULL;
+	if (sg_alloc_table(sgt, 1, gfp))
+		goto out_free_sgt;
+	page = __dma_alloc_pages(dev, size, &sgt->sgl->dma_address, dir, gfp);
+	if (!page)
+		goto out_free_table;
+	sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+	sg_dma_len(sgt->sgl) = sgt->sgl->length;
+	return sgt;
+out_free_table:
+	sg_free_table(sgt);
+out_free_sgt:
+	kfree(sgt);
+	return NULL;
+}
+
+struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
+		enum dma_data_direction dir, gfp_t gfp)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	struct sg_table *sgt;
+
+	if (ops && ops->alloc_noncontiguous)
+		sgt = ops->alloc_noncontiguous(dev, size, dir, gfp);
+	else
+		sgt = alloc_single_sgt(dev, size, dir, gfp);
+
+	if (sgt) {
+		sgt->nents = 1;
+		debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir);
+	}
+	return sgt;
+}
+EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
+
+static void free_single_sgt(struct device *dev, size_t size,
+		struct sg_table *sgt, enum dma_data_direction dir)
+{
+	__dma_free_pages(dev, size, sg_page(sgt->sgl), sgt->sgl->dma_address,
+			 dir);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	debug_dma_unmap_sg(dev, sgt->sgl, sgt->orig_nents, dir);
+	if (ops && ops->free_noncontiguous)
+		ops->free_noncontiguous(dev, size, sgt, dir);
+	else
+		free_single_sgt(dev, size, sgt, dir);
+}
+EXPORT_SYMBOL_GPL(dma_free_noncontiguous);
+
+void *dma_vmap_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	if (ops && ops->alloc_noncontiguous)
+		return vmap(sgt_handle(sgt)->pages, count, VM_MAP, PAGE_KERNEL);
+	return page_address(sg_page(sgt->sgl));
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
+
+	if (ops && ops->alloc_noncontiguous) {
+		unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+		if (vma->vm_pgoff >= count ||
+		    vma_pages(vma) > count - vma->vm_pgoff)
+			return -ENXIO;
+		return vm_map_pages(vma, sgt_handle(sgt)->pages, count);
+	}
+	return dma_mmap_pages(dev, vma, size, sg_page(sgt->sgl));
+}
+EXPORT_SYMBOL_GPL(dma_mmap_noncontiguous);
+
 int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.29.2

