Return-Path: <linux-media+bounces-21049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82B9C03FC
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 12:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79898B212C8
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D7D1FF059;
	Thu,  7 Nov 2024 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="IdSRRc2u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A81F76AE
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978972; cv=none; b=GGAFABDxddy6EYtb+oD85Dwd+8vTy4lQIrcwZOn9aS9/4/re0YLbmjup3lMHXI+OyNpcJ43n5XSkZ+wsSKC68vbUD/erfyCjvjJzg6AaVZIGmuvCIk+/QZqW9Ecj0KelarhYnE8/OWk0Vay07BXod45FkS0+daJRm1MQ9ickQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978972; c=relaxed/simple;
	bh=EFUt72fxj7zSmLiE+cxN2sA6nl5GOP3xzV8Vr4EdeuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jQQW9oXmKXN5AqpFKeDftcMCq9YQCl0T5D68fmq6TfZgInno+v2O0moo3ff9ac8M5I6z1xyR6/Ul8x9Pkc/Lz8OJvOHGaqwfO6P7DDpe8LhJI2CvCmTuQSaspnBev4yynMzMfR9GtHCjpmPUoyAsjqBAJ+N/h9iD3flaTeLxWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=IdSRRc2u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315baec69eso7575985e9.2
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730978968; x=1731583768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDPsSx73LywL/q27NrvbFNdAii7+R064iVsafnYXABc=;
        b=IdSRRc2u8Gbr2wC8yT4vDLq68TqIkdn4c9HnOyRVBBib9T7wuwOPtM3ZCduTNP9bWp
         8P68UGpN0+CDJaZyyz60saoSlW4in5jGqtPulOggM1AYteZ4hTRjdeUzrdthJVfSYCce
         oET2POIXiTaADL3gCYJn53XRkAB7QwDcAHWuTGGSq/qWqm4JUDrh1SiW1RVNqecqXNPl
         M4u3ZHR4QLKAZqqlFsEH/k2qlQLy0FQ7K/34zOJh2vAaxXlr8cBBEahfol1FOJSBqiJt
         xEs2jULr61sAIMnT7HEPc9lLNQmUu4s3glFvyZ+4jl+oRFIdS4X/YWt7NW/SlZ5ev2hi
         RbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978968; x=1731583768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDPsSx73LywL/q27NrvbFNdAii7+R064iVsafnYXABc=;
        b=F5WvtYmuhHhgAjVDZBj0He3XoxLIBjmuRLzodceOAG81IrcKXl1jNi89RCQNpKO4/4
         WnyaUME4fqTCSLEXvZlAhOocPmaMhwirZHB0Ac67aCqh/mXyFAsv/AM2hUB6cVM6ZlTV
         7BMDHTj18XKv9RQCWt0IHZZqNUI4A9ZT7vndvRgOoCFaMw/UhJjMji9CxmsztUCxAetB
         v+MaXcje279nf5v5OJmck2RED05NfK/MvPqpdvMjPYVfRouq6KpYXEWWmqfAbK8TbF64
         5jeLu4u73Yfe4iXRrsVKWD1eunUYmOeugEtDy+SSo3hp+n15ECt09idINM2H3j2tRaPK
         l0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXvdeicsU3WOwWkrO06fq6s1Ei5NW8dtImk7CdTeJdnHHB6Bobyc/up5pBKTqJpbqnJc8juVi3/a3NjGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtAW11l6qbEt/Nlh05q6FNoF4WpHn6QyOF0PbVqoCOfHxWe9UY
	XFi3UKY274Ap+cOmkSVD1Kimz9p3z+rHNWlQdEUe6NAsRb7Xp174m+JMPbURgI8=
X-Google-Smtp-Source: AGHT+IGJE0ZSy8KNC0lQcr9qTsV9YjSrpMVPplZP95jSq0f9t8AqspZLMFAJmyRPe0WOASupleafAA==
X-Received: by 2002:a05:6000:1844:b0:37d:481e:8e29 with SMTP id ffacd0b85a97d-381c7a5e1b6mr18626721f8f.25.1730978968368;
        Thu, 07 Nov 2024 03:29:28 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8f0asm1514125f8f.79.2024.11.07.03.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 03:29:27 -0800 (PST)
Message-ID: <bf40ee5e-c3f5-486c-9d23-57e48a4758f1@ursulin.net>
Date: Thu, 7 Nov 2024 11:29:27 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <6a8d4197-26ec-4d57-b5a3-98bc3008dfc2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28/10/2024 10:34, Christian König wrote:
> Am 25.10.24 um 11:05 schrieb Tvrtko Ursulin:
>>
>> On 25/10/2024 09:59, Tvrtko Ursulin wrote:
>>>
>>> On 24/10/2024 13:41, Christian König wrote:
>>>> Reports indicates that some userspace applications try to merge more 
>>>> than
>>>> 80k of fences into a single dma_fence_array leading to a warning from
>>>> kzalloc() that the requested size becomes to big.
>>>>
>>>> While that is clearly an userspace bug we should probably handle 
>>>> that case
>>>> gracefully in the kernel.
>>>>
>>>> So we can either reject requests to merge more than a reasonable 
>>>> amount of
>>>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>>>> kzalloc().
>>>> This patch here does the later.
>>>
>>> Rejecting would potentially be safer, otherwise there is a path for 
>>> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
>>> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) 
>>> and spam dmesg at will.
>>
>> Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
>> invent a limit. Up for discussion I suppose.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Question is what limit to set...
> 
> That's one of the reasons why I opted for kvzalloc() initially.

I didn't get that, what was the reason? To not have to invent an 
arbitrary limit?

> I mean we could use some nice round number like 65536, but that would be 
> totally arbitrary.

Yeah.. Set an arbitrary limit so a warning in __kvmalloc_node_noprof() 
is avoided? Or pass __GFP_NOWARN?

> Any comments on the other two patches? I need to get them upstream.

Will look into them shortly.

Regards,

Tvrtko


> Thanks,
> Christian.
> 
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> CC: stable@vger.kernel.org
>>>> ---
>>>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>>> b/drivers/dma-buf/dma-fence-array.c
>>>> index 8a08ffde31e7..46ac42bcfac0 100644
>>>> --- a/drivers/dma-buf/dma-fence-array.c
>>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>>>> dma_fence *fence)
>>>>       for (i = 0; i < array->num_fences; ++i)
>>>>           dma_fence_put(array->fences[i]);
>>>> -    kfree(array->fences);
>>>> -    dma_fence_free(fence);
>>>> +    kvfree(array->fences);
>>>> +    kvfree_rcu(fence, rcu);
>>>>   }
>>>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>>>> @@ -153,7 +153,7 @@ struct dma_fence_array 
>>>> *dma_fence_array_alloc(int num_fences)
>>>>   {
>>>>       struct dma_fence_array *array;
>>>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>>>> GFP_KERNEL);
>>>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>>>> GFP_KERNEL);
>>>>   }
>>>>   EXPORT_SYMBOL(dma_fence_array_alloc);
> 

