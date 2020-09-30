Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C67127EE7B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731101AbgI3QJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731074AbgI3QJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241E9C0613D0;
        Wed, 30 Sep 2020 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=jLVH2ETUcna4vnSJJM6qywpgQCBtyE661AcFkWsPNQc=; b=P3xuRpLpWkE6u3BGD3WvuVniKG
        aCLFBV/3BO8MRlfymLp6EYoYWaJKOi3sDy8xSAcdLIQon++6H2oEFkBJl22oNVEG5rJXr5NabZFML
        LSxzhjXq9CzGRjzdKjCMmbnQsoq7H4C1AQYThJOjWCPwVE/W7YOgEiYUk7jb8QDaxiKmM4pkI2JDN
        gVlveu0fpxAFqCweZzvqmpgA0yGT3KP+lz0wbFbyVAFtoLHlFRxa6v7SF8bV4FVGvXeEawkjaI1r0
        uCQy4mWJlE9d4k6Lv/wNJMHdNhtEyW9NBA1XvdjHzweDMC+sFSChe+gxXfai2OeNX9yi2YKN07Ea5
        qVyfOXGQ==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefb-0003E1-2j; Wed, 30 Sep 2020 16:09:31 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 7/8] dma-iommu: remove __iommu_dma_mmap
Date:   Wed, 30 Sep 2020 18:09:16 +0200
Message-Id: <20200930160917.1234225-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function has a single caller, so open code it there and take
advantage of the precalculated page count variable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b363b20a9f41ce..7922f545cd5eef 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -656,21 +656,6 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
-/**
- * __iommu_dma_mmap - Map a buffer into provided user VMA
- * @pages: Array representing buffer from __iommu_dma_alloc()
- * @size: Size of buffer in bytes
- * @vma: VMA describing requested userspace mapping
- *
- * Maps the pages of the buffer in @pages into @vma. The caller is responsible
- * for verifying the correct size and protection of @vma beforehand.
- */
-static int __iommu_dma_mmap(struct page **pages, size_t size,
-		struct vm_area_struct *vma)
-{
-	return vm_map_pages(vma, pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
-}
-
 static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
@@ -1075,7 +1060,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		struct page **pages = dma_common_find_pages(cpu_addr);
 
 		if (pages)
-			return __iommu_dma_mmap(pages, size, vma);
+			return vm_map_pages(vma, pages, nr_pages);
 		pfn = vmalloc_to_pfn(cpu_addr);
 	} else {
 		pfn = page_to_pfn(virt_to_page(cpu_addr));
-- 
2.28.0

