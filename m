Return-Path: <linux-media+bounces-20600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3B9B65AD
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 15:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 400CE1C24CED
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3C61EF94E;
	Wed, 30 Oct 2024 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXXFb0Zs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A373C13C
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298162; cv=none; b=fKrMzmUyfHeM98cIDwsX5wHBZrZu1LNqfv8Q/4azb98fb0mSHQY8ZDAK9zdwEJWruHWgm+VPQCA98nvE884keKo4yMilJGmrFOzYclajbUQJab/q7I0QW7E2HJE6ZqqGYC/XP5jT8gFk2iBUIdnDuyydOfMf3Zk6AxYkShgw0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298162; c=relaxed/simple;
	bh=XI8/azIPxXxl7fc87mBMEWTGZNwEz2ARABpyrhy0c2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B13hDQd3cyGPs2QtnYXl4pTDhWXlrdPcAr79a4pZEz08B/1qMea8sCezb8orK2WLD3DXSqkZ4+EVpvWRUFxIprpoqCnpD/vdnqxwjz8Ruruvw2DEI6DfY5bNawszKvqbqCC2DfAEffz4WsDJtT45wgurfAz8K0iP/xsZHvNEYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXXFb0Zs; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539ee1acb86so6718380e87.0
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730298158; x=1730902958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewnGVP+QrjApj2Lvmg0PwEBD+Hc0GWAQIlAQdlFJ7d4=;
        b=dXXFb0Zs56DhfK6sOC++4q9LusxnyYIKYRPWY6iVIZ+admj9+q1egWFzehnxak/EgP
         ePvxRhTNPqlMT97Gvzw3gBXJS+5oBgjRXamuU1NunEfPnh/J6Xcbc5cHm33qSlfGeBjC
         HhaTrNIAwJ5tyxbPJBYYfWKZOYFEJELRUaEL9JhdoX5XUhVVj0Y/Jo1assX/D+BaPBa7
         BXgIS/0Vj0042KyIHjoUixnkyXfn7mqVi75g9SnKind/zZsVgC8t5r5lrRqtRXUYhp7Q
         oRNNnhzP0+3GZ4TS+Y+3oMbLq8gafzUkp285pXnRJZ5W/qx6D0/Qcb0Y1DlIAv6fgE1f
         eFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730298158; x=1730902958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewnGVP+QrjApj2Lvmg0PwEBD+Hc0GWAQIlAQdlFJ7d4=;
        b=W0mScnadHAd9sdHEhc1if8dtOoUCkCrJoYL2+F5CGbutQnnAkW7ExN1Azc8L4gohUC
         ZHgr8ufG/xcVjYmAK1ZsTorLT5cyM07hWKf9hhtMYyPlR9/84SZJhb5Xw7PZTwPRL7aQ
         CACAX8hiN9YzhK7oDnAnM7t+R7lqiwljoVSaIVslfdIdFOxxi3DLQo7P2fDrHtyyNDcz
         e0TNT2ThwG1yZobLE0TNiVNVFsL0mWvD6kO3B6AakeoMTYie6z/S4unEqMk+xiU31zGz
         FQrD1yZIu/fiAlEVqE2kFHAoBmE00WoseglkG7koH1YZCTKvK2OxV0nI6vy06buG8Ea8
         6zTA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSDbQ1mT8oLidl7ur9zvV9j8wmgBRIrqcRb7o95wAobzV9ZV1n5ZH3o/I3N3tS42TyiIIP+Oh99SYaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7JIrficzIwoMQTZmQAelVirJeEjZc1S+qd/SUESyZQTpOUIDy
	162PU3cBDzp6U6ykUFyfILR9PugoePl2n4T6GIxON8LYasIkNs9r
X-Google-Smtp-Source: AGHT+IFzvNeBt85cLaltZb4hURbuKvOGXkGcfFUIS8hKlUSO2SBZD/ukPEh6Gqf4BB5Op6ItWhHZGQ==
X-Received: by 2002:a05:6512:4024:b0:539:8d9b:b624 with SMTP id 2adb3069b0e04-53b34a31f8fmr8307703e87.55.1730298158222;
        Wed, 30 Oct 2024 07:22:38 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb793e51sm29710995e9.1.2024.10.30.07.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 07:22:37 -0700 (PDT)
Message-ID: <b4051b8f-a82a-4d77-80c4-09a7a4124845@gmail.com>
Date: Wed, 30 Oct 2024 15:22:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: Friedrich Vock <friedrich.vock@gmx.de>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <ZxquPRn1QtaVzydE@DUT025-TGLU.fm.intel.com>
 <1ee2453d-f661-4ea6-8b54-3f911b179420@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <1ee2453d-f661-4ea6-8b54-3f911b179420@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.10.24 um 08:52 schrieb Friedrich Vock:
> On 24.10.24 22:29, Matthew Brost wrote:
>> On Thu, Oct 24, 2024 at 02:41:57PM +0200, Christian König wrote:
>>> Reports indicates that some userspace applications try to merge more 
>>> than
>>> 80k of fences into a single dma_fence_array leading to a warning from
>>
>> Really, yikes.
>
> Not really IME. Unless Christian means some reports I don't have access
> to, the cases where userspace applications tried to do that were really
> just cases where the fence count exploded exponentially because
> dma_fence_unwrap_merge failed to actually merge identical fences (see
> patch 2). At no point have I actually seen apps trying to merge 80k+
> unique fences.

While working on it I've modified our stress test tool to send the same 
1GiB SDMA copy to 100k different contexts.

Turned out it's perfectly possible to create so many fences, there is 
nothing blocking userspace to do it.

While this isn't a realistic use case the kernel should at least not 
crash or spill a warning, but either handle or reject it gracefully.

Friedrich can you confirm that patch two in this series fixes the 
problem? I would really like to get it into drm-misc-fixes before 6.12 
comes out.

Thanks,
Christian.

>
> Regards,
> Friedrich
>
>>
>>> kzalloc() that the requested size becomes to big.
>>>
>>> While that is clearly an userspace bug we should probably handle 
>>> that case
>>> gracefully in the kernel.
>>>
>>> So we can either reject requests to merge more than a reasonable 
>>> amount of
>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>> kzalloc().
>>> This patch here does the later.
>>>
>>
>> This patch seems reasonable to me if the above use is in fact valid.
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: stable@vger.kernel.org
>>
>> Fixes tag?
>>
>> Patch itself LGTM:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>> ---
>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>> b/drivers/dma-buf/dma-fence-array.c
>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>> dma_fence *fence)
>>>       for (i = 0; i < array->num_fences; ++i)
>>>           dma_fence_put(array->fences[i]);
>>>
>>> -    kfree(array->fences);
>>> -    dma_fence_free(fence);
>>> +    kvfree(array->fences);
>>> +    kvfree_rcu(fence, rcu);
>>>   }
>>>
>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>> *dma_fence_array_alloc(int num_fences)
>>>   {
>>>       struct dma_fence_array *array;
>>>
>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>>
>>> -- 
>>> 2.34.1
>>>
>


