Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C65E2CC1E9
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388994AbgLBQQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728439AbgLBQQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 11:16:33 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE57FC0613CF;
        Wed,  2 Dec 2020 08:15:53 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id f1so915021plt.12;
        Wed, 02 Dec 2020 08:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pAngUE8Pe2deMqEX1v1jJzfLaheheDOemXLQHNVKgZ8=;
        b=HWFWH2/HDVru79H6DBIAlEm4IZp1wlvIrd/vGfdezPoMTqHu5hnBAAwtdeJspmxABQ
         qoNPlUVAhoNr4xEMZunUBGf534rPClmej+rzygPzQPc90Z9Ith1a+D0vZhp72ypFRvX6
         +uHD5SMGwu7klm6jqGz61Qn0JpqLSSdimeL6MaNg99lsKKdPhlMeeJE+qbOxrt7dZ88c
         d3rqG6xiaoVZFl+2GX0NiLfn4ZwZ6iyylguUCTeEjJldD8ACvdBFM6jzNQFzSsEs/ypB
         rp/y8KRdBfe7eDsMfQgqIPtm5WegZ0oovHg9Z3zFgp9f4eVYbENYctarSg49xTOflrXA
         DdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=pAngUE8Pe2deMqEX1v1jJzfLaheheDOemXLQHNVKgZ8=;
        b=JfK0+v8BcZ3c/v5uP4LK3TuR8DJo2vfZ0azmOGgwBhJRFsdceiopk/euDK4dwPN1MZ
         YLeJU8TZQu8JCrh2w23DYix6rMCimKcD1mCdm8FZ/qMTuXuxyjuyaQ4yv62cJx6gGK+I
         0H1TxkCqj880IFezZyvuxterXKQmA1JF7Kh3N1/YZeRRBX0Ldr1oia4BNZTEhCwCaq4u
         jioMQ8aHm97GmAZkLjod+R3yhhunhwLUjlwX3MQzrLWFtjS+/8zthokT8+BZf8kzbHuH
         sxnotoike1ZtiSYqXquW2qp9mpJ+VHRyvhhys4hY1E1DGmZn82cZ9a6Tba8+nJxZdwji
         P0VQ==
X-Gm-Message-State: AOAM533Fdi1b7UzdrLiGssz1MgzH1M646dxvEwlZJYiRiByCo8SD4XbY
        CC1Mp3o+9oJdIVi6VU9i9sbYSrS9W7o=
X-Google-Smtp-Source: ABdhPJzHwADqwgWxJBxLebV+WXJ3wruJCxUN+m+GZcb0aHNYPdKMbdIY0m8AH+LOySrZQzu5BiUGZw==
X-Received: by 2002:a17:902:7d94:b029:da:53c:f7cb with SMTP id a20-20020a1709027d94b02900da053cf7cbmr3124699plm.69.1606925753163;
        Wed, 02 Dec 2020 08:15:53 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id u6sm260518pfb.197.2020.12.02.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:15:52 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 2 Dec 2020 08:15:49 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     David Hildenbrand <david@redhat.com>,
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
Message-ID: <X8e9tSwcsrEsAv1O@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202154915.GU17338@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 04:49:15PM +0100, Michal Hocko wrote:
> On Wed 02-12-20 10:14:41, David Hildenbrand wrote:
> > On 01.12.20 18:51, Minchan Kim wrote:
> > > There is a need for special HW to require bulk allocation of
> > > high-order pages. For example, 4800 * order-4 pages, which
> > > would be minimum, sometimes, it requires more.
> > > 
> > > To meet the requirement, a option reserves 300M CMA area and
> > > requests the whole 300M contiguous memory. However, it doesn't
> > > work if even one of those pages in the range is long-term pinned
> > > directly or indirectly. The other option is to ask higher-order
> > 
> > My latest knowledge is that pages in the CMA area are never long term
> > pinned.
> > 
> > https://lore.kernel.org/lkml/20201123090129.GD27488@dhcp22.suse.cz/
> > 
> > "gup already tries to deal with long term pins on CMA regions and migrate
> > to a non CMA region. Have a look at __gup_longterm_locked."
> > 
> > We should rather identify ways how that is still possible and get rid of
> > them.
> > 
> > 
> > Now, short-term pinnings and PCP are other issues where
> > alloc_contig_range() could be improved (e.g., in contrast to a FAST
> > mode, a HARD mode which temporarily disables the PCP, ...).
> 
> Agreed!
> 
> > > size (e.g., 2M) than requested order(64K) repeatedly until driver
> > > could gather necessary amount of memory. Basically, this approach
> > > makes the allocation very slow due to cma_alloc's function
> > > slowness and it could be stuck on one of the pageblocks if it
> > > encounters unmigratable page.
> > > 
> > > To solve the issue, this patch introduces cma_alloc_bulk.
> > > 
> > > 	int cma_alloc_bulk(struct cma *cma, unsigned int align,
> > > 		bool fast, unsigned int order, size_t nr_requests,
> > > 		struct page **page_array, size_t *nr_allocated);
> > > 
> > > Most parameters are same with cma_alloc but it additionally passes
> > > vector array to store allocated memory. What's different with cma_alloc
> > > is it will skip pageblocks without waiting/stopping if it has unmovable
> > > page so that API continues to scan other pageblocks to find requested
> > > order page.
> > > 
> > > cma_alloc_bulk is best effort approach in that it skips some pageblocks
> > > if they have unmovable pages unlike cma_alloc. It doesn't need to be
> > > perfect from the beginning at the cost of performance. Thus, the API
> > > takes "bool fast parameter" which is propagated into alloc_contig_range to
> > > avoid significat overhead functions to inrecase CMA allocation success
> > > ratio(e.g., migration retrial, PCP, LRU draining per pageblock)
> > > at the cost of less allocation success ratio. If the caller couldn't
> > > allocate enough, they could call it with "false" to increase success ratio
> > > if they are okay to expense the overhead for the success ratio.
> > 
> > Just so I understand what the idea is:
> > 
> > alloc_contig_range() sometimes fails on CMA regions when trying to
> > allocate big chunks (e.g., 300M). Instead of tackling that issue, you
> > rather allocate plenty of small chunks, and make these small allocations
> > fail faster/ make the allocations less reliable. Correct?
> > 
> > I don't really have a strong opinion on that. Giving up fast rather than
> > trying for longer sounds like a useful thing to have - but I wonder if
> > it's strictly necessary for the use case you describe.
> > 
> > I'd like to hear Michals opinion on that.
> 
> Well, what I can see is that this new interface is an antipatern to our
> allocation routines. We tend to control allocations by gfp mask yet you
> are introducing a bool parameter to make something faster... What that
> really means is rather arbitrary. Would it make more sense to teach
> cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
> GFP_RETRY_MAYFAIL instead?

If we use cma_alloc, that interface requires "allocate one big memory
chunk". IOW, return value is just struct page and expected that the page
is a big contiguos memory. That means it couldn't have a hole in the
range. However the idea here, what we asked is much smaller chunk rather
than a big contiguous memory so we could skip some of pages if they are
randomly pinned(long-term/short-term whatever) and search other pages
in the CMA area to avoid long stall. Thus, it couldn't work with exising
cma_alloc API with simple gfp_mak.

> 
> I am not deeply familiar with the cma allocator so sorry for a
> potentially stupid question. Why does a bulk interface performs better
> than repeated calls to cma_alloc? Is this because a failure would help
> to move on to the next pfn range while a repeated call would have to
> deal with the same range?

Yub, true with other overheads(e.g., migration retrial, waiting writeback
PCP/LRU draining IPI)

> 
> > > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > > ---
> > >  include/linux/cma.h |   5 ++
> > >  include/linux/gfp.h |   2 +
> > >  mm/cma.c            | 126 ++++++++++++++++++++++++++++++++++++++++++--
> > >  mm/page_alloc.c     |  19 ++++---
> > >  4 files changed, 140 insertions(+), 12 deletions(-)
> > > 
> -- 
> Michal Hocko
> SUSE Labs
