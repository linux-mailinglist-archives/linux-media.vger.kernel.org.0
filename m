Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCD630E50F
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 22:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhBCVm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 16:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhBCVmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 16:42:20 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC916C061573
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 13:41:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z6so961218wrq.10
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 13:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4TI1e7gQdTzltegKMdoZTR4RsT2JvIHbsFUh2uPQzU=;
        b=BWgJOLtrDCoblhxCADfA5HwY5ztg05LdbfMnsPIz4WfJRARQx4tJEbHG07ut8uNwei
         YA8MgKi2Q3kg6ukx8y/T5zKTLrme2FDvRWV4SpjbJ1svYtEfU1tgUfoCVpOxPNgvrbr0
         ZJ6ZZv4OE/mOI6mXWfMv1lvM6ZhISk0nY5h2+xAtEKX9GRBrS/mSI3zLDtkiMNssM4DP
         jgU4l2Jkw/Ii4akKrmYPSBRKA180uhZIXBol+q2DRMOiLT2zKDa6LA+YU2hgnMbnM46M
         bWbbWwIxkNiKgVrZXqn6nyNIXV7AWnBr/oe7ru+KUiRnyqjv8fZryF8bNUL9e788QxWP
         YDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4TI1e7gQdTzltegKMdoZTR4RsT2JvIHbsFUh2uPQzU=;
        b=GnSrgyfkqe/rngCl0vdkBDkZrWF2tnFaqSOAQRctScZGzD4U9d7rC1vZcP8nGxkCt4
         y7icP2ax7ExawwR1GRq55wTOuUHapE78tTueVlZfGutyJb0/Iu6Pf2uqJbnVkJXRanLJ
         rntZKMGoI582zJ34pX+UDBG/FtplBY4hUATPcnj8zZIrJ4XWzOsNkxN/dF75wdY3b/MD
         ssWMwVdmkhtwwnUS0+93IuH9IuN39AnPM7Lx9sSOO4wiZG7pCwNlr8jeU/Duo2W1S1PV
         +maMaCCxDGDCxiW2rlnfo4ab0jHx/TihoL5JX4pGJ7kK/ndiiptZmLQ2FHYKofyHknf4
         VbPg==
X-Gm-Message-State: AOAM532sqT/AQydCIuNITvtdqUfGs6zxf9srtD818uBUWLs/JH2244Te
        SH8tbj45Mg7iuAqRIdIwwEKojzdWVlHx9J9uaBzPKA==
X-Google-Smtp-Source: ABdhPJzzh/22FCOvdxdEB1nz5RwcUyDObG7CumW8G2BNoPbJyps54cEi6LEoHpcOS3UqBhEPnFBnf/YNKMZ2wK03ovA=
X-Received: by 2002:a5d:453b:: with SMTP id j27mr5802147wra.92.1612388498425;
 Wed, 03 Feb 2021 13:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com> <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
In-Reply-To: <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 3 Feb 2021 13:41:26 -0800
Message-ID: <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        James Jones <jajones@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        Minchan Kim <minchan@kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        John Stultz <john.stultz@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 3, 2021 at 1:25 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Feb 3, 2021 at 9:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Wed, Feb 3, 2021 at 9:20 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Wed, Feb 3, 2021 at 12:52 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Wed, Feb 3, 2021 at 2:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > > > > > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > > > > > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > > > > > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > > > > > and get an indication of an error without panicing the kernel.
> > > > > > This will help identifying drivers that need to clear VM_PFNMAP before
> > > > > > using dmabuf system heap which is moving to use vm_insert_page.
> > > > >
> > > > > NACK.
> > > > >
> > > > > The system may not _panic_, but it is clearly now _broken_.  The device
> > > > > doesn't work, and so the system is useless.  You haven't really improved
> > > > > anything here.  Just bloated the kernel with yet another _ONCE variable
> > > > > that in a normal system will never ever ever be triggered.
> > > >
> > > > Also, what the heck are you doing with your drivers? dma-buf mmap must
> > > > call dma_buf_mmap(), even for forwarded/redirected mmaps from driver
> > > > char nodes. If that doesn't work we have some issues with the calling
> > > > contract for that function, not in vm_insert_page.
> > >
> > > The particular issue I observed (details were posted in
> > > https://lore.kernel.org/patchwork/patch/1372409) is that DRM drivers
> > > set VM_PFNMAP flag (via a call to drm_gem_mmap_obj) before calling
> > > dma_buf_mmap. Some drivers clear that flag but some don't. I could not
> > > find the answer to why VM_PFNMAP is required for dmabuf mappings and
> > > maybe someone can explain that here?
> > > If there is a reason to set this flag other than historical use of
> > > carveout memory then we wanted to catch such cases and fix the drivers
> > > that moved to using dmabuf heaps. However maybe there are other
> > > reasons and if so I would be very grateful if someone could explain
> > > them. That would help me to come up with a better solution.
> > >
> > > > Finally why exactly do we need to make this switch for system heap?
> > > > I've recently looked at gup usage by random drivers, and found a lot
> > > > of worrying things there. gup on dma-buf is really bad idea in
> > > > general.
> > >
> > > The reason for the switch is to be able to account dmabufs allocated
> > > using dmabuf heaps to the processes that map them. The next patch in
> > > this series https://lore.kernel.org/patchwork/patch/1374851
> > > implementing the switch contains more details and there is an active
> > > discussion there. Would you mind joining that discussion to keep it in
> > > one place?
> >
> > How many semi-unrelated buffer accounting schemes does google come up with?
> >
> > We're at three with this one.
> >
> > And also we _cannot_ required that all dma-bufs are backed by struct
> > page, so requiring struct page to make this work is a no-go.
> >
> > Second, we do not want to all get_user_pages and friends to work on
> > dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
> > exclusively in system memory you can maybe get away with this, but
> > dma-buf is supposed to work in more places than just Android SoCs.
>
> I just realized that vm_inser_page doesn't even work for CMA, it would
> upset get_user_pages pretty badly - you're trying to pin a page in
> ZONE_MOVEABLE but you can't move it because it's rather special.
> VM_SPECIAL is exactly meant to catch this stuff.

Thanks for the input, Daniel! Let me think about the cases you pointed out.

IMHO, the issue with PSS is the difficulty of calculating this metric
without struct page usage. I don't think that problem becomes easier
if we use cgroups or any other API. I wanted to enable existing PSS
calculation mechanisms for the dmabufs known to be backed by struct
pages (since we know how the heap allocated that memory), but sounds
like this would lead to problems that I did not consider.
Thanks,
Suren.

> -Daniel
>
> > If you want to account dma-bufs, and gpu memory in general, I'd say
> > the solid solution is cgroups. There's patches floating around. And
> > given that Google Android can't even agree internally on what exactly
> > you want I'd say we just need to cut over to that and make it happen.
> >
> > Cheers, Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
