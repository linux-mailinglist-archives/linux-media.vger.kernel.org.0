Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4DB29FC78
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 05:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgJ3EEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 00:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3EEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 00:04:42 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29A6C0613D5
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 21:04:42 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 32so4506060otm.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QbgsLhT6Fyvwnbaijbhr3l5RA06hcZ/IdPt56ssLa8=;
        b=GariH0e4pbsh6GGADmUy/dS2os+uR5r4sOXfanz6DN+7fol5JKiM8tWtLEbf8zgBV7
         2CbQcwrWgKr2vJ11bjvSqQhshoGeY5e0vqec5+fTVIOVHjp10YRzACXkLJ8pU5j+LLJi
         jkWrGT3zvIYVGwD3MsxAr3AiEtcRzd7LFrM4Pj61lhdQf2ZlyRMd/GghvRRIcNDX5AS5
         WUnMDK84ziVUNlRa3ulbRSuAOgwlYl4385elWqjoihZT4dKHd6j5wnHhtY+RCqzTy0cU
         VeE/ZKMq5im3Z3qgeF3HtoYVCllg14h+SWNS5ge/11cQDgvwKYMYi8FAgx8qL+P01K/k
         k7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QbgsLhT6Fyvwnbaijbhr3l5RA06hcZ/IdPt56ssLa8=;
        b=S9A9sY/+LE5pVP6YkAFF17xJf+Dctsa0N76B2rXoVx1GELBSF8Q66Imb/i8euguV6W
         T7K1mFkevqwRnRy0s3pmGoOTYswWyBTWkTFumYBBkBEtIqyOKjM75fEiE+EVeu+3lMNo
         9ObttChTL4PJlsXNaAoEBEmBRAR+n1n5zDMACZc9SFAgP+ZPITAMc5GjW+LDMRN8WOaE
         dFpinwYWVUb8unjSeORc98K5eEeBB9MtXcgW1CSOfFUu2WnYo799dB+B1iTN6YL331Fd
         Sysn3yskXGVKRcjwVrVpAYxRGYl6dgMU/8Ad5nRa6rOQE7Z7kHucCxWP1j6iLGBLZ+qq
         79rQ==
X-Gm-Message-State: AOAM530GnMycgum6cLw6M0nf+bi11NeMOFmG9UQ5UTc6WNkeU/21bGLz
        p5f5jw8JOGx3lukd18CFQCm/xZU20ms0bhrO/qi4wMKxAlDZMA==
X-Google-Smtp-Source: ABdhPJxrCBDhKCig/L03qPCOkK6xkvYmtMRhhDx50CzXEzRfvqmALH8yZdNAOgx9V2zMS9Ca92cGk+lDn4xB8OMhuZ8=
X-Received: by 2002:a05:6830:400c:: with SMTP id h12mr271298ots.102.1604030682075;
 Thu, 29 Oct 2020 21:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201030024746.3128-1-hdanton@sina.com>
In-Reply-To: <20201030024746.3128-1-hdanton@sina.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 21:04:30 -0700
Message-ID: <CALAqxLVqLdvEWH_jz-urLghVN7SbrktyN877A1QH47Hf6mqo3w@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     Hillf Danton <hdanton@sina.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        Christoph Hellwig <hch@infradead.org>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 7:48 PM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 15:28:34 -0700 John Stultz wrote:
> > On Thu, Oct 29, 2020 at 12:10 AM Hillf Danton <hdanton@sina.com> wrote:
> > > On Thu, 29 Oct 2020 00:16:24 +0000 John Stultz wrote:
> > > > @@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > > >       struct sg_page_iter piter;
> > > >       int ret;
> > > >
> > > > +     if (buffer->uncached)
> > > > +             vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > > > +
> > >
> > > Wonder why you turn back to dma_mmap_wc() and friends?
> >
> > Sorry, can you expand on what you are proposing here instead?  I'm not
> > sure I see how dma_alloc/mmap/*_wc() quite fits here.
>
> I just wondered if *_wc() could save you two minutes or three. Can you
> shed some light on your concerns about their unfitness?

Sorry, I feel a bit daft here. I'm still not exactly sure what you're
proposing, and your reply of saving minutes doesn't really clarify
things.
So I'm not sure it's a good use of time to try to (most likely,
incorrectly) refute all the possible things you might be suggesting.
:)

But I'll try to share my thoughts:

So the system heap allows for allocation of non-contiguous buffers
(currently allocated from page_alloc), which we keep track using
sglists.
Since the resulting dmabufs are shared between multiple devices, we
want to provide a *specific type of memory* (in this case
non-contiguous system memory), rather than what the underlying
dma_alloc_attr() allocates for a specific device.

My sense is dma_mmap_wc() likely ought to be paired with switching to
using dma_alloc_wc() as well, which calls down to dma_alloc_attr().
Maybe one could use dma_alloc_attr against the heap device to allocate
chunks that we track in the sglist. But I'm not sure how that saves us
much other than possibly swapping dma_mmap_wc() for remap_pfn_range()?

But again, I suspect I've mischaracterized what you're actually
suggesting. So please let me know what you're thinking and I'm happy
to consider it.

thanks
-john
