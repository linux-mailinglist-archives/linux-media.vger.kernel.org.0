Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CAB2B7442
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 03:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgKRCkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 21:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKRCkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 21:40:23 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAF4C0613D4
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 18:40:23 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id o25so585495oie.5
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 18:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvdgsBLgi9EHMNSLVDq+6Fn9lRqcB8CIw2yWEiIoq80=;
        b=J35wiLmqdOFXJLv4HSpQvHl5YEa4K3iwX2kW6Ks7Gc62WwkxOifW27KzFX7wu7bTp6
         IUZd28S0eE2GdDUOWe8erY3blUciPXWTyOWyjSVllPrphPItMSzm6CNNaOAE9zFOF3pP
         RMM8RbYKvT3omqiO7jafrSLB/clgjWbTiHU1dicDjr1f7/ZIyNxe114QTLDjCD5crXG/
         DXez7Muy8FO15hQcaLg0uUPiXMZZmzN0sMCezSamFbMrPXxuawl/u+/Zh9uwg21zGqGq
         2JstVY0hkwx2VniIDYfpZW6HK+vb/0TbOd69b1PfGQ7qBmycPY+L4nJrxAgB+HpAlBHB
         PfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvdgsBLgi9EHMNSLVDq+6Fn9lRqcB8CIw2yWEiIoq80=;
        b=E9fcI48rr+9ZZmel0BeX58agYWXjxEhgq3l9S9KsbANYO2ClxjBr4rB/t/JXQI/ovr
         Nj5A6ijZLClmCxxEWuYzYlihiAotK3zQepxO1AHJMjnLM5JylXhn2SFsnGpQdPpS/D62
         URj+lLNhLOSYj4i8nNs4kECyWpk6zkPDBqT/NOL6AljIDnc0TBwenDv0SGYvRYcbeIs0
         Np2jXLO4CCdDLRhNVT0LWsUEhAL7ODtZ+dFmrMLfliaRPDc83O0fZ5DYjruWb9D/2E7u
         0lFyMc8dAeXagd6jVWHjnkPCAbi692FrWFW3gt4HxG1zr9MQuvUWRIAX+VaEDLQuo0sD
         sqcA==
X-Gm-Message-State: AOAM533qMOaMJwGvlqH3kGB8aCc/jreZGVa2isyVbRpHntMa6CxVU2DV
        Xl6YgUChtuWU5Pw9WgyT30bUCnXz7E3gmyMoSxYudg==
X-Google-Smtp-Source: ABdhPJy0sxe/2XxPJwznFcbwNp7a1YBjsny2Xovn2b3d9sUn9AojSv42h8RwaMADnI7yZVr5fNfhexyQWdiLSAi+eFw=
X-Received: by 2002:aca:4e02:: with SMTP id c2mr1442601oib.97.1605667222447;
 Tue, 17 Nov 2020 18:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local> <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
 <20201113203933.GT401619@phenom.ffwll.local>
In-Reply-To: <20201113203933.GT401619@phenom.ffwll.local>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 17 Nov 2020 18:40:11 -0800
Message-ID: <CALAqxLU886mjGaNx3cvXB0hyOd=tTo7G=tw6iQ1uAxcXShN+kg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
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
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 13, 2020 at 12:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> > On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > > > >
> > > > > Hey All,
> > > > >   So just wanted to send my last revision of my patch series
> > > > > of performance optimizations to the dma-buf system heap.
> > > >
> > > > Thanks very much for your patches - I think the first 5 patches look good to me.
> > > >
> > > > I know there was a bit of discussion over adding a new system-uncached
> > > > heap v/s using a flag to identify that; I think I prefer the separate
> > > > heap idea, but lets ask one last time if any one else has any real
> > > > objections to it.
> > > >
> > > > Daniel, Christian: any comments from your side on this?
> > >
> > > I do wonder a bit where the userspace stack for this all is, since tuning
> > > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > > bit in a limbo situation here it feels like.
> >
> > As mentioned in the system-uncached patch:
> > Pending opensource users of this code include:
> > * AOSP HiKey960 gralloc:
> >   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
> >   - Visibly improves performance over the system heap
> > * AOSP Codec2 (possibly, needs more review):
> >   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> >
> > Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> > able to use the current dmabuf heaps instead of ION.
> >
> > So I'm not sure what you mean by limbo, other than it being in a
> > transition state where the interface is upstream and we're working on
> > moving vendors to it from ION (which is staged to be dropped in 5.11).
> > Part of that work is making sure we don't regress the performance
> > expectations.
>
> The mesa thing below, since if we test this with some downstream kernel
> drivers or at least non-mesa userspace I'm somewhat worried we're just
> creating a nice split world between the android gfx world and the
> mesa/linux desktop gfx world.
>
> But then that's kinda how android rolls, so *shrug*
>
> > > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > > dma-api because dma api maintainers don't like us doing that. But
> > > personally no concern on that front really, gpus need this. It's just that
> > > we do need solid justification I think if we land this. Hence back to
> > > first point.
> > >
> > > Ideally first point comes in the form of benchmarking on android together
> > > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > > actually show the benefits, I have no idea).
> >
> > Tying it with mesa is a little tough as the grallocs for mesa devices
> > usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> > allocation path for dmabuf heaps there gets a little complex as last I
> > tried that (when trying to get HiKey working with Lima graphics, as
> > gbm wouldn't allocate the contiguous buffers required by the display),
> > I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> > private handle metadata in the buffer when it was passed in.
> >
> > But I might take a look at it again. I got a bit lost digging through
> > the mesa gbm allocation paths last time.
> >
> > I'll also try to see if I can find a benchmark for the codec2 code
> > (using dmabuf heaps with and without the uncached heap) on on db845c
> > (w/ mesa), as that is already working and I suspect that might be
> > close to what you're looking for.
>
> tbh I think trying to push for this long term is the best we can hope for.
>
> Media is also a lot more *meh* since it's deeply fragmented and a lot less
> of it upstream than on the gles/display side.
>
> I think confirming that this at least doesn't horrible blow up on a
> gralloc/gbm+mesa stack would be useful I think.

Sorry, I'm still a little foggy on precisely what you're suggesting here.

The patch stack I have has already been used with db845c (mesa +
gbm_grallloc), with the codec2 (sw decoders) using dmabuf heaps.
So no blowing up there. And I'm working with Hridya to find a
benchmark for codec2 so we can try to show the performance delta.

However, if you're wanting a dma-buf gralloc implementation with mesa,
that may be a little tougher to do, but I guess I can give it a go.

Hopefully this will address concerns about the system-uncached heap
patch (the last two patches in this series)?

In the meantime I hope we can queue the first five patches, as it
would be nice to get the code rearranging in as there are others
trying to stage their own heaps, and I'd like to avoid dragging that
churn out for too long (in addition to improving the allocation
performance). Those changes have no ABI implications.

thanks
-john
