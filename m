Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A382CAA30
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbgLARwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbgLARwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 12:52:35 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA8DC0613D6;
        Tue,  1 Dec 2020 09:51:54 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id l23so1713895pjg.1;
        Tue, 01 Dec 2020 09:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3unagI/0BHWWOJ0Y3ZMT8ueBfxzXn5Uqgna//GYokw0=;
        b=R4GNhwPXvS4+cNCeRN1dv7JxUb9I1Xr8kcTRAhooqHbaqiif7YhXhajWTvdI1bItVr
         9EhXS+9mVcK/+IIF+OLKihL9ScqcKINVXIyFoMRLWlMx5VkkFtXOukjtNPi5LRbUzec0
         1Ijtk3xneiQU1naVixqxALzGEIZmsgRz0jwFIJS18pCABVCyIYxzC3IH9SSfAIJT6Gjj
         Du1fi4KZ6+7bF4ui/kseRcYfYCh7mJbDNsFTT1pEA/Fc+bJG9uVjLvsydb4BIbDWjgD9
         GYGhOUL0FMsV63SmaQ8LRL4VMj013WFbEHns+2i0DijVR14UyJ7ItCmlT53wPDzsjLvk
         MVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3unagI/0BHWWOJ0Y3ZMT8ueBfxzXn5Uqgna//GYokw0=;
        b=XRXuXZFnU+/4LMCg9lEPQRPsVSJ6FZ52a+ZMF7RZMudHnlHmU8bba0ggyVleDVXwti
         z5XJfXcJxpLk3VBFtqnIi7Ig49yqsfCTeiwv3FveAdD2gHwjeRJ/Kp2JLu6lSdwDkN30
         S3LHyXXrILWBvc7W9xksspU2NsTPP6kfMuNJWhr4t3Xba+vHYrtuNXseXH4MmYESsr/n
         xzV4AkmGSotGk9aWggKMa9stK3RNz3va3ozEG4dBm+hA/LhTkwobDLrE6vY8CaUpdQfH
         fD6w/ZEWEraDk80yxRSYVAGqPkVOl6UzYXveNuNtFUM9k5I+g5m5kNjnhuXHQ1JHSBeT
         IXNA==
X-Gm-Message-State: AOAM533O7gzTQE33poARr9E8o1AtWWTOql+5Uao3opHEEDRg9yEWkON6
        WfmBP6NVA8meE8uObAfIvfw=
X-Google-Smtp-Source: ABdhPJxqGmkYiOGzCY2ozTIIBsCp1TH4bT3wdVU7dS7WQ+pQKlms2XBDjLXG6YKwvQKLj7CUH27h/Q==
X-Received: by 2002:a17:902:b905:b029:d8:ad03:8c93 with SMTP id bf5-20020a170902b905b02900d8ad038c93mr3958549plb.15.1606845114421;
        Tue, 01 Dec 2020 09:51:54 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id q23sm390082pfg.192.2020.12.01.09.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:51:53 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
Date:   Tue,  1 Dec 2020 09:51:42 -0800
Message-Id: <20201201175144.3996569-3-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201201175144.3996569-1-minchan@kernel.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a need for special HW to require bulk allocation of
high-order pages. For example, 4800 * order-4 pages, which
would be minimum, sometimes, it requires more.

To meet the requirement, a option reserves 300M CMA area and
requests the whole 300M contiguous memory. However, it doesn't
work if even one of those pages in the range is long-term pinned
directly or indirectly. The other option is to ask higher-order
size (e.g., 2M) than requested order(64K) repeatedly until driver
could gather necessary amount of memory. Basically, this approach
makes the allocation very slow due to cma_alloc's function
slowness and it could be stuck on one of the pageblocks if it
encounters unmigratable page.

To solve the issue, this patch introduces cma_alloc_bulk.

	int cma_alloc_bulk(struct cma *cma, unsigned int align,
		bool fast, unsigned int order, size_t nr_requests,
		struct page **page_array, size_t *nr_allocated);

Most parameters are same with cma_alloc but it additionally passes
vector array to store allocated memory. What's different with cma_alloc
is it will skip pageblocks without waiting/stopping if it has unmovable
page so that API continues to scan other pageblocks to find requested
order page.

cma_alloc_bulk is best effort approach in that it skips some pageblocks
if they have unmovable pages unlike cma_alloc. It doesn't need to be
perfect from the beginning at the cost of performance. Thus, the API
takes "bool fast parameter" which is propagated into alloc_contig_range to
avoid significat overhead functions to inrecase CMA allocation success
ratio(e.g., migration retrial, PCP, LRU draining per pageblock)
at the cost of less allocation success ratio. If the caller couldn't
allocate enough, they could call it with "false" to increase success ratio
if they are okay to expense the overhead for the success ratio.

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 include/linux/cma.h |   5 ++
 include/linux/gfp.h |   2 +
 mm/cma.c            | 126 ++++++++++++++++++++++++++++++++++++++++++--
 mm/page_alloc.c     |  19 ++++---
 4 files changed, 140 insertions(+), 12 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 217999c8a762..7375d3131804 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -46,6 +46,11 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 			      bool no_warn);
+
+extern int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
+			unsigned int order, size_t nr_requests,
+			struct page **page_array, size_t *nr_allocated);
+
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index ad5872699692..75bfb673d75b 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -627,6 +627,8 @@ static inline bool pm_suspended_storage(void)
 enum alloc_contig_mode {
 	/* try several ways to increase success ratio of memory allocation */
 	ALLOC_CONTIG_NORMAL,
+	/* avoid costly functions to make the call fast */
+	ALLOC_CONTIG_FAST,
 };
 
 /* The below functions must be run on a range from a single zone. */
diff --git a/mm/cma.c b/mm/cma.c
index 8010c1ba04b0..4459045fa717 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -32,6 +32,7 @@
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
+#include <linux/swap.h>
 #include <trace/events/cma.h>
 
 #include "cma.h"
@@ -397,6 +398,14 @@ static void cma_debug_show_areas(struct cma *cma)
 static inline void cma_debug_show_areas(struct cma *cma) { }
 #endif
 
+static void reset_page_kasan_tag(struct page *page, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		page_kasan_tag_reset(page + i);
+}
+
 /**
  * cma_alloc() - allocate pages from contiguous area
  * @cma:   Contiguous memory region for which the allocation is performed.
@@ -414,7 +423,6 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	unsigned long pfn = -1;
 	unsigned long start = 0;
 	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
-	size_t i;
 	struct page *page = NULL;
 	int ret = -ENOMEM;
 
@@ -479,10 +487,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	 * blocks being marked with different tags. Reset the tags to ignore
 	 * those page blocks.
 	 */
-	if (page) {
-		for (i = 0; i < count; i++)
-			page_kasan_tag_reset(page + i);
-	}
+	if (page)
+		reset_page_kasan_tag(page, count);
 
 	if (ret && !no_warn) {
 		pr_err("%s: alloc failed, req-size: %zu pages, ret: %d\n",
@@ -494,6 +500,116 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	return page;
 }
 
+/*
+ * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
+ * 		best effort. It will usually be used for private @cma
+ *
+ * @cma:	contiguous memory region for which the allocation is performed.
+ * @align:	requested alignment of pages (in PAGE_SIZE order).
+ * @fast:	will skip costly opeartions if it's true.
+ * @order:	requested page order
+ * @nr_requests: the number of 2^order pages requested to be allocated as input,
+ * @page_array:	page_array pointer to store allocated pages (must have space
+ *		for at least nr_requests)
+ * @nr_allocated: the number of 2^order pages allocated as output
+ *
+ * This function tries to allocate up to @nr_requests @order pages on specific
+ * contiguous memory area. If @fast has true, it will avoid costly functions
+ * to increase allocation success ratio so it will be faster but might return
+ * less than requested number of pages. User could retry it with true if it is
+ * needed.
+ *
+ * Return: it will return 0 only if all pages requested by @nr_requestsed are
+ * allocated. Otherwise, it returns negative error code.
+ *
+ * Note: Regardless of success/failure, user should check @nr_allocated to see
+ * how many @order pages are allocated and free those pages when they are not
+ * needed.
+ */
+int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
+			unsigned int order, size_t nr_requests,
+			struct page **page_array, size_t *nr_allocated)
+{
+	int ret = 0;
+	size_t i = 0;
+	unsigned long nr_pages_needed = nr_requests * (1 << order);
+	unsigned long nr_chunk_pages, nr_pages;
+	unsigned long mask, offset;
+	unsigned long pfn = -1;
+	unsigned long start = 0;
+	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
+	struct page *page = NULL;
+	enum alloc_contig_mode mode = fast ? ALLOC_CONTIG_FAST :
+						ALLOC_CONTIG_NORMAL;
+	*nr_allocated = 0;
+	if (!cma || !cma->count || !cma->bitmap || !page_array)
+		return -EINVAL;
+
+	if (!nr_pages_needed)
+		return 0;
+
+	nr_chunk_pages = 1 << max_t(unsigned int, order, pageblock_order);
+
+	mask = cma_bitmap_aligned_mask(cma, align);
+	offset = cma_bitmap_aligned_offset(cma, align);
+	bitmap_maxno = cma_bitmap_maxno(cma);
+
+	lru_add_drain_all();
+	drain_all_pages(NULL);
+
+	while (nr_pages_needed) {
+		nr_pages = min(nr_chunk_pages, nr_pages_needed);
+
+		bitmap_count = cma_bitmap_pages_to_bits(cma, nr_pages);
+		mutex_lock(&cma->lock);
+		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
+				bitmap_maxno, start, bitmap_count, mask,
+				offset);
+		if (bitmap_no >= bitmap_maxno) {
+			mutex_unlock(&cma->lock);
+			break;
+		}
+		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
+		/*
+		 * It's safe to drop the lock here. If the migration fails
+		 * cma_clear_bitmap will take the lock again and unmark it.
+		 */
+		mutex_unlock(&cma->lock);
+
+		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
+		ret = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_CMA,
+						GFP_KERNEL|__GFP_NOWARN, mode);
+		if (ret) {
+			cma_clear_bitmap(cma, pfn, nr_pages);
+			if (ret != -EBUSY)
+				break;
+
+			/* continue to search next block */
+			start = (pfn + nr_pages - cma->base_pfn) >>
+						cma->order_per_bit;
+			continue;
+		}
+
+		page = pfn_to_page(pfn);
+		while (nr_pages) {
+			page_array[i++] = page;
+			reset_page_kasan_tag(page, 1 << order);
+			page += 1 << order;
+			nr_pages -= 1 << order;
+			nr_pages_needed -= 1 << order;
+		}
+
+		start = bitmap_no + bitmap_count;
+	}
+
+	*nr_allocated = i;
+
+	if (!ret && nr_pages_needed)
+		ret = -EBUSY;
+
+	return ret;
+}
+
 /**
  * cma_release() - release allocated pages
  * @cma:   Contiguous memory region for which the allocation is performed.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index adfbfd95fbc3..2a1799ff14fc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8463,7 +8463,8 @@ static unsigned long pfn_max_align_up(unsigned long pfn)
 
 /* [start, end) must belong to a single zone. */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end)
+					unsigned long start, unsigned long end,
+					unsigned int max_tries)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -8491,7 +8492,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 				break;
 			}
 			tries = 0;
-		} else if (++tries == 5) {
+		} else if (++tries == max_tries) {
 			ret = ret < 0 ? ret : -EBUSY;
 			break;
 		}
@@ -8553,6 +8554,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	unsigned long outer_start, outer_end;
 	unsigned int order;
 	int ret = 0;
+	bool fast_mode = mode == ALLOC_CONTIG_FAST;
 
 	struct compact_control cc = {
 		.nr_migratepages = 0,
@@ -8595,7 +8597,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	if (ret)
 		return ret;
 
-	drain_all_pages(cc.zone);
+	if (!fast_mode)
+		drain_all_pages(cc.zone);
 
 	/*
 	 * In case of -EBUSY, we'd like to know which page causes problem.
@@ -8607,7 +8610,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end);
+	ret = __alloc_contig_migrate_range(&cc, start, end, fast_mode ? 1 : 5);
 	if (ret && ret != -EBUSY)
 		goto done;
 	ret =0;
@@ -8629,7 +8632,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	 * isolated thus they won't get removed from buddy.
 	 */
 
-	lru_add_drain_all();
+	if (!fast_mode)
+		lru_add_drain_all();
 
 	order = 0;
 	outer_start = start;
@@ -8656,8 +8660,9 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 
 	/* Make sure the range is really isolated. */
 	if (test_pages_isolated(outer_start, end, 0)) {
-		pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
-			__func__, outer_start, end);
+		if (!fast_mode)
+			pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
+				__func__, outer_start, end);
 		ret = -EBUSY;
 		goto done;
 	}
-- 
2.29.2.454.gaff20da3a2-goog

