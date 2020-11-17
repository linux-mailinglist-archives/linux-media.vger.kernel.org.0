Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EEE2B6D1C
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 19:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730631AbgKQSTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 13:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgKQSTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 13:19:47 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63BCC0613CF;
        Tue, 17 Nov 2020 10:19:47 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id g19so735683pji.0;
        Tue, 17 Nov 2020 10:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uO92xm4brn088z6K9xBnUjWL7itcyhZywUJ7fkQYnbM=;
        b=s9QJls1aFG3b2axzdWJTySxrbU5RCDggFiYqqnDrKYf55uoQZJ84JM0n5LuPLuqHcm
         /2BszNJ18ae6K41NDFmYrHNDQrlFDJe1oP8lNGlTCAiR/RanEdmCO/0saauqeEaXmJpL
         LF/QD7C0+68iFFGK1cH8fq66X20MouhRrFNksWik1JG7Rl9/UpZZvRxeRN7VpSgntFG1
         XqoVkVpnyGRktgpOWrqr2LDIDfoKKF3HV/J37uWtwf/18CTvxcvZsPxQZ2LaCx2Ab8NP
         GBLjxPfx7dL2vEOgj//mmaGlARIZsuy4Bp8lf7a4OdiXlEC27haVhSUlHX5V8DKrj7oz
         YRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uO92xm4brn088z6K9xBnUjWL7itcyhZywUJ7fkQYnbM=;
        b=IQ3MpSZsWOASG54XMIX0GUsZ4Rn3UE1zjQWdPEfd7d/2fpB7W78E+JiV41JwTQ5paE
         59idhp5f9xnPd7swdAVSLDjOLAVhOzkfnmgz09xk866H6Uc8v/QjiqU+T6X1K12lrBcH
         OAUYzAYIcIwPMlOmU83Pdz/lMfusBFOoEHGX9KyeB7YY5sJCoF69el8KMsx4po253izQ
         OZSZgquCSFtsJ+Zmgk2CVlbHxEyyDB0lYJifJ4mqGGBCmqOr8SVGNZ/u6lKGR5fkN2Ek
         95SzHA5t7RFWL5MVR9EFAHK55U135ivmxALYiit5BNLS0OekvHAYxmJFsbU7kzGvBvRM
         JxJA==
X-Gm-Message-State: AOAM532xAgKB96q4r5qvxCgaXsCish1g/vkIgFDVo+FurlsG8SUjwFVA
        ybRyTB6i26duTTitLoK58k4=
X-Google-Smtp-Source: ABdhPJwl624GAicF93kl7dieILZKed9/4fkBOAIWrqBdo2yU9vIljUIivWAYDtC8ft2w2WeeIrwmpw==
X-Received: by 2002:a17:902:8d95:b029:d8:c2ee:7dc with SMTP id v21-20020a1709028d95b02900d8c2ee07dcmr822221plo.57.1605637187208;
        Tue, 17 Nov 2020 10:19:47 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id h8sm4302639pjc.54.2020.11.17.10.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 10:19:45 -0800 (PST)
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
Subject: [PATCH 1/4] mm: introduce cma_alloc_bulk API
Date:   Tue, 17 Nov 2020 10:19:32 -0800
Message-Id: <20201117181935.3613581-2-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201117181935.3613581-1-minchan@kernel.org>
References: <20201117181935.3613581-1-minchan@kernel.org>
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
		gfp_t gfp_mask, unsigned int order, size_t nr_requests,
		struct page **page_array, size_t *nr_allocated);

Most parameters are same with cma_alloc but it additionally passes
vector array to store allocated memory. What's different with cma_alloc
is it will skip pageblocks without waiting/stopping if it has unmovable
page so that API continues to scan other pageblocks to find requested
order page.

cma_alloc_bulk is best effort approach in that it skips some pageblocks
if they have unmovable pages unlike cma_alloc. It doesn't need to be
perfect from the beginning at the cost of performance. Thus, the API
takes gfp_t to support __GFP_NORETRY which is propagated into
alloc_contig_page to avoid significat overhead functions to inrecase
CMA allocation success ratio(e.g., migration retrial, PCP, LRU draining
per pageblock) at the cost of less allocation success ratio.
If the caller couldn't allocate enough pages with __GFP_NORETRY, they
could call it without __GFP_NORETRY to increase success ratio this time
if they are okay to expense the overhead for the success ratio.

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 include/linux/cma.h            |   5 ++
 include/linux/page-isolation.h |   1 +
 mm/cma.c                       | 126 +++++++++++++++++++++++++++++++--
 mm/page_alloc.c                |  19 +++--
 mm/page_isolation.c            |   3 +-
 5 files changed, 141 insertions(+), 13 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 217999c8a762..2fc8d2b7cf99 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -46,6 +46,11 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 			      bool no_warn);
+
+extern int cma_alloc_bulk(struct cma *cma, unsigned int align, gfp_t gfp_mask,
+			unsigned int order, size_t nr_requests,
+			struct page **page_array, size_t *nr_allocated);
+
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 572458016331..0e105dce2a15 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -32,6 +32,7 @@ static inline bool is_migrate_isolate(int migratetype)
 
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
+#define SKIP_PCP_DRAIN	0x4
 
 struct page *has_unmovable_pages(struct zone *zone, struct page *page,
 				 int migratetype, int flags);
diff --git a/mm/cma.c b/mm/cma.c
index 3692a34e2353..7c11ec2dc04c 100644
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
 
@@ -478,10 +486,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
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
@@ -493,6 +499,116 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 	return page;
 }
 
+/*
+ * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
+ * 		best effort. It will usually be used for private @cma
+ *
+ * @cma:	contiguous memory region for which the allocation is performed.
+ * @align:	requested alignment of pages (in PAGE_SIZE order).
+ * @gfp_mask:	memory allocation flags
+ * @order:	requested page order
+ * @nr_requests: the number of 2^order pages requested to be allocated as input,
+ * @page_array:	page_array pointer to store allocated pages (must have space
+ *		for at least nr_requests)
+ * @nr_allocated: the number of 2^order pages allocated as output
+ *
+ * This function tries to allocate up to @nr_requests @order pages on specific
+ * contiguous memory area. If @gfp_mask has __GFP_NORETRY, it will avoid costly
+ * functions to increase allocation success ratio so it will be fast but might
+ * return less than requested number of pages. User could retry with
+ * !__GFP_NORETRY if it is needed.
+ *
+ * Return: it will return 0 only if all pages requested by @nr_requestsed are
+ * allocated. Otherwise, it returns negative error code.
+ *
+ * Note: Regardless of success/failure, user should check @nr_allocated to see
+ * how many @order pages are allocated and free those pages when they are not
+ * needed.
+ */
+int cma_alloc_bulk(struct cma *cma, unsigned int align, gfp_t gfp_mask,
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
+	gfp_t gfp = GFP_KERNEL|__GFP_NOWARN|gfp_mask;
+
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
+		ret = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_CMA, gfp);
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
+EXPORT_SYMBOL_GPL(cma_alloc_bulk);
+
 /**
  * cma_release() - release allocated pages
  * @cma:   Contiguous memory region for which the allocation is performed.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f84b7eea39ec..097cc83097bb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8404,7 +8404,8 @@ static unsigned long pfn_max_align_up(unsigned long pfn)
 
 /* [start, end) must belong to a single zone. */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-					unsigned long start, unsigned long end)
+					unsigned long start, unsigned long end,
+					unsigned int max_tries)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -8432,7 +8433,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 				break;
 			}
 			tries = 0;
-		} else if (++tries == 5) {
+		} else if (++tries == max_tries) {
 			ret = ret < 0 ? ret : -EBUSY;
 			break;
 		}
@@ -8478,6 +8479,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	unsigned long outer_start, outer_end;
 	unsigned int order;
 	int ret = 0;
+	bool no_retry = gfp_mask & __GFP_NORETRY;
 
 	struct compact_control cc = {
 		.nr_migratepages = 0,
@@ -8516,7 +8518,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	 */
 
 	ret = start_isolate_page_range(pfn_max_align_down(start),
-				       pfn_max_align_up(end), migratetype, 0);
+				       pfn_max_align_up(end), migratetype,
+				       no_retry ?  SKIP_PCP_DRAIN : 0);
 	if (ret)
 		return ret;
 
@@ -8530,7 +8533,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end);
+	ret = __alloc_contig_migrate_range(&cc, start, end, no_retry ? 1 : 5);
 	if (ret && ret != -EBUSY)
 		goto done;
 	ret =0;
@@ -8552,7 +8555,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	 * isolated thus they won't get removed from buddy.
 	 */
 
-	lru_add_drain_all();
+	if (!no_retry)
+		lru_add_drain_all();
 
 	order = 0;
 	outer_start = start;
@@ -8579,8 +8583,9 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 
 	/* Make sure the range is really isolated. */
 	if (test_pages_isolated(outer_start, end, 0)) {
-		pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
-			__func__, outer_start, end);
+		if (!no_retry)
+			pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
+				__func__, outer_start, end);
 		ret = -EBUSY;
 		goto done;
 	}
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index abbf42214485..31b1dcc1a395 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -49,7 +49,8 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 
 		__mod_zone_freepage_state(zone, -nr_pages, mt);
 		spin_unlock_irqrestore(&zone->lock, flags);
-		drain_all_pages(zone);
+		if (!(isol_flags & SKIP_PCP_DRAIN))
+			drain_all_pages(zone);
 		return 0;
 	}
 
-- 
2.29.2.299.gdc1121823c-goog

