Return-Path: <linux-media+bounces-20410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A29B2CF6
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 11:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B876D1C20F92
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 10:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41052F9B;
	Mon, 28 Oct 2024 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDEfL70P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098C1D54C5
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111657; cv=none; b=aiJOekR+fFnS2+/BJPka+2NixYgQYHtIKVf1HcdVVuIdK4mn8RUvj8hrpsRyfL/fB6D6nCSdbNomNM6HBRelF2OoMhgekqrDP+duDlEwsUn01U8QK4YeAEr3tQU18y4TlPeWvbjULGT3Rp/FJCrcdnTwBtjbDSwdyveu0XUE0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111657; c=relaxed/simple;
	bh=LocewIdRRj+3K5CZxA+5NkOlvJR+40+Bq7QZypeh/b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zm/nYWIH0E+rxD24Bn3KGNWlSqi1MzDFvwipZ7WaCkQD7cW38ntBs+IBIZ9CtZicLusV9cWGZ2Pi0XZoHNqPAtAC7M3spB4PoR2SLFhb/f6duymj4SUoSax9nbdr1wfUuHa8nVfRYrPnZivS30DNY/pujzOoH4lumUJm3/fRGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDEfL70P; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e3f35268so4881365e87.3
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730111654; x=1730716454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7nrYUHUQAGlqcSF1DH4MZfbh2UDaXnpWdDb0g1xC7A=;
        b=DDEfL70PThVo7Ds1m6pEVzmCNqVFRwqphbRdfjg+p3RKqi9AyVccAM3jynDTqS5HaK
         07x19G8APgO5E+OecY/rVtARyQlt1aq4Sia8qavr6t8L/FzRhPZRuj6fW9VREHDYQnTE
         2RyV/hzCkF0r4FcCmzk1EFTTY4e7jkgVQPJNRmfEhil0V8NLgIDUidRbyrrO7NdQ8/r3
         egDD5A2TGds7bAC6r4+Yf2VGXU1mPtVJUSpr3ioofg5gSgI2OiDVtpeohL0CcwA+8ZRa
         zNzRnjxAbDGr7EVYHRoYAXb4mg04IFtYrebJVgwOGHNFYsq/Qrfyps9psWB9BzWHvk96
         Sxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111654; x=1730716454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7nrYUHUQAGlqcSF1DH4MZfbh2UDaXnpWdDb0g1xC7A=;
        b=F3hwMA8GJx9QUbwj9uZI8mQhm+AOiaOSuKTrrdJVhkUkjLZJaNhHIdp4QEbHq3yxyK
         AQR2CNZ6husaLCtLWDlKTFCrW9bKkhsyGLeEHfPMRC0wXJbeUaUJ1ATyjT7o5KNm7EOO
         S11Ls6Bnmugm4klJoM64dj96HhFOICRX6owuxrwoFYFbXIyDRwnUjVC1tiXnV+ahRo43
         5i5+lTdRlkPk19MSKocgMUxqdl52YOQ3YVKxUDYw/oHtqW080n298mvysyuB1hncdra0
         EQErLcm7t4GRhH9ygYhPKQikh2Lo5newu/927yhSPb5JkECAVK+28pxmhHja3sUiVkxH
         Oo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQY6+yzBtiO29XLnrymvcP9HDxZQbfSKePcswXrNSRTpLK1wziJr/HBvUlqLeD+z2vKryaHA5f3QiZ6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Edd3ZL6eKaAGJaL4qVbBua3HeRDi2Id/R0NQI306TUnC+63q
	3xhdEvz9QtYG0qH3Ot7ndJVvYfah5mkx6/RirjKRowJECgDKVX+0NtFFr2BE
X-Google-Smtp-Source: AGHT+IHoBe6oO8PYZGl3+qBTM5n53ghlUJDEj0r9DYaH/xfvybkBeP2XPFw42uN0pzrRgBB+YLIjIQ==
X-Received: by 2002:a05:6512:23a9:b0:536:55cf:3148 with SMTP id 2adb3069b0e04-53b348deb93mr2968873e87.31.1730111653332;
        Mon, 28 Oct 2024 03:34:13 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b7e8sm137070495e9.48.2024.10.28.03.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:34:12 -0700 (PDT)
Message-ID: <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
Date: Mon, 28 Oct 2024 11:34:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: Tvrtko Ursulin <tursulin@ursulin.net>, friedrich.vock@gmx.de,
 Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
 <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>
> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>
>> On 24/10/2024 13:41, Christian König wrote:
>>> Reports indicates that some userspace applications try to merge more 
>>> than
>>> 80k of fences into a single dma_fence_array leading to a warning from
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
>>
>> Rejecting would potentially be safer, otherwise there is a path for 
>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>> and spam dmesg at will.
>
> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
> invent a limit. Up for discussion I suppose.
>
> Regards,
>
> Tvrtko
>
>>
>> Question is what limit to set...

That's one of the reasons why I opted for kvzalloc() initially.

I mean we could use some nice round number like 65536, but that would be 
totally arbitrary.

Any comments on the other two patches? I need to get them upstream.

Thanks,
Christian.

>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: stable@vger.kernel.org
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
>>> -    kfree(array->fences);
>>> -    dma_fence_free(fence);
>>> +    kvfree(array->fences);
>>> +    kvfree_rcu(fence, rcu);
>>>   }
>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>> *dma_fence_array_alloc(int num_fences)
>>>   {
>>>       struct dma_fence_array *array;
>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>> GFP_KERNEL);
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_array_alloc);


