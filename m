Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA692F5D9B
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 10:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbhANJbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 04:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbhANJbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 04:31:24 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC495C061575
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 01:30:43 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id w3so4589542otp.13
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 01:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fFa2b7jY6SK0DVENMGG3y7udUEVcyGK8UAxCA06hl6o=;
        b=MLFSxyYerMbAhsq0Hqwo+AjV/ypxsNn143sl93yWLnZex7sSPPUWLJ3jWbdOxEBXlF
         FE8tzE1N0iaycdqce6c9PiVqIC+kfUYF9D2XJAWvbBY5LyfD06vb64k65j+MzG3EIF44
         Wgz/E7FFps8nCbHMPyvwpQGLEM75s3X/G4apk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFa2b7jY6SK0DVENMGG3y7udUEVcyGK8UAxCA06hl6o=;
        b=ny3Ei3UKOyrbDVZNusm/CTbqEBtqfBCuPXU5/u1r6l/bDwA6me+2dGgrAdBjaVYYgj
         aOsjujIo17CR7Ldh082xkdHAS/Tife+qukFHytWvul3Mh9BqKQDH3FbPqR3TTP5zjGwG
         vzFQ23U3Zc1UeVs5CPrfwRkhURI3r2x+ZNuJvx+EWFq6Q3ZjfjlLJiOfKqSfrkv3ZdU6
         wlhgRLw/c/SjK3LKuWz7R2VvZz/9LoWCe0rzUlWAunjA+dlidZf7++zuJPI11HKXWJJO
         vzKFqC3vU++hUlHOR9FoEBhJIMTStoXF4MYvMetq0IdPUP34RVuLQe+oAlIly2h8zHf9
         Ekbw==
X-Gm-Message-State: AOAM533xOrvFwy1xWcYIXWgw/jO2FudiqfsR9Nw7R1Cm7u8ZO6Le+nqk
        6nM768Wi8tziTVb3gGg+isDd226WkuV+IuomNBXRpe8yo7iZYg==
X-Google-Smtp-Source: ABdhPJw2LTqNAW3RwduC6zKVj5hub+pGYMgA44nEqq+R0Id0O/Pb0/joilsy80BLKujgrXyKKwdAWks5x5wtOwiCm5w=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr4089555otb.281.1610616643262;
 Thu, 14 Jan 2021 01:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
 <161057213487.6195.581396740566956696@build.alporthouse.com>
 <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com> <161061619887.19482.10606780107376365239@build.alporthouse.com>
In-Reply-To: <161061619887.19482.10606780107376365239@build.alporthouse.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 14 Jan 2021 10:30:32 +0100
Message-ID: <CAKMK7uE58dJabnaTNgePTyio_JY3=kvFZtu1RT1eFeGDK76ZeA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 10:23 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2021-01-14 09:02:57)
> > On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Quoting Daniel Vetter (2021-01-13 20:50:11)
> > > > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > >
> > > > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > > > We have too many people abusing the struct page they can get at but
> > > > > > really shouldn't in importers. Aside from that the backing page might
> > > > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > > > completely. Importers really must go through the proper interface like
> > > > > > dma_buf_mmap for everything.
> > > > >
> > > > > If the exporter doesn't want to expose the struct page, why are they
> > > > > setting it in the exported sg_table?
> > > >
> > > > You need to store it somewhere, otherwise the dma-api doesn't work.
> > > > Essentially this achieves clearing/resetting the struct page pointer,
> > > > without additional allocations somewhere, or tons of driver changes
> > > > (since presumably the driver does keep track of the struct page
> > > > somewhere too).
> > >
> > > Only for mapping, and that's before the export -- if there's even a
> > > struct page to begin with.
> > >
> > > > Also as long as we have random importers looking at struct page we
> > > > can't just remove it, or crashes everywhere. So it has to be some
> > > > debug option you can disable.
> > >
> > > Totally agreed that nothing generic can rely on pages being transported
> > > via dma-buf, and memfd is there if you do want a suitable transport. The
> > > one I don't know about is dma-buf heap, do both parties there consent to
> > > transport pages via the dma-buf? i.e. do they have special cases for
> > > import/export between heaps?
> >
> > heaps shouldn't be any different wrt the interface exposed to
> > importers. Adding John just in case I missed something.
> >
> > I think the only problem we have is that the first import for ttm
> > simply pulled out the struct page and ignored the sgtable otherwise,
> > then that copypasted to places and we're still have some of that left.
> > Although it's a lot better. So largely the problem is importers being
> > a bit silly.
> >
> > I also think I should change the defaulty y to default y if
> > DMA_API_DEBUG or something like that, to make sure it's actually
> > enabled often enough.
>
> It felt overly draconian, but other than the open question of dma-buf
> heaps (which I realise that we need some CI coverage for), I can't
> think of a good reason to argue for hiding a struct page transport
> within dma-buf.

Yeah there's the occasional idea floating around to split sgtable into
the page and the dma side completely. But aside from the bikeshed no
one volunteered for the massive amount of work rolling that out would
mean, so I'm trying to go with a cheap trick here meanwhile.

> The only other problem I see with the implementation is that there's
> nothing that says that each dmabuf->ops->map_dma_buf() returns a new
> sg_table, so we may end up undoing the xor. Or should each dma-buf
> return a fresh dma-mapping for iommu isolation?

Maybe I screwed it up, but that's why I extracted the little helpers:
We scramble when we get the sgtable from exporter, and unscramble
before we pass it back. dma-buf.c does some caching and will hand back
the same sgtable, but for that case we don't re-scramble.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
