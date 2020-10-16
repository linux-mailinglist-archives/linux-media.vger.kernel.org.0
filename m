Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458FB290C0D
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 21:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409069AbgJPTEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 15:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407907AbgJPTEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 15:04:06 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD8C0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 12:04:05 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id s21so3620099oij.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IDGiTqL122cqbXZ5gmkVRBP3kDwxXwWxYEu+99pwLt8=;
        b=Vu3mPMHF4DBQL4kRlIWhIl9ji8RQex+xp7zFTvbtx9Zh3wWBCGFoYeL/7r0Hwx7EEm
         ek/hS1ud5mnmbehUUkObdzbIdX1ck0whwPXMxyA+pc4U2Po7VQFjq76x7YeoaqZ4xAFJ
         mwF4zceOwX+zbQMCOYexMBUOltu9uBPnMBcKiz318natkpmKGrWTqxNZ5Kkiu5RJurMu
         G/iH5A/kDsU0spCOTx5TFbopILA7+8QBYCiLHYfxxrGaW08UxWy4D6M49AWqht3kleGc
         lWN6yRRg3N3kw1bDIyIRC8GWZYDYuXhfaMzjmSt5arM4Ogx55jg+MJ5wQfQvit3Fy1Q6
         4vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IDGiTqL122cqbXZ5gmkVRBP3kDwxXwWxYEu+99pwLt8=;
        b=J9V4Di57155362R49I7QlmA7ZwLswft/4Gbq/N8F/u597ei2GHPqKO7JSICqobn2Tf
         2XkREGcuYX4ubuSen1ncqVL6gol+Qhbbv7uQ+oOjBb2YHBtU8DLmoiU8p1v2SMnvphiz
         ynmym1+UtCpDLphcSC+uk071i7J16YaUu/5m1oy01T2/BBsvqw2teEkGK3efwm7M92Yl
         luCSwdvVWqkLqWnrU6Ul0/A9Yt9ILCcru2KJpLDxg9Mmj4iWNiPM83U6u45uEEnjjube
         1QSGD6vga+SVRz/XaYx5hiPf7l65SiwnnI5l46+TDWXehov9yKzZ6xUKjD/LnT5LM6Te
         H5Ag==
X-Gm-Message-State: AOAM531SiWUYzdiXLHYXjkCYwaBQJ5qxWObEe4bIzLwJZ2gVRe3E0O3E
        MA6k5+Z3SXujIpHdxp5Gescqn+3WQgYyGjLn6fXtTg==
X-Google-Smtp-Source: ABdhPJyCT4CFxxioZ0RKc9SGkaYU2J4oKTJezbHz1a5Jln7LGJyPN5dehP917sAYUY6hvIpgxqdn6fwmIVzzFsccKtw=
X-Received: by 2002:aca:3341:: with SMTP id z62mr3245667oiz.169.1602875044682;
 Fri, 16 Oct 2020 12:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org> <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 16 Oct 2020 12:03:52 -0700
Message-ID: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > @@ -215,8 +236,12 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
> >       struct page **pages = vmalloc(sizeof(struct page *) * npages);
> >       struct page **tmp = pages;
> >       struct sg_page_iter piter;
> > +     pgprot_t pgprot = PAGE_KERNEL;
> >       void *vaddr;
> >
> > +     if (buffer->uncached)
> > +             pgprot = pgprot_writecombine(PAGE_KERNEL);
>
> I think this should go after the 'if (!pages)' check. Best to get the
> allocation failure check as close to the allocation as possible IMO.

Sounds good. Changed in my tree.

> > @@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
> >               /* just return, as put will call release and that will free */
> >               return ret;
> >       }
> > +
> > +     /*
> > +      * For uncached buffers, we need to initially flush cpu cache, since
> > +      * the __GFP_ZERO on the allocation means the zeroing was done by the
> > +      * cpu and thus it is likely cached. Map (and implicitly flush) it out
> > +      * now so we don't get corruption later on.
> > +      */
> > +     if (buffer->uncached)
> > +             dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
>
> Do we have to keep this mapping around for the entire lifetime of the
> buffer?

Yea, I guess we can just map and unmap it right there.  It will look a
little absurd, but that sort of aligns with your next point.

> Also, this problem (and solution) keeps lingering around. It really
> feels like there should be a better way to solve "clean the linear
> mapping all the way to DRAM", but I don't know what that should be.

Yea, something better here would be nice...


> > @@ -426,6 +487,16 @@ static int system_heap_create(void)
> >       if (IS_ERR(sys_heap))
> >               return PTR_ERR(sys_heap);
> >
> > +     exp_info.name = "system-uncached";
> > +     exp_info.ops = &system_uncached_heap_ops;
> > +     exp_info.priv = NULL;
> > +
> > +     sys_uncached_heap = dma_heap_add(&exp_info);
> > +     if (IS_ERR(sys_uncached_heap))
> > +             return PTR_ERR(sys_heap);
> > +
>
> In principle, there's a race here between the heap getting registered
> to sysfs and the dma_mask getting updated.
>
> I don't think it would cause a problem in practice, but with the API
> as it is, there's no way to avoid it - so I wonder if the
> dma_heap_get_dev() accessor isn't the right API design.

Hrm.  I guess to address your concern we would need split
dma_heap_add() into something like:
  dma_heap_create()
  dma_heap_add()

Which breaks the creation of the heap with the registering it to the
subsystem, so some attributes can be tweaked inbetween?

I'll see about taking a stab at this, but I'll probably submit my
updated series sooner with this un-addressed so I can get some further
review.

thanks
-john
