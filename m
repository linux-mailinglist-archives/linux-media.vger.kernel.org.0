Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9793631585E
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 22:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhBIVMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 16:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbhBIUwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 15:52:02 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DF8C0698C8
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 12:17:04 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l12so23650961wry.2
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 12:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WSIKXYPYAgR9bcpSSCcdKf1jjEFLRGvSegQRcPSmIHk=;
        b=TpWVcq0cAHCjTMjUTaZgT1rftmkIZpeK/w+9IeAIZ71VrVi/eZqrSZAKHw0g3FpFjZ
         vhhP4TAJeK4H72vQJngmfiTh0QNKw33RQeOcNqTM7j5L8ANMd4FulgcZOwFpskNLdrVU
         W9NVwjLqcAiuIBfGCLYmtGwfUcEJ/2I3/aee3J9ypcoxx/5mZt/jkfvhc2ha7tjrVqYH
         MC0Zy1pZHBqFVPyjuy2i2cnC5JiZpUdgR/LjCwm2P8BOLgPrsEwxo1rPvdrC50ruK7KS
         IXaNhLs1QuEUHfVAvV0NJN3y7pc8mYTciKnRuF5CVUP2f1ct6tEu1sGbxt4iE8o/kgfq
         5wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WSIKXYPYAgR9bcpSSCcdKf1jjEFLRGvSegQRcPSmIHk=;
        b=LevE4izHShNyHR6Rrk4e1LATGsfJ+nAEehjEWUD5sD9MBhT4HHyrUy2Gw7DjlkS5Ze
         g03gwXil3dMcdGwV1rNTf39NZOvgdJGQaMmr9kR8HrME6uJa4xSSEG/LU/5ayIqy2/d5
         RedWEhNZmL0Pc04+UE77OVoU2f3DkuCg1kOY6tRd8V/ZHbc1jgo9x3WbgrsKB6EHPGlv
         kBaB7Fuq0VsibV9LeX9iCiiaCC6zr2P3TXISc6ohzc/D0UH3teRG9mWAzgKTBIuzfZ4Q
         pWgil8rPQH8DdDjHOPwty5qClEKVM7iHl7Rl8tXpd3mQ9wGU/XC4hpaP8q82ZZ3TKQG8
         HK0Q==
X-Gm-Message-State: AOAM531lOfWRH6EP8bHBDygehv9/sjY3EZdHZQwHt8Aam8KeEGmlsgvZ
        fFzdostrZ9U/39QCz2Ya5hbLV+OYic2ItXN7nVCkEA==
X-Google-Smtp-Source: ABdhPJxFl7S5w0WlwAXTJ3cWL9Tbg22//Qmf0A+Qsi7vhLmYGGyDlhpZCx8wpsBET0KA36zayLM1gYCSQHD8JqHfvP8=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr27326708wro.358.1612901823243;
 Tue, 09 Feb 2021 12:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com> <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
In-Reply-To: <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 9 Feb 2021 12:16:51 -0800
Message-ID: <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
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

On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Feb 9, 2021 at 6:46 PM Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> >
> >
> >
> > Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > > On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> > >> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> > >>> [SNIP]
> > >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page =
*page)
> > >>>>>> +{
> > >>>>>> +     spin_lock(&pool->lock);
> > >>>>>> +     list_add_tail(&page->lru, &pool->items);
> > >>>>>> +     pool->count++;
> > >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> > >>>>>> +     spin_unlock(&pool->lock);
> > >>>>>> +
> > >>>>>> +     mod_node_page_state(page_pgdat(page),
> > >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> > >>>>>> +                         1 << pool->order);
> > >>>>> Hui what? What should that be good for?
> > >>>> This is a carryover from the ION page pool implementation:
> > >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%=
2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23=
n28&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147a5b0=
8d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484888114923580=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdunn3dF=
6C0kyfCw%3D&amp;reserved=3D0
> > >>>>
> > >>>>
> > >>>> My sense is it helps with the vmstat/meminfo accounting so folks c=
an
> > >>>> see the cached pages are shrinkable/freeable. This maybe falls und=
er
> > >>>> other dmabuf accounting/stats discussions, so I'm happy to remove =
it
> > >>>> for now, or let the drivers using the shared page pool logic handl=
e
> > >>>> the accounting themselves?
> > >> Intentionally separated the discussion for that here.
> > >>
> > >> As far as I can see this is just bluntly incorrect.
> > >>
> > >> Either the page is reclaimable or it is part of our pool and freeabl=
e
> > >> through the shrinker, but never ever both.
> > > IIRC the original motivation for counting ION pooled pages as
> > > reclaimable was to include them into /proc/meminfo's MemAvailable
> > > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> > > non-slab kernel pages" seems like a good place to account for them bu=
t
> > > I might be wrong.
> >
> > Yeah, that's what I see here as well. But exactly that is utterly nonse=
nse.
> >
> > Those pages are not "free" in the sense that get_free_page could return
> > them directly.
>
> Well on Android that is kinda true, because Android has it's
> oom-killer (way back it was just a shrinker callback, not sure how it
> works now), which just shot down all the background apps. So at least
> some of that (everything used by background apps) is indeed
> reclaimable on Android.
>
> But that doesn't hold on Linux in general, so we can't really do this
> for common code.
>
> Also I had a long meeting with Suren, John and other googles
> yesterday, and the aim is now to try and support all the Android gpu
> memory accounting needs with cgroups. That should work, and it will
> allow Android to handle all the Android-ism in a clean way in upstream
> code. Or that's at least the plan.
>
> I think the only thing we identified that Android still needs on top
> is the dma-buf sysfs stuff, so that shared buffers (which on Android
> are always dma-buf, and always stay around as dma-buf fd throughout
> their lifetime) can be listed/analyzed with full detail.
>
> But aside from this the plan for all the per-process or per-heap
> account, oom-killer integration and everything else is planned to be
> done with cgroups.

Until cgroups are ready we probably will need to add a sysfs node to
report the total dmabuf pool size and I think that would cover our
current accounting need here.
As I mentioned, not including dmabuf pools into MemAvailable would
affect that stat and I'm wondering if pools should be considered as
part of MemAvailable or not. Since MemAvailable includes SReclaimable
I think it makes sense to include them but maybe there are other
considerations that I'm missing?

> Android (for now) only needs to account overall gpu
> memory since none of it is swappable on android drivers anyway, plus
> no vram, so not much needed.
>
> Cheers, Daniel
>
> >
> > Regards,
> > Christian.
> >
> > >
> > >> In the best case this just messes up the accounting, in the worst ca=
se
> > >> it can cause memory corruption.
> > >>
> > >> Christian.
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
