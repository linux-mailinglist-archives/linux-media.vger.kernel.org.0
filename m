Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600A1411007
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 09:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbhITH30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 03:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhITH30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 03:29:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5968C061574
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 00:27:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u18so25348260wrg.5
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3s+mLpiRNCJYVEujeswb8RxNLmtFvm6a93yZ083O6NE=;
        b=X2LOvuqyL9eUAk8+RDIklG1gB3KEwUdi9/trIZD/8C/prspFLwsoi/Tt+tga7y4sfJ
         AVatYRbcXSOpAaFzSdjMCAZ2fKGqOO2iiYBRHMA2zodAyYNMZsLEenGo26YAXXgdRlO6
         uLZY/MEI0HfDJVT43WS+RE+Q3kxyobutPvLfNnli1jUqk0I718bAeGc3yu9f6axTawai
         P9SIEymKOuPwmAki54mMsUmE8ZYSq4LFQQhvGLUQ/ueNnZosQsQ4vBD6KVtKE7feQLR3
         S9WbfXcN9BYeJpFX++E81Stfv5x/FlIiMf+M2ZW97Lp9Aizu8mMKLOOdhc+nyJwWsnBi
         f6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3s+mLpiRNCJYVEujeswb8RxNLmtFvm6a93yZ083O6NE=;
        b=DyTI+g41bJ7SckcEkle8aLNmGbHCO/ZlNZF6r3UKcysNr4/Ej2Yqz2ZwuDMoNaIzWT
         YKbXJ0DB9YNWsa5iu7RFw5iVGxuuOU1b0vlBwka+ZWj0wScINT1a4WeS6citIfih33gT
         jrbrsUPfCGNcnNChB3Zmynez5RNSqoENcNBcSOyLE3cCqWL6cZ0NPgMOZlj38KNo2ORF
         68N2rm+aGQwG1alLfAt3qOr8aAQxE3erxZACNLHO2phLm4vPuOwBm2qBSCEy6opBo8CM
         JeyFwgX1rjXAJl/LhjEkV//LkzjGeyMUuKU7+l64/4T+6wAp74+3VcJWbMuPuE5oSW/Q
         yEsg==
X-Gm-Message-State: AOAM533F9TDgRurcl3OlbYu1yxrUNH+1ExSehIvsczV4jHarFYxCGIQw
        L2BquIttvl8Wpv5oaH79mL0=
X-Google-Smtp-Source: ABdhPJxl4+s3M6OS1t+2qT6dTE2cnalcjwoYWAzdNyFXuNPS3tro52dAtuU8+fbkMmlBnINC0/ksog==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr19476945wrz.78.1632122878192;
        Mon, 20 Sep 2021 00:27:58 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id m4sm18764903wml.28.2021.09.20.00.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 00:27:57 -0700 (PDT)
Subject: Re: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-6-christian.koenig@amd.com>
 <YUSpiHK7Dd1pF/Mq@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <143f7ba9-2629-cb1a-ba66-2d6e50bfc722@gmail.com>
Date:   Mon, 20 Sep 2021 09:27:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUSpiHK7Dd1pF/Mq@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.21 um 16:43 schrieb Daniel Vetter:
> On Fri, Sep 17, 2021 at 02:34:52PM +0200, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled elsewhere.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 68 ++++++--------------------------------
>>   1 file changed, 10 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 9b90bd9ac018..c7db553ab115 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -569,74 +569,26 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>>   			   unsigned long timeout)
>>   {
>>   	long ret = timeout ? timeout : 1;
>> -	unsigned int seq, shared_count;
>> +	struct dma_resv_iter cursor;
>>   	struct dma_fence *fence;
>> -	int i;
>>   
>> -retry:
>> -	shared_count = 0;
>> -	seq = read_seqcount_begin(&obj->seq);
>>   	rcu_read_lock();
> I missed this in my previous conversion reviews, but pls move the
> rcu_read_lock into the iterator. That should simplify the flow in all of
> these quite a bit more, and since the iter_next_unlocked grabs a full
> reference for the iteration body we really don't need that protected by
> rcu.

I intentionally didn't do that because it makes it much more clear that 
we are using RCU here and there is absolutely no guarantee that the 
collection won't change.

But I'm fine if we go down that route instead if you think that's the 
way to go.

Thanks,
Christian.

>
> We can't toss rcu protection for dma_resv anytime soon (if ever), but we
> can at least make it an implementation detail.
>
>> -	i = -1;
>> -
>> -	fence = dma_resv_excl_fence(obj);
>> -	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>> -		if (!dma_fence_get_rcu(fence))
>> -			goto unlock_retry;
>> +	dma_resv_iter_begin(&cursor, obj, wait_all);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		rcu_read_unlock();
>>   
>> -		if (dma_fence_is_signaled(fence)) {
>> -			dma_fence_put(fence);
>> -			fence = NULL;
>> +		ret = dma_fence_wait_timeout(fence, intr, ret);
>> +		if (ret <= 0) {
>> +			dma_resv_iter_end(&cursor);
>> +			return ret;
>>   		}
>>   
>> -	} else {
>> -		fence = NULL;
>> -	}
>> -
>> -	if (wait_all) {
>> -		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
>> -
>> -		if (fobj)
>> -			shared_count = fobj->shared_count;
>> -
>> -		for (i = 0; !fence && i < shared_count; ++i) {
>> -			struct dma_fence *lfence;
>> -
>> -			lfence = rcu_dereference(fobj->shared[i]);
>> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> -				     &lfence->flags))
>> -				continue;
>> -
>> -			if (!dma_fence_get_rcu(lfence))
>> -				goto unlock_retry;
>> -
>> -			if (dma_fence_is_signaled(lfence)) {
>> -				dma_fence_put(lfence);
>> -				continue;
>> -			}
>> -
>> -			fence = lfence;
>> -			break;
>> -		}
>> +		rcu_read_lock();
>>   	}
>> -
>> +	dma_resv_iter_end(&cursor);
>>   	rcu_read_unlock();
>> -	if (fence) {
>> -		if (read_seqcount_retry(&obj->seq, seq)) {
>> -			dma_fence_put(fence);
>> -			goto retry;
>> -		}
>>   
>> -		ret = dma_fence_wait_timeout(fence, intr, ret);
>> -		dma_fence_put(fence);
>> -		if (ret > 0 && wait_all && (i + 1 < shared_count))
>> -			goto retry;
>> -	}
>>   	return ret;
>> -
>> -unlock_retry:
>> -	rcu_read_unlock();
>> -	goto retry;
> I think we still have the same semantics, and it's so much tidier.
>
> With the rcu_read_unlock stuff into iterators (also applies to previous
> two patches):
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>>   }
>>   EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>>   
>> -- 
>> 2.25.1
>>

