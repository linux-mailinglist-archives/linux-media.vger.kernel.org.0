Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1109316B82
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhBJQmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbhBJQj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:39:57 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F42C0613D6
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:39:17 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h12so3305889wrw.6
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gOGAssOJjNZNlPpv3Admt3v46Ue26KYAFuXCNy2Qe2o=;
        b=XtKMTzFOPBCdpV0RhegZFRZI6m8Ts+1xY7EoA2Ms50fSnr0NIZHzZjRhydkd/+52Aw
         J/hjZfoj0VIsFjguUaov1H/nE5MIGvYy79rG2n3kbDamIULrKl+/Pg+585VW4wOZRi2t
         BUbl9dOe76+9xZl7SA1WZWypEwx0cGS8KqWl8zCYwr4v/6ZnenbThSSZwzJfiuRbD+r+
         9m2m+o9FWE4iheRcfKLCWtS071ZUcjuZOcMhC1jyL5FPPhbuApl1JCR45PIbmWAIMREz
         pJJpIsfgAxDXb60WOoye4pmBjZQT51i2sqcgYF0id5y3XELeLyi2D2R18I0Iqtlfwz80
         9qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gOGAssOJjNZNlPpv3Admt3v46Ue26KYAFuXCNy2Qe2o=;
        b=W0SXBB1/T6KdfXr9QI3vm1iTsJosJ71hqTzL5A+yBCNHGbx/rN6FVS0RvaPeaD7Vtz
         a6v1PxE907118zhfNcKBoSOW9aR0yulIn4rBkQ1EnkaKREokAXh7A1iAPA/L1HFtY9aa
         wcVt9feVx39vRHLstkQj8tdIjLZf7niEayud/Uyz0N8OLoMNA+zSfnPc0Cd3m0ueq+ca
         ZVy/MmPOfXA1e715lPQyJ/h5mA6IT5fDjBBBj3sC/JVNSChySjQas6yJQ7PObBOykoUg
         IpUxMFMIyGxKBap5rm5kjyZK7VTZB5ZBi1x1pagX7A9BBDPa6/UZU07bltAu1UlB3ov/
         zTsQ==
X-Gm-Message-State: AOAM5329lrddL+6Wll01OaA7IBF4cVl/2r1eiEoFW675KJkcUk+kzPKB
        bKqfnVG4Hbs5c03tKojAfaZuWmzq6/ma6ykhluFHfQ==
X-Google-Smtp-Source: ABdhPJz6W3Fi44gsEqsR3e/91xfJLnmZbo5TOm1tWh7e9ZQu37Vqa8d/55+DU1UtQhcQZwgEVLLN5Gd+nrQbnmxi21Y=
X-Received: by 2002:a5d:430a:: with SMTP id h10mr4707575wrq.162.1612975155501;
 Wed, 10 Feb 2021 08:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com> <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com> <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
In-Reply-To: <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 10 Feb 2021 08:39:04 -0800
Message-ID: <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 10, 2021 at 5:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
> > On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Feb 9, 2021 at 6:46 PM Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> > > >
> > > >
> > > >
> > > > Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > > > > On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> > > > >> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> > > > >>> [SNIP]
> > > > >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct p=
age *page)
> > > > >>>>>> +{
> > > > >>>>>> +     spin_lock(&pool->lock);
> > > > >>>>>> +     list_add_tail(&page->lru, &pool->items);
> > > > >>>>>> +     pool->count++;
> > > > >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> > > > >>>>>> +     spin_unlock(&pool->lock);
> > > > >>>>>> +
> > > > >>>>>> +     mod_node_page_state(page_pgdat(page),
> > > > >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> > > > >>>>>> +                         1 << pool->order);
> > > > >>>>> Hui what? What should that be good for?
> > > > >>>> This is a carryover from the ION page pool implementation:
> > > > >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.=
git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.1=
0%23n28&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147=
a5b08d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63748488811492=
3580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdun=
n3dF6C0kyfCw%3D&amp;reserved=3D0
> > > > >>>>
> > > > >>>>
> > > > >>>> My sense is it helps with the vmstat/meminfo accounting so fol=
ks can
> > > > >>>> see the cached pages are shrinkable/freeable. This maybe falls=
 under
> > > > >>>> other dmabuf accounting/stats discussions, so I'm happy to rem=
ove it
> > > > >>>> for now, or let the drivers using the shared page pool logic h=
andle
> > > > >>>> the accounting themselves?
> > > > >> Intentionally separated the discussion for that here.
> > > > >>
> > > > >> As far as I can see this is just bluntly incorrect.
> > > > >>
> > > > >> Either the page is reclaimable or it is part of our pool and fre=
eable
> > > > >> through the shrinker, but never ever both.
> > > > > IIRC the original motivation for counting ION pooled pages as
> > > > > reclaimable was to include them into /proc/meminfo's MemAvailable
> > > > > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> > > > > non-slab kernel pages" seems like a good place to account for the=
m but
> > > > > I might be wrong.
> > > >
> > > > Yeah, that's what I see here as well. But exactly that is utterly n=
onsense.
> > > >
> > > > Those pages are not "free" in the sense that get_free_page could re=
turn
> > > > them directly.
> > >
> > > Well on Android that is kinda true, because Android has it's
> > > oom-killer (way back it was just a shrinker callback, not sure how it
> > > works now), which just shot down all the background apps. So at least
> > > some of that (everything used by background apps) is indeed
> > > reclaimable on Android.
> > >
> > > But that doesn't hold on Linux in general, so we can't really do this
> > > for common code.
> > >
> > > Also I had a long meeting with Suren, John and other googles
> > > yesterday, and the aim is now to try and support all the Android gpu
> > > memory accounting needs with cgroups. That should work, and it will
> > > allow Android to handle all the Android-ism in a clean way in upstrea=
m
> > > code. Or that's at least the plan.
> > >
> > > I think the only thing we identified that Android still needs on top
> > > is the dma-buf sysfs stuff, so that shared buffers (which on Android
> > > are always dma-buf, and always stay around as dma-buf fd throughout
> > > their lifetime) can be listed/analyzed with full detail.
> > >
> > > But aside from this the plan for all the per-process or per-heap
> > > account, oom-killer integration and everything else is planned to be
> > > done with cgroups.
> >
> > Until cgroups are ready we probably will need to add a sysfs node to
> > report the total dmabuf pool size and I think that would cover our
> > current accounting need here.
> > As I mentioned, not including dmabuf pools into MemAvailable would
> > affect that stat and I'm wondering if pools should be considered as
> > part of MemAvailable or not. Since MemAvailable includes SReclaimable
> > I think it makes sense to include them but maybe there are other
> > considerations that I'm missing?
>
> On Android, yes, on upstream, not so much. Because upstream doesn't have
> the android low memory killer cleanup up all the apps, so effectively we
> can't reclaim that memory, and we shouldn't report it as such.
> -Daniel

Hmm. Sorry, I fail to see why Android's low memory killer makes a
difference here. In my mind, the pages in the pools are not used but
kept there in case heaps need them (maybe that's the part I'm wrong?).
These pages can be freed by the shrinker if memory pressure rises. In
that sense I think it's very similar to reclaimable slabs which are
already accounted as part of MemAvailable. So it seems logical to me
to include unused pages in the pools here as well. What am I missing?

>
> >
> > > Android (for now) only needs to account overall gpu
> > > memory since none of it is swappable on android drivers anyway, plus
> > > no vram, so not much needed.
> > >
> > > Cheers, Daniel
> > >
> > > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > >
> > > > >> In the best case this just messes up the accounting, in the wors=
t case
> > > > >> it can cause memory corruption.
> > > > >>
> > > > >> Christian.
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
