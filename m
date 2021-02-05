Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D273107C3
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 10:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhBEJXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 04:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBEJPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 04:15:47 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FE1C061793
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 01:15:07 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id y199so4771685oia.4
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXNMzkZKAQHAIrPBhbAfZJ1F8VP6J4t5+TSc68lOL4Y=;
        b=a+ji2SzyZm3n8vVEHzAMZc8QntIgLAYyHbAXu1DjdIj2YXSB95Kk9f0X7dpvSIMx4b
         ZOgF3PKpF755HKCdIJr6U5t6zLzDDh9y1RUPzOpqu9dSY2DlYKR39mapqWK/IkqzmmOQ
         jhaJmkwjl1dKvNndYYw0eyycjistU6FYnbvB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXNMzkZKAQHAIrPBhbAfZJ1F8VP6J4t5+TSc68lOL4Y=;
        b=emGJ2Zi716eHQ8u2U/na8ZMZhrhBj1up1ZVfM4l037jYgQV+wHeyc9akWsHnkHpojf
         UkD4iJfq2i96bxmHvmfn8Bd5vRP1SQ6nZy8pb4Z43skclzwZQ7VGuqHYM2AQLV6vpJI/
         MmffLUJ2mgsqvIzTyIdwF3fNq7bDDxiK+24+8tM6KyFP7OeyNnAmt/d1OtrUEDzMyvZW
         3IslELVC30YoKHvnEEAUUPSIM3n0CYD4rdL5NKr8HlTMZKKo+LwShu9Hup+xR5IAoCSM
         T/e5JnkTSU/zw+jT2k4za5P14zYilNvIUzZjP5O2OpWhUf6PT+Hk3ePMAJZ6MrNrZiRr
         sJEQ==
X-Gm-Message-State: AOAM531Gr64fFxpCxBsMU1oF57hyaQyFqcaM1hxSqytopIHdEbF+6BDZ
        K94SKdG4woi7oRaxQgSoeh/xMJaiKhb38y3Yv9RYYw==
X-Google-Smtp-Source: ABdhPJxEMaYu1JXRr4pq0v6xG4RV1wNpt4QeaMRtr7VxclNNU/6kd9mpU8CVuZPrSywCRKR/06lHELNic7Bm/GFyf1k=
X-Received: by 2002:aca:df42:: with SMTP id w63mr2473363oig.128.1612516506743;
 Fri, 05 Feb 2021 01:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca> <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca> <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
 <20210204200918.GA4718@ziepe.ca> <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
 <20210204205927.GD4718@ziepe.ca>
In-Reply-To: <20210204205927.GD4718@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 5 Feb 2021 10:14:55 +0100
Message-ID: <CAKMK7uH8yLtdzZkSLEfmbooDJSxaKPLXcHP_-xssJbDZz-eHMw@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 9:59 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 04, 2021 at 09:19:57PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 4, 2021 at 9:09 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:
> > >
> > > > So I think just checking for VM_PFNMAP after the vma is set up should
> > > > be enough to guarantee we'll only have pte_special ptes in there,
> > > > ever. But I'm not sure, this stuff all isn't really documented much
> > > > and the code is sometimes a maze (to me at least).
> > >
> > > Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
> > > check after the VMA is populated
> > >
> > > But how do you stuff special pfns into a VMA outside the fault
> > > handler?
> >
> > Many drivers we have don't have dynamic buffer management (kinda
> > overkill for a few framebuffers on a display-only IP block), so the
> > just remap_pfn_range on ->mmap, and don't have a fault handler at all.
>
> remap_pfn_range() makes sense, do you expect drivers using struct page
> backed memory to call that as well?

All the ones using CMA through dma_alloc_coherent end up in there with
the dma_mmap_wc function. So yeah we have tons already.

The drivers with dynamic memory management all use vm_insert_pfn, even
when the buffer is in system memory and struct page backed. I think
those are the two cases. There's another mmap in drm/i915, but that
should never leave intel-specific userspace, and I think we're also
phasing it out somewhat. Either way, should never show up in a shared
buffer usecase, ever, so I think we can ignore it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
