Return-Path: <linux-media+bounces-59320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLUHLeay6GmIOwIAu9opvQ
	(envelope-from <linux-media+bounces-59320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:37:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 618484457B2
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEBD53018B6E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D023D16F8;
	Wed, 22 Apr 2026 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="PwV+QFIa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3F3C198A
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857827; cv=none; b=nYMtCW+RF/8s/QO/vpQBJ0Nsv7XWYY2tAyEsC1fkubIPEvixCiR1oMJBrA1aX0Zw8NzJMvK6Uw8zkOPP77ZPrPuQij1qbP+vUhtYlc4rUVqFG3JwpBZo6j8mQ1Es3jxfFZdVMIV9DfxF7o+AvwhdIoVakp4dHxYLa5AlVMpYsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857827; c=relaxed/simple;
	bh=bIcYa2SQS1YivblIbqaK6J+hNuY8yZGc05G9k9zQnaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUtAbQn4K+uultLFgHED+xJCcuUKADuQaiwC6JK4/9Yk4SFxA64CtpaUJagUklFOJer+QSKrJf3co3il2uxY4Mxb4j7Syl1HmxKIVVnQQB7IBxtRwTJ4ukNXpiwBaJdbVkjnL5JZc4cph0iNtNFHZgrX9/HHGTri4MRsMIPUQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=PwV+QFIa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso45128065e9.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1776857824; x=1777462624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAjkzDW3dUMmYnC6wUG2L3asSga3XbechqWM9IgW1us=;
        b=PwV+QFIap2KhWkiwA9cMSFgv3E2frMQjBPQIyLFkgsK4Om+RKbc7ppycDAyvpIUjvk
         2crryzTB/p1db15JF6YAOJirpKqzWADTwx3WvTNoXoXw1D4crJLLwN5FOGkQeqa2Mqvt
         8zojYigbv4R+hyTKMLLouDWMrTkYrpf4NSlGBjtZqnj1R1UoxQdG7RA2iOYg/ZQeBd4P
         HJXrZqLhHAHNsNfvrFsGrby6c8jH+Lum+qUFcWTm11L3RLTL614gMEEyIZpQwkDGvVJ+
         bRSlnDpr7LYSYI0SSTLY4DZnd6SibstS66361wmg861SaQGNK8ewF12CPVLHpWF9KffT
         +0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857824; x=1777462624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAjkzDW3dUMmYnC6wUG2L3asSga3XbechqWM9IgW1us=;
        b=BBm5xoaRpWVD4QBnuVNbScfFQ0x1D0cr5nJNn66wF0e5K0D6fdKCUy3iypyGOcVrfV
         WOPK4qyRzUHtmhB0GUrT3Pm2chXFmUBJ+sQiEQAHfWz79ExP3cgQeI3HHafn8VLcIR/k
         JJ56A606/psZiuF6frFVTxm09diYIrucV8Wpu8XsVmTrfEdSE3lzrQvjzxSKYQTQjaNC
         9R4ppUmjRJKTCNFjG0R2VKvz5tBa1T2fmoJj/85YngWuJBl/EmbjNPLdS/slLuxbUHnx
         qfI3I15si7QLt8srUuz2z9nIkMAyYGKP1+gPA9fqKFaiMqZUhC05M2afSuR8ymlzTVGf
         00Xg==
X-Forwarded-Encrypted: i=1; AFNElJ/OKWJDPucT73uBDVo807fz/bs+ARSdmdIDnsLy4M5oPk6/f1CaYlJpPxQ1fqDmsuYLK4wI0P6NYC0eTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOGssv3VzxzYR3SQaHOZraOuSv4FQq/feIAl4ufHlr6doPvf0i
	8XuSu4MEUCaG9Zo3ZRMFqzhecbIIBtFtp44CHn5KI4Uy8vPbagYjX2V4AZI+7k9+E80eNN7RflK
	lTCeSF8k=
X-Gm-Gg: AeBDieu1OplRebuc3xnDA+n8is/iU7croFK+fpVZOrOBTlVVq+lQVB5akx/y9BrEZZL
	VXHviXmm86sH0gPU5cHmeHft4GkiiNWlbCe/la3KjjNG9WrustFtRNtTr4HW2F+HVcMsAYDx9JQ
	Rj4klvBjwkZlmrkJNd59r4TerecWlthZdpVBhY4IQHX7W8SG3QPJdrJWHiREQHbNPjrDbYV6sat
	1jandh5Ue2KOYEqOtBHW4xEHC3sWAlB0XlLI+2evjkVREzELGslJEVXsyv/CnfngkB/JSLOfrAT
	iiOwRnjxWMETUa5CCXKooc414vgpNWN+4lIwnWKhmqk3H84OFWWUuRHQOIFhIAND0rmAPAHNxiG
	eErZbNAyCjVxEjXv4vnZQNWTaiRTW1v4tnlsUnk3Wa3IAM8UkDtQUChUVtzaUveEXrPw4aDXIQw
	i/JOZlWiTW5zLYllL6r9/GB2jbgkJDVlI8ldtYlRqPyQImZn4O28bDN6w=
X-Received: by 2002:a05:600c:6289:b0:488:f941:aab2 with SMTP id 5b1f17b1804b1-488fb78a561mr304825005e9.30.1776857823600;
        Wed, 22 Apr 2026 04:37:03 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0d51sm44976014f8f.10.2026.04.22.04.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:37:03 -0700 (PDT)
Message-ID: <5e15b5d8-8184-4496-8da0-793ccd592d10@ursulin.net>
Date: Wed, 22 Apr 2026 12:37:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma_fence_array: optimize handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260422103012.1647-1-christian.koenig@amd.com>
 <20260422103012.1647-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260422103012.1647-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59320-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Queue-Id: 618484457B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 22/04/2026 11:30, Christian König wrote:
> Removing the signal on any feature allows to simplfy the dma_fence_array
> code a lot and saves us from the need to install a callback on all fences
> at the same time.
> 
> This results in less memory and CPU overhead.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 130 +++++++++++++-----------------
>   include/linux/dma-fence-array.h   |  22 ++---
>   2 files changed, 59 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 5e10e8df372f..f1b4b3296c87 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -42,97 +42,80 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>   	cmpxchg(&array->base.error, PENDING_ERROR, 0);
>   }
>   
> -static void irq_dma_fence_array_work(struct irq_work *wrk)
> +static void dma_fence_array_cb_func(struct dma_fence *f,
> +				    struct dma_fence_cb *cb)
>   {
> -	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
> +	struct dma_fence_array *array =
> +		container_of(cb, struct dma_fence_array, callback);
>   
> -	dma_fence_array_clear_pending_error(array);
> +	irq_work_queue(&array->work);
> +}
> +
> +static void dma_fence_array_arm_cb(struct dma_fence_array *array)
> +{
> +	while (array->num_pending) {
> +		struct dma_fence *f = array->fences[array->num_pending - 1];
> +
> +		if (!dma_fence_add_callback(f, &array->callback,
> +					    dma_fence_array_cb_func))
> +			return;
> +
> +		dma_fence_array_set_pending_error(array, f->error);
> +		WRITE_ONCE(array->num_pending, array->num_pending - 1);

Do you think the WRITE_ONCEs are needed? As the loop will restart with 
un-annotated read anyway, but not just that, I don't think it can be 
compiled away in the kernel with this usage pattern. Maybe I am mistaken.

> +	}
>   
>   	dma_fence_signal(&array->base);
>   	dma_fence_put(&array->base);
>   }
>   
> -static void dma_fence_array_cb_func(struct dma_fence *f,
> -				    struct dma_fence_cb *cb)
> +static void dma_fence_array_irq_work(struct irq_work *wrk)
>   {
> -	struct dma_fence_array_cb *array_cb =
> -		container_of(cb, struct dma_fence_array_cb, cb);
> -	struct dma_fence_array *array = array_cb->array;
> -
> -	dma_fence_array_set_pending_error(array, f->error);
> +	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>   
> -	if (atomic_dec_and_test(&array->num_pending))
> -		irq_work_queue(&array->work);
> -	else
> -		dma_fence_put(&array->base);
> +	WRITE_ONCE(array->num_pending, array->num_pending - 1);
> +	dma_fence_array_arm_cb(array);

So for x86 going from one irqwork latency to num_fences latencies is 
probably passable but I am not sure how other architectures fare.

>   }
>   
>   static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> -	struct dma_fence_array_cb *cb = array->callbacks;
> -	unsigned i;
> -
> -	for (i = 0; i < array->num_fences; ++i) {
> -		cb[i].array = array;
> -		/*
> -		 * As we may report that the fence is signaled before all
> -		 * callbacks are complete, we need to take an additional
> -		 * reference count on the array so that we do not free it too
> -		 * early. The core fence handling will only hold the reference
> -		 * until we signal the array as complete (but that is now
> -		 * insufficient).
> -		 */
> -		dma_fence_get(&array->base);
> -		if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
> -					   dma_fence_array_cb_func)) {
> -			int error = array->fences[i]->error;
> -
> -			dma_fence_array_set_pending_error(array, error);
> -			dma_fence_put(&array->base);
> -			if (atomic_dec_and_test(&array->num_pending)) {
> -				dma_fence_array_clear_pending_error(array);
> -				return false;
> -			}
> -		}
> -	}
>   
> +	/*
> +	 * As we may report that the fence is signaled before all
> +	 * callbacks are complete, we need to take an additional
> +	 * reference count on the array so that we do not free it too
> +	 * early. The core fence handling will only hold the reference
> +	 * until we signal the array as complete (but that is now
> +	 * insufficient).
> +	 */
> +	dma_fence_get(&array->base);
> +	dma_fence_array_arm_cb(array);
>   	return true;

Are you sure it is safe to always return true?

Regards,

Tvrtko

>   }
>   
>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> -	int num_pending;
> +	int num_pending, error = 0;
>   	unsigned int i;
>   
>   	/*
> -	 * We need to read num_pending before checking the enable_signal bit
> -	 * to avoid racing with the enable_signaling() implementation, which
> -	 * might decrement the counter, and cause a partial check.
> -	 * atomic_read_acquire() pairs with atomic_dec_and_test() in
> -	 * dma_fence_array_enable_signaling()
> -	 *
> -	 * The !--num_pending check is here to account for the any_signaled case
> -	 * if we race with enable_signaling(), that means the !num_pending check
> -	 * in the is_signalling_enabled branch might be outdated (num_pending
> -	 * might have been decremented), but that's fine. The user will get the
> -	 * right value when testing again later.
> +	 * Reading num_pending without a memory barrier here is correct since
> +	 * that is only for optimization, it is perfectly acceptable to have a
> +	 * stale value for it. In all other cases num_pending is accessed by a
> +	 * single call chain.
>   	 */
> -	num_pending = atomic_read_acquire(&array->num_pending);
> -	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
> -		if (num_pending <= 0)
> -			goto signal;
> -		return false;
> -	}
> +	num_pending = READ_ONCE(array->num_pending);
> +	for (i = 0; i < num_pending; ++i) {
> +		struct dma_fence *f = array->fences[i];
>   
> -	for (i = 0; i < array->num_fences; ++i) {
> -		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
> -			goto signal;
> -	}
> -	return false;
> +		if (!dma_fence_is_signaled(f))
> +			return false;
>   
> -signal:
> +		if (!error)
> +			error = f->error;
> +	}
> +	dma_fence_array_set_pending_error(array, error);
>   	dma_fence_array_clear_pending_error(array);
>   	return true;
>   }
> @@ -171,15 +154,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
>   
>   /**
>    * dma_fence_array_alloc - Allocate a custom fence array
> - * @num_fences:		[in]	number of fences to add in the array
>    *
>    * Return dma fence array on success, NULL on failure
>    */
> -struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> +struct dma_fence_array *dma_fence_array_alloc(void)
>   {
> -	struct dma_fence_array *array;
> -
> -	return kzalloc_flex(*array, callbacks, num_fences);
> +	return kzalloc_obj(struct dma_fence_array);
>   }
>   EXPORT_SYMBOL(dma_fence_array_alloc);
>   
> @@ -203,10 +183,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
>   	WARN_ON(!num_fences || !fences);
>   
>   	array->num_fences = num_fences;
> +	array->num_pending = num_fences;
> +	array->fences = fences;
> +	array->base.error = PENDING_ERROR;
>   
>   	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
>   		       seqno);
> -	init_irq_work(&array->work, irq_dma_fence_array_work);
> +	init_irq_work(&array->work, dma_fence_array_irq_work);
>   
>   	/*
>   	 * dma_fence_array_enable_signaling() is invoked while holding
> @@ -220,11 +203,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
>   	 */
>   	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>   
> -	atomic_set(&array->num_pending, num_fences);
> -	array->fences = fences;
> -
> -	array->base.error = PENDING_ERROR;
> -
>   	/*
>   	 * dma_fence_array objects should never contain any other fence
>   	 * containers or otherwise we run into recursion and potential kernel
> @@ -265,7 +243,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   {
>   	struct dma_fence_array *array;
>   
> -	array = dma_fence_array_alloc(num_fences);
> +	array = dma_fence_array_alloc();
>   	if (!array)
>   		return NULL;
>   
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 1b1d87579c38..3ee55c0e2fa4 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -15,16 +15,6 @@
>   #include <linux/dma-fence.h>
>   #include <linux/irq_work.h>
>   
> -/**
> - * struct dma_fence_array_cb - callback helper for fence array
> - * @cb: fence callback structure for signaling
> - * @array: reference to the parent fence array object
> - */
> -struct dma_fence_array_cb {
> -	struct dma_fence_cb cb;
> -	struct dma_fence_array *array;
> -};
> -
>   /**
>    * struct dma_fence_array - fence to represent an array of fences
>    * @base: fence base class
> @@ -33,18 +23,17 @@ struct dma_fence_array_cb {
>    * @num_pending: fences in the array still pending
>    * @fences: array of the fences
>    * @work: internal irq_work function
> - * @callbacks: array of callback helpers
> + * @callback: callback structure for signaling
>    */
>   struct dma_fence_array {
>   	struct dma_fence base;
>   
> -	unsigned num_fences;
> -	atomic_t num_pending;
> +	unsigned int num_fences;
> +	unsigned int num_pending;
>   	struct dma_fence **fences;
>   
>   	struct irq_work work;
> -
> -	struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
> +	struct dma_fence_cb callback;
>   };
>   
>   /**
> @@ -78,11 +67,10 @@ to_dma_fence_array(struct dma_fence *fence)
>   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
>   	     ++(index), fence = dma_fence_array_next(head, index))
>   
> -struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> +struct dma_fence_array *dma_fence_array_alloc(void);
>   void dma_fence_array_init(struct dma_fence_array *array,
>   			  int num_fences, struct dma_fence **fences,
>   			  u64 context, unsigned seqno);
> -
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
>   					       u64 context, unsigned seqno);


