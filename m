Return-Path: <linux-media+bounces-21073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022239C0AA7
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 17:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 837D31F252B6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 16:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B57F17BB0F;
	Thu,  7 Nov 2024 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="q4oezCDj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8BE4AEE0
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995240; cv=none; b=V9prv7ds1pGhqHssQVUxtPLXx/2VIhf8XJmAyQWWFbHfuL6ljFntrrWGsDtt7Hhb3U0QTeIhvmBJ0hIN1zz/Tvy+cpOgHJF/xMq35HcCwN8GiRAbwjhR82BA0Rgaxrc1iGuiICldjvxQhur+BQcqKU9RXdSdDY49JIePOnhkYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995240; c=relaxed/simple;
	bh=tYb4rU6fZJxxs1jdPCy9sDoeNu7URfxOeiedScflVlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G4Th6kK91GpWzIhgD5un866hg9Vdw791XaFVFNyuKkm1Rm7lk1gEUWLqBCjhnJ9FOcdpDTqgltaDshhP6X2ixDOpCykqYPRnoD77+CIlVkkUjScyLBip3Awprl5lV8OOPl7Qf8dFjB/nNVI/PrtGG3hfKGGdR8rCEjFUky3qhDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=q4oezCDj; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53c779ef19cso1276067e87.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730995237; x=1731600037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVJY4WgDUJnnXOzDvA54gLD2LW4WcBPotISDBySE6q0=;
        b=q4oezCDj3Keqmndug79RZ4xhQwIb/d8qM+wgUjdxlpakXbD05AzpqGPfesADqysK8D
         SFPs+XEaO6L0X0NHOk5qwUrp3n1srypXOSm2XSXhmGMXcfMQuAi8ymrTTmAURQHLoBSG
         8Pw7wbGYvhvbWMU4WoLU/tNKTF0Q7bAdJ3KXhmx7q8ca+MytcaKb12AcPeCTA6uUv1Vc
         klv1vWzjMWm/KtTFmi0xgy/HZMb385rv2lIF/fmERSKGY913YgSm4n4/V7wdFTMtfSxf
         BhdGrA6DXyx8FtTkKD9mybbl4csgVKhmiwCOB4rf/TeVcJhKaXUXC/70Iy/USNAVMm6R
         rCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995237; x=1731600037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVJY4WgDUJnnXOzDvA54gLD2LW4WcBPotISDBySE6q0=;
        b=XlXsjYS5coWvJCezd3YIbU4QlLY8cUWko1k3dYvqR8v9m9YrGWKmNTdLXTfqVWropH
         yHwgsVNdq1fDvR9O4296ODWUKx/PE7yIiUnbJ6mEzxZJ2PQ/BtD4G9zadZ/Tn1UNfu+6
         SACLVo4iiX9IEpXn+1QZgzl8CS1cdwJuYqvRTrR3hp1uYQYKChnRrD/l9tN9pwQMrl2f
         M+8CGWy4dCPsX9R1sY5u+ahAby1AciPF3VCxiwUKHVg02CdpXLDDfKOyBo8Yi8quWYcn
         ezeg6FeWfnn/zfe4VdieeU0OyEoG0dAdYNijVBnAL3alAMnxRuMsLsZuqDt4VFMY1IKV
         Dxig==
X-Forwarded-Encrypted: i=1; AJvYcCXJszef9tprtQ0JlKDOEd93zD61SG5vNB5+NL1+y8KDhEECZeqPC9ZKvoJXKTzSwkZkWjz0DqML8KEEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5JS1uGZ7HSVSGjuO+n9TUCJXTd4uQOHMvNSnM+ebzVsYVseP
	c4jsXYCpPf3XFyq+01rQb/MicJNsgR+eKg2onsayaEuyzfEQNRZZpR7ANp7Xg8A=
X-Google-Smtp-Source: AGHT+IEkRBv31IQHDcCUliUShKwtu/OJIya3n3E7DYCttdJ5QA5CftK9w2Ce95teCeAZ5BCMWxF5Hg==
X-Received: by 2002:a05:6512:12cd:b0:53a:bb7:ed77 with SMTP id 2adb3069b0e04-53d8590a202mr342631e87.14.1730995235879;
        Thu, 07 Nov 2024 08:00:35 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a26a6da1sm68212035e9.0.2024.11.07.08.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 08:00:35 -0800 (PST)
Message-ID: <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
Date: Thu, 7 Nov 2024 16:00:33 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241024124159.4519-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/10/2024 13:41, Christian König wrote:
> The merge function initially handled only individual fences and
> arrays which in turn were created by the merge function. This allowed
> to create the new array by a simple merge sort based on the fence
> context number.
> 
> The problem is now that since the addition of timeline sync objects
> userspace can create chain containers in basically any fence context
> order.
> 
> If those are merged together it can happen that we create really
> large arrays since the merge sort algorithm doesn't work any more.
> 
> So put an insert sort behind the merge sort which kicks in when the
> input fences are not in the expected order. This isn't as efficient
> as a heap sort, but has better properties for the most common use
> case.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 628af51c81af..d9aa280d9ff6 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -106,7 +106,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>   
>   	count = 0;
> -	do {
> +	while (true) {
>   		unsigned int sel;
>   
>   restart:
> @@ -144,11 +144,40 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   			}
>   		}
>   
> -		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> -			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		if (!tmp)
> +			break;
> +
> +		/*
> +		 * We could use a binary search here, but since the assumption
> +		 * is that the main input are already sorted dma_fence_arrays
> +		 * just looking from end has a higher chance of finding the
> +		 * right location on the first try
> +		 */
> +
> +		for (i = count; i--;) {
> +			if (likely(array[i]->context < tmp->context))
> +				break;
> +
> +			if (array[i]->context == tmp->context) {
> +				if (dma_fence_is_later(tmp, array[i])) {
> +					dma_fence_put(array[i]);
> +					array[i] = dma_fence_get(tmp);
> +				}
> +				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +				goto restart;
> +			}
>   		}
> -	} while (tmp);
> +
> +		++i;
> +		/*
> +		 * Make room for the fence, this should be a nop most of the
> +		 * time.
> +		 */
> +		memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
> +		array[i] = dma_fence_get(tmp);
> +		fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		count++;

Having ventured into this function for the first time, I can say that 
this is some smart code which is not easy to grasp. It could definitely 
benefit from a high level comment before the do-while loop to explain 
what it is going to do.

Next and tmp local variable names I also wonder if could be renamed to 
something more descriptive.

And the algorithmic complexity of the end result, given the multiple 
loops and gotos, I have no idea what it could be.

Has a dumb solution been considered like a two-pass with a 
pessimistically allocated fence array been considered? Like:

1) Populate array with all unsignalled unwrapped fences. (O(count))

2) Bog standard include/linux/sort.h by context and seqno. (O(count*log 
(count)))

3) Walk array and squash same context to latest fence. (Before this 
patch that wasn't there, right?). (O(count)) (Overwrite in place, no 
memcpy needed.)

Algorithmic complexity of that would be obvious and code much simpler.

Regards,

Tvrtko

> +	};
>   
>   	if (count == 0) {
>   		tmp = dma_fence_allocate_private_stub(ktime_get());

