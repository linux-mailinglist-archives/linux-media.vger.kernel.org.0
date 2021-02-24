Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60D7323B39
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 12:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhBXLXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 06:23:16 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:6925 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbhBXLXL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 06:23:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1C7733F6BE;
        Wed, 24 Feb 2021 12:22:28 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EVaDehv0;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 15NA1H9FNQ0V; Wed, 24 Feb 2021 12:22:26 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4DE4B3F6A9;
        Wed, 24 Feb 2021 12:22:24 +0100 (CET)
Received: from [10.249.254.217] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
        by mail1.shipmail.org (Postfix) with ESMTPSA id DDB82360143;
        Wed, 24 Feb 2021 12:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1614165743; bh=n7I66PZkRu3hifCNiv/xeWx2Q6GJ9EWDh6EeIzJr3jA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EVaDehv07MSF84yZ+d8dM3x5eGqnDY2z6Yie6r5n3CSDPLDEaE8VussS2LEvOm1je
         yVqx16FOSdF5bRLNkVmqsOXHfGEIUAjRnN1adVj8doxsTNNAVMwLSz8PbH0CINQM0W
         ZzF2p9KA51lCQr1Ka/2uTcnlSRxVSMg7ZQ5YDq/A=
Subject: Re: [Linaro-mm-sig] [PATCH] dma-fence: Document recoverable page
 fault implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
 <81df5b1c-2838-49d8-4ae4-bab4f55b411a@shipmail.org>
 <CAKMK7uHOYRHofSJfDeK1cAX9j_RAaiuZ_S0Dm41AUdCE9QCbnw@mail.gmail.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <8275e507-603d-81aa-872b-f829da1ad1c6@shipmail.org>
Date:   Wed, 24 Feb 2021 12:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHOYRHofSJfDeK1cAX9j_RAaiuZ_S0Dm41AUdCE9QCbnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/24/21 10:26 AM, Daniel Vetter wrote:
> On Wed, Feb 24, 2021 at 9:47 AM Thomas Hellström (Intel)
> <thomas_os@shipmail.org> wrote:
>>
>> On 2/3/21 4:29 PM, Daniel Vetter wrote:
>>> Recently there was a fairly long thread about recoreable hardware page
>>> faults, how they can deadlock, and what to do about that.
>>>
>>> While the discussion is still fresh I figured good time to try and
>>> document the conclusions a bit. This documentation section explains
>>> what's the potential problem, and the remedies we've discussed,
>>> roughly ordered from best to worst.
>>>
>>> v2: Linus -> Linux typoe (Dave)
>>>
>>> v3:
>>> - Make it clear drivers only need to implement one option (Christian)
>>> - Make it clearer that implicit sync is out the window with exclusive
>>>     fences (Christian)
>>> - Add the fairly theoretical option of segementing the memory (either
>>>     statically or through dynamic checks at runtime for which piece of
>>>     memory is managed how) and explain why it's not a great idea (Felix)
>>>
>>> References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
>>> Cc: Dave Airlie <airlied@gmail.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>    Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
>>>    1 file changed, 76 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>>> index a2133d69872c..7f37ec30d9fd 100644
>>> --- a/Documentation/driver-api/dma-buf.rst
>>> +++ b/Documentation/driver-api/dma-buf.rst
>>> @@ -257,3 +257,79 @@ fences in the kernel. This means:
>>>      userspace is allowed to use userspace fencing or long running compute
>>>      workloads. This also means no implicit fencing for shared buffers in these
>>>      cases.
>>> +
>>> +Recoverable Hardware Page Faults Implications
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Modern hardware supports recoverable page faults, which has a lot of
>>> +implications for DMA fences.
>>> +
>>> +First, a pending page fault obviously holds up the work that's running on the
>>> +accelerator and a memory allocation is usually required to resolve the fault.
>>> +But memory allocations are not allowed to gate completion of DMA fences, which
>>> +means any workload using recoverable page faults cannot use DMA fences for
>>> +synchronization. Synchronization fences controlled by userspace must be used
>>> +instead.
>>> +
>>> +On GPUs this poses a problem, because current desktop compositor protocols on
>>> +Linux rely on DMA fences, which means without an entirely new userspace stack
>>> +built on top of userspace fences, they cannot benefit from recoverable page
>>> +faults. Specifically this means implicit synchronization will not be possible.
>>> +The exception is when page faults are only used as migration hints and never to
>>> +on-demand fill a memory request. For now this means recoverable page
>>> +faults on GPUs are limited to pure compute workloads.
>>> +
>>> +Furthermore GPUs usually have shared resources between the 3D rendering and
>>> +compute side, like compute units or command submission engines. If both a 3D
>>> +job with a DMA fence and a compute workload using recoverable page faults are
>>> +pending they could deadlock:
>>> +
>>> +- The 3D workload might need to wait for the compute job to finish and release
>>> +  hardware resources first.
>>> +
>>> +- The compute workload might be stuck in a page fault, because the memory
>>> +  allocation is waiting for the DMA fence of the 3D workload to complete.
>>> +
>>> +There are a few options to prevent this problem, one of which drivers need to
>>> +ensure:
>>> +
>>> +- Compute workloads can always be preempted, even when a page fault is pending
>>> +  and not yet repaired. Not all hardware supports this.
>>> +
>>> +- DMA fence workloads and workloads which need page fault handling have
>>> +  independent hardware resources to guarantee forward progress. This could be
>>> +  achieved through e.g. through dedicated engines and minimal compute unit
>>> +  reservations for DMA fence workloads.
>>> +
>>> +- The reservation approach could be further refined by only reserving the
>>> +  hardware resources for DMA fence workloads when they are in-flight. This must
>>> +  cover the time from when the DMA fence is visible to other threads up to
>>> +  moment when fence is completed through dma_fence_signal().
>>> +
>>> +- As a last resort, if the hardware provides no useful reservation mechanics,
>>> +  all workloads must be flushed from the GPU when switching between jobs
>>> +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
>>> +  fences must complete before a compute job with page fault handling can be
>>> +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
>>> +  made visible anywhere in the system, all compute workloads must be preempted
>>> +  to guarantee all pending GPU page faults are flushed.
>>> +
>>> +- Only a fairly theoretical option would be to untangle these dependencies when
>>> +  allocating memory to repair hardware page faults, either through separate
>>> +  memory blocks or runtime tracking of the full dependency graph of all DMA
>>> +  fences. This results very wide impact on the kernel, since resolving the page
>>> +  on the CPU side can itself involve a page fault. It is much more feasible and
>>> +  robust to limit the impact of handling hardware page faults to the specific
>>> +  driver.
>>> +
>>> +Note that workloads that run on independent hardware like copy engines or other
>>> +GPUs do not have any impact. This allows us to keep using DMA fences internally
>>> +in the kernel even for resolving hardware page faults, e.g. by using copy
>>> +engines to clear or copy memory needed to resolve the page fault.
>>> +
>>> +In some ways this page fault problem is a special case of the `Infinite DMA
>>> +Fences` discussions: Infinite fences from compute workloads are allowed to
>>> +depend on DMA fences, but not the other way around. And not even the page fault
>>> +problem is new, because some other CPU thread in userspace might
>>> +hit a page fault which holds up a userspace fence - supporting page faults on
>>> +GPUs doesn't anything fundamentally new.
>> To me, in general this looks good. One thing, though is that for a first
>> time reader it might not be totally clear what's special with a compute
>> workload. Perhaps some clarification?
> In the docs this new section is right after the infinite fence
> section, which goes through this kind of stuff. So it's not so much
> "compute workloads" but "infinite fences", which I think is explained
> plenty enough.
>
OK,
>> Also since the current cross-driver dma_fence locking order is
>>
>> 1) dma_resv ->
>> 2) memory_allocation / reclaim ->
>> 3) dma_fence_wait/critical
>>
>> And the locking order required for recoverable pagefault is
>>
>> a) dma_resv ->
>> b) fence_wait/critical ->
>> c) memory_allocation / reclaim
>>
>> (Possibly with a) and b) interchanged above, Is it possible to service a
>> recoverable pagefault without taking the dma_resv lock?)
> It's worse, since the lock order we care about is:
> 1) mmap_sem
> 2) dma_resv
> 3) reclaim
> 4) dma_fence_wait
>
> And for this nice brave new world of unified shared memory/hmm, we
> really need to be able to resolve arbitrary cpu side page faults (with
> fixup_user_fault() like the iommu driver does too for PASID mode) to
> be able to serve gpu page faults. So even if we take dma_resv
> completely out of the system we still have:
>
> 1) mmap_sem
> 2) reclaim
> 3) dma_fence_wait
>
> So we'd also need to throw out dma_fence_wait, and at that point we're
> looking at a new gpu driver stack.
>
Meaning that the locking order for workloads with recoverable page 
faults becomes:

a) dma_fence_wait/critical
b) mmap_sem
c) dma_resv
d) reclaim

which I agree we can't really use with the current stack whatever we do 
with dma_fence_wait vs reclaim.


>> It's clear that the fence critical section in b) is not compatible with
>> the dma_fence wait in 3) and thus the memory restrictions are needed.
>> But I think given the memory allocation restrictions for recoverable
>> pagefaults I guess at some point we must ask ourselves why are they
>> necessary and what's the price to be paid for getting rid of them, and
>> document also that. *If* it's the case that it all boils down to the 2)
>> -> 3) locking order above, and that's mandated *only* by the dma_fence
>> wait in the userptr mmu notifiers, I think these restrictions are a
>> pretty high price to pay. Wouldn't it be possible now to replace that
>> fence wait with either page pinning (which now is coherent since 5.9) or
>> preempt-ctx fences + unpinned pages if available and thus invert the 2)
>> -> 3) locking order?
> It's not just userptr, it's also shrinkers. mmap_sem requires
> GFP_KERNEL allocations, so that already excludes our shrinkers if we
> want this. That means gpu memory becomes pinned when it's managed with
> dma_fence. Christian König just reworked ttm to stop doing that, to
> remove the hard and fairly arbitrary "max 50% of system memory" limit.

Even with shrinkers, and assuming there is no guarantee we can preempt, 
one could tag memory / bos for release on next reservation / dma_fence 
signal whatever happens first, which would not give memory back on 
direct reclaim, but will eventually release it. Will not help with the 
mmap_sem issue, though.


>
>
> Note that just preempt-ctx fences alone isn't enough, since you could
> end up with something like this:
> - compute workload using gpu page faults hangs a all of the
> compute/shadercores on page faults, we can't preempt
> - concurrently there's a 3d workload running, which because fixed
> function, and only preempt between draw calls. it is stuck waiting for
> some shader cores to become avaiable. this is possible because most
> gpus nowadays have separate command queues for compute/3d workloads
> - our kernel page fault handler for the compute job wants to preempt
> the 3d workload, which wont happen
> - everyone is firmly stuck and the user gets angry
Yes, preempt-ctx fences would indeed have to be guaranteed to be able to 
preempt to work, using one of the options described above, But in 
general, inverting reclaim and dma_fence_wait would actually resolve 
this particular situation, even if it doesn't help with recoverable 
pagefaults due to mmap_sem:

- kernel page fault handler ends up in shrinker tagging 3D workload 
resources for release
- Moves on to another shrinker that succeeds to release enough memory
- Compute workload proceeds
- 3D workload proceeds.

..But just wanting to get the full picture of what the tradeoffs of this 
really are.

/Thomas
>
> So just requiring that everything uses preempt-ctx fences isn't enough
> due to shared resources possible blocking preemption even across
> engines. Plus we'd still have the problem that dma_fence_wait from
> reclaim isn't allowed, pinning all the 3d workload memory for good.
>
> Aside: This means that for compute workloads using page faults we
> cannot use preempt-ctx fences either, but instead memory reclaim has
> to exclusively use pte zapping (both shrinker and mmu notifier).
>
> Cheers, Daniel
