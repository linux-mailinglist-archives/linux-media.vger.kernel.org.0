Return-Path: <linux-media+bounces-33906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE9ACAE84
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C6E3AD28B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C74218587;
	Mon,  2 Jun 2025 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lSemoB3K"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D82D7BF
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869550; cv=none; b=nOAKsJLg4XWX1VKTIO67uKXEG8bQbojPxALnH0yNIQFjYpn8ZpoTe88zDhg0AucfKHFmJ91jut4Eikkm/LdDQ0Der6Q5mgWfbUIreKiNmP6J83VX86Z0xi4YYjmOqGRncDps9TMVwhDbAQ6uhhHaNL+DvOahyAYLto0Skz5bcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869550; c=relaxed/simple;
	bh=NC0GJp+IXARutepXq/zjr4cfbfrFiXvRZzFKV9koYak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUVL/poXWdG1PhgRRxQVgXFkgOgX62Vwth2PYOiWrsFrEi+7l0FREiXuXQYj7MucJA6NA4P+aPMIjSTm7wh+7jyNIGkD3+oYjDTDkyTLdido/MCJTdTV4Vxsm4Ki+i0MO8B/DEmfSHGGJrrOD1zsZ6fkrnC0IQQGNuypwiYEf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lSemoB3K; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=trlQBZ+NItaU//lHOT4H++EBW6iykhaqcQo7T+bv8Cw=; b=lSemoB3KyeXrhMFJ3+ArOD3xky
	WlImlzAOXcWmwBMyQrwyFGtsvo3SXlxNZFoJxnu0YMYbtq6wYg0h7sS6jtRMJN5OeYD7Tz3NbPcyD
	a+R6U4X+stCLU7ddsIRX9IsqrSP5ZqQXMO9M4soECOSwjpY2NHXXershLvECYKT6hRjokQa44gJf1
	BfUmvfjZ7RG/YI9te1uDW8jCaR5A0zr3mEiQsyfu13fRYWuhONjSYe7wvNwZbQMVRJiiEsUvPocIP
	9KtZCt6eZ3TzNTuO2GSmuNgojU6unyz5cbaVw8SowpI4mUDiAEJKDSK+u56FXZFHAaHNZBXH+Kezj
	AWpurN3g==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uM4r6-00GHa9-Oy; Mon, 02 Jun 2025 15:05:32 +0200
Message-ID: <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
Date: Mon, 2 Jun 2025 14:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

On 15/05/2025 14:15, Christian König wrote:
> Hey drm-misc maintainers,
> 
> can you guys please backmerge drm-next into drm-misc-next?
> 
> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.

Looks like the backmerge is still pending?

In the meantime, Christian, any chance you will have some bandwith to 
think about the tail end of the series? Specifically patch 6 and how 
that is used onward.

Regards,

Tvrtko

> On 5/15/25 11:49, Tvrtko Ursulin wrote:
>> With the goal of reducing the need for drivers to touch (and dereference)
>> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
>> the fence->flags.
>>
>> Drivers which were setting this flag are changed to use new
>> dma_fence_init64() instead of dma_fence_init().
>>
>> v2:
>>   * Streamlined init and added kerneldoc.
>>   * Rebase for amdgpu userq which landed since.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>> ---
>>   drivers/dma-buf/dma-fence-chain.c             |  5 +-
>>   drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>>   .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>>   .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>>   include/linux/dma-fence.h                     | 14 ++--
>>   6 files changed, 64 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index 90424f23fd73..a8a90acf4f34 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>   }
>>   
>>   const struct dma_fence_ops dma_fence_chain_ops = {
>> -	.use_64bit_seqno = true,
>>   	.get_driver_name = dma_fence_chain_get_driver_name,
>>   	.get_timeline_name = dma_fence_chain_get_timeline_name,
>>   	.enable_signaling = dma_fence_chain_enable_signaling,
>> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>   			seqno = max(prev->seqno, seqno);
>>   	}
>>   
>> -	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>> -		       &chain->lock, context, seqno);
>> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>> +			 context, seqno);
>>   
>>   	/*
>>   	 * Chaining dma_fence_chain container together is only allowed through
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index f0cdd3e99d36..705b59787731 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>   }
>>   EXPORT_SYMBOL(dma_fence_describe);
>>   
>> -/**
>> - * dma_fence_init - Initialize a custom fence.
>> - * @fence: the fence to initialize
>> - * @ops: the dma_fence_ops for operations on this fence
>> - * @lock: the irqsafe spinlock to use for locking this fence
>> - * @context: the execution context this fence is run on
>> - * @seqno: a linear increasing sequence number for this context
>> - *
>> - * Initializes an allocated fence, the caller doesn't have to keep its
>> - * refcount after committing with this fence, but it will need to hold a
>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>> - *
>> - * context and seqno are used for easy comparison between fences, allowing
>> - * to check which fence is later by simply using dma_fence_later().
>> - */
>> -void
>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> -	       spinlock_t *lock, u64 context, u64 seqno)
>> +static void
>> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> +	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>>   {
>>   	BUG_ON(!lock);
>>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>   	fence->lock = lock;
>>   	fence->context = context;
>>   	fence->seqno = seqno;
>> -	fence->flags = 0UL;
>> +	fence->flags = flags;
>>   	fence->error = 0;
>>   
>>   	trace_dma_fence_init(fence);
>>   }
>> +
>> +/**
>> + * dma_fence_init - Initialize a custom fence.
>> + * @fence: the fence to initialize
>> + * @ops: the dma_fence_ops for operations on this fence
>> + * @lock: the irqsafe spinlock to use for locking this fence
>> + * @context: the execution context this fence is run on
>> + * @seqno: a linear increasing sequence number for this context
>> + *
>> + * Initializes an allocated fence, the caller doesn't have to keep its
>> + * refcount after committing with this fence, but it will need to hold a
>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>> + *
>> + * context and seqno are used for easy comparison between fences, allowing
>> + * to check which fence is later by simply using dma_fence_later().
>> + */
>> +void
>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> +	       spinlock_t *lock, u64 context, u64 seqno)
>> +{
>> +	__dma_fence_init(fence, ops, lock, context, seqno, 0UL);
>> +}
>>   EXPORT_SYMBOL(dma_fence_init);
>> +
>> +/**
>> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>> + * @fence: the fence to initialize
>> + * @ops: the dma_fence_ops for operations on this fence
>> + * @lock: the irqsafe spinlock to use for locking this fence
>> + * @context: the execution context this fence is run on
>> + * @seqno: a linear increasing sequence number for this context
>> + *
>> + * Initializes an allocated fence, the caller doesn't have to keep its
>> + * refcount after committing with this fence, but it will need to hold a
>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>> + *
>> + * Context and seqno are used for easy comparison between fences, allowing
>> + * to check which fence is later by simply using dma_fence_later().
>> + */
>> +void
>> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> +		 spinlock_t *lock, u64 context, u64 seqno)
>> +{
>> +	__dma_fence_init(fence, ops, lock, context, seqno,
>> +			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>> +}
>> +EXPORT_SYMBOL(dma_fence_init64);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>> index 1a7469543db5..79713421bffe 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>>   }
>>   
>>   static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
>> -	.use_64bit_seqno = true,
>>   	.get_driver_name = amdgpu_eviction_fence_get_driver_name,
>>   	.get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>>   	.enable_signaling = amdgpu_eviction_fence_enable_signaling,
>> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>>   	ev_fence->evf_mgr = evf_mgr;
>>   	get_task_comm(ev_fence->timeline_name, current);
>>   	spin_lock_init(&ev_fence->lock);
>> -	dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
>> -		       &ev_fence->lock, evf_mgr->ev_fence_ctx,
>> -		       atomic_inc_return(&evf_mgr->ev_fence_seq));
>> +	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
>> +			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
>> +			 atomic_inc_return(&evf_mgr->ev_fence_seq));
>>   	return ev_fence;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> index 029cb24c28b3..5e92d00a591f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>   	fence = &userq_fence->base;
>>   	userq_fence->fence_drv = fence_drv;
>>   
>> -	dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>> -		       fence_drv->context, seq);
>> +	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>> +			 fence_drv->context, seq);
>>   
>>   	amdgpu_userq_fence_driver_get(fence_drv);
>>   	dma_fence_get(fence);
>> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>>   }
>>   
>>   static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>> -	.use_64bit_seqno = true,
>>   	.get_driver_name = amdgpu_userq_fence_get_driver_name,
>>   	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>   	.signaled = amdgpu_userq_fence_signaled,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>> index 51cddfa3f1e8..5d26797356a3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>>   }
>>   
>>   static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
>> -	.use_64bit_seqno = true,
>>   	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
>>   	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>>   };
>> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>>   	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>>   	spin_lock_init(&f->lock);
>>   
>> -	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>> -		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>> +	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>> +			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>   
>>   	/* TODO: We probably need a separate wq here */
>>   	dma_fence_get(&f->base);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 48b5202c531d..a34a0dcdc446 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -97,6 +97,7 @@ struct dma_fence {
>>   };
>>   
>>   enum dma_fence_flag_bits {
>> +	DMA_FENCE_FLAG_SEQNO64_BIT,
>>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>>    *
>>    */
>>   struct dma_fence_ops {
>> -	/**
>> -	 * @use_64bit_seqno:
>> -	 *
>> -	 * True if this dma_fence implementation uses 64bit seqno, false
>> -	 * otherwise.
>> -	 */
>> -	bool use_64bit_seqno;
>> -
>>   	/**
>>   	 * @get_driver_name:
>>   	 *
>> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>   		    spinlock_t *lock, u64 context, u64 seqno);
>>   
>> +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>> +		      spinlock_t *lock, u64 context, u64 seqno);
>> +
>>   void dma_fence_release(struct kref *kref);
>>   void dma_fence_free(struct dma_fence *fence);
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>   	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>   	 * do so.
>>   	 */
>> -	if (fence->ops->use_64bit_seqno)
>> +	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>   		return f1 > f2;
>>   
>>   	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> 


