Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C66316CA2
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 18:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhBJR3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 12:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhBJR3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 12:29:14 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23491C061756
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 09:28:34 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id b3so3491065wrj.5
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LFLx+EGT6BQxw78r3fiv359OhJXhIjzbDKlX5DwYrqg=;
        b=SpsPsnqz7eFB5NKr/Izoi+516NgCAfrAvXrap2A7PRYEKIXs7pAstflFBJQaigZlsN
         IMn3r/g56Jf78GjFZiKYWryELx6q4oYQIg/SM7fgArWtM3yb8Jy9MczS2fJGklxfONYL
         e/AdA9gpkCpF7YSBSRIbE9YSMoAf7f7A01/TZ7QfI07NzzWZ7IF3GNAabt6e/xJnY++d
         wbM4ZmhO1hjfgthdQQuPLgUmCsvkhdswgI4gjpdqzQaIR2nJR7MjgcQR/cQwRz0iho3F
         9hwabtGMn5TmQMV3PfyYczc1uuTkn7SdrYuMJgzwoY9bqhdU3Sx1YdUc8dNeTC+ivjJI
         U1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LFLx+EGT6BQxw78r3fiv359OhJXhIjzbDKlX5DwYrqg=;
        b=DBTy7D6q2EhkoJyhEfq5vfBKKxAYppKbuud74KNs/08QvRD3jL8MrkHBXeqjmWIFGw
         99foOSYmJQJyUjez5Nf48jfJLNL+UJNEiePK1JreqZJ8xWPHNP2S/9LrcS9nWwFlcH25
         Z3uGaXh+lEqthG89o3JDjjY6HV2cp8P+NMQXVJ3Oib0W+TRjUQ6wsuW5gIuaBN9IVqCf
         1yPFkDJEwpHEXQVHI+7LnQ2QS/cYujkaqKbuSu15Jmqd1d4IFrxnv5SU8Vzs5vmZsBZz
         9RMIL+CY+QrIWIm3jRVnTiszXRrBRGf7ZC93XmLcVrNIbiR6wqZKNVIKiN4H8Tr78LB9
         tYLA==
X-Gm-Message-State: AOAM530XajiRjfUUa0X6FMTX55U8VFRYjnPrjgrIG9y4GAItSPFwUHCz
        wXxesmhykjYgYhbdCZ8LjGuAwRbCnYyDxRWLX43Zfw==
X-Google-Smtp-Source: ABdhPJyzRnZbneOl4YIb/Yff7muUANVjCWCkCYcIgtX8ng4D193YF9WYLTJb9cLa2DUxXB9RO0YhaUkywVBTuJwCZjk=
X-Received: by 2002:adf:fe46:: with SMTP id m6mr4878757wrs.92.1612978107518;
 Wed, 10 Feb 2021 09:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com> <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
 <YCPaZc0+F+5C7FG4@phenom.ffwll.local> <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
 <CAKMK7uF8yXne27q8aRn3FkZEh=WNVry_vbtU5jzue1J9X7tEKw@mail.gmail.com>
In-Reply-To: <CAKMK7uF8yXne27q8aRn3FkZEh=WNVry_vbtU5jzue1J9X7tEKw@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 10 Feb 2021 09:28:15 -0800
Message-ID: <CAJuCfpHZj6fBsR_5nDgrsDv0R=XhVeZtUZdaSFH2zgLV7hOHww@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 10, 2021 at 9:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Feb 10, 2021 at 5:39 PM Suren Baghdasaryan <surenb@google.com> wr=
ote:
> >
> > On Wed, Feb 10, 2021 at 5:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
> > > > On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Tue, Feb 9, 2021 at 6:46 PM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > > > > > > On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christia=
n.koenig@amd.com> wrote:
> > > > > > >> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> > > > > > >>> [SNIP]
> > > > > > >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, stru=
ct page *page)
> > > > > > >>>>>> +{
> > > > > > >>>>>> +     spin_lock(&pool->lock);
> > > > > > >>>>>> +     list_add_tail(&page->lru, &pool->items);
> > > > > > >>>>>> +     pool->count++;
> > > > > > >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> > > > > > >>>>>> +     spin_unlock(&pool->lock);
> > > > > > >>>>>> +
> > > > > > >>>>>> +     mod_node_page_state(page_pgdat(page),
> > > > > > >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> > > > > > >>>>>> +                         1 << pool->order);
> > > > > > >>>>> Hui what? What should that be good for?
> > > > > > >>>> This is a carryover from the ION page pool implementation:
> > > > > > >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Fli=
nux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3D=
v5.10%23n28&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4=
d147a5b08d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374848881=
14923580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4=
mdunn3dF6C0kyfCw%3D&amp;reserved=3D0
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>> My sense is it helps with the vmstat/meminfo accounting so=
 folks can
> > > > > > >>>> see the cached pages are shrinkable/freeable. This maybe f=
alls under
> > > > > > >>>> other dmabuf accounting/stats discussions, so I'm happy to=
 remove it
> > > > > > >>>> for now, or let the drivers using the shared page pool log=
ic handle
> > > > > > >>>> the accounting themselves?
> > > > > > >> Intentionally separated the discussion for that here.
> > > > > > >>
> > > > > > >> As far as I can see this is just bluntly incorrect.
> > > > > > >>
> > > > > > >> Either the page is reclaimable or it is part of our pool and=
 freeable
> > > > > > >> through the shrinker, but never ever both.
> > > > > > > IIRC the original motivation for counting ION pooled pages as
> > > > > > > reclaimable was to include them into /proc/meminfo's MemAvail=
able
> > > > > > > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaima=
ble
> > > > > > > non-slab kernel pages" seems like a good place to account for=
 them but
> > > > > > > I might be wrong.
> > > > > >
> > > > > > Yeah, that's what I see here as well. But exactly that is utter=
ly nonsense.
> > > > > >
> > > > > > Those pages are not "free" in the sense that get_free_page coul=
d return
> > > > > > them directly.
> > > > >
> > > > > Well on Android that is kinda true, because Android has it's
> > > > > oom-killer (way back it was just a shrinker callback, not sure ho=
w it
> > > > > works now), which just shot down all the background apps. So at l=
east
> > > > > some of that (everything used by background apps) is indeed
> > > > > reclaimable on Android.
> > > > >
> > > > > But that doesn't hold on Linux in general, so we can't really do =
this
> > > > > for common code.
> > > > >
> > > > > Also I had a long meeting with Suren, John and other googles
> > > > > yesterday, and the aim is now to try and support all the Android =
gpu
> > > > > memory accounting needs with cgroups. That should work, and it wi=
ll
> > > > > allow Android to handle all the Android-ism in a clean way in ups=
tream
> > > > > code. Or that's at least the plan.
> > > > >
> > > > > I think the only thing we identified that Android still needs on =
top
> > > > > is the dma-buf sysfs stuff, so that shared buffers (which on Andr=
oid
> > > > > are always dma-buf, and always stay around as dma-buf fd througho=
ut
> > > > > their lifetime) can be listed/analyzed with full detail.
> > > > >
> > > > > But aside from this the plan for all the per-process or per-heap
> > > > > account, oom-killer integration and everything else is planned to=
 be
> > > > > done with cgroups.
> > > >
> > > > Until cgroups are ready we probably will need to add a sysfs node t=
o
> > > > report the total dmabuf pool size and I think that would cover our
> > > > current accounting need here.
> > > > As I mentioned, not including dmabuf pools into MemAvailable would
> > > > affect that stat and I'm wondering if pools should be considered as
> > > > part of MemAvailable or not. Since MemAvailable includes SReclaimab=
le
> > > > I think it makes sense to include them but maybe there are other
> > > > considerations that I'm missing?
> > >
> > > On Android, yes, on upstream, not so much. Because upstream doesn't h=
ave
> > > the android low memory killer cleanup up all the apps, so effectively=
 we
> > > can't reclaim that memory, and we shouldn't report it as such.
> > > -Daniel
> >
> > Hmm. Sorry, I fail to see why Android's low memory killer makes a
> > difference here. In my mind, the pages in the pools are not used but
> > kept there in case heaps need them (maybe that's the part I'm wrong?).
> > These pages can be freed by the shrinker if memory pressure rises. In
> > that sense I think it's very similar to reclaimable slabs which are
> > already accounted as part of MemAvailable. So it seems logical to me
> > to include unused pages in the pools here as well. What am I missing?
>
> Ah yes, those page pool pages we can list. But conceptually (at least
> in the internals) they're shrunk through mm shrinker callbacks, like
> slab cache memory. So not exactly sure where to list that.
>
> Since we have the same pools for gpu allocations on the ttm side and
> John is looking into unifying those, maybe we could add that as a
> patch on top? For some nice consistency across all gpu drivers from
> android to discrete. I think if you, John and Christian from ttm side
> can figure out how these page pools should be reported we'll have
> something that fits? Maybe John can ping you on the other thread with
> the shared pool rfc between ttm and dma-buf heaps (there's so much
> going right now all over I'm a bit lost).

Sounds good. I'll follow up with John to see where this discussion fits bet=
ter.
Thanks!

>
> Cheers, Daniel
>
> >
> > >
> > > >
> > > > > Android (for now) only needs to account overall gpu
> > > > > memory since none of it is swappable on android drivers anyway, p=
lus
> > > > > no vram, so not much needed.
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Christian.
> > > > > >
> > > > > > >
> > > > > > >> In the best case this just messes up the accounting, in the =
worst case
> > > > > > >> it can cause memory corruption.
> > > > > > >>
> > > > > > >> Christian.
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
