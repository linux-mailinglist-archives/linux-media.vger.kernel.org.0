Return-Path: <linux-media+bounces-25337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8049A20C0D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 268FF163DE1
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F991A9B29;
	Tue, 28 Jan 2025 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8SgDWct"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB4519F111
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738074493; cv=none; b=BoxetsXOs2hE17hID7O4kx9TDGgbm5zmxdFz83hEblGOIdfWpoDGonArs827GDKSwyMm/S+D3jHtnTnXqaHTlc9+8as1u1ipgYK8pM4LqXekoZTGNtbfPz0QmsaHyn58OD09SJQJ9nmmSquXhSvNEV+21vh+ID/eRBV+R7XZIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738074493; c=relaxed/simple;
	bh=2frqtEar8ZoMWqkrpJr3LU48QwXxA9HCR5CW3MkpYhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuiUi6VGU0bD7S9JcJbtKS9w9sXCE/nIaB4h/HsF+zkD8T++33nTCr7sL9om4RXpH0wkCFmyzEjcLkoGKE+kx+HingOxU5GcwaZvOCnPSNtWTHKK8IMS0mfpHDKS3so6oaJPAeluONsXjqp5f0ZqdeEXZXLWi/262cy8AsRqYsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8SgDWct; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f664af5so65458175e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738074489; x=1738679289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ahk62Ar8Pu/DVCpXbGNGRvzN3jwVrKohGxX3J3gkK5A=;
        b=f8SgDWcth3i7kmUJz+YbVBM05Yg+voR70/V3J3IDkJ7aR6J53wsqArZhuXjzFRA0fF
         iEjq7mvvR2ol5f8AACITjG2+lLYKNfLyfhfSDfOvFEXLqEjWpLA9q4aES6AHVFDX2+Jo
         /mWW+tCc3CgEE849u9MqRdV11a9p8AdH9n4gpRYph7bvp7Lito25/QoVBe/8nWf/UOkX
         5SPEsdjalWt5EZgbU1bPKXLk3nMepyC80obydEcwAhWvE7UmwgylMCtp/jihu2bry+gb
         5/bWdbA2BN1p7s9r1sCHRHSBhujT5uGETjc0xVkdeK8LcVTM7SEZrEPHBu8XLBCV5jQj
         v8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738074489; x=1738679289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahk62Ar8Pu/DVCpXbGNGRvzN3jwVrKohGxX3J3gkK5A=;
        b=F65LsyekWiYQPisOIEMFZs1LlzbYqimZSgXgkd9GdINi1zA/MdM6uJBSNnt9WnzLSD
         mb9nk1Xt2bd+0yUQygXAT//H5GWYRqPKs0wfr2ZqTYe/sTKblqxJkMHffBo/nHbYxXfq
         KkHjvsaPtDhSAmFOyhL9m3bHxy1sskXp5f8IKtAcivP42xAY2SfJSJdJTC//5GHw4MIy
         IkFkACMWFbD842xRVGWY2b7fDTIbaNu0BIPQlH7BPxNTilBQqqfe6mAT0ZkNkCoZpbiR
         7X1nKUfGrsoKGvcvxQlwccnc3HgkpNwI9w7LeZkSS1z9ILploc6nGnQZWKOb1cw7hzvH
         sSFA==
X-Gm-Message-State: AOJu0YyTULTqAYlizvTOpKM48EwhpfFNy6XiOW3qUPTFe5sf6Mm5zvin
	+TYwxBTyGjToApjUozj//YRxzuGpFpHxURaHE5hfJ2IQz5HcuB7i
X-Gm-Gg: ASbGncs9ZhuMBA3sD00DQdRnZPEx4PczwBUpfeIqrxZ10zlDFzpvwm3lWiZ9UnPTSs5
	W6zAd3WdISdO7P3VaNg7LEz6jCEmcqbdvoAznlIIE98jxGRsiabMEOTJ1MmRUm6GAHCFwZ5J0Il
	y8vQl5wRM7FVlqjWtW0S64PReNn48LX+AQam8V2po4NpQRxlDzAGkDZQW7ewYakjDg8Ha6pSYyv
	p0rXvKh5b+56dPzJk+sgZwEv2slep0B04tJ+6PwdPOkbo5w0mhdAiHTbSc7TyFyBw0Hz8hpXU3L
	+2Gr10Y5MZrgOj3TqwAINGkF109j+0IHNq15dLX7FtVX/+HUpKZyQKo=
X-Google-Smtp-Source: AGHT+IGe4Gq0fWnPhR3Cs+lOYdtUwcTbBTKsiXhgWED++HD+8j7b1fZPRSoYalZO9TSPtYmFAQ2nWg==
X-Received: by 2002:a5d:5887:0:b0:38b:da31:3e3c with SMTP id ffacd0b85a97d-38bf56635c9mr38247686f8f.20.1738074488757;
        Tue, 28 Jan 2025 06:28:08 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bbd93sm14320932f8f.76.2025.01.28.06.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:28:08 -0800 (PST)
Message-ID: <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
Date: Tue, 28 Jan 2025 15:28:05 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.01.25 um 11:48 schrieb Lucas Stach:
> Hi Christian,
>
> Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian König:
>> Even the kerneldoc says that with a zero timeout the function should not
>> wait for anything, but still return 1 to indicate that the fences are
>> signaled now.
>>
>> Unfortunately that isn't what was implemented, instead of only returning
>> 1 we also waited for at least one jiffies.
>>
>> Fix that by adjusting the handling to what the function is actually
>> documented to do.
>>
>> Reported-by: Marek Olšák <marek.olsak@amd.com>
>> Reported-by: Lucas Stach <l.stach@pengutronix.de>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/dma-buf/dma-resv.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 5f8d010516f0..ae92d9d2394d 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>>   	dma_resv_iter_begin(&cursor, obj, usage);
>>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>   
>> -		ret = dma_fence_wait_timeout(fence, intr, ret);
>> -		if (ret <= 0) {
>> -			dma_resv_iter_end(&cursor);
>> -			return ret;
>> -		}
>> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
>> +		if (ret <= 0)
>> +			break;
>> +
>> +		/* Even for zero timeout the return value is 1 */
>> +		timeout = min(timeout, ret);
> This min construct and the comment confused me a bit at first. I think
> it would be easier to read as
>
> /* With a zero timeout dma_fence_wait_timeout makes up a
>   * positive return value for already signaled fences.
>   */
> if (timeout)
> 	timeout = ret;

Good point, going to change that.

>
> Also please change the initialization of ret on top of the function to
> ret = 1 so it has the right value when no fences are present. Now that
> you use the timeout variable for the fence wait, there is no point in
> initializing ret to the timeout.

When no fences are present returning 1 would be incorrect if the timeout 
value was non zero.

Only when the timeout value is zero we should return 1 to indicate that 
there is nothing to wait for.

Regards,
Christian.

>
> Regards,
> Lucas
>
>>   	}
>>   	dma_resv_iter_end(&cursor);
>>   


