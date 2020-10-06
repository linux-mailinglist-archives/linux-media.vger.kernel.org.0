Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5066285384
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 22:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgJFU4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbgJFU4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 16:56:21 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A21C0613D2
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 13:56:19 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so19684609eja.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
        b=Qfg5p3wmaIK8FSiIu4IdCn4X7nejDPhFFZhUVBVUejoaklw0Xl8abJMx/NPlE+GAYD
         GFFRBTXhLKiSTLhMEWACUyrBty03El/kGu4Ye5XJJWvvK/JT9MZ2EHl/BwOPsWpbvWqd
         6hSErfchiydyFBZt3FeeoxPWw3eNiC6MJ1Mv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
        b=XCx0LRCZ+bi6aVAG8OaOdDjjtdlDP4uQAJHi9kvRdw/19Id61mlm4POn14sUDoooIL
         wvDoHCw5KXpzgPHLixDoIKxHTDDYdryEGh30ssC9gb9C0oofWQm40bD6Q7OKx/JMR02Z
         Dk3dYmEcS/0tKFYb5mfqOsF/+6UODB6fQLOhVICFwy4xWMBximfesSOmUROpDwuDNoez
         Xqy9vyXfR+roKYIbGfqePpf0YePuIiKQvV5DkSMtP8qdQybfezcVE1fDF02wDWVFObNf
         bjax7xg3kyfDzwzIa2xGowOTn+iZVL9myrG4exmU9tJtSuqAmWP9fi/2YzNvrMU1O3ZW
         CEkw==
X-Gm-Message-State: AOAM533GYWkSqShGJJDeceGATjDRlLuBuE8JcLTns9XjHhdnMRNQuamW
        Efzp/FBj2EMQeexamHnFsnKeUijZ3SAokw==
X-Google-Smtp-Source: ABdhPJy2ERLtgLwrhoZqxfzPA+2hphid3GTPb1Q32igDyRl7LXRGtePx2u1Z2HDwdu3jROf9gziu7A==
X-Received: by 2002:a17:906:685a:: with SMTP id a26mr1536399ejs.458.1602017778058;
        Tue, 06 Oct 2020 13:56:18 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id l26sm2837971ejc.96.2020.10.06.13.56.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id n15so9236008wrq.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
X-Received: by 2002:adf:df8e:: with SMTP id z14mr6756108wrl.32.1602017775603;
 Tue, 06 Oct 2020 13:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de>
In-Reply-To: <20201005082629.GA13850@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 6 Oct 2020 22:56:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 5, 2020 at 10:26 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Oct 02, 2020 at 05:50:40PM +0000, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Sep 30, 2020 at 06:09:17PM +0200, Christoph Hellwig wrote:
> > > Add a new API that returns a virtually non-contigous array of pages
> > > and dma address.  This API is only implemented for dma-iommu and will
> > > not be implemented for non-iommu DMA API instances that have to allocate
> > > contiguous memory.  It is up to the caller to check if the API is
> > > available.
> >
> > Would you mind scheding some more light on what made the previous attempt
> > not work well? I liked the previous API because it was more consistent with
> > the regular dma_alloc_coherent().
>
> The problem is that with a dma_alloc_noncoherent that can return pages
> not in the kernel mapping we can't just use virt_to_page to fill in
> scatterlists or mmap the buffer to userspace, but would need new helpers
> and another two methods.
>
> > >  - no kernel mapping or only temporary kernel mappings are required.
> > >    That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
> > >  - a kernel mapping is required for cached and DMA mapped pages, but
> > >    the driver also needs the pages to e.g. map them to userspace.
> > >    In that sense it is a replacement for some aspects of the recently
> > >    removed and never fully implemented DMA_ATTR_NON_CONSISTENT
> >
> > What's the expected allocation and mapping flow with the latter? Would that be
> >
> > pages = dma_alloc_noncoherent(...)
> > vaddr = vmap(pages, ...);
> >
> > ?
>
> Yes.  Witht the vmap step optional for replacements of
> DMA_ATTR_NO_KERNEL_MAPPING, which is another nightmare to deal with.
>
> > Would one just use the usual dma_sync_for_{cpu,device}() for cache
> > invallidate/clean, while keeping the mapping in place?
>
> Yes.  And make sure the API isn't implemented when VIVT caches are
> used, but that isn't really different from the current interface.

Okay, thanks. Let's see if we can make necessary changes to the videobuf2.

+Sergey Senozhatsky for awareness too.

Best regrards,
Tomasz
