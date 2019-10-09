Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C516CD0FE5
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbfJINVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:21:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44815 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731138AbfJINVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 09:21:11 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so2945250wrl.11
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qg/UX1jjT+YlZVE/8U+OdbOM/WJbi/DZD/r8B9fNfBE=;
        b=QGVRbNdW3PRv25WyLgBhRVw/cMS0fLwqfFpGJhM9IotV+pW0Rsj9cLvif5gxiI3a56
         oC4RmESEthXAs5r3RBjkK4fhz7k/waWvUnLjPSiF4XRRdiObzrPs2zW8G9/r0FbTUNd2
         dfNxFUakDnSCC0itPTtBWHE3ZEB1LKzmsCaBolKf9fRq0jdmSgS2etyhUcxitLj1Ty93
         9ouEsyDOgL6v9DxuSzIvUEitTf3XteEyblpcf6kjUd/XAcxpN58Z90/coo6hK67FbaDI
         6bypAhrRKtcpYDko5aBPvlUFll2+uK6jjhJiBJkBQcXtVr7v8PFr2UVwSzuaVz9dZCpF
         O4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=qg/UX1jjT+YlZVE/8U+OdbOM/WJbi/DZD/r8B9fNfBE=;
        b=Tc/G93JuJwzG07mcVfnLPn1+VVL+L3xdmrajZ6Qg33P0Z0hzND56oDYhABIvskchyO
         eI7KAbI/GXFD90p77JhoaOsszOlq/tM1TJ8pgwKWFjF88dBmvDd+2mnGK00oSunhUEJD
         JlnN9c79oPMopTTPpV9DoC5u9h7rLLzqNyaVV1anl+XKOFNRNxsny8mmVTvoFJk4LVpJ
         3xN+EwbXeLeadXEJcYvC7XwxjBDaH4FV/16CpIKE0he6BzmjKXGnGJz76503BLw9dbRb
         ioxzMKdxlHTXLwEVO/nVZkV1CbT17hBa7Zji03zadZ8eKi69EciSb/+bgZLqmhV/jKI4
         +j1w==
X-Gm-Message-State: APjAAAVYCLUUbWVlJWOXEZhQ9WL9/8vdeG12SSpXmrAjk6ArtWP7Px4P
        lQtKEC4KGnO7E61hPh46YAFRguCH
X-Google-Smtp-Source: APXvYqyaQaZzFSpYNsVSm7ZyUot33pl9Tlc3Zgxkl+seNj5nygYL5JOaeox6pSo2e1EmUSyHJosTNw==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr2702266wrw.58.1570627268438;
        Wed, 09 Oct 2019 06:21:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id t6sm3741414wmf.8.2019.10.09.06.21.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:21:07 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/3] dma-buf: add dma_resv_ctx for deadlock handling
To:     Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, sumit.semwal@linaro.org
References: <20190918175525.49441-1-christian.koenig@amd.com>
 <20191008151639.GP16989@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <44f5b8d8-f29b-5b33-b12d-610aba515272@gmail.com>
Date:   Wed, 9 Oct 2019 15:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008151639.GP16989@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.10.19 um 17:16 schrieb Daniel Vetter:
> On Wed, Sep 18, 2019 at 07:55:23PM +0200, Christian König wrote:
>> The ww_mutex framework allows for detecting deadlocks when multiple
>> threads try to acquire the same set of locks in different order.
>>
>> The problem is that handling those deadlocks was the burden of the user of
>> the ww_mutex implementation and at least some users didn't got that right
>> on the first try.
>>
>> So introduce a new dma_resv_ctx object which can be used to
>> simplify the deadlock handling. This is done by tracking all locked
>> dma_resv objects in the context as well as the last contended object.
>>
>> When a deadlock occurse we now unlock all previously locked objects and
>> acquire the contended lock in the slow path. After this is done -EDEADLK
>> is still returned to signal that all other locks now need to be
>> re-acquired again.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> I pondered this quite a bit, some thoughts:
>
> - doing this over dma-buf means we can only use this for the ww_mutx
>    dance, not for anything else. Which means we need another layer on top
>    for shared execbuf utils (which Gerd has started looking into, but I
>    felt like not quite the right approach yet in his first draft series).

Yes, and I actually realized that this won't work on the dma_resv layer 
as well.

We need to base this on GEM to be able to do the correct ref/unref the 
locked objects.

> - With the ttm/gem merger we could just put this into drm_gem_object, and
>    ttm/gem helpers could still use it. Plus we could build some shared
>    execbuf utils on top of this, by essentially merging ttm_operation_ctx
>    into drm_gem_operation_ctx. I think this would also simplify the ttm
>    parameters a bit, since currently the ttm_operation_ctx doesn't have an
>    explicit pointer to the ww_acquire_ctx (which feels like an oversight to
>    me).

That ttm_operation_ctx doesn't contain a ww_acquire_ctx is intentional 
and mandatory for correct operation.

See for swapping things out from the MM callbacks you can't work with a 
ww_acquire_ctx and instead need to use trylock.

When you need a ww_acquire_ctx you can get that from the buffer object 
you try to allocate space for.

> - Aside, quick question: Any reason why struct amdgpu_cs_parser doesn't
>    subclass ttm_operation_ctx? From my naive understanding this would make
>    tons of sense ...

amdgpu_cs_parser is already overloaded with to much crap which actually 
should be temporary allocated on the stack.

> - Maybe we could even build some lru/eviction helpers on top, perhaps with
>    two lists, one for the set of buffers in the execbuf, the other for
>    additional buffers we've reserved as part of the eviction dance (to
>    solve the TODO in ttm_mem_evict_wait_busy).

That's what I'm currently working on, but some driver still need the 
struct_mutex for GEM ref/unref which is complicating things a bit.

So prototyping that in TTM BOs first before I move on to using the 
underlying GEM object.

> - Only downside would be that drivers outside of drivers/gpu won't be able
>    to use these helpers. I don't see any immediate nor near-future need for
>    that. All other drivers use so little memory they don't need to
>    participate in the multi-lock dance, they just pin the few buffers they
>    need and call it a day.

I can live with that.

Regards,
Christian.

>
> Ofc not everything above would need to be done right away, that's more
> ideas for todo.rst entries to make sure we all agree on the rough
> direction.
>
> Thoughts?
>
> Also adding Gerd Hoffmann, since he looked into this.
>
> Cheers, Daniel
>> ---
>>   drivers/dma-buf/Makefile       |   2 +-
>>   drivers/dma-buf/dma-resv-ctx.c | 108 +++++++++++++++++++++++++++++++++
>>   include/linux/dma-resv-ctx.h   |  68 +++++++++++++++++++++
>>   include/linux/dma-resv.h       |   1 +
>>   4 files changed, 178 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/dma-buf/dma-resv-ctx.c
>>   create mode 100644 include/linux/dma-resv-ctx.h
>>
>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>> index 03479da06422..da7701c85de2 100644
>> --- a/drivers/dma-buf/Makefile
>> +++ b/drivers/dma-buf/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
>> -	 dma-resv.o seqno-fence.o
>> +	 dma-resv.o dma-resv-ctx.o seqno-fence.o
>>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>>   obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
>>   obj-$(CONFIG_UDMABUF)		+= udmabuf.o
>> diff --git a/drivers/dma-buf/dma-resv-ctx.c b/drivers/dma-buf/dma-resv-ctx.c
>> new file mode 100644
>> index 000000000000..cad10fa6f80b
>> --- /dev/null
>> +++ b/drivers/dma-buf/dma-resv-ctx.c
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2019 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Authors:
>> + *	Christian König <christian.koenig@amd.com>
>> + */
>> +
>> +#include <linux/dma-resv-ctx.h>
>> +
>> +/**
>> + * dma_resv_ctx_init - initialize a reservation context
>> + * @ctx: the context to initialize
>> + *
>> + * Start using this reservation context to lock reservation objects for update.
>> + */
>> +void dma_resv_ctx_init(struct dma_resv_ctx *ctx)
>> +{
>> +	ww_acquire_init(&ctx->base, &reservation_ww_class);
>> +	init_llist_head(&ctx->locked);
>> +	ctx->contended = NULL;
>> +}
>> +EXPORT_SYMBOL(dma_resv_ctx_init);
>> +
>> +/**
>> + * dma_resv_ctx_unlock_all - unlock all reservation objects
>> + * @ctx: the context which holds the reservation objects
>> + *
>> + * Unlocks all reservation objects locked with this context.
>> + */
>> +void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx)
>> +{
>> +	struct dma_resv *obj, *next;
>> +
>> +	if (ctx->contended)
>> +		dma_resv_unlock(ctx->contended);
>> +	ctx->contended = NULL;
>> +
>> +	llist_for_each_entry_safe(obj, next, ctx->locked.first, locked)
>> +		ww_mutex_unlock(&obj->lock);
>> +	init_llist_head(&ctx->locked);
>> +}
>> +EXPORT_SYMBOL(dma_resv_ctx_unlock_all);
>> +
>> +/**
>> + * dma_resv_ctx_lock - lock a reservation object with deadlock handling
>> + * @ctx: the context which should be used to lock the object
>> + * @obj: the object which needs to be locked
>> + * @interruptible: if we should wait interruptible
>> + *
>> + * Use @ctx to lock the reservation object. If a deadlock is detected we backoff
>> + * by releasing all locked objects and use the slow path to lock the reservation
>> + * object. After successfully locking in the slow path -EDEADLK is returned to
>> + * signal that all other locks must be re-taken as well.
>> + */
>> +int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
>> +		      bool interruptible)
>> +{
>> +	int ret = 0;
>> +
>> +	if (unlikely(ctx->contended == obj))
>> +		ctx->contended = NULL;
>> +	else if (interruptible)
>> +		ret = dma_resv_lock_interruptible(obj, &ctx->base);
>> +	else
>> +		ret = dma_resv_lock(obj, &ctx->base);
>> +
>> +	if (likely(!ret)) {
>> +		/* don't use llist_add here, we have separate locking */
>> +		obj->locked.next = ctx->locked.first;
>> +		ctx->locked.first = &obj->locked;
>> +		return 0;
>> +	}
>> +	if (unlikely(ret != -EDEADLK))
>> +		return ret;
>> +
>> +	dma_resv_ctx_unlock_all(ctx);
>> +
>> +	if (interruptible) {
>> +		ret = dma_resv_lock_slow_interruptible(obj, &ctx->base);
>> +		if (unlikely(ret))
>> +			return ret;
>> +	} else {
>> +		dma_resv_lock_slow(obj, &ctx->base);
>> +	}
>> +
>> +	ctx->contended = obj;
>> +	return -EDEADLK;
>> +}
>> +EXPORT_SYMBOL(dma_resv_ctx_lock);
>> diff --git a/include/linux/dma-resv-ctx.h b/include/linux/dma-resv-ctx.h
>> new file mode 100644
>> index 000000000000..86473de65167
>> --- /dev/null
>> +++ b/include/linux/dma-resv-ctx.h
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2019 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Authors:
>> + *	Christian König <christian.koenig@amd.com>
>> + */
>> +
>> +#ifndef _LINUX_DMA_RESV_CTX_H
>> +#define _LINUX_DMA_RESV_CTX_H
>> +
>> +#include <linux/llist.h>
>> +#include <linux/dma-resv.h>
>> +
>> +/**
>> + * struct dma_resv_ctx - context to lock reservation objects
>> + * @base: ww_acquire_ctx used for deadlock detection
>> + * @locked: list of dma_resv objects locked in this context
>> + * @contended: contended dma_resv object
>> + */
>> +struct dma_resv_ctx {
>> +	struct ww_acquire_ctx base;
>> +	struct llist_head locked;
>> +	struct dma_resv *contended;
>> +};
>> +
>> +/**
>> + * dma_resv_ctx_done - wrapper for ww_acquire_done
>> + * @ctx: the reservation context which is done with locking
>> + */
>> +static inline void dma_resv_ctx_done(struct dma_resv_ctx *ctx)
>> +{
>> +	ww_acquire_done(&ctx->base);
>> +}
>> +
>> +/**
>> + * dma_resv_ctx_fini - wrapper for ww_acquire_fini
>> + * @ctx: the reservation context which is finished
>> + */
>> +static inline void dma_resv_ctx_fini(struct dma_resv_ctx *ctx)
>> +{
>> +	ww_acquire_fini(&ctx->base);
>> +}
>> +
>> +void dma_resv_ctx_init(struct dma_resv_ctx *ctx);
>> +void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx);
>> +int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
>> +		      bool interruptible);
>> +
>> +#endif /* _LINUX_DMA_RESV_CTX_H */
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index ee50d10f052b..1267822c2669 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -71,6 +71,7 @@ struct dma_resv_list {
>>    */
>>   struct dma_resv {
>>   	struct ww_mutex lock;
>> +	struct llist_node locked;
>>   	seqcount_t seq;
>>   
>>   	struct dma_fence __rcu *fence_excl;
>> -- 
>> 2.17.1
>>

