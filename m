Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1F2FF2A6
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 19:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389319AbhAUR7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389053AbhAURzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:55:51 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BA4C061756;
        Thu, 21 Jan 2021 09:55:11 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id 31so1686590plb.10;
        Thu, 21 Jan 2021 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5aQuxt1nZst2lLKkiFlWOAqj/tVkXqtYs356x95d5f0=;
        b=FKdfqGEX6B9MgedVW8r+6/43MRAQYZp3W6O+lYUOhIWcHvMRfGHmJxoN9lBT8g64hG
         xEoIwo264ZbNkC9mApttjnw+IyU4VnDVgkmVVlbEltjJ4DkdE1g6HkjdL9moCRGKgFW4
         f0lgOkk2ME5EEXtyG1rq6DQV9WzXsT3U/skp0pYkIDhXAIn5n0b2JnlX4nKoAN1/3R5Z
         heTu/JHH4VvqGNK2HWJUiYLqnAvHNRZTS6sYGx8x/oeVEfALUxzgSOGxG5K9q9j+C1Y9
         k9VlO9x9K5HSo3j4ZRCoi1kDdHZSJVfZ6vsDaRE427BihHUZHnA00HfDLqr8JxY5IquS
         TizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5aQuxt1nZst2lLKkiFlWOAqj/tVkXqtYs356x95d5f0=;
        b=dBpT3nVzyvrImp77tuCzcJT5NSakTuGpXhv8umUgqt6BgQo8FyLHQRxTiY6mtejKAb
         xxGi4bFqEyT2KK2IJwv30aJd8O7Pbj/mqECm32AIQdaiRpMD/zbP++JPKTjacNkmwzax
         18Q5rbmGJiomDTQRTX7S9m32J/Gu8bunfiF5Xr7+BjOt6UzcIov4pWtAvDNXYgcpMxCt
         Bc3uAY6zrL5x2wxGoIJEK9Vn7W8rgDNAfgUlytMb0noD6980ijeoIxmjhZQVpx/WCvcm
         g3h7wKkVQZm1htqUCRZarIIy+kWoiV5kWHodL+4nDUpWdtBmERrP47BW3m/oobhg7aYa
         Vf+Q==
X-Gm-Message-State: AOAM531/ymwuNwuBDT93qRv3KJMwzdACPZSkodNl5oilboUFxVgY7Dah
        0X9qPW8z68JnpxwTUAtpQ/M=
X-Google-Smtp-Source: ABdhPJz84d4NP4LNFL0MoEneIS25lKrepaWWshMn2GI68bIrXjZpBav7A7tXuDrjAGcsuJdMwCVHDQ==
X-Received: by 2002:a17:902:edc7:b029:de:6cde:8cfd with SMTP id q7-20020a170902edc7b02900de6cde8cfdmr812671plk.59.1611251710651;
        Thu, 21 Jan 2021 09:55:10 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id t2sm6897317pju.19.2021.01.21.09.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:55:09 -0800 (PST)
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
Subject: [PATCH v4 1/4] mm: cma: introduce gfp flag in cma_alloc instead of no_warn
Date:   Thu, 21 Jan 2021 09:54:59 -0800
Message-Id: <20210121175502.274391-2-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121175502.274391-1-minchan@kernel.org>
References: <20210121175502.274391-1-minchan@kernel.org>
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

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
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

