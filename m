Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3014305AFE
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhA0MPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:15:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:31181 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237635AbhA0MN6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:13:58 -0500
IronPort-SDR: T4yBvBEXhw7OFVUj9zQcC0cpl/BKeEqD8OaCqUt2B3YlII2t5QeKG8LaFPpAWgzgZoxM1N1nsU
 mLvGF6ngX6nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="241587601"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="241587601"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 04:12:00 -0800
IronPort-SDR: meMHncnvbafvUEf9hMslrOzVEv2YrjcESH/4LLcraCtfZ5SfEGaNYLXB+pkcAbi0B08ClPRJtk
 P7aPBswCKo5w==
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="362412240"
Received: from msazhin-mobl1.ccr.corp.intel.com (HELO [10.252.54.105]) ([10.252.54.105])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 04:11:58 -0800
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault
 implications
To:     Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
Date:   Wed, 27 Jan 2021 13:11:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Op 27-01-2021 om 01:22 schreef Felix Kuehling:
> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>> Recently there was a fairly long thread about recoreable hardware page
>> faults, how they can deadlock, and what to do about that.
>>
>> While the discussion is still fresh I figured good time to try and
>> document the conclusions a bit.
>>
>> References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Jerome Glisse <jglisse@redhat.com>
>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> --
>> I'll be away next week, but figured I'll type this up quickly for some
>> comments and to check whether I got this all roughly right.
>>
>> Critique very much wanted on this, so that we can make sure hw which
>> can't preempt (with pagefaults pending) like gfx10 has a clear path to
>> support page faults in upstream. So anything I missed, got wrong or
>> like that would be good.
>> -Daniel
>> ---
>>  Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>> index a2133d69872c..e924c1e4f7a3 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>    userspace is allowed to use userspace fencing or long running compute
>>    workloads. This also means no implicit fencing for shared buffers in these
>>    cases.
>> +
>> +Recoverable Hardware Page Faults Implications
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Modern hardware supports recoverable page faults, which has a lot of
>> +implications for DMA fences.
>> +
>> +First, a pending page fault obviously holds up the work that's running on the
>> +accelerator and a memory allocation is usually required to resolve the fault.
>> +But memory allocations are not allowed to gate completion of DMA fences, which
>> +means any workload using recoverable page faults cannot use DMA fences for
>> +synchronization. Synchronization fences controlled by userspace must be used
>> +instead.
>> +
>> +On GPUs this poses a problem, because current desktop compositor protocols on
>> +Linus rely on DMA fences, which means without an entirely new userspace stack
>> +built on top of userspace fences, they cannot benefit from recoverable page
>> +faults. The exception is when page faults are only used as migration hints and
>> +never to on-demand fill a memory request. For now this means recoverable page
>> +faults on GPUs are limited to pure compute workloads.
>> +
>> +Furthermore GPUs usually have shared resources between the 3D rendering and
>> +compute side, like compute units or command submission engines. If both a 3D
>> +job with a DMA fence and a compute workload using recoverable page faults are
>> +pending they could deadlock:
>> +
>> +- The 3D workload might need to wait for the compute job to finish and release
>> +  hardware resources first.
>> +
>> +- The compute workload might be stuck in a page fault, because the memory
>> +  allocation is waiting for the DMA fence of the 3D workload to complete.
>> +
>> +There are a few ways to prevent this problem:
>> +
>> +- Compute workloads can always be preempted, even when a page fault is pending
>> +  and not yet repaired. Not all hardware supports this.
>> +
>> +- DMA fence workloads and workloads which need page fault handling have
>> +  independent hardware resources to guarantee forward progress. This could be
>> +  achieved through e.g. through dedicated engines and minimal compute unit
>> +  reservations for DMA fence workloads.
>> +
>> +- The reservation approach could be further refined by only reserving the
>> +  hardware resources for DMA fence workloads when they are in-flight. This must
>> +  cover the time from when the DMA fence is visible to other threads up to
>> +  moment when fence is completed through dma_fence_signal().
>> +
>> +- As a last resort, if the hardware provides no useful reservation mechanics,
>> +  all workloads must be flushed from the GPU when switching between jobs
>> +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
>> +  fences must complete before a compute job with page fault handling can be
>> +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
>> +  made visible anywhere in the system, all compute workloads must be preempted
>> +  to guarantee all pending GPU page faults are flushed.
> I thought of another possible workaround:
>
>   * Partition the memory. Servicing of page faults will use a separate
>     memory pool that can always be allocated from without waiting for
>     fences. This includes memory for page tables and memory for
>     migrating data to. You may steal memory from other processes that
>     can page fault, so no fence waiting is necessary. Being able to
>     steal memory at any time also means there are basically no
>     out-of-memory situations you need to worry about. Even page tables
>     (except the root page directory of each process) can be stolen in
>     the worst case.

I think 'overcommit' would be a nice way to describe this. But I'm not
sure how easy this is to implement in practice. You would basically need
to create your own memory manager for this.

But from a design point of view, definitely a valid solution.

But this looks good, those solutions are definitely the valid options we
can choose from.

~Maarten

