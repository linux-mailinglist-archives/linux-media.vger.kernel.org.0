Return-Path: <linux-media+bounces-59308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IMwB9Go6GnEOQIAu9opvQ
	(envelope-from <linux-media+bounces-59308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:54:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6E445007
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CC4A305763E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F043CD8C3;
	Wed, 22 Apr 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="deNoVJft"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696363C13E2
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855001; cv=none; b=DvYlVeT2ePlgjP6lLZ9dyehr/bIRfNMLlBFljXqccIdKtLri5CxwKMARfcwJ+I2f8q3mQYus48zV1fX7tE3nQ9FGgaLlPzM1G+OTcgv1Z/yuuiV+gWJefwRu9wj2Z7JgaUuWRXLschhWdzHm+OimgWlnJEVlLol4FJzNAeKoiG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855001; c=relaxed/simple;
	bh=MMjj0+3/xhk2CmGAjD0o/boA6Gms+ECiDSeB1YcqAAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGRweAWaFFn3rSDRwsxbNGBhjClf6yir60yqIiEVrB4X/wrlZ457nnuPp9SLDV3FZElrRJTqCNcdZ3z0/BMkw0vUv3vQzflu2aztO+ZPf7YIJjx02lJMSPDe+wBf30I9R2QLWzYES/YDXAs8LR7hC05Wl7cblN3s928F48UOmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=deNoVJft; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba67b332bbaso531352666b.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 03:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1776854998; x=1777459798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8jo+eXQKHxt4pR8E+RE1xea7eDUNRLe+aHpb5aFbRA=;
        b=deNoVJftTw843udkXijj9hqK/N4HJQhpWAla+Ua70ZAuVnTrg5qiEa4uR24OzLun6/
         PbiGxho+s0giL506WHDM0Q5RavgTYTiWDFyYXvwQ6SFfgAl9G5/IRFrTYtWXQcEW7kGo
         AWBE0QqhaCYrDALliMxOAm4Pd7SI4UsCq2InxK3XDnwbHO2X8DzC6xl+na6ZG+967eYd
         vLBVeJ7VyxFR0OSfZcxyduW1pfYMGdFMUHMGD590oKEOuWtXb4S8rpRGRV+SuH7knJJC
         1FkTCv/AzO4QDWpxBomw2AGIRSO0LoRx6etbsb5f1w0kSdGHOrtn52xjAX6iH5Y6iGYz
         vP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854998; x=1777459798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8jo+eXQKHxt4pR8E+RE1xea7eDUNRLe+aHpb5aFbRA=;
        b=ghs2XGOtA0W3pPKNAyUslmwnShQEH9zZYTiMRcFqjPfVHbZwfwD8NdTi4/itYbJeFA
         8E6b609S6TNdHqlDZnTgg/7vAg/i12vDQhz0fSzdOxdli4oioUbNN8CIyIMZ+7Tv9XmF
         dVXqPUD6cfKg4+KLRGSX90qEEULmo0a/5jY/nPXrG80RhNiGL83Wry0TeE/a/ZcSLPvf
         6ots6GMMdcCPXWDK5f7OltX7GfEWD6wHxgIQNHZoPsknDBOmebTy7tQLzYT0StIKfcHm
         sTW10skhUxVmdiAJJFe1KbyuLKGUZUwRaelmTbM0FqFUPiGylSY/qm3YGHw0LSs1hx40
         zqxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CA2GOgeg95vDWgwT3jEtWoL7N3mnFiQ9m/UoolYuNjA0r35TTxNjAJnP3VVqpdnofcJPFFdHYeAU62w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV0cymF9KIB34b0URXKP4o0XAZuH1Tgkh+xe++7LNR9uqzZkb3
	O5MX3wdUC2S7oTAsSFeFI+xB+lrdmnA3CZccqL1nypQ1+ZQHj1RXuUBK43lcSD37qbY=
X-Gm-Gg: AeBDieu3Mt4HvLQEIZ/vj8IgYYkwloHZN557fRxEqC9+I2Z0biR2SPh9VpHcNp19i1y
	aIzu1lFvpQjf7uZQYeJgDb7zhOo7CKmOvX4LIYskLn91pDYQWdFq36umDldxqzaqlif7v1EyJaE
	GvVOVb1bX5jx3TZhqIT3cu7PE5Z1FgU+NbYRe4JKuHorUXjApoaY1RyO4bpG67Vo/PGovTb8B4t
	xeMmIf/inf6c0h9E06vTdG1A1TN8q73DSTuHDcgrWp/EOgaQMgnFazUEMhQr2sV6U8gKq7SmlZh
	6slkgFmFWATvtlX6QmWcbfFPu1IznbuM8OziM971kHFaT67I1ghh/egCDp+8yQgkoB76DO53uSZ
	yCuDI3nOt9UZ7S0ZQIi1H9kZmBnrUHdDWaHNDSnIRxBVWh2BOGlp7BfhGFr1RnLO76+qTc+gGz+
	Ca9Z+eF5JE/l2g+8aYg1jkaNzZfPX2jbllJyTOC1vXLh9O3XuAaV2TxfOkjLQF2838Ig==
X-Received: by 2002:a17:907:934c:b0:ba5:4f56:69a2 with SMTP id a640c23a62f3a-ba54f566b33mr858200866b.13.1776854997330;
        Wed, 22 Apr 2026 03:49:57 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b694sm532372966b.29.2026.04.22.03.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:49:56 -0700 (PDT)
Message-ID: <096a34ce-fb73-4d56-81b4-aa6a0342c322@ursulin.net>
Date: Wed, 22 Apr 2026 11:49:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf/dma_fence_array: remove unused functionality
 v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260422103012.1647-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260422103012.1647-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CC6E445007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 22/04/2026 11:30, Christian König wrote:
> Amdgpu was the only user of the signal on any feature and we dropped
> that use case recently, so we can remove that functionality.
> 
> v2: update num_pending only after the fence is signaled
> v3: separate out simplifying dma_fence_array implementation
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-array.c              | 13 ++++---------
>   drivers/dma-buf/dma-fence-unwrap.c             |  3 +--
>   drivers/dma-buf/dma-resv.c                     |  3 +--
>   drivers/dma-buf/st-dma-fence-unwrap.c          |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  3 +--
>   drivers/gpu/drm/xe/xe_sync.c                   |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c                     |  4 ++--
>   include/linux/dma-fence-array.h                |  6 ++----
>   8 files changed, 13 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 089f69469524..5e10e8df372f 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -190,15 +190,13 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
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
> @@ -222,7 +220,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
>   	 */
>   	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>   
> -	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> +	atomic_set(&array->num_pending, num_fences);
>   	array->fences = fences;
>   
>   	array->base.error = PENDING_ERROR;
> @@ -249,7 +247,6 @@ EXPORT_SYMBOL(dma_fence_array_init);
>    * @fences:		[in]	array containing the fences
>    * @context:		[in]	fence context to use
>    * @seqno:		[in]	sequence number to use
> - * @signal_on_any:	[in]	signal on any fence in the array
>    *
>    * Allocate a dma_fence_array object and initialize the base fence with
>    * dma_fence_init().
> @@ -264,8 +261,7 @@ EXPORT_SYMBOL(dma_fence_array_init);
>    */
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any)
> +					       u64 context, unsigned seqno)
>   {
>   	struct dma_fence_array *array;
>   
> @@ -273,8 +269,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   	if (!array)
>   		return NULL;
>   
> -	dma_fence_array_init(array, num_fences, fences,
> -			     context, seqno, signal_on_any);
> +	dma_fence_array_init(array, num_fences, fences, context, seqno);
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
> index 51c87869b7b8..4e7ee25372ba 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -64,7 +64,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   
>   	array = dma_fence_array_create(num_fences, fences,
>   				       dma_fence_context_alloc(1),
> -				       1, false);
> +				       1);
>   	if (!array)
>   		goto error_free;
>   	return &array->base;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 942f4eed817f..4a1a9031f9db 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3205,8 +3205,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
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
> index 56e2db50bb36..8f472911469d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3370,7 +3370,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>   		goto err_trace;
>   	}
>   
> -	cf = dma_fence_array_alloc(n_fence);
> +	cf = dma_fence_array_alloc();

Patch splitting mistake here.

The rest LGTM. So with this hunk dropped:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   	if (!cf) {
>   		fence = ERR_PTR(-ENOMEM);
>   		goto err_out;
> @@ -3414,7 +3414,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>   
>   	xe_assert(vm->xe, current_fence == n_fence);
>   	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
> -			     1, false);
> +			     1);
>   	fence = &cf->base;
>   
>   	for_each_tile(tile, vm->xe, id) {
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 370b3d2bba37..1b1d87579c38 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -81,13 +81,11 @@ to_dma_fence_array(struct dma_fence *fence)
>   struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>   void dma_fence_array_init(struct dma_fence_array *array,
>   			  int num_fences, struct dma_fence **fences,
> -			  u64 context, unsigned seqno,
> -			  bool signal_on_any);
> +			  u64 context, unsigned seqno);
>   
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any);
> +					       u64 context, unsigned seqno);
>   
>   bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>   


