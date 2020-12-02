Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A2F2CC6A3
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 20:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731099AbgLBT1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 14:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgLBT1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 14:27:02 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0352C0613D6;
        Wed,  2 Dec 2020 11:26:15 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id iq13so1582735pjb.3;
        Wed, 02 Dec 2020 11:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gpjxGYzLSyNarmAmbAQjfYVpd3J0HaJaIoHV/RbyoP0=;
        b=VaodmzoR9g7kj+trfPWTjKbOUGtif1gfK+MnyL7sDiLsjyPyv9Ozrs83cRZhE6sMsD
         B4rvR5ybl880Y58IX1cTIx/9xN995XcaDz2WforplB/T06qvrvmx8BerjEPT2F2vdfwQ
         Ossz0JVVbfsMH2GwekdB48BNH0Nq5/MPXAuAkPwkpLCSv9Zf7nMfkdixgZp5Cx66ZXCM
         yG7FuCrCsM02755Wnk1gKEi9cXAANCbuUPixXWf6wveszg2iZaK/MYobBJAYJlAjgmxa
         62C0njYK1ROuxHembS4Qg5lX/pBT1Lcs4fh1ORKYWO6VEyQdVU5gcRDw6HMRe2kMGB1n
         UZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gpjxGYzLSyNarmAmbAQjfYVpd3J0HaJaIoHV/RbyoP0=;
        b=lQUegYDCVJ3Jsj1J0shqReRQ5u2Vo16tJEKI57rxGOm/OfrgpjE/zwWRBYMtawON45
         kzXc1tHN4dhSrGQ0QuAPIVnFOx4cIVJf/yWeB2mFQNW7WmTbYCKNXWjVxh20dY4L40mG
         graYZtB/oT1UlQ79/DdTvxvu7zTomywrXGYKbwAgyfeeVjPnHawmkVcZnGcOtLZ1hLVD
         VAO8lFfB0kHJBMKwFbg6xrNZhrZbV+xO2CiGl/A0SffJEjLeFE7YdAW+Br9fh9MDCzPA
         0DiOgoyycxeB1vrcHKnxpjxsVqVJUN0LB1qu1ddMuSFhnSYvQYE11ufLOxKSpmoj35hU
         Ri0A==
X-Gm-Message-State: AOAM5334YXeGcelF911b0RecWd2RUthXOvg4275r1GlXBkQywQIzqqyR
        eSsTwSwm4BfporcXmtAO5pc=
X-Google-Smtp-Source: ABdhPJxcdPTZ5uZMP8zvH4q1sui0DmS0RvpM84/fgaeUTS26506J8tp8Ce+fVMlFSti+TUz8UFLwqA==
X-Received: by 2002:a17:90b:4a03:: with SMTP id kk3mr1260133pjb.97.1606937175483;
        Wed, 02 Dec 2020 11:26:15 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id js9sm2652626pjb.2.2020.12.02.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 11:26:14 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 2 Dec 2020 11:26:11 -0800
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
Message-ID: <X8fqU82GXmu57f7V@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
 <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz>
 <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202185107.GW17338@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 07:51:07PM +0100, Michal Hocko wrote:
> On Wed 02-12-20 09:54:29, Minchan Kim wrote:
> > On Wed, Dec 02, 2020 at 05:48:34PM +0100, Michal Hocko wrote:
> > > On Wed 02-12-20 08:15:49, Minchan Kim wrote:
> > > > On Wed, Dec 02, 2020 at 04:49:15PM +0100, Michal Hocko wrote:
> > > [...]
> > > > > Well, what I can see is that this new interface is an antipatern to our
> > > > > allocation routines. We tend to control allocations by gfp mask yet you
> > > > > are introducing a bool parameter to make something faster... What that
> > > > > really means is rather arbitrary. Would it make more sense to teach
> > > > > cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
> > > > > GFP_RETRY_MAYFAIL instead?
> > > > 
> > > > If we use cma_alloc, that interface requires "allocate one big memory
> > > > chunk". IOW, return value is just struct page and expected that the page
> > > > is a big contiguos memory. That means it couldn't have a hole in the
> > > > range.
> > > > However the idea here, what we asked is much smaller chunk rather
> > > > than a big contiguous memory so we could skip some of pages if they are
> > > > randomly pinned(long-term/short-term whatever) and search other pages
> > > > in the CMA area to avoid long stall. Thus, it couldn't work with exising
> > > > cma_alloc API with simple gfp_mak.
> > > 
> > > I really do not see that as something really alient to the cma_alloc
> > > interface. All you should care about, really, is what size of the object
> > > you want and how hard the system should try. If you have a problem with
> > > an internal implementation of CMA and how it chooses a range and deal
> > > with pinned pages then it should be addressed inside the CMA allocator.
> > > I suspect that you are effectivelly trying to workaround those problems
> > > by a side implementation with a slightly different API. Or maybe I still
> > > do not follow the actual problem.
> > >  
> > > > > I am not deeply familiar with the cma allocator so sorry for a
> > > > > potentially stupid question. Why does a bulk interface performs better
> > > > > than repeated calls to cma_alloc? Is this because a failure would help
> > > > > to move on to the next pfn range while a repeated call would have to
> > > > > deal with the same range?
> > > > 
> > > > Yub, true with other overheads(e.g., migration retrial, waiting writeback
> > > > PCP/LRU draining IPI)
> > > 
> > > Why cannot this be implemented in the cma_alloc layer? I mean you can
> > > cache failed cases and optimize the proper pfn range search.
> > 
> > So do you suggest this?
> > 
> > enum cma_alloc_mode {
> > 	CMA_ALLOC_NORMAL,
> > 	CMA_ALLOC_FAIL_FAST,
> > };
> > 
> > struct page *cma_alloc(struct cma *cma, size_t count, unsigned int
> > 	align, enum cma_alloc_mode mode);
> > 
> > >From now on, cma_alloc will keep last failed pfn and then start to
> > search from the next pfn for both CMA_ALLOC_NORMAL and
> > CMA_ALLOC_FAIL_FAST if requested size from the cached pfn is okay
> > within CMA area and then wraparound it couldn't find right pages
> > from the cached pfn. Othewise, the cached pfn will reset to the zero
> > so that it starts the search from the 0. I like the idea since it's
> > general improvement, I think.
> 
> Yes something like that. There are more options to be clever here - e.g.
> track ranges etc. but I am not sure this is worth the complexity.

Agree. Just last pfn caching would be good enough as simple start.

> 
> > Furthemore, With CMA_ALLOC_FAIL_FAST, it could avoid several overheads
> > at the cost of sacrificing allocation success ratio like GFP_NORETRY.
> 
> I am still not sure a specific flag is a good interface. Really can this
> be gfp_mask instead?

I am not strong(even, I did it with GFP_NORETRY) but David wanted to
have special mode and I agreed when he mentioned ALLOC_CONTIG_HARD as
one of options in future(it would be hard to indicate that mode with
gfp flags).

> 
> > I think that would solve the issue with making the API more flexible.
> > Before diving into it, I'd like to confirm we are on same page.
> > Please correct me if I misunderstood.
> 
> I am not sure you are still thinking about a bulk interface.

No I am thinking of just using cma_alloc API with cached pfn
as interal improvement and adding new fast fail mode to the API
so driver could call the API repeatedly until then can get enough
pages.
