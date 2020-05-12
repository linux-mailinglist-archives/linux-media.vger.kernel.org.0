Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA951CFA99
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 18:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgELQ1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 12:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELQ1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 12:27:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C7DC061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 09:27:15 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id r66so18748604oie.5
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MJbloyb8GeFV+8WTKCZZjFvi4tHQNahuAS+Pb3o2Kyk=;
        b=YE9ZEB/csOO/qgzFHHZkD+kfc7F2OXh03OJ8P+gb/y34vODSSeNOtlafjQf9mkvp75
         nYqfWl2OARG5rd4Cmhx1dVe8jvVR9/6+KZO4hv32d0sr8zCzIS96b3PZebL6xAWi2l30
         aueBQw0FW2Mn2/EdEJItXdMN2tEisjXtwIGy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MJbloyb8GeFV+8WTKCZZjFvi4tHQNahuAS+Pb3o2Kyk=;
        b=kiUiIcCgztLhPF10JWpp/Jr7qZmkl+T2rP5Ru/nb3pdG+7j6SNBGnq9DrMWpZ0tMYf
         W3b6WnIhaTO1fAEYby5zScK1hjZKDAQ8NMjMdWCpzkAzqi+E7EEwDLP2K3g5RD2jwjMB
         dXQSzWRrfTurUKyjIAdLYdQ978K1/KKvk3MA5r/pMXf/d26Hhlf0zSDNuVdP7LfMULdy
         FotfdWOD0TqEFQ+xKyQrj/v+Xq4/ksN8alG3R7FEa/CtSxNpmhtnzV0/RMdrjUT+V3SN
         7cfGSfbd1DC1s6w0WpCYJtL3vZLpeM5UnzBuAbcbyQREBe2IYbIos/aMrX4ymDZex84n
         pRKQ==
X-Gm-Message-State: AGi0PuY63/ZnlQej7fFFfuAQkoL2vkHK16njqff4umy3R+6w8hSb8AtO
        jWDIO7wQScSA08eMEM4J5HAE/5Tv34qygcRyA1xRQA==
X-Google-Smtp-Source: APiQypJU803JZeffGdUiKfSFxC4qEhXBDbbj5VZjPE9IPYrJYd5IqjMvmHgdml9yeEAH/819ES+YujXGuMcW2zkufnY=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr5799116oia.101.1589300834676;
 Tue, 12 May 2020 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-11-daniel.vetter@ffwll.ch> <879b127e-2180-bc59-f522-252416a7ac01@amd.com>
 <CAKMK7uF1c3R7DTsvRaBfzRVAx03Z+AiUnqdAzP=mt4d=KsoEgg@mail.gmail.com>
In-Reply-To: <CAKMK7uF1c3R7DTsvRaBfzRVAx03Z+AiUnqdAzP=mt4d=KsoEgg@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 12 May 2020 18:27:03 +0200
Message-ID: <CAKMK7uGUBqcwo56p3f+8B=ntvuYZ8WtKaFxAPJ_D=H7qdDsGqQ@mail.gmail.com>
Subject: Re: [RFC 10/17] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 6:20 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Tue, May 12, 2020 at 5:56 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Hui what? Of hand that doesn't looks correct to me.
>
> It's not GFP_ATOMIC, it's just that GFP_ATOMIC is the only shotgun we
> have to avoid direct reclaim. And direct reclaim might need to call
> into your mmu notifier, which might need to wait on a fence, which is
> never going to happen because your scheduler is stuck.
>
> Note that all the explanations for the deadlocks and stuff I'm trying
> to hunt here are in the other patches, the driver ones are more
> informational, so I left these here rather bare-bones to shut up
> lockdep so I can get through the entire driver and all major areas
> (scheduler, reset, modeset code).
>
> Now you can do something like GFP_NOFS, but the only reasons that
> works is because the direct reclaim annotations
> (fs_reclaim_acquire/release) only validates against __GFP_FS, and not
> against any of the other flags. We should probably add some lockdep
> annotations so that __GFP_RECLAIM is annotated against the
> __mmu_notifier_invalidate_range_start_map lockdep map I've recently
> added for mmu notifiers. End result (assuming I'm not mixing anything
> up here, this is all rather tricky stuff): GFP_ATOMIC is the only kind
> of memory allocation you can do.
>
> > Why the heck should this be an atomic context? If that's correct
> > allocating memory is the least of the problems we have.
>
> It's not about atomic, it's !__GFP_RECLAIM. Which more or less is
> GFP_ATOMIC. Correct fix is probably GFP_ATOMIC + a mempool for the
> scheduler fixes so that if you can't allocate them for some reason,
> you at least know that your scheduler should eventually retire retire
> some of them, which you can then pick up from the mempool to guarantee
> forward progress.
>
> But I really didn't dig into details of the code, this was just a quick h=
ack.
>
> So sleeping and taking all kinds of locks (but not all, e.g.
> dma_resv_lock and drm_modeset_lock are no-go) is still totally ok.
> Just think
>
> #define GFP_NO_DIRECT_RECLAIM GFP_ATOMIC

Maybe slightly different take that's easier to understand: You've
already made the observation that anything holding adev->notifier_lock
isn't allowed to allocate memory (well GFP_ATOMIC is ok, like here).

Only thing I'm adding is that the situation is a lot worse. Plus the
lockdep annotations to help us catch these issues.
-Daniel

> Cheers, Daniel
>
> >
> > Regards,
> > Christian.
> >
> > Am 12.05.20 um 10:59 schrieb Daniel Vetter:
> > > My dma-fence lockdep annotations caught an inversion because we
> > > allocate memory where we really shouldn't:
> > >
> > >       kmem_cache_alloc+0x2b/0x6d0
> > >       amdgpu_fence_emit+0x30/0x330 [amdgpu]
> > >       amdgpu_ib_schedule+0x306/0x550 [amdgpu]
> > >       amdgpu_job_run+0x10f/0x260 [amdgpu]
> > >       drm_sched_main+0x1b9/0x490 [gpu_sched]
> > >       kthread+0x12e/0x150
> > >
> > > Trouble right now is that lockdep only validates against GFP_FS, whic=
h
> > > would be good enough for shrinkers. But for mmu_notifiers we actually
> > > need !GFP_ATOMIC, since they can be called from any page laundering,
> > > even if GFP_NOFS or GFP_NOIO are set.
> > >
> > > I guess we should improve the lockdep annotations for
> > > fs_reclaim_acquire/release.
> > >
> > > Ofc real fix is to properly preallocate this fence and stuff it into
> > > the amdgpu job structure. But GFP_ATOMIC gets the lockdep splat out o=
f
> > > the way.
> > >
> > > v2: Two more allocations in scheduler paths.
> > >
> > > Frist one:
> > >
> > >       __kmalloc+0x58/0x720
> > >       amdgpu_vmid_grab+0x100/0xca0 [amdgpu]
> > >       amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> > >       drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> > >       drm_sched_main+0xf9/0x490 [gpu_sched]
> > >
> > > Second one:
> > >
> > >       kmem_cache_alloc+0x2b/0x6d0
> > >       amdgpu_sync_fence+0x7e/0x110 [amdgpu]
> > >       amdgpu_vmid_grab+0x86b/0xca0 [amdgpu]
> > >       amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> > >       drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> > >       drm_sched_main+0xf9/0x490 [gpu_sched]
> > >
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-rdma@vger.kernel.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c   | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  | 2 +-
> > >   3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_fence.c
> > > index d878fe7fee51..055b47241bb1 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > @@ -143,7 +143,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, s=
truct dma_fence **f,
> > >       uint32_t seq;
> > >       int r;
> > >
> > > -     fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
> > > +     fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
> > >       if (fence =3D=3D NULL)
> > >               return -ENOMEM;
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ids.c
> > > index fe92dcd94d4a..fdcd6659f5ad 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > > @@ -208,7 +208,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm=
 *vm,
> > >       if (ring->vmid_wait && !dma_fence_is_signaled(ring->vmid_wait))
> > >               return amdgpu_sync_fence(sync, ring->vmid_wait, false);
> > >
> > > -     fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_K=
ERNEL);
> > > +     fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_A=
TOMIC);
> > >       if (!fences)
> > >               return -ENOMEM;
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_sync.c
> > > index b87ca171986a..330476cc0c86 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > @@ -168,7 +168,7 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, s=
truct dma_fence *f,
> > >       if (amdgpu_sync_add_later(sync, f, explicit))
> > >               return 0;
> > >
> > > -     e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_KERNEL);
> > > +     e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_ATOMIC);
> > >       if (!e)
> > >               return -ENOMEM;
> > >
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
