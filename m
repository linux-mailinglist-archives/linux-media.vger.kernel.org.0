Return-Path: <linux-media+bounces-60312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN11A4vC+Gky0gIAu9opvQ
	(envelope-from <linux-media+bounces-60312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:00:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 781154C10F5
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 030683059FF6
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 15:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06BA3E1CE3;
	Mon,  4 May 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="NuxKMn4w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A483E0251
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910138; cv=none; b=u3kmE5xxKBi+avYVx3YtXHF5eYVFZrC4ONA+Bf+Z5yo7vAeGCQQ/i8GAJd+JHGdVqO7sNAaV+YouBxrN3171IV3hgWzlPFbY94Fz0AF3hssEGeo1dhJRqH2v9FnI0/BvPMjXtIKwplwLRmA0++778cJSDw3g6boAK4gJoa9izZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910138; c=relaxed/simple;
	bh=01/VY76O/nnd16+LUNLmFaAx0ht1xYngiKncAaGAafk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNWnhtUlr5OKrQuHZJ3rxQ16TqCs/c4o64MDxKwtDNIsRo6o+E4kgBItb7cgiCOJZ2tZ6xZRXKBQR+gQJ2hzdjPW1Y60Ys1KNJ27HxMw7TuzwXWwYymRRpMzvi4W/GoVkt+gEvRu1v11Jmg+rFTVOWDaXbVgOvxQadxzQfJSJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=NuxKMn4w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso45053915e9.3
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1777910134; x=1778514934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAwvEMhw8ObiJxMwhkLvz97QesSc7DQxGWqRFcra99U=;
        b=NuxKMn4wz5FOdyIn09Gn3fqKO+PEf76SJEsz8VgOCr0m3kQyEqCC2xGJAqdmuzQFbZ
         rotqapLi+ujY6wTSIrz8emz2amWbcN8X1d0ZgPNRNTg9VsOzbdk/016zJKnibME5r/Uf
         sxu11m+j9WfWVJRrtDFuBQPq+8jc8rEr3JhvQ/D18n4foz+fbsB3QSd0vUr58MQF0vQ1
         dGJhMs9jCUzhIacOQDLyv54VlN4vFzrDJwlR8Ugwwp0wWKyYR6bp3eMIHgoaG/81pX3K
         WfxCdVvQHkqU0xM9G9N7KKC9nNxIoWCXJS0H/EfVpRhRX1/lXrmwtLR8UtgjMCF/RYlZ
         Ho4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910134; x=1778514934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAwvEMhw8ObiJxMwhkLvz97QesSc7DQxGWqRFcra99U=;
        b=FlSGMLAFD+cG7tRQCSYqRRbuwt2uhT4O8YHmA7t3CR1mtPcohQ8reg3y3QeojA1bfk
         oZ+cllj97UtFhzYy60GVQOYXQ204xDEwS/nGN8CvZEudWIuue4FB+QT6nvzVyXVvoXY2
         e1SizOytIeg0cfyP3hHk9xI4hig5JJLx/engfk4s9IesrN7JII8DZIWnf03yfnvoq6Nf
         vPesUpgljJU3G4h9PGu3t4Yc4WJoG1MfCjIzMrqmjEQvNXyFq6DHsH1CrxqNwcEIQ0/q
         NISymaGEiNamPDMc4MFwtG/PkY4fZIEJqCKsTbj2eQXOaYmlYzIyD5NaxBL1dDD8nLa7
         jW4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9lS/fhubVTBD79iJtUkZK1vdyv2A8BjNk4ySDw0GPc4jacgHHl4kHgPHcgZi1k9BJtslYr86Wh2Ncflg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyogNxq3aNooJ669LvWuv3LN8Sggl7vSASUZDoMLJLNKb76s+O1
	Stcq58OklMGhzrruGEnVPeWIuZ9ks970IXWYUSFMDm2L7OJWS5JAQdwqsFesEIVbdUE=
X-Gm-Gg: AeBDieum4Jkv/+X6RLpt2//FlXvY+f82shHF1TOvuZRthhCW8ZyhQ+uAHgBzoo5PECT
	6DZzSWAbTWluu1jDvGoGZQuX9kdMLWfuvQCPuwlLfbCxgwax9nhXT30bCN8qd9A6MHeFrq0gjhl
	q5DsvCt89SwQjZ765VFMTegGAkKR5DB2Yl4ichQPIDAFnfxfp0LqXmRFsPLNSDTgdmGuFn91MM+
	SKJfDAD3ylMoWZXeF9BmEpmudfgDRiwyFFuABs5rnRTbhebbOPoX3g5Mw4RjBd2vdmHiNiYD31x
	OT1C7zSLRT560LpxWF/wVuZxNfic5WkMS0jLewNs05IkLF1r3HnbUp6hEBWx8WaMx/yiof7vre/
	SpY07CF2637x7J9uLINy6rdQdoShqISV1sSJnkyFhRO50QD9JrPK6KTHIPX2ENwspGg5wHEo6Tl
	fVnjHMKCYnORco1j/FizoxiiBPBnWH7/xzgKAtjwkT7fGda4ACwVHeMnw=
X-Received: by 2002:a05:600c:4e4c:b0:48a:7b7b:c2b9 with SMTP id 5b1f17b1804b1-48d127234c5mr31052415e9.4.1777910133983;
        Mon, 04 May 2026 08:55:33 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50becsm27274420f8f.11.2026.05.04.08.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 08:55:33 -0700 (PDT)
Message-ID: <c91b0996-68f4-4d27-891d-6a77f3491571@ursulin.net>
Date: Mon, 4 May 2026 16:55:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma_fence_array: optimize handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260422103012.1647-1-christian.koenig@amd.com>
 <20260422103012.1647-2-christian.koenig@amd.com>
 <5e15b5d8-8184-4496-8da0-793ccd592d10@ursulin.net>
 <06188881-4eb7-4685-a54d-60806accfb8a@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <06188881-4eb7-4685-a54d-60806accfb8a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 781154C10F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-60312-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ursulin.net:dkim,ursulin.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]


On 04/05/2026 15:55, Christian König wrote:
> On 4/22/26 13:37, Tvrtko Ursulin wrote:
>>
>> On 22/04/2026 11:30, Christian König wrote:
>>> Removing the signal on any feature allows to simplfy the dma_fence_array
>>> code a lot and saves us from the need to install a callback on all fences
>>> at the same time.
>>>
>>> This results in less memory and CPU overhead.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/dma-buf/dma-fence-array.c | 130 +++++++++++++-----------------
>>>    include/linux/dma-fence-array.h   |  22 ++---
>>>    2 files changed, 59 insertions(+), 93 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>>> index 5e10e8df372f..f1b4b3296c87 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -42,97 +42,80 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>>>        cmpxchg(&array->base.error, PENDING_ERROR, 0);
>>>    }
>>>    -static void irq_dma_fence_array_work(struct irq_work *wrk)
>>> +static void dma_fence_array_cb_func(struct dma_fence *f,
>>> +                    struct dma_fence_cb *cb)
>>>    {
>>> -    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>>> +    struct dma_fence_array *array =
>>> +        container_of(cb, struct dma_fence_array, callback);
>>>    -    dma_fence_array_clear_pending_error(array);
>>> +    irq_work_queue(&array->work);
>>> +}
>>> +
>>> +static void dma_fence_array_arm_cb(struct dma_fence_array *array)
>>> +{
>>> +    while (array->num_pending) {
>>> +        struct dma_fence *f = array->fences[array->num_pending - 1];
>>> +
>>> +        if (!dma_fence_add_callback(f, &array->callback,
>>> +                        dma_fence_array_cb_func))
>>> +            return;
>>> +
>>> +        dma_fence_array_set_pending_error(array, f->error);
>>> +        WRITE_ONCE(array->num_pending, array->num_pending - 1);
>>
>> Do you think the WRITE_ONCEs are needed? As the loop will restart with un-annotated read anyway, but not just that, I don't think it can be compiled away in the kernel with this usage pattern. Maybe I am mistaken.
> 
> I also think the WRITE_ONCEs are superfluous. But I wanted to be on the save side, not that the compiler re-orders the write before the dma_fence_add_callback() and it shouldn't matter for performance.

Hm okay, but I am on the fence here, if they stay they may be misleading 
the reader that they are required.

> 
>>
>>> +    }
>>>          dma_fence_signal(&array->base);
>>>        dma_fence_put(&array->base);
>>>    }
>>>    -static void dma_fence_array_cb_func(struct dma_fence *f,
>>> -                    struct dma_fence_cb *cb)
>>> +static void dma_fence_array_irq_work(struct irq_work *wrk)
>>>    {
>>> -    struct dma_fence_array_cb *array_cb =
>>> -        container_of(cb, struct dma_fence_array_cb, cb);
>>> -    struct dma_fence_array *array = array_cb->array;
>>> -
>>> -    dma_fence_array_set_pending_error(array, f->error);
>>> +    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>>>    -    if (atomic_dec_and_test(&array->num_pending))
>>> -        irq_work_queue(&array->work);
>>> -    else
>>> -        dma_fence_put(&array->base);
>>> +    WRITE_ONCE(array->num_pending, array->num_pending - 1);
>>> +    dma_fence_array_arm_cb(array);
>>
>> So for x86 going from one irqwork latency to num_fences latencies is probably passable but I am not sure how other architectures fare.
> 
> Mhm, what do you mean?
> 
> Previously we started one irqwork handler for each not signaled fence when enable_signaling was called, but now we reduce that to only starting one for each not signaled fence when the previous fence has finished.
> 
> As far as I can see that is always better or at least the same overhead.

Currently irq work latency is once per array:

static void dma_fence_array_cb_func(struct dma_fence *f,
				    struct dma_fence_cb *cb)
{
...

	if (atomic_dec_and_test(&array->num_pending))
		irq_work_queue(&array->work);

So only when last one signals.

With this patch, AFAIR from when I reviewed it because the diff is a bit 
difficult to read so I applied it, it is a "chain" of irq work and 
callbacks. One by one as you say - irq work installs the callback on the 
next fence, which when signalled queues irq work.

Regards,

Tvrtko

>>
>>>    }
>>>      static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>>>    {
>>>        struct dma_fence_array *array = to_dma_fence_array(fence);
>>> -    struct dma_fence_array_cb *cb = array->callbacks;
>>> -    unsigned i;
>>> -
>>> -    for (i = 0; i < array->num_fences; ++i) {
>>> -        cb[i].array = array;
>>> -        /*
>>> -         * As we may report that the fence is signaled before all
>>> -         * callbacks are complete, we need to take an additional
>>> -         * reference count on the array so that we do not free it too
>>> -         * early. The core fence handling will only hold the reference
>>> -         * until we signal the array as complete (but that is now
>>> -         * insufficient).
>>> -         */
>>> -        dma_fence_get(&array->base);
>>> -        if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
>>> -                       dma_fence_array_cb_func)) {
>>> -            int error = array->fences[i]->error;
>>> -
>>> -            dma_fence_array_set_pending_error(array, error);
>>> -            dma_fence_put(&array->base);
>>> -            if (atomic_dec_and_test(&array->num_pending)) {
>>> -                dma_fence_array_clear_pending_error(array);
>>> -                return false;
>>> -            }
>>> -        }
>>> -    }
>>>    +    /*
>>> +     * As we may report that the fence is signaled before all
>>> +     * callbacks are complete, we need to take an additional
>>> +     * reference count on the array so that we do not free it too
>>> +     * early. The core fence handling will only hold the reference
>>> +     * until we signal the array as complete (but that is now
>>> +     * insufficient).
>>> +     */
>>> +    dma_fence_get(&array->base);
>>> +    dma_fence_array_arm_cb(array);
>>>        return true;
>>
>> Are you sure it is safe to always return true?
> 
> Oh, good point!
> 
> It is safe to return true here, but it is not save to call dma_fence_array_arm_cb() because that could signal the fence and result in double locking!
> 
> Going to fix that, thanks.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>    }
>>>      static bool dma_fence_array_signaled(struct dma_fence *fence)
>>>    {
>>>        struct dma_fence_array *array = to_dma_fence_array(fence);
>>> -    int num_pending;
>>> +    int num_pending, error = 0;
>>>        unsigned int i;
>>>          /*
>>> -     * We need to read num_pending before checking the enable_signal bit
>>> -     * to avoid racing with the enable_signaling() implementation, which
>>> -     * might decrement the counter, and cause a partial check.
>>> -     * atomic_read_acquire() pairs with atomic_dec_and_test() in
>>> -     * dma_fence_array_enable_signaling()
>>> -     *
>>> -     * The !--num_pending check is here to account for the any_signaled case
>>> -     * if we race with enable_signaling(), that means the !num_pending check
>>> -     * in the is_signalling_enabled branch might be outdated (num_pending
>>> -     * might have been decremented), but that's fine. The user will get the
>>> -     * right value when testing again later.
>>> +     * Reading num_pending without a memory barrier here is correct since
>>> +     * that is only for optimization, it is perfectly acceptable to have a
>>> +     * stale value for it. In all other cases num_pending is accessed by a
>>> +     * single call chain.
>>>         */
>>> -    num_pending = atomic_read_acquire(&array->num_pending);
>>> -    if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
>>> -        if (num_pending <= 0)
>>> -            goto signal;
>>> -        return false;
>>> -    }
>>> +    num_pending = READ_ONCE(array->num_pending);
>>> +    for (i = 0; i < num_pending; ++i) {
>>> +        struct dma_fence *f = array->fences[i];
>>>    -    for (i = 0; i < array->num_fences; ++i) {
>>> -        if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
>>> -            goto signal;
>>> -    }
>>> -    return false;
>>> +        if (!dma_fence_is_signaled(f))
>>> +            return false;
>>>    -signal:
>>> +        if (!error)
>>> +            error = f->error;
>>> +    }
>>> +    dma_fence_array_set_pending_error(array, error);
>>>        dma_fence_array_clear_pending_error(array);
>>>        return true;
>>>    }
>>> @@ -171,15 +154,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
>>>      /**
>>>     * dma_fence_array_alloc - Allocate a custom fence array
>>> - * @num_fences:        [in]    number of fences to add in the array
>>>     *
>>>     * Return dma fence array on success, NULL on failure
>>>     */
>>> -struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>>> +struct dma_fence_array *dma_fence_array_alloc(void)
>>>    {
>>> -    struct dma_fence_array *array;
>>> -
>>> -    return kzalloc_flex(*array, callbacks, num_fences);
>>> +    return kzalloc_obj(struct dma_fence_array);
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_array_alloc);
>>>    @@ -203,10 +183,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>>        WARN_ON(!num_fences || !fences);
>>>          array->num_fences = num_fences;
>>> +    array->num_pending = num_fences;
>>> +    array->fences = fences;
>>> +    array->base.error = PENDING_ERROR;
>>>          dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
>>>                   seqno);
>>> -    init_irq_work(&array->work, irq_dma_fence_array_work);
>>> +    init_irq_work(&array->work, dma_fence_array_irq_work);
>>>          /*
>>>         * dma_fence_array_enable_signaling() is invoked while holding
>>> @@ -220,11 +203,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>>         */
>>>        lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>>>    -    atomic_set(&array->num_pending, num_fences);
>>> -    array->fences = fences;
>>> -
>>> -    array->base.error = PENDING_ERROR;
>>> -
>>>        /*
>>>         * dma_fence_array objects should never contain any other fence
>>>         * containers or otherwise we run into recursion and potential kernel
>>> @@ -265,7 +243,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>    {
>>>        struct dma_fence_array *array;
>>>    -    array = dma_fence_array_alloc(num_fences);
>>> +    array = dma_fence_array_alloc();
>>>        if (!array)
>>>            return NULL;
>>>    diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>>> index 1b1d87579c38..3ee55c0e2fa4 100644
>>> --- a/include/linux/dma-fence-array.h
>>> +++ b/include/linux/dma-fence-array.h
>>> @@ -15,16 +15,6 @@
>>>    #include <linux/dma-fence.h>
>>>    #include <linux/irq_work.h>
>>>    -/**
>>> - * struct dma_fence_array_cb - callback helper for fence array
>>> - * @cb: fence callback structure for signaling
>>> - * @array: reference to the parent fence array object
>>> - */
>>> -struct dma_fence_array_cb {
>>> -    struct dma_fence_cb cb;
>>> -    struct dma_fence_array *array;
>>> -};
>>> -
>>>    /**
>>>     * struct dma_fence_array - fence to represent an array of fences
>>>     * @base: fence base class
>>> @@ -33,18 +23,17 @@ struct dma_fence_array_cb {
>>>     * @num_pending: fences in the array still pending
>>>     * @fences: array of the fences
>>>     * @work: internal irq_work function
>>> - * @callbacks: array of callback helpers
>>> + * @callback: callback structure for signaling
>>>     */
>>>    struct dma_fence_array {
>>>        struct dma_fence base;
>>>    -    unsigned num_fences;
>>> -    atomic_t num_pending;
>>> +    unsigned int num_fences;
>>> +    unsigned int num_pending;
>>>        struct dma_fence **fences;
>>>          struct irq_work work;
>>> -
>>> -    struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
>>> +    struct dma_fence_cb callback;
>>>    };
>>>      /**
>>> @@ -78,11 +67,10 @@ to_dma_fence_array(struct dma_fence *fence)
>>>        for (index = 0, fence = dma_fence_array_first(head); fence;    \
>>>             ++(index), fence = dma_fence_array_next(head, index))
>>>    -struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>>> +struct dma_fence_array *dma_fence_array_alloc(void);
>>>    void dma_fence_array_init(struct dma_fence_array *array,
>>>                  int num_fences, struct dma_fence **fences,
>>>                  u64 context, unsigned seqno);
>>> -
>>>    struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>                               struct dma_fence **fences,
>>>                               u64 context, unsigned seqno);
>>
> 


