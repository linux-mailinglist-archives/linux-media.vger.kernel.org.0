Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96C230D696
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 10:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhBCJrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 04:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbhBCJqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 04:46:47 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B955FC061786
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 01:46:06 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l12so23404836wry.2
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=xfySz6q5xvZ340AxKDdAPrtOFlaeWrpfnl+56VVFlr0=;
        b=COuA4AC0TiD0CHMovXHYlePBhgEQ5eIWkLbf8gytuEoHVEI1iD61XxsAQArsZgIZBE
         V6o0c1lKqae/21cA1iArP2W9pvvxGY6f+VbVAE3z+2SS7A7D7u8lzUOv4jXeJZJ5FCDi
         7PYOWV6eRysgFgRXJQ5gzmqVVwliUyyM6RTNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=xfySz6q5xvZ340AxKDdAPrtOFlaeWrpfnl+56VVFlr0=;
        b=ligQS3OHxVYx/lJyBH7sA07wMZOvSCMxpptgRWW6F89H5DXKzsUTpy/Gdc57VWMBGP
         Du5w9tXo2gawXbV/hUG83w9eG5hRc4AGXgmFDtuTPE3dES/SRM1LM624jafRML/Edh95
         9OAuM2FQ/5fE1AhVV8uG+BtZxJsyrujotWBhYATLCjV1eor+HGPPBLl/lbrBdUznRh9G
         h5z+xkppevZecJ+tZru3nFEahbz45dAxM8h0EJ3othZyPsyX1aqsF1OaI7orPPaquS2W
         p11y2c8zkVxPVEcHJQ3cvN8t/LgjS5eoufid8wmC0B2g25fumg4xtqSGBCQNZ8lHmYO3
         8QfA==
X-Gm-Message-State: AOAM531puTOH2w4kciV82PNPt7DdpdLopwmuohpHTSrvAikctTpmnAEw
        ULAQ+2GYJ+46Q5SAPU9NojyMSQ==
X-Google-Smtp-Source: ABdhPJyNduSh6pFDFP+YRUM+TGXjqQL1z8wP3E+j4R0MMc87oWqYnLo9N3IfHJKfVR0yRnDBtqbt8g==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr2573206wrr.189.1612345565423;
        Wed, 03 Feb 2021 01:46:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r13sm2224352wmh.9.2021.02.03.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 01:46:04 -0800 (PST)
Date:   Wed, 3 Feb 2021 10:46:02 +0100
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
Message-ID: <YBpw2l9aGKmNuG8C@phenom.ffwll.local>
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
 <YBlb1V62cFP9Fz1/@phenom.ffwll.local>
 <CALAqxLVNBGLeCnZ1SMj+bPWTTOMADUw7ioz7zaGRZPC79PpBqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVNBGLeCnZ1SMj+bPWTTOMADUw7ioz7zaGRZPC79PpBqg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 09:56:14PM -0800, John Stultz wrote:
> On Tue, Feb 2, 2021 at 6:04 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jan 22, 2021 at 05:28:32PM -0800, John Stultz wrote:
> > > On Mon, Dec 21, 2020 at 2:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Fri, Dec 18, 2020 at 05:16:56PM -0800, John Stultz wrote:
> > > > > On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > > > > > > Reuse/abuse the pagepool code from the network code to speed
> > > > > > > up allocation performance.
> > > > > > >
> > > > > > > This is similar to the ION pagepool usage, but tries to
> > > > > > > utilize generic code instead of a custom implementation.
> > > > > >
> > > > > > We also have one of these in ttm. I think we should have at most one of
> > > > > > these for the gpu ecosystem overall, maybe as a helper that can be plugged
> > > > > > into all the places.
> > > > > >
> > > > > > Or I'm kinda missing something, which could be since I only glanced at
> > > > > > yours for a bit. But it's also called page pool for buffer allocations,
> > > > > > and I don't think there's that many ways to implement that really :-)
> > > > >
> > > > > Yea, when I was looking around the ttm one didn't seem quite as
> > > > > generic as the networking one, which more easily fit in here.
> > > >
> > > > Oops, I didn't look that closely and didn't realize you're reusing the one
> > > > from net/core/.
> > > >
> > > > > The main benefit for the system heap is not so much the pool itself
> > > > > (the normal page allocator is pretty good), as it being able to defer
> > > > > the free and zero the pages in a background thread, so the pool is
> > > > > effectively filled with pre-zeroed pages.
> > > > >
> > > > > But I'll take another look at the ttm implementation and see if it can
> > > > > be re-used or the shared code refactored and pulled out somehow.
> > > >
> > > > I think moving the page_pool from net into lib and using it in ttm might
> > > > also be an option. Lack of shrinker in the networking one might be a bit a
> > > > problem.
> > >
> > > Yea. I've been looking at this, to see how to abstract out a generic
> > > pool implementation, but each pool implementation has been tweaked for
> > > the specific use cases, so a general abstraction is a bit tough right
> > > off.
> > >
> > > For example the ttm pool's handling allocations both from alloc_pages
> > > and dma_alloc in a pool, where the net page pool only uses alloc_pages
> > > (but can pre map via dma_map_attr).
> > >
> > > And as you mentioned, the networking page pool is statically sized
> > > where the ttm pool is dynamic and shrinker controlled.
> > >
> > > Further, as the ttm pool is utilized for keeping pools of pages set
> > > for specific cache types, it makes it difficult to abstract that out
> > > as we have to be able to reset the caching (set_pages_wb()) when
> > > shrinking, so that would also have to be pushed down into the pool
> > > attributes as well.
> > >
> > > So far, in my attempts to share an abstraction for both the net
> > > page_pool and the ttm page pool, it seems to make the code complexity
> > > worse on both sides -  so while I'm interested in continuing to try to
> > > find a way to share code here, I'm not sure it makes sense to hold up
> > > this series (which is already re-using an existing implementation and
> > > provide a performance bump in microbenchmarks) for the
> > > grand-unified-page-pool. Efforts to refactor the ttm pool and net page
> > > pool can continue on indepently, and I'd be happy to move the system
> > > heap to whatever that ends up being.
> >
> > The thing is, I'm not sure sharing code with net/core is a really good
> > idea, at least it seems like we have some impendence mismatch with the ttm
> > pool. And going forward I expect sooner or later we need alignment between
> > the pools/caches under drm with dma-buf heap pools a lot more than between
> > dma-buf and net/core.
> 
> I mean...  I don't think you're wrong here, but it was your suggestion.
> 
> > So this feels like a bit code sharing for code sharing's sake and not
> > where it makes sense. Expecting net/core and gpu stacks to have the exact
> > same needs for a page pool allocator has good chances to bite us in the
> > long run.
> 
> Again, I agree with you at the high level here (dmabuf system heap and
> ttm page pooling are conceptually more likely to align, and
> duplication of buffer pools is non-optimal), but there's still the
> practical aspect of the ttm pool being pretty tied to the ttm code
> (utilizing ttm contexts, fixed MAX_ORDER*TTM_NUM_CACHING_TYPES
> subpools per pool + 4 global sub-pools for only x86).
> 
> So... I guess I'll go for another pass at trying to pull something
> generic out of the ttm_pool, but the cynic in me suspects folks will
> just object to any inefficiencies added in order to do so (the
> code-sharing for its own sake argument above) and I'll be back to
> where I am now. But we'll see.

Yeah realistically we're not there yet most likely. It's also a bigger
problem, with shrinkers all over various drivers and buffer locking scheme
mostly of the yolo kind.

With Android I'm just more worried than with the other parts since in
reality the actual production gpu stacks on android are all out of tree.
And so there's substantial more inertia against refactoring (in practice
at least, because the only people who care are not super willing to create
tons of work in their out-of-tree stacks). And given past progress waiting
for Android to arrive on upstream is also not a great option really -
outside of some nice tech demos that in practice don't ship anywhere

And without the full stack a lot of this just looks like tech debt
offloading without a hole lot of benefits to upstream.

But also, this isn't a new topic :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
