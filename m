Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B052C48E5
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 21:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgKYUNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 15:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgKYUNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 15:13:15 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063FAC0613D4;
        Wed, 25 Nov 2020 12:13:03 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id p6so1660222plr.7;
        Wed, 25 Nov 2020 12:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9lk+L55lL/3KZyFGZIwmqHn6eyXNJ+lt4qLdjWihiL8=;
        b=hnRw8sZUJJSg+Xd2/m+PFicMYa8F1NuF/MUXLzaPBphiw3rCsrk25M8hHQui7lfkDF
         8GQvKUFgk1udp3zIdl1bbCdDlm2s9nLyGUUuk1P4FM87NuLy6aW441eg83ELZjqlhGeR
         8lrUSqlGY/B6ZrAP9OSqJ94YtvRrE+QzCWmncb3AE6e9gwuHB4HIVw/SlXCwgTaj0R+9
         tlH79nfFDHqXtdYfS0Dpe9lp/1Lo3dB16DNazbGdV+AB88K8P5ckNYIbg1tqzxsvWJ89
         HrbYU4/cHDM4jFYzh8pkc5tuPA8MIOmFDsEWoRsa9j5U+WYzl6QTXm4wX++pzk9xwXIh
         ANxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=9lk+L55lL/3KZyFGZIwmqHn6eyXNJ+lt4qLdjWihiL8=;
        b=cmYKb15EfaqkQvf0iEXrVuJIDsE7P/uY8zq8NlgC0nmpwdT/C54rKzkmSKvijTehUa
         KbdHsx3fY4OugZ7j2GPUHw2RDeRsSOguLzAnfFhrQOriCUCrJZ0w3h6rFdooXBFHjsbk
         P71VgN7Rggi8f4AALQ6k4LpEtDxbKDHuRIK+Jkbuq+x2HXuh5vCOcx7ZqxdqtDvJl4VG
         tDsfB//I7jFdwrSP4DlpSCfGB6kBcI5wF+HnwlCgO5wDila2f2Yjn6aufWqb1ltkWSur
         y9t7aa+kKHsf7dwTvZ6fPwdn1WwrVoHuum+fwdhCjO+tFe9C7Z16kWU54PSGmaixh6HR
         7huw==
X-Gm-Message-State: AOAM530JG4aNW4cBMO6iRe3RAVbODTG0RGZNnsH8XQHu/zRH3dejWQ8I
        d+3I+Anprxs4E75Z/aSE1+Q=
X-Google-Smtp-Source: ABdhPJyejbkIE9UgjoncUatp/3TCX3EO5lg7lcxvO96U/PGVSieQ0PJmyUyzFT1pQqNBo0hKlHCGFw==
X-Received: by 2002:a17:902:c214:b029:d7:d5f3:88c3 with SMTP id 20-20020a170902c214b02900d7d5f388c3mr1109723pll.33.1606335182465;
        Wed, 25 Nov 2020 12:13:02 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id 12sm3808280pjn.19.2020.11.25.12.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 12:13:00 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 25 Nov 2020 12:12:58 -0800
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
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/4] mm: introduce cma_alloc_bulk API
Message-ID: <20201125201258.GB1484898@google.com>
References: <20201117181935.3613581-1-minchan@kernel.org>
 <20201117181935.3613581-2-minchan@kernel.org>
 <a2c33b8f-e4fb-1f1c-7ed0-496a1256ea09@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2c33b8f-e4fb-1f1c-7ed0-496a1256ea09@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 23, 2020 at 03:15:37PM +0100, David Hildenbrand wrote:
> On 17.11.20 19:19, Minchan Kim wrote:
> > There is a need for special HW to require bulk allocation of
> > high-order pages. For example, 4800 * order-4 pages, which
> > would be minimum, sometimes, it requires more.
> > 
> > To meet the requirement, a option reserves 300M CMA area and
> > requests the whole 300M contiguous memory. However, it doesn't
> > work if even one of those pages in the range is long-term pinned
> > directly or indirectly. The other option is to ask higher-order
> > size (e.g., 2M) than requested order(64K) repeatedly until driver
> > could gather necessary amount of memory. Basically, this approach
> > makes the allocation very slow due to cma_alloc's function
> > slowness and it could be stuck on one of the pageblocks if it
> > encounters unmigratable page.
> > 
> > To solve the issue, this patch introduces cma_alloc_bulk.
> > 
> > 	int cma_alloc_bulk(struct cma *cma, unsigned int align,
> > 		gfp_t gfp_mask, unsigned int order, size_t nr_requests,
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
> > takes gfp_t to support __GFP_NORETRY which is propagated into
> > alloc_contig_page to avoid significat overhead functions to inrecase
> > CMA allocation success ratio(e.g., migration retrial, PCP, LRU draining
> > per pageblock) at the cost of less allocation success ratio.
> > If the caller couldn't allocate enough pages with __GFP_NORETRY, they
> > could call it without __GFP_NORETRY to increase success ratio this time
> > if they are okay to expense the overhead for the success ratio.
> 
> I'm not a friend of connecting __GFP_NORETRY  to PCP and LRU draining.

I was also not a fan of the gfp flags in the cma funcions since it could
cause misunderstanding easily but saw taling about brining back gfp_t
into cma_alloc. Since It seems to be dropped, let's use other term.

diff --git a/mm/cma.c b/mm/cma.c
index 7c11ec2dc04c..806280050307 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -505,7 +505,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
  *
  * @cma:       contiguous memory region for which the allocation is performed.
  * @align:     requested alignment of pages (in PAGE_SIZE order).
- * @gfp_mask:  memory allocation flags
+ * @fast:      will skip costly opeartions if it's true.
  * @order:     requested page order
  * @nr_requests: the number of 2^order pages requested to be allocated as input,
  * @page_array:        page_array pointer to store allocated pages (must have space
@@ -513,10 +513,10 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
  * @nr_allocated: the number of 2^order pages allocated as output
  *
  * This function tries to allocate up to @nr_requests @order pages on specific
- * contiguous memory area. If @gfp_mask has __GFP_NORETRY, it will avoid costly
- * functions to increase allocation success ratio so it will be fast but might
- * return less than requested number of pages. User could retry with
- * !__GFP_NORETRY if it is needed.
+ * contiguous memory area. If @fast has true, it will avoid costly functions
+ * to increase allocation success ratio so it will be faster but might return
+ * less than requested number of pages. User could retry it with true if it is
+ * needed.
  *
  * Return: it will return 0 only if all pages requested by @nr_requestsed are
  * allocated. Otherwise, it returns negative error code.
@@ -525,7 +525,7 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
  * how many @order pages are allocated and free those pages when they are not
  * needed.
  */
-int cma_alloc_bulk(struct cma *cma, unsigned int align, gfp_t gfp_mask,
+int cma_alloc_bulk(struct cma *cma, unsigned int align, bool fast,
                        unsigned int order, size_t nr_requests,
                        struct page **page_array, size_t *nr_allocated)
 {
@@ -538,8 +538,8 @@ int cma_alloc_bulk(struct cma *cma, unsigned int align, gfp_t gfp_mask,
        unsigned long start = 0;
        unsigned long bitmap_maxno, bitmap_no, bitmap_count;
        struct page *page = NULL;
-       gfp_t gfp = GFP_KERNEL|__GFP_NOWARN|gfp_mask;
-
+       enum alloc_contig_mode mode = fast ? ALLOC_CONTIG_FAST :
+                                               ALLOC_CONTIG_NORMAL;
        *nr_allocated = 0;
        if (!cma || !cma->count || !cma->bitmap || !page_array)
                return -EINVAL;
@@ -576,7 +576,8 @@ int cma_alloc_bulk(struct cma *cma, unsigned int align, gfp_t gfp_mask,
                mutex_unlock(&cma->lock);

                pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
-               ret = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_CMA, gfp);
+               ret = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_CMA,
+                                               GFP_KERNEL|__GFP_NOWARN, mode);
                if (ret) {
                        cma_clear_bitmap(cma, pfn, nr_pages);
                        if (ret != -EBUSY)



> Also, gfp flags apply mostly to compaction (e.g., how to allocate free
> pages for migration), so this seems a little wrong.
> 
> Can we instead introduce
> 
> enum alloc_contig_mode {
> 	/*
> 	 * Normal mode:
> 	 *
> 	 * Retry page migration 5 times, ... TBD
> 	 *
> 	 */
> 	ALLOC_CONTIG_NORMAL = 0,
> 	/*
> 	 * Fast mode: e.g., used for bulk allocations.
>          *
> 	 * Don't retry page migration if it fails, don't drain PCP
>          * lists, don't drain LRU.
> 	 */
> 	ALLOC_CONTIG_FAST,
> };

Yeah, the mode is better. Let's have it as preparation patch.
