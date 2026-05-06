Return-Path: <linux-media+bounces-60534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E9eChL2+mk1UwMAu9opvQ
	(envelope-from <linux-media+bounces-60534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:04:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B34D7975
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78631300FEC1
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1E83DEAC8;
	Wed,  6 May 2026 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="BaStjEbR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F492C027C
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054661; cv=none; b=AFvJcXUsmNh9bxv5u5jU7KU00wnms2lfzuZAS3c9rRhAszYb9rK4bPw/6K34tCaZdLtc42F1BZMyLEYIECqRxMoDLXovHGNnPxoKUq7Rnl2jEbDB2vxD9R3AKZxshEJMb7aHXCDlp+asXAk4oqgx/+xvknUOJc2rcgGUIllGAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054661; c=relaxed/simple;
	bh=xYge8ahKJlPO/1LHrX+hOkymiMs+juEK+zcACZkbLx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G2Mw8mzPiccacP1wrSEJQqr6aIOs8xGQ2S3saW7Vwn77Wmf6Jhf8sSaAd6dL8TRusAt83AupTpqoSBZhbtjg1+mtxYNlDJFR9VAllEv3PhLs4KZcL8uTU8Dd0OS4HTN0Qcleymgeo4dfsRe+eUxirRt3oVSGxrraHDzJvfeUdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=BaStjEbR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso33123185e9.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1778054658; x=1778659458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiS/ij6r165ba7gZt06iVY0/MOUwEsreAaIASyC63GA=;
        b=BaStjEbRQ2YzTleh6Dy2CINbEYW6v29q9A/V8PUZG3tlr/e2DqODhf0913r8gG/51i
         ZwJLS9yI0725MIbwyvUMuGy0jj4K3yPfIGnlwL4CX8zrEgxWk/2CijWBLOf9S84B9Ybm
         4ml6Xo78D2UZzsw/kKxoGITV5Lel4nts/xHtBEttIrQcQxt35YZ5YioqI8L1SvrR6CXh
         /IDcFAF2Ng0uMuAFGKwp58YqqhwJ3PERLw2Ud78qetN/2Xrif/+VVKGb0BdFEYRH8quK
         D0IAD2QVsy23qY03tHO/n2yx39XOZs87ONFm0TzbQvy2heHMkhf1c8dFMhOPNjFo3mHx
         zrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054658; x=1778659458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiS/ij6r165ba7gZt06iVY0/MOUwEsreAaIASyC63GA=;
        b=B9bjtiN+J3b+eUHRHp54AROvQ2RECzhR8z6SwbYjP46fWFzAd4gMk/Gho1PMhYbolJ
         Tk5ZAPJOGMvRenayNQ7Jsq9PLRFTgdqFfMOsA6kz/v3cO4al/hHheA5v9fpJMYq5sdl3
         OVmNLDsnuAzJEOMAZipqjehoe6aFA/KXzFRaInLoaZp/rY/jUg3W34H+ikwGjE/ow4EN
         s0Y8NPNi/LVT6kEFoYui1mjpzfwXDm60Chr+64o4reu+T1nFwVIBIOzxfRoNVanKoR1D
         vsO/pdqXQr51/jpcOr68/FdGUI1wfTbN+8U+K/ZuRoPKc2FVIIS3Cd5NoeAwIGnlXLu6
         JEjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I/dDWMl0YydMd6ARr6G6tzQE460gMDudeoMpRgbjpI6VLGZIas4xPSFDIbsF1Ed5Q7dwTBJmFton4NA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8B9Ijrdxfv6PAi8XoEb5xtPg0qwpQ3HLaH5dkfUJtQyAM4prZ
	6dGh73gNjqGhTKjqk0VimMYTghFfTuqFT2vkVZ2o9tlDfEyoHoRrzFRoGms0284c/yA=
X-Gm-Gg: AeBDiesIqplEWkETh10831uqCFN5qFCbI6EHqty4EivlBbnXNsMO+Vknl9Srz84YhuO
	39b71xW85gFFyWGDB3ABYhZIpGGo2JaXR/zY73+iRf7Ew+NbtvwpCWAB/KbVe1ijTWotFGjx3ys
	7NHiszQqvGdLeMQLYNwlE5mu/SPwoI1uYSSSCvB+CkmCKb5o/IXdP1O+SzEn6x8xSzhfLSpEeC+
	jXDnPBi20CIeijqlYYgt9jrnHq4vOTpj5v63ba25nCyNiZDeY1TYW8IrtrHjnlFYz6c2azeUZ4T
	w4uGTbEIpQNVU2A6AHQ6oNjZi8Ea7VrrETJQDh37aOD9Qb+hDS4wNkf/M0yOT3Y+0YA8NU4tJDW
	/p11oM7y//x1w769KkOWEN9CMsuO0oGsoPZIdp+D58lQDK7xT6wiJOTWaG44OckcXMjKv9gHXfY
	oXBmUZCqyVeRA2w+qHNY/qpGxQk3CZ4bVb2aUQX+PFh7BqZ0kCTDdEFdOY4ODssuGQng==
X-Received: by 2002:a05:600c:a08b:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48e51f4119bmr39672925e9.21.1778054657634;
        Wed, 06 May 2026 01:04:17 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm19380375e9.1.2026.05.06.01.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:04:17 -0700 (PDT)
Message-ID: <21121a6f-4431-497a-a8ff-61219cb00ad6@ursulin.net>
Date: Wed, 6 May 2026 09:04:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence_array: optimize handling v2
To: christian.koenig@amd.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260505110828.1574-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260505110828.1574-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 609B34D7975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[ursulin.net:query timed out,amd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60534-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[amd.com:query timed out,ursulin.net:query timed out];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	RBL_SEM_FAIL(0.00)[172.234.253.10:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ursulin.net:dkim,ursulin.net:mid,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On 05/05/2026 12:08, Christian König wrote:
> Removing the signal on any feature allows to simplfy the dma_fence_array
> code a lot and saves us from the need to install a callback on all fences
> at the same time.
> 
> This results is less memory and CPU overhead.

Code looks good but I still worry about the new potential for num_fences 
irq work latencies whereas the existing implementation only has one.

Also, whether or not current or this implementation uses less or more 
CPU overhead depends on the signalling pattern (time distribution) of 
the fences in the array.

Apart from more latency it could even be more CPU usage in the 
pathological case.

It would be less if, when the last fence in the array signals, all 
others have already signaled. Although it would still need to go through 
all dma_fence_add_callback() calls so that part is the same as the 
current implementation. Only the CPU cycles from the signaling side 
would be saved.

But in the pathological case, where fences signal one by one from the 
first to last, and are spaced more in time than a single irq work 
latency, the new implementation needs more CPU time and more latency.

I do agree it would be nice to be able to drop the callbacks array but 
for the above reasons I am worried whether it is safe.

Some other minor comments below.

> v2: fix potential double locking pointed out by Tvrtko
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 134 +++++++++++++-----------------
>   drivers/gpu/drm/xe/xe_vm.c        |   2 +-
>   include/linux/dma-fence-array.h   |  22 ++---
>   3 files changed, 66 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 5e10e8df372f..8b94c6287482 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -42,97 +42,88 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>   	cmpxchg(&array->base.error, PENDING_ERROR, 0);
>   }
>   
> -static void irq_dma_fence_array_work(struct irq_work *wrk)
> +static void dma_fence_array_cb_func(struct dma_fence *f,
> +				    struct dma_fence_cb *cb)
>   {
> -	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
> -
> -	dma_fence_array_clear_pending_error(array);
> +	struct dma_fence_array *array =
> +		container_of(cb, struct dma_fence_array, callback);
>   
> -	dma_fence_signal(&array->base);
> -	dma_fence_put(&array->base);
> +	irq_work_queue(&array->work);
>   }
>   
> -static void dma_fence_array_cb_func(struct dma_fence *f,
> -				    struct dma_fence_cb *cb)
> +static bool dma_fence_array_try_add_cb(struct dma_fence_array *array)
>   {
> -	struct dma_fence_array_cb *array_cb =
> -		container_of(cb, struct dma_fence_array_cb, cb);
> -	struct dma_fence_array *array = array_cb->array;
> +	while (array->num_pending) {
> +		struct dma_fence *f = array->fences[array->num_pending - 1];

Maybe add above this line something like:

/*
  * Install callbacks from the reverse so the check in
  * dma_fence_array_signaled() can be optimized.
  */

>   
> -	dma_fence_array_set_pending_error(array, f->error);
> +		if (!dma_fence_add_callback(f, &array->callback,
> +					    dma_fence_array_cb_func))
> +			return true;
>   
> -	if (atomic_dec_and_test(&array->num_pending))
> -		irq_work_queue(&array->work);
> -	else
> +		dma_fence_array_set_pending_error(array, f->error);
> +		--array->num_pending;
> +	}
> +	return false;
> +}
> +
> +static void dma_fence_array_irq_work(struct irq_work *wrk)
> +{
> +	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
> +
> +	--array->num_pending;
> +	if (!dma_fence_array_try_add_cb(array)) {
> +		dma_fence_signal(&array->base);
>   		dma_fence_put(&array->base);
> +	}
>   }
>   
>   static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> -	struct dma_fence_array_cb *cb = array->callbacks;
> -	unsigned i;
>   
> -	for (i = 0; i < array->num_fences; ++i) {
> -		cb[i].array = array;
> +	/*
> +	 * As we may report that the fence is signaled before all
> +	 * callbacks are complete, we need to take an additional
> +	 * reference count on the array so that we do not free it too
> +	 * early. The core fence handling will only hold the reference
> +	 * until we signal the array as complete (but that is now
> +	 * insufficient).
> +	 */
> +	dma_fence_get(&array->base);
> +	if (!dma_fence_array_try_add_cb(array)) {
>   		/*
> -		 * As we may report that the fence is signaled before all
> -		 * callbacks are complete, we need to take an additional
> -		 * reference count on the array so that we do not free it too
> -		 * early. The core fence handling will only hold the reference
> -		 * until we signal the array as complete (but that is now
> -		 * insufficient).
> +		 * When all fences are already signaled we can drop the reference again
> +		 * and report to the caller that the array can be signaled as well.

Optional nit - above two lines end up only lines over 80 in the file.

Regards,

Tvrtko

>   		 */
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
> +		dma_fence_put(&array->base);
> +		return false;
>   	}
> -
>   	return true;
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
> @@ -171,15 +162,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
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
> @@ -203,10 +191,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
> @@ -220,11 +211,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
> @@ -265,7 +251,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   {
>   	struct dma_fence_array *array;
>   
> -	array = dma_fence_array_alloc(num_fences);
> +	array = dma_fence_array_alloc();
>   	if (!array)
>   		return NULL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 62a87a051be7..8f472911469d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3370,7 +3370,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>   		goto err_trace;
>   	}
>   
> -	cf = dma_fence_array_alloc(n_fence);
> +	cf = dma_fence_array_alloc();
>   	if (!cf) {
>   		fence = ERR_PTR(-ENOMEM);
>   		goto err_out;
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


