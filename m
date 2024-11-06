Return-Path: <linux-media+bounces-21012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FE9BE672
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 13:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ADC7B250E6
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE441DE3CA;
	Wed,  6 Nov 2024 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLkyKWMd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791591DD0F5
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894348; cv=none; b=ikbGSlSPTlQqjiv6aYTJL2nM2HMLXMgfht3R48YMc/mERnMQ6s9E5NehQgo/HSlKsIBaR0T0LyOQ802TXzSCl/oJFQ7HTO+U/139wWieqX1ITUxOA1rS4hfY45L+9Dy2ylLlj6fewM6ovEjzC+8UkmuQxx4iU5zzFHePZZa47TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894348; c=relaxed/simple;
	bh=FMF6GbwjWAcxlmCx8res177zik8g/+jAb8V7q/0Egjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IBmEWy2NmTcm51p90fwiln/n0+1XYoB2zUdl9VVwOa36M2roVKpJInWj1bh44IpbroyMtmWDELVXpi45wh7AH72Tggx1SG+DvHGCRWXSO/m5asPBIypDdb7zV2VfXGLK/dVzBZRzEsuGyiHdPUsKaLphOnUK2LnveHVMD5geWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLkyKWMd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so4467701f8f.2
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730894345; x=1731499145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Y87pMnWFoa3I37VV8/r2muz4wO+tB140v+PKTUy8BI=;
        b=gLkyKWMdV76y4kwDTXEEEliJ4FxHweP02tBercvvm9suVaR5GIUiq4qkK7lEM/x5Bl
         eMQj+u9/t+DNxNuTNkho2ddpuH/0DjLgMnBE8h8tfIny9t16IHbWmlal5eVzqDZlZtG+
         nNxdXW0hzIy/jKu1dhFJdLXdzdEkW/cXotdAaMFa/TsEN7s/6wl6vRlKP7qIJAAY6fAK
         xj11ww703i/jO0RigShDaqmd6JF6OOIOOSM9FvJWIHv+DHbYhr3TFoiER9myGOqPtnlR
         jT37EPN0LjlNXz3fixmHxVxVj2ndN0GtL6h6mUItbm8vCBeW/ICKv46IHYHwY1ll3FNz
         556g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894345; x=1731499145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y87pMnWFoa3I37VV8/r2muz4wO+tB140v+PKTUy8BI=;
        b=Wh0zjnE7cEibCh7EVD/oJjmxX+ijadS56UwT4yli8MR5u05Bs1X47B/E2bYtYgUddK
         yIwwGIyxCnljgAS4+ZJGg3l0DASuIYGi/32xJADzE/pw3ahFWer7lWOFLCf3j5CkeDEF
         fqmylkThRG/rmoMbYpzxd+ADiKqWexhwKwi3bIp9fML7s8drx+1kPKa2sSqusDZN3OsV
         H/cySBG/zm6PvpsHwC8mBWmIYTbZp5vMruvPZb5ItJ432e+p5/vOG0FMBU5uuCrNo9p8
         OGHxZ3Zyubch8haPF+t94tc+VAMgpVoie2PsfiB2Ffijme1lU/sy4St2+ZZpqzdS8S+t
         5ohw==
X-Forwarded-Encrypted: i=1; AJvYcCUs7fiuep1JwpLjqUGuJiEGGVEEPCZusd/hqJ4DX07mq8XHqkIG1CPbtdwunM45IG9PU2vT6ThtJFosFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9FTIMhjrbfThgFzTRJdhgXdwC/aKAzOJgyoMPoES3V+FmF2+
	hcbz965K2NhaUH98jDX7YPtapQ40Kkp1FIrTcU0q2BgE+7b0CT3+EIMvlLyX
X-Google-Smtp-Source: AGHT+IFg9E6elVz+or/lQqOgtLdlpoV/nnD8qYAb6a9NpLfMMZrK3a1k2HMk8oyLpqzu9iyteOFbmQ==
X-Received: by 2002:a05:6000:2805:b0:37d:4657:ea7d with SMTP id ffacd0b85a97d-381bea26687mr12845863f8f.49.1730894344497;
        Wed, 06 Nov 2024 03:59:04 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a7a6sm18893363f8f.92.2024.11.06.03.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 03:59:04 -0800 (PST)
Message-ID: <1a93003c-44fb-416a-9446-8f74d6121a98@gmail.com>
Date: Wed, 6 Nov 2024 12:59:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: Friedrich Vock <friedrich.vock@gmx.de>, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
 <c93698d1-5b83-4314-bf9f-d1540d5cdf2d@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c93698d1-5b83-4314-bf9f-d1540d5cdf2d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.10.24 um 19:10 schrieb Friedrich Vock:
> On 24.10.24 14:41, Christian König wrote:
>> The merge function initially handled only individual fences and
>> arrays which in turn were created by the merge function. This allowed
>> to create the new array by a simple merge sort based on the fence
>> context number.
>>
>> The problem is now that since the addition of timeline sync objects
>> userspace can create chain containers in basically any fence context
>> order.
>>
>> If those are merged together it can happen that we create really
>> large arrays since the merge sort algorithm doesn't work any more.
>>
>> So put an insert sort behind the merge sort which kicks in when the
>> input fences are not in the expected order. This isn't as efficient
>> as a heap sort, but has better properties for the most common use
>> case.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
>>   1 file changed, 34 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..d9aa280d9ff6 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -106,7 +106,7 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>           fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>>
>>       count = 0;
>> -    do {
>> +    while (true) {
>>           unsigned int sel;
>>
>>   restart:
>> @@ -144,11 +144,40 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>               }
>>           }
>>
>> -        if (tmp) {
>> -            array[count++] = dma_fence_get(tmp);
>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +        if (!tmp)
>> +            break;
>> +
>> +        /*
>> +         * We could use a binary search here, but since the assumption
>> +         * is that the main input are already sorted dma_fence_arrays
>> +         * just looking from end has a higher chance of finding the
>> +         * right location on the first try
>> +         */
>> +
>> +        for (i = count; i--;) {
>
> This is broken. The first iteration of this loop will always index out
> of bounds.

Nope, that is correct. The condition is evaluated before the loop, so 
the i-- reduces the index to the last element in the array.

Regards,
Christian.


> What you probably want here is:
>
> +        for (i = count - 1; count && i--;) {
>
> This intentionally overflows for count == 0, but the ++i after the loop
> undoes that. Maybe it would be worth a comment to point out that's
> intentional.
>
>> +            if (likely(array[i]->context < tmp->context))
>> +                break;
>> +
>> +            if (array[i]->context == tmp->context) {
>> +                if (dma_fence_is_later(tmp, array[i])) {
>> +                    dma_fence_put(array[i]);
>> +                    array[i] = dma_fence_get(tmp);
>> +                }
>> +                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +                goto restart;
>> +            }
>>           }
>> -    } while (tmp);
>> +
>> +        ++i;
>> +        /*
>> +         * Make room for the fence, this should be a nop most of the
>> +         * time.
>> +         */
>> +        memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
>
> Need memmove here, src and dst alias.
>
> I took it for a spin with these things fixed and it seemed to resolve
> the issue as well. How do you want to proceed? I guess I would be
> comfortable putting a Reviewed-by and/or Tested-by on a version with
> these things fixed (with the usual caveat that I'm not a maintainer - I
> guess the process requires (at least one) reviewer to be?).
>
> By the way, I guess you might've had some internal branches where this
> fix needed to go into quick or something? Usually I'm happy to make a v2
> for my patches myself, too ;)
>
> Regards,
> Friedrich
>
>> +        array[i] = dma_fence_get(tmp);
>> +        fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +        count++;
>> +    };
>>
>>       if (count == 0) {
>>           tmp = dma_fence_allocate_private_stub(ktime_get());
>


