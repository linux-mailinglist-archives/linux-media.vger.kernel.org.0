Return-Path: <linux-media+bounces-20304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC299AFDA3
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 11:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBDB1F230A2
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC361D4159;
	Fri, 25 Oct 2024 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="XjG2SqU1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98F18BB8A
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847115; cv=none; b=hcKSci0R2PsvhoRk3AX9rAm7Km4+Ly9B15Qrp0ccEbkrcihdopogyYqK0XwapCBcxxRZomFNw4tn867wny6nQcndHzxx1x3lT61f9ywGkEh5c7l8Vt9i9zW55Oe1gjernhRPUEIpuVZ770anqrOQPxUM7HktWq5ZPNFAxIKTii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847115; c=relaxed/simple;
	bh=SUWIaBh39Be2aegLLPEiiahYfVf5gW7kfvUC747+nPs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=eDWB8CFqFk9izpfeJN2kETEsyZ2UGm0HmcOx85lYWQlmsYRWxgfDMwaT+NbMaZytuqFomLLWSZQ5nw9ZwpPXHhpiRXFsmNQ0gkLzvd8vY6UULtze/kdYUG1ftz5vgPw03gmCSY+WrYdtpSNxDTk9US+tnMh/9RUBWcAMS6mT2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=XjG2SqU1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43163667f0eso18151635e9.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1729847112; x=1730451912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+FmD+1g5YmX7z2WvYj0+39IceVpFqbsC33qjY9DeDs=;
        b=XjG2SqU1/K9N67IMJZXuX7j+hZjYK3r0b5ovRyq6GeI0Mw9oJTaDUIuE/mbQyo9LDA
         ZCg3GexDb4sVWJLsWhJmZPP30m7g53Q3qzwa+Q4hinbF3v2zEgbgbc7OwnV5muZI3LtT
         GRzsV56RfwG+0Sa5Fs7M0eNWgNzzXhkanvMxDufD9jEB8wTLX6OIwUvYHEc9GYh9PiOM
         fJaQ84tlb1RSG6EqzMD0Pfzauy2JYF+QkUU6trjYnEqRjcXLG5/NNz1r4bqr1hFEJ+ZR
         rfEfGO54yM3U7SHpGimCI0zXgXaZA3kQQ7QfQuID12teiG7pEdAdFxqFtbkwMIfNNA5W
         QfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847112; x=1730451912;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+FmD+1g5YmX7z2WvYj0+39IceVpFqbsC33qjY9DeDs=;
        b=LnIFzWSgDRNC9k5AcKSQtqBrsJvxXxVXCB0/5as8ZlAGzg1/aTcdSTyBONjkaJxpJ+
         OMUhB8ZvQwNNmM+rVWWvywks5Z0OJSOaPIEzvfMWjHA0kjaORe3zeYGIBkbHpcaCMyif
         2lhk0GmxclHSPNrMO4Aqyq//qgGIDvX4mTeyuObqtzK3CO2z2iRWOvNBBIqc/klbdS2m
         DH4/AUEqh/KMZhO9/UESN9KRKmFjbp2m3+/cZAtR1teQfoFBYtame6muPEF0M458u8sz
         HGg4y/VUBhzSLpUdRUoeQWSPJwfUWUEsN3ZVrhFs6dQFId2QxY8UvguprBMPOM0aFuCb
         qGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUV7I3ykbisy/comkn2MX4IDyLSAsBPhqjjpA48d4CicafXKVAocoSK3GpTwi+6vMq0cF8ut8CuMbR6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGe8w53L+HsAEdh3Q82PYkl51odqOiws+q32X5ypJTYSGK0VA
	JAjBcpdbFQT7x7cii5j3qfClI+QhW7JnoTBgMuWEOPOrjLteg5f9XuoP71DPdgaeoHi0L0YEwh3
	+
X-Google-Smtp-Source: AGHT+IHz1nhV2KxAfDSiXWpgPQjKyE1ZPc/R8nYAOHH2oKM6WUs3Sw/08dL41DzBItcxC9nvMo2Xmg==
X-Received: by 2002:adf:e386:0:b0:374:af19:7992 with SMTP id ffacd0b85a97d-37efcee8c34mr6359642f8f.7.1729847111698;
        Fri, 25 Oct 2024 02:05:11 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4461sm980136f8f.113.2024.10.25.02.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 02:05:11 -0700 (PDT)
Message-ID: <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
Date: Fri, 25 Oct 2024 10:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
Content-Language: en-GB
In-Reply-To: <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 25/10/2024 09:59, Tvrtko Ursulin wrote:
> 
> On 24/10/2024 13:41, Christian König wrote:
>> Reports indicates that some userspace applications try to merge more than
>> 80k of fences into a single dma_fence_array leading to a warning from
>> kzalloc() that the requested size becomes to big.
>>
>> While that is clearly an userspace bug we should probably handle that 
>> case
>> gracefully in the kernel.
>>
>> So we can either reject requests to merge more than a reasonable 
>> amount of
>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>> kzalloc().
>> This patch here does the later.
> 
> Rejecting would potentially be safer, otherwise there is a path for 
> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) and 
> spam dmesg at will.

Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
invent a limit. Up for discussion I suppose.

Regards,

Tvrtko

> 
> Question is what limit to set...
> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 8a08ffde31e7..46ac42bcfac0 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>> dma_fence *fence)
>>       for (i = 0; i < array->num_fences; ++i)
>>           dma_fence_put(array->fences[i]);
>> -    kfree(array->fences);
>> -    dma_fence_free(fence);
>> +    kvfree(array->fences);
>> +    kvfree_rcu(fence, rcu);
>>   }
>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int 
>> num_fences)
>>   {
>>       struct dma_fence_array *array;
>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>> GFP_KERNEL);
>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>> GFP_KERNEL);
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_alloc);

