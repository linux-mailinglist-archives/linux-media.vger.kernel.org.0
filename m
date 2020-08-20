Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEAA024C29B
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgHTPyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgHTPyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:54:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B59C061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 08:54:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E3E623D;
        Thu, 20 Aug 2020 17:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597938885;
        bh=9oI6FuASAbP8TVKrjyY8LNZPko28SseKzQQXVNzJl1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=amsyoW3JprmxnZLCIcqEHPilfYcL673ipFbi/pEAB3t+3oBSF7/PsbNa+5brxoqcr
         HV8s+ARb8Z4/MIoUn+PB9ApXGUWvEYtKX4wYlS1LD7lZP/Zsn2IfkQ87Kxlla9iO0m
         diNWJV6eXh45l943n56lFlzqNn5A1NyoTXmezJD0=
Date:   Thu, 20 Aug 2020 18:54:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        James Jones <jajones@nvidia.com>, kernel@collabora.com
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200820155427.GV6593@pendragon.ideasonboard.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
 <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Aug 20, 2020 at 05:36:40AM -0300, Ezequiel Garcia wrote:
> Hi John,
> 
> Thanks a ton for taking the time
> to go thru this.
> 
> On Mon, 2020-08-17 at 21:13 -0700, John Stultz wrote:
> > On Sun, Aug 16, 2020 at 10:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> > > which will allocate memory suitable for the given device.
> > > 
> > > The implementation is mostly a port of the Contiguous Videobuf2
> > > memory allocator (see videobuf2/videobuf2-dma-contig.c)
> > > over to the DMA-BUF Heap interface.
> > > 
> > > The intention of this allocator is to provide applications
> > > with a more system-agnostic API: the only thing the application
> > > needs to know is which device to get the buffer for.
> > > 
> > > Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> > > is unknown to the application.
> > 
> > My hesitancy here is that the main reason we have DMA BUF Heaps, and
> > ION before it, was to expose different types of memory allocations to
> > userspace. The main premise that often these buffers are shared with
> > multiple devices, which have differing constraints and it is userspace
> > that best understands the path a buffer will take through a series of
> > devices. So userspace is best positioned to determine what type of
> > memory should be allocated to satisfy the various devices constraints
> > (there were some design attempts to allow DMA BUFs to use multiple
> > attach with deferred alloc at map time to handle this constraint
> > solving in-kernel, but it was never adopted in practice).
> > 
> > This however, requires some system specific policy - implemented in
> > the Android userspace by gralloc which maps "usage" types (device
> > pipeline flows) to heaps. I liken it to fstab, which helps map mount
> > points to partitions - it's not going to be the same on every system.
> > 
> > What you seem to be proposing seems a bit contrary to this premise -
> > Userland doesn't know what type of memory it needs, but given a device
> > can somehow find the heap it should allocate for? This seems to assume
> > the buffer is only to be used with a single device?
> 
> Single-device usage wasn't the intention. I see now that this patch
> looks too naive and it's confusing. The idea is of course to get buffers
> that can be shared.
> 
> I'm thinking you need to share your picture buffer with a decoder,
> a renderer, possibly something else. Each with its own set
> of constraints and limitations.	
> 
> Of course, a buffer that works for device A may be unsuitable for
> device B and so this per-device heap is surely way too naive.
> 
> As you rightly mention, the main intention of this RFC is to
> question exactly the current premise: "userspace knows".
> I fail to see how will (generic and system-agnostic) applications
> know which heap to use.
> 
> Just for completion, let me throw a simple example: i.MX 8M
> and some Rockchip platforms share the same VPU block, except the
> latter have an IOMMU.
> 
> So applications would need to query an iommu presence
> to get buffer from CMA or not.

I don't think we can do this in a system-agnostic way. What I'd like to
see is an API for the kernel to expose opaque constraints for each
device, and a userspace library to reconcile constraints, selecting a
suitable heap, and producing heap-specific parameters for the
allocation.

The constraints need to be transported in a generic way, but the
contents can be opaque for applications. Only the library would need to
interpret them. This can be done with platform-specific code inside the
library. A separate API for the library to interect with the kernel to
further query or negotiate configuration parameters could be part of
that picture.

This would offer standardized APIs to applications (to gather
constraints, pass them to the constraint resolution library, and receive
a heap ID and heap parameters), while still allowing platform-specific
code in userspace.

> > There was at some point a discussion where folks (maybe it was
> > DanielV? I can't remember...) suggested having something like a sysfs
> > device node link from a device to a dma-buf heap chardev. This seems
> > like it would add a similar behavior as what you're proposing, however
> > without adding possibly a ton of new device specific heaps to the
> > /dev/dma_heap/ dir. However, we would potentially need any missing
> > heap types added first.
> > 
> > > I'm not really expecting this patch to be correct or even
> > > a good idea, but just submitting it to start a discussion on DMA-BUF
> > > heap discovery and negotiation.
> > > 
> > > Given Plumbers is just a couple weeks from now, I've submitted
> > > a BoF proposal to discuss this, as perhaps it would make
> > > sense to discuss this live?
> > 
> > I do think it's an interesting idea. I agree that having every driver
> > implement a dmabuf exporter is a bit silly, but I also think Brian's
> > point that maybe we need some drm helper functions that provide
> > similar functionality along with a more standardized device ioctl for
> > single device allocations might be better.
> 
> I'm unsure we should treat single device specially.
>  
> Exposing device limitations and constraints properly,
> allowing some sort of negotation would hopefully solve
> single device and shared requirements.

-- 
Regards,

Laurent Pinchart
