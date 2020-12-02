Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F7E2CC14B
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388946AbgLBPuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:50:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:39310 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728595AbgLBPuD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 10:50:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606924157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V1KqfNMEjdlZsnYnQmgAnUaEY1GwwPYLnd99eAVp8b4=;
        b=fKwrBBEDmhVAvUaO6fxirS7JT8ThxUTv4HY3C4TBI1h+aBVM/LDtp67SW97aXfBwBnyV53
        MMpiIOxnpPk5DvB1sN3zGW3u2XSz6h2JoexIiArmA6ruyq0ct5XX3YINS1FTNuZKmLfQi8
        Nc+OqUpsq0mjhCv8/Gu9fZuDzeT9yJE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D6A99AB63;
        Wed,  2 Dec 2020 15:49:16 +0000 (UTC)
Date:   Wed, 2 Dec 2020 16:49:15 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, hyesoo.yu@samsung.com,
        willy@infradead.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
Message-ID: <20201202154915.GU17338@dhcp22.suse.cz>
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

On Wed 02-12-20 10:14:41, David Hildenbrand wrote:
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

Agreed!

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
> 
> I don't really have a strong opinion on that. Giving up fast rather than
> trying for longer sounds like a useful thing to have - but I wonder if
> it's strictly necessary for the use case you describe.
> 
> I'd like to hear Michals opinion on that.

Well, what I can see is that this new interface is an antipatern to our
allocation routines. We tend to control allocations by gfp mask yet you
are introducing a bool parameter to make something faster... What that
really means is rather arbitrary. Would it make more sense to teach
cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
GFP_RETRY_MAYFAIL instead?

I am not deeply familiar with the cma allocator so sorry for a
potentially stupid question. Why does a bulk interface performs better
than repeated calls to cma_alloc? Is this because a failure would help
to move on to the next pfn range while a repeated call would have to
deal with the same range?

> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  include/linux/cma.h |   5 ++
> >  include/linux/gfp.h |   2 +
> >  mm/cma.c            | 126 ++++++++++++++++++++++++++++++++++++++++++--
> >  mm/page_alloc.c     |  19 ++++---
> >  4 files changed, 140 insertions(+), 12 deletions(-)
> > 
-- 
Michal Hocko
SUSE Labs
