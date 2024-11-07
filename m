Return-Path: <linux-media+bounces-21058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DF9C06F3
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A8A1C25C12
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872BB20EA33;
	Thu,  7 Nov 2024 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="KlYICUoB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE61DBB37
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730984906; cv=none; b=RJDdcRRSqodgWH/nKaPiIlIZQsvpKKgAAWUeLTwk1vQzSWv5d0r4fvOXNPDYuAlH0CmykZcsct69byUQQ6A1ziI62oIkN9iKqvTIxdeB3RSXZycn1PX3UryKIrg5IuSGxKHyy+kcVt3Byi4OrUHYQwY5+mrqnpG3WeS11V9vrzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730984906; c=relaxed/simple;
	bh=YYLtUjHcHsXmNjqo+f30x5MPkOQmz8tNR0At0nhZpQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pGyWRpp8KybjyjJ4ONU9YKfsdT59BlTADg4qvCtETPurfV03Ewly0+J3qSUkedXq2J6yhcw/1W8o/4QJHgUVtZYwe9VEQAYMqH2K/DZVYLLX2XHDJg8YET65O8kLYhI1GDZEuMawaKiWrEqicPGECLaepPskrkeKqRW/58sh6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=KlYICUoB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso8667291fa.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730984903; x=1731589703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tWyOrqyZCzJoURJb2KP6x8DH/aczXFT6+1UEfBPMgBA=;
        b=KlYICUoB2V5VC7k0FS45t5yW5b2Qj9lIabmCjazYzznbtBSO0QRphrPNsLZuSKziZH
         4ksQ7JLhfryh9GDcfrolh26Qv1kC0O8ZaMCLoI1fibx4GOgOq30InbX3Cme2oc/sP3e2
         hWjl+DV/1BSE4TgKZdw3ccGEWec2inoq8dkYLY8C6T9ePJMc5UsEuUe7TY78a+GGBYcu
         UPO4wvDT9//fD6Mi9HVVG1g/GNjqyf4Lq6V5XNyophBz02GUkwWXLwaXMT+UMjL8I7i7
         UH3gLMZxuUE6R2J9LwRfXA5Z/x/7v6H/jDEgKrqTPTRgcYXheYN2drJIlIWcTngAvTex
         88vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730984903; x=1731589703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWyOrqyZCzJoURJb2KP6x8DH/aczXFT6+1UEfBPMgBA=;
        b=aMQ2ZDhf5ompV9k9WjqREeyNBVQc2aQHQXXmWQi1I5WDQDvO+Nj/lrasihQIZ7Iq1i
         nt7AlppwiuCvOPmvk3hjtFZkNlyCZw7vWPLW/tJU0ANcHE7m5xRmxhz8kOqF5fR/6eBu
         Zd/iCQOm2B8qGGenL9psrnbxnElH1twzcVUu4lVH1zcUvrh91D9hWl1TymYbeihFHlwH
         LGDhvhRKPmtTZNihSgMohXSRcT7RlQ6webrEliJFhaZ72ZB5S2ZCMFusHroS1c8nVdRJ
         WWoMFLOk5vDMu7Q6EK7e9UVQEhHqtpoVXzkb8SbLxi8LSz+jhXA1y5Olh5asFR/Fyu3n
         oxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxJQnEH7L4I3JZ3mIbrnvZZUf0oIUkxJFPninJbh5qCw96kfk/LVfoRV2111jVloR6ZjhWWD6T9Uhpdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZO9sOUctJHYNbQCIJJk8QhpNC2WIwfYCQePtXapkceoq0vzY+
	xcwURrF2qmkR8a6j+MMFtSsCZV8+/l/Y7wuPVv5cngb3Gy1IPaUdNRY512t/fjY=
X-Google-Smtp-Source: AGHT+IFBXcrfSw2Uq4+hlm6z6CRrPz+8RdwwT7Kpr9e/Dj/GEo9Oic8Q4+VWsyDfo/unUb5x0P/eBQ==
X-Received: by 2002:a05:651c:b0a:b0:2fb:5740:9f9a with SMTP id 38308e7fff4ca-2ff1aadce59mr9591731fa.29.1730984902793;
        Thu, 07 Nov 2024 05:08:22 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c0d33sm23859515e9.27.2024.11.07.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 05:08:22 -0800 (PST)
Message-ID: <698513cb-1032-4ced-9a41-ccf21356c501@ursulin.net>
Date: Thu, 7 Nov 2024 13:08:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
 <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
 <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
 <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
 <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 07/11/2024 12:48, Christian König wrote:
> Am 07.11.24 um 12:29 schrieb Tvrtko Ursulin:
>>
>> On 28/10/2024 10:34, Christian König wrote:
>>> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>>>
>>>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 24/10/2024 13:41, Christian König wrote:
>>>>>> Reports indicates that some userspace applications try to merge 
>>>>>> more than
>>>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>>>> kzalloc() that the requested size becomes to big.
>>>>>>
>>>>>> While that is clearly an userspace bug we should probably handle 
>>>>>> that case
>>>>>> gracefully in the kernel.
>>>>>>
>>>>>> So we can either reject requests to merge more than a reasonable 
>>>>>> amount of
>>>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>>>> kzalloc().
>>>>>> This patch here does the later.
>>>>>
>>>>> Rejecting would potentially be safer, otherwise there is a path for 
>>>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>>>> and spam dmesg at will.
>>>>
>>>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>>>> invent a limit. Up for discussion I suppose.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>> Question is what limit to set...
>>>
>>> That's one of the reasons why I opted for kvzalloc() initially.
>>
>> I didn't get that, what was the reason? To not have to invent an 
>> arbitrary limit?
> 
> Well that I couldn't come up with any arbitrary limit that I had 
> confidence would work and not block real world use cases.
> 
> Switching to kvzalloc() just seemed the more defensive approach.

Yeah it is.

>>> I mean we could use some nice round number like 65536, but that would 
>>> be totally arbitrary.
>>
>> Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
>> is avoided? Or pass __GFP_NOWARN?
> 
> Well are we sure that will never hit 65536 in a real world use case? 
> It's still pretty low.

Ah no, I did not express myself clearly. I did not mean 64k, but a limit 
to align with INT_MAX __kvmalloc_node_noprof(). Or __GFP_NOWARN might be 
better when allocation size is userspace controlled.

Regards,

Tvrtko

>>> Any comments on the other two patches? I need to get them upstream.
>>
>> Will look into them shortly.
> 
> Thanks,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> CC: stable@vger.kernel.org
>>>>>> ---
>>>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>>>> b/drivers/dma-buf/dma-fence-array.c
>>>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>>>> dma_fence *fence)
>>>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>>>           dma_fence_put(array->fences[i]);
>>>>>> -    kfree(array->fences);
>>>>>> -    dma_fence_free(fence);
>>>>>> +    kvfree(array->fences);
>>>>>> +    kvfree_rcu(fence, rcu);
>>>>>>   }
>>>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>>>> *dma_fence_array_alloc(int num_fences)
>>>>>>   {
>>>>>>       struct dma_fence_array *array;
>>>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>>>> GFP_KERNEL);
>>>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>>>> GFP_KERNEL);
>>>>>>   }
>>>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>>
> 

