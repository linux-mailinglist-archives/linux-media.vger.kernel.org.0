Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69864316FC6
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhBJTNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhBJTM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:12:57 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B0AC061756
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 11:12:17 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id z7so1743755plk.7
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 11:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D09LkSe2ebxlrCpntvua2yK41XaWwVaTEcwcly2HFOE=;
        b=tdzsLTqxfAsHZFZuF2Mw/VEtKkFOjspUPnkwxHusVJ5h6H08woVxbp0BiqYKAFX8YE
         Fre4sOD2lSJhzVtf+vOJfg0G+jYtaRj6TAjn5SIfWciT3D/2GsVM8XsSpHO+6YuMMP5u
         6D+TNpztuGCa8x/vFok2MQcnCOEz3025kvmBmSqNyzB1lU0W+Nr/2ojJwwqljKTE6cXd
         IIdVDZjqnyQBqLzxrkrIpjAqzilIILjKA30K+4TF3Rpv0LC2NBQHpaKCILMDmPa0fZza
         7rXh9f4c1n2r4HWuM1/3xWTrcMG3f0dLv0zaSR1qzYe2PLCwjetlkGObOy1Bp8nAVPx8
         /JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D09LkSe2ebxlrCpntvua2yK41XaWwVaTEcwcly2HFOE=;
        b=kRnt9lZ7aMobpGYktjm1HP4paqihVS2CXwtnBZwBBXxYwCeXB9/lWIgPRtkQB5cwn3
         PGwVcAzxW+RY/JFi++GOfRcaCBvBhozfG4IlkYMK1/q5sfyOsswWxAYfBfISEaq+nQEE
         C+c7Qq/w375nC25dCe3Ryq+UAKjbS0ix/6pSTQlguQxJDzNlLFEJss/koCn5XaKp10Mt
         qXEJnS8isBmg6pumQE2Y1fh5VKVS71hudIeDBdzCh2bj8Fzt8Ku/66llPORkXDeS+zwF
         Sz/K/cmmKnbYRZC78vfK14UqQm1k0van5dYqWMvgnBCrTEDZbKOdhuqfeJtMt1nj0Ozu
         gcAQ==
X-Gm-Message-State: AOAM532sT5OkotuUtwJgK4YnBy0UKCuStJaml+Vd+3jukomPJhrPZ0M9
        488EKPtnGjbmqoikflkvOHlurfvip+1CNCBDuIGgXg==
X-Google-Smtp-Source: ABdhPJzT75PRUjxGLKPS2lKd9gqe4/tbIGSDT67F7bKY978vOFW82sCkY4yUWPTmOIQeAga00+0PTgGspvFle4eh1Qs=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr352613pjf.59.1612984336464;
 Wed, 10 Feb 2021 11:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com> <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
 <YCPaZc0+F+5C7FG4@phenom.ffwll.local> <CAJuCfpG+nOwZJcJAXuvv=P=17vWdw2AFT7+WHfpwfmjAfefM2g@mail.gmail.com>
 <d085aaf7-8414-3efa-404b-1595abfb6da7@amd.com>
In-Reply-To: <d085aaf7-8414-3efa-404b-1595abfb6da7@amd.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 10 Feb 2021 11:12:05 -0800
Message-ID: <CAJuCfpHUBGykGdcgBSg6bGvPGtE66m+SrXeYg3jMtYQ5ZRzpdQ@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     John Stultz <john.stultz@linaro.org>,
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 10, 2021 at 10:32 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 10.02.21 um 17:39 schrieb Suren Baghdasaryan:
> > On Wed, Feb 10, 2021 at 5:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
> >>> On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>>> On Tue, Feb 9, 2021 at 6:46 PM Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >>>>>
> >>>>>
> >>>>> Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> >>>>>> On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christian.koe=
nig@amd.com> wrote:
> >>>>>>> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> >>>>>>>> [SNIP]
> >>>>>>>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct pa=
ge *page)
> >>>>>>>>>>> +{
> >>>>>>>>>>> +     spin_lock(&pool->lock);
> >>>>>>>>>>> +     list_add_tail(&page->lru, &pool->items);
> >>>>>>>>>>> +     pool->count++;
> >>>>>>>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> >>>>>>>>>>> +     spin_unlock(&pool->lock);
> >>>>>>>>>>> +
> >>>>>>>>>>> +     mod_node_page_state(page_pgdat(page),
> >>>>>>>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> >>>>>>>>>>> +                         1 << pool->order);
> >>>>>>>>>> Hui what? What should that be good for?
> >>>>>>>>> This is a carryover from the ION page pool implementation:
> >>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.g=
it%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10=
%23n28&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447ee149a49f=
3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485719618339=
413%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DIYsJoAd7SUo12V7tS3CCRqNVm569iy%2FtoX=
Qqm2MdC1g%3D&amp;reserved=3D0
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> My sense is it helps with the vmstat/meminfo accounting so folk=
s can
> >>>>>>>>> see the cached pages are shrinkable/freeable. This maybe falls =
under
> >>>>>>>>> other dmabuf accounting/stats discussions, so I'm happy to remo=
ve it
> >>>>>>>>> for now, or let the drivers using the shared page pool logic ha=
ndle
> >>>>>>>>> the accounting themselves?
> >>>>>>> Intentionally separated the discussion for that here.
> >>>>>>>
> >>>>>>> As far as I can see this is just bluntly incorrect.
> >>>>>>>
> >>>>>>> Either the page is reclaimable or it is part of our pool and free=
able
> >>>>>>> through the shrinker, but never ever both.
> >>>>>> IIRC the original motivation for counting ION pooled pages as
> >>>>>> reclaimable was to include them into /proc/meminfo's MemAvailable
> >>>>>> calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> >>>>>> non-slab kernel pages" seems like a good place to account for them=
 but
> >>>>>> I might be wrong.
> >>>>> Yeah, that's what I see here as well. But exactly that is utterly n=
onsense.
> >>>>>
> >>>>> Those pages are not "free" in the sense that get_free_page could re=
turn
> >>>>> them directly.
> >>>> Well on Android that is kinda true, because Android has it's
> >>>> oom-killer (way back it was just a shrinker callback, not sure how i=
t
> >>>> works now), which just shot down all the background apps. So at leas=
t
> >>>> some of that (everything used by background apps) is indeed
> >>>> reclaimable on Android.
> >>>>
> >>>> But that doesn't hold on Linux in general, so we can't really do thi=
s
> >>>> for common code.
> >>>>
> >>>> Also I had a long meeting with Suren, John and other googles
> >>>> yesterday, and the aim is now to try and support all the Android gpu
> >>>> memory accounting needs with cgroups. That should work, and it will
> >>>> allow Android to handle all the Android-ism in a clean way in upstre=
am
> >>>> code. Or that's at least the plan.
> >>>>
> >>>> I think the only thing we identified that Android still needs on top
> >>>> is the dma-buf sysfs stuff, so that shared buffers (which on Android
> >>>> are always dma-buf, and always stay around as dma-buf fd throughout
> >>>> their lifetime) can be listed/analyzed with full detail.
> >>>>
> >>>> But aside from this the plan for all the per-process or per-heap
> >>>> account, oom-killer integration and everything else is planned to be
> >>>> done with cgroups.
> >>> Until cgroups are ready we probably will need to add a sysfs node to
> >>> report the total dmabuf pool size and I think that would cover our
> >>> current accounting need here.
> >>> As I mentioned, not including dmabuf pools into MemAvailable would
> >>> affect that stat and I'm wondering if pools should be considered as
> >>> part of MemAvailable or not. Since MemAvailable includes SReclaimable
> >>> I think it makes sense to include them but maybe there are other
> >>> considerations that I'm missing?
> >> On Android, yes, on upstream, not so much. Because upstream doesn't ha=
ve
> >> the android low memory killer cleanup up all the apps, so effectively =
we
> >> can't reclaim that memory, and we shouldn't report it as such.
> >> -Daniel
> > Hmm. Sorry, I fail to see why Android's low memory killer makes a
> > difference here. In my mind, the pages in the pools are not used but
> > kept there in case heaps need them (maybe that's the part I'm wrong?).
> > These pages can be freed by the shrinker if memory pressure rises.
>
> And exactly that's the difference. They *can* be freed is not the same
> thing as they *are* free.

No argument there. That's why I think meminfo has two separate stats
for MemFree and MemAvailable. MemFree is self-explanatory. The
description of MemAvailable in
https://www.kernel.org/doc/Documentation/filesystems/proc.txt says "An
estimate of how much memory is available for starting new
applications, without swapping.". Since dropping unused pages from
slabs, caches and pools is less expensive than swapping, I would
assume that a well-behaved system would do that before resorting to
swapping. And if so, such memory should be included in MemAvailable
because VM will make it available before swapping. But again, that's
my interpretation. WDYT?

>
> > In that sense I think it's very similar to reclaimable slabs which are
> > already accounted as part of MemAvailable. So it seems logical to me
> > to include unused pages in the pools here as well. What am I missing?
>
> See the shrinkers are there because you need to do some action before
> you can re-use the memory.
>
> In the case of the TTM/DRM pool for example you need to change the
> caching attributes which might cause sleeping for a TLB flush to finish.

I see your point here. But how about caches/pools which can be easily
dropped? Shouldn't they be part of MemAvailable?

>
> By accounting those pages as free you mess up (for example) the handling
> which makes sure that there are enough emergency reserves. I can only
> strongly recommend to not do that.
>
> What you could do is to add a sysfs interface to expose the different
> shrinkers and the amount of pages in them to userspace. Similar to what
> /proc/slabinfo is doing.

True, we can work around this. Just want to make sure whatever we do
really makes sense.
Thanks,
Suren.

>
> Regards,
> Christian.
>
> >
> >>>> Android (for now) only needs to account overall gpu
> >>>> memory since none of it is swappable on android drivers anyway, plus
> >>>> no vram, so not much needed.
> >>>>
> >>>> Cheers, Daniel
> >>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>> In the best case this just messes up the accounting, in the worst=
 case
> >>>>>>> it can cause memory corruption.
> >>>>>>>
> >>>>>>> Christian.
> >>>>
> >>>> --
> >>>> Daniel Vetter
> >>>> Software Engineer, Intel Corporation
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fb=
log.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447=
ee149a49f3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485=
719618349407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D11ENl28PIoSoUx6FhkEK9u4G6yi=
Lc3YhsYsl1DIzsv8%3D&amp;reserved=3D0
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblo=
g.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cbb7155447ee=
149a49f3a08d8cde2685d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63748571=
9618349407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D11ENl28PIoSoUx6FhkEK9u4G6yiLc=
3YhsYsl1DIzsv8%3D&amp;reserved=3D0
>
