Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A45B327A40
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhCAI6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhCAI4D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 03:56:03 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773A0C061788;
        Mon,  1 Mar 2021 00:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=FpiyQH/WZsneXAYudL4P437T+laVaJ1w/DKPG1+Xs5M=; b=knEBVjSJ6l72ReR9UB3FsNA6Qa
        WEIhkOFFDmsvaRLMNiUoiQCu11eTBvxaWZRnD3KGRsnqQDR82Ts1jcNN7dpkPuXE0twmcRr20npyU
        ut3zAR45gcey0R7fAHp5aMIIA2rD+zdT8uyZuhcP8Ni8Zcb/gvBOfomMJdJjA9HD8bfW2uL6l0x6V
        GlYvqeYXyHav7NIaElgDSh/Eg9Pjs6lRBO4600cTM9oePUHgwub232EwQNH7xeRFr7w5Cx+gcVIj6
        8SbPTHMXXkFR3UJqaC4zxL/UFeus3e9F0IPAZ1di4q9L9lILrP4FJWIEcrQivZSEex76JQHc524Cm
        N85UdDUw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGeKM-00FVT4-3x; Mon, 01 Mar 2021 08:54:55 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/6] dma-iommu: implement ->alloc_noncontiguous
Date:   Mon,  1 Mar 2021 09:52:35 +0100
Message-Id: <20210301085236.947011-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301085236.947011-1-hch@lst.de>
References: <20210301085236.947011-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for allocating a non-contiguous DMA region.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/iommu/dma-iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b4d7bfffb3a0d2..714fa930d7b576 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -707,6 +707,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
 		goto out_free_sg;
 
 	sgt->sgl->dma_address = iova;
+	sgt->sgl->dma_length = size;
 	return pages;
 
 out_free_sg:
@@ -744,6 +745,37 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
+#ifdef CONFIG_DMA_REMAP
+static struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, enum dma_data_direction dir, gfp_t gfp,
+		unsigned long attrs)
+{
+	struct dma_sgt_handle *sh;
+
+	sh = kmalloc(sizeof(*sh), gfp);
+	if (!sh)
+		return NULL;
+
+	sh->pages = __iommu_dma_alloc_noncontiguous(dev, size, &sh->sgt, gfp,
+						    PAGE_KERNEL, attrs);
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
@@ -1260,6 +1292,10 @@ static const struct dma_map_ops iommu_dma_ops = {
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

