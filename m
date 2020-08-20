Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8326C24B0DC
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 10:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgHTIPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 04:15:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55392 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgHTIPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 04:15:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 20038299E17
Message-ID: <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     James Jones <jajones@nvidia.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        nd@arm.com
Date:   Thu, 20 Aug 2020 05:15:12 -0300
In-Reply-To: <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
         <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
         <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-08-17 at 20:49 -0700, James Jones wrote:
> On 8/17/20 8:18 AM, Brian Starkey wrote:
> > Hi Ezequiel,
> > 
> > On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
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
> > > 
> > > I'm not really expecting this patch to be correct or even
> > > a good idea, but just submitting it to start a discussion on DMA-BUF
> > > heap discovery and negotiation.
> > > 
> > 
> > My initial reaction is that I thought dmabuf heaps are meant for use
> > to allocate buffers for sharing across devices, which doesn't fit very
> > well with having per-device heaps.
> > 
> > For single-device allocations, would using the buffer allocation
> > functionality of that device's native API be better in most
> > cases? (Some other possibly relevant discussion at [1])
> > 
> > I can see that this can save some boilerplate for devices that want
> > to expose private chunks of memory, but might it also lead to 100
> > aliases for the system's generic coherent memory pool?
> > 
> > I wonder if a set of helpers to allow devices to expose whatever they
> > want with minimal effort would be better.
> 
> I'm rather interested on where this goes, as I was toying with using 
> some sort of heap ID as a basis for a "device-local" constraint in the 
> memory constraints proposals Simon and I will be discussing at XDC this 
> year.  It would be rather elegant if there was one type of heap ID used 
> universally throughout the kernel that could provide a unique handle for 
> the shared system memory heap(s), as well as accelerator-local heaps on 
> fancy NICs, GPUs, NN accelerators, capture devices, etc. so apps could 
> negotiate a location among themselves.  This patch seems to be a step 
> towards that in a way, but I agree it would be counterproductive if a 
> bunch of devices that were using the same underlying system memory ended 
> up each getting their own heap ID just because they used some SW 
> framework that worked that way.
> 
> Would appreciate it if you could send along a pointer to your BoF if it 
> happens!
> 

Here is it:

https://linuxplumbersconf.org/event/7/contributions/818/

It would be great to see you there and discuss this,
given I was hoping we could talk about how to meet a
userspace allocator library expectations as well.

Thanks,
Ezequiel

> Thanks,
> -James
> 
> > Cheers,
> > -Brian
> > 
> > 1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/
> > 
> > > Given Plumbers is just a couple weeks from now, I've submitted
> > > a BoF proposal to discuss this, as perhaps it would make
> > > sense to discuss this live?
> > > 
> > > Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>


