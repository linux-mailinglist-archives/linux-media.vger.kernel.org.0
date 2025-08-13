Return-Path: <linux-media+bounces-39751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F2B24433
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8C2F16EE31
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6897C2ECEB1;
	Wed, 13 Aug 2025 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lTDCxI3q"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFF2EA172
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073275; cv=none; b=g0SFr8kvbdI4ANblfDOp3sGGoSTIBYPk3ZKN7nUhzHgkk3QYH2rzxWTsBQ0WpyqAv2kJ0SEe7YHlBdPcM1yZBAG4ETKfO/aBGsHmtzTzR1BGJ5Xnq1cg41zuuaNiYpbrqjI7eXpEb5cZOQAJPjMx1fara9nQVIoTLCCPaDnl7vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073275; c=relaxed/simple;
	bh=PNuJW8MFwyPsFOpHAd4Uq/6E2MqFUa3zDro/cnWBauo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WDxvt6f+X4wWSXjErERszURRloZ6D1t7eDRmeLFD6UkPRidXb7g+6CGaJYADiImqc5zTJElyStKrbl/t+El3jMYZ6JMTtgQSoJEUmjenGsUJzdDd4IGU20OgpMOSoj1Nu+u2SCuYr0yvDQ3zTZ7GaGTQYeEY+x0y1GXDN4qeT14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lTDCxI3q; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6Fp6xmSWBDn22eTjzLWdiw7yQ+Pkg3IW/nS7w/MeHic=; b=lTDCxI3qNqySj7lqtJibMmUMpz
	7gIY0hwnENLODB+uOiABTd/TIlP6FB8VBxF8QsbuAzDhMxwn+Fe/STGXZrHFWv5O9Z3yt/j9X64UQ
	LwY4XExJbEtVCC9EBO9eLuu1YDGgnj7X0frdJio54DZ/6gYOi4ZYQDuunBpWIHXKez6UtMy6MCajb
	xYrAosUMmr+RCf7aZm+gvP+j29+9Yf4XesSocLqRNmKju6rSAe4vQ4b114znJFzT22jpCHe/1ecGN
	jRheQsz9LwNJvwxjO+4cw0XkyOjZ3tQDpve4sqRbo9KN3sH3nmrvFTLbeAxieDXapfgIE3ufv9LPP
	7yVPp82A==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1um6j4-00Da66-T9; Wed, 13 Aug 2025 10:20:50 +0200
Message-ID: <125ecf34-4f9f-4310-8f87-586da9a78977@igalia.com>
Date: Wed, 13 Aug 2025 09:20:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 simona.vetter@ffwll.ch, phasta@mailbox.org, airlied@gmail.com,
 dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250812143402.8619-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/08/2025 15:34, Christian König wrote:
> From: Christian König <ckoenig@able.fritz.box>
> 
> We have the re-occurring problem that people try to invent a
> DMA-fences implementation which signals fences based on an userspace
> IOCTL.
> 
> This is well known as source of hard to track down crashes and is
> documented to be an invalid approach. The problem is that it seems
> to work during initial testing and only long term tests points out
> why this can never work correctly.
> 
> So give at least a warning when people try to signal a fence from
> task context and not from interrupts or a work item. This check is
> certainly not perfect but better than nothing.

I lack context as to why this should be disallowed so strongly (maybe 
cover letter is missing to better explain it all?), but at least if 
feels overly restrictive to for example exclude threads and thread workers.

Even the fact opportunistic signalling needs to bypass the assert makes 
it sound like there isn't anything fundamentally wrong with signalling 
from task context.

The first patch also feels a bit too much if it has no purpose apart 
from checking the new asserts would otherwise trigger.

Regards,

Tvrtko

> Signed-off-by: Christian König <ckoenig@able.fritz.box>
> ---
>   drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>   include/linux/dma-fence.h   |  9 ++++--
>   2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..2bce620eacac 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>   }
>   #endif
>   
> -
>   /**
> - * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * dma_fence_signal_internal - internal signal completion of a fence
>    * @fence: the fence to signal
>    * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>    *
> - * Signal completion for software callbacks on a fence, this will unblock
> - * dma_fence_wait() calls and run all the callbacks added with
> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
> - * can only go from the unsignaled to the signaled state and not back, it will
> - * only be effective the first time. Set the timestamp provided as the fence
> - * signal timestamp.
> - *
> - * Unlike dma_fence_signal_timestamp(), this function must be called with
> - * &dma_fence.lock held.
> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
> + * by drivers or external code directly.
>    *
>    * Returns 0 on success and a negative error value when @fence has been
>    * signalled already.
>    */
> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> -				      ktime_t timestamp)
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>   {
>   	struct dma_fence_cb *cur, *tmp;
>   	struct list_head cb_list;
>   
>   	lockdep_assert_held(fence->lock);
> -
>   	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>   				      &fence->flags)))
>   		return -EINVAL;
> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
> +EXPORT_SYMBOL(dma_fence_signal_internal);
> +
> +/**
> + * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * @fence: the fence to signal
> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
> + *
> + * Signal completion for software callbacks on a fence, this will unblock
> + * dma_fence_wait() calls and run all the callbacks added with
> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
> + * can only go from the unsignaled to the signaled state and not back, it will
> + * only be effective the first time. Set the timestamp provided as the fence
> + * signal timestamp.
> + *
> + * Unlike dma_fence_signal_timestamp(), this function must be called with
> + * &dma_fence.lock held.
> + *
> + * Returns 0 on success and a negative error value when @fence has been
> + * signalled already.
> + */
> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> +				      ktime_t timestamp)
> +{
> +	/*
> +	 * We have the re-occurring problem that people try to invent a
> +	 * DMA-fences implementation which signals fences based on an userspace
> +	 * IOCTL.
> +	 *
> +	 * This is well known as source of hard to track down crashes and is
> +	 * documented to be an invalid approach. The problem is that it seems
> +	 * to work during initial testing and only long term tests points out
> +	 * why this can never work correctly.
> +	 *
> +	 * So give at least a warning when people try to signal a fence from
> +	 * task context and not from interrupts or a work item. This check is
> +	 * certainly not perfect but better than nothing.
> +	 */
> +	WARN_ON_ONCE(!in_interrupt() && !current_work());
> +	return dma_fence_signal_internal(fence, timestamp);
> +}
>   
>   /**
>    * dma_fence_signal_timestamp - signal completion of a fence
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..8dbcd66989b8 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>   int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>   int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   				      ktime_t timestamp);
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>   signed long dma_fence_default_wait(struct dma_fence *fence,
>   				   bool intr, signed long timeout);
>   int dma_fence_add_callback(struct dma_fence *fence,
> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal_locked(fence);
> +		dma_fence_signal_internal(fence, ktime_get());
>   		return true;
>   	}
>   
> @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +	unsigned long flags;
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal(fence);
> +		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_signal_internal(fence, ktime_get());
> +		spin_unlock_irqrestore(fence->lock, flags);
>   		return true;
>   	}
>   


