Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3191286120
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgJGOXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgJGOXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 10:23:08 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0742BC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 07:23:07 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t77so2617725oie.4
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6FRvFu0sftzaO7u7hAn4jdJ4FF4CGkT7QzNcdFtRx0=;
        b=HxN9CeEl6dg2fnJo70BaHxKXccc7EEzG66whVAVFPq4AH9BV/iG5k/B+RBQ74hh3Qh
         vMBh897K/acdcVcspzwrD+Be0V1z7QbLcaLqhtoxu656rcFUTrqE+PYX+Jopp+M50JUE
         1UpmjO7U9bHLA27shpixoevJKUgn1Y0vP2DSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6FRvFu0sftzaO7u7hAn4jdJ4FF4CGkT7QzNcdFtRx0=;
        b=EeMnThiBR2k5J/kUBZ+yq5uJCRqc2JGCcr+bfY+VRxV4jHGH6poNU1uewWG2DAp/bs
         pUfRQD8D+z4UWzQFvjpeMZoIEd+d7IgWtVflLrTzlwxDpMwV1VZv0Ef2Aiz/D1ZJ82N+
         KYG09LUI7z5pDo5GoryPLIPTJVpydEVz1UvBKsQEbisGXdoFq+6U0ECBKFJI6dYEsM1G
         fY7v8hFpKeKG0ZNCAUhKOjV52XjFzrXMEE8tCsC0QOrQh7JcULOfXt+cwVYKssfxIVld
         5OAxcCQUCQvrIhL7lFDEGp/dvX1kPYXsLZy8KZqtICThJle0ECHKHOVpgsLBD68yRert
         OHtA==
X-Gm-Message-State: AOAM533tfeDwIXeBrTiCQEWAddhIVPAbB1m0lLlzlMDWTRnHuCRKla+r
        +4qCZljZg/EGNZIBS5nKrf9bJj9+VBtUp0ofCcAANw==
X-Google-Smtp-Source: ABdhPJykVRNPxZpjwtBJp2l3oQqrHTgzTF48u7oukqSME6wbdcmRxZ9GAc1QKmyX+l7NgyvInm/j9HuaUKL8z913hkQ=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2144090oib.14.1602080586311;
 Wed, 07 Oct 2020 07:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com> <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com> <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
 <20201007130610.GP5177@ziepe.ca> <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
 <CAKMK7uFSTrULTE-o+vHU-81dJpKJ5cHAAb8qkpQtcz6KrhvPzg@mail.gmail.com> <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
In-Reply-To: <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 16:22:54 +0200
Message-ID: <CAKMK7uGXvOjQ2BQWaMdgwGg+bLNCFF3sBLsUztLnPNnwJ+Wtqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
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
        Kyungmin Park <kyungmin.park@samsung.com>,
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

On Wed, Oct 7, 2020 at 4:12 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Oct 7, 2020 at 4:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Wed, Oct 7, 2020 at 3:34 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > On Wed, Oct 7, 2020 at 3:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Wed, Oct 07, 2020 at 02:58:33PM +0200, Daniel Vetter wrote:
> > > > > On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > > > >
> > > > > > On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > > > > > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > > > > > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> > > > > > >
> > > > > > > There is no guarentee that holding a get on the file says anthing
> > > > > > > about the VMA. This needed to check that the file was some special
> > > > > > > kind of file that promised the VMA layout and file lifetime are
> > > > > > > connected.
> > > > > > >
> > > > > > > Also, cloning a VMA outside the mm world is just really bad. That
> > > > > > > would screw up many assumptions the drivers make.
> > > > > > >
> > > > > > > If it is all obsolete I say we hide it behind a default n config
> > > > > > > symbol and taint the kernel if anything uses it.
> > > > > > >
> > > > > > > Add a big comment above the follow_pfn to warn others away from this
> > > > > > > code.
> > > > > >
> > > > > > Sadly it's just verbally declared as deprecated and not formally noted
> > > > > > anyway. There are a lot of userspace applications relying on user
> > > > > > pointer support.
> > > > >
> > > > > userptr can stay, it's the userptr abuse for zerocpy buffer sharing
> > > > > which doesn't work anymore. At least without major surgery (you'd need
> > > > > an mmu notifier to zap mappings and recreate them, and that pretty
> > > > > much breaks the v4l model of preallocating all buffers to make sure we
> > > > > never underflow the buffer queue). And static mappings are not coming
> > > > > back I think, we'll go ever more into the direction of dynamic
> > > > > mappings and moving stuff around as needed.
> > > >
> > > > Right, and to be clear, the last time I saw a security flaw of this
> > > > magnitude from a subsystem badly mis-designing itself, Linus's
> > > > knee-jerk reaction was to propose to remove the whole subsystem.
> > > >
> > > > Please don't take status-quo as acceptable, V4L community has to work
> > > > to resolve this, uABI breakage or not. The follow_pfn related code
> > > > must be compiled out of normal distro kernel builds.
> > >
> > > I think the userptr zero-copy hack should be able to go away indeed,
> > > given that we now have CMA that allows having carveouts backed by
> > > struct pages and having the memory represented as DMA-buf normally.
> >
> > Not sure whether there's a confusion here: dma-buf supports memory not
> > backed by struct page.
> >
>
> That's new to me. The whole API relies on sg_tables a lot, which in
> turn rely on struct page pointers to describe the physical memory.

You're not allowed to look at struct page pointers from the importer
side, those might not be there. Which isn't the prettiest thing, but
it works. And even if there's a struct page, you're still not allowed
to look at it, since it's fully managed by the exporter under whatever
rules that might need. So no touching it, ever.

This is also not news, supporting this was in the design brief from
the kickoff session 10+ years ago at some linaro connect thing (in
Budapest iirc). And we have implementations doing that for almost as
long merged in upstream.

> > > How about the regular userptr use case, though?
> > >
> > > The existing code resolves the user pointer into pages by following
> > > the get_vaddr_frames() -> frame_vector_to_pages() ->
> > > sg_alloc_table_from_pages() / vm_map_ram() approach.
> > > get_vaddr_frames() seems to use pin_user_pages() behind the scenes if
> > > the vma is not an IO or a PFNMAP, falling back to follow_pfn()
> > > otherwise.
> >
> > Yeah pin_user_pages is fine, it's just the VM_IO | VM_PFNMAP vma that
> > don't work.
>
> Ack.
>
> > >
> > > Is your intention to drop get_vaddr_frames() or we could still keep
> > > using it and if vec->is_pfns is true:
> > > a) if CONFIG_VIDEO_LEGACY_PFN_USERPTR is set, taint the kernel
> > > b) otherwise just undo and fail?
> >
> > I'm typing that patch series (plus a pile more) right now.
>
> Cool, thanks!
>
> We also need to bring back the vma_open() that somehow disappeared
> around 4.2, as Marek found.

The vm_open isn't enough to stop the problems (it doesn't and cannot
protect against unmap_mapping_range), I don't think keeping an
incomplete solution around has much benefit. People who need this can
disable CONFIG_STRICT_FOLLOW_PFN to keep things working, everyone else
probably doesn't want these mm internals leaking into the media
subsystem.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
