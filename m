Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555D22D7FE9
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 21:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394408AbgLKUXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 15:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391314AbgLKUXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 15:23:19 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418EBC0611CA
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 12:21:56 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id f11so12353693ljm.8
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMZxDCK3EHPV415eTfAWmt24gOYNu8m5s7i1OWUhO90=;
        b=zZbDT1KGkvTMeQKEnAfTOSZjzsYrkD4Tgz8brLNeq6Lh4awBtr+xmRlRiafzhVoJIR
         rqZvyx3xlXzyBSSyeI8F5oswzPW8NDb/y8mCdCiO+2PVQmZ1VYdPdg9ovC+UpKmBL3b2
         2APVlSMD+d0xwnH0u4wSXvQUH52WMhUtGXxFcyJ/ULZoBF0Bma5GMAbrADaEHVKdC+vs
         yuYscH4GMdsTvkz8FK+ogTr6Cvov9VDoJ8KnU6qqK+4jvwheJG61Rjb45YA5Kdeoq61A
         mE+xnJEqqQ/d1F9pCzWkPAJmQaI8EDY71YJp4QmUKzSAz+va4cy/SYHk1S1JqX08YyIZ
         lebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMZxDCK3EHPV415eTfAWmt24gOYNu8m5s7i1OWUhO90=;
        b=CTog/abRPFuOhHZVD5QqEbXYbVvllcwcmWwSmRgTsa3GPlqM2utBhHrmYxJOw7iNKU
         C6AdeMePb05DLVjcbbsSazRaKe2EvaAHC7cNAIdRFuVxf8ui2gT8CVXoGk7wDkj51R73
         fgC4ChT3Z6ngnBzYxNMu/dm6ucqx8utH9gu6gaHHEsCsxiunMBKXidn0WsXFyEHyIclD
         1UMwMa1wLVq8gwvMOHEuRsHr6vwCZHaXedpFV1ZIAjzovi4GiNp8DGz084Gr7XlQLFVq
         cQq/0/W0RnIRclS+JAIw4uQUMz1QqfxFPfSev98J06tqUjTZCsuF9JBCg10sPhetxy6+
         ztvg==
X-Gm-Message-State: AOAM5318KVOHkShN9mO1ZPbv8XxzGil/3YRjZndRdBgx3aDdr34S0ilE
        yX6j059U1BkVyRJCl6BgJB0mXowLFVOFrGSKVmZawg==
X-Google-Smtp-Source: ABdhPJxICfsPv5gZgl9FHRPwfpWkwc/udxsFzWzWt2wOYhJdXcGUw9M3QJjshG3dpf6olNAdPGyY3xr3ppjhjL1s6XM=
X-Received: by 2002:a05:651c:286:: with SMTP id b6mr5684677ljo.232.1607718114626;
 Fri, 11 Dec 2020 12:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com> <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com> <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
 <X9IPhEkcZO+Ut5RH@kroah.com> <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
In-Reply-To: <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 11 Dec 2020 12:21:43 -0800
Message-ID: <CALAqxLWr7NgVszBMxTV=_LXKC3a24YzwXKjSdXuLdP5xKGue1w@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 5:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Dec 10, 2020 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Thu, Dec 10, 2020 at 12:26:01PM +0100, Daniel Vetter wrote:
> > > On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > > > > This only shows shared memory, so it does smell a lot like $specific_issue
> > > > > and we're designing a narrow solution for that and then have to carry it
> > > > > forever.
> > > >
> > > > I think the "issue" is that this was a feature from ion that people
> > > > "missed" in the dmabuf move.  Taking away the ability to see what kind
> > > > of allocations were being made didn't make a lot of debugging tools
> > > > happy :(
> > >
> > > If this is just for dma-heaps then why don't we add the stuff back
> > > over there? It reinforces more that the android gpu stack and the
> > > non-android gpu stack on linux are fairly different in fundamental
> > > ways, but that's not really new.
> >
> > Back "over where"?
> >
> > dma-bufs are not only used for the graphics stack on android from what I
> > can tell, so this shouldn't be a gpu-specific issue.
>
> dma-buf heaps exist because android, mostly because google mandates
> it.

So, I don't think that's fair.

dma-buf heaps and ION before exist because it solves a problem they
have for allocating shared buffers for multiple complicated
multi-device pipelines where the various devices have constraints.
It's not strictly required[1], as your next point makes clear (along
with ChromeOS's Android not using it).

> There's not a whole lot (meaning zero) of actually open gpu stacks
> around that run on android and use dma-buf heaps like approved google
> systems, largely because the gralloc implementation in mesa just
> doesnt.

So yes, db845c currently uses the gbm_gralloc, which doesn't use
dmabuf heaps or ION.

That said, the resulting system still uses quite a number of dmabufs,
as Hridya's patch shows:
==> /sys/kernel/dmabuf/28435/exporter_name <==
drm
==> /sys/kernel/dmabuf/28435/dev_map_info <==
==> /sys/kernel/dmabuf/28435/size <==
16384
==> /sys/kernel/dmabuf/28161/exporter_name <==
drm
==> /sys/kernel/dmabuf/28161/dev_map_info <==
==> /sys/kernel/dmabuf/28161/size <==
524288
==> /sys/kernel/dmabuf/30924/exporter_name <==
drm
==> /sys/kernel/dmabuf/30924/dev_map_info <==
==> /sys/kernel/dmabuf/30924/size <==
8192
==> /sys/kernel/dmabuf/26880/exporter_name <==
drm
==> /sys/kernel/dmabuf/26880/dev_map_info <==
==> /sys/kernel/dmabuf/26880/size <==
262144
...

So even when devices are not using dma-buf heaps (which I get, you
have an axe to grind with :), having some way to collect useful stats
for dmabufs in use can be valuable.

(Also one might note, the db845c also doesn't have many constrained
devices, and we've not yet enabled hw codec support or camera
pipelines, so it avoids much of the complexity that ION/dma-buf heaps
was created to solve)

> So if android needs some quick debug output in sysfs, we can just add
> that in dma-buf heaps, for android only, problem solved. And much less
> annoying review to make sure it actually fits into the wider ecosystem
> because as-is (and I'm not seeing that chance anytime soon), dma-buf
> heaps is for android only. dma-buf at large isn't, so merging a debug
> output sysfs api that's just for android but misses a ton of the more
> generic features and semantics of dma-buf is not great.

The intent behind this patch is *not* to create more Android-specific
logic, but to provide useful information generically.  Indeed, Android
does use dmabufs heavily for passing buffers around, and your point
that not all systems handle graphics buffers that way is valid, and
it's important we don't bake any Android-isms into the interface. But
being able to collect data about the active dmabufs in a system is
useful, regardless of how regardless of how the dma-buf was allocated.

So I'd much rather see your feedback on how we expose other aspects of
dmabufs (dma_resv, exporter devices, attachment links) integrated,
rather then trying to ghettoize it as android-only and limit it to the
dmabuf heaps, where I don't think it makes as much sense to add.

thanks
-john

[1] Out of the box, the codec2 code added a few years back does
directly call to ION (and now dmabuf heaps) for system buffers, but it
can be configured differently as it's used in ChromeOS's Android too.
