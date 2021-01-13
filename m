Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A637F2F4119
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 02:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbhAMBWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 20:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhAMBWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 20:22:36 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558DAC061786;
        Tue, 12 Jan 2021 17:21:56 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id z21so420057pgj.4;
        Tue, 12 Jan 2021 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eZjjOD1PAmLkt+KYwX6n9LE4b54UBbbygpUxkzT+or8=;
        b=XZyicf8PriLrAcopwo6UoBZ2+lhcEdn784PDfMi7NUgzyI7I+N5SgMly//qSIv4VBp
         VTDA8AnIMjYGYG41U1kxbk6y7LqEEGj/wvRjrRF+VLOtCww1qfCyWBcXzMXC22ch+pFq
         LULPifbEKlfFp0HwQfIL6TIyV9fjG3N0AbMjAyGr7rATTImzgVddblFTy+wWiFhxitf4
         oc/nsHoi+BCOaqcD55v+0n116cokVDpgdnFJ4YaHYdTIUjf5YGBEu24LTdsJIyFAsWP1
         nDrIc777QjgBIPMiHPtrsjoMj6PH7/PVUVKUCsrFDt9+ixraYJFBcYRxXyy9vmcZMa0e
         N4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eZjjOD1PAmLkt+KYwX6n9LE4b54UBbbygpUxkzT+or8=;
        b=AtpdU99R4TqkyRRQ5nirLTAWHXM6dsDQ0AAVFABBVog/AZQAHjN+H0iHwQhxD7NtRt
         c9V5dj4i+T20i4Bqkh+xPYsg19lFdp51Ut/IszGvr2ihNGTYQZeWd1UfsI4dGSYiU7dN
         MVOJ6lNK2og7EoS66FVZHJ+GSUbcI+KQYXleYfCzDY1h7FPBwI4MTtOXzp1Ut3uAdd3w
         ebig7cCW/aEy2sC3ED0Iuq+iTEZI+qucOji/1OFhac5YwFlDuD6HdUEevsy3cbAkitCo
         fNuE8PPOHFKhZU9xhN8+DrUEGQEdRyjxVcH9Nl8K++ghU/PIa9rgbpKKclArNSkGaL0m
         i3VA==
X-Gm-Message-State: AOAM531doNQOHzrvY0a2vgBkjYMHkfaZHDfFSWw4AkFDQMVRQzw8v4zt
        GOBVI0djB47CC6PWrse+J2o=
X-Google-Smtp-Source: ABdhPJwSdhqG2rRLgSIEqNF8bNii9Cb2Adz5+g/DkcL3+NdOF69XsrCwlWHeitqR7tDvSm7XLb21yQ==
X-Received: by 2002:a63:286:: with SMTP id 128mr1849593pgc.246.1610500915906;
        Tue, 12 Jan 2021 17:21:55 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id b2sm355197pff.79.2021.01.12.17.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 17:21:54 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v3 1/4] mm: cma: introduce gfp flag in cma_alloc instead of no_warn
Date:   Tue, 12 Jan 2021 17:21:40 -0800
Message-Id: <20210113012143.1201105-2-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113012143.1201105-1-minchan@kernel.org>
References: <20210113012143.1201105-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The upcoming patch will introduce __GFP_NORETRY semantic
in alloc_contig_range which is a failfast mode of the API.
Instead of adding a additional parameter for gfp, replace
no_warn with gfp flag.

To keep old behaviors, it follows the rule below.

  no_warn 			gfp_flags

  false         		GFP_KERNEL
  true          		GFP_KERNEL|__GFP_NOWARN
  gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c |  2 +-
 drivers/s390/char/vmcp.c         |  2 +-
 include/linux/cma.h              |  2 +-
 kernel/dma/contiguous.c          |  3 ++-
 mm/cma.c                         | 12 ++++++------
 mm/cma_debug.c                   |  2 +-
 mm/hugetlb.c                     |  6 ++++--
 mm/secretmem.c                   |  3 ++-
 8 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 364fc2f3e499..0afc1907887a 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -298,7 +298,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
 
-	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
+	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, GFP_KERNEL);
 	if (!cma_pages)
 		goto free_buffer;
 
diff --git a/drivers/s390/char/vmcp.c b/drivers/s390/char/vmcp.c
index 9e066281e2d0..78f9adf56456 100644
--- a/drivers/s390/char/vmcp.c
+++ b/drivers/s390/char/vmcp.c
@@ -70,7 +70,7 @@ static void vmcp_response_alloc(struct vmcp_session *session)
 	 * anymore the system won't work anyway.
 	 */
 	if (order > 2)
-		page = cma_alloc(vmcp_cma, nr_pages, 0, false);
+		page = cma_alloc(vmcp_cma, nr_pages, 0, GFP_KERNEL);
 	if (page) {
 		session->response = (char *)page_to_phys(page);
 		session->cma_alloc = 1;
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 217999c8a762..d6c02d08ddbc 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -45,7 +45,7 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					const char *name,
 					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
-			      bool no_warn);
+			      gfp_t gfp_mask);
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 3d63d91cba5c..552ed531c018 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -260,7 +260,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
 
-	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
+	return cma_alloc(dev_get_cma_area(dev), count, align, GFP_KERNEL |
+			(no_warn ? __GFP_NOWARN : 0));
 }
 
 /**
diff --git a/mm/cma.c b/mm/cma.c
index 0ba69cd16aeb..35053b82aedc 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
  * @cma:   Contiguous memory region for which the allocation is performed.
  * @count: Requested number of pages.
  * @align: Requested alignment of pages (in PAGE_SIZE order).
- * @no_warn: Avoid printing message about failed allocation
+ * @gfp_mask: GFP mask to use during during the cma allocation.
  *
  * This function allocates part of contiguous memory on specific
  * contiguous memory area.
  */
 struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
-		       bool no_warn)
+		       gfp_t gfp_mask)
 {
 	unsigned long mask, offset;
 	unsigned long pfn = -1;
@@ -438,8 +438,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	if (!cma || !cma->count || !cma->bitmap)
 		return NULL;
 
-	pr_debug("%s(cma %p, count %zu, align %d)\n", __func__, (void *)cma,
-		 count, align);
+	pr_debug("%s(cma %p, count %zu, align %d gfp_mask 0x%x)\n", __func__,
+			(void *)cma, count, align, gfp_mask);
 
 	if (!count)
 		return NULL;
@@ -471,7 +471,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 
 		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
 		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
-				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
+						gfp_mask);
 
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
@@ -500,7 +500,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 			page_kasan_tag_reset(page + i);
 	}
 
-	if (ret && !no_warn) {
+	if (ret && !(gfp_mask & __GFP_NOWARN)) {
 		pr_err("%s: alloc failed, req-size: %zu pages, ret: %d\n",
 			__func__, count, ret);
 		cma_debug_show_areas(cma);
diff --git a/mm/cma_debug.c b/mm/cma_debug.c
index d5bf8aa34fdc..00170c41cf81 100644
--- a/mm/cma_debug.c
+++ b/mm/cma_debug.c
@@ -137,7 +137,7 @@ static int cma_alloc_mem(struct cma *cma, int count)
 	if (!mem)
 		return -ENOMEM;
 
-	p = cma_alloc(cma, count, 0, false);
+	p = cma_alloc(cma, count, 0, GFP_KERNEL);
 	if (!p) {
 		kfree(mem);
 		return -ENOMEM;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 737b2dce19e6..695af33aa66c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1266,7 +1266,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 
 		if (hugetlb_cma[nid]) {
 			page = cma_alloc(hugetlb_cma[nid], nr_pages,
-					huge_page_order(h), true);
+					huge_page_order(h),
+					GFP_KERNEL | __GFP_NOWARN);
 			if (page)
 				return page;
 		}
@@ -1277,7 +1278,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 					continue;
 
 				page = cma_alloc(hugetlb_cma[node], nr_pages,
-						huge_page_order(h), true);
+						huge_page_order(h),
+						GFP_KERNEL | __GFP_NOWARN);
 				if (page)
 					return page;
 			}
diff --git a/mm/secretmem.c b/mm/secretmem.c
index b8a32954ac68..585d55b9f9d8 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -86,7 +86,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	struct page *page;
 	int err;
 
-	page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE, gfp & __GFP_NOWARN);
+	page = cma_alloc(secretmem_cma, nr_pages, PMD_SIZE,
+				GFP_KERNEL | (gfp & __GFP_NOWARN));
 	if (!page)
 		return -ENOMEM;
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

