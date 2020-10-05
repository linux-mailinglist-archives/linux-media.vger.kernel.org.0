Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E351B2831E8
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgJEI0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:26:32 -0400
Received: from verein.lst.de ([213.95.11.211]:58080 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgJEI0c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 04:26:32 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5D8DD67373; Mon,  5 Oct 2020 10:26:29 +0200 (CEST)
Date:   Mon, 5 Oct 2020 10:26:29 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
Message-ID: <20201005082629.GA13850@lst.de>
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de> <20201002175040.GA1131147@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002175040.GA1131147@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 05:50:40PM +0000, Tomasz Figa wrote:
> Hi Christoph,
> 
> On Wed, Sep 30, 2020 at 06:09:17PM +0200, Christoph Hellwig wrote:
> > Add a new API that returns a virtually non-contigous array of pages
> > and dma address.  This API is only implemented for dma-iommu and will
> > not be implemented for non-iommu DMA API instances that have to allocate
> > contiguous memory.  It is up to the caller to check if the API is
> > available.
> 
> Would you mind scheding some more light on what made the previous attempt
> not work well? I liked the previous API because it was more consistent with
> the regular dma_alloc_coherent().

The problem is that with a dma_alloc_noncoherent that can return pages
not in the kernel mapping we can't just use virt_to_page to fill in
scatterlists or mmap the buffer to userspace, but would need new helpers
and another two methods.

> >  - no kernel mapping or only temporary kernel mappings are required.
> >    That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
> >  - a kernel mapping is required for cached and DMA mapped pages, but
> >    the driver also needs the pages to e.g. map them to userspace.
> >    In that sense it is a replacement for some aspects of the recently
> >    removed and never fully implemented DMA_ATTR_NON_CONSISTENT
> 
> What's the expected allocation and mapping flow with the latter? Would that be
> 
> pages = dma_alloc_noncoherent(...)
> vaddr = vmap(pages, ...);
> 
> ?

Yes.  Witht the vmap step optional for replacements of
DMA_ATTR_NO_KERNEL_MAPPING, which is another nightmare to deal with.

> Would one just use the usual dma_sync_for_{cpu,device}() for cache
> invallidate/clean, while keeping the mapping in place?

Yes.  And make sure the API isn't implemented when VIVT caches are
used, but that isn't really different from the current interface.
