Return-Path: <linux-media+bounces-39810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A5B248FD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321CE2A40FD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B562C1798;
	Wed, 13 Aug 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ThEOiRFv"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5B2EFDAF
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086366; cv=none; b=s6ZK86gTM25RN75BKwykdbLPfDoSP4kPdcVnKR/nXR7XZpfiBONin3n1U8whyvhoYn99SOk1+/XYYus6loGdW0waOWnWu+WzpFfJfEuMCDZnxsZYAd8vL2FBUMCBc4Bl8j1AN8uElze22wh3UzD1BG+kc9MgtMNRWsEtsUjjrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086366; c=relaxed/simple;
	bh=fCTzPGPckDb9SJ9PEimwIiOCdJiYSdn5iBs3wpa/oWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B/OEfQ3JjJtw9dt7papBfrEPUD4xZ9XO7rIQlLBaZBgd4S9VC0JtsNoD1x8ZRwFNll0m6AtTNNbeb061eUdpwb2xxjaC3g226sH+4Xn4GTq1L7/DguPPa8uMGkZx53b5ZWi5z39GLbrQhA1V74ejwzf4RzGMEoLnD8PZlnxsJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ThEOiRFv; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yujK29fYZljmgXx4rY1KPSYayYJ+LrVKrTgVjKACRoI=; b=ThEOiRFvy5ciiyY6L03sxe855P
	AtqT7NHJn7g1XyeedLlEpPjf3MhUovNtohG6679uH3RUJABJ2AXNIokBKG5zJurdI4MmEfSXxnvip
	qgQa0gmxwHqIvirlwUdRA9nmapZpSZDnkb68g5LkPJMU47uDt6eY4gwisyNxf5husoLKxOhhMZ617
	bFKs7Oo38osLMo3qrieHw0lHSVlOLbTDwlHWqiIRkurJFDFKXz7AT/x20BA1Qr1B9aO0pzCjoEMqW
	3tCZrLUr2T/cv/VlvuTXQzzzew3hzzH4ssMT2GxjquLmojeEie5RvWy0dlfAWrIiD+e885jdnZ5TC
	l3qWTxog==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1umA8J-00DeQv-My; Wed, 13 Aug 2025 13:59:07 +0200
Message-ID: <66e1e772-da61-4422-9f50-1dfeaf92282b@igalia.com>
Date: Wed, 13 Aug 2025 12:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona.vetter@ffwll.ch, phasta@mailbox.org, airlied@gmail.com,
 dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
 <125ecf34-4f9f-4310-8f87-586da9a78977@igalia.com>
 <0a381201-3a73-48e9-ad5b-550abf141022@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0a381201-3a73-48e9-ad5b-550abf141022@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 13/08/2025 12:10, Christian König wrote:
> On 13.08.25 10:20, Tvrtko Ursulin wrote:
>>
>> On 12/08/2025 15:34, Christian König wrote:
>>> From: Christian König <ckoenig@able.fritz.box>
>>>
>>> We have the re-occurring problem that people try to invent a
>>> DMA-fences implementation which signals fences based on an userspace
>>> IOCTL.
>>>
>>> This is well known as source of hard to track down crashes and is
>>> documented to be an invalid approach. The problem is that it seems
>>> to work during initial testing and only long term tests points out
>>> why this can never work correctly.
>>>
>>> So give at least a warning when people try to signal a fence from
>>> task context and not from interrupts or a work item. This check is
>>> certainly not perfect but better than nothing.
>>
>> I lack context as to why this should be disallowed so strongly (maybe cover letter is missing to better explain it all?)
> 
> See here https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> 
> I was hoping that this problem is so well known by now that it doesn't need more explanation.
> 
> Going to expand the commit message a bit.

I probably got thrown by the mention of crashes. But yes, expanding the 
commit and clarifying it is about deadlocks and indefinite fences, or 
adding the cover letter would be better thanks!

>> , but at least if feels overly restrictive to for example exclude threads and thread workers.
> 
> Good point. Could be that someone is using a pure kernel thread for fence signaling. Going to check for that instead of a worker.

Ok, I am curious how to do it reliably. Non-null current and PF_KTHREAD 
and PF_WQ_WORKER not set?

>> Even the fact opportunistic signalling needs to bypass the assert makes it sound like there isn't anything fundamentally wrong with signalling from task context.
>>
> 
> Opportunistic signaling can happen from everywhere. But when an implementation tries to signal it from an IOCTL that is certainly invalid.
> 
>> The first patch also feels a bit too much if it has no purpose apart from checking the new asserts would otherwise trigger.
> 
> The sw_sync code is is only used for testing and debugging. See the Kconfig of it:
> 
>            A sync object driver that uses a 32bit counter to coordinate
>            synchronization.  Useful when there is no hardware primitive backing
>            the synchronization.
> 
>            WARNING: improper use of this can result in deadlocking kernel
>            drivers from userspace. Intended for test and debug only.
> 

But it is adding kernel code for a questionable benefit.

What about calling the non-asserting version instead of adding 
complexity? It is kernel code so should be fine.

Because even with the worker sw_sync can still create infinite fences. 
Worker just defeats the asserts so I do not see the value in 
complicating it.

Regards,

Tvrtko

>>
>>> Signed-off-by: Christian König <ckoenig@able.fritz.box>
>>> ---
>>>    drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>>>    include/linux/dma-fence.h   |  9 ++++--
>>>    2 files changed, 51 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 3f78c56b58dc..2bce620eacac 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>>>    }
>>>    #endif
>>>    -
>>>    /**
>>> - * dma_fence_signal_timestamp_locked - signal completion of a fence
>>> + * dma_fence_signal_internal - internal signal completion of a fence
>>>     * @fence: the fence to signal
>>>     * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>>     *
>>> - * Signal completion for software callbacks on a fence, this will unblock
>>> - * dma_fence_wait() calls and run all the callbacks added with
>>> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>> - * can only go from the unsignaled to the signaled state and not back, it will
>>> - * only be effective the first time. Set the timestamp provided as the fence
>>> - * signal timestamp.
>>> - *
>>> - * Unlike dma_fence_signal_timestamp(), this function must be called with
>>> - * &dma_fence.lock held.
>>> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
>>> + * by drivers or external code directly.
>>>     *
>>>     * Returns 0 on success and a negative error value when @fence has been
>>>     * signalled already.
>>>     */
>>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>> -                      ktime_t timestamp)
>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>>>    {
>>>        struct dma_fence_cb *cur, *tmp;
>>>        struct list_head cb_list;
>>>          lockdep_assert_held(fence->lock);
>>> -
>>>        if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>                          &fence->flags)))
>>>            return -EINVAL;
>>> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>          return 0;
>>>    }
>>> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>>> +EXPORT_SYMBOL(dma_fence_signal_internal);
>>> +
>>> +/**
>>> + * dma_fence_signal_timestamp_locked - signal completion of a fence
>>> + * @fence: the fence to signal
>>> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>> + *
>>> + * Signal completion for software callbacks on a fence, this will unblock
>>> + * dma_fence_wait() calls and run all the callbacks added with
>>> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>> + * can only go from the unsignaled to the signaled state and not back, it will
>>> + * only be effective the first time. Set the timestamp provided as the fence
>>> + * signal timestamp.
>>> + *
>>> + * Unlike dma_fence_signal_timestamp(), this function must be called with
>>> + * &dma_fence.lock held.
>>> + *
>>> + * Returns 0 on success and a negative error value when @fence has been
>>> + * signalled already.
>>> + */
>>> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>> +                      ktime_t timestamp)
>>> +{
>>> +    /*
>>> +     * We have the re-occurring problem that people try to invent a
>>> +     * DMA-fences implementation which signals fences based on an userspace
>>> +     * IOCTL.
>>> +     *
>>> +     * This is well known as source of hard to track down crashes and is
>>> +     * documented to be an invalid approach. The problem is that it seems
>>> +     * to work during initial testing and only long term tests points out
>>> +     * why this can never work correctly.
>>> +     *
>>> +     * So give at least a warning when people try to signal a fence from
>>> +     * task context and not from interrupts or a work item. This check is
>>> +     * certainly not perfect but better than nothing.
>>> +     */
>>> +    WARN_ON_ONCE(!in_interrupt() && !current_work());
>>> +    return dma_fence_signal_internal(fence, timestamp);
>>> +}
>>>      /**
>>>     * dma_fence_signal_timestamp - signal completion of a fence
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 64639e104110..8dbcd66989b8 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>>>    int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>>    int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>                          ktime_t timestamp);
>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>>>    signed long dma_fence_default_wait(struct dma_fence *fence,
>>>                       bool intr, signed long timeout);
>>>    int dma_fence_add_callback(struct dma_fence *fence,
>>> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>            return true;
>>>          if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> -        dma_fence_signal_locked(fence);
>>> +        dma_fence_signal_internal(fence, ktime_get());
>>>            return true;
>>>        }
>>>    @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>    static inline bool
>>>    dma_fence_is_signaled(struct dma_fence *fence)
>>>    {
>>> +    unsigned long flags;
>>> +
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return true;
>>>          if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> -        dma_fence_signal(fence);
>>> +        spin_lock_irqsave(fence->lock, flags);
>>> +        dma_fence_signal_internal(fence, ktime_get());
>>> +        spin_unlock_irqrestore(fence->lock, flags);
>>>            return true;
>>>        }
>>>    
>>
> 


