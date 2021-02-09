Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B5B31585B
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 22:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbhBIVKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 16:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbhBIUjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 15:39:47 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57356C061A2E
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 12:03:43 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id e4so435459ote.5
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IJlgwhfz5X2MzqyUYiX7MoKMMru1jZl967/DhPZ5YYM=;
        b=IGmyMapjKGK/9ul8hQQxgz0gLOuVsIS61seKmxzpC1gsISZYlX9S0ZdRSi6pidiwJy
         /7+efzyjKx/pki6VZAJYF8FmQsEzU0QegZmkdybN9xKSoh8OLwEH6pZ4myK/CdqnQwS+
         B6Q0KNJIPoX38WLQN4Nja7XJlR8U91dMQP83w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IJlgwhfz5X2MzqyUYiX7MoKMMru1jZl967/DhPZ5YYM=;
        b=RJaVnA81hjQHPoMotedxnZo/pxO+pickRlDppz5GSFjzPVDJVRXhu616jsD39LHkPr
         IOEi1jtUm0JkbUdrHC3HEaGd8mfAZ61+wt+JdsNu7SuspFTXhF4GhqtSQefR9C+SukfM
         FunAQKdX9EcDPwtEufuO0F8JYg0RxQO8WSyS3sctTZhpkenYogzIPKjy4ozkQOYx3PGS
         Hzu5sJoTMIG67aagQ+dKbjBLjt1G4lCFnuGtUvY4cc6ItSIXYOYRJbkByOk5BcZoePbv
         LO4TV50QNWSeWq1OSzKXq7LJuDBJWDmy4pDQmdqfMrpyblMzlf/eOO7VrdA1Pr9UuDEg
         SMcQ==
X-Gm-Message-State: AOAM533shUXDK0YQqHELzygGQlDx6+8I/ICv0ORuKDdmQcjAzRFL/+dL
        1YnOXQfmVhL+qsUgSNfgQqgcMaM+KWykpihirT0PbA==
X-Google-Smtp-Source: ABdhPJyX/1b2gHbOIodL9USnpmSk1z6/zBN4m375xL0pFFQK6OiEEYkpdSgQI3DPMm8b3vcVG/bBnUBSdBUjia2by5w=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr17540016oth.281.1612901022725;
 Tue, 09 Feb 2021 12:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com> <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
In-Reply-To: <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 9 Feb 2021 21:03:31 +0100
Message-ID: <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
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

On Tue, Feb 9, 2021 at 6:46 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
>
>
> Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> >>> [SNIP]
> >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p=
age)
> >>>>>> +{
> >>>>>> +     spin_lock(&pool->lock);
> >>>>>> +     list_add_tail(&page->lru, &pool->items);
> >>>>>> +     pool->count++;
> >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> >>>>>> +     spin_unlock(&pool->lock);
> >>>>>> +
> >>>>>> +     mod_node_page_state(page_pgdat(page),
> >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> >>>>>> +                         1 << pool->order);
> >>>>> Hui what? What should that be good for?
> >>>> This is a carryover from the ION page pool implementation:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
git.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F=
tree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n2=
8&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147a5b08d=
8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484888114923580%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdunn3dF6C=
0kyfCw%3D&amp;reserved=3D0
> >>>>
> >>>>
> >>>> My sense is it helps with the vmstat/meminfo accounting so folks can
> >>>> see the cached pages are shrinkable/freeable. This maybe falls under
> >>>> other dmabuf accounting/stats discussions, so I'm happy to remove it
> >>>> for now, or let the drivers using the shared page pool logic handle
> >>>> the accounting themselves?
> >> Intentionally separated the discussion for that here.
> >>
> >> As far as I can see this is just bluntly incorrect.
> >>
> >> Either the page is reclaimable or it is part of our pool and freeable
> >> through the shrinker, but never ever both.
> > IIRC the original motivation for counting ION pooled pages as
> > reclaimable was to include them into /proc/meminfo's MemAvailable
> > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> > non-slab kernel pages" seems like a good place to account for them but
> > I might be wrong.
>
> Yeah, that's what I see here as well. But exactly that is utterly nonsens=
e.
>
> Those pages are not "free" in the sense that get_free_page could return
> them directly.

Well on Android that is kinda true, because Android has it's
oom-killer (way back it was just a shrinker callback, not sure how it
works now), which just shot down all the background apps. So at least
some of that (everything used by background apps) is indeed
reclaimable on Android.

But that doesn't hold on Linux in general, so we can't really do this
for common code.

Also I had a long meeting with Suren, John and other googles
yesterday, and the aim is now to try and support all the Android gpu
memory accounting needs with cgroups. That should work, and it will
allow Android to handle all the Android-ism in a clean way in upstream
code. Or that's at least the plan.

I think the only thing we identified that Android still needs on top
is the dma-buf sysfs stuff, so that shared buffers (which on Android
are always dma-buf, and always stay around as dma-buf fd throughout
their lifetime) can be listed/analyzed with full detail.

But aside from this the plan for all the per-process or per-heap
account, oom-killer integration and everything else is planned to be
done with cgroups. Android (for now) only needs to account overall gpu
memory since none of it is swappable on android drivers anyway, plus
no vram, so not much needed.

Cheers, Daniel

>
> Regards,
> Christian.
>
> >
> >> In the best case this just messes up the accounting, in the worst case
> >> it can cause memory corruption.
> >>
> >> Christian.
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
