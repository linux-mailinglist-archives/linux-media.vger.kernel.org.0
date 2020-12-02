Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4BC2CC849
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 21:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbgLBUtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 15:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729825AbgLBUtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 15:49:16 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEEEC0617A6;
        Wed,  2 Dec 2020 12:48:36 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id q3so1852307pgr.3;
        Wed, 02 Dec 2020 12:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gt9hzYCtNcO6pucg1V+gBSIqdKsij7u0OWJUlXP9DKM=;
        b=UUG2F1QYy5FvtvGtTYBJmiMRQoqH0NFofMnXxJDDDNLskva/PIVsF+3J8kdAQXvqRq
         vujK49qAeZwATkysyhPnwXetTOK0LeMC+CABGQX4Pn9fpok9I8d7Kkt1Kwo7haQl6BSg
         afpECKeFPdeVS+vONuYuFjDDLKyBYv35wpKcD+W7Eb6ql5yb1B2o2q1cmm8EwWlma3+j
         K6H7/shJRnOprQRDiZ0ReWQ8AwdWolI8nPmO4AgNkLzuKpmTNCuJ9Kku7AOut8ZFI2bK
         EEdju0Y4RpX+EsknllBncdSKqV8fKSOuetxoASlTmQjvmJjTgwWrT5rrs094yo7QuZjV
         776g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gt9hzYCtNcO6pucg1V+gBSIqdKsij7u0OWJUlXP9DKM=;
        b=Zqn503P6IHodmMVkZwMohKR2x5FjHWedlUt6GNaR4oe4awmsJsFpt1ZMBZSS1o8JXW
         vUpiBseHHxR4VAAu72YV23rURV2OD5YnXIKFx651RQRgU64w7jYzDc6Q5eSyUmyWWzI7
         PremaLFep9nZlqDquTNpcedKAhHYcHkqYbnrV8r4EUlhIDYNJOap+mIFVrWWTrq8Cmv8
         iE/8tIyo5VvS2xmDdCY9yg1J8DDqZEu2TGPXGmKCba9xx46Vh4rXL7okZW9hQOuTDGYN
         RHAnAD/uf4eL2aFCa2kqB0cNj0poYbz9n0ymQc7sgPDuhf7CoTLqRjqYDsQWXvRLSx/N
         SpLw==
X-Gm-Message-State: AOAM533y5r+Bg/iaVMaUmn0U4xUK+X2CMOAZuA5tWwdn76Fqy2dmaQFN
        mQMgl+yb+3plCWy37H/YJQk=
X-Google-Smtp-Source: ABdhPJywHlNLOdog4uLjnoWm03XM8rSAaJFIonYnd/FuiTebzFhIhD5EPwsZYD1rNwjeMIO4SbWUFg==
X-Received: by 2002:aa7:8297:0:b029:198:15b2:ed0a with SMTP id s23-20020aa782970000b029019815b2ed0amr4307591pfm.47.1606942115908;
        Wed, 02 Dec 2020 12:48:35 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id g85sm8386pfb.4.2020.12.02.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:48:34 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 2 Dec 2020 12:48:31 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Michal Hocko <mhocko@suse.com>,
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
Message-ID: <X8f9nxqYcD8u8dtl@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
 <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz>
 <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz>
 <X8fqU82GXmu57f7V@google.com>
 <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 09:22:36PM +0100, David Hildenbrand wrote:
> On 02.12.20 20:26, Minchan Kim wrote:
> > On Wed, Dec 02, 2020 at 07:51:07PM +0100, Michal Hocko wrote:
> >> On Wed 02-12-20 09:54:29, Minchan Kim wrote:
> >>> On Wed, Dec 02, 2020 at 05:48:34PM +0100, Michal Hocko wrote:
> >>>> On Wed 02-12-20 08:15:49, Minchan Kim wrote:
> >>>>> On Wed, Dec 02, 2020 at 04:49:15PM +0100, Michal Hocko wrote:
> >>>> [...]
> >>>>>> Well, what I can see is that this new interface is an antipatern to our
> >>>>>> allocation routines. We tend to control allocations by gfp mask yet you
> >>>>>> are introducing a bool parameter to make something faster... What that
> >>>>>> really means is rather arbitrary. Would it make more sense to teach
> >>>>>> cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
> >>>>>> GFP_RETRY_MAYFAIL instead?
> >>>>>
> >>>>> If we use cma_alloc, that interface requires "allocate one big memory
> >>>>> chunk". IOW, return value is just struct page and expected that the page
> >>>>> is a big contiguos memory. That means it couldn't have a hole in the
> >>>>> range.
> >>>>> However the idea here, what we asked is much smaller chunk rather
> >>>>> than a big contiguous memory so we could skip some of pages if they are
> >>>>> randomly pinned(long-term/short-term whatever) and search other pages
> >>>>> in the CMA area to avoid long stall. Thus, it couldn't work with exising
> >>>>> cma_alloc API with simple gfp_mak.
> >>>>
> >>>> I really do not see that as something really alient to the cma_alloc
> >>>> interface. All you should care about, really, is what size of the object
> >>>> you want and how hard the system should try. If you have a problem with
> >>>> an internal implementation of CMA and how it chooses a range and deal
> >>>> with pinned pages then it should be addressed inside the CMA allocator.
> >>>> I suspect that you are effectivelly trying to workaround those problems
> >>>> by a side implementation with a slightly different API. Or maybe I still
> >>>> do not follow the actual problem.
> >>>>  
> >>>>>> I am not deeply familiar with the cma allocator so sorry for a
> >>>>>> potentially stupid question. Why does a bulk interface performs better
> >>>>>> than repeated calls to cma_alloc? Is this because a failure would help
> >>>>>> to move on to the next pfn range while a repeated call would have to
> >>>>>> deal with the same range?
> >>>>>
> >>>>> Yub, true with other overheads(e.g., migration retrial, waiting writeback
> >>>>> PCP/LRU draining IPI)
> >>>>
> >>>> Why cannot this be implemented in the cma_alloc layer? I mean you can
> >>>> cache failed cases and optimize the proper pfn range search.
> >>>
> >>> So do you suggest this?
> >>>
> >>> enum cma_alloc_mode {
> >>> 	CMA_ALLOC_NORMAL,
> >>> 	CMA_ALLOC_FAIL_FAST,
> >>> };
> >>>
> >>> struct page *cma_alloc(struct cma *cma, size_t count, unsigned int
> >>> 	align, enum cma_alloc_mode mode);
> >>>
> >>> >From now on, cma_alloc will keep last failed pfn and then start to
> >>> search from the next pfn for both CMA_ALLOC_NORMAL and
> >>> CMA_ALLOC_FAIL_FAST if requested size from the cached pfn is okay
> >>> within CMA area and then wraparound it couldn't find right pages
> >>> from the cached pfn. Othewise, the cached pfn will reset to the zero
> >>> so that it starts the search from the 0. I like the idea since it's
> >>> general improvement, I think.
> >>
> >> Yes something like that. There are more options to be clever here - e.g.
> >> track ranges etc. but I am not sure this is worth the complexity.
> > 
> > Agree. Just last pfn caching would be good enough as simple start.
> > 
> >>
> >>> Furthemore, With CMA_ALLOC_FAIL_FAST, it could avoid several overheads
> >>> at the cost of sacrificing allocation success ratio like GFP_NORETRY.
> >>
> >> I am still not sure a specific flag is a good interface. Really can this
> >> be gfp_mask instead?
> > 
> > I am not strong(even, I did it with GFP_NORETRY) but David wanted to
> > have special mode and I agreed when he mentioned ALLOC_CONTIG_HARD as
> > one of options in future(it would be hard to indicate that mode with
> > gfp flags).
> 
> I can't tell regarding the CMA interface, but for the alloc_contig()
> interface I think modes make sense. Yes, it's different to other
> allocaters, but the contig range allocater is different already. E.g.,
> the CMA allocater mostly hides "which exact PFNs you try to allocate".
> 
> In the contig range allocater, gfp flags are currently used to express
> how to allocate pages used as migration targets. I don't think mangling
> in other gfp flags (or even overloading them) makes things a lot
> clearer. E.g., GFP_NORETRY: don't retry to allocate migration targets?
> don't retry to migrate pages? both?
> 
> As I said, other aspects might be harder to model (e.g., don't drain
> LRU) and hiding them behind generic gfp flags (e.g., GFP_NORETRY) feels
> wrong.

I also support a special flag/bool variable for cma_alloc rather than
relying on mixing original gfp_flags since it would be more clear
with preventing passing unhandled the other gfp_flags into cma_alloc.

> 
> With the mode, we're expressing details for the necessary page
> migration. Suggestions on how to model that are welcome.
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
