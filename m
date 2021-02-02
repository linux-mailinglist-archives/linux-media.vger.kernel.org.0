Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5357D30BB7C
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhBBJxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhBBJw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:57 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299B4C06178A;
        Tue,  2 Feb 2021 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=1V/H+mhD3tcZ52EzqPv1oWFhuvy8mDMctNaFk3Uutdw=; b=gGLVzoVsVpQF946JOL/QCPFHJJ
        P6cyFN8qSNoSjsA6F5aRwdB+GLJ2vH/wtkakDEp24xS4Uwf2koPsHiathaxKdiW3D5CJadk4FwdZS
        T4Se8WfT0ZFWzmuIjESOxVtyJNWVtLNtmkleqSQamPvc0a7/1JC44VbG1maSq0WjR0sktj2kEnAfU
        1MYpLKVAENwq4Irw50ZuwtPtZc3vtez7C5E9xocfeTcbdFYrf9VsuhQA0MSE4W21bVsP31ODFAJ2M
        awVKW/C8GmxlcWQsX1A7yhB3C5kq7yxcuqi5up8kOgt0nbpFdnwQVZax2+j74iZ7Uv8G8iprQ89pS
        EQXwku4w==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sLL-00F0xY-4H; Tue, 02 Feb 2021 09:51:32 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Date:   Tue,  2 Feb 2021 10:51:09 +0100
Message-Id: <20210202095110.1215346-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202095110.1215346-1-hch@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for allocating a non-contiguous DMA region.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 85cb004d7a44c6..4e0b170d38d57a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -718,6 +718,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 		goto out_free_sg;
 
 	sgt->sgl->dma_address = iova;
+	sgt->sgl->dma_length = size;
 	return pages;
 
 out_free_sg:
@@ -755,6 +756,36 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
+#ifdef CONFIG_DMA_REMAP
+static struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, enum dma_data_direction dir, gfp_t gfp)
+{
+	struct dma_sgt_handle *sh;
+
+	sh = kmalloc(sizeof(*sh), gfp);
+	if (!sh)
+		return NULL;
+
+	sh->pages = __iommu_dma_alloc_noncontiguous(dev, size, &sh->sgt, gfp,
+						    PAGE_KERNEL, 0);
+	if (!sh->pages) {
+		kfree(sh);
+		return NULL;
+	}
+	return &sh->sgt;
+}
+
+static void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
+		struct sg_table *sgt, enum dma_data_direction dir)
+{
+	struct dma_sgt_handle *sh = sgt_handle(sgt);
+
+	__iommu_dma_unmap(dev, sgt->sgl->dma_address, size);
+	__iommu_dma_free_pages(sh->pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
+	sg_free_table(&sh->sgt);
+}
+#endif /* CONFIG_DMA_REMAP */
+
 static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
@@ -1270,6 +1301,10 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
+#ifdef CONFIG_DMA_REMAP
+	.alloc_noncontiguous	= iommu_dma_alloc_noncontiguous,
+	.free_noncontiguous	= iommu_dma_free_noncontiguous,
+#endif
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
-- 
2.29.2

