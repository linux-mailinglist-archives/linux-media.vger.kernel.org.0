Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F089307927
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhA1PI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhA1PEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:04:09 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27095C0613D6;
        Thu, 28 Jan 2021 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=cIjGfj/0IkRJnCPUNruB8yMn7Dfos9+ew+ApRFTnAaE=; b=cMcZha9a7Tc5H7FLA33aF2nen4
        zgwqORAfabshN4PyK8RH8iyJ6SR/niayy7D7laiePNpoABZitbvVZlkZ2wKMbfG8KR98FGhZd0n0d
        QxGIbo4LV6UGqSVnUCG7eZiKyxXeQC3UDJUGHrcL4gTtVv1x/ozMn5JBDdMZYlWlq8VsUqs8R3HP/
        Huxf3AanZ4Rx05o2gcCtxomFTPqRwS0sLE6DvOJWaCUSISVb0O3Y+4ERWjlZ+s/SO/58y/WZSmWDT
        egffgc5v5lqUUf1dCEkvNircudx+wbd6R5iRn+8a0tZZPVhc0cROL42QuDr6edM9xQ1PeceSZ+5qH
        xFjNfU1g==;
Received: from [2001:4bb8:18c:25a3:5b32:95f:aa1f:ea4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l58pG-008bLB-Pa; Thu, 28 Jan 2021 15:03:15 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/6] dma-iommu: refactor iommu_dma_alloc_remap
Date:   Thu, 28 Jan 2021 15:58:35 +0100
Message-Id: <20210128145837.2250561-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128145837.2250561-1-hch@lst.de>
References: <20210128145837.2250561-1-hch@lst.de>
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
 drivers/iommu/dma-iommu.c | 66 +++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 255533faf90599..65af875ba8495c 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -661,24 +661,13 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
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
-		unsigned long attrs)
+static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, struct sg_table *sgt, dma_addr_t *dma_handle,
+		gfp_t gfp, pgprot_t prot, unsigned long attrs)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -687,9 +676,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
 	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
 	struct page **pages;
-	struct sg_table sgt;
 	dma_addr_t iova;
-	void *vaddr;
 
 	*dma_handle = DMA_MAPPING_ERROR;
 
@@ -717,34 +704,26 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
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
 
-	vaddr = dma_common_pages_remap(pages, size, prot,
-			__builtin_return_address(0));
-	if (!vaddr)
-		goto out_unmap;
-
 	*dma_handle = iova;
-	sg_free_table(&sgt);
-	return vaddr;
+	return pages;
 
-out_unmap:
-	__iommu_dma_unmap(dev, iova, size);
 out_free_sg:
-	sg_free_table(&sgt);
+	sg_free_table(sgt);
 out_free_iova:
 	iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_pages:
@@ -752,6 +731,31 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
+static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+		unsigned long attrs)
+{
+	struct page **pages;
+	struct sg_table sgt;
+	void *vaddr;
+
+	pages = __iommu_dma_alloc_noncontiguous(dev, size, &sgt, dma_handle,
+						gfp, prot, attrs);
+	if (!pages)
+		return NULL;
+	sg_free_table(&sgt);
+	vaddr = dma_common_pages_remap(pages, size, prot,
+			__builtin_return_address(0));
+	if (!vaddr)
+		goto out_unmap;
+	return vaddr;
+
+out_unmap:
+	__iommu_dma_unmap(dev, *dma_handle, size);
+	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
+	return NULL;
+}
+
 static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
-- 
2.29.2

