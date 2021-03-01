Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97756327A3A
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbhCAI6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbhCAIza (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 03:55:30 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115B7C061793;
        Mon,  1 Mar 2021 00:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=0YMbxEa6N5s2QU9ESiiWLGkb/6oBDFwOMT52+fJkZUE=; b=HSKv8Od4QBtXRXJSanG1u4PO9x
        OYRpBWMPz2nXT70Kq46B1tgAomgENrf0jl5ItJpdVj2v1gu7afijsHAFM181iYUchjH9S1Y7bvKkP
        4KGM94YtK3CUJTlEgDs5mjlt0JYDKHHobp9k9a2oStyvEvQfzl3IyJ5A4JUfzdz1ojtz9Nb4IGG/3
        gt90w2rj/iX8eFw9vbOAlF4dtvUgnkze6PnYZqNetBfivzgSmL+5eNnowzEPHb96Xi8Qz3QvNbwyM
        PhVcoyOASyYxNJTFJJMgj+2bVHOgGOt7G70L1pDEArYYhQaGPrDh/rVJCNGX0h2NUp440NVs/nGT8
        1CZrZN6g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGeIq-00FVGw-AN; Mon, 01 Mar 2021 08:53:37 +0000
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
Subject: [PATCH 2/6] dma-mapping: refactor dma_{alloc,free}_pages
Date:   Mon,  1 Mar 2021 09:52:32 +0100
Message-Id: <20210301085236.947011-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301085236.947011-1-hch@lst.de>
References: <20210301085236.947011-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Factour out internal versions without the dma_debug calls in preparation
for callers that will need different dma_debug calls.

Note that this changes the dma_debug calls to get the not page aligned
size values, but as long as alloc and free agree on one variant we are
fine.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
---
 kernel/dma/mapping.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9ce86c77651c6f..07f964ebcda15e 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -477,11 +477,10 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 }
 EXPORT_SYMBOL(dma_free_attrs);
 
-struct page *dma_alloc_pages(struct device *dev, size_t size,
+static struct page *__dma_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-	struct page *page;
 
 	if (WARN_ON_ONCE(!dev->coherent_dma_mask))
 		return NULL;
@@ -490,31 +489,41 @@ struct page *dma_alloc_pages(struct device *dev, size_t size,
 
 	size = PAGE_ALIGN(size);
 	if (dma_alloc_direct(dev, ops))
-		page = dma_direct_alloc_pages(dev, size, dma_handle, dir, gfp);
-	else if (ops->alloc_pages)
-		page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
-	else
+		return dma_direct_alloc_pages(dev, size, dma_handle, dir, gfp);
+	if (!ops->alloc_pages)
 		return NULL;
+	return ops->alloc_pages(dev, size, dma_handle, dir, gfp);
+}
 
-	debug_dma_map_page(dev, page, 0, size, dir, *dma_handle);
+struct page *dma_alloc_pages(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	struct page *page = __dma_alloc_pages(dev, size, dma_handle, dir, gfp);
 
+	if (page)
+		debug_dma_map_page(dev, page, 0, size, dir, *dma_handle);
 	return page;
 }
 EXPORT_SYMBOL_GPL(dma_alloc_pages);
 
-void dma_free_pages(struct device *dev, size_t size, struct page *page,
+static void __dma_free_pages(struct device *dev, size_t size, struct page *page,
 		dma_addr_t dma_handle, enum dma_data_direction dir)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	size = PAGE_ALIGN(size);
-	debug_dma_unmap_page(dev, dma_handle, size, dir);
-
 	if (dma_alloc_direct(dev, ops))
 		dma_direct_free_pages(dev, size, page, dma_handle, dir);
 	else if (ops->free_pages)
 		ops->free_pages(dev, size, page, dma_handle, dir);
 }
+
+void dma_free_pages(struct device *dev, size_t size, struct page *page,
+		dma_addr_t dma_handle, enum dma_data_direction dir)
+{
+	debug_dma_unmap_page(dev, dma_handle, size, dir);
+	__dma_free_pages(dev, size, page, dma_handle, dir);
+}
 EXPORT_SYMBOL_GPL(dma_free_pages);
 
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
-- 
2.29.2

