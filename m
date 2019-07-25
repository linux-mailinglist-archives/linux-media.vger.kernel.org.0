Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5E755C8
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbfGYRbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:31:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46532 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfGYRbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:31:12 -0400
Received: from [IPv6:2a02:810a:113f:a6c2::355a] (unknown [IPv6:2a02:810a:113f:a6c2::355a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF5E128BC07;
        Thu, 25 Jul 2019 18:31:07 +0100 (BST)
Message-ID: <1564075865.2339.6.camel@collabora.com>
Subject: Re: [PATCH v3 1/2] dma-contiguous: Abstract
 dma_{alloc,free}_contiguous()
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     hch@lst.de, robin.murphy@arm.com,
        Marek Szyprowski <m.szyprowski@samsung.com>, vdumpa@nvidia.com,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>, chris@zankel.net,
        jcmvbkbc@gmail.com, joro@8bytes.org,
        David Woodhouse <dwmw2@infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        sfr@canb.auug.org.au, treding@nvidia.com, keescook@chromium.org,
        iamjoonsoo.kim@lge.com, wsa+renesas@sang-engineering.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, iommu@lists.linux-foundation.org,
        dann.frazier@canonical.com, linux-media@vger.kernel.org,
        hans.verkuil@cisco.com
Date:   Thu, 25 Jul 2019 19:31:05 +0200
In-Reply-To: <20190725165015.GA31961@Asurada-Nvidia.nvidia.com>
References: <20190524040633.16854-1-nicoleotsuka@gmail.com>
         <20190524040633.16854-2-nicoleotsuka@gmail.com>
         <CAAEAJfA+edVLfZzEZe98249Y7NZQFht9185JH21pV10Bq9Wk3w@mail.gmail.com>
         <20190725165015.GA31961@Asurada-Nvidia.nvidia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-07-25 at 09:50 -0700, Nicolin Chen wrote:
> On Thu, Jul 25, 2019 at 01:06:42PM -0300, Ezequiel Garcia wrote:
> > I can't find a way to forward-redirect from Gmail, so I'm Ccing Dafna
> > who found a regression caused by this commit. Dafna, can you give all
> > the details, including the log and how you are reproducing it?
> 
> I saw the conversation there. Sorry for not replying yet.
> May we discuss there since there are full logs available?
> 
> Thanks
> Nicolin
> 

Hi,
I compiled vivid as built-in into the kernel (not as a separate module) for nitrogen8m device (imx8) and
set it to use contig dma for mem_ops by adding the kernel param
vivid.allocators=1,1,...

I use this devicetree patch for the dtb file: https://lkml.org/lkml/2019/7/24/789. Although it should
be the same on any Aarch64 platform.

Then, on the board I run the command:

v4l2-ctl -d3 -v width=2592,height=1944,pixelformat=UYVY,bytesperline=5184 --stream-mmap --stream-to video.UYVY

In every run there is a different crash. Here is one of them: https://pastebin.com/xXgbXMAN

Dafna
> > 
> > 
> > > > On Fri, 24 May 2019 at 01:08, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > 
> > > Both dma_alloc_from_contiguous() and dma_release_from_contiguous()
> > > are very simply implemented, but requiring callers to pass certain
> > > parameters like count and align, and taking a boolean parameter to
> > > check __GFP_NOWARN in the allocation flags. So every function call
> > > duplicates similar work:
> > >   /* A piece of example */
> > >   unsigned long order = get_order(size);
> > >   size_t count = size >> PAGE_SHIFT;
> > >   page = dma_alloc_from_contiguous(dev, count, order, gfp & __GFP_NOWARN);
> > >   [...]
> > >   dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT);
> > > 
> > > Additionally, as CMA can be used only in the context which permits
> > > sleeping, most of callers do a gfpflags_allow_blocking() check and
> > > a corresponding fallback allocation of normal pages upon any false
> > > result:
> > >   /* A piece of example */
> > >   if (gfpflags_allow_blocking(flag))
> > >       page = dma_alloc_from_contiguous();
> > >   if (!page)
> > >       page = alloc_pages();
> > >   [...]
> > >   if (!dma_release_from_contiguous(dev, page, count))
> > >       __free_pages(page, get_order(size));
> > > 
> > > So this patch simplifies those function calls by abstracting these
> > > operations into the two new functions: dma_{alloc,free}_contiguous.
> > > 
> > > As some callers of dma_{alloc,release}_from_contiguous() might be
> > > complicated, this patch just implements these two new functions to
> > > kernel/dma/direct.c only as an initial step.
> > > 
> > > > > > Suggested-by: Christoph Hellwig <hch@lst.de>
> > > > > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > > Changelog
> > > v2->v3:
> > >  * Added missing "static inline" in header file to fix build error.
> > > v1->v2:
> > >  * Added new functions beside the old ones so we can replace callers
> > >    one by one later.
> > >  * Applied new functions to dma/direct.c only, because it's the best
> > >    example caller to apply and should be safe with the new functions.
> > > 
> > >  include/linux/dma-contiguous.h | 11 ++++++++
> > >  kernel/dma/contiguous.c        | 48 ++++++++++++++++++++++++++++++++++
> > >  kernel/dma/direct.c            | 24 +++--------------
> > >  3 files changed, 63 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/include/linux/dma-contiguous.h b/include/linux/dma-contiguous.h
> > > index f247e8aa5e3d..00a370c1c140 100644
> > > --- a/include/linux/dma-contiguous.h
> > > +++ b/include/linux/dma-contiguous.h
> > > @@ -115,6 +115,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
> > >                                        unsigned int order, bool no_warn);
> > >  bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > >                                  int count);
> > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp);
> > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size);
> > > 
> > >  #else
> > > 
> > > @@ -157,6 +159,15 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > >         return false;
> > >  }
> > > 
> > > +static inline
> > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> > > +{
> > > +       return NULL;
> > > +}
> > > +
> > > +static inline
> > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size) { }
> > > +
> > >  #endif
> > > 
> > >  #endif
> > > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > > index b2a87905846d..21f39a6cb04f 100644
> > > --- a/kernel/dma/contiguous.c
> > > +++ b/kernel/dma/contiguous.c
> > > @@ -214,6 +214,54 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > >         return cma_release(dev_get_cma_area(dev), pages, count);
> > >  }
> > > 
> > > +/**
> > > + * dma_alloc_contiguous() - allocate contiguous pages
> > > + * @dev:   Pointer to device for which the allocation is performed.
> > > + * @size:  Requested allocation size.
> > > + * @gfp:   Allocation flags.
> > > + *
> > > + * This function allocates contiguous memory buffer for specified device. It
> > > + * first tries to use device specific contiguous memory area if available or
> > > + * the default global one, then tries a fallback allocation of normal pages.
> > > + */
> > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> > > +{
> > > +       int node = dev ? dev_to_node(dev) : NUMA_NO_NODE;
> > > +       size_t count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > +       size_t align = get_order(PAGE_ALIGN(size));
> > > +       struct cma *cma = dev_get_cma_area(dev);
> > > +       struct page *page = NULL;
> > > +
> > > +       /* CMA can be used only in the context which permits sleeping */
> > > +       if (cma && gfpflags_allow_blocking(gfp)) {
> > > +               align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
> > > +               page = cma_alloc(cma, count, align, gfp & __GFP_NOWARN);
> > > +       }
> > > +
> > > +       /* Fallback allocation of normal pages */
> > > +       if (!page)
> > > +               page = alloc_pages_node(node, gfp, align);
> > > +
> > > +       return page;
> > > +}
> > > +
> > > +/**
> > > + * dma_free_contiguous() - release allocated pages
> > > + * @dev:   Pointer to device for which the pages were allocated.
> > > + * @page:  Pointer to the allocated pages.
> > > + * @size:  Size of allocated pages.
> > > + *
> > > + * This function releases memory allocated by dma_alloc_contiguous(). As the
> > > + * cma_release returns false when provided pages do not belong to contiguous
> > > + * area and true otherwise, this function then does a fallback __free_pages()
> > > + * upon a false-return.
> > > + */
> > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
> > > +{
> > > +       if (!cma_release(dev_get_cma_area(dev), page, size >> PAGE_SHIFT))
> > > +               __free_pages(page, get_order(size));
> > > +}
> > > +
> > >  /*
> > >   * Support for reserved memory regions defined in device tree
> > >   */
> > > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > > index 2c2772e9702a..0816c1e8b05a 100644
> > > --- a/kernel/dma/direct.c
> > > +++ b/kernel/dma/direct.c
> > > @@ -96,8 +96,6 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
> > >  struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> > >                 dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> > >  {
> > > -       unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > -       int page_order = get_order(size);
> > >         struct page *page = NULL;
> > >         u64 phys_mask;
> > > 
> > > @@ -109,20 +107,9 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> > >         gfp |= __dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> > >                         &phys_mask);
> > >  again:
> > > -       /* CMA can be used only in the context which permits sleeping */
> > > -       if (gfpflags_allow_blocking(gfp)) {
> > > -               page = dma_alloc_from_contiguous(dev, count, page_order,
> > > -                                                gfp & __GFP_NOWARN);
> > > -               if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > > -                       dma_release_from_contiguous(dev, page, count);
> > > -                       page = NULL;
> > > -               }
> > > -       }
> > > -       if (!page)
> > > -               page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
> > > -
> > > +       page = dma_alloc_contiguous(dev, size, gfp);
> > >         if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > > -               __free_pages(page, page_order);
> > > +               dma_free_contiguous(dev, page, size);
> > >                 page = NULL;
> > > 
> > >                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
> > > @@ -154,7 +141,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
> > >         if (PageHighMem(page)) {
> > >                 /*
> > >                  * Depending on the cma= arguments and per-arch setup
> > > -                * dma_alloc_from_contiguous could return highmem pages.
> > > +                * dma_alloc_contiguous could return highmem pages.
> > >                  * Without remapping there is no way to return them here,
> > >                  * so log an error and fail.
> > >                  */
> > > @@ -176,10 +163,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
> > > 
> > >  void __dma_direct_free_pages(struct device *dev, size_t size, struct page *page)
> > >  {
> > > -       unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > -
> > > -       if (!dma_release_from_contiguous(dev, page, count))
> > > -               __free_pages(page, get_order(size));
> > > +       dma_free_contiguous(dev, page, size);
> > >  }
> > > 
> > >  void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> > > --
> > > 2.17.1
> > > 
