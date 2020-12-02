Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6A42CC182
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgLBQAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgLBQAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 11:00:48 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78E0C0613CF;
        Wed,  2 Dec 2020 08:00:08 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id s2so1352509plr.9;
        Wed, 02 Dec 2020 08:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4wvJY0ceR2B5UdJClCOU3JhrZbvLi4FuJydYjR1OPeg=;
        b=Tql7AYTxyO9D+3/RxMXuEk+uCBlZNPYu3EF/ymHtKR/7PJxEbXR0Rq/KV/Ar/XVaXB
         AskXb+/ZrN3PYwVSBpEv0nX4UOpVGhe7IpEV4LE9WzjF/t3p2ckqMNlg4m9iqhhLRwk/
         urAWCGJy2VZdCcguWNP13oUAIIXJezVikTk/vazIwlW79QMuE9IIhqKBSHgBBa9QLPUr
         swAUx8Dxlpu/CsvPFk3NqbGvPDso7wphBItX7FoXFP4elyjDr+a46kwv1RDo2l3Iu4Cf
         UqQfkLyS0qp1HBfGaEU7aKQdAxDtZFMsn+DdoFAhSRR9BTX68xPAAT2Hu9RuHo95OJS4
         Eo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4wvJY0ceR2B5UdJClCOU3JhrZbvLi4FuJydYjR1OPeg=;
        b=YXc4bDUOPIIcHU4sJExF/xhtc0ZMZN1tR0sidPiFDDQDMhRZW1XQHsQr/xG23nwWz5
         Z6S/fZdaCbRNCfb7x86j22B/bJfZu3veWaizfl5YFNsdzljQCTLrFvuP3U5ZZuO6l6gW
         wdMWh8wGtiBr2kH6AR6txlzDhohU6Uhl4wfuJNXVE81h24XSVgqmCEGPdaeADkGHo9bC
         Rw5i6eZ41ICfLZOR88HGbjxwt4tkE+3g395Oj4sOLlnuqRWPJPVnKDfqFFuoPI01QurR
         dLfgMDCUIPknBYd9PrHyjXd1PlfWLjp/KU4fXl0HokMvEKDvaUQI75L/UtSHLr9TQQx3
         Mv4A==
X-Gm-Message-State: AOAM532rx1wU2dk3ZjW+a8LuUG0oM5vUEhr5Dw63/UlvFqXF1A2h38uE
        nwKW5oN2yxsv13CNY3itUWo=
X-Google-Smtp-Source: ABdhPJz7kE5yohR09U95c89F4wV3m2YN7c/QDfr6kCXgV7mlDk4hOCkXXqL4G2HLXLSMArvzJkFVTw==
X-Received: by 2002:a17:902:9b85:b029:da:1684:cc82 with SMTP id y5-20020a1709029b85b02900da1684cc82mr3148845plp.41.1606924808017;
        Wed, 02 Dec 2020 08:00:08 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id z65sm259371pfz.126.2020.12.02.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:00:06 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 2 Dec 2020 08:00:04 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, hyesoo.yu@samsung.com,
        willy@infradead.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
Message-ID: <X8e6BCAwhd4xw9ri@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 10:14:41AM +0100, David Hildenbrand wrote:
> On 01.12.20 18:51, Minchan Kim wrote:
> > There is a need for special HW to require bulk allocation of
> > high-order pages. For example, 4800 * order-4 pages, which
> > would be minimum, sometimes, it requires more.
> > 
> > To meet the requirement, a option reserves 300M CMA area and
> > requests the whole 300M contiguous memory. However, it doesn't
> > work if even one of those pages in the range is long-term pinned
> > directly or indirectly. The other option is to ask higher-order
> 
> My latest knowledge is that pages in the CMA area are never long term
> pinned.
> 
> https://lore.kernel.org/lkml/20201123090129.GD27488@dhcp22.suse.cz/
> 
> "gup already tries to deal with long term pins on CMA regions and migrate
> to a non CMA region. Have a look at __gup_longterm_locked."
> 
> We should rather identify ways how that is still possible and get rid of
> them.
> 
> 
> Now, short-term pinnings and PCP are other issues where
> alloc_contig_range() could be improved (e.g., in contrast to a FAST
> mode, a HARD mode which temporarily disables the PCP, ...).

GUP is just one of cases to make CMA failure directly but there are still
bunch of cases indirectly - make short-term pin to long-term by several
reasons (CPU scheduling/IO scheduling/memory pressure/locking dependency)

In the end, they would be finally released but is much unreliable/slow so
idea just skip the page and continue to search the other pages in CMA
area because what we needed is just severl high-order pages, not that
big 300M chunk.

> 
> > size (e.g., 2M) than requested order(64K) repeatedly until driver
> > could gather necessary amount of memory. Basically, this approach
> > makes the allocation very slow due to cma_alloc's function
> > slowness and it could be stuck on one of the pageblocks if it
> > encounters unmigratable page.
> > 
> > To solve the issue, this patch introduces cma_alloc_bulk.
> > 
> > 	int cma_alloc_bulk(struct cma *cma, unsigned int align,
> > 		bool fast, unsigned int order, size_t nr_requests,
> > 		struct page **page_array, size_t *nr_allocated);
> > 
> > Most parameters are same with cma_alloc but it additionally passes
> > vector array to store allocated memory. What's different with cma_alloc
> > is it will skip pageblocks without waiting/stopping if it has unmovable
> > page so that API continues to scan other pageblocks to find requested
> > order page.
> > 
> > cma_alloc_bulk is best effort approach in that it skips some pageblocks
> > if they have unmovable pages unlike cma_alloc. It doesn't need to be
> > perfect from the beginning at the cost of performance. Thus, the API
> > takes "bool fast parameter" which is propagated into alloc_contig_range to
> > avoid significat overhead functions to inrecase CMA allocation success
> > ratio(e.g., migration retrial, PCP, LRU draining per pageblock)
> > at the cost of less allocation success ratio. If the caller couldn't
> > allocate enough, they could call it with "false" to increase success ratio
> > if they are okay to expense the overhead for the success ratio.
> 
> Just so I understand what the idea is:
> 
> alloc_contig_range() sometimes fails on CMA regions when trying to
> allocate big chunks (e.g., 300M). Instead of tackling that issue, you
> rather allocate plenty of small chunks, and make these small allocations
> fail faster/ make the allocations less reliable. Correct?

Please look at above.

> 
> I don't really have a strong opinion on that. Giving up fast rather than
> trying for longer sounds like a useful thing to have - but I wonder if
> it's strictly necessary for the use case you describe.
> 
> I'd like to hear Michals opinion on that.
> 
> > 
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  include/linux/cma.h |   5 ++
> >  include/linux/gfp.h |   2 +
> >  mm/cma.c            | 126 ++++++++++++++++++++++++++++++++++++++++++--
> >  mm/page_alloc.c     |  19 ++++---
> >  4 files changed, 140 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/cma.h b/include/linux/cma.h
> > index 217999c8a762..7375d3131804 100644
> > --- a/include/linux/cma.h
> > +++ b/include/linux/cma.h
> > @@ -46,6 +46,11 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
> >  					struct cma **res_cma);
> >  extern struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> >  			      bool no_warn);
> > +
> > +extern int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
> > +			unsigned int order, size_t nr_requests,
> > +			struct page **page_array, size_t *nr_allocated);
> > +
> >  extern bool cma_release(struct cma *cma, const struct page *pages, unsigned int count);
> >  
> >  extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
> > diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> > index ad5872699692..75bfb673d75b 100644
> > --- a/include/linux/gfp.h
> > +++ b/include/linux/gfp.h
> > @@ -627,6 +627,8 @@ static inline bool pm_suspended_storage(void)
> >  enum alloc_contig_mode {
> >  	/* try several ways to increase success ratio of memory allocation */
> >  	ALLOC_CONTIG_NORMAL,
> > +	/* avoid costly functions to make the call fast */
> > +	ALLOC_CONTIG_FAST,
> >  };
> >  
> >  /* The below functions must be run on a range from a single zone. */
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 8010c1ba04b0..4459045fa717 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/highmem.h>
> >  #include <linux/io.h>
> >  #include <linux/kmemleak.h>
> > +#include <linux/swap.h>
> >  #include <trace/events/cma.h>
> >  
> >  #include "cma.h"
> > @@ -397,6 +398,14 @@ static void cma_debug_show_areas(struct cma *cma)
> >  static inline void cma_debug_show_areas(struct cma *cma) { }
> >  #endif
> >  
> > +static void reset_page_kasan_tag(struct page *page, int count)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < count; i++)
> > +		page_kasan_tag_reset(page + i);
> > +}
> > +
> >  /**
> >   * cma_alloc() - allocate pages from contiguous area
> >   * @cma:   Contiguous memory region for which the allocation is performed.
> > @@ -414,7 +423,6 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> >  	unsigned long pfn = -1;
> >  	unsigned long start = 0;
> >  	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
> > -	size_t i;
> >  	struct page *page = NULL;
> >  	int ret = -ENOMEM;
> >  
> > @@ -479,10 +487,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> >  	 * blocks being marked with different tags. Reset the tags to ignore
> >  	 * those page blocks.
> >  	 */
> > -	if (page) {
> > -		for (i = 0; i < count; i++)
> > -			page_kasan_tag_reset(page + i);
> > -	}
> > +	if (page)
> > +		reset_page_kasan_tag(page, count);
> >  
> >  	if (ret && !no_warn) {
> >  		pr_err("%s: alloc failed, req-size: %zu pages, ret: %d\n",
> > @@ -494,6 +500,116 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
> >  	return page;
> >  }
> >  
> > +/*
> > + * cma_alloc_bulk() - allocate high order bulk pages from contiguous area with
> > + * 		best effort. It will usually be used for private @cma
> > + *
> > + * @cma:	contiguous memory region for which the allocation is performed.
> > + * @align:	requested alignment of pages (in PAGE_SIZE order).
> > + * @fast:	will skip costly opeartions if it's true.
> > + * @order:	requested page order
> > + * @nr_requests: the number of 2^order pages requested to be allocated as input,
> > + * @page_array:	page_array pointer to store allocated pages (must have space
> > + *		for at least nr_requests)
> > + * @nr_allocated: the number of 2^order pages allocated as output
> > + *
> > + * This function tries to allocate up to @nr_requests @order pages on specific
> > + * contiguous memory area. If @fast has true, it will avoid costly functions
> > + * to increase allocation success ratio so it will be faster but might return
> > + * less than requested number of pages. User could retry it with true if it is
> > + * needed.
> > + *
> > + * Return: it will return 0 only if all pages requested by @nr_requestsed are
> > + * allocated. Otherwise, it returns negative error code.
> > + *
> > + * Note: Regardless of success/failure, user should check @nr_allocated to see
> > + * how many @order pages are allocated and free those pages when they are not
> > + * needed.
> > + */
> > +int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
> > +			unsigned int order, size_t nr_requests,
> > +			struct page **page_array, size_t *nr_allocated)
> > +{
> > +	int ret = 0;
> > +	size_t i = 0;
> > +	unsigned long nr_pages_needed = nr_requests * (1 << order);
> > +	unsigned long nr_chunk_pages, nr_pages;
> > +	unsigned long mask, offset;
> > +	unsigned long pfn = -1;
> > +	unsigned long start = 0;
> > +	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
> > +	struct page *page = NULL;
> > +	enum alloc_contig_mode mode = fast ? ALLOC_CONTIG_FAST :
> > +						ALLOC_CONTIG_NORMAL;
> > +	*nr_allocated = 0;
> > +	if (!cma || !cma->count || !cma->bitmap || !page_array)
> > +		return -EINVAL;
> > +
> > +	if (!nr_pages_needed)
> > +		return 0;
> > +
> > +	nr_chunk_pages = 1 << max_t(unsigned int, order, pageblock_order);
> > +
> > +	mask = cma_bitmap_aligned_mask(cma, align);
> > +	offset = cma_bitmap_aligned_offset(cma, align);
> > +	bitmap_maxno = cma_bitmap_maxno(cma);
> > +
> > +	lru_add_drain_all();
> > +	drain_all_pages(NULL);
> > +
> > +	while (nr_pages_needed) {
> > +		nr_pages = min(nr_chunk_pages, nr_pages_needed);
> > +
> > +		bitmap_count = cma_bitmap_pages_to_bits(cma, nr_pages);
> > +		mutex_lock(&cma->lock);
> > +		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
> > +				bitmap_maxno, start, bitmap_count, mask,
> > +				offset);
> > +		if (bitmap_no >= bitmap_maxno) {
> > +			mutex_unlock(&cma->lock);
> > +			break;
> > +		}
> > +		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
> > +		/*
> > +		 * It's safe to drop the lock here. If the migration fails
> > +		 * cma_clear_bitmap will take the lock again and unmark it.
> > +		 */
> > +		mutex_unlock(&cma->lock);
> > +
> > +		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
> > +		ret = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_CMA,
> > +						GFP_KERNEL|__GFP_NOWARN, mode);
> > +		if (ret) {
> > +			cma_clear_bitmap(cma, pfn, nr_pages);
> > +			if (ret != -EBUSY)
> > +				break;
> > +
> > +			/* continue to search next block */
> > +			start = (pfn + nr_pages - cma->base_pfn) >>
> > +						cma->order_per_bit;
> > +			continue;
> > +		}
> > +
> > +		page = pfn_to_page(pfn);
> > +		while (nr_pages) {
> > +			page_array[i++] = page;
> > +			reset_page_kasan_tag(page, 1 << order);
> > +			page += 1 << order;
> > +			nr_pages -= 1 << order;
> > +			nr_pages_needed -= 1 << order;
> > +		}
> > +
> > +		start = bitmap_no + bitmap_count;
> > +	}
> > +
> > +	*nr_allocated = i;
> > +
> > +	if (!ret && nr_pages_needed)
> > +		ret = -EBUSY;
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * cma_release() - release allocated pages
> >   * @cma:   Contiguous memory region for which the allocation is performed.
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index adfbfd95fbc3..2a1799ff14fc 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -8463,7 +8463,8 @@ static unsigned long pfn_max_align_up(unsigned long pfn)
> >  
> >  /* [start, end) must belong to a single zone. */
> >  static int __alloc_contig_migrate_range(struct compact_control *cc,
> > -					unsigned long start, unsigned long end)
> > +					unsigned long start, unsigned long end,
> > +					unsigned int max_tries)
> >  {
> >  	/* This function is based on compact_zone() from compaction.c. */
> >  	unsigned int nr_reclaimed;
> > @@ -8491,7 +8492,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
> >  				break;
> >  			}
> >  			tries = 0;
> > -		} else if (++tries == 5) {
> > +		} else if (++tries == max_tries) {
> >  			ret = ret < 0 ? ret : -EBUSY;
> >  			break;
> >  		}
> > @@ -8553,6 +8554,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  	unsigned long outer_start, outer_end;
> >  	unsigned int order;
> >  	int ret = 0;
> > +	bool fast_mode = mode == ALLOC_CONTIG_FAST;
> >  
> >  	struct compact_control cc = {
> >  		.nr_migratepages = 0,
> > @@ -8595,7 +8597,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  	if (ret)
> >  		return ret;
> >  
> > -	drain_all_pages(cc.zone);
> > +	if (!fast_mode)
> > +		drain_all_pages(cc.zone);
> >  
> >  	/*
> >  	 * In case of -EBUSY, we'd like to know which page causes problem.
> > @@ -8607,7 +8610,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  	 * allocated.  So, if we fall through be sure to clear ret so that
> >  	 * -EBUSY is not accidentally used or returned to caller.
> >  	 */
> > -	ret = __alloc_contig_migrate_range(&cc, start, end);
> > +	ret = __alloc_contig_migrate_range(&cc, start, end, fast_mode ? 1 : 5);
> >  	if (ret && ret != -EBUSY)
> >  		goto done;
> >  	ret =0;
> > @@ -8629,7 +8632,8 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  	 * isolated thus they won't get removed from buddy.
> >  	 */
> >  
> > -	lru_add_drain_all();
> > +	if (!fast_mode)
> > +		lru_add_drain_all();
> >  
> >  	order = 0;
> >  	outer_start = start;
> > @@ -8656,8 +8660,9 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  
> >  	/* Make sure the range is really isolated. */
> >  	if (test_pages_isolated(outer_start, end, 0)) {
> > -		pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
> > -			__func__, outer_start, end);
> > +		if (!fast_mode)
> > +			pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
> > +				__func__, outer_start, end);
> >  		ret = -EBUSY;
> >  		goto done;
> >  	}
> > 
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
