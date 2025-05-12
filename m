Return-Path: <linux-media+bounces-32259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04780AB313E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE6A3A391A
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617992580F4;
	Mon, 12 May 2025 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="dzBlrOkI"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B73257AF9
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037559; cv=none; b=oV1hk+vFpZj80GKTp/JhNVsIK3V85NU7e8WwcZjMk9i+GfxqQa77d+242xI0T4n1NAtTz1Gb8Rc4YpCqNuVVIeErFTqNVlf9q5Ge3KAyCnujC2gzGv9RBE5AR4b0qfgwXCGjhf4ETAnkZoQWaGYqesvH4PYWIgeQosiSXL6Bco4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037559; c=relaxed/simple;
	bh=Qeu88wLXKyBTYvngi7xCQSkldHCWEKZ9g+Dfotx1/Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mi/p78bDy0I4Z3tmq03uR1Y+xEkeJn/E+3gQmBpYqiP8nIXXxqAByWAfrcRAF1NRzkUabWvdq0X474gz/P9C0LmZeIZrknBsHajfZIPkXPPNHiyx1DNDVxfT00kvXZ42DAgoA0thUuMWTfgJ4OGI8/VavlY60Grs/sEIZ3QqrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=dzBlrOkI; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eAprPJUuPGpBa8hxnlWYzh5isytsazuWWvCnoY6Zv84=; b=dzBlrOkIIhaEE2LPhNok734Nwp
	0/zxnpmexjmWTncO3p7yCkc8IgwFRg7EJMZQayiq9i/7xtb1ssTgWE2gtvWw6Vz9pIHfSrIMgu0lN
	zE2ZrFibBKGdmOs3OTJD9WFUp97dFDnhrAmSkH9bsMFKk7Vp4ZUm+PGtDTs2nH7pd+mp/jjUai8H5
	a1qLj1Wc/6LHtUEvttgAQDVnN+4D28EsccwPLIOvAX0CDZu9nF2Nas1g2CvISsMqo9eRg3LRKwlWO
	mCmGu/Dd5URcJ6glFFlfMavORyYSDTVU5DcZpgObqKJp8kAcAfLVwDiv9w00h/ZMXpD3Y7ld6KxEY
	8ZbyTC0Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEOBo-006xus-4M; Mon, 12 May 2025 10:12:25 +0200
Message-ID: <7621e1ac-e759-4752-b790-e798150cff82@igalia.com>
Date: Mon, 12 May 2025 09:12:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/13] dma-fence: Use a flag for 64-bit seqnos
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2025 16:33, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch (and dereference)
> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
> the fence->flags.
> 
> Drivers which were setting this flag are changed to use new
> dma_fence_init64() instead of dma_fence_init().


Note that due rebase slip up I lost the hunk which actually removes the 
bool from the ops struct. Fixed locally.

Regards,

Tvrtko

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/dma-buf/dma-fence-chain.c                | 5 ++---
>   drivers/dma-buf/dma-fence.c                      | 9 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c | 5 ++---
>   include/linux/dma-fence.h                        | 6 +++++-
>   4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 90424f23fd73..a8a90acf4f34 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>   }
>   
>   const struct dma_fence_ops dma_fence_chain_ops = {
> -	.use_64bit_seqno = true,
>   	.get_driver_name = dma_fence_chain_get_driver_name,
>   	.get_timeline_name = dma_fence_chain_get_timeline_name,
>   	.enable_signaling = dma_fence_chain_enable_signaling,
> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   			seqno = max(prev->seqno, seqno);
>   	}
>   
> -	dma_fence_init(&chain->base, &dma_fence_chain_ops,
> -		       &chain->lock, context, seqno);
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +			 context, seqno);
>   
>   	/*
>   	 * Chaining dma_fence_chain container together is only allowed through
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0cdd3e99d36..33661658f684 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1023,3 +1023,12 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	trace_dma_fence_init(fence);
>   }
>   EXPORT_SYMBOL(dma_fence_init);
> +
> +void
> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		 spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	dma_fence_init(fence, ops, lock, context, seqno);
> +	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> +}
> +EXPORT_SYMBOL(dma_fence_init64);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> index 51cddfa3f1e8..5d26797356a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>   }
>   
>   static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
> -	.use_64bit_seqno = true,
>   	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>   };
> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>   	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>   	spin_lock_init(&f->lock);
>   
> -	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> -		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
> +	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> +			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>   
>   	/* TODO: We probably need a separate wq here */
>   	dma_fence_get(&f->base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..ac6535716dbe 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -97,6 +97,7 @@ struct dma_fence {
>   };
>   
>   enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_SEQNO64_BIT,
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -262,6 +263,9 @@ struct dma_fence_ops {
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   		    spinlock_t *lock, u64 context, u64 seqno);
>   
> +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		      spinlock_t *lock, u64 context, u64 seqno);
> +
>   void dma_fence_release(struct kref *kref);
>   void dma_fence_free(struct dma_fence *fence);
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
> @@ -454,7 +458,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>   	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>   	 * do so.
>   	 */
> -	if (fence->ops->use_64bit_seqno)
> +	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>   		return f1 > f2;
>   
>   	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;


