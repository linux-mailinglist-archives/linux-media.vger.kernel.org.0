Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC64323969
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 10:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbhBXJ1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 04:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbhBXJ1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 04:27:42 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4BEC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 01:27:01 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id l3so1790928oii.2
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AaU5AD5cfuCdiSmP+fj3RMpbiX47V40i+aWxE9QqkU4=;
        b=gk1JdnGATXIWDuG7GN1NPlFjcHVZ7hYx6cs/sPimVc+KHCvbfs+PzpMfcbjUdjKLWP
         bcFjuvu9EZbGLT+60thJlF2S9VhjLdQYZRnz5Hr3pGnfCXgpb3altaS7xLfcUPrUOBwr
         uw/wTXb2ueWmYkvvTdccNKryg+4g/oFu8yHfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AaU5AD5cfuCdiSmP+fj3RMpbiX47V40i+aWxE9QqkU4=;
        b=qoSbEuKyElIBYcgz1l/ny8aydZGRIbZvBWyp0yELBv1UKTLQLnPreVq4C9G4QP50UF
         POhQzBglAFU3LdDASBrLqFhylbEcbinCv20cdHjpMLX3pcuXRv7DGoTlXnNaQG40rKX8
         qJ89cOeU/HxUo+F4VV+I2bLT2wszqbXFJIUv/kmrPUIUpoTL5VTffum+8+u95hdWY8Ru
         tBsZ0RWVM5Zh590w0/+ctTRs3k6RP4sg4uSNgmc84nh9P+HzI2z8Lk/hh29jmzc702aO
         DiCa3H6l5SOxpIPK/AphM7a7Htz2ClwAfOP0hWCus3BA67BdpE/QyTQKqJQuixd1iqOd
         ZO5Q==
X-Gm-Message-State: AOAM533f6MLmWwbZWZQlbryr43v664hSM6fwerz4gwpz3sWhYuj0y5q5
        GbLaYyd9AEbNMD5q+gG4RcRNb05hAEA0rxHKcboqBw==
X-Google-Smtp-Source: ABdhPJxkOXqdZceD4fMBZW7PgANwDT9KotRzzWPEQIfXGHJeo7h/MpioSB2Y9xeQuqFBkRQ+xHvnNEjjT6ibHCT9WeM=
X-Received: by 2002:a05:6808:aa6:: with SMTP id r6mr2127158oij.128.1614158820894;
 Wed, 24 Feb 2021 01:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch> <81df5b1c-2838-49d8-4ae4-bab4f55b411a@shipmail.org>
In-Reply-To: <81df5b1c-2838-49d8-4ae4-bab4f55b411a@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 24 Feb 2021 10:26:49 +0100
Message-ID: <CAKMK7uHOYRHofSJfDeK1cAX9j_RAaiuZ_S0Dm41AUdCE9QCbnw@mail.gmail.com>
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

On Wed, Feb 24, 2021 at 9:47 AM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
>
> On 2/3/21 4:29 PM, Daniel Vetter wrote:
> > Recently there was a fairly long thread about recoreable hardware page
> > faults, how they can deadlock, and what to do about that.
> >
> > While the discussion is still fresh I figured good time to try and
> > document the conclusions a bit. This documentation section explains
> > what's the potential problem, and the remedies we've discussed,
> > roughly ordered from best to worst.
> >
> > v2: Linus -> Linux typoe (Dave)
> >
> > v3:
> > - Make it clear drivers only need to implement one option (Christian)
> > - Make it clearer that implicit sync is out the window with exclusive
> >    fences (Christian)
> > - Add the fairly theoretical option of segementing the memory (either
> >    statically or through dynamic checks at runtime for which piece of
> >    memory is managed how) and explain why it's not a great idea (Felix)
> >
> > References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Fe=
lix.Kuehling@amd.com/
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Jerome Glisse <jglisse@redhat.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   Documentation/driver-api/dma-buf.rst | 76 +++++++++++++++++++++++++++=
+
> >   1 file changed, 76 insertions(+)
> >
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index a2133d69872c..7f37ec30d9fd 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -257,3 +257,79 @@ fences in the kernel. This means:
> >     userspace is allowed to use userspace fencing or long running compu=
te
> >     workloads. This also means no implicit fencing for shared buffers i=
n these
> >     cases.
> > +
> > +Recoverable Hardware Page Faults Implications
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Modern hardware supports recoverable page faults, which has a lot of
> > +implications for DMA fences.
> > +
> > +First, a pending page fault obviously holds up the work that's running=
 on the
> > +accelerator and a memory allocation is usually required to resolve the=
 fault.
> > +But memory allocations are not allowed to gate completion of DMA fence=
s, which
> > +means any workload using recoverable page faults cannot use DMA fences=
 for
> > +synchronization. Synchronization fences controlled by userspace must b=
e used
> > +instead.
> > +
> > +On GPUs this poses a problem, because current desktop compositor proto=
cols on
> > +Linux rely on DMA fences, which means without an entirely new userspac=
e stack
> > +built on top of userspace fences, they cannot benefit from recoverable=
 page
> > +faults. Specifically this means implicit synchronization will not be p=
ossible.
> > +The exception is when page faults are only used as migration hints and=
 never to
> > +on-demand fill a memory request. For now this means recoverable page
> > +faults on GPUs are limited to pure compute workloads.
> > +
> > +Furthermore GPUs usually have shared resources between the 3D renderin=
g and
> > +compute side, like compute units or command submission engines. If bot=
h a 3D
> > +job with a DMA fence and a compute workload using recoverable page fau=
lts are
> > +pending they could deadlock:
> > +
> > +- The 3D workload might need to wait for the compute job to finish and=
 release
> > +  hardware resources first.
> > +
> > +- The compute workload might be stuck in a page fault, because the mem=
ory
> > +  allocation is waiting for the DMA fence of the 3D workload to comple=
te.
> > +
> > +There are a few options to prevent this problem, one of which drivers =
need to
> > +ensure:
> > +
> > +- Compute workloads can always be preempted, even when a page fault is=
 pending
> > +  and not yet repaired. Not all hardware supports this.
> > +
> > +- DMA fence workloads and workloads which need page fault handling hav=
e
> > +  independent hardware resources to guarantee forward progress. This c=
ould be
> > +  achieved through e.g. through dedicated engines and minimal compute =
unit
> > +  reservations for DMA fence workloads.
> > +
> > +- The reservation approach could be further refined by only reserving =
the
> > +  hardware resources for DMA fence workloads when they are in-flight. =
This must
> > +  cover the time from when the DMA fence is visible to other threads u=
p to
> > +  moment when fence is completed through dma_fence_signal().
> > +
> > +- As a last resort, if the hardware provides no useful reservation mec=
hanics,
> > +  all workloads must be flushed from the GPU when switching between jo=
bs
> > +  requiring DMA fences or jobs requiring page fault handling: This mea=
ns all DMA
> > +  fences must complete before a compute job with page fault handling c=
an be
> > +  inserted into the scheduler queue. And vice versa, before a DMA fenc=
e can be
> > +  made visible anywhere in the system, all compute workloads must be p=
reempted
> > +  to guarantee all pending GPU page faults are flushed.
> > +
> > +- Only a fairly theoretical option would be to untangle these dependen=
cies when
> > +  allocating memory to repair hardware page faults, either through sep=
arate
> > +  memory blocks or runtime tracking of the full dependency graph of al=
l DMA
> > +  fences. This results very wide impact on the kernel, since resolving=
 the page
> > +  on the CPU side can itself involve a page fault. It is much more fea=
sible and
> > +  robust to limit the impact of handling hardware page faults to the s=
pecific
> > +  driver.
> > +
> > +Note that workloads that run on independent hardware like copy engines=
 or other
> > +GPUs do not have any impact. This allows us to keep using DMA fences i=
nternally
> > +in the kernel even for resolving hardware page faults, e.g. by using c=
opy
> > +engines to clear or copy memory needed to resolve the page fault.
> > +
> > +In some ways this page fault problem is a special case of the `Infinit=
e DMA
> > +Fences` discussions: Infinite fences from compute workloads are allowe=
d to
> > +depend on DMA fences, but not the other way around. And not even the p=
age fault
> > +problem is new, because some other CPU thread in userspace might
> > +hit a page fault which holds up a userspace fence - supporting page fa=
ults on
> > +GPUs doesn't anything fundamentally new.
>
> To me, in general this looks good. One thing, though is that for a first
> time reader it might not be totally clear what's special with a compute
> workload. Perhaps some clarification?

In the docs this new section is right after the infinite fence
section, which goes through this kind of stuff. So it's not so much
"compute workloads" but "infinite fences", which I think is explained
plenty enough.

> Also since the current cross-driver dma_fence locking order is
>
> 1) dma_resv ->
> 2) memory_allocation / reclaim ->
> 3) dma_fence_wait/critical
>
> And the locking order required for recoverable pagefault is
>
> a) dma_resv ->
> b) fence_wait/critical ->
> c) memory_allocation / reclaim
>
> (Possibly with a) and b) interchanged above, Is it possible to service a
> recoverable pagefault without taking the dma_resv lock?)

It's worse, since the lock order we care about is:
1) mmap_sem
2) dma_resv
3) reclaim
4) dma_fence_wait

And for this nice brave new world of unified shared memory/hmm, we
really need to be able to resolve arbitrary cpu side page faults (with
fixup_user_fault() like the iommu driver does too for PASID mode) to
be able to serve gpu page faults. So even if we take dma_resv
completely out of the system we still have:

1) mmap_sem
2) reclaim
3) dma_fence_wait

So we'd also need to throw out dma_fence_wait, and at that point we're
looking at a new gpu driver stack.

> It's clear that the fence critical section in b) is not compatible with
> the dma_fence wait in 3) and thus the memory restrictions are needed.
> But I think given the memory allocation restrictions for recoverable
> pagefaults I guess at some point we must ask ourselves why are they
> necessary and what's the price to be paid for getting rid of them, and
> document also that. *If* it's the case that it all boils down to the 2)
> -> 3) locking order above, and that's mandated *only* by the dma_fence
> wait in the userptr mmu notifiers, I think these restrictions are a
> pretty high price to pay. Wouldn't it be possible now to replace that
> fence wait with either page pinning (which now is coherent since 5.9) or
> preempt-ctx fences + unpinned pages if available and thus invert the 2)
> -> 3) locking order?

It's not just userptr, it's also shrinkers. mmap_sem requires
GFP_KERNEL allocations, so that already excludes our shrinkers if we
want this. That means gpu memory becomes pinned when it's managed with
dma_fence. Christian K=C3=B6nig just reworked ttm to stop doing that, to
remove the hard and fairly arbitrary "max 50% of system memory" limit.

The only option that would work is if we throw out dma_fence out and
exclusively manage memory with gpu page faults only. Even across the
gpus that do support page faults that's not true for all workloads,
e.g. nvidia only supports page faults on compute engines, not on any
of the 3d fixed function stuff or media codecs (to my knowledge). So
not going to happen. In addition, this plan requires that we stop
using dma_fence for sync (otherwise you can't use preempt-ctx fences).
That's the "10 year plan to rev the ecosystem" problem, although with
lots of discussions with Christian and Jason from mesa I think we've
boiled this down to a more minimal task list by now:
- vk driver mode that users userspace fences. There's a somewhat nasty
problem here because you can only decide which mode to use when you
know which winsys to use. And with vk that's created after the render
pipeline (unlike gl). Plus it's dynamic, e.g. if you run on X or
wayland without the below stuff support, but then use direct display
and the kernel already has timeline syncobj support, you should
probably use userspace fencing.
- new wayland/x protocol to pass timeline drm_syncob around as syncobj
- drm_syncobj support in atomic ioctl
- compositors switching over to vk + using timeline syncobj for fencing
- new drm_syncobj mode where we wrap a userspace fence: new userspace
would pull the userspace fence out, any legacy drivers would have to
block until the fence has signalled. This sucks compared to current
timeline syncobj, where we just wait for the dma_fence to materialize,
but since it can use the same paths/ioctls it would at least give us a
smooth upgrade path. Inclusive allowing both old and new userspace to
co-exist on the same compositor session.

Note that just preempt-ctx fences alone isn't enough, since you could
end up with something like this:
- compute workload using gpu page faults hangs a all of the
compute/shadercores on page faults, we can't preempt
- concurrently there's a 3d workload running, which because fixed
function, and only preempt between draw calls. it is stuck waiting for
some shader cores to become avaiable. this is possible because most
gpus nowadays have separate command queues for compute/3d workloads
- our kernel page fault handler for the compute job wants to preempt
the 3d workload, which wont happen
- everyone is firmly stuck and the user gets angry

So just requiring that everything uses preempt-ctx fences isn't enough
due to shared resources possible blocking preemption even across
engines. Plus we'd still have the problem that dma_fence_wait from
reclaim isn't allowed, pinning all the 3d workload memory for good.

Aside: This means that for compute workloads using page faults we
cannot use preempt-ctx fences either, but instead memory reclaim has
to exclusively use pte zapping (both shrinker and mmu notifier).

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
