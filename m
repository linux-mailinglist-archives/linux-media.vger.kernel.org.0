Return-Path: <linux-media+bounces-25399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE7A21B6C
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 11:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59AE41635C9
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 10:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8F01B6D12;
	Wed, 29 Jan 2025 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iyqd9Nku"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F71B5ED1
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148204; cv=none; b=QWq5S6Z09uVoLHvOZQJUhqbsfOKbdGtj5LkJaSkrRH4F/JFcyED5MAHvipdpu3y1bZzmaNH7eBEL2Kf3h5U3fm6SjaJipPNuDkR+ZtZzS1r+iaK5FVgGh9XkbyrShAmGof2whlMvomAnCPn8jNa1cem8QGmElI4XH3IWlcB194c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148204; c=relaxed/simple;
	bh=UHOu6l9+KJBTWQCy49qHNJWwO96FUq05KvdCattcvn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brzbWjesHOTgkJX46fMWC+yTkm1wKSA0sBs6H56rsxXIAOrAGnQ8b4uoEboIZEij9Ft5tj8sjOLcb1ECMlbdn+3VMsL5f6tGQELRpE6t+wyCd6zuhe0ouBnKRJLgXDjHNphFcwag96v8UHnfGIECPG38f+rQ+EsGmmc3EqOU/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iyqd9Nku; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3596018f8f.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 02:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148201; x=1738753001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FosXnzccXLV0I1LGd8gcU7Ut4sPZEcpMdWT78sKoJ3I=;
        b=Iyqd9NkuV0PLb9efuQjXxkBl+Ll+EfunsDspKVp4ypayAjoYC6755LFAHAfdQAakgS
         E0bUAlmCyg5TxaHNbnlIEjyjR07cGourbb0dFSvuo1YGSrdPXq0X05NTSJ26DiOK4AUg
         FBq4Har7psJEGJkmRkDuz1TaVNZbnokaMxgyLnT2nFsVKW0+vhsrbXb1ndsyl5Cvp9WN
         yBfZl3VmjURBiLoDRm7cZS3lfLa2KX89Ikfs0h75ldeXHy8mz7ENYN4RxgqE/2aHZnOg
         ztyPYu2OgQjMMQ4J5Fhs2HtkHUHbORJWQiBDuD7NVV4YbNak5/0qRmsEnxvEfaZR7/2D
         oHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148201; x=1738753001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FosXnzccXLV0I1LGd8gcU7Ut4sPZEcpMdWT78sKoJ3I=;
        b=JviPlLjFbUQZ9Sf3YWAdyCy2r8HyCkDCsbBtDqbx78zLqeBc01j5SCAj8MUlAx5tlb
         mAnwQS4eoeTQXID0vG+ezeA4JN8vFV7QnSXfypSbXhOIsJ2j1pvTs8py+2YvZD+mAsEF
         K+XBdZCerVnryhmM7w2EHCavrnzKTq9/mprtL27QS97nVKxu86b77Poqh/vG6elfRPw+
         BwuHLba0F22kbDKjcGWFTcF/vSgT3NzADMSTd6aeMdp7y2VuUNmDt7YM8oGFryLcE+7N
         OqlV2vGGdJNfKXjrbBtId9oU2PvELQhiTfKvzfGU8wLDDAxFc80fX/OvaiUQAPs6+4+1
         +xFw==
X-Gm-Message-State: AOJu0Yyc2mkLmoukzkEoE5BcyQ3NwcDcX59CGDJb+Sw7MiCwLodUBVIh
	CUUKwCi3s6sM+KnAnG+d2SCBff38Rt9T31hxugjMcR9LNs8BgorM
X-Gm-Gg: ASbGncvkBiBTKXt4zIpj7YsmjdSmsKxPd6AFS81M3MvavNm6KxMMnLwVdJdL6KkCS2p
	S0yiYbgKxzMfoKAGou2qyDPUqxX5St01QMVO9Qp1gk41ut4zoH2eTlKOirbAPupbLsV4kaeSHki
	nZdzKXPuXFPM0YE23I/I+UiQwgt1QVTsQiPcXHJQc4gsqLaM+g607steVIncdgJC8cBxnxsOX1K
	SbvFqGv3e04j5ySw3JxDZbmUiKyheFM5LnQQ0xq+VzfCHf0B7vT5w7SHwqM//VHc1YcGWoPoen4
	Y4EFJvcM77RPySHtSva6phNWcX2Dp8YceOoBKiU1WctG
X-Google-Smtp-Source: AGHT+IH6skENIXQ60OxDQBSAhPlvZIj8ntXrMXYQO57C4HwGjLw4O7NNaHOpEBbMLZg8FziO87RS4A==
X-Received: by 2002:a05:6000:1884:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-38c5195f6bemr2182113f8f.19.1738148200405;
        Wed, 29 Jan 2025 02:56:40 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm16982880f8f.50.2025.01.29.02.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 02:56:40 -0800 (PST)
Message-ID: <25c09c95-869e-488a-a031-f4faa8aa6307@gmail.com>
Date: Wed, 29 Jan 2025 11:56:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
To: Lucas Stach <l.stach@pengutronix.de>, marek.olsak@amd.com,
 sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250128100833.8973-1-christian.koenig@amd.com>
 <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
 <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
 <e21418ab4f1e82d322569ef2d4a481c564a1040c.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e21418ab4f1e82d322569ef2d4a481c564a1040c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.01.25 um 15:41 schrieb Lucas Stach:
> Am Dienstag, dem 28.01.2025 um 15:28 +0100 schrieb Christian König:
>> Am 28.01.25 um 11:48 schrieb Lucas Stach:
>>> Hi Christian,
>>>
>>> Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian König:
>>>> Even the kerneldoc says that with a zero timeout the function should not
>>>> wait for anything, but still return 1 to indicate that the fences are
>>>> signaled now.
>>>>
>>>> Unfortunately that isn't what was implemented, instead of only returning
>>>> 1 we also waited for at least one jiffies.
>>>>
>>>> Fix that by adjusting the handling to what the function is actually
>>>> documented to do.
>>>>
>>>> Reported-by: Marek Olšák <marek.olsak@amd.com>
>>>> Reported-by: Lucas Stach <l.stach@pengutronix.de>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Cc: <stable@vger.kernel.org>
>>>> ---
>>>>    drivers/dma-buf/dma-resv.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 5f8d010516f0..ae92d9d2394d 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>>>>    	dma_resv_iter_begin(&cursor, obj, usage);
>>>>    	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>    
>>>> -		ret = dma_fence_wait_timeout(fence, intr, ret);
>>>> -		if (ret <= 0) {
>>>> -			dma_resv_iter_end(&cursor);
>>>> -			return ret;
>>>> -		}
>>>> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
>>>> +		if (ret <= 0)
>>>> +			break;
>>>> +
>>>> +		/* Even for zero timeout the return value is 1 */
>>>> +		timeout = min(timeout, ret);
>>> This min construct and the comment confused me a bit at first. I think
>>> it would be easier to read as
>>>
>>> /* With a zero timeout dma_fence_wait_timeout makes up a
>>>    * positive return value for already signaled fences.
>>>    */
>>> if (timeout)
>>> 	timeout = ret;
>> Good point, going to change that.
>>
>>> Also please change the initialization of ret on top of the function to
>>> ret = 1 so it has the right value when no fences are present. Now that
>>> you use the timeout variable for the fence wait, there is no point in
>>> initializing ret to the timeout.
>> When no fences are present returning 1 would be incorrect if the timeout
>> value was non zero.
>>
>> Only when the timeout value is zero we should return 1 to indicate that
>> there is nothing to wait for.
>>
> Uh, yea didn't think about this.
>
> Honestly, making up this positive return value requires one to think
> really hard about those code paths. This would all be much cleaner and
> the chaining of multiple waits, like in the function changed here,
> would be much more natural when a 0 return would also be treated as a
> ordinary successful wait and timeouts would be signaled with ETIMEDOUT.
> But that's a large change with lots of callsites to audit, maybe for
> another day.

Yeah, I've suggested that before as well.

But the wait_event_timeout* interfaces follows the same convention: 
https://elixir.bootlin.com/linux/v6.12.11/source/include/linux/wait.h#L393

So we used with that for some reason. My educated guess is that it made 
migration easier because drivers were using wait_event_timeout* before 
dma_resv/dma_fence was invented.

Regards,
Christian.

>
> Regards,
> Lucas


