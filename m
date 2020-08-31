Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C746A257BAF
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 17:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgHaPJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 11:09:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHaPJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 11:09:07 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1436277;
        Mon, 31 Aug 2020 17:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598886543;
        bh=9LeMEkjHn/mN7lSe6JBUC4vihKLkljIJ6v1PdNeA2vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YR54dxRc6PBodNkt2MxTDyLzGD2VgzAkw5EXaRwKKitko0XrzaQO5eR/WWnMyCE6a
         x/LOyhqHzXb+YT0n0bZY8iVDNYdHGbjHk9oCa4VrPUzMhusBaM4oEd8G/m/Jhv/kQX
         fvpLJdBFwawmBkiWLZkINvasStlGvuquTfmK5OxQ=
Date:   Mon, 31 Aug 2020 18:08:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     James Jones <jajones@nvidia.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        nd@arm.com
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200831150841.GK16155@pendragon.ideasonboard.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
 <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
 <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
 <4f987e06-7af1-671b-836a-10d3e9623547@nvidia.com>
 <20200823204637.GF6002@pendragon.ideasonboard.com>
 <5a03e7d8-15cf-1323-31c1-74ae78f4f9c6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a03e7d8-15cf-1323-31c1-74ae78f4f9c6@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James,

On Sun, Aug 23, 2020 at 03:53:50PM -0700, James Jones wrote:
> On 8/23/20 1:46 PM, Laurent Pinchart wrote:
> > On Sun, Aug 23, 2020 at 01:04:43PM -0700, James Jones wrote:
> >> On 8/20/20 1:15 AM, Ezequiel Garcia wrote:
> >>> On Mon, 2020-08-17 at 20:49 -0700, James Jones wrote:
> >>>> On 8/17/20 8:18 AM, Brian Starkey wrote:
> >>>>> On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
> >>>>>> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> >>>>>> which will allocate memory suitable for the given device.
> >>>>>>
> >>>>>> The implementation is mostly a port of the Contiguous Videobuf2
> >>>>>> memory allocator (see videobuf2/videobuf2-dma-contig.c)
> >>>>>> over to the DMA-BUF Heap interface.
> >>>>>>
> >>>>>> The intention of this allocator is to provide applications
> >>>>>> with a more system-agnostic API: the only thing the application
> >>>>>> needs to know is which device to get the buffer for.
> >>>>>>
> >>>>>> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> >>>>>> is unknown to the application.
> >>>>>>
> >>>>>> I'm not really expecting this patch to be correct or even
> >>>>>> a good idea, but just submitting it to start a discussion on DMA-BUF
> >>>>>> heap discovery and negotiation.
> >>>>>>
> >>>>>
> >>>>> My initial reaction is that I thought dmabuf heaps are meant for use
> >>>>> to allocate buffers for sharing across devices, which doesn't fit very
> >>>>> well with having per-device heaps.
> >>>>>
> >>>>> For single-device allocations, would using the buffer allocation
> >>>>> functionality of that device's native API be better in most
> >>>>> cases? (Some other possibly relevant discussion at [1])
> >>>>>
> >>>>> I can see that this can save some boilerplate for devices that want
> >>>>> to expose private chunks of memory, but might it also lead to 100
> >>>>> aliases for the system's generic coherent memory pool?
> >>>>>
> >>>>> I wonder if a set of helpers to allow devices to expose whatever they
> >>>>> want with minimal effort would be better.
> >>>>
> >>>> I'm rather interested on where this goes, as I was toying with using
> >>>> some sort of heap ID as a basis for a "device-local" constraint in the
> >>>> memory constraints proposals Simon and I will be discussing at XDC this
> >>>> year.  It would be rather elegant if there was one type of heap ID used
> >>>> universally throughout the kernel that could provide a unique handle for
> >>>> the shared system memory heap(s), as well as accelerator-local heaps on
> >>>> fancy NICs, GPUs, NN accelerators, capture devices, etc. so apps could
> >>>> negotiate a location among themselves.  This patch seems to be a step
> >>>> towards that in a way, but I agree it would be counterproductive if a
> >>>> bunch of devices that were using the same underlying system memory ended
> >>>> up each getting their own heap ID just because they used some SW
> >>>> framework that worked that way.
> >>>>
> >>>> Would appreciate it if you could send along a pointer to your BoF if it
> >>>> happens!
> >>>
> >>> Here is it:
> >>>
> >>> https://linuxplumbersconf.org/event/7/contributions/818/
> >>>
> >>> It would be great to see you there and discuss this,
> >>> given I was hoping we could talk about how to meet a
> >>> userspace allocator library expectations as well.
> >>
> >> Thanks!  I hadn't registered for LPC and it looks like it's sold out,
> >> but I'll try to watch the live stream.
> >>
> >> This is very interesting, in that it looks like we're both trying to
> >> solve roughly the same set of problems but approaching it from different
> >> angles.  From what I gather, your approach is that a "heap" encompasses
> >> all the allocation constraints a device may have.
> >>
> >> The approach Simon Ser and I are tossing around so far is somewhat
> >> different, but may potentially leverage dma-buf heaps a bit as well.
> >>
> >> Our approach looks more like what I described at XDC a few years ago,
> >> where memory constraints for a given device's usage of an image are
> >> exposed up to applications, which can then somehow perform boolean
> >> intersection/union operations on them to arrive at a common set of
> >> constraints that describe something compatible with all the devices &
> >> usages desired (or fail to do so, and fall back to copying things around
> >> presumably).  I believe this is more flexible than your initial proposal
> >> in that devices often support multiple usages (E.g., different formats,
> >> different proprietary layouts represented by format modifiers, etc.),
> >> and it avoids adding a combinatorial number of heaps to manage that.
> >>
> >> In my view, heaps are more like blobs of memory that can be allocated
> >> from in various different ways to satisfy constraints.  I realize heaps
> >> mean something specific in the dma-buf heap design (specifically,
> >> something closer to an association between an "allocation mechanism" and
> >> "physical memory"), but I hope we don't have massive heap/allocator
> >> mechanism proliferation due to constraints alone.  Perhaps some
> >> constraints, such as contiguous memory or device-local memory, are
> >> properly expressed as a specific heap, but consider the proliferation
> >> implied by even that simple pair of examples: How do you express
> >> contiguous device-local memory?  Do you need to spawn two heaps on the
> >> underlying device-local memory, one for contiguous allocations and one
> >> for non-contiguous allocations?  Seems excessive.
> >>
> >> Of course, our approach also has downsides and is still being worked on.
> >>    For example, it works best in an ideal world where all the allocators
> >> available understand all the constraints that exist.
> > 
> > Shouldn't allocators be decoupled of constraints ? In my imagination I
> > see devices exposing constraints, and allocators exposing parameters,
> > with a userspace library to reconcile the constraints and produce
> > allocator parameters from them.
> 
> Perhaps another level of abstraction would help.  I'll have to think 
> about that.
> 
> However, as far as I can tell, it wouldn't remove the need to 
> communicate a lot of constraints from multiple engines/devices/etc. to 
> the allocator (likely a single allocator.  I'd be interested to know if 
> anyone has a design that effectively uses multiple allocators to satisfy 
> a single allocation request, but I haven't come up with a good one) 
> somehow.  Either the constraints are directly used as the parameters, or 
> there's a translation/second level of abstraction, but either way much 
> of the information needs to make it to the allocator, or represent the 
> need to use a particular allocator.  Simple things like pitch and offset 
> alignment can be done without help from a kernel-level allocator, but 
> others such as cache coherency, physical memory bank placement, or 
> device-local memory will need to make it all the way down to the kernel 
> some how I believe.

I fully agree that we'll need kernel support, but I don't think the
constraints reporting API and the allocator API need to speak the same
language. For instance, drivers will report alignment constraints, the
userspace allocator library will translate that to a pitch value, and
pass it to the allocator as an allocation parameter. The allocator won't
know about alignment constraints. That's a simple example, let's see how
it turns out with more complex constraints. With a centralized userspace
library we have the ability to decouple the two sides, which I believe
can be useful to keep the complexity of constraints and allocation
parameters (as) low (as possible).

> >> Dealing with a
> >> reality where there are probably a handful of allocators, another
> >> handful of userspace libraries and APIs, and still more applications
> >> trying to make use of all this is one of the larger remaining challenges
> >> of the design.
> >>
> >> We'll present our work at XDC 2020.  Hope you can check that out as well!
> >>
> >>>>> 1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/
> >>>>>
> >>>>>> Given Plumbers is just a couple weeks from now, I've submitted
> >>>>>> a BoF proposal to discuss this, as perhaps it would make
> >>>>>> sense to discuss this live?
> >>>>>>
> >>>>>> Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > 

-- 
Regards,

Laurent Pinchart
