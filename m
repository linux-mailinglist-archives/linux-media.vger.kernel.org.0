Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB7E5D379
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfGBPtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:39 -0400
Received: from foss.arm.com ([217.140.110.172]:52344 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbfGBPtj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:49:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22AF128;
        Tue,  2 Jul 2019 08:49:38 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFEAD3F246;
        Tue,  2 Jul 2019 08:49:35 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] Support for TI Page-based Address Translator
To:     "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Tero Kristo <t-kristo@ti.com>,
        William Mills <wmills@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20190607193523.25700-1-afd@ti.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <f706bfe0-fdf6-afdd-fea7-13b78b16cdee@arm.com>
Date:   Tue, 2 Jul 2019 16:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607193523.25700-1-afd@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2019 20:35, Andrew F. Davis wrote:
> Hello all,
> 
> So I've got a new IP on our new SoC I'm looking to make use of and would
> like some help figuring out what framework best matches its function. The
> IP is called a "Page-based Address Translator" or PAT. A PAT instance
> (there are 5 of these things on our J721e device[0]) is basically a
> really simple IOMMU sitting on the interconnect between the device bus
> and what is effectively our northbridge called
> MSMC (DRAM/SRAM/L3-Cache/Coherency controller).
> 
> Simplified it looks about like this:
> 
>           CPUs
>            |
> DRAM --- MSMC --- SRAM/L3
>            |
>          NAVSS - (PATs)
>            |
>    --- Device Bus ---------
>   |      |      |          |
> Device  Device  Device   etc..
> 
> Each PAT has a set a window in high memory (about 0x48_0000_0000 area)
> for which any transaction with an address targeting its window will be
> routed into that PAT. The PAT then does a simple calculation based on
> the how far into the window the address is and the current page size,
> does a lookup to an internally held table of translations, then sends the
> transaction back out on the interconnect with a new address. Usually this
> address should be towards somewhere in DRAM, but can be some other device
> or even back into PAT (I'm not sure there is a valid use-case for this
> but just a point of interest).
> 
> My gut reaction is that this is an IOMMU which belongs in the IOMMU
> subsystem. But there are a couple oddities that make me less sure it is
> really suitable for the IOMMU framework. First it doesn't sit in front of
> any devices, it sits in front of *all* devices, this means we would have
> every device claim it as an IOMMU parent, even though many devices also
> have a traditional IOMMU connected. Second, there is only a limited
> window of address space per PAT, this means we will get fragmentation and
> allocation failures on occasion, in this way it looks to me more like AGP
> GART. Third, the window is in high-memory, so unlike some IOMMU devices
> which can be used to allow DMA to high-mem from low-mem only devices, PAT
> can't be used for that. Lastly it doesn't provide any isolation, if the
> access does not target the PAT window it is not used (that is not to say
> we don't have isolation, just that it is taken care of by other parts of
> the interconnect).
> 
> This means, to me, that PAT has one main purpose: making
> physically-contiguous views of scattered pages in system memory for DMA.
> But it does that really well, the whole translation table is held in a
> PAT-internal SRAM giving 1 bus cycle latency and at full bus bandwidth.
> 
> So what are my options here, is IOMMU the right way to go or not?

FWIW, that sounds almost exactly like my (vague) understanding of other 
GARTs, and as such should be pretty well manageable via the IOMMU API - 
we already have tegra-gart, for example. The aperture contention issue 
could certainly be mitigated by letting the firmware claim it's only 
associated with the display and any other devices which really need it.

A further interesting avenue of investigation - now that Christoph's 
recent work has made it much more possible - would be a second set of 
IOMMU DMA ops tailored for "GART-like" domains where force_aperture=0, 
which could behave as dma-direct wherever possible and only use IOMMU 
remaps when absolutely necessary.

Robin.

> Looking around the kernel I also see the char dev ARP/GART interface
> which looks like a good fit, but also looks quite dated and my guess
> deprecated at this point. Moving right along..
> 
> Another thing I saw is we have the support upstream of the DMM device[1]
> available in some OMAPx/AM57x SoCs. I'm a little more familiar with this
> device. The DMM is a bundle of IPs and in fact one of them is called
> "PAT" and it even does basically the same thing this incarnation of "PAT"
> does. It's upstream integration design is a bit questionable
> unfortunately, the DMM support was integrated into the OMAPDRM display
> driver, which does make some sense then given its support for rotation
> (using TILER IP contained in DMM). The issue with this was that the
> DMM/TILER/PAT IP was not part of the our display IP, but instead out at
> the end of the shared device bus, inside the external memory controller.
> Like this new PAT this meant that any IP that could make use of it, but
> only the display framework could actually provide buffers backed by it.
> This meant, for instance, if we wanted to decode some video buffer using
> our video decoder we would have to allocate from DRM framework then pass
> that over to the V4L2 system. This doesn't make much sense and required
> the user-space to know about this odd situation and allocate from the
> right spot or else have to use up valuable CMA space or waste memory with
> dedicated carveouts.
> 
> Another idea would be to have this as a special central allocator
> (exposed through DMA-BUF heaps[2] or ION) that would give out normal
> system memory as a DMA-BUF but remap it with PAT if a device that only
> supports contiguous memory tries to attach/map that DMA-BUF.
> 
> One last option would be to allow user-space to choose to make the buffer
> contiguous when it needs. That's what the driver in this series allows.
> We expose a remapping device, user-space passes it a non-contiguous
> DMA-BUF handle and it passes a contiguous one back. Simple as that.
> 
> So how do we use this, lets take Android for example, we don't know at
> allocation time if a rendering buffer will end up going back into the GPU
> for further processing, or if it will be consumed directly by the display.
> This is a problem for us as our GPU can work with non-contiguous buffers
> but our display cannot, so any buffers that could possibly go to the
> display at some point currently needs to be allocated as contiguous from
> the start, this leads to a lot of unneeded use of carveout/CMA memory.
> With this driver on the other hand, we allocate regular non-contiguous
> system memory (again using DMA-BUF heaps, but ION could work here too),
> then only when a buffer is about to be sent to the display we pass the
> handle to this DMA-BUF to our driver here and take the handle it gives
> back and pass that to the display instead.
> 
> As said, it is probably not the ideal solution but it does work and was
> used for some early testing of the IP.
> 
> Well, sorry for the wall of text.
> Any and all suggestions very welcome and appreciated.
> 
> Thanks,
> Andrew
> 
> [0] http://www.ti.com/lit/pdf/spruil1
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> [2] https://lkml.org/lkml/2019/6/6/1211
> 
> Andrew F. Davis (2):
>    dt-bindings: soc: ti: Add TI PAT bindings
>    soc: ti: Add Support for the TI Page-based Address Translator (PAT)
> 
>   .../devicetree/bindings/misc/ti,pat.txt       |  34 ++
>   drivers/soc/ti/Kconfig                        |   9 +
>   drivers/soc/ti/Makefile                       |   1 +
>   drivers/soc/ti/ti-pat.c                       | 569 ++++++++++++++++++
>   include/uapi/linux/ti-pat.h                   |  44 ++
>   5 files changed, 657 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/misc/ti,pat.txt
>   create mode 100644 drivers/soc/ti/ti-pat.c
>   create mode 100644 include/uapi/linux/ti-pat.h
> 
