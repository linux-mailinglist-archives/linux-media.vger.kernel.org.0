Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B02F75B73
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 01:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfGYXmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 19:42:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33547 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbfGYXmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 19:42:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so23939088plo.0;
        Thu, 25 Jul 2019 16:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2GAKwzMUlP3WmD+pUyDwl1ISawmBP4193MDBqvqYky4=;
        b=nhlQMRV4GLFqDHbvHEVj927TPmOUDzCmyQAOPAhADKYhtD4vUWzxIqr2aX9vAbeZzl
         6UNddx7i8te7kDOGI5lPrVNTDf5YKgXxjfn1frBGFdt59mmme7SyfyGbK4g6Qbfh59Rh
         dmZb7w4twDQA8h23OhYaze90zTj09s1Gqf9xIO6OUAV+6aT34cWLmOPpQvXbwdaj8XQ4
         tpB/rgQ7VXgWieBv8a2/tHguSg58j0XsFK1hiG8GKVx6CcYqBM4/iV2C/SdVAS0GDYgt
         bnVF4Ag/VVGXD4jSolHNLGwZp5VjyCP1+flcLEs62i30q2ztxQUfHQqyQiuUDaEJ8zjF
         nrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2GAKwzMUlP3WmD+pUyDwl1ISawmBP4193MDBqvqYky4=;
        b=grL3ZQpO7aDHHhxttkBe0MwretAcTxWB1bvM8ESRAbVCbKsItDfqq9m/J4YlYZi0HY
         ft+1X4mmLvNtQQB76ClQyGP4zfRdOaylFXJvFDo4QuVkD3DrKPqNiFPSVTmjdmBtd2p6
         14Aa0ez06tp/k1GYkf70/i7JogsPifZV9WpdzlI1F81ygdGObGsMOFlDyDERgUyOg4cm
         TJ/iD9755lp9TjO/oHnnGmU0eqkaBxS2CtD1ydWWxL4KPqVJBynbYl+XXriaLwytbGRL
         zQjFk3ayqX0QL5x6uPuB4AIeI03PkRHyTYalnic9X3u9LCff4JtnDhRu7Rq0wfU921cM
         ZiCw==
X-Gm-Message-State: APjAAAUxSSiJpxU25v0aqc3VoGWMgJlyi1SAyGj6hHrcss5Re7nYvYhy
        x3UjmLt8nsmLwMad2E93WkU=
X-Google-Smtp-Source: APXvYqxmi/FzQIP8qaoABUPm3Xq2BFl14gHU3e414MTPj/K/JgQlbCdKyJCGGx3VBOTmJzmUKQDrtQ==
X-Received: by 2002:a17:902:20ec:: with SMTP id v41mr88146472plg.142.1564098128158;
        Thu, 25 Jul 2019 16:42:08 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id u3sm44695365pjn.5.2019.07.25.16.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 16:42:07 -0700 (PDT)
Date:   Thu, 25 Jul 2019 16:42:51 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, hch@lst.de,
        robin.murphy@arm.com, Marek Szyprowski <m.szyprowski@samsung.com>,
        vdumpa@nvidia.com, Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH v3 1/2] dma-contiguous: Abstract
 dma_{alloc,free}_contiguous()
Message-ID: <20190725234250.GA15714@Asurada-Nvidia.nvidia.com>
References: <20190524040633.16854-1-nicoleotsuka@gmail.com>
 <20190524040633.16854-2-nicoleotsuka@gmail.com>
 <CAAEAJfA+edVLfZzEZe98249Y7NZQFht9185JH21pV10Bq9Wk3w@mail.gmail.com>
 <20190725165015.GA31961@Asurada-Nvidia.nvidia.com>
 <1564075865.2339.6.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564075865.2339.6.camel@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 25, 2019 at 07:31:05PM +0200, Dafna Hirschfeld wrote:
> On Thu, 2019-07-25 at 09:50 -0700, Nicolin Chen wrote:
> > On Thu, Jul 25, 2019 at 01:06:42PM -0300, Ezequiel Garcia wrote:
> > > I can't find a way to forward-redirect from Gmail, so I'm Ccing Dafna
> > > who found a regression caused by this commit. Dafna, can you give all
> > > the details, including the log and how you are reproducing it?
> > 
> > I saw the conversation there. Sorry for not replying yet.
> > May we discuss there since there are full logs available?
> > 
> > Thanks
> > Nicolin
> > 
> 
> Hi,
> I compiled vivid as built-in into the kernel (not as a separate module) for nitrogen8m device (imx8) and
> set it to use contig dma for mem_ops by adding the kernel param
> vivid.allocators=1,1,...
> 
> I use this devicetree patch for the dtb file: https://lkml.org/lkml/2019/7/24/789. Although it should
> be the same on any Aarch64 platform.
> 
> Then, on the board I run the command:
> 
> v4l2-ctl -d3 -v width=2592,height=1944,pixelformat=UYVY,bytesperline=5184 --stream-mmap --stream-to video.UYVY
> 
> In every run there is a different crash. Here is one of them: https://pastebin.com/xXgbXMAN

This probably should be a fix: https://lkml.org/lkml/2019/7/25/1432

I also sent it to you. Would it be possible for you to test it?

Thanks
Nicolin

> 
> Dafna
> > > 
> > > 
> > > > > On Fri, 24 May 2019 at 01:08, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > 
> > > > Both dma_alloc_from_contiguous() and dma_release_from_contiguous()
> > > > are very simply implemented, but requiring callers to pass certain
> > > > parameters like count and align, and taking a boolean parameter to
> > > > check __GFP_NOWARN in the allocation flags. So every function call
> > > > duplicates similar work:
> > > >   /* A piece of example */
> > > >   unsigned long order = get_order(size);
> > > >   size_t count = size >> PAGE_SHIFT;
> > > >   page = dma_alloc_from_contiguous(dev, count, order, gfp & __GFP_NOWARN);
> > > >   [...]
> > > >   dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT);
> > > > 
> > > > Additionally, as CMA can be used only in the context which permits
> > > > sleeping, most of callers do a gfpflags_allow_blocking() check and
> > > > a corresponding fallback allocation of normal pages upon any false
> > > > result:
> > > >   /* A piece of example */
> > > >   if (gfpflags_allow_blocking(flag))
> > > >       page = dma_alloc_from_contiguous();
> > > >   if (!page)
> > > >       page = alloc_pages();
> > > >   [...]
> > > >   if (!dma_release_from_contiguous(dev, page, count))
> > > >       __free_pages(page, get_order(size));
> > > > 
> > > > So this patch simplifies those function calls by abstracting these
> > > > operations into the two new functions: dma_{alloc,free}_contiguous.
> > > > 
> > > > As some callers of dma_{alloc,release}_from_contiguous() might be
> > > > complicated, this patch just implements these two new functions to
> > > > kernel/dma/direct.c only as an initial step.
> > > > 
> > > > > > > Suggested-by: Christoph Hellwig <hch@lst.de>
> > > > > > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > > ---
> > > > Changelog
> > > > v2->v3:
> > > >  * Added missing "static inline" in header file to fix build error.
> > > > v1->v2:
> > > >  * Added new functions beside the old ones so we can replace callers
> > > >    one by one later.
> > > >  * Applied new functions to dma/direct.c only, because it's the best
> > > >    example caller to apply and should be safe with the new functions.
> > > > 
> > > >  include/linux/dma-contiguous.h | 11 ++++++++
> > > >  kernel/dma/contiguous.c        | 48 ++++++++++++++++++++++++++++++++++
> > > >  kernel/dma/direct.c            | 24 +++--------------
> > > >  3 files changed, 63 insertions(+), 20 deletions(-)
> > > > 
> > > > diff --git a/include/linux/dma-contiguous.h b/include/linux/dma-contiguous.h
> > > > index f247e8aa5e3d..00a370c1c140 100644
> > > > --- a/include/linux/dma-contiguous.h
> > > > +++ b/include/linux/dma-contiguous.h
> > > > @@ -115,6 +115,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
> > > >                                        unsigned int order, bool no_warn);
> > > >  bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > > >                                  int count);
> > > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp);
> > > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size);
> > > > 
> > > >  #else
> > > > 
> > > > @@ -157,6 +159,15 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > > >         return false;
> > > >  }
> > > > 
> > > > +static inline
> > > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> > > > +{
> > > > +       return NULL;
> > > > +}
> > > > +
> > > > +static inline
> > > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size) { }
> > > > +
> > > >  #endif
> > > > 
> > > >  #endif
> > > > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > > > index b2a87905846d..21f39a6cb04f 100644
> > > > --- a/kernel/dma/contiguous.c
> > > > +++ b/kernel/dma/contiguous.c
> > > > @@ -214,6 +214,54 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> > > >         return cma_release(dev_get_cma_area(dev), pages, count);
> > > >  }
> > > > 
> > > > +/**
> > > > + * dma_alloc_contiguous() - allocate contiguous pages
> > > > + * @dev:   Pointer to device for which the allocation is performed.
> > > > + * @size:  Requested allocation size.
> > > > + * @gfp:   Allocation flags.
> > > > + *
> > > > + * This function allocates contiguous memory buffer for specified device. It
> > > > + * first tries to use device specific contiguous memory area if available or
> > > > + * the default global one, then tries a fallback allocation of normal pages.
> > > > + */
> > > > +struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> > > > +{
> > > > +       int node = dev ? dev_to_node(dev) : NUMA_NO_NODE;
> > > > +       size_t count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > > +       size_t align = get_order(PAGE_ALIGN(size));
> > > > +       struct cma *cma = dev_get_cma_area(dev);
> > > > +       struct page *page = NULL;
> > > > +
> > > > +       /* CMA can be used only in the context which permits sleeping */
> > > > +       if (cma && gfpflags_allow_blocking(gfp)) {
> > > > +               align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
> > > > +               page = cma_alloc(cma, count, align, gfp & __GFP_NOWARN);
> > > > +       }
> > > > +
> > > > +       /* Fallback allocation of normal pages */
> > > > +       if (!page)
> > > > +               page = alloc_pages_node(node, gfp, align);
> > > > +
> > > > +       return page;
> > > > +}
> > > > +
> > > > +/**
> > > > + * dma_free_contiguous() - release allocated pages
> > > > + * @dev:   Pointer to device for which the pages were allocated.
> > > > + * @page:  Pointer to the allocated pages.
> > > > + * @size:  Size of allocated pages.
> > > > + *
> > > > + * This function releases memory allocated by dma_alloc_contiguous(). As the
> > > > + * cma_release returns false when provided pages do not belong to contiguous
> > > > + * area and true otherwise, this function then does a fallback __free_pages()
> > > > + * upon a false-return.
> > > > + */
> > > > +void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
> > > > +{
> > > > +       if (!cma_release(dev_get_cma_area(dev), page, size >> PAGE_SHIFT))
> > > > +               __free_pages(page, get_order(size));
> > > > +}
> > > > +
> > > >  /*
> > > >   * Support for reserved memory regions defined in device tree
> > > >   */
> > > > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > > > index 2c2772e9702a..0816c1e8b05a 100644
> > > > --- a/kernel/dma/direct.c
> > > > +++ b/kernel/dma/direct.c
> > > > @@ -96,8 +96,6 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
> > > >  struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> > > >                 dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> > > >  {
> > > > -       unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > > -       int page_order = get_order(size);
> > > >         struct page *page = NULL;
> > > >         u64 phys_mask;
> > > > 
> > > > @@ -109,20 +107,9 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> > > >         gfp |= __dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> > > >                         &phys_mask);
> > > >  again:
> > > > -       /* CMA can be used only in the context which permits sleeping */
> > > > -       if (gfpflags_allow_blocking(gfp)) {
> > > > -               page = dma_alloc_from_contiguous(dev, count, page_order,
> > > > -                                                gfp & __GFP_NOWARN);
> > > > -               if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > > > -                       dma_release_from_contiguous(dev, page, count);
> > > > -                       page = NULL;
> > > > -               }
> > > > -       }
> > > > -       if (!page)
> > > > -               page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
> > > > -
> > > > +       page = dma_alloc_contiguous(dev, size, gfp);
> > > >         if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > > > -               __free_pages(page, page_order);
> > > > +               dma_free_contiguous(dev, page, size);
> > > >                 page = NULL;
> > > > 
> > > >                 if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
> > > > @@ -154,7 +141,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
> > > >         if (PageHighMem(page)) {
> > > >                 /*
> > > >                  * Depending on the cma= arguments and per-arch setup
> > > > -                * dma_alloc_from_contiguous could return highmem pages.
> > > > +                * dma_alloc_contiguous could return highmem pages.
> > > >                  * Without remapping there is no way to return them here,
> > > >                  * so log an error and fail.
> > > >                  */
> > > > @@ -176,10 +163,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
> > > > 
> > > >  void __dma_direct_free_pages(struct device *dev, size_t size, struct page *page)
> > > >  {
> > > > -       unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> > > > -
> > > > -       if (!dma_release_from_contiguous(dev, page, count))
> > > > -               __free_pages(page, get_order(size));
> > > > +       dma_free_contiguous(dev, page, size);
> > > >  }
> > > > 
> > > >  void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> > > > --
> > > > 2.17.1
> > > > 
