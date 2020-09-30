Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87DC27EE81
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbgI3QJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731070AbgI3QJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6182AC061755;
        Wed, 30 Sep 2020 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=eMHlDyqZ7dNED/B7sCe7wssLaO5nPO2N0j7Z8xnh0T8=; b=s2TCGGUph5wbFGk6APK4eVyxPI
        b75XFkAr8c4FUXo56lmvDS6fzxJHtxrgluvuCv9ic/aZiV7umcHegVS1VySMrPR3A7YwHCNYd6/S2
        NEcXghBLnPS2UEH764m6Dgm6ERRJNWsuKNCmHwAf4tpO0f8uzl6SOZCnGu61Xzt/AaP65YcB46lss
        LXHerOe19sJmWoO0p8Se7OuR2I0FNTht2nYyQioGQAnmngX5flFWTLkLZ+vlp8amYTtPHgFwVN703
        EbrIANXyAk4xNp294lO8yPpa+5EiQycfInum0VYWfcRTKbaywSD4yzA8YQgKfCUuCeTe0v8KEOjNr
        2InOnBNw==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefZ-0003Dp-7t; Wed, 30 Sep 2020 16:09:30 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 6/8] dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING handling
Date:   Wed, 30 Sep 2020 18:09:15 +0200
Message-Id: <20200930160917.1234225-7-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use and entirely separate code path for the DMA_ATTR_NO_KERNEL_MAPPING
path.  This avoids any confusion about the ret type, and avoids lots of
attr checks and helpers that can be significantly simplified now.

It also ensures that common handling is applied to architetures still
using the arch alloc/free hooks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-noncoherent.h |  13 -----
 kernel/dma/direct.c             | 100 +++++++++++++-------------------
 2 files changed, 39 insertions(+), 74 deletions(-)

diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index e61283e06576a8..73ac149fa181b4 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -21,19 +21,6 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_COHERENCE_H */
 
-/*
- * Check if an allocation needs to be marked uncached to be coherent.
- */
-static __always_inline bool dma_alloc_need_uncached(struct device *dev,
-		unsigned long attrs)
-{
-	if (dev_is_dma_coherent(dev))
-		return false;
-	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
-		return false;
-	return true;
-}
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index ace9159c992f65..a3c619b424edf0 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -75,39 +75,6 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 		min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
 }
 
-/*
- * Decrypting memory is allowed to block, so if this device requires
- * unencrypted memory it must come from atomic pools.
- */
-static inline bool dma_should_alloc_from_pool(struct device *dev, gfp_t gfp,
-					      unsigned long attrs)
-{
-	if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
-		return false;
-	if (gfpflags_allow_blocking(gfp))
-		return false;
-	if (force_dma_unencrypted(dev))
-		return true;
-	if (!IS_ENABLED(CONFIG_DMA_DIRECT_REMAP))
-		return false;
-	if (dma_alloc_need_uncached(dev, attrs))
-		return true;
-	return false;
-}
-
-static inline bool dma_should_free_from_pool(struct device *dev,
-					     unsigned long attrs)
-{
-	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
-		return true;
-	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev))
-		return false;
-	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP))
-		return true;
-	return false;
-}
-
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		gfp_t gfp)
 {
@@ -170,35 +137,45 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	void *ret;
 	int err;
 
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs))
-		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
-
 	size = PAGE_ALIGN(size);
 	if (attrs & DMA_ATTR_NO_WARN)
 		gfp |= __GFP_NOWARN;
 
-	if (dma_should_alloc_from_pool(dev, gfp, attrs))
-		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
-
-	/* we always manually zero the memory once we are done */
-	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
-	if (!page)
-		return NULL;
-
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
 	    !force_dma_unencrypted(dev)) {
+		page = __dma_direct_alloc_pages(dev, size, gfp);
+		if (!page)
+			return NULL;
 		/* remove any dirty cache lines on the kernel alias */
 		if (!PageHighMem(page))
 			arch_dma_prep_coherent(page, size);
+		*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 		/* return the page pointer as the opaque cookie */
-		ret = page;
-		goto done;
+		return page;
 	}
 
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    !dev_is_dma_coherent(dev))
+		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
+
+	/*
+	 * Remapping or decrypting memory may block. If either is required and
+	 * we can't block, allocate the memory from the atomic pools.
+	 */
+	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
+	    !gfpflags_allow_blocking(gfp) &&
+	    (force_dma_unencrypted(dev) ||
+	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
+		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
+
+	/* we always manually zero the memory once we are done */
+	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
+	if (!page)
+		return NULL;
+
 	if ((IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	     dma_alloc_need_uncached(dev, attrs)) ||
+	     !dev_is_dma_coherent(dev)) ||
 	    (IS_ENABLED(CONFIG_DMA_REMAP) && PageHighMem(page))) {
 		/* remove any dirty cache lines on the kernel alias */
 		arch_dma_prep_coherent(page, size);
@@ -241,7 +218,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	memset(ret, 0, size);
 
 	if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    dma_alloc_need_uncached(dev, attrs)) {
+	    !dev_is_dma_coherent(dev)) {
 		arch_dma_prep_coherent(page, size);
 		ret = arch_dma_set_uncached(ret, size);
 		if (IS_ERR(ret))
@@ -269,25 +246,25 @@ void dma_direct_free(struct device *dev, size_t size,
 {
 	unsigned int page_order = get_order(size);
 
+	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
+	    !force_dma_unencrypted(dev)) {
+		/* cpu_addr is a struct page cookie, not a kernel address */
+		dma_free_contiguous(dev, cpu_addr, size);
+		return;
+	}
+
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
 	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs)) {
+	    !dev_is_dma_coherent(dev)) {
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
 		return;
 	}
 
 	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
-	if (dma_should_free_from_pool(dev, attrs) &&
+	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
 		return;
 
-	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
-		/* cpu_addr is a struct page cookie, not a kernel address */
-		dma_free_contiguous(dev, cpu_addr, size);
-		return;
-	}
-
 	if (force_dma_unencrypted(dev))
 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
 
@@ -304,7 +281,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 {
 	struct page *page;
 
-	if (dma_should_alloc_from_pool(dev, gfp, 0))
+	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
+	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	page = __dma_direct_alloc_pages(dev, size, gfp | __GFP_ZERO);
@@ -341,7 +319,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	void *vaddr = page_address(page);
 
 	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
-	if (dma_should_free_from_pool(dev, 0) &&
+	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    dma_free_from_pool(dev, vaddr, size))
 		return;
 
-- 
2.28.0

