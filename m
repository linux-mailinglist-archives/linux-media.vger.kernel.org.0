Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263E040AC5F
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 13:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhINL05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 07:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbhINL05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 07:26:57 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146ACC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 04:25:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso2232719wmd.5
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 04:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q5xCNZRfsW9YhsltTaL5l8iwaYOFMsNiuAvcB1mol2g=;
        b=CHN0S94ZfEhV3MTCXevFs3OT/rlvRv1Jct153FrQzVj2RjPGYrUkA5paT0Xr1gVFnS
         avZtiTOy8jW5Aigzx//MxBHh8b1pKPJykpiZkET2veQ2ZfFE8guA1H2m6u9LaugJcmVF
         csdtIkEcN7vfMHs9k2EcQsIH76ZH7llfQ824W+D9tWopwFPsEHggdukRkZ/Hsjy2M+lK
         pAVjH+WVqvYG4bdvGewgreW00Wvd2RIvHF6gZNp9wQ9vVyYC+l4zRGEjlHYF9661msVP
         3tRxb0XPKzWgoG34OCO0lw1BX+m3Oy03iJVH4HooK/DC4DkrlNMh2CmPkJ9c0S4LOYBD
         Z2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q5xCNZRfsW9YhsltTaL5l8iwaYOFMsNiuAvcB1mol2g=;
        b=qcSnkaYW56APAqfMrJMDP33uASJFJgFlZUmkeW+DsDCSueZbUqW1/HzZivGtXX8Y2O
         fVA7MmyBrVpltRCMU+B4+S4fs8++1a3jVSqHuF4I8U6DRj+o2774dLpWJ40Ra3opGVTR
         5/5wBoBncMIZ9W4gl30rwfBIzDq2LB7rrYReEOFfnbpd/40KwIBf2IBqmmVNUCnxgXFO
         Jy3xMZjzpt+yzn14yG+Lu+4YIFe3WzIWmtMhEUH0sb9GSua1g3ZnwTsU7gD2mIspZ6jE
         e34UzP6ru2irNHapQRVmcvvZyDAgufWWebtN/XhVrsWcNELvCelqEaq1i2mihqTnWnaV
         OU8w==
X-Gm-Message-State: AOAM5310K0vHbtyjInaYAPJMtKf+8I5yHyQ6wZ2o+U0aqwaEQk2QfDRT
        3pnNc3NMo72Z7bYq3NBVM1c=
X-Google-Smtp-Source: ABdhPJznhGSWS3eOlmDxoHwitHR0ajKmFS7aEhck6TKCIKibVg27EwxRS7lb+qUbKspEnS3fOG/E0A==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr1605129wmc.113.1631618738591;
        Tue, 14 Sep 2021 04:25:38 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c23sm870196wmb.37.2021.09.14.04.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 04:25:38 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-2-christian.koenig@amd.com>
 <1eee4105-e154-9d1d-b92b-d17c6f8f8432@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <abeccf85-13d1-9e3a-26c9-1ca0f6d4c322@gmail.com>
Date:   Tue, 14 Sep 2021 13:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1eee4105-e154-9d1d-b92b-d17c6f8f8432@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.09.21 um 12:53 schrieb Tvrtko Ursulin:
>
> On 13/09/2021 14:16, Christian König wrote:
>> Abstract the complexity of iterating over all the fences
>> in a dma_resv object.
>>
>> The new loop handles the whole RCU and retry dance and
>> returns only fences where we can be sure we grabbed the
>> right one.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 84fbe60629e3..213a9b7251ca 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv 
>> *obj, struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>   +/**
>> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
>> + * @obj: the dma_resv object
>> + * @cursor: cursor to record the current position
>> + * @all_fences: true returns also the shared fences
>> + * @first: if we should start over
>> + *
>> + * Return all the fences in the dma_resv object which are not yet 
>> signaled.
>> + * The returned fence has an extra local reference so will stay alive.
>> + * If a concurrent modify is detected the whole iterator is started 
>> over again.
>> + */
>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>> +                     struct dma_resv_cursor *cursor,
>> +                     bool all_fences, bool first)
>> +{
>> +    struct dma_fence *fence = NULL;
>> +
>> +    do {
>> +        /* Drop the reference from the previous round */
>> +        dma_fence_put(fence);
>> +
>> +        cursor->is_first = first;
>> +        if (first) {
>> +            cursor->seq = read_seqcount_begin(&obj->seq);
>> +            cursor->index = -1;
>> +            cursor->fences = dma_resv_shared_list(obj);
>> +            cursor->is_exclusive = true;
>> +
>> +            fence = dma_resv_excl_fence(obj);
>> +            if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> +                          &fence->flags))
>> +                fence = NULL;
>> +        } else {
>> +            fence = NULL;
>> +        }
>> +
>> +        if (fence) {
>> +            fence = dma_fence_get_rcu(fence);
>> +        } else if (all_fences && cursor->fences) {
>> +            struct dma_resv_list *fences = cursor->fences;
>
> If rcu lock is allowed to be dropped while walking the list what 
> guarantees list of fences hasn't been freed?

Ah, good point! We need to test the sequence number when we enter the 
function as well. Going to fix that.

>
> Like:
>
> 1st call
>   -> gets seqcount
>   -> stores cursor->fences
>
> rcu lock dropped/re-acquired
>
> 2nd call
>   -> dereferences into cursor->fences -> boom?
>
>> +
>> +            cursor->is_exclusive = false;
>> +            while (++cursor->index < fences->shared_count) {
>> +                fence = rcu_dereference(fences->shared[
>> +                            cursor->index]);
>> +                if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> +                          &fence->flags))
>> +                    break;
>> +            }
>> +            if (cursor->index < fences->shared_count)
>> +                fence = dma_fence_get_rcu(fence);
>> +            else
>> +                fence = NULL;
>> +        }
>> +
>> +        /* For the eventually next round */
>> +        first = true;
>> +    } while (read_seqcount_retry(&obj->seq, cursor->seq));
>> +
>> +    return fence;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
>> +
>>   /**
>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>    * @dst: the destination reservation object
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index 9100dd3dc21f..f5b91c292ee0 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -149,6 +149,39 @@ struct dma_resv {
>>       struct dma_resv_list __rcu *fence;
>>   };
>>   +/**
>> + * struct dma_resv_cursor - current position into the dma_resv fences
>> + * @seq: sequence number to check
>> + * @index: index into the shared fences
>> + * @shared: the shared fences
>> + * @is_first: true if this is the first returned fence
>> + * @is_exclusive: if the current fence is the exclusive one
>> + */
>> +struct dma_resv_cursor {
>> +    unsigned int seq;
>> +    unsigned int index;
>> +    struct dma_resv_list *fences;
>> +    bool is_first;
>
> Is_first is useful to callers - like they are legitimately allowed to 
> look inside this, what could otherwise be private object?

Yes, I was pondering on the same question. Key point is that this is 
only used by other dma_resv functions which also use cursor.fences for 
example.

So this is only supposed to be used by code working with other privates 
of the dma_resv object as well.

Maybe adding that as a comment?

> What is the intended use case, given when true the returned fence can 
> be either exclusive or first from a shared list?

To reset counters for and know that the sequence has restarted. See how 
this is used in dma_resv_copy_fences() for example:

         rcu_read_lock();
         dma_resv_for_each_fence_unlocked(dst, &cursor, true, f) {

                 if (cursor.is_first) {
                         dma_resv_list_free(list);
                         dma_fence_put(excl);

                         if (cursor.fences) {
                                 unsigned int cnt = 
cursor.fences->shared_count;

                                 rcu_read_unlock();
                                 list = dma_resv_list_alloc(cnt);
...


>
>> +    bool is_exclusive;
>
> Is_exclusive could be written as index == -1 in the code, right? If so 
> then an opportunity to remove some redundancy.

Correct and good point. But I want to move away a bit from the 
exclusive/shared notation in the future and avoid that tests like index 
== -1 spread around in the code.

What we could do is to add some helper like 
dma_resv_cursor_is_excludive(cursor) which tests that.

>
>> +};
>> +
>> +/**
>> + * dma_resv_for_each_fence_unlocked - fence iterator
>> + * @obj: a dma_resv object pointer
>> + * @cursor: a struct dma_resv_cursor pointer
>> + * @all_fences: true if all fences should be returned
>> + * @fence: the current fence
>> + *
>> + * Iterate over the fences in a struct dma_resv object without 
>> holding the
>> + * dma_resv::lock. The RCU read side lock must be hold when using 
>> this, but can
>> + * be dropped and re-taken as necessary inside the loop. @all_fences 
>> controls
>> + * if the shared fences are returned as well.
>> + */
>> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, 
>> fence)    \
>> +    for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>> true); \
>> +         fence; dma_fence_put(fence),                    \
>> +         fence = dma_resv_walk_unlocked(obj, cursor, all_fences, 
>> false))
>
> Has the fact RCU lock can be dropped so there is potential to walk 
> over completely different snapshots been discussed?

Well that's basically the heart of the functionality. Even without 
dropping the RCU lock there can be an restart at any time when the 
dma_resv object is modified.

> At least if I followed the code correctly - it appears there is 
> potential the walk restarts from the start (exclusive slot) at any 
> point during the walk.

Correct, yes.

> Because theoretically I think you could take an atomic snapshot of 
> everything (given you have a cursor object) and then release it on the 
> end condition.

That's what the dma_resv_get_fences() function is good for, yes. This 
one returns an array of fences.

The key difference is that we need to allocate memory for that which is 
at least sometimes not feasible or desired.

Thanks for the review,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +
>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>   #define dma_resv_assert_held(obj) 
>> lockdep_assert_held(&(obj)->lock.base)
>>   @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int 
>> num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct 
>> dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence 
>> *fence);
>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>> +                     struct dma_resv_cursor *cursor,
>> +                     bool first, bool all_fences);
>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence 
>> **pfence_excl,
>>               unsigned *pshared_count, struct dma_fence ***pshared);
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>

