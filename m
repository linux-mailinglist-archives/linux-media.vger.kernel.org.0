Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BB42FF49A
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 20:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbhAUTdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 14:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAUSvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 13:51:10 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A694C06174A;
        Thu, 21 Jan 2021 10:50:16 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y8so1785564plp.8;
        Thu, 21 Jan 2021 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gzk23zajungTlCb2zZF+0WgvgyrDA4yvKtkR1qaP/Ig=;
        b=Xz6NOONbGpI8fy5u2HmJJVGmoZPbRnH3JHmvd32Iazx7o2poDKrgDud7nprz+i6zb4
         gRb16/Lo/qfJSmsY7xJJs8GT7ShWs6jdrgITMD6D6z9c8Yn1Ha0p8wwLv3biS7XNyk2q
         +ps7du1yQH91OFksV2ICbUastQTLzsKVvMGd/cakBDrwigciJ7PzpoI6Bhtv9TyiQdsI
         C1uHS1Iom5uhlDufTxww+wdIfw2c47UAzSSToKlOYnsaxUwYNcBhlK3Z5wV57jPoV0mO
         aEkINUonChkxshGiEagNTQ1sq1zntzaPRQIbUfZzdaSiFBzDjBnr+0drncwamQMYFRSz
         DTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Gzk23zajungTlCb2zZF+0WgvgyrDA4yvKtkR1qaP/Ig=;
        b=R5QDWwevHVk4E41f6mPKyBTpaAEiIHzVDwPnVNcc9ui6BR77i/eRKB+E3FNqAbJKqk
         2H4lNxr5YCfiUNv9ma1NNk5R4TOknJt7DBz8JC44j20xvyugaaxPh4WoNK8lNvWDND+t
         QWzknwWHrDTyGFpAUOp5kLcnQj3J2MBEus0rZ6EmNjsK92kizWsDKJH6b7m/ZwtNonzi
         8NLqcbFtkL8J/V3VGRzG01EbwqIaxeSqLiY+CypGafRqU8u4n8aEZz6rkTg58jd73lrx
         7PAsHq6mGQDlwBRG+UgBKR5BFKBVs1bxr0EnmklQ1feVpRIBjcuQLG3w1fHJ7hrXvn8T
         bLXw==
X-Gm-Message-State: AOAM5332B3O7AO0rjEA04tzexcpiGisI7Ys+NaU2AVnR5FKkFT4uU2hV
        psA0WLzjPfOINpPoKMIrMOg=
X-Google-Smtp-Source: ABdhPJyfH862LfwsBBPrzhoeOlf41yFFc4kB5MAcVlKsh2VxeTXSxBN2yqWWIhsFKo0Q9csPN8kefQ==
X-Received: by 2002:a17:90a:5303:: with SMTP id x3mr891727pjh.54.1611255015949;
        Thu, 21 Jan 2021 10:50:15 -0800 (PST)
Received: from google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id x19sm6440436pfp.207.2021.01.21.10.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:50:15 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 21 Jan 2021 10:50:12 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 1/4] mm: cma: introduce gfp flag in cma_alloc instead
 of no_warn
Message-ID: <YAnM5PbNJZlk//iX@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-2-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 21, 2021 at 09:54:59AM -0800, Minchan Kim wrote:
> The upcoming patch will introduce __GFP_NORETRY semantic
> in alloc_contig_range which is a failfast mode of the API.
> Instead of adding a additional parameter for gfp, replace
> no_warn with gfp flag.
> 
> To keep old behaviors, it follows the rule below.
> 
>   no_warn 			gfp_flags
> 
>   false         		GFP_KERNEL
>   true          		GFP_KERNEL|__GFP_NOWARN
>   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>

Found one missing piece : cma_alloc_alinged

Resend with fixing


From 54f5de059636d2178bf5f716239a4a1ea9cbdc52 Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Mon, 21 Dec 2020 17:55:37 -0800
Subject: [PATCH v4 1/4] mm: cma: introduce gfp flag in cma_alloc instead

The upcoming patch will introduce __GFP_NORETRY semantic
in alloc_contig_range which is a failfast mode of the API.
Instead of adding a additional parameter for gfp, replace
no_warn with gfp flag.

To keep old behaviors, it follows the rule below.

  no_warn 			gfp_flags

  false         		GFP_KERNEL
  true          		GFP_KERNEL|__GFP_NOWARN
  gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c |  2 +-
 drivers/s390/char/vmcp.c         |  2 +-
 include/linux/cma.h              |  2 +-
 kernel/dma/contiguous.c          |  6 ++++--
 mm/cma.c                         | 12 ++++++------
 mm/cma_debug.c                   |  2 +-
 mm/hugetlb.c                     |  6 ++++--
 mm/secretmem.c                   |  3 ++-
 8 files changed, 20 insertions(+), 15 deletions(-)

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
index 3d63d91cba5c..f5a6fcaa9876 100644
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
@@ -283,7 +284,8 @@ static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
 {
 	unsigned int align = min(get_order(size), CONFIG_CMA_ALIGNMENT);
 
-	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp & __GFP_NOWARN);
+	return cma_alloc(cma, size >> PAGE_SHIFT, align,
+				GFP_KERNEL | (gfp & __GFP_NOWARN));
 }
 
 /**
diff --git a/mm/cma.c b/mm/cma.c
index 0ba69cd16aeb..d50627686fec 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
  * @cma:   Contiguous memory region for which the allocation is performed.
  * @count: Requested number of pages.
  * @align: Requested alignment of pages (in PAGE_SIZE order).
- * @no_warn: Avoid printing message about failed allocation
+ * @gfp_mask: GFP mask to use during the cma allocation.
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
index a6bad1f686c5..4209a2ed1e1b 100644
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
2.30.0.296.g2bfb1c46d8-goog


