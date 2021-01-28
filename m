Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB116306FD1
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 08:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbhA1Hkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 02:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhA1HkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 02:40:00 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6334C061573
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 23:39:16 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c6so5508912ede.0
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 23:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6wd48G/7iTVMP11EU55caYF7Pq980gXN3eLyhOl5sZc=;
        b=b3vAa1W1asDK3BjmNsUF69pKBnWHsujT8HXfZZUbiFwmp70Wukh2VVBkcghkw4936P
         pkav7+PipCGFrY2qBqCMG9gcop2QVe7KwKWKf6wu7x803l+ECPHPna5v+1oSCKJNzsHp
         5vSCGMsF0vZUr2hzvkwp6F3qlHblpjpX69K70+bSwYvEaRf1Mn1NsLHWbTecHqnTg7Ej
         5AvAfpYQFEdErNitFwHXMBLiz5DBp3vIeeUcMSWtXSg0072vVR6jI57wGCAq7EVDr2GK
         acAjAyEHGN3cj/gNHscTwEqzaz+o47Qz7/2WRaluiVvRcwVvj9yqIa6UTpZ4s+hjFfvQ
         uyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=6wd48G/7iTVMP11EU55caYF7Pq980gXN3eLyhOl5sZc=;
        b=Ft17tyTgPLV3KIbETye09GG3t75WNny2Dtb7TPgzyegyXfsnMdBnewh1wkcehozEOR
         zgoR9lqBY3bPSBzXrvyBnr5F9vM4qybCXEQzGfUOdkPYBeYkYEEeE7kgQ/zB8VAfC+k7
         KQ1/e0tSZlClOprOpMnNq/nDocYxfry7u77mLC6NOA8arIM+9VAeBdiv0o+rxtRiMxLT
         XPrsRYpcqczbAb2wYRU3M2Y+iNcMa+I1ZMsn0llUZn1H3DW+syUEuf/oDxqDVgEO8CrB
         xgWWw8qUeW+RGI9oQTejZ6F6akd42npGofSCaU5W4VSC/5QMwynWFO1R9TWuBoEAV4Dl
         1JtQ==
X-Gm-Message-State: AOAM532VDQQ57pmak9DEmmGXvKMh81+Kw/9XZb/3hiL7pC+vCAeg+Ow2
        71giGuEvZeBrcIAQBJ5LGZYV5li2WYY=
X-Google-Smtp-Source: ABdhPJyKFEG3GJFK0hIE287EDGvBC5HUJ5jqe6Abo1BWjB4RY9d+2cE7ZGX1P38RSk/8gZw3RgMhWQ==
X-Received: by 2002:a05:6402:1701:: with SMTP id y1mr12397692edu.251.1611819555209;
        Wed, 27 Jan 2021 23:39:15 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id s18sm2697772edw.66.2021.01.27.23.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 23:39:14 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Felix Kuehling <felix.kuehling@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     linaro-mm-sig@lists.linaro.org, Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
 <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
 <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com>
Date:   Thu, 28 Jan 2021 08:39:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 27.01.21 um 23:00 schrieb Felix Kuehling:
> Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>>> Recently there was a fairly long thread about recoreable hardware page
>>>>> faults, how they can deadlock, and what to do about that.
>>>>>
>>>>> While the discussion is still fresh I figured good time to try and
>>>>> document the conclusions a bit.
>>>>>
>>>>> References:
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbee0aeff80f440bcc52108d8c2bcc11f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637473463245588199%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ncr%2Fqv5lw0ONrYxFvfdcFAXAZ%2BXcJJa6UY%2BxGfcKGVM%3D&amp;reserved=0
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>> Cc: linux-media@vger.kernel.org
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>> -- 
>>>>> I'll be away next week, but figured I'll type this up quickly for some
>>>>> comments and to check whether I got this all roughly right.
>>>>>
>>>>> Critique very much wanted on this, so that we can make sure hw which
>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear path to
>>>>> support page faults in upstream. So anything I missed, got wrong or
>>>>> like that would be good.
>>>>> -Daniel
>>>>> ---
>>>>>    Documentation/driver-api/dma-buf.rst | 66
>>>>> ++++++++++++++++++++++++++++
>>>>>    1 file changed, 66 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>>> b/Documentation/driver-api/dma-buf.rst
>>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>>      userspace is allowed to use userspace fencing or long running
>>>>> compute
>>>>>      workloads. This also means no implicit fencing for shared
>>>>> buffers in these
>>>>>      cases.
>>>>> +
>>>>> +Recoverable Hardware Page Faults Implications
>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +Modern hardware supports recoverable page faults, which has a lot of
>>>>> +implications for DMA fences.
>>>>> +
>>>>> +First, a pending page fault obviously holds up the work that's
>>>>> running on the
>>>>> +accelerator and a memory allocation is usually required to resolve
>>>>> the fault.
>>>>> +But memory allocations are not allowed to gate completion of DMA
>>>>> fences, which
>>>>> +means any workload using recoverable page faults cannot use DMA
>>>>> fences for
>>>>> +synchronization. Synchronization fences controlled by userspace
>>>>> must be used
>>>>> +instead.
>>>>> +
>>>>> +On GPUs this poses a problem, because current desktop compositor
>>>>> protocols on
>>>>> +Linus rely on DMA fences, which means without an entirely new
>>>>> userspace stack
>>>>> +built on top of userspace fences, they cannot benefit from
>>>>> recoverable page
>>>>> +faults. The exception is when page faults are only used as
>>>>> migration hints and
>>>>> +never to on-demand fill a memory request. For now this means
>>>>> recoverable page
>>>>> +faults on GPUs are limited to pure compute workloads.
>>>>> +
>>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>>> rendering and
>>>>> +compute side, like compute units or command submission engines. If
>>>>> both a 3D
>>>>> +job with a DMA fence and a compute workload using recoverable page
>>>>> faults are
>>>>> +pending they could deadlock:
>>>>> +
>>>>> +- The 3D workload might need to wait for the compute job to finish
>>>>> and release
>>>>> +  hardware resources first.
>>>>> +
>>>>> +- The compute workload might be stuck in a page fault, because the
>>>>> memory
>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>>> complete.
>>>>> +
>>>>> +There are a few ways to prevent this problem:
>>>>> +
>>>>> +- Compute workloads can always be preempted, even when a page
>>>>> fault is pending
>>>>> +  and not yet repaired. Not all hardware supports this.
>>>>> +
>>>>> +- DMA fence workloads and workloads which need page fault handling
>>>>> have
>>>>> +  independent hardware resources to guarantee forward progress.
>>>>> This could be
>>>>> +  achieved through e.g. through dedicated engines and minimal
>>>>> compute unit
>>>>> +  reservations for DMA fence workloads.
>>>>> +
>>>>> +- The reservation approach could be further refined by only
>>>>> reserving the
>>>>> +  hardware resources for DMA fence workloads when they are
>>>>> in-flight. This must
>>>>> +  cover the time from when the DMA fence is visible to other
>>>>> threads up to
>>>>> +  moment when fence is completed through dma_fence_signal().
>>>>> +
>>>>> +- As a last resort, if the hardware provides no useful reservation
>>>>> mechanics,
>>>>> +  all workloads must be flushed from the GPU when switching
>>>>> between jobs
>>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>>> means all DMA
>>>>> +  fences must complete before a compute job with page fault
>>>>> handling can be
>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>>> fence can be
>>>>> +  made visible anywhere in the system, all compute workloads must
>>>>> be preempted
>>>>> +  to guarantee all pending GPU page faults are flushed.
>>>> I thought of another possible workaround:
>>>>
>>>>     * Partition the memory. Servicing of page faults will use a separate
>>>>       memory pool that can always be allocated from without waiting for
>>>>       fences. This includes memory for page tables and memory for
>>>>       migrating data to. You may steal memory from other processes that
>>>>       can page fault, so no fence waiting is necessary. Being able to
>>>>       steal memory at any time also means there are basically no
>>>>       out-of-memory situations you need to worry about. Even page tables
>>>>       (except the root page directory of each process) can be stolen in
>>>>       the worst case.
>>> I think 'overcommit' would be a nice way to describe this. But I'm not
>>> sure how easy this is to implement in practice. You would basically need
>>> to create your own memory manager for this.
>> Well you would need a completely separate pool for both device as well
>> as system memory.
>>
>> E.g. on boot we say we steal X GB system memory only for HMM.
> Why? The GPU driver doesn't need to allocate system memory for HMM.
> Migrations to system memory are handled by the kernel's handle_mm_fault
> and page allocator and swap logic.

And that one depends on dma_fence completion because you can easily need 
to wait for an MMU notifier callback.

As Maarten wrote when you want to go down this route you need a complete 
separate memory management parallel to the one of the kernel.

Regards,
Christian.

>   It doesn't depend on any fences, so
> it cannot deadlock with any GPU driver-managed memory. The GPU driver
> gets involved in the MMU notifier to invalidate device page tables. But
> that also doesn't need to wait for any fences.
>
> And if the kernel runs out of pageable memory, you're in trouble anyway.
> The OOM killer will step in, nothing new there.
>
> Regards,
>    Felix
>
>
>>> But from a design point of view, definitely a valid solution.
>> I think the restriction above makes it pretty much unusable.
>>
>>> But this looks good, those solutions are definitely the valid options we
>>> can choose from.
>> It's certainly worth noting, yes. And just to make sure that nobody
>> has the idea to reserve only device memory.
>>
>> Christian.
>>
>>> ~Maarten
>>>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

