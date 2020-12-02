Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158272CC5E8
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389500AbgLBSv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:51:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:42978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbgLBSv4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:51:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606935069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MrETXDccj16ROSTdsfK+oPYaF1D5OYkdWel8AMipPuI=;
        b=mldBlNabsf0QaJu/CnF2j9hJEHWdLf0HS7pnsoixlHjRLEzPOm3JkdjDMxhO0yDnmX+Rvx
        e5H8PPKB48ggBsg81uckMgOgu9MdOZA4L5+ZYkaoLLa2Oz2uQBhq2EPJWMA9f0H8fmlPyB
        n8Hz/FztB29TDZwkdexmfmG2waIh+NQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2725FACF9;
        Wed,  2 Dec 2020 18:51:09 +0000 (UTC)
Date:   Wed, 2 Dec 2020 19:51:07 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Minchan Kim <minchan@kernel.org>
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
Message-ID: <20201202185107.GW17338@dhcp22.suse.cz>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
 <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz>
 <X8fU1ddmsSfuV6sD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8fU1ddmsSfuV6sD@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 02-12-20 09:54:29, Minchan Kim wrote:
> On Wed, Dec 02, 2020 at 05:48:34PM +0100, Michal Hocko wrote:
> > On Wed 02-12-20 08:15:49, Minchan Kim wrote:
> > > On Wed, Dec 02, 2020 at 04:49:15PM +0100, Michal Hocko wrote:
> > [...]
> > > > Well, what I can see is that this new interface is an antipatern to our
> > > > allocation routines. We tend to control allocations by gfp mask yet you
> > > > are introducing a bool parameter to make something faster... What that
> > > > really means is rather arbitrary. Would it make more sense to teach
> > > > cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
> > > > GFP_RETRY_MAYFAIL instead?
> > > 
> > > If we use cma_alloc, that interface requires "allocate one big memory
> > > chunk". IOW, return value is just struct page and expected that the page
> > > is a big contiguos memory. That means it couldn't have a hole in the
> > > range.
> > > However the idea here, what we asked is much smaller chunk rather
> > > than a big contiguous memory so we could skip some of pages if they are
> > > randomly pinned(long-term/short-term whatever) and search other pages
> > > in the CMA area to avoid long stall. Thus, it couldn't work with exising
> > > cma_alloc API with simple gfp_mak.
> > 
> > I really do not see that as something really alient to the cma_alloc
> > interface. All you should care about, really, is what size of the object
> > you want and how hard the system should try. If you have a problem with
> > an internal implementation of CMA and how it chooses a range and deal
> > with pinned pages then it should be addressed inside the CMA allocator.
> > I suspect that you are effectivelly trying to workaround those problems
> > by a side implementation with a slightly different API. Or maybe I still
> > do not follow the actual problem.
> >  
> > > > I am not deeply familiar with the cma allocator so sorry for a
> > > > potentially stupid question. Why does a bulk interface performs better
> > > > than repeated calls to cma_alloc? Is this because a failure would help
> > > > to move on to the next pfn range while a repeated call would have to
> > > > deal with the same range?
> > > 
> > > Yub, true with other overheads(e.g., migration retrial, waiting writeback
> > > PCP/LRU draining IPI)
> > 
> > Why cannot this be implemented in the cma_alloc layer? I mean you can
> > cache failed cases and optimize the proper pfn range search.
> 
> So do you suggest this?
> 
> enum cma_alloc_mode {
> 	CMA_ALLOC_NORMAL,
> 	CMA_ALLOC_FAIL_FAST,
> };
> 
> struct page *cma_alloc(struct cma *cma, size_t count, unsigned int
> 	align, enum cma_alloc_mode mode);
> 
> >From now on, cma_alloc will keep last failed pfn and then start to
> search from the next pfn for both CMA_ALLOC_NORMAL and
> CMA_ALLOC_FAIL_FAST if requested size from the cached pfn is okay
> within CMA area and then wraparound it couldn't find right pages
> from the cached pfn. Othewise, the cached pfn will reset to the zero
> so that it starts the search from the 0. I like the idea since it's
> general improvement, I think.

Yes something like that. There are more options to be clever here - e.g.
track ranges etc. but I am not sure this is worth the complexity.

> Furthemore, With CMA_ALLOC_FAIL_FAST, it could avoid several overheads
> at the cost of sacrificing allocation success ratio like GFP_NORETRY.

I am still not sure a specific flag is a good interface. Really can this
be gfp_mask instead?

> I think that would solve the issue with making the API more flexible.
> Before diving into it, I'd like to confirm we are on same page.
> Please correct me if I misunderstood.

I am not sure you are still thinking about a bulk interface.

-- 
Michal Hocko
SUSE Labs
