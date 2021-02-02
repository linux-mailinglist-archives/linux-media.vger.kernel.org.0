Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307B630BB80
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhBBJwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhBBJwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0213AC0613ED;
        Tue,  2 Feb 2021 01:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=wktlSKmgQbwwiYv5D/Zo0pNnWDNYO3mB3BRFoRHQVPA=; b=D5EUYpPnPco6p0ayBhZ3pYAuHz
        OuIgzSI+/OZkEnlL1svJxf1/VsNHiNRlfx47TqLezZRKB0GOgS6Jsp3mZEc8F1+RaPI+sCjqp+jC2
        sYwWZphpF6IvHkwyotBy38DRpDL9msuNQr+CsY7YvycLHjBhv0kEc0hZ+e6zBWy9NktjTmleQf7fC
        cZeXV2BMF7qflg3trCHYQy7j+uDPdF3UnWfB5Foh1BQYhI+JoMaI5Twtro+FWBAShJujR0nEL8BDH
        bSFeYR50AWdL4Qr78WpLBjTreNk57RxUDRO3BQWOHlxKHW0wHorKyWpGNxneFPD1UYEAa2/K6vPCi
        oAfgsQtQ==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sLC-00F0wZ-UQ; Tue, 02 Feb 2021 09:51:23 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/7] dma-mapping: refactor dma_{alloc,free}_pages
Date:   Tue,  2 Feb 2021 10:51:06 +0100
Message-Id: <20210202095110.1215346-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202095110.1215346-1-hch@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
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
---
 kernel/dma/mapping.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index c1e515496c067b..5e87dac6cc6d9a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -475,11 +475,10 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
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
@@ -488,31 +487,41 @@ struct page *dma_alloc_pages(struct device *dev, size_t size,
 
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

