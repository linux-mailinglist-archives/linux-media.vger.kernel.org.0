Return-Path: <linux-media+bounces-56190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGfJN2t2ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:54:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A622B97F5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3707330A6A14
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9904F3B8D5B;
	Wed, 18 Mar 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="cFJSDsFg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE03B776A
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827480; cv=none; b=KxE5pOJc+0AkQmp1Ol6GXsjZ2NI/nwsMR92c96dJofJOrtq2YNIvyFtnXjE6qrH8idLXZeiDWxR89WPYWsbt+rk30dtgt0PLwBwqgR3uuPSMBTaNGtqk1eyQrq2knUR0Pd/v5DeZ2st1XQG1UhLZeYOFVqC1rc98tmznofoU3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827480; c=relaxed/simple;
	bh=rxMctS45SVCICg3xQBp8FvzcpfKaPb4mgZUX7Ncm9dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0qRXDKOpxQlWIRvnNWpulg92hdopJFnNjcUtWbBQlp6EBQFYG7CbDOccWj/nM55HF2/U5i8G2v1r7txpEn8w6dSCa7IFFbVtiN18jMzWUBPw6xSTFn9ZSt8MnZP0dG90ubEUA+afjgIVcAQlAPEnIzCjfs5xvMR1bZJGRVAFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=cFJSDsFg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so657299f8f.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1773827469; x=1774432269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jL6aAKgrmXJl6MwIajrkxohHlzcXFZYJRfVMzGUDu4s=;
        b=cFJSDsFgsjgcsQu4sumWXM1PJ3ziBWHHsA6/F7YoSEIgJ6DgW1AdRVlACwndsNJv4o
         2yOAQxtH7gHr2jVK/5qe79fEYO4umTk9AWGGTdXvTeRTU5FHPIN3T4l4AZnJQMjo0Bf1
         mxiXAvXYeUuBE/DTAnlo+yjmAct6mltpQJYgHE6SYNcgxNHUA7oPXoRos5TpcxRL6onj
         e076bq8zy7ppbuM7DaEZ1uf+p+rS/Cni1AQk1EReJEreyxNEkRTOZP1ZlIxJ+DtaT30c
         vuC1Wq1KI2F4otR0nvngOf0+dBdD30DSzzgiq516jRmkTM+jOviWkDKr/a8FzmdVRBSS
         gIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827469; x=1774432269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jL6aAKgrmXJl6MwIajrkxohHlzcXFZYJRfVMzGUDu4s=;
        b=kmppndRCm85I1m3cHN9cdc942Aa82FDIc9lQA3U2qFJQ6dRAThZNZGnK0YtNa3bzLj
         EauTdXQlSCCQYUxGIjmCbAwip16cqiK7gTYKigeBxO8pE77djO/oe5GvmmdHPRYb/Ya5
         XuYvGcuw6M51rPnPrb37EA7R4JZZtFrNTP4Oqe4XZFHGuCiyPOkH04ysQQN4NVRhIDdh
         FWJgdky1L7iJNVMZYL132FJEDpshqqpAYSdI3W8ghGMRqH2bHxi/ksoT8tAbxedE/GFM
         H2qSgmM+1VwDO9CksLBdzL6va3Xhj5HvZ1pboNLM2nA3eCSvdT3xFdKttpu2qFSFySg/
         qdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsUkp5B2a4XJB/iulOnhDwQCxOlpZyvLEKAoVci0sL5OZH7r4HOTvPac4B3cqjrtmniC1ZfPclh40FFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSQCLDrr1GaBWUTeqODwAzcW/7XvxntICggIThJsgSzGaRjOp
	bHz0ZYAx1b0gBRdubVFWYzCdWygv0fP88ee2qqTBa3FqLLYr1jrc142RNNUAUkI6zkCXfYVmAiE
	QIT3v8T4=
X-Gm-Gg: ATEYQzyclhZo23scuk+0ZAK+cmzhWhgCwClJPEAsRcpLX5v63DG1dHTwtibmZyojFMI
	nWqd4YRzIsqCWZs69bCq/mR4vKtX1rDtNw02HTE9xi23xwcV5AMZ1KZx5o4KL6B8JgwEXqAyh1X
	SMRgBOgebIJPJi6AyriPmx0f5mYomfSnRhogYNdTTJOQXQGXdJnfGkl6WK1Km+xmGpDLcskmNYk
	br6gXtH7M6XxGovgjq2chRFHH3wkLcvTBpjk+eAaTwZnTuvfohK8G5AAAPaMU9P+iru1ZhT7YF4
	zUYbugKaXel1pTtuQvLm57Y12f/sI/QwHEEkNucQ9KadlvWBdIEzIzya3RLuIn6asO0wbxhPN+z
	rIHw9kF16aDAjICnmJtE3sns3DLjlENJVN9HHxYFkKg+Fi1sxUvN13L0UxwhGqvJ3yyqU40ZAaC
	VRAz3BVUoH2sBsL+412KkZ1JeR7dRRD89zbtl/takHw44u
X-Received: by 2002:a05:6000:144d:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43b4981a37emr12582183f8f.9.1773827468755;
        Wed, 18 Mar 2026 02:51:08 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189971asm6477106f8f.30.2026.03.18.02.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:51:08 -0700 (PDT)
Message-ID: <dd55b402-5322-4590-becf-caa3b4242ec2@ursulin.net>
Date: Wed, 18 Mar 2026 09:51:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence_array: remove unused functionality
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260317145039.2418-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260317145039.2418-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56190-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76A622B97F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 17/03/2026 14:50, Christian König wrote:
> Amdgpu was the only user of the signal on any feature and we dropped
> that use case recently, so we can remove that functionality again.
> 
> This allows to simplfy the dma_fence_array code a lot and saves us from

simplify

> the need to install a callback on all fences at the same time.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-array.c             | 133 +++++++-----------
>   drivers/dma-buf/dma-fence-unwrap.c            |   3 +-
>   drivers/dma-buf/dma-resv.c                    |   3 +-
>   drivers/dma-buf/st-dma-fence-unwrap.c         |   2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   3 +-
>   drivers/gpu/drm/xe/xe_sync.c                  |   2 +-
>   drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
>   include/linux/dma-fence-array.h               |  28 +---
>   8 files changed, 63 insertions(+), 115 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 089f69469524..0d54bf2e47ba 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -42,97 +42,71 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
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
> -
> -	dma_fence_signal(&array->base);
> -	dma_fence_put(&array->base);
> +	irq_work_queue(&array->work);
>   }
>   
> -static void dma_fence_array_cb_func(struct dma_fence *f,
> -				    struct dma_fence_cb *cb)
> +static void irq_dma_fence_array_work(struct irq_work *wrk)
>   {
> -	struct dma_fence_array_cb *array_cb =
> -		container_of(cb, struct dma_fence_array_cb, cb);
> -	struct dma_fence_array *array = array_cb->array;
> +	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>   
> -	dma_fence_array_set_pending_error(array, f->error);
> +	while (array->num_pending--) {
> +		struct dma_fence *f = array->fences[array->num_pending];
>   
> -	if (atomic_dec_and_test(&array->num_pending))
> -		irq_work_queue(&array->work);
> -	else
> -		dma_fence_put(&array->base);
> +		if (!dma_fence_add_callback(f, &array->callback,
> +					    dma_fence_array_cb_func))
> +			return;
> +
> +		dma_fence_array_set_pending_error(array, f->error);
> +	}
> +
> +	dma_fence_signal(&array->base);
> +	dma_fence_put(&array->base);
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
> +	irq_dma_fence_array_work(&array->work);
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
> +	 * Reading num_pending is just an optimization, it is perfectly
> +	 * acceptable to have a stale value for it.

Bear with me please. I decided to look at this in the morning and maybe 
it is too early after all. At first I thought "is this true". Because 
for example:

num_fences = 2
num_pending = 1

fences = [ signaled, unsignaled ]

Below loop exits and function returns array signaled status.

Then I realised array->num_pending is not the number of unsignaled 
fences. Instead it seems to be number of fences on which callbacks have 
not been installed, regardless of the signaled status. Or from a 
different angle, the next fence index to install the callback on after 
the current one signals.

But still the false positive seems possible. After installing the 
callback on the 2nd fence num_pending will be 1, so the signaled check 
at a point where the first fence has been signaled, but the second one 
still has not will return true. Dma_fence_array_signaled() cannot know 
since it doesn't look at the second fence.

Regards,

Tvrtko

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
> @@ -171,15 +145,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
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
> @@ -190,21 +161,22 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
>    * @fences:		[in]	array containing the fences
>    * @context:		[in]	fence context to use
>    * @seqno:		[in]	sequence number to use
> - * @signal_on_any:	[in]	signal on any fence in the array
>    *
>    * Implementation of @dma_fence_array_create without allocation. Useful to init
>    * a preallocated dma fence array in the path of reclaim or dma fence signaling.
>    */
>   void dma_fence_array_init(struct dma_fence_array *array,
>   			  int num_fences, struct dma_fence **fences,
> -			  u64 context, unsigned seqno,
> -			  bool signal_on_any)
> +			  u64 context, unsigned seqno)
>   {
>   	static struct lock_class_key dma_fence_array_lock_key;
>   
>   	WARN_ON(!num_fences || !fences);
>   
>   	array->num_fences = num_fences;
> +	array->num_pending = num_fences;
> +	array->fences = fences;
> +	array->base.error = PENDING_ERROR;
>   
>   	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
>   		       seqno);
> @@ -222,11 +194,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
>   	 */
>   	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>   
> -	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> -	array->fences = fences;
> -
> -	array->base.error = PENDING_ERROR;
> -
>   	/*
>   	 * dma_fence_array objects should never contain any other fence
>   	 * containers or otherwise we run into recursion and potential kernel
> @@ -249,7 +216,6 @@ EXPORT_SYMBOL(dma_fence_array_init);
>    * @fences:		[in]	array containing the fences
>    * @context:		[in]	fence context to use
>    * @seqno:		[in]	sequence number to use
> - * @signal_on_any:	[in]	signal on any fence in the array
>    *
>    * Allocate a dma_fence_array object and initialize the base fence with
>    * dma_fence_init().
> @@ -264,17 +230,16 @@ EXPORT_SYMBOL(dma_fence_array_init);
>    */
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any)
> +					       u64 context, unsigned seqno)
>   {
>   	struct dma_fence_array *array;
>   
> -	array = dma_fence_array_alloc(num_fences);
> +	array = dma_fence_array_alloc();
>   	if (!array)
>   		return NULL;
>   
>   	dma_fence_array_init(array, num_fences, fences,
> -			     context, seqno, signal_on_any);
> +			     context, seqno);
>   
>   	return array;
>   }
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 07fe9bf45aea..53bb40e70b27 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -180,8 +180,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   
>   	if (count > 1) {
>   		result = dma_fence_array_create(count, array,
> -						dma_fence_context_alloc(1),
> -						1, false);
> +						dma_fence_context_alloc(1), 1);
>   		if (!result) {
>   			for (i = 0; i < count; i++)
>   				dma_fence_put(array[i]);
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index ce9e6c04897f..39a92d9f2413 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -648,8 +648,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>   	}
>   
>   	array = dma_fence_array_create(count, fences,
> -				       dma_fence_context_alloc(1),
> -				       1, false);
> +				       dma_fence_context_alloc(1), 1);
>   	if (!array) {
>   		while (count--)
>   			dma_fence_put(fences[count]);
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 9c74195f47fd..45413666970e 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -65,7 +65,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   
>   	array = dma_fence_array_create(num_fences, fences,
>   				       dma_fence_context_alloc(1),
> -				       1, false);
> +				       1);
>   	if (!array)
>   		goto error_free;
>   	return &array->base;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index e7918f896a26..1ac91a46d87f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3203,8 +3203,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>   	fence_array = dma_fence_array_create(eb->num_batches,
>   					     fences,
>   					     eb->context->parallel.fence_context,
> -					     eb->context->parallel.seqno++,
> -					     false);
> +					     eb->context->parallel.seqno++);
>   	if (!fence_array) {
>   		kfree(fences);
>   		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 24d6d9af20d6..37866768d64c 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -376,7 +376,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>   		xe_assert(vm->xe, current_fence == num_fence);
>   		cf = dma_fence_array_create(num_fence, fences,
>   					    dma_fence_context_alloc(1),
> -					    1, false);
> +					    1);
>   		if (!cf)
>   			goto err_out;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 548b0769b3ef..b916a9d90104 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3196,7 +3196,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>   		goto err_trace;
>   	}
>   
> -	cf = dma_fence_array_alloc(n_fence);
> +	cf = dma_fence_array_alloc();
>   	if (!cf) {
>   		fence = ERR_PTR(-ENOMEM);
>   		goto err_out;
> @@ -3240,7 +3240,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>   
>   	xe_assert(vm->xe, current_fence == n_fence);
>   	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
> -			     1, false);
> +			     1);
>   	fence = &cf->base;
>   
>   	for_each_tile(tile, vm->xe, id) {
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 370b3d2bba37..3ee55c0e2fa4 100644
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
> @@ -78,16 +67,13 @@ to_dma_fence_array(struct dma_fence *fence)
>   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
>   	     ++(index), fence = dma_fence_array_next(head, index))
>   
> -struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> +struct dma_fence_array *dma_fence_array_alloc(void);
>   void dma_fence_array_init(struct dma_fence_array *array,
>   			  int num_fences, struct dma_fence **fences,
> -			  u64 context, unsigned seqno,
> -			  bool signal_on_any);
> -
> +			  u64 context, unsigned seqno);
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any);
> +					       u64 context, unsigned seqno);
>   
>   bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>   


