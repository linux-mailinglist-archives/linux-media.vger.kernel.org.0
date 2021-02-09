Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4A231513C
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 15:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhBIOJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 09:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhBIOJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 09:09:18 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C03C061786
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 06:08:38 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id l3so9579439oii.2
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 06:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BTJYDttaThM0TbsPApmZWShKdvt0/jf6BQKpOLa02qc=;
        b=MWwfCze7wQ1sq6BbwGLCHFbjol98KkOqIArN+Y6nHaOnVvydQmzQet5xdE46q68DnY
         tZM4knLjnx9jklXkAxd8HfVy0/6Vxw3FywTGu2nh7ZKbXtoVJYCWBXBzonweq2NKites
         KobfBW29sjsjAodHJmDLbBsf0p0y9MYtm3SCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BTJYDttaThM0TbsPApmZWShKdvt0/jf6BQKpOLa02qc=;
        b=Lsqusj9Pzm420ibaUyAb4/h3VX/4dJ8Asl7sbKQUBb177tvIATMiXtmDbbgZh00RE1
         DHFksIlm8eAfsGoLMS3Oe0zUXS69fI0iUmfN2QNEih0MPQSwfNT2g9rCM+0ZvG6oryPE
         Nowj+/uWX6h4QFlO9CfCs8fRvsse0lIEmPJjd2I7w+KddBZNYI9CDd4pITM06VPfkZts
         dXYxHiWYJq9eA0ifmT1XiHYRh7SXGQ4hLqXtzEMu6/B4bC9HXfPYqxyxzrhnO2qCotVA
         RlgErS+9dZq1NA1MeA5bGq+nFEN1ZIF9k36yaZ8wR/eWOhArldccnPBGYdvWXE9Ae9uB
         h1lA==
X-Gm-Message-State: AOAM532U70m7pAWCgtfvMvZ34/O/XpP3QKqgc4WiIJ642+beXx9ndRiW
        jYMYkF0gjbBBfM7TUuGDzbCGastxYrVuNz2zycZlRw==
X-Google-Smtp-Source: ABdhPJylEspj8q3ruC6Y5VW7xS7u3JCf7Bpyh7RRi7J3mnlK/e2LcHQz8nxgeqvtKFIYGd58nHcy4Uvj8EyhekOMU4E=
X-Received: by 2002:aca:1906:: with SMTP id l6mr2505005oii.101.1612879717637;
 Tue, 09 Feb 2021 06:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com> <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com> <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com> <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
 <CAP+8YyG1Yupdqvrp4uUunYkVeZvhWB4rojfAtuSwMmqXRj44oQ@mail.gmail.com>
 <CAKMK7uFwdmV007YhCF8ZDkzNFT71RapLPL5zHgjjsFd9huoUEg@mail.gmail.com> <d08c9a4c-e054-0f05-ebaf-94e05d98b798@amd.com>
In-Reply-To: <d08c9a4c-e054-0f05-ebaf-94e05d98b798@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 9 Feb 2021 15:08:26 +0100
Message-ID: <CAKMK7uF-_QaQ+vvDPM1KEy34X3G5yfhmco290bmQyNSpSFSZbg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Felix Kuehling <felix.kuehling@amd.com>
Cc:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        "Koenig, Christian" <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 9, 2021 at 12:15 PM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
> Am 2021-02-09 um 1:37 a.m. schrieb Daniel Vetter:
> > On Tue, Feb 9, 2021 at 4:13 AM Bas Nieuwenhuizen
> > <bas@basnieuwenhuizen.nl> wrote:
> >> On Thu, Jan 28, 2021 at 4:40 PM Felix Kuehling <felix.kuehling@amd.com=
> wrote:
> >>> Am 2021-01-28 um 2:39 a.m. schrieb Christian K=C3=B6nig:
> >>>> Am 27.01.21 um 23:00 schrieb Felix Kuehling:
> >>>>> Am 2021-01-27 um 7:16 a.m. schrieb Christian K=C3=B6nig:
> >>>>>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
> >>>>>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
> >>>>>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> >>>>>>>>> Recently there was a fairly long thread about recoreable hardwa=
re
> >>>>>>>>> page
> >>>>>>>>> faults, how they can deadlock, and what to do about that.
> >>>>>>>>>
> >>>>>>>>> While the discussion is still fresh I figured good time to try =
and
> >>>>>>>>> document the conclusions a bit.
> >>>>>>>>>
> >>>>>>>>> References:
> >>>>>>>>> https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.=
Kuehling@amd.com/
> >>>>>>>>>
> >>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>>>>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> >>>>>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
> >>>>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
> >>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>>>>>> Cc: linux-media@vger.kernel.org
> >>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>>>>>> --
> >>>>>>>>> I'll be away next week, but figured I'll type this up quickly f=
or
> >>>>>>>>> some
> >>>>>>>>> comments and to check whether I got this all roughly right.
> >>>>>>>>>
> >>>>>>>>> Critique very much wanted on this, so that we can make sure hw =
which
> >>>>>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
> >>>>>>>>> path to
> >>>>>>>>> support page faults in upstream. So anything I missed, got wron=
g or
> >>>>>>>>> like that would be good.
> >>>>>>>>> -Daniel
> >>>>>>>>> ---
> >>>>>>>>>    Documentation/driver-api/dma-buf.rst | 66
> >>>>>>>>> ++++++++++++++++++++++++++++
> >>>>>>>>>    1 file changed, 66 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
> >>>>>>>>> b/Documentation/driver-api/dma-buf.rst
> >>>>>>>>> index a2133d69872c..e924c1e4f7a3 100644
> >>>>>>>>> --- a/Documentation/driver-api/dma-buf.rst
> >>>>>>>>> +++ b/Documentation/driver-api/dma-buf.rst
> >>>>>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
> >>>>>>>>>      userspace is allowed to use userspace fencing or long runn=
ing
> >>>>>>>>> compute
> >>>>>>>>>      workloads. This also means no implicit fencing for shared
> >>>>>>>>> buffers in these
> >>>>>>>>>      cases.
> >>>>>>>>> +
> >>>>>>>>> +Recoverable Hardware Page Faults Implications
> >>>>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>>>>>>> +
> >>>>>>>>> +Modern hardware supports recoverable page faults, which has a
> >>>>>>>>> lot of
> >>>>>>>>> +implications for DMA fences.
> >>>>>>>>> +
> >>>>>>>>> +First, a pending page fault obviously holds up the work that's
> >>>>>>>>> running on the
> >>>>>>>>> +accelerator and a memory allocation is usually required to res=
olve
> >>>>>>>>> the fault.
> >>>>>>>>> +But memory allocations are not allowed to gate completion of D=
MA
> >>>>>>>>> fences, which
> >>>>>>>>> +means any workload using recoverable page faults cannot use DM=
A
> >>>>>>>>> fences for
> >>>>>>>>> +synchronization. Synchronization fences controlled by userspac=
e
> >>>>>>>>> must be used
> >>>>>>>>> +instead.
> >>>>>>>>> +
> >>>>>>>>> +On GPUs this poses a problem, because current desktop composit=
or
> >>>>>>>>> protocols on
> >>>>>>>>> +Linus rely on DMA fences, which means without an entirely new
> >>>>>>>>> userspace stack
> >>>>>>>>> +built on top of userspace fences, they cannot benefit from
> >>>>>>>>> recoverable page
> >>>>>>>>> +faults. The exception is when page faults are only used as
> >>>>>>>>> migration hints and
> >>>>>>>>> +never to on-demand fill a memory request. For now this means
> >>>>>>>>> recoverable page
> >>>>>>>>> +faults on GPUs are limited to pure compute workloads.
> >>>>>>>>> +
> >>>>>>>>> +Furthermore GPUs usually have shared resources between the 3D
> >>>>>>>>> rendering and
> >>>>>>>>> +compute side, like compute units or command submission engines=
. If
> >>>>>>>>> both a 3D
> >>>>>>>>> +job with a DMA fence and a compute workload using recoverable =
page
> >>>>>>>>> faults are
> >>>>>>>>> +pending they could deadlock:
> >>>>>>>>> +
> >>>>>>>>> +- The 3D workload might need to wait for the compute job to fi=
nish
> >>>>>>>>> and release
> >>>>>>>>> +  hardware resources first.
> >>>>>>>>> +
> >>>>>>>>> +- The compute workload might be stuck in a page fault, because=
 the
> >>>>>>>>> memory
> >>>>>>>>> +  allocation is waiting for the DMA fence of the 3D workload t=
o
> >>>>>>>>> complete.
> >>>>>>>>> +
> >>>>>>>>> +There are a few ways to prevent this problem:
> >>>>>>>>> +
> >>>>>>>>> +- Compute workloads can always be preempted, even when a page
> >>>>>>>>> fault is pending
> >>>>>>>>> +  and not yet repaired. Not all hardware supports this.
> >>>>>>>>> +
> >>>>>>>>> +- DMA fence workloads and workloads which need page fault hand=
ling
> >>>>>>>>> have
> >>>>>>>>> +  independent hardware resources to guarantee forward progress=
.
> >>>>>>>>> This could be
> >>>>>>>>> +  achieved through e.g. through dedicated engines and minimal
> >>>>>>>>> compute unit
> >>>>>>>>> +  reservations for DMA fence workloads.
> >>>>>>>>> +
> >>>>>>>>> +- The reservation approach could be further refined by only
> >>>>>>>>> reserving the
> >>>>>>>>> +  hardware resources for DMA fence workloads when they are
> >>>>>>>>> in-flight. This must
> >>>>>>>>> +  cover the time from when the DMA fence is visible to other
> >>>>>>>>> threads up to
> >>>>>>>>> +  moment when fence is completed through dma_fence_signal().
> >>>>>>>>> +
> >>>>>>>>> +- As a last resort, if the hardware provides no useful reserva=
tion
> >>>>>>>>> mechanics,
> >>>>>>>>> +  all workloads must be flushed from the GPU when switching
> >>>>>>>>> between jobs
> >>>>>>>>> +  requiring DMA fences or jobs requiring page fault handling: =
This
> >>>>>>>>> means all DMA
> >>>>>>>>> +  fences must complete before a compute job with page fault
> >>>>>>>>> handling can be
> >>>>>>>>> +  inserted into the scheduler queue. And vice versa, before a =
DMA
> >>>>>>>>> fence can be
> >>>>>>>>> +  made visible anywhere in the system, all compute workloads m=
ust
> >>>>>>>>> be preempted
> >>>>>>>>> +  to guarantee all pending GPU page faults are flushed.
> >>>>>>>> I thought of another possible workaround:
> >>>>>>>>
> >>>>>>>>     * Partition the memory. Servicing of page faults will use a
> >>>>>>>> separate
> >>>>>>>>       memory pool that can always be allocated from without
> >>>>>>>> waiting for
> >>>>>>>>       fences. This includes memory for page tables and memory fo=
r
> >>>>>>>>       migrating data to. You may steal memory from other process=
es
> >>>>>>>> that
> >>>>>>>>       can page fault, so no fence waiting is necessary. Being ab=
le to
> >>>>>>>>       steal memory at any time also means there are basically no
> >>>>>>>>       out-of-memory situations you need to worry about. Even pag=
e
> >>>>>>>> tables
> >>>>>>>>       (except the root page directory of each process) can be
> >>>>>>>> stolen in
> >>>>>>>>       the worst case.
> >>>>>>> I think 'overcommit' would be a nice way to describe this. But I'=
m not
> >>>>>>> sure how easy this is to implement in practice. You would basical=
ly
> >>>>>>> need
> >>>>>>> to create your own memory manager for this.
> >>>>>> Well you would need a completely separate pool for both device as =
well
> >>>>>> as system memory.
> >>>>>>
> >>>>>> E.g. on boot we say we steal X GB system memory only for HMM.
> >>>>> Why? The GPU driver doesn't need to allocate system memory for HMM.
> >>>>> Migrations to system memory are handled by the kernel's handle_mm_f=
ault
> >>>>> and page allocator and swap logic.
> >>>> And that one depends on dma_fence completion because you can easily
> >>>> need to wait for an MMU notifier callback.
> >>> I see, the GFX MMU notifier for userpointers in amdgpu currently wait=
s
> >>> for fences. For the KFD MMU notifier I am planning to fix this by
> >>> causing GPU page faults instead of preempting the queues. Can we limi=
t
> >>> userptrs in amdgpu to engines that can page fault. Basically make it
> >>> illegal to attach userptr BOs to graphics CS BO lists, so they can on=
ly
> >>> be used in user mode command submissions, which can page fault. Then =
the
> >>> GFX MMU notifier could invalidate PTEs and would not have to wait for
> >>> fences.
> >> sadly graphics + userptr is already exposed via Mesa.
> > This is not about userptr, we fake userptr entirely in software. It's
> > about exposing recoverable gpu page faults (which would make userptr
> > maybe more efficient since we could do on-demand paging). userptr
> > itself isn't a problem, but it is part of the reasons why this is
> > tricky.
> >
> > Christian/Felix, I think for kernel folks this is clear enough that I
> > don't need to clarify this in the text?
>
> Yeah, it's clear to me. Anyway, your latest text doesn't reference
> userptr directly and keeps the discussion at a fairly abstract level. So
> I think it's fine. It's the practical details of the proposed
> workarounds where it feel like walking through a mirror cabinet, bumping
> into unexpected obstacles with every other step.

Oh yes, this is very high-level. The implementation is going to be
very trick, no matter which one we're picking. And tbh I expect
surprises and things we'll learn. But I'm still hoping that this high
level doc patch will help a lot with avoiding the worst problems.

Of course once we have some of these hacks landed we should look at it
again and maybe update where it's wrong/unclear/...

btw r-b: from you too on the patch?

Cheers, Daniel

>
> Regards,
>   Felix
>
>
> > -Daniel
> >
> >>>
> >>>> As Maarten wrote when you want to go down this route you need a
> >>>> complete separate memory management parallel to the one of the kerne=
l.
> >>> Not really. I'm trying to make the GPU memory management more similar=
 to
> >>> what the kernel does for system memory.
> >>>
> >>> I understood Maarten's comment as "I'm creating a new memory manager =
and
> >>> not using TTM any more". This is true. The idea is that this portion =
of
> >>> VRAM would be managed more like system memory.
> >>>
> >>> Regards,
> >>>   Felix
> >>>
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>   It doesn't depend on any fences, so
> >>>>> it cannot deadlock with any GPU driver-managed memory. The GPU driv=
er
> >>>>> gets involved in the MMU notifier to invalidate device page tables.=
 But
> >>>>> that also doesn't need to wait for any fences.
> >>>>>
> >>>>> And if the kernel runs out of pageable memory, you're in trouble an=
yway.
> >>>>> The OOM killer will step in, nothing new there.
> >>>>>
> >>>>> Regards,
> >>>>>    Felix
> >>>>>
> >>>>>
> >>>>>>> But from a design point of view, definitely a valid solution.
> >>>>>> I think the restriction above makes it pretty much unusable.
> >>>>>>
> >>>>>>> But this looks good, those solutions are definitely the valid
> >>>>>>> options we
> >>>>>>> can choose from.
> >>>>>> It's certainly worth noting, yes. And just to make sure that nobod=
y
> >>>>>> has the idea to reserve only device memory.
> >>>>>>
> >>>>>> Christian.
> >>>>>>
> >>>>>>> ~Maarten
> >>>>>>>
> >>>>> _______________________________________________
> >>>>> Linaro-mm-sig mailing list
> >>>>> Linaro-mm-sig@lists.linaro.org
> >>>>> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> >>>>>
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
