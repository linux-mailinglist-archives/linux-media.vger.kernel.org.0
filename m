Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A3B161B1E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 19:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgBQS6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 13:58:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34397 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgBQS6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 13:58:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id s144so531494wme.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Wy7cJfB126vsX+Nk1BTqpyPJrCVe2YC/mdhxvWH4lCM=;
        b=cz73CW4x6gGL71yz81M2hYgUL5GkQSkg915LG+bG8x8TXpI+pzKuigkvnVYCH+CMZ6
         xyBWlrPFj/DfG/rogM8H7pjwcEslWvwb4oCx6Hy5MUg8m6/q8W0aDgzq6+xq0O3vYCK/
         j4iIYzv10HXRBpy6tS7/+u4MUGcanHsQIl0yS1xMmrZJ+fUS+oQxEc+Zn7rcudvNNni4
         Rm0VC/YyvEagkAfrv42Q+pL2L2G5uxXXNGYZzWQTflveKJxGggEHsij5fn3XWHHEoPlT
         mpTIceZwx+i9NN7eK6SuS2tYNhPqz5jCpSAbZORREFCop2YdVIMtrE14+l1Np2g0aTX8
         andg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Wy7cJfB126vsX+Nk1BTqpyPJrCVe2YC/mdhxvWH4lCM=;
        b=S3aPtg2J2pyYKan+jRM414pukUP7LA6/Wic3BN46fL3aziKpApgJn2WdD5kBOFVTzQ
         7mYyzV4a9HYdZjkggoCt+pz/+CGbtDSR3XyA9kS6wjc5qTiAKvZJM+wHESC+Z375gB8z
         GZxdtBn0Wy3pmFUM3euq3QLaE37+Nyb+e8RyHgYWzUxvSzplzbaMrStOJk/PgzSmtLU5
         8/HGYZO0f/8nLjwv7F86miQJXpr3TsziifIZsFhPaTGQ6JXwACt9e6skwkkysyt+bPKp
         ztT3inKRBRatD5LLTa1mfjKRMjFtqm1TIGouhuToEBaiRU+yPKL69Gawiyw2T7crs0RL
         wLMg==
X-Gm-Message-State: APjAAAWPGdzNFThu7hBoGmfZ9Z92/+i7yPt5NKXBkpVVlqe1FExjYJD6
        ON/repnKVIxzuzUn0Zzypdk=
X-Google-Smtp-Source: APXvYqzPW+QcejV9ze3jjHud0phZ70xDJpz0pUr8PmObsZQMoQl9/Ln4fu0yfcPGwSlFqgVZGEXx2Q==
X-Received: by 2002:a1c:5441:: with SMTP id p1mr389661wmi.161.1581965925362;
        Mon, 17 Feb 2020 10:58:45 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id x10sm2171530wrp.58.2020.02.17.10.58.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 10:58:44 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <59995ab9-b74b-67c5-0090-f526788713b9@gmail.com>
Date:   Mon, 17 Feb 2020 19:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217175518.GL2363188@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.02.20 um 18:55 schrieb Daniel Vetter:
> On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian König wrote:
>> Implement the importer side of unpinned DMA-buf handling.
>>
>> v2: update page tables immediately
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 ++++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
>>   2 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 770baba621b3..48de7624d49c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>   	return ERR_PTR(ret);
>>   }
>>   
>> +/**
>> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
>> + *
>> + * @attach: the DMA-buf attachment
>> + *
>> + * Invalidate the DMA-buf attachment, making sure that the we re-create the
>> + * mapping before the next use.
>> + */
>> +static void
>> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>> +{
>> +	struct drm_gem_object *obj = attach->importer_priv;
>> +	struct ww_acquire_ctx *ticket = dma_resv_locking_ctx(obj->resv);
>> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> +	struct ttm_operation_ctx ctx = { false, false };
>> +	struct ttm_placement placement = {};
>> +	struct amdgpu_vm_bo_base *bo_base;
>> +	int r;
>> +
>> +	if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
>> +		return;
>> +
>> +	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
>> +	if (r) {
>> +		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
>> +		return;
>> +	}
>> +
>> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
>> +		struct amdgpu_vm *vm = bo_base->vm;
>> +		struct dma_resv *resv = vm->root.base.bo->tbo.base.resv;
>> +
>> +		if (ticket) {
> Yeah so this is kinda why I've been a total pain about the exact semantics
> of the move_notify hook. I think we should flat-out require that importers
> _always_ have a ticket attach when they call this, and that they can cope
> with additional locks being taken (i.e. full EDEADLCK) handling.

That is pretty much exactly my thinking as well.

And is also the sole reason why I started looking into the ww_mutex 
cursor handling a while back (e.g. the initial version with the horrible 
macro hack).

But this is really really hard to get right. So my thinking for now is 
to push this series upstream to at least unblock my ongoing P2P work.

> Simplest way to force that contract is to add a dummy 2nd ww_mutex lock to
> the dma_resv object, which we then can take #ifdef
> CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
>
> Now the real disaster is how we handle deadlocks. Two issues:
>
> - Ideally we'd keep any lock we've taken locked until the end, it helps
>    needless backoffs. I've played around a bit with that but not even poc
>    level, just an idea:
>
> https://cgit.freedesktop.org/~danvet/drm/commit/?id=b1799c5a0f02df9e1bb08d27be37331255ab7582
>
>    Idea is essentially to track a list of objects we had to lock as part of
>    the ttm_bo_validate of the main object.
>
> - Second one is if we get a EDEADLCK on one of these sublocks (like the
>    one here). We need to pass that up the entire callchain, including a
>    temporary reference (we have to drop locks to do the ww_mutex_lock_slow
>    call), and need a custom callback to drop that temporary reference
>    (since that's all driver specific, might even be internal ww_mutex and
>    not anything remotely looking like a normal dma_buf). This probably
>    needs the exec util helpers from ttm, but at the dma_resv level, so that
>    we can do something like this:
>
> struct dma_resv_ticket {
> 	struct ww_acquire_ctx base;
>
> 	/* can be set by anyone (including other drivers) that got hold of
> 	 * this ticket and had to acquire some new lock. This lock might
> 	 * protect anything, including driver-internal stuff, and isn't
> 	 * required to be a dma_buf or even just a dma_resv. */
> 	struct ww_mutex *contended_lock;
>
> 	/* callback which the driver (which might be a dma-buf exporter
> 	 * and not matching the driver that started this locking ticket)
> 	 * sets together with @contended_lock, for the main driver to drop
> 	 * when it calls dma_resv_unlock on the contended_lock. */
> 	void (drop_ref*)(struct ww_mutex *contended_lock);
> };

My initial thinking was to make all of this part of the core ww_mutex 
implementation, but then I quickly found that this won't work.

> This is all supremely nasty (also ttm_bo_validate would need to be
> improved to handle these sublocks and random new objects that could force
> a ww_mutex_lock_slow).

The next idea was to have it based on dma_resv objects, but as you also 
figured out you then need to drop the reference to the contended lock 
somehow...

So my current working plan was to use GEM object to avoid the callback...

> Plan B would be to throw our hands into and declare that "move_notify is
> best effort only and can fail for any reason". Exactly like ttm eviction
> currently does, even with all your hacks to do at least some dma_resv_lock
> (but not the full slowpath).

I would seriously NAK that. We have tried that with TTM and the whole 
idea is just braindead.

You can use trylock based eviction for things like best effort shrinker 
callbacks. But that's pretty much it.

> Given how much "fun" you have with all the low memory handling and ttm
> fundamentally being best-effort only (despite that dma_resv would allow us
> to do this right, with some work) I'm not sure that's a good idea to
> extend to a cross-driver interface. Personally I'd lean towards fixing
> this first fully (in ttm/amdgpu), and then using that to implement
> move_notify correctly.

Well have you seen this: https://fosdem.org/2020/schedule/event/ttm/ :)

> Or just add an int return value here and mandate that importers must
> handle eviction failures. Exactly like ttm_mem_evict_first can currently
> still fail for various reasons.
>
> (Sorry this isn't exactly the mail you hoped for)

Well it's actually the mail I expected. I'm thinking about exactly those 
problems for over a year now as well.

For the rather specific amdgpu case I could work around that by 
utilizing the HMM work to invalidate page tables on the fly, but that 
doesn't really help with memory management in general.

So YES, I totally agree that we need some sort of GEM execution context 
or something like this to lock buffers on the fly as we try to make room 
for others.

Regards,
Christian.

>
> Cheers, Daniel
>
>> +			/* When we get an error here it means that somebody
>> +			 * else is holding the VM lock and updating page tables
>> +			 * So we can just continue here.
>> +			 */
>> +			r = dma_resv_lock(resv, ticket);
>> +			if (r)
>> +				continue;
>> +
>> +		} else {
>> +			/* TODO: This is more problematic and we actually need
>> +			 * to allow page tables updates without holding the
>> +			 * lock.
>> +			 */
>> +			if (!dma_resv_trylock(resv))
>> +				continue;
>> +		}
>> +
>> +		r = amdgpu_vm_clear_freed(adev, vm, NULL);
>> +		if (!r)
>> +			r = amdgpu_vm_handle_moved(adev, vm);
>> +
>> +		if (r && r != -EBUSY)
>> +			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
>> +				  r);
>> +
>> +		dma_resv_unlock(resv);
>> +	}
>> +}
>> +
>>   static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
>> +	.move_notify = amdgpu_dma_buf_move_notify
>>   };
>>   
>>   /**
>> @@ -489,7 +553,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>>   		return obj;
>>   
>>   	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
>> -					&amdgpu_dma_buf_attach_ops, NULL);
>> +					&amdgpu_dma_buf_attach_ops, obj);
>>   	if (IS_ERR(attach)) {
>>   		drm_gem_object_put(obj);
>>   		return ERR_CAST(attach);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 8ae260822908..8c480c898b0d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -926,6 +926,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>>   		return 0;
>>   	}
>>   
>> +	if (bo->tbo.base.import_attach)
>> +		dma_buf_pin(bo->tbo.base.import_attach);
>> +
>>   	bo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>>   	/* force to pin into visible video ram */
>>   	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
>> @@ -1009,6 +1012,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
>>   
>>   	amdgpu_bo_subtract_pin_size(bo);
>>   
>> +	if (bo->tbo.base.import_attach)
>> +		dma_buf_unpin(bo->tbo.base.import_attach);
>> +
>>   	for (i = 0; i < bo->placement.num_placement; i++) {
>>   		bo->placements[i].lpfn = 0;
>>   		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
>> -- 
>> 2.17.1
>>

