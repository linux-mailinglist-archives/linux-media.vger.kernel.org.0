Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDE230C0CA
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhBBOG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhBBOEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 09:04:50 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E43FC06174A
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 06:04:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v15so20620911wrx.4
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=d1+IBxBT9tSPUjHykQz7xx/LX6WrnCN2wV67HrbifMs=;
        b=C+fg493h2nPGEZN0gct3cjZSNTmVy/KeUueauEnwdp8qrNzKsUs4PJu5LWgd6nW63U
         kkr5Ur3SbL0D6HdW2d1PRH0QR2rrPGcot1VAd0nmQluZ3RB4lhKWIzr0s9fvj5CuDaCg
         P8B7zGg2ax1eZXi7rUBvheV6NNZSaO9udf6ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=d1+IBxBT9tSPUjHykQz7xx/LX6WrnCN2wV67HrbifMs=;
        b=gH6krmNXY1pHhJRxzUJQfUpVqjAWSZcSIPpqxBMzwQmilgA+kODwnN9c//LNSZGQSz
         7J5wzkz1mJT8iFdtuD5Z1A1z/76qLCQz1vw/Hz0Sbsk9ImcNw7blSLFcQJOOmjZn76+9
         kw1/yhO28KIDqwRRmuxRctPJCe/2HqQ/0NBjAyM9P2rIin00BDohw0RYdS5v4eWuUdlr
         HfOm4TNZRg0ZCP6NefGS53v7CrtUxzKGjRKf/76yRYc1rFBvD7wK2C00CmF1B6q0ehmr
         +GquFovsS1rq0HLTGCK6Vp789+WHtaE81cDycxB4g7r7AkIBN9j1yXYy7jFdehj3yawF
         cBQA==
X-Gm-Message-State: AOAM53071pgSx/6P055yQfGacxKitPMcIsb+DJfF1KMqEfovIbGEqpib
        X9QQ3c8WaQ0TrBQgwm3hkhPUEg==
X-Google-Smtp-Source: ABdhPJzb1/8p4uBAV7ynZfF+MQBtACzxaTYoZH4MZj8LWMrkQgVqms1j+44lTPSaelKZa0f34rUQCg==
X-Received: by 2002:adf:e384:: with SMTP id e4mr23960042wrm.13.1612274648010;
        Tue, 02 Feb 2021 06:04:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s23sm3211821wmc.29.2021.02.02.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 06:04:07 -0800 (PST)
Date:   Tue, 2 Feb 2021 15:04:05 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Daniel Mentz <danielmentz@google.com>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
Message-ID: <YBlb1V62cFP9Fz1/@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Daniel Mentz <danielmentz@google.com>
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
 <X9y+YZujWBTHMuH3@phenom.ffwll.local>
 <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
 <X+Ec+xVhyIUa7IsJ@phenom.ffwll.local>
 <CALAqxLWdq9pKpFLzXmV60LQHpu8BgckDuX1HX5hY4jspHvLK5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWdq9pKpFLzXmV60LQHpu8BgckDuX1HX5hY4jspHvLK5Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 05:28:32PM -0800, John Stultz wrote:
> On Mon, Dec 21, 2020 at 2:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Dec 18, 2020 at 05:16:56PM -0800, John Stultz wrote:
> > > On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > > > > Reuse/abuse the pagepool code from the network code to speed
> > > > > up allocation performance.
> > > > >
> > > > > This is similar to the ION pagepool usage, but tries to
> > > > > utilize generic code instead of a custom implementation.
> > > >
> > > > We also have one of these in ttm. I think we should have at most one of
> > > > these for the gpu ecosystem overall, maybe as a helper that can be plugged
> > > > into all the places.
> > > >
> > > > Or I'm kinda missing something, which could be since I only glanced at
> > > > yours for a bit. But it's also called page pool for buffer allocations,
> > > > and I don't think there's that many ways to implement that really :-)
> > >
> > > Yea, when I was looking around the ttm one didn't seem quite as
> > > generic as the networking one, which more easily fit in here.
> >
> > Oops, I didn't look that closely and didn't realize you're reusing the one
> > from net/core/.
> >
> > > The main benefit for the system heap is not so much the pool itself
> > > (the normal page allocator is pretty good), as it being able to defer
> > > the free and zero the pages in a background thread, so the pool is
> > > effectively filled with pre-zeroed pages.
> > >
> > > But I'll take another look at the ttm implementation and see if it can
> > > be re-used or the shared code refactored and pulled out somehow.
> >
> > I think moving the page_pool from net into lib and using it in ttm might
> > also be an option. Lack of shrinker in the networking one might be a bit a
> > problem.
> 
> Yea. I've been looking at this, to see how to abstract out a generic
> pool implementation, but each pool implementation has been tweaked for
> the specific use cases, so a general abstraction is a bit tough right
> off.
> 
> For example the ttm pool's handling allocations both from alloc_pages
> and dma_alloc in a pool, where the net page pool only uses alloc_pages
> (but can pre map via dma_map_attr).
> 
> And as you mentioned, the networking page pool is statically sized
> where the ttm pool is dynamic and shrinker controlled.
> 
> Further, as the ttm pool is utilized for keeping pools of pages set
> for specific cache types, it makes it difficult to abstract that out
> as we have to be able to reset the caching (set_pages_wb()) when
> shrinking, so that would also have to be pushed down into the pool
> attributes as well.
> 
> So far, in my attempts to share an abstraction for both the net
> page_pool and the ttm page pool, it seems to make the code complexity
> worse on both sides -  so while I'm interested in continuing to try to
> find a way to share code here, I'm not sure it makes sense to hold up
> this series (which is already re-using an existing implementation and
> provide a performance bump in microbenchmarks) for the
> grand-unified-page-pool. Efforts to refactor the ttm pool and net page
> pool can continue on indepently, and I'd be happy to move the system
> heap to whatever that ends up being.

The thing is, I'm not sure sharing code with net/core is a really good
idea, at least it seems like we have some impendence mismatch with the ttm
pool. And going forward I expect sooner or later we need alignment between
the pools/caches under drm with dma-buf heap pools a lot more than between
dma-buf and net/core.

So this feels like a bit code sharing for code sharing's sake and not
where it makes sense. Expecting net/core and gpu stacks to have the exact
same needs for a page pool allocator has good chances to bite us in the
long run.
-Daniel

> 
> thanks
> -john
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
