Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C2A494A12
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 09:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359474AbiATIvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 03:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359427AbiATIuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 03:50:51 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415D6C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 00:50:51 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so6366723wmb.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 00:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ko6KL9eo2/amN6Mkm8rkJt9A+k3vlAsHv5U99GctgVw=;
        b=mudBSflgmCVgxMfMnCti2aKgRfjy3SsdsOzbU1Eobjq0FtoFaPNeAQUgOiQUfsywKC
         eaZEzlJ2l3FkgUKf/FAvTI0IJfSjDB8WjsfDF4MW2SC6mUtuTpqKgnug7QoxgFZ6jj2y
         he2MazseQFGXxIP0GMQrZWNqwKke4d6Epqc7j7etPBh0WyE4bHhybIBvwMfTnkN+sxo3
         kn+v1cXrtNQC0Ib8Z2+Yj//CuNjNiQJYynXdNmgGocE9QY/WXicnE0T8nVL6RvBQsnP4
         pFStQM/91rOGzV7+3zazEM0vXEjbrmUsdkQC1oHnxY6RLYr55DLUfHpRlVTPDKUC7Bmd
         o3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ko6KL9eo2/amN6Mkm8rkJt9A+k3vlAsHv5U99GctgVw=;
        b=AKip6uOo3mPuBvgtV6a9XQO7X5mfdHc0KpPOV7QuqMgJ5U1e3NH2pApCk7gZge8v0x
         xqLEbXdyzY15iLQThOkW7tPBv79pL1z19YpDO7uXFj+dnQiI5UG3c8vs5WuxNX9JZX8B
         VcUeesRDgOo3ZK+yOBBoYb7NkrLNnpRE389ewyahjgH+ZbQGfvLWNGOl+9oL9JuVYBvW
         IB2QPDckFfKSswS+A4v+ToPwSn35gjdMz1F9bPd0LsniUg7XTjeJ99sVr9FNW55GNTEu
         zV/82+SXVIB+FqTmK0xjikgSGcPkF+I7IqOFozDkmKZxOu6/XURJrk76qzz4hYrCMd4D
         vEdw==
X-Gm-Message-State: AOAM533zO1gfDT++n9y+EwdCEt8MXAMu2QkTVap4Ca0KCwzSYqpLdvfQ
        KaceBDCClCi3v53mrGKFXRQ=
X-Google-Smtp-Source: ABdhPJx95ZJNeIu0qZQZdChuFJEWtlTJdxUxS2ff/zIsq0hpP3JIZVsYxNZgwU2vQtGPjj87idBBdg==
X-Received: by 2002:a7b:cd81:: with SMTP id y1mr7883640wmj.4.1642668649697;
        Thu, 20 Jan 2022 00:50:49 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id d6sm2088784wrs.85.2022.01.20.00.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 00:50:49 -0800 (PST)
Subject: Re: [PATCH 1/4] dma-buf: consolidate dma_fence subclass checking
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <YehHX7ID/of9kxmE@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <364f8edb-07b5-c1b4-71ea-0003b45ce7e3@gmail.com>
Date:   Thu, 20 Jan 2022 09:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YehHX7ID/of9kxmE@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.01.22 um 18:16 schrieb Daniel Vetter:
> On Wed, Jan 19, 2022 at 02:43:36PM +0100, Christian König wrote:
>> Consolidate the wrapper functions to check for dma_fence
>> subclasses in the dma_fence header.
>>
>> This makes it easier to document and also check the different
>> requirements for fence containers in the subclasses.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   include/linux/dma-fence-array.h | 15 +------------
>>   include/linux/dma-fence-chain.h |  3 +--
>>   include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>> index 303dd712220f..fec374f69e12 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -45,19 +45,6 @@ struct dma_fence_array {
>>   	struct irq_work work;
>>   };
>>   
>> -extern const struct dma_fence_ops dma_fence_array_ops;
>> -
>> -/**
>> - * dma_fence_is_array - check if a fence is from the array subsclass
>> - * @fence: fence to test
>> - *
>> - * Return true if it is a dma_fence_array and false otherwise.
>> - */
>> -static inline bool dma_fence_is_array(struct dma_fence *fence)
>> -{
>> -	return fence->ops == &dma_fence_array_ops;
>> -}
>> -
>>   /**
>>    * to_dma_fence_array - cast a fence to a dma_fence_array
>>    * @fence: fence to cast to a dma_fence_array
>> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>>   static inline struct dma_fence_array *
>>   to_dma_fence_array(struct dma_fence *fence)
>>   {
>> -	if (fence->ops != &dma_fence_array_ops)
>> +	if (!fence || !dma_fence_is_array(fence))
>>   		return NULL;
>>   
>>   	return container_of(fence, struct dma_fence_array, base);
>> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
>> index 54fe3443fd2c..ee906b659694 100644
>> --- a/include/linux/dma-fence-chain.h
>> +++ b/include/linux/dma-fence-chain.h
>> @@ -49,7 +49,6 @@ struct dma_fence_chain {
>>   	spinlock_t lock;
>>   };
>>   
>> -extern const struct dma_fence_ops dma_fence_chain_ops;
>>   
>>   /**
>>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
>> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>>   static inline struct dma_fence_chain *
>>   to_dma_fence_chain(struct dma_fence *fence)
>>   {
>> -	if (!fence || fence->ops != &dma_fence_chain_ops)
>> +	if (!fence || !dma_fence_is_chain(fence))
>>   		return NULL;
>>   
>>   	return container_of(fence, struct dma_fence_chain, base);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 1ea691753bd3..775cdc0b4f24 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);
>>   
>> +extern const struct dma_fence_ops dma_fence_array_ops;
>> +extern const struct dma_fence_ops dma_fence_chain_ops;
>> +
>> +/**
>> + * dma_fence_is_array - check if a fence is from the array subclass
>> + * @fence: the fence to test
>> + *
>> + * Return true if it is a dma_fence_array and false otherwise.
>> + */
>> +static inline bool dma_fence_is_array(struct dma_fence *fence)
>> +{
>> +	return fence->ops == &dma_fence_array_ops;
>> +}
>> +
>> +/**
>> + * dma_fence_is_chain - check if a fence is from the chain subclass
>> + * @fence: the fence to test
>> + *
>> + * Return true if it is a dma_fence_chain and false otherwise.
>> + */
>> +static inline bool dma_fence_is_chain(struct dma_fence *fence)
>> +{
>> +	return fence->ops == &dma_fence_chain_ops;
>> +}
>> +
>> +/**
>> + * dma_fence_is_container - check if a fence is a container for other fences
>> + * @fence: the fence to test
>> + *
>> + * Return true if this fence is a container for other fences, false otherwise.
>> + * This is important since we can't build up large fence structure or otherwise
>> + * we run into recursion during operation on those fences.
>> + */
>> +static inline bool dma_fence_is_container(struct dma_fence *fence)
> Code looks all good, but I'm not super enthusiastic about exporting the
> ops to drivers and letting them do random nonsense. At least i915 does
> pretty enormous amounts of stuff with that instead of having pushed
> priority boosting into dma-fence as a proper concept. And maybe a few
> other things.
>
> Now i915-gem team having gone off the rails of good upstream conduct is
> another thing maybe, but I'd like to not encourage that.
>
> So could we perhaps do this all in header which is entirely private to
> drivers/dma-buf, like dma-fence-internal or so? And maybe whack a big
> fixme onto the current abuse in drivers (of which __dma_fence_is_chain()
> gets a special price for "not how upstream should be done" *sigh*).

WTF is __dma_fence_is_chain? Seeing that for the first time now.

And yes even if you do priority boosting manually that code in i915 is 
just way to complicated.

I'm sure you don't have any objections that I clean up that mess now you 
pointed it out :)

Thanks,
Christian.

>
> Cheers, Daniel
>
>> +{
>> +	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
>> +}
>> +
>>   #endif /* __LINUX_DMA_FENCE_H */
>> -- 
>> 2.25.1
>>

