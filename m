Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD90284C41
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 15:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgJFNJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 09:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFNJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 09:09:02 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED7BC0613D1
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 06:09:02 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id q21so12180981ota.8
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UIz7Ad1d8jfXlfMTcB0ZtI9qf0HUQ6fuKIJszWhIC+E=;
        b=LIcR3mxlTUwN2cQS3JOV9OT3XWZSqNM8o2MXOXJGnXBlTjosIunp2xH+4xIx4TFcmX
         bz9ZNBvOE+IWnnYFj2cRXRANjLRbYjiHsrPwgqT5Esz03Yaa5NJcAVZ84y6FBycdg5nl
         9BP1OZjIaAgLdnUyieEXrQHDpl2wkajyftiXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UIz7Ad1d8jfXlfMTcB0ZtI9qf0HUQ6fuKIJszWhIC+E=;
        b=SnHy6xagDD31o0F3C+RR/Y1Sq1iwGlq1m6AItVbdlu1wnWFdZji4/VnLjGuXZ0sa7w
         HouOvNr04vwpy07KqpaGK0rd7qWqy0rNgEeKPpsEMePFn+49oFH/IMoUqig+W6DaOTCx
         3OG6lK/IlAoEY2HOOUpGKygOmrZM6Grzslq6IznT0VTDSqLDmLWXYzqAF0gh6htjugwQ
         nlMLSXb5jJheVZoHOxrYC67NZn7fDhgrK6ntS89pLuRX5n7GONJOzt7TZx6vQwHt9M2t
         jwybJU9v5KnglFiKrSbDbNbJA7UzDeuGT2sJyZeWoTWuJMJYplujuZ2BIkbWMQt29ZU6
         YOuQ==
X-Gm-Message-State: AOAM531n5XWGqsw9gQDWtGVL85oUUg8ZihLyWkUsD5Dpv/39ZN3HxjBE
        qt/S+ODMc72KQq8ScvrUKFII9pATkdp7+vtdz3dU7w==
X-Google-Smtp-Source: ABdhPJzw1inwN+t+5foZtK0ezcoJPSOeTr206jyI3Yd7SrQuqlq6reZ+PEoA/n663vRpZhATnphV37mf6s0WcQ5NNFs=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr2992253otr.281.1601989741473;
 Tue, 06 Oct 2020 06:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca> <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca> <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca> <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
 <20201005234104.GD5177@ziepe.ca> <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
 <20201006122655.GG5177@ziepe.ca>
In-Reply-To: <20201006122655.GG5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Oct 2020 15:08:50 +0200
Message-ID: <CAKMK7uEsVOopEuWrjXOh+pjo=XZXkVf6Y6sC7WD7zr+t=rBdZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 6, 2020 at 2:26 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Oct 06, 2020 at 08:23:23AM +0200, Daniel Vetter wrote:
> > On Tue, Oct 6, 2020 at 1:41 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:
> > >
> > > > > iow I think I can outright delete the frame vector stuff.
> > > >
> > > > Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> > > > which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> > > > not a carveout, we can't get the pages.
> > >
> > > If CMA memory has struct pages it probably should be mmap'd with
> > > different flags, and the lifecycle of the CMA memory needs to respect
> > > the struct page refcount?
> >
> > I guess yes and no. The problem is if there's pagecache in the cma
> > region, pup(FOLL_LONGTERM) needs to first migrate those pages out of
> > the cma range. Because all normal page allocation in cma regions must
> > be migratable at all times.
>
> Eh? Then how are we doing follow_pfn() on this stuff and not being
> completely broken?
>
> The entire point of this framevec API is to pin the memory and
> preventing it from moving around.
>
> Sounds like it is fundamentally incompatible with CMA. Why is
> something trying to mix the two?

I think the assumption way back when this started is that any VM_IO |
VM_PFNMAP vma is perma-pinned because it's just a piece of carveout.
Of course this ignored that it could also be a piece of iomem and
peer2peer dma doens't Just Work, so could result in all kinds of
hilarity and hw exceptions. But no leaks. Well, if you assume that the
ownership of a device never changes after you've booted the system.

But now we have dynamic gpu memory management, a bunch of subsystems
that fully support revoke semantics (in a subsystem specific way), and
CMA trying really hard to make the old carveouts useable for the
system at large when the memory isn't needed by the device. So all
these assumptions behind follow_pfn are out of the window, and
follow_pfn is pretty much broken.

What's worse I noticed that even for static pfnmaps (for userspace
drivers) we now revoke access to those mmaps. For example implemented
for /dev/mem in 3234ac664a87 ("/dev/mem: Revoke mappings when a driver
claims the region"). Which means follow_pfn isn't even working
correctly anymore for that case, and it's all pretty much broken.

> > This is actually worse than the gpu case I had in mind, where at most
> > you can sneak access other gpu buffers. With cma you should be able to
> > get at arbitrary pagecache (well anything that's GFP_MOVEABLE really).
> > Nice :-(
>
> Ah, we have a winner :\

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
