Return-Path: <linux-media+bounces-21056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD19C0625
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66DDCB21DCF
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 12:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA1920F5A3;
	Thu,  7 Nov 2024 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M71pxxpG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63618FDAF
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730983742; cv=none; b=YNoNlxqmQObetMIy7Ujhb5U4nIKjUbFluvPdUVZs3/zy/qAAliPVZDFT9AalhG/demGoBmyqCzstX2h9ZttGqwtI5BLAdMMbP0snxaVLMusLjWI67Y2uZoO3eTgPuohbjA1G93Nx9RUGJ0EJUt0B0BI5NDFwvYbyqrmqlimTpJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730983742; c=relaxed/simple;
	bh=D4Z+KsH7COPa8N5x7Zukxo7G988Hl7OdlNMjhKcjWpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WZUHHt9oLpHe/pLD4Z0dlvparxpOO5cwSPpEQTDy9sjFCVRUiDhCk5z6GRzvu8hhdujMGG/elUvwskV2FMg2RnV46XdqVahS9uP7FMrIwf777kc42EvxZ8bZx7wFKCz7gs9SjbvAc1P6SVFeIBVvIfdKpK2+OfTYNhl7sfsWgHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M71pxxpG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f72c913aso1475706e87.1
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 04:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730983739; x=1731588539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzpE9qb2EMxQWUJItUkvqlNcakV4YKBc1CCxaGXFbWA=;
        b=M71pxxpGOmn29RW5wGpq/n7cqSGDyIHq0jEqqqaBAL2S7rc9Ovmf+rhPivP3iCqCmW
         ltsgC0sT0jJYEOUpm9k8yF7Vlwt27QNBOOQ0Ni2j3JI3NkfHALNZilX2nN6+nJonnlTJ
         ocpstvMrxndQtkytkXhU+Ioj/RtMxQkGqF1xjNhmMnIKgfyK1dmMOsb+FybKE5f4CGbI
         hf5ThhwE+Y2WULPC46dMplvvkuN3KaIngFgqzrYLoVI6Vi7Qbn5WQnpqBjaAFXoQbf/c
         0hASWgGz4ecPjCXlCY1VmzRvHd+JRPbXX2c95KpoFMzc9hcUqLgQozbtcgZDS15dEPqj
         RBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983739; x=1731588539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GzpE9qb2EMxQWUJItUkvqlNcakV4YKBc1CCxaGXFbWA=;
        b=uLwQFGjg3XEviZoQ8lSZ5u6GjEcCyGfYM+FNMdT5CrZ8gb2o5S4zajUgoDzyXprY7I
         +kPRSBlW0SWB3NfoswKonq9T8djpMTr945Q3e12vxfHlxD1/O4rcNX1zqKt+llePjxYp
         VnlpDBec6mKoZ4k3FlfOkKRisuNMfcciDvzl6RIMaPE0jWHVRgef5bu5N2nRA/qFxX9L
         Ta+PPK9e6cYW6CONT4y0JAXofGpKDH118Q15Z92R9PWsGsS+91P/t4XMIRRZ0IsfgyrW
         1+xiudcIjnl9xedtQZN5cBQ9itVhYWwAJXk8e0Q+KwsjUC7xzQyOOBgik2iFdwRoTO17
         jEzw==
X-Forwarded-Encrypted: i=1; AJvYcCU8xPwPJI4ag6e/8O8fn1kFDzzCLYWG+d6asabRnggwe3ja/cLVMl1BybGqlOJ74L3LX71mAqxqyTQV2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0RYs9zDEMD0wktAsmjFgl9MmEEc771cWRP4yUbEZjzml/EPZ
	vfv96XxZJP777S/4SeOKXSt0M+0IYyw0jGao9flk+1xhNNimcXe4
X-Google-Smtp-Source: AGHT+IE6M7yjAgTJlsZNN5RYDp+9fpOvsDh+TelDAquVRAwgpPO+/VegtcIcWvQFwBtCy2cpEMlqeg==
X-Received: by 2002:a05:6512:159a:b0:52e:7542:f469 with SMTP id 2adb3069b0e04-53b34721a76mr23342734e87.0.1730983738231;
        Thu, 07 Nov 2024 04:48:58 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b3de8710sm8481375e9.17.2024.11.07.04.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:48:56 -0800 (PST)
Message-ID: <ad7dd75e-ae60-436f-a0e7-0207d21934ae@gmail.com>
Date: Thu, 7 Nov 2024 13:48:54 +0100
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
 <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
 <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 07.11.24 um 12:29 schrieb Tvrtko Ursulin:
>
> On 28/10/2024 10:34, Christian König wrote:
>> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>>
>>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/10/2024 13:41, Christian König wrote:
>>>>> Reports indicates that some userspace applications try to merge 
>>>>> more than
>>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>>> kzalloc() that the requested size becomes to big.
>>>>>
>>>>> While that is clearly an userspace bug we should probably handle 
>>>>> that case
>>>>> gracefully in the kernel.
>>>>>
>>>>> So we can either reject requests to merge more than a reasonable 
>>>>> amount of
>>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>>> kzalloc().
>>>>> This patch here does the later.
>>>>
>>>> Rejecting would potentially be safer, otherwise there is a path for 
>>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>>> and spam dmesg at will.
>>>
>>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>>> invent a limit. Up for discussion I suppose.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Question is what limit to set...
>>
>> That's one of the reasons why I opted for kvzalloc() initially.
>
> I didn't get that, what was the reason? To not have to invent an 
> arbitrary limit?

Well that I couldn't come up with any arbitrary limit that I had 
confidence would work and not block real world use cases.

Switching to kvzalloc() just seemed the more defensive approach.

>
>> I mean we could use some nice round number like 65536, but that would 
>> be totally arbitrary.
>
> Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
> is avoided? Or pass __GFP_NOWARN?

Well are we sure that will never hit 65536 in a real world use case? 
It's still pretty low.

>
>> Any comments on the other two patches? I need to get them upstream.
>
> Will look into them shortly.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> Thanks,
>> Christian.
>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> CC: stable@vger.kernel.org
>>>>> ---
>>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>>> b/drivers/dma-buf/dma-fence-array.c
>>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>>> dma_fence *fence)
>>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>>           dma_fence_put(array->fences[i]);
>>>>> -    kfree(array->fences);
>>>>> -    dma_fence_free(fence);
>>>>> +    kvfree(array->fences);
>>>>> +    kvfree_rcu(fence, rcu);
>>>>>   }
>>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>>> *dma_fence_array_alloc(int num_fences)
>>>>>   {
>>>>>       struct dma_fence_array *array;
>>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>>> GFP_KERNEL);
>>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>>> GFP_KERNEL);
>>>>>   }
>>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>


