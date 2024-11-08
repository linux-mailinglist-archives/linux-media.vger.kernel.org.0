Return-Path: <linux-media+bounces-21183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A43439C21B8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8671F21D94
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183861494DB;
	Fri,  8 Nov 2024 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="iSVmIPrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D508A41
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082384; cv=none; b=hlpM7lOl1INS83kUEB7tauDKZkOpcKr3L4EdGMY2t7mGyRkUHYCXEDdVDQLO7imiUQsrBbAVAako4INC8c/az/3V8BeqYmZOfE/amF+t7NxA3h4dg9E4+EfD92lJyVCn2aYmBfvY1fPDAPB6ly3l5VCUw+VpHrhJDe2wBEB1amQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082384; c=relaxed/simple;
	bh=B2wylcsb5oGAbf569NL8uLNN5H7jzUHg5UdvPS20ahQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f6vMnqDQ1F6+bORI6vuG9rT9RaA+wdEisasyS5AdkVViHjTdka8ZsrZPt4fUmNRJ6LeTEnKIUWoj319Gi9eLj4xFknHY7xryEK+2KG4sEDVgcwYlt0sYJ/TGFSc+IuvFk+sEOjujONEb7La3Ejq96+E71lYcvFvoKuQ7PemUMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=iSVmIPrQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43163667f0eso20526605e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731082380; x=1731687180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4poXxfRfxPLdn8k7VS6ytr5E4cYnD80y1QbF6VF3NM=;
        b=iSVmIPrQNQUY7bsTQ6O3s3/gsXcbFWPe8tG6Xa+7oh27WuDZE/9lce7qMFQKeHzTX8
         MXfTWWebOO/BAy5eIiVRfjVX/UfI5sbFyDmOFnKuh+GkttqQNGahv1RJRk6rfKa7Rlbd
         6Rtg9UqOumjnD+Qr16tg+CvC2zpoh2tsdSNAPBKwm4w2dvHUp++ogEs7TIpMzR+SKvel
         4GClzUNagjP3a6tIqB77VMkuostXeROW1IAcdNi3HuWm+DNfTqNAPtmZNMuTCO+luHXj
         0rz6E3ylvpYnJ9iVdgtHEAU3HaBDPWBOTP/ZTnIb+0edP2gU5lqyGZ0ZhGlabGx63cIM
         B3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731082380; x=1731687180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4poXxfRfxPLdn8k7VS6ytr5E4cYnD80y1QbF6VF3NM=;
        b=S/nRmY1nCSw6Qu7tlc60AVejzLEP8p/N2asfwaJ5ZvF8YY/nmHtYWVd+XmySJYfL+D
         ah4RhgvVSaN1PX4nDAWXmZivK051z/Bucjd40wYNoKjm5PqVDLMx7lw7tzzOi2uw7f8z
         R62enbymQOZRuEFLy0vRGfy2Nl6A4XeuOYcHM9fpUjulQFZ+f3VDmdTzdU7XKsllSdW8
         forvk01gLNN9i0tcvRZdgqWdxtK5bMT2MBWSqvyDW6X+8bVAOMm7npkhYoWM27zAISbS
         enW4i16W4ZtTNRf97Ui2zihUEZ7w+lkYziQbnp45DGDTcuMw2vOmWOVh1mKCX1hnw/US
         epmw==
X-Forwarded-Encrypted: i=1; AJvYcCUVDztjplIACfka12LPiTSsEfJ7uVqflBvMx3S3e9Dv7n7IxRFcO//jBmNj8QHjJr7jmgVrNomsaEVZUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylQZAEaug9yuF36ridbHj9SyalRxduf5opxYSdkniQ98Nb6VyP
	BGr7qyRkGKxjRmlfluMGlP8OngN2f3T4lV2Mt71rQwuxMq0o8CZhMQWtTmxWC8g=
X-Google-Smtp-Source: AGHT+IHfX3drXiakOCwi9XTVwxzLJGsb7nYv+TEqYteAVJt7pnOy3693z7LQm/H5Wf0iUbe2RkXDVA==
X-Received: by 2002:a05:600c:4e8b:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-432b74feb99mr28658015e9.7.1731082380245;
        Fri, 08 Nov 2024 08:13:00 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b3505sm108531955e9.15.2024.11.08.08.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 08:12:59 -0800 (PST)
Message-ID: <b1383d57-39f0-460b-9793-435f60f7f722@ursulin.net>
Date: Fri, 8 Nov 2024 16:12:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
 <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
 <d2882342-ec87-4e41-a7f8-6d7cf8fb3b20@ursulin.net>
 <810e2380-1215-4b85-85b5-6b558f7fd62a@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <810e2380-1215-4b85-85b5-6b558f7fd62a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/11/2024 14:58, Christian König wrote:
> Am 08.11.24 um 12:22 schrieb Tvrtko Ursulin:
>> On 07/11/2024 16:00, Tvrtko Ursulin wrote:
>>> On 24/10/2024 13:41, Christian König wrote:
>>>> The merge function initially handled only individual fences and
>>>> arrays which in turn were created by the merge function. This allowed
>>>> to create the new array by a simple merge sort based on the fence
>>>> context number.
>>>>
>>>> The problem is now that since the addition of timeline sync objects
>>>> userspace can create chain containers in basically any fence context
>>>> order.
>>>>
>>>> If those are merged together it can happen that we create really
>>>> large arrays since the merge sort algorithm doesn't work any more.
>>>>
>>>> So put an insert sort behind the merge sort which kicks in when the
>>>> input fences are not in the expected order. This isn't as efficient
>>>> as a heap sort, but has better properties for the most common use
>>>> case.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-fence-unwrap.c | 39 
>>>> ++++++++++++++++++++++++++----
>>>>   1 file changed, 34 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>>>> b/drivers/dma-buf/dma-fence-unwrap.c
>>>> index 628af51c81af..d9aa280d9ff6 100644
>>>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>>>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>>>> @@ -106,7 +106,7 @@ struct dma_fence 
>>>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>>>           fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>>>>       count = 0;
>>>> -    do {
>>>> +    while (true) {
>>>>           unsigned int sel;
>>>>   restart:
>>>> @@ -144,11 +144,40 @@ struct dma_fence 
>>>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>>>               }
>>>>           }
>>>> -        if (tmp) {
>>>> -            array[count++] = dma_fence_get(tmp);
>>>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +        if (!tmp)
>>>> +            break;
>>>> +
>>>> +        /*
>>>> +         * We could use a binary search here, but since the assumption
>>>> +         * is that the main input are already sorted dma_fence_arrays
>>>> +         * just looking from end has a higher chance of finding the
>>>> +         * right location on the first try
>>>> +         */
>>>> +
>>>> +        for (i = count; i--;) {
>>>> +            if (likely(array[i]->context < tmp->context))
>>>> +                break;
>>>> +
>>>> +            if (array[i]->context == tmp->context) {
>>>> +                if (dma_fence_is_later(tmp, array[i])) {
>>>> +                    dma_fence_put(array[i]);
>>>> +                    array[i] = dma_fence_get(tmp);
>>>> +                }
>>>> +                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +                goto restart;
>>>> +            }
>>>>           }
>>>> -    } while (tmp);
>>>> +
>>>> +        ++i;
>>>> +        /*
>>>> +         * Make room for the fence, this should be a nop most of the
>>>> +         * time.
>>>> +         */
>>>> +        memcpy(&array[i + 1], &array[i], (count - i) * 
>>>> sizeof(*array));
>>>> +        array[i] = dma_fence_get(tmp);
>>>> +        fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +        count++;
>>>
>>> Having ventured into this function for the first time, I can say that 
>>> this is some smart code which is not easy to grasp. It could 
>>> definitely benefit from a high level comment before the do-while loop 
>>> to explain what it is going to do.
>>>
>>> Next and tmp local variable names I also wonder if could be renamed 
>>> to something more descriptive.
>>>
>>> And the algorithmic complexity of the end result, given the multiple 
>>> loops and gotos, I have no idea what it could be.
>>>
>>> Has a dumb solution been considered like a two-pass with a 
>>> pessimistically allocated fence array been considered? Like:
>>>
>>> 1) Populate array with all unsignalled unwrapped fences. (O(count))
>>>
>>> 2) Bog standard include/linux/sort.h by context and seqno. 
>>> (O(count*log (count)))
>>>
>>> 3) Walk array and squash same context to latest fence. (Before this 
>>> patch that wasn't there, right?). (O(count)) (Overwrite in place, no 
>>> memcpy needed.)
>>>
>>> Algorithmic complexity of that would be obvious and code much simpler.
>>
>> FWIW something like the below passes selftests. How does it look to 
>> you? Do you think more or less efficient and more or less readable?
> 
> Yeah I was considering the exact same thing.
> 
> What hold me back was the fact that the heap sort() implementation is 
> really inefficient for the most common use case of this. In other words 
> two arrays with fences already sorted is basically just O(count).
> 
> And I'm also not sure how many fences we see in those arrays in 
> practice. With Vulkan basically trying to feed multiple contexts to keep 
> all CPUs busy we might have quite a number here.

I can add some instrumentation and run some games next week.

Another option is adding the sort algorithm you want with the same API 
as kernel's sort. Even if a local implementation that may already 
increase readability of the merging process.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> commit 8a7c3ea7e7af85e813bf5fc151537ae37be1d6d9
>> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Date:   Fri Nov 8 10:14:15 2024 +0000
>>
>>     __dma_fence_unwrap_merge
>>
>>     Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..47d67e482e96 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/dma-fence-chain.h>
>>  #include <linux/dma-fence-unwrap.h>
>>  #include <linux/slab.h>
>> +#include <linux/sort.h>
>>
>>  /* Internal helper to start new array iteration, don't use directly */
>>  static struct dma_fence *
>> @@ -59,17 +60,39 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor)
>>  }
>>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>>
>> +
>> +static int fence_cmp(const void *_a, const void *_b)
>> +{
>> +    const struct dma_fence *a = *(const struct dma_fence **)_a;
>> +    const struct dma_fence *b = *(const struct dma_fence **)_b;
>> +
>> +    if (a->context < b->context)
>> +        return -1;
>> +    else if (a->context > b->context)
>> +        return 1;
>> +
>> +    if (a->seqno < b->seqno)
>> +        return -1;
>> +    else if (a->seqno > b->seqno)
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>>  /* Implementation for the dma_fence_merge() marco, don't use directly */
>>  struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                         struct dma_fence **fences,
>>                         struct dma_fence_unwrap *iter)
>>  {
>> -    struct dma_fence_array *result;
>>      struct dma_fence *tmp, **array;
>> +    struct dma_fence_array *result;
>>      ktime_t timestamp;
>> -    unsigned int i;
>> -    size_t count;
>> +    int i, j, count;
>>
>> +    /*
>> +     * Count number of unwrapped fences and fince the latest signaled
>> +     * timestamp.
>> +     */
>>      count = 0;
>>      timestamp = ns_to_ktime(0);
>>      for (i = 0; i < num_fences; ++i) {
>> @@ -92,63 +115,41 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>      if (count == 0)
>>          return dma_fence_allocate_private_stub(timestamp);
>>
>> +    /*
>> +     * Allocate and populate the array.
>> +     */
>>      array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>>      if (!array)
>>          return NULL;
>>
>> -    /*
>> -     * This trashes the input fence array and uses it as position for 
>> the
>> -     * following merge loop. This works because the dma_fence_merge()
>> -     * wrapper macro is creating this temporary array on the stack 
>> together
>> -     * with the iterators.
>> -     */
>> -    for (i = 0; i < num_fences; ++i)
>> -        fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>> -
>>      count = 0;
>> -    do {
>> -        unsigned int sel;
>> -
>> -restart:
>> -        tmp = NULL;
>> -        for (i = 0; i < num_fences; ++i) {
>> -            struct dma_fence *next;
>> -
>> -            while (fences[i] && dma_fence_is_signaled(fences[i]))
>> -                fences[i] = dma_fence_unwrap_next(&iter[i]);
>> -
>> -            next = fences[i];
>> -            if (!next)
>> -                continue;
>> -
>> -            /*
>> -             * We can't guarantee that inpute fences are ordered by
>> -             * context, but it is still quite likely when this
>> -             * function is used multiple times. So attempt to order
>> -             * the fences by context as we pass over them and merge
>> -             * fences with the same context.
>> -             */
>> -            if (!tmp || tmp->context > next->context) {
>> -                tmp = next;
>> -                sel = i;
>> -
>> -            } else if (tmp->context < next->context) {
>> -                continue;
>> -
>> -            } else if (dma_fence_is_later(tmp, next)) {
>> -                fences[i] = dma_fence_unwrap_next(&iter[i]);
>> -                goto restart;
>> -            } else {
>> -                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> -                goto restart;
>> -            }
>> +    for (i = 0; i < num_fences; ++i) {
>> +        dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>> +            if (!dma_fence_is_signaled(tmp))
>> +                array[count++] = tmp;
>>          }
>> +    }
>> +
>> +    /*
>> +     * Sort in context and seqno order.
>> +     */
>> +    sort(array, count, sizeof(*array), fence_cmp, NULL);
>>
>> -        if (tmp) {
>> -            array[count++] = dma_fence_get(tmp);
>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +    /*
>> +     * Only keep the most recent fence for each context.
>> +     */
>> +    j = 0;
>> +    tmp = array[0];
>> +    for (i = 1; i < count; i++) {
>> +        if (array[i]->context != tmp->context) {
>> +            array[j++] = dma_fence_get(tmp);
>>          }
>> -    } while (tmp);
>> +        tmp = array[i];
>> +    }
>> +    if (tmp->context != array[j - 1]->context) {
>> +        array[j++] = dma_fence_get(tmp);
>> +    }
>> +    count = j;
>>
>>      if (count == 0) {
>>          tmp = dma_fence_allocate_private_stub(ktime_get());
>>
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +    };
>>>>       if (count == 0) {
>>>>           tmp = dma_fence_allocate_private_stub(ktime_get());
> 

