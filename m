Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76CE48443C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 16:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiADPIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 10:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiADPIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 10:08:23 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2483CC061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 07:08:23 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s1so76902261wrg.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=W9Bh3fUgumLp+/q/W4dvepebJC6o+IFE+HMv/nLlfio=;
        b=EFPEi1FUlJs6XPlFFfpKYRwWHX4RTpssWRFTbpKn1N5Fyq3bqyz5XabLFJqNv62XfB
         0cEqyJDxfBZmXXA0FEud20NLTAI1FoF7/xfAVYTaf5owDMGZU/9NWIkxGMxcsxnoKBfl
         CfDgi/O6Aq/PXRly1pl4GWco5U5S0YfyOu4/AxagKflnFYxxsTPcwsYnP5ZPoeCRXEdY
         k7HdbEy6lRrVcoXxVotVskERr6a3NLmnG+KeSVgIFDGqj+L+1TzGsTfAtYONWPnVYOKT
         TExmhBJs4zSgcrs+GsvWxe1UgufFwfqlAVQtrCy4EJBNWnyKcYENh5hdUgx/f3fEpicj
         TIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=W9Bh3fUgumLp+/q/W4dvepebJC6o+IFE+HMv/nLlfio=;
        b=SB0sjo2ZgH2VChFzPPXXsjMZz8EiNvU9a/3KeHzcOXZfrWVOVn3b4+I2wvbv0dpUkr
         7mbEhmzKHG3vC3ln9pxvGDJaPmPopXcPBoftKJfaxYn8rJmWYreVqjf2rXPBaY6oJNAZ
         UFWyIZeB89v0sBzVzj3FVLqSq5x9iDqOiuO+/yi7eEOroGBMttOXpNPyXT0zsp+iWQS5
         xBZ1hbain9pqDD4z5cI3orCuN+mJc9gyAVNFQVBJlHV/B0jRRVpg1FzbFDiV3B1TiWSR
         gp+6joR+DpVNAFvxGFmUgTv96USMOm1QSZwVZ3O/VgGICyYgzvpZ4P+L4ReGOd+PWCQL
         VX7w==
X-Gm-Message-State: AOAM530YGtbLAMr5q8x4gyiOAoG4qK7anyO4N2eGt4U91KEzuUrZ2vny
        0IHjFzLlTWj9O3Eh8Ulc4hE=
X-Google-Smtp-Source: ABdhPJwSMJ+2xGsiLFU6tc5hin8MGLy37GABx1tG7xE5ec2i5KTv5TLhulFWgyy/psXnhTyX6WVnnQ==
X-Received: by 2002:adf:f945:: with SMTP id q5mr12916536wrr.115.1641308901773;
        Tue, 04 Jan 2022 07:08:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:6d5e:a071:be8b:acf5? ([2a02:908:1252:fb60:6d5e:a071:be8b:acf5])
        by smtp.gmail.com with ESMTPSA id g5sm42662265wrd.100.2022.01.04.07.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 07:08:21 -0800 (PST)
Subject: Re: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv
 object
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-14-christian.koenig@amd.com>
 <YcOcASxfAApIpbrf@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d1fe9e3b-3d58-2aa8-36ae-9052192a2f0d@gmail.com>
Date:   Tue, 4 Jan 2022 16:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOcASxfAApIpbrf@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.12.21 um 22:43 schrieb Daniel Vetter:
> On Tue, Dec 07, 2021 at 01:34:00PM +0100, Christian König wrote:
>> So far we had the approach of using a directed acyclic
>> graph with the dma_resv obj.
>>
>> This turned out to have many downsides, especially it means
>> that every single driver and user of this interface needs
>> to be aware of this restriction when adding fences. If the
>> rules for the DAG are not followed then we end up with
>> potential hard to debug memory corruption, information
>> leaks or even elephant big security holes because we allow
>> userspace to access freed up memory.
>>
>> Since we already took a step back from that by always
>> looking at all fences we now go a step further and stop
>> dropping the shared fences when a new exclusive one is
>> added.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 13 -------------
>>   1 file changed, 13 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 9acceabc9399..ecb2ff606bac 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
> No doc update at all!

Scratching my head I'm pretty sure I've updated at least the kerneldoc 
for dma_resv_add_excl_fence(). Must have gone lost in some rebase.

>
> I checked, we're not that shitty with docs,

Well I wouldn't say shitty, but they are not perfect either.

>   Minimally the DOC: section
> header and also the struct dma_resv kerneldoc. Also there's maybe more
> references and stuff I've missed on a quick look, please check for them
> (e.g. dma_buf.resv kerneldoc is rather important to keep correct too).
>
> Code itself does what it says in the commit message, but we really need
> the most accurate docs we can get for this stuff, or the confusion will
> persist :-/

Yeah completely agree, going to fix that.

Thanks,
Christian.

>
> Cheers, Daniel
>
>> @@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   {
>>   	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
>> -	struct dma_resv_list *old;
>> -	u32 i = 0;
>>   
>>   	dma_resv_assert_held(obj);
>>   
>> -	old = dma_resv_shared_list(obj);
>> -	if (old)
>> -		i = old->shared_count;
>> -
>>   	dma_fence_get(fence);
>>   
>>   	write_seqcount_begin(&obj->seq);
>>   	/* write_seqcount_begin provides the necessary memory barrier */
>>   	RCU_INIT_POINTER(obj->fence_excl, fence);
>> -	if (old)
>> -		old->shared_count = 0;
>>   	write_seqcount_end(&obj->seq);
>>   
>> -	/* inplace update, no shared fences */
>> -	while (i--)
>> -		dma_fence_put(rcu_dereference_protected(old->shared[i],
>> -						dma_resv_held(obj)));
>> -
>>   	dma_fence_put(old_fence);
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>> -- 
>> 2.25.1
>>

