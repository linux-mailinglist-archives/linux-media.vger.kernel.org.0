Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A292631677D
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 14:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhBJNH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 08:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhBJNHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 08:07:31 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54349C061786
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 05:06:50 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id w4so1775504wmi.4
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vWjBWvQGye13+7MEOsW3WY2wA0+N3oWZdpjvZSe2p7s=;
        b=UX+PcbmGXshC1SgIRJQjOu9U2SVaDM3DTuqb/lPCGbOnrC8AugwDoo1YFbbNb7oKvO
         SeR6Ed5M7bWiJfZnpidco12k1pU6EyW+bg8VMX3IvUezzmTCfI5dZBra4ArywFO4e3TM
         YFK26V3E7LwMWIg1+bm9MzIXUfzZIbdEmZNAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=vWjBWvQGye13+7MEOsW3WY2wA0+N3oWZdpjvZSe2p7s=;
        b=gRm5JmU0XOl9uZEgrP/I408bjluwYgiOOAd24u5OL1rVj4Mk9a8UkF0PwUP06pe6jI
         eY9ed9BEKgE4FVxDRLSi8CD6VBpHV3EotBSV2EchHz1dZ8fUsPc9aDgI8RWyDA1zuaSH
         0Po+7vO+LWrQXS8pv/mc6KHjndtgePFbJJBQk4ZoKyG16YlNgrh4eaYj9ExetMyzXH2C
         vEysyLa+IH9/3cnAKD2Y+9IP3fPABEbb9JHDMPEs76sRmtjG8rQw4CWNeuqjezL17zaJ
         anLQ47P1SzWhN691c4NGs/KOcvjobHYbTJm4/wdZihg7/dkV+VyFmQ//6jYzIV0s5H8r
         w6DQ==
X-Gm-Message-State: AOAM533yEdyNEMgK/tUiRyzEeymwot4tFjI6nNBi/fyRtXjZz2eUUfJB
        qgSWQZ51vOjGwp9A4H/8duFfQg==
X-Google-Smtp-Source: ABdhPJx2bij1PtQQiNnBQzdVawVUJd7fn89kx3OW6odklV2HyN/2m8qFAzjgG1FdmW0rSAcp45aIDg==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr2889601wmb.14.1612962408981;
        Wed, 10 Feb 2021 05:06:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r16sm2680646wrt.68.2021.02.10.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:06:47 -0800 (PST)
Date:   Wed, 10 Feb 2021 14:06:45 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
Message-ID: <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
Mail-Followup-To: Suren Baghdasaryan <surenb@google.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
 <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
> On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Feb 9, 2021 at 6:46 PM Christian König <christian.koenig@amd.com> wrote:
> > >
> > >
> > >
> > > Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > > > On Tue, Feb 9, 2021 at 4:57 AM Christian König <christian.koenig@amd.com> wrote:
> > > >> Am 09.02.21 um 13:11 schrieb Christian König:
> > > >>> [SNIP]
> > > >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
> > > >>>>>> +{
> > > >>>>>> +     spin_lock(&pool->lock);
> > > >>>>>> +     list_add_tail(&page->lru, &pool->items);
> > > >>>>>> +     pool->count++;
> > > >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> > > >>>>>> +     spin_unlock(&pool->lock);
> > > >>>>>> +
> > > >>>>>> +     mod_node_page_state(page_pgdat(page),
> > > >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> > > >>>>>> +                         1 << pool->order);
> > > >>>>> Hui what? What should that be good for?
> > > >>>> This is a carryover from the ION page pool implementation:
> > > >>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147a5b08d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484888114923580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdunn3dF6C0kyfCw%3D&amp;reserved=0
> > > >>>>
> > > >>>>
> > > >>>> My sense is it helps with the vmstat/meminfo accounting so folks can
> > > >>>> see the cached pages are shrinkable/freeable. This maybe falls under
> > > >>>> other dmabuf accounting/stats discussions, so I'm happy to remove it
> > > >>>> for now, or let the drivers using the shared page pool logic handle
> > > >>>> the accounting themselves?
> > > >> Intentionally separated the discussion for that here.
> > > >>
> > > >> As far as I can see this is just bluntly incorrect.
> > > >>
> > > >> Either the page is reclaimable or it is part of our pool and freeable
> > > >> through the shrinker, but never ever both.
> > > > IIRC the original motivation for counting ION pooled pages as
> > > > reclaimable was to include them into /proc/meminfo's MemAvailable
> > > > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> > > > non-slab kernel pages" seems like a good place to account for them but
> > > > I might be wrong.
> > >
> > > Yeah, that's what I see here as well. But exactly that is utterly nonsense.
> > >
> > > Those pages are not "free" in the sense that get_free_page could return
> > > them directly.
> >
> > Well on Android that is kinda true, because Android has it's
> > oom-killer (way back it was just a shrinker callback, not sure how it
> > works now), which just shot down all the background apps. So at least
> > some of that (everything used by background apps) is indeed
> > reclaimable on Android.
> >
> > But that doesn't hold on Linux in general, so we can't really do this
> > for common code.
> >
> > Also I had a long meeting with Suren, John and other googles
> > yesterday, and the aim is now to try and support all the Android gpu
> > memory accounting needs with cgroups. That should work, and it will
> > allow Android to handle all the Android-ism in a clean way in upstream
> > code. Or that's at least the plan.
> >
> > I think the only thing we identified that Android still needs on top
> > is the dma-buf sysfs stuff, so that shared buffers (which on Android
> > are always dma-buf, and always stay around as dma-buf fd throughout
> > their lifetime) can be listed/analyzed with full detail.
> >
> > But aside from this the plan for all the per-process or per-heap
> > account, oom-killer integration and everything else is planned to be
> > done with cgroups.
> 
> Until cgroups are ready we probably will need to add a sysfs node to
> report the total dmabuf pool size and I think that would cover our
> current accounting need here.
> As I mentioned, not including dmabuf pools into MemAvailable would
> affect that stat and I'm wondering if pools should be considered as
> part of MemAvailable or not. Since MemAvailable includes SReclaimable
> I think it makes sense to include them but maybe there are other
> considerations that I'm missing?

On Android, yes, on upstream, not so much. Because upstream doesn't have
the android low memory killer cleanup up all the apps, so effectively we
can't reclaim that memory, and we shouldn't report it as such.
-Daniel

> 
> > Android (for now) only needs to account overall gpu
> > memory since none of it is swappable on android drivers anyway, plus
> > no vram, so not much needed.
> >
> > Cheers, Daniel
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > >> In the best case this just messes up the accounting, in the worst case
> > > >> it can cause memory corruption.
> > > >>
> > > >> Christian.
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
