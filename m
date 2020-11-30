Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DCB2C828B
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgK3KsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbgK3KsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:48:18 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D24DC0613D3
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:47:38 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id f190so21320176wme.1
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEyLf8LFch+KdsSp/Rnz95CvSLqxxYSUroQ+WOd06N4=;
        b=mxZ+YVshPN8IDgC+Xd8VJSuhvuW+B1Vq1vEOVvhr69IYB6IWocC1WMBCPpZXbtWMu+
         c7toL4IxZDaEPMYXB6KuB1ZZHDPxgCxu/yMOhnV0L+cWMh1gK4hhLBZ3/rGsqxxIrR6y
         qFEqeGNKNm1kApxx2viLIZDmnm5XkEF2f7jxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEyLf8LFch+KdsSp/Rnz95CvSLqxxYSUroQ+WOd06N4=;
        b=B7WDW4Oqqpq46MvA0oQuliAYnY3QWXGQ6s/O2s6fp8oKBlwTdpCQe91qXu4cuPd0Ka
         4pHjMKrS0YL2StaMm2fuHsZTig1v9AXwerbxQVGX+DPxYYOpM0klv/rgMsHlrULJP4/f
         qOOXPgJILVfgWPU49awRfb1RejwWMp+/XdKUgVLYeUNT+fwzQxvCgN1gcj0+vJk20IEC
         ad3ARokKbLFTBoKcCj//FFC0+5JoWc7j46VRIlw7plLOc+25dAQzUJUrZbn4p0/hlyeS
         /LFbKqztGpTiO0F9O6wJdamlPLaqTLRO1rwFiLcOIH6dXU1Wrc0DYXDfgPCKPYlQiD9U
         iANw==
X-Gm-Message-State: AOAM5332Tpx4pc3mU9HkFvmfJpNGqDw6fyQQZpAp/4QUJF5AXA8FEwV+
        z06qdS5P+TuCxh1MjvtVZGpOVQ==
X-Google-Smtp-Source: ABdhPJyNfDQBtBUjLYivTubWHNNG5AjYFEAOzzMzgG9ljqqSdjJuJrr5gIZKubHTvUAbSLegBzpGUA==
X-Received: by 2002:a1c:2d84:: with SMTP id t126mr22263460wmt.132.1606733256754;
        Mon, 30 Nov 2020 02:47:36 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id x9sm19719853wru.55.2020.11.30.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 02:47:36 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: [PATCH v4 1/4] dma-mapping: remove the {alloc,free}_noncoherent methods
Date:   Mon, 30 Nov 2020 11:47:27 +0100
Message-Id: <20201130104730.27655-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>

It turns out allowing non-contigous allocations here was a rather bad
idea, as we'll now need to define ways to get the pages for mmaping
or dma_buf sharing.  Revert this change and stick to the original
concept.  A different API for the use case of non-contigous allocations
will be added back later.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c   | 30 ------------------------------
 include/linux/dma-map-ops.h |  5 -----
 kernel/dma/mapping.c        | 33 ++++++---------------------------
 3 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0cbcd3fc3e7e..73249732afd3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1054,34 +1054,6 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	return cpu_addr;
 }
 
-#ifdef CONFIG_DMA_REMAP
-static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
-		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
-{
-	if (!gfpflags_allow_blocking(gfp)) {
-		struct page *page;
-
-		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
-		if (!page)
-			return NULL;
-		return page_address(page);
-	}
-
-	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
-				     PAGE_KERNEL, 0);
-}
-
-static void iommu_dma_free_noncoherent(struct device *dev, size_t size,
-		void *cpu_addr, dma_addr_t handle, enum dma_data_direction dir)
-{
-	__iommu_dma_unmap(dev, handle, size);
-	__iommu_dma_free(dev, size, cpu_addr);
-}
-#else
-#define iommu_dma_alloc_noncoherent		NULL
-#define iommu_dma_free_noncoherent		NULL
-#endif /* CONFIG_DMA_REMAP */
-
 static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
@@ -1152,8 +1124,6 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
-	.alloc_noncoherent	= iommu_dma_alloc_noncoherent,
-	.free_noncoherent	= iommu_dma_free_noncoherent,
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a5f89fc4d6df..3d1f91464bcf 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -22,11 +22,6 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
-	void *(*alloc_noncoherent)(struct device *dev, size_t size,
-			dma_addr_t *dma_handle, enum dma_data_direction dir,
-			gfp_t gfp);
-	void (*free_noncoherent)(struct device *dev, size_t size, void *vaddr,
-			dma_addr_t dma_handle, enum dma_data_direction dir);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 51bb8fa8eb89..d3032513c54b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -514,40 +514,19 @@ EXPORT_SYMBOL_GPL(dma_free_pages);
 void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-	void *vaddr;
-
-	if (!ops || !ops->alloc_noncoherent) {
-		struct page *page;
-
-		page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
-		if (!page)
-			return NULL;
-		return page_address(page);
-	}
+	struct page *page;
 
-	size = PAGE_ALIGN(size);
-	vaddr = ops->alloc_noncoherent(dev, size, dma_handle, dir, gfp);
-	if (vaddr)
-		debug_dma_map_page(dev, virt_to_page(vaddr), 0, size, dir,
-				   *dma_handle);
-	return vaddr;
+	page = dma_alloc_pages(dev, size, dma_handle, dir, gfp);
+	if (!page)
+		return NULL;
+	return page_address(page);
 }
 EXPORT_SYMBOL_GPL(dma_alloc_noncoherent);
 
 void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, enum dma_data_direction dir)
 {
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	if (!ops || !ops->free_noncoherent) {
-		dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
-		return;
-	}
-
-	size = PAGE_ALIGN(size);
-	debug_dma_unmap_page(dev, dma_handle, size, dir);
-	ops->free_noncoherent(dev, size, vaddr, dma_handle, dir);
+	dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
 }
 EXPORT_SYMBOL_GPL(dma_free_noncoherent);
 
-- 
2.29.2.454.gaff20da3a2-goog

