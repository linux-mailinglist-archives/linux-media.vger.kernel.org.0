Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17FCA3146E4
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 04:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhBIDRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 22:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhBIDOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 22:14:02 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CE8C061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 19:13:16 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id p132so89078iod.11
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 19:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=basnieuwenhuizen.nl; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+vg8VpFc17PJ2I1zpe0BmGy4aXSPFZcjbp/KJintL+8=;
        b=XkhTjPBKA75JAZYVVb3KsbNFtIjDQ+KLvFOdF+pbRRqb3FJWrOoZXWIqMCiUWKn1+Z
         flEnEFdhtxPwRNebcNXbQbRqo6r4eEoEJojEaUBBO87XgkeUNGRU9YBqUlcvNymV63fP
         79YRMFF4niHtnqaTHjdaso+06LsCPkkOh6bINGbEJ3ACvXN+ZIciMo5avYl/IrtrDNel
         OHdeO78X2LylvuZ3WvUWXybX1HXXaMT59F7XCcSZckCTfMPgXGynfXyWdut2J6x3B4V7
         aKvaXMMCAAbYpaK635vUrTBbY+moWlw/E7oOIjnJkJszOcu26JCEq/LVA3QgCSF4e1xM
         GSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+vg8VpFc17PJ2I1zpe0BmGy4aXSPFZcjbp/KJintL+8=;
        b=GPDW8Lj+H8db2qJecfcQTfwIq8JLf+l5KMaf1AvH86Y23rsKK74nXcHqfN/oPAFsZC
         fp3ZjgmOVfBS+4Ge/a2mD90wZiU2znt9Z2T+yrLLc+AsDKjjpABDGEbtkzLxTzD0JWyq
         Ob2sev262zFpeLT30LB3oowUZ7yjyPy3HZgtPWdkyWiVc7avbsBj/4Iwma4RTJIKAlAp
         OAkOylb+KyImfN2nCIf3iUwCfKQFe0x8CdWKpSnpsWfvQK/y0y5ZL7qSXjFMj1UjdTXw
         ow9KoLobuzThyn1W8t+kj5JE2DoWuCBSkxQtI9wY5dg+2/HpzqhJxobuPcdy3sRfHlw/
         h/IQ==
X-Gm-Message-State: AOAM532zA7vaQdLjqkH7acLd3mRVmMhVuJcajuJZ+C/AIqLuzX6rhmjl
        rTTlPT0vAmO1Gvv2tIJTr6Wl7vm6kBELImY86g2HOw==
X-Google-Smtp-Source: ABdhPJzFLjYxQenWbJ+wqhuJ/IlQjdiutzK+yaOIu3yAoQZ8yGIZ3K5SjxIY6KFX0jWHr7zttv1+66sCwoiIaewmlzo=
X-Received: by 2002:a5d:9143:: with SMTP id y3mr18266813ioq.98.1612840395704;
 Mon, 08 Feb 2021 19:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com> <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com> <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com> <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
In-Reply-To: <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
From:   Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date:   Tue, 9 Feb 2021 04:13:44 +0100
Message-ID: <CAP+8YyG1Yupdqvrp4uUunYkVeZvhWB4rojfAtuSwMmqXRj44oQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Felix Kuehling <felix.kuehling@amd.com>
Cc:     "Koenig, Christian" <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 4:40 PM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
>
> Am 2021-01-28 um 2:39 a.m. schrieb Christian K=C3=B6nig:
> > Am 27.01.21 um 23:00 schrieb Felix Kuehling:
> >> Am 2021-01-27 um 7:16 a.m. schrieb Christian K=C3=B6nig:
> >>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
> >>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
> >>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> >>>>>> Recently there was a fairly long thread about recoreable hardware
> >>>>>> page
> >>>>>> faults, how they can deadlock, and what to do about that.
> >>>>>>
> >>>>>> While the discussion is still fresh I figured good time to try and
> >>>>>> document the conclusions a bit.
> >>>>>>
> >>>>>> References:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd=
.com%2F&amp;data=3D04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1=
408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374741635922605=
52%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dy2VzC4vbfMi0ctyerAHfqODZ6tthz1FUDwpMC=
p0PIrQ%3D&amp;reserved=3D0
> >>>>>>
> >>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> >>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
> >>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
> >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>>> Cc: linux-media@vger.kernel.org
> >>>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>>> --
> >>>>>> I'll be away next week, but figured I'll type this up quickly for
> >>>>>> some
> >>>>>> comments and to check whether I got this all roughly right.
> >>>>>>
> >>>>>> Critique very much wanted on this, so that we can make sure hw whi=
ch
> >>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
> >>>>>> path to
> >>>>>> support page faults in upstream. So anything I missed, got wrong o=
r
> >>>>>> like that would be good.
> >>>>>> -Daniel
> >>>>>> ---
> >>>>>>    Documentation/driver-api/dma-buf.rst | 66
> >>>>>> ++++++++++++++++++++++++++++
> >>>>>>    1 file changed, 66 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
> >>>>>> b/Documentation/driver-api/dma-buf.rst
> >>>>>> index a2133d69872c..e924c1e4f7a3 100644
> >>>>>> --- a/Documentation/driver-api/dma-buf.rst
> >>>>>> +++ b/Documentation/driver-api/dma-buf.rst
> >>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
> >>>>>>      userspace is allowed to use userspace fencing or long running
> >>>>>> compute
> >>>>>>      workloads. This also means no implicit fencing for shared
> >>>>>> buffers in these
> >>>>>>      cases.
> >>>>>> +
> >>>>>> +Recoverable Hardware Page Faults Implications
> >>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>>>> +
> >>>>>> +Modern hardware supports recoverable page faults, which has a
> >>>>>> lot of
> >>>>>> +implications for DMA fences.
> >>>>>> +
> >>>>>> +First, a pending page fault obviously holds up the work that's
> >>>>>> running on the
> >>>>>> +accelerator and a memory allocation is usually required to resolv=
e
> >>>>>> the fault.
> >>>>>> +But memory allocations are not allowed to gate completion of DMA
> >>>>>> fences, which
> >>>>>> +means any workload using recoverable page faults cannot use DMA
> >>>>>> fences for
> >>>>>> +synchronization. Synchronization fences controlled by userspace
> >>>>>> must be used
> >>>>>> +instead.
> >>>>>> +
> >>>>>> +On GPUs this poses a problem, because current desktop compositor
> >>>>>> protocols on
> >>>>>> +Linus rely on DMA fences, which means without an entirely new
> >>>>>> userspace stack
> >>>>>> +built on top of userspace fences, they cannot benefit from
> >>>>>> recoverable page
> >>>>>> +faults. The exception is when page faults are only used as
> >>>>>> migration hints and
> >>>>>> +never to on-demand fill a memory request. For now this means
> >>>>>> recoverable page
> >>>>>> +faults on GPUs are limited to pure compute workloads.
> >>>>>> +
> >>>>>> +Furthermore GPUs usually have shared resources between the 3D
> >>>>>> rendering and
> >>>>>> +compute side, like compute units or command submission engines. I=
f
> >>>>>> both a 3D
> >>>>>> +job with a DMA fence and a compute workload using recoverable pag=
e
> >>>>>> faults are
> >>>>>> +pending they could deadlock:
> >>>>>> +
> >>>>>> +- The 3D workload might need to wait for the compute job to finis=
h
> >>>>>> and release
> >>>>>> +  hardware resources first.
> >>>>>> +
> >>>>>> +- The compute workload might be stuck in a page fault, because th=
e
> >>>>>> memory
> >>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
> >>>>>> complete.
> >>>>>> +
> >>>>>> +There are a few ways to prevent this problem:
> >>>>>> +
> >>>>>> +- Compute workloads can always be preempted, even when a page
> >>>>>> fault is pending
> >>>>>> +  and not yet repaired. Not all hardware supports this.
> >>>>>> +
> >>>>>> +- DMA fence workloads and workloads which need page fault handlin=
g
> >>>>>> have
> >>>>>> +  independent hardware resources to guarantee forward progress.
> >>>>>> This could be
> >>>>>> +  achieved through e.g. through dedicated engines and minimal
> >>>>>> compute unit
> >>>>>> +  reservations for DMA fence workloads.
> >>>>>> +
> >>>>>> +- The reservation approach could be further refined by only
> >>>>>> reserving the
> >>>>>> +  hardware resources for DMA fence workloads when they are
> >>>>>> in-flight. This must
> >>>>>> +  cover the time from when the DMA fence is visible to other
> >>>>>> threads up to
> >>>>>> +  moment when fence is completed through dma_fence_signal().
> >>>>>> +
> >>>>>> +- As a last resort, if the hardware provides no useful reservatio=
n
> >>>>>> mechanics,
> >>>>>> +  all workloads must be flushed from the GPU when switching
> >>>>>> between jobs
> >>>>>> +  requiring DMA fences or jobs requiring page fault handling: Thi=
s
> >>>>>> means all DMA
> >>>>>> +  fences must complete before a compute job with page fault
> >>>>>> handling can be
> >>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
> >>>>>> fence can be
> >>>>>> +  made visible anywhere in the system, all compute workloads must
> >>>>>> be preempted
> >>>>>> +  to guarantee all pending GPU page faults are flushed.
> >>>>> I thought of another possible workaround:
> >>>>>
> >>>>>     * Partition the memory. Servicing of page faults will use a
> >>>>> separate
> >>>>>       memory pool that can always be allocated from without
> >>>>> waiting for
> >>>>>       fences. This includes memory for page tables and memory for
> >>>>>       migrating data to. You may steal memory from other processes
> >>>>> that
> >>>>>       can page fault, so no fence waiting is necessary. Being able =
to
> >>>>>       steal memory at any time also means there are basically no
> >>>>>       out-of-memory situations you need to worry about. Even page
> >>>>> tables
> >>>>>       (except the root page directory of each process) can be
> >>>>> stolen in
> >>>>>       the worst case.
> >>>> I think 'overcommit' would be a nice way to describe this. But I'm n=
ot
> >>>> sure how easy this is to implement in practice. You would basically
> >>>> need
> >>>> to create your own memory manager for this.
> >>> Well you would need a completely separate pool for both device as wel=
l
> >>> as system memory.
> >>>
> >>> E.g. on boot we say we steal X GB system memory only for HMM.
> >> Why? The GPU driver doesn't need to allocate system memory for HMM.
> >> Migrations to system memory are handled by the kernel's handle_mm_faul=
t
> >> and page allocator and swap logic.
> >
> > And that one depends on dma_fence completion because you can easily
> > need to wait for an MMU notifier callback.
>
> I see, the GFX MMU notifier for userpointers in amdgpu currently waits
> for fences. For the KFD MMU notifier I am planning to fix this by
> causing GPU page faults instead of preempting the queues. Can we limit
> userptrs in amdgpu to engines that can page fault. Basically make it
> illegal to attach userptr BOs to graphics CS BO lists, so they can only
> be used in user mode command submissions, which can page fault. Then the
> GFX MMU notifier could invalidate PTEs and would not have to wait for
> fences.

sadly graphics + userptr is already exposed via Mesa.

>
>
> >
> > As Maarten wrote when you want to go down this route you need a
> > complete separate memory management parallel to the one of the kernel.
>
> Not really. I'm trying to make the GPU memory management more similar to
> what the kernel does for system memory.
>
> I understood Maarten's comment as "I'm creating a new memory manager and
> not using TTM any more". This is true. The idea is that this portion of
> VRAM would be managed more like system memory.
>
> Regards,
>   Felix
>
>
> >
> > Regards,
> > Christian.
> >
> >>   It doesn't depend on any fences, so
> >> it cannot deadlock with any GPU driver-managed memory. The GPU driver
> >> gets involved in the MMU notifier to invalidate device page tables. Bu=
t
> >> that also doesn't need to wait for any fences.
> >>
> >> And if the kernel runs out of pageable memory, you're in trouble anywa=
y.
> >> The OOM killer will step in, nothing new there.
> >>
> >> Regards,
> >>    Felix
> >>
> >>
> >>>> But from a design point of view, definitely a valid solution.
> >>> I think the restriction above makes it pretty much unusable.
> >>>
> >>>> But this looks good, those solutions are definitely the valid
> >>>> options we
> >>>> can choose from.
> >>> It's certainly worth noting, yes. And just to make sure that nobody
> >>> has the idea to reserve only device memory.
> >>>
> >>> Christian.
> >>>
> >>>> ~Maarten
> >>>>
> >> _______________________________________________
> >> Linaro-mm-sig mailing list
> >> Linaro-mm-sig@lists.linaro.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=3D04%7C01%7Cfe=
lix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DgQj51eDK8OUWoQcbYliY639jOPleRjyLY3Q16nj2PL0%3D&amp;reserved=3D0
> >>
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
