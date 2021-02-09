Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A323148FC
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 07:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhBIGil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 01:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhBIGid (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 01:38:33 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5ADC061786
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 22:37:52 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 18so7246894oiz.7
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uKwmXITA6wB/hXNJ06GHOX+4ELglgfbmlX7z0QrZV+Q=;
        b=WyN386J7AVcRc6L1PLqWjNVXnbmyD5eDckmF/GXTzrLlrp1QbN9El8jadojDpbY80Y
         7MoIq1RBuOo4gi2KkBAWajKFnYyPaCTpX5ztZWaMUWPBwAH5YY1I9mZ1nCEoNPSwm9W6
         BnicckcXWxOSDnzCxUMZWMbUkFJ4ZzkXby03A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uKwmXITA6wB/hXNJ06GHOX+4ELglgfbmlX7z0QrZV+Q=;
        b=ZIkI0JzvfQoM6CL4cTrWOh1LA/2ihTsMmppLzOL2UjZ+KrpGdXb59ir8J6Fknj2tuT
         No5Q0U2DYVBvimINJYN/qhGZMVwTG30j85/fW2hhYEjHnRj+6w4FJ2uCn1ePs8IviytG
         imru2Jm2jUZX+JOCZaX80Tp47JG0B0FmYQi649lzcvleMxd/5GZbD6ftOEOvF9Uid10h
         TOMjDM+SSjwA/qyMO/WKQf1dLQ08bGh4vPrCxwErplS+JvNDlqlCVc8pigXv/IQsVROs
         sLOO/PJY71/aAXT+bOedMJNC+M4obdQ6UVjm7uJDMntdHz3YQQRcvLKzD3o64kfZ1v9X
         TLOw==
X-Gm-Message-State: AOAM533pnIXJD/C2RX66yaXh6vfmkTx6RS53I8jOg2QbP0IcsYDPDovQ
        9vuC2W681kYJe5qNd6lH1JARH9Zosw2H0QsCMTsfCA==
X-Google-Smtp-Source: ABdhPJzofU85Bogm6rzI7FWY06ZKH4jIwJIWrW2rTfRlFeiEI9YxspU6A4Uno7il3GGwq8KtmYyxeWm8v6rDr46i0Oo=
X-Received: by 2002:aca:1906:: with SMTP id l6mr1536067oii.101.1612852672197;
 Mon, 08 Feb 2021 22:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com> <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com> <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com> <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
 <CAP+8YyG1Yupdqvrp4uUunYkVeZvhWB4rojfAtuSwMmqXRj44oQ@mail.gmail.com>
In-Reply-To: <CAP+8YyG1Yupdqvrp4uUunYkVeZvhWB4rojfAtuSwMmqXRj44oQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 9 Feb 2021 07:37:40 +0100
Message-ID: <CAKMK7uFwdmV007YhCF8ZDkzNFT71RapLPL5zHgjjsFd9huoUEg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc:     Felix Kuehling <felix.kuehling@amd.com>,
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

On Tue, Feb 9, 2021 at 4:13 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> On Thu, Jan 28, 2021 at 4:40 PM Felix Kuehling <felix.kuehling@amd.com> w=
rote:
> >
> > Am 2021-01-28 um 2:39 a.m. schrieb Christian K=C3=B6nig:
> > > Am 27.01.21 um 23:00 schrieb Felix Kuehling:
> > >> Am 2021-01-27 um 7:16 a.m. schrieb Christian K=C3=B6nig:
> > >>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
> > >>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
> > >>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> > >>>>>> Recently there was a fairly long thread about recoreable hardwar=
e
> > >>>>>> page
> > >>>>>> faults, how they can deadlock, and what to do about that.
> > >>>>>>
> > >>>>>> While the discussion is still fresh I figured good time to try a=
nd
> > >>>>>> document the conclusions a bit.
> > >>>>>>
> > >>>>>> References:
> > >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40a=
md.com%2F&amp;data=3D04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dd=
a1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63747416359226=
0552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dy2VzC4vbfMi0ctyerAHfqODZ6tthz1FUDwp=
MCp0PIrQ%3D&amp;reserved=3D0
> > >>>>>>
> > >>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >>>>>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> > >>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > >>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
> > >>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
> > >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > >>>>>> Cc: linux-media@vger.kernel.org
> > >>>>>> Cc: linaro-mm-sig@lists.linaro.org
> > >>>>>> --
> > >>>>>> I'll be away next week, but figured I'll type this up quickly fo=
r
> > >>>>>> some
> > >>>>>> comments and to check whether I got this all roughly right.
> > >>>>>>
> > >>>>>> Critique very much wanted on this, so that we can make sure hw w=
hich
> > >>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
> > >>>>>> path to
> > >>>>>> support page faults in upstream. So anything I missed, got wrong=
 or
> > >>>>>> like that would be good.
> > >>>>>> -Daniel
> > >>>>>> ---
> > >>>>>>    Documentation/driver-api/dma-buf.rst | 66
> > >>>>>> ++++++++++++++++++++++++++++
> > >>>>>>    1 file changed, 66 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
> > >>>>>> b/Documentation/driver-api/dma-buf.rst
> > >>>>>> index a2133d69872c..e924c1e4f7a3 100644
> > >>>>>> --- a/Documentation/driver-api/dma-buf.rst
> > >>>>>> +++ b/Documentation/driver-api/dma-buf.rst
> > >>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
> > >>>>>>      userspace is allowed to use userspace fencing or long runni=
ng
> > >>>>>> compute
> > >>>>>>      workloads. This also means no implicit fencing for shared
> > >>>>>> buffers in these
> > >>>>>>      cases.
> > >>>>>> +
> > >>>>>> +Recoverable Hardware Page Faults Implications
> > >>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >>>>>> +
> > >>>>>> +Modern hardware supports recoverable page faults, which has a
> > >>>>>> lot of
> > >>>>>> +implications for DMA fences.
> > >>>>>> +
> > >>>>>> +First, a pending page fault obviously holds up the work that's
> > >>>>>> running on the
> > >>>>>> +accelerator and a memory allocation is usually required to reso=
lve
> > >>>>>> the fault.
> > >>>>>> +But memory allocations are not allowed to gate completion of DM=
A
> > >>>>>> fences, which
> > >>>>>> +means any workload using recoverable page faults cannot use DMA
> > >>>>>> fences for
> > >>>>>> +synchronization. Synchronization fences controlled by userspace
> > >>>>>> must be used
> > >>>>>> +instead.
> > >>>>>> +
> > >>>>>> +On GPUs this poses a problem, because current desktop composito=
r
> > >>>>>> protocols on
> > >>>>>> +Linus rely on DMA fences, which means without an entirely new
> > >>>>>> userspace stack
> > >>>>>> +built on top of userspace fences, they cannot benefit from
> > >>>>>> recoverable page
> > >>>>>> +faults. The exception is when page faults are only used as
> > >>>>>> migration hints and
> > >>>>>> +never to on-demand fill a memory request. For now this means
> > >>>>>> recoverable page
> > >>>>>> +faults on GPUs are limited to pure compute workloads.
> > >>>>>> +
> > >>>>>> +Furthermore GPUs usually have shared resources between the 3D
> > >>>>>> rendering and
> > >>>>>> +compute side, like compute units or command submission engines.=
 If
> > >>>>>> both a 3D
> > >>>>>> +job with a DMA fence and a compute workload using recoverable p=
age
> > >>>>>> faults are
> > >>>>>> +pending they could deadlock:
> > >>>>>> +
> > >>>>>> +- The 3D workload might need to wait for the compute job to fin=
ish
> > >>>>>> and release
> > >>>>>> +  hardware resources first.
> > >>>>>> +
> > >>>>>> +- The compute workload might be stuck in a page fault, because =
the
> > >>>>>> memory
> > >>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
> > >>>>>> complete.
> > >>>>>> +
> > >>>>>> +There are a few ways to prevent this problem:
> > >>>>>> +
> > >>>>>> +- Compute workloads can always be preempted, even when a page
> > >>>>>> fault is pending
> > >>>>>> +  and not yet repaired. Not all hardware supports this.
> > >>>>>> +
> > >>>>>> +- DMA fence workloads and workloads which need page fault handl=
ing
> > >>>>>> have
> > >>>>>> +  independent hardware resources to guarantee forward progress.
> > >>>>>> This could be
> > >>>>>> +  achieved through e.g. through dedicated engines and minimal
> > >>>>>> compute unit
> > >>>>>> +  reservations for DMA fence workloads.
> > >>>>>> +
> > >>>>>> +- The reservation approach could be further refined by only
> > >>>>>> reserving the
> > >>>>>> +  hardware resources for DMA fence workloads when they are
> > >>>>>> in-flight. This must
> > >>>>>> +  cover the time from when the DMA fence is visible to other
> > >>>>>> threads up to
> > >>>>>> +  moment when fence is completed through dma_fence_signal().
> > >>>>>> +
> > >>>>>> +- As a last resort, if the hardware provides no useful reservat=
ion
> > >>>>>> mechanics,
> > >>>>>> +  all workloads must be flushed from the GPU when switching
> > >>>>>> between jobs
> > >>>>>> +  requiring DMA fences or jobs requiring page fault handling: T=
his
> > >>>>>> means all DMA
> > >>>>>> +  fences must complete before a compute job with page fault
> > >>>>>> handling can be
> > >>>>>> +  inserted into the scheduler queue. And vice versa, before a D=
MA
> > >>>>>> fence can be
> > >>>>>> +  made visible anywhere in the system, all compute workloads mu=
st
> > >>>>>> be preempted
> > >>>>>> +  to guarantee all pending GPU page faults are flushed.
> > >>>>> I thought of another possible workaround:
> > >>>>>
> > >>>>>     * Partition the memory. Servicing of page faults will use a
> > >>>>> separate
> > >>>>>       memory pool that can always be allocated from without
> > >>>>> waiting for
> > >>>>>       fences. This includes memory for page tables and memory for
> > >>>>>       migrating data to. You may steal memory from other processe=
s
> > >>>>> that
> > >>>>>       can page fault, so no fence waiting is necessary. Being abl=
e to
> > >>>>>       steal memory at any time also means there are basically no
> > >>>>>       out-of-memory situations you need to worry about. Even page
> > >>>>> tables
> > >>>>>       (except the root page directory of each process) can be
> > >>>>> stolen in
> > >>>>>       the worst case.
> > >>>> I think 'overcommit' would be a nice way to describe this. But I'm=
 not
> > >>>> sure how easy this is to implement in practice. You would basicall=
y
> > >>>> need
> > >>>> to create your own memory manager for this.
> > >>> Well you would need a completely separate pool for both device as w=
ell
> > >>> as system memory.
> > >>>
> > >>> E.g. on boot we say we steal X GB system memory only for HMM.
> > >> Why? The GPU driver doesn't need to allocate system memory for HMM.
> > >> Migrations to system memory are handled by the kernel's handle_mm_fa=
ult
> > >> and page allocator and swap logic.
> > >
> > > And that one depends on dma_fence completion because you can easily
> > > need to wait for an MMU notifier callback.
> >
> > I see, the GFX MMU notifier for userpointers in amdgpu currently waits
> > for fences. For the KFD MMU notifier I am planning to fix this by
> > causing GPU page faults instead of preempting the queues. Can we limit
> > userptrs in amdgpu to engines that can page fault. Basically make it
> > illegal to attach userptr BOs to graphics CS BO lists, so they can only
> > be used in user mode command submissions, which can page fault. Then th=
e
> > GFX MMU notifier could invalidate PTEs and would not have to wait for
> > fences.
>
> sadly graphics + userptr is already exposed via Mesa.

This is not about userptr, we fake userptr entirely in software. It's
about exposing recoverable gpu page faults (which would make userptr
maybe more efficient since we could do on-demand paging). userptr
itself isn't a problem, but it is part of the reasons why this is
tricky.

Christian/Felix, I think for kernel folks this is clear enough that I
don't need to clarify this in the text?
-Daniel

>
> >
> >
> > >
> > > As Maarten wrote when you want to go down this route you need a
> > > complete separate memory management parallel to the one of the kernel=
.
> >
> > Not really. I'm trying to make the GPU memory management more similar t=
o
> > what the kernel does for system memory.
> >
> > I understood Maarten's comment as "I'm creating a new memory manager an=
d
> > not using TTM any more". This is true. The idea is that this portion of
> > VRAM would be managed more like system memory.
> >
> > Regards,
> >   Felix
> >
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > >>   It doesn't depend on any fences, so
> > >> it cannot deadlock with any GPU driver-managed memory. The GPU drive=
r
> > >> gets involved in the MMU notifier to invalidate device page tables. =
But
> > >> that also doesn't need to wait for any fences.
> > >>
> > >> And if the kernel runs out of pageable memory, you're in trouble any=
way.
> > >> The OOM killer will step in, nothing new there.
> > >>
> > >> Regards,
> > >>    Felix
> > >>
> > >>
> > >>>> But from a design point of view, definitely a valid solution.
> > >>> I think the restriction above makes it pretty much unusable.
> > >>>
> > >>>> But this looks good, those solutions are definitely the valid
> > >>>> options we
> > >>>> can choose from.
> > >>> It's certainly worth noting, yes. And just to make sure that nobody
> > >>> has the idea to reserve only device memory.
> > >>>
> > >>> Christian.
> > >>>
> > >>>> ~Maarten
> > >>>>
> > >> _______________________________________________
> > >> Linaro-mm-sig mailing list
> > >> Linaro-mm-sig@lists.linaro.org
> > >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=3D04%7C01%7C=
felix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DgQj51eDK8OUWoQcbYliY639jOPleRjyLY3Q16nj2PL0%3D&amp;reserved=3D0
> > >>
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
