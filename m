Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C98E323FF5
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 16:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbhBXO3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 09:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235378AbhBXOGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 09:06:11 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57842C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:05:31 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b8so2206697oti.7
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jhz404W1SQ3RpraFI+ib/gi9jDMsC1jIL4ny+ffJZl4=;
        b=g5brwhZVrrlD+CRaXocmC7RXloTx7Bn3pOa/oGvs7LZ3SzWvdWLYnU+yE1OjINdI8e
         WSs1z3pGXuXijR/rTk5AdtpFmnzwsIoOz8cEHWn2oU7YTnFEeRIGTfQzaOO3rsbjiNr1
         vr5YUcon7k/DPnQtRwrhGW6OsfXnEs5fsuhWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jhz404W1SQ3RpraFI+ib/gi9jDMsC1jIL4ny+ffJZl4=;
        b=FIw/2A8HiGC3xmJ8Cw30LM23hynQqpsQ/YdqqN8agGJ35MpMN/EOVtFTfm+eP7Oc6C
         9G4byXm6/TndER9rMCs4Gqbal6m7Ezym+094RD/MDFRwumxMIocMrlTg/CB9aRahj5JE
         vaERniOCc5zfziGkInVCJxl61IA0+SsiMvclkWmF8sCL516oSGqqfLRfoRl4XY3o6Kax
         9UEZZFTfvCk/Ge/nCcG3tAywGnNbk4n00EQHBDBy2FwvzMQUhEAtP4kTAcWNc2amCiy4
         Ydq1rBrTJVnJ174p67Tx3Z6bQbtM5TTzbrFhBbxl2HrnUpaTmiFt/J7YvzoRaulkWX9d
         C/zw==
X-Gm-Message-State: AOAM533uLKpMyufM1kD5fDZExNr0MwuZSaWGFy63BXp2dNHb3Y2XdjVT
        M5zcEwMevZcCkDKaN4DQXDJDbnnsiGlbJpTXXWhobw==
X-Google-Smtp-Source: ABdhPJx4GUbJpND9k2Su93uqqc3tlpnk+baliHBMkGSDvnjzVMIuPGaaKl9L431+fO/BNnqVyVHbsAbUiAC59wXcgWM=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr25225556oth.281.1614175530714;
 Wed, 24 Feb 2021 06:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
 <81df5b1c-2838-49d8-4ae4-bab4f55b411a@shipmail.org> <CAKMK7uHOYRHofSJfDeK1cAX9j_RAaiuZ_S0Dm41AUdCE9QCbnw@mail.gmail.com>
 <8275e507-603d-81aa-872b-f829da1ad1c6@shipmail.org>
In-Reply-To: <8275e507-603d-81aa-872b-f829da1ad1c6@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 24 Feb 2021 15:05:19 +0100
Message-ID: <CAKMK7uGUK0eycuhyQSnL4+oeyvHdnC9uavNe6e_wAcKJQpqLBA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-fence: Document recoverable page
 fault implications
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 24, 2021 at 12:22 PM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
>
> On 2/24/21 10:26 AM, Daniel Vetter wrote:
> > On Wed, Feb 24, 2021 at 9:47 AM Thomas Hellstr=C3=B6m (Intel)
> > <thomas_os@shipmail.org> wrote:
> >>
> >> On 2/3/21 4:29 PM, Daniel Vetter wrote:
> >>> Recently there was a fairly long thread about recoreable hardware pag=
e
> >>> faults, how they can deadlock, and what to do about that.
> >>>
> >>> While the discussion is still fresh I figured good time to try and
> >>> document the conclusions a bit. This documentation section explains
> >>> what's the potential problem, and the remedies we've discussed,
> >>> roughly ordered from best to worst.
> >>>
> >>> v2: Linus -> Linux typoe (Dave)
> >>>
> >>> v3:
> >>> - Make it clear drivers only need to implement one option (Christian)
> >>> - Make it clearer that implicit sync is out the window with exclusive
> >>>     fences (Christian)
> >>> - Add the fairly theoretical option of segementing the memory (either
> >>>     statically or through dynamic checks at runtime for which piece o=
f
> >>>     memory is managed how) and explain why it's not a great idea (Fel=
ix)
> >>>
> >>> References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-=
Felix.Kuehling@amd.com/
> >>> Cc: Dave Airlie <airlied@gmail.com>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Jerome Glisse <jglisse@redhat.com>
> >>> Cc: Felix Kuehling <felix.kuehling@amd.com>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: linux-media@vger.kernel.org
> >>> Cc: linaro-mm-sig@lists.linaro.org
> >>> ---
> >>>    Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++=
++++
> >>>    1 file changed, 76 insertions(+)
> >>>
> >>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/dri=
ver-api/dma-buf.rst
> >>> index a2133d69872c..7f37ec30d9fd 100644
> >>> --- a/Documentation/driver-api/dma-buf.rst
> >>> +++ b/Documentation/driver-api/dma-buf.rst
> >>> @@ -257,3 +257,79 @@ fences in the kernel. This means:
> >>>      userspace is allowed to use userspace fencing or long running co=
mpute
> >>>      workloads. This also means no implicit fencing for shared buffer=
s in these
> >>>      cases.
> >>> +
> >>> +Recoverable Hardware Page Faults Implications
> >>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> +
> >>> +Modern hardware supports recoverable page faults, which has a lot of
> >>> +implications for DMA fences.
> >>> +
> >>> +First, a pending page fault obviously holds up the work that's runni=
ng on the
> >>> +accelerator and a memory allocation is usually required to resolve t=
he fault.
> >>> +But memory allocations are not allowed to gate completion of DMA fen=
ces, which
> >>> +means any workload using recoverable page faults cannot use DMA fenc=
es for
> >>> +synchronization. Synchronization fences controlled by userspace must=
 be used
> >>> +instead.
> >>> +
> >>> +On GPUs this poses a problem, because current desktop compositor pro=
tocols on
> >>> +Linux rely on DMA fences, which means without an entirely new usersp=
ace stack
> >>> +built on top of userspace fences, they cannot benefit from recoverab=
le page
> >>> +faults. Specifically this means implicit synchronization will not be=
 possible.
> >>> +The exception is when page faults are only used as migration hints a=
nd never to
> >>> +on-demand fill a memory request. For now this means recoverable page
> >>> +faults on GPUs are limited to pure compute workloads.
> >>> +
> >>> +Furthermore GPUs usually have shared resources between the 3D render=
ing and
> >>> +compute side, like compute units or command submission engines. If b=
oth a 3D
> >>> +job with a DMA fence and a compute workload using recoverable page f=
aults are
> >>> +pending they could deadlock:
> >>> +
> >>> +- The 3D workload might need to wait for the compute job to finish a=
nd release
> >>> +  hardware resources first.
> >>> +
> >>> +- The compute workload might be stuck in a page fault, because the m=
emory
> >>> +  allocation is waiting for the DMA fence of the 3D workload to comp=
lete.
> >>> +
> >>> +There are a few options to prevent this problem, one of which driver=
s need to
> >>> +ensure:
> >>> +
> >>> +- Compute workloads can always be preempted, even when a page fault =
is pending
> >>> +  and not yet repaired. Not all hardware supports this.
> >>> +
> >>> +- DMA fence workloads and workloads which need page fault handling h=
ave
> >>> +  independent hardware resources to guarantee forward progress. This=
 could be
> >>> +  achieved through e.g. through dedicated engines and minimal comput=
e unit
> >>> +  reservations for DMA fence workloads.
> >>> +
> >>> +- The reservation approach could be further refined by only reservin=
g the
> >>> +  hardware resources for DMA fence workloads when they are in-flight=
. This must
> >>> +  cover the time from when the DMA fence is visible to other threads=
 up to
> >>> +  moment when fence is completed through dma_fence_signal().
> >>> +
> >>> +- As a last resort, if the hardware provides no useful reservation m=
echanics,
> >>> +  all workloads must be flushed from the GPU when switching between =
jobs
> >>> +  requiring DMA fences or jobs requiring page fault handling: This m=
eans all DMA
> >>> +  fences must complete before a compute job with page fault handling=
 can be
> >>> +  inserted into the scheduler queue. And vice versa, before a DMA fe=
nce can be
> >>> +  made visible anywhere in the system, all compute workloads must be=
 preempted
> >>> +  to guarantee all pending GPU page faults are flushed.
> >>> +
> >>> +- Only a fairly theoretical option would be to untangle these depend=
encies when
> >>> +  allocating memory to repair hardware page faults, either through s=
eparate
> >>> +  memory blocks or runtime tracking of the full dependency graph of =
all DMA
> >>> +  fences. This results very wide impact on the kernel, since resolvi=
ng the page
> >>> +  on the CPU side can itself involve a page fault. It is much more f=
easible and
> >>> +  robust to limit the impact of handling hardware page faults to the=
 specific
> >>> +  driver.
> >>> +
> >>> +Note that workloads that run on independent hardware like copy engin=
es or other
> >>> +GPUs do not have any impact. This allows us to keep using DMA fences=
 internally
> >>> +in the kernel even for resolving hardware page faults, e.g. by using=
 copy
> >>> +engines to clear or copy memory needed to resolve the page fault.
> >>> +
> >>> +In some ways this page fault problem is a special case of the `Infin=
ite DMA
> >>> +Fences` discussions: Infinite fences from compute workloads are allo=
wed to
> >>> +depend on DMA fences, but not the other way around. And not even the=
 page fault
> >>> +problem is new, because some other CPU thread in userspace might
> >>> +hit a page fault which holds up a userspace fence - supporting page =
faults on
> >>> +GPUs doesn't anything fundamentally new.
> >> To me, in general this looks good. One thing, though is that for a fir=
st
> >> time reader it might not be totally clear what's special with a comput=
e
> >> workload. Perhaps some clarification?
> > In the docs this new section is right after the infinite fence
> > section, which goes through this kind of stuff. So it's not so much
> > "compute workloads" but "infinite fences", which I think is explained
> > plenty enough.
> >
> OK,
> >> Also since the current cross-driver dma_fence locking order is
> >>
> >> 1) dma_resv ->
> >> 2) memory_allocation / reclaim ->
> >> 3) dma_fence_wait/critical
> >>
> >> And the locking order required for recoverable pagefault is
> >>
> >> a) dma_resv ->
> >> b) fence_wait/critical ->
> >> c) memory_allocation / reclaim
> >>
> >> (Possibly with a) and b) interchanged above, Is it possible to service=
 a
> >> recoverable pagefault without taking the dma_resv lock?)
> > It's worse, since the lock order we care about is:
> > 1) mmap_sem
> > 2) dma_resv
> > 3) reclaim
> > 4) dma_fence_wait
> >
> > And for this nice brave new world of unified shared memory/hmm, we
> > really need to be able to resolve arbitrary cpu side page faults (with
> > fixup_user_fault() like the iommu driver does too for PASID mode) to
> > be able to serve gpu page faults. So even if we take dma_resv
> > completely out of the system we still have:
> >
> > 1) mmap_sem
> > 2) reclaim
> > 3) dma_fence_wait
> >
> > So we'd also need to throw out dma_fence_wait, and at that point we're
> > looking at a new gpu driver stack.
> >
> Meaning that the locking order for workloads with recoverable page
> faults becomes:
>
> a) dma_fence_wait/critical
> b) mmap_sem
> c) dma_resv
> d) reclaim
>
> which I agree we can't really use with the current stack whatever we do
> with dma_fence_wait vs reclaim.
>
>
> >> It's clear that the fence critical section in b) is not compatible wit=
h
> >> the dma_fence wait in 3) and thus the memory restrictions are needed.
> >> But I think given the memory allocation restrictions for recoverable
> >> pagefaults I guess at some point we must ask ourselves why are they
> >> necessary and what's the price to be paid for getting rid of them, and
> >> document also that. *If* it's the case that it all boils down to the 2=
)
> >> -> 3) locking order above, and that's mandated *only* by the dma_fence
> >> wait in the userptr mmu notifiers, I think these restrictions are a
> >> pretty high price to pay. Wouldn't it be possible now to replace that
> >> fence wait with either page pinning (which now is coherent since 5.9) =
or
> >> preempt-ctx fences + unpinned pages if available and thus invert the 2=
)
> >> -> 3) locking order?
> > It's not just userptr, it's also shrinkers. mmap_sem requires
> > GFP_KERNEL allocations, so that already excludes our shrinkers if we
> > want this. That means gpu memory becomes pinned when it's managed with
> > dma_fence. Christian K=C3=B6nig just reworked ttm to stop doing that, t=
o
> > remove the hard and fairly arbitrary "max 50% of system memory" limit.
>
> Even with shrinkers, and assuming there is no guarantee we can preempt,
> one could tag memory / bos for release on next reservation / dma_fence
> signal whatever happens first, which would not give memory back on
> direct reclaim, but will eventually release it. Will not help with the
> mmap_sem issue, though.
>
>
> >
> >
> > Note that just preempt-ctx fences alone isn't enough, since you could
> > end up with something like this:
> > - compute workload using gpu page faults hangs a all of the
> > compute/shadercores on page faults, we can't preempt
> > - concurrently there's a 3d workload running, which because fixed
> > function, and only preempt between draw calls. it is stuck waiting for
> > some shader cores to become avaiable. this is possible because most
> > gpus nowadays have separate command queues for compute/3d workloads
> > - our kernel page fault handler for the compute job wants to preempt
> > the 3d workload, which wont happen
> > - everyone is firmly stuck and the user gets angry
> Yes, preempt-ctx fences would indeed have to be guaranteed to be able to
> preempt to work, using one of the options described above, But in
> general, inverting reclaim and dma_fence_wait would actually resolve
> this particular situation, even if it doesn't help with recoverable
> pagefaults due to mmap_sem:
>
> - kernel page fault handler ends up in shrinker tagging 3D workload
> resources for release
> - Moves on to another shrinker that succeeds to release enough memory
> - Compute workload proceeds
> - 3D workload proceeds.
>
> ..But just wanting to get the full picture of what the tradeoffs of this
> really are.

The trouble with this is that we still need to guarantee forward
progress. That means we must have enough memory available in other
shrinkers/page-cache which is not hogged by the gpu in any way. E.g.
just removing the dma_fence_wait from the mmu notifier wont help if we
still hold the page refcounts at large.

There's roughly two options:
- Lots of local caches for memory allocations which are sized to
contain the max in-flight working set. This is essentially what the
block layer uses for GFP_NOIO inversions. Problem is you must
guarantee that everyone goes through these mempools, and that they're
actually sized for the worst case. Since we're talking about fixing up
userspace page faults that's pretty much the entire kernel which needs
to be switched over to accurate memory reservation and accounting.

- Other option is what essentially shrinkers/filesystems do with
GFP_NOFS: You hard-limit them to something that's small enough overall
and make sure you still have enough other memory (like normal page
cache, which can be evicted with GFP_NOFS generally) to guarantee
forward progress. Since shrinkers keep looping even when there's
fairly minimal forward progress you should be able to get out of
things again. Problem for us is that we don't just have shrinkers, but
also love to consume arbitrary pagecache with get_user_pages/userptr,
so this is tricky to guarantee. The big hammer approach here what ttm
has done thus far with a hard limit to 50% and a best-effort kthread
that tries to balance things in the background, outside of reclaim.

The other problem I'm seeing is that core kernel is building ever more
features on top of page migration, and there's a fairly constant flow
of work to get to a point where page migration can be guaranteed.
Stuff like get_user_pages vs. pin_user_pages, recent work (I think not
yet merged) to move pages out of ZONE_MOVEABLE if their pinned. This
is because hugepages have become rather critical for performance, and
contiguous memory allocator really has to guarantee it can find its
large blocks (I think there's people looking into using CMA for giant
pages, since you're not going to ever get 1gb pages out of the buddy
allocator). GPUs hogging arbitrary amounts of these pages through
userptr, without being able to release them in a timely manner, does
not look like a design with a bright future.

But yeah if we could just wish away the dma_fence_wait from reclaim
context, all these problems would go away.
-Daniel

> /Thomas
> >
> > So just requiring that everything uses preempt-ctx fences isn't enough
> > due to shared resources possible blocking preemption even across
> > engines. Plus we'd still have the problem that dma_fence_wait from
> > reclaim isn't allowed, pinning all the 3d workload memory for good.
> >
> > Aside: This means that for compute workloads using page faults we
> > cannot use preempt-ctx fences either, but instead memory reclaim has
> > to exclusively use pte zapping (both shrinker and mmu notifier).
> >
> > Cheers, Daniel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
