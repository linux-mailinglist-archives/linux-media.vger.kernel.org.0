Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A38830BB79
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhBBJxH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhBBJwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F05C061788;
        Tue,  2 Feb 2021 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=64A7herlcZlvWcI6alDQM37QEUYclkAj4BcQkJo+WtM=; b=pFdpqMg6CvZGy4ZL615fryYJ8n
        joZqk/xF5frihgPn0JceJeFdTrvKXswbmFzxAmEeZIg3OXVj1rmMN7URrfz8N6RlBUaJ4Vn4/n2ZA
        V1BKC8sMoqx6fwUqsi7vxaM1VqwMZyLJ+lFA3iyDotKiAoc9T07f8gBdo762kMRrslpQfGgz9pA5b
        afS2Gxdp3OFXQmzBMYFmnbOAhvUXRECY08505M4eNrZySQ2HBwxaP6+wtsEwYMYW0gTtLk51462Ul
        10BaoWWdKnbYAIueZ7noXhwGus+FYOesbD/RQyiHFROP1c0y4Ij0f/NfYcffZau9f17GVqcUd+S2m
        m6fPDrTA==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sLI-00F0xO-Sk; Tue, 02 Feb 2021 09:51:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/7] dma-iommu: refactor iommu_dma_alloc_remap
Date:   Tue,  2 Feb 2021 10:51:08 +0100
Message-Id: <20210202095110.1215346-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202095110.1215346-1-hch@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split out a new helper that only allocates a sg_table worth of
memory without mapping it into contiguous kernel address space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 67 ++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 255533faf90599..85cb004d7a44c6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -661,23 +661,12 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	return pages;
 }
 
-/**
- * iommu_dma_alloc_remap - Allocate and map a buffer contiguous in IOVA space
- * @dev: Device to allocate memory for. Must be a real device
- *	 attached to an iommu_dma_domain
- * @size: Size of buffer in bytes
- * @dma_handle: Out argument for allocated DMA handle
- * @gfp: Allocation flags
- * @prot: pgprot_t to use for the remapped mapping
- * @attrs: DMA attributes for this allocation
- *
- * If @size is less than PAGE_SIZE, then a full CPU page will be allocated,
+/*
+ * If size is less than PAGE_SIZE, then a full CPU page will be allocated,
  * but an IOMMU which supports smaller pages might not map the whole thing.
- *
- * Return: Mapped virtual address, or NULL on failure.
  */
-static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, struct sg_table *sgt, gfp_t gfp, pgprot_t prot,
 		unsigned long attrs)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
@@ -687,11 +676,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
 	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
 	struct page **pages;
-	struct sg_table sgt;
 	dma_addr_t iova;
-	void *vaddr;
-
-	*dma_handle = DMA_MAPPING_ERROR;
 
 	if (unlikely(iommu_dma_deferred_attach(dev, domain)))
 		return NULL;
@@ -717,38 +702,56 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	if (!iova)
 		goto out_free_pages;
 
-	if (sg_alloc_table_from_pages(&sgt, pages, count, 0, size, GFP_KERNEL))
+	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, GFP_KERNEL))
 		goto out_free_iova;
 
 	if (!(ioprot & IOMMU_CACHE)) {
 		struct scatterlist *sg;
 		int i;
 
-		for_each_sg(sgt.sgl, sg, sgt.orig_nents, i)
+		for_each_sg(sgt->sgl, sg, sgt->orig_nents, i)
 			arch_dma_prep_coherent(sg_page(sg), sg->length);
 	}
 
-	if (iommu_map_sg_atomic(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
+	if (iommu_map_sg_atomic(domain, iova, sgt->sgl, sgt->orig_nents, ioprot)
 			< size)
 		goto out_free_sg;
 
+	sgt->sgl->dma_address = iova;
+	return pages;
+
+out_free_sg:
+	sg_free_table(sgt);
+out_free_iova:
+	iommu_dma_free_iova(cookie, iova, size, NULL);
+out_free_pages:
+	__iommu_dma_free_pages(pages, count);
+	return NULL;
+}
+
+static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+		unsigned long attrs)
+{
+	struct page **pages;
+	struct sg_table sgt;
+	void *vaddr;
+
+	pages = __iommu_dma_alloc_noncontiguous(dev, size, &sgt, gfp, prot,
+						attrs);
+	if (!pages)
+		return NULL;
+	*dma_handle = sgt.sgl->dma_address;
+	sg_free_table(&sgt);
 	vaddr = dma_common_pages_remap(pages, size, prot,
 			__builtin_return_address(0));
 	if (!vaddr)
 		goto out_unmap;
-
-	*dma_handle = iova;
-	sg_free_table(&sgt);
 	return vaddr;
 
 out_unmap:
-	__iommu_dma_unmap(dev, iova, size);
-out_free_sg:
-	sg_free_table(&sgt);
-out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size, NULL);
-out_free_pages:
-	__iommu_dma_free_pages(pages, count);
+	__iommu_dma_unmap(dev, *dma_handle, size);
+	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
 	return NULL;
 }
 
-- 
2.29.2

