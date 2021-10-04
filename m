Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF1B420971
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 12:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbhJDKqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 06:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbhJDKqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 06:46:00 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE967C061745
        for <linux-media@vger.kernel.org>; Mon,  4 Oct 2021 03:44:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r18so2671678wrg.6
        for <linux-media@vger.kernel.org>; Mon, 04 Oct 2021 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qIfsRxcw2bGsNxadqF466T3i5eKnjv518EetDvmxQp8=;
        b=PW3SJLG94JZ6CIUJoGm/Np2ORAUKXlYbpF+b25yZIAPeSrzfng9roQhLDLwwhv1MXS
         +wvU2QkAPwGvRZ1bAZaS6K4DR71mKkblvFX10vo3Q5sqNJFwQ2CURKDJY9ffMPqjcDJn
         9Hp24zEIPdNp5zYkKgizzqw6ykEJcHvW/EB08O3b3d+BKrTHG1wEhspVOzl++Y+dGilj
         qzOVI+S4tp99SQcPr09jKX/c1vcsnmGNu/27Bl0Tt8G6luT2gbkjXiiKjxEnksBMubZm
         1o7e8p6Qve/3jq1UI8kN1WPqvHqGq4bHU2OaL8BdCH+PvtbW8FNpgy1SwbeIumPKHBYk
         dIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qIfsRxcw2bGsNxadqF466T3i5eKnjv518EetDvmxQp8=;
        b=xEpDm3JArBtnWhIrJyEvHs4n7Nbs9nUiPVKBcbH1E2mZ3bZ8NQdhGGBmEgGjocbPm/
         vpt2UOaLereBV87mRJoUXT4t9kvg8OuvbVuuIWwSuCNvtsnOPXzhbYnIs16hVzv6/HBD
         uwsanrsyodhu0f2DW/AzKTOTg1t8DjbNvmZXjNa+HHuW2ARfLsuXxjZ+hlxqpQhPckmd
         VZpspSrFmT6TXt7Fu5al58VTgvIZIpwtkNDK7clMojNSBdw/qARGGRKSycIoaPlS52Te
         /h4hmmVf+becrZlBSuWTzuHoY2O8UvdV/we0jLhxPAzUgNSpEtARZzpYc7YkmQUxocF5
         4WMA==
X-Gm-Message-State: AOAM5323wQV+kxLEU5Qrph+9MAHP6F7rvW5bZtS2osbM23eIgPfMk8/Q
        t8SGfDXhiihBohWhCea6G/c=
X-Google-Smtp-Source: ABdhPJwW6LL4BYAFZ0pDXCClq4Td2ZGlHlPQLiHIENttJ6cr6UfBhO5ZfAnbfXoiBRm07AebTvKlIA==
X-Received: by 2002:adf:a14a:: with SMTP id r10mr13393473wrr.377.1633344250262;
        Mon, 04 Oct 2021 03:44:10 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id n11sm14852611wmq.19.2021.10.04.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 03:44:09 -0700 (PDT)
Subject: Re: [PATCH 01/28] dma-buf: add dma_resv_for_each_fence_unlocked v7
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-2-christian.koenig@amd.com>
 <fa3a1755-21b2-ea0c-1553-df0297523e48@linux.intel.com>
 <b6da5c2f-8e2c-18d4-9b89-aac3171d841d@gmail.com>
 <022c63b6-7a40-3569-9b5e-f5b1ef64e574@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6a6de431-cafc-2c43-35d7-7314da3dc204@gmail.com>
Date:   Mon, 4 Oct 2021 12:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <022c63b6-7a40-3569-9b5e-f5b1ef64e574@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.10.21 um 12:34 schrieb Tvrtko Ursulin:
>
> On 04/10/2021 10:53, Christian König wrote:
>> Am 04.10.21 um 11:29 schrieb Tvrtko Ursulin:
>>>
>>> On 01/10/2021 11:05, Christian König wrote:
>>>> Abstract the complexity of iterating over all the fences
>>>> in a dma_resv object.
>>>>
>>>> The new loop handles the whole RCU and retry dance and
>>>> returns only fences where we can be sure we grabbed the
>>>> right one.
>>>>
>>>> v2: fix accessing the shared fences while they might be freed,
>>>>      improve kerneldoc, rename _cursor to _iter, add
>>>>      dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
>>>>
>>>> v3: restructor the code, move rcu_read_lock()/unlock() into the
>>>>      iterator, add dma_resv_iter_is_restarted()
>>>>
>>>> v4: fix NULL deref when no explicit fence exists, drop superflous
>>>>      rcu_read_lock()/unlock() calls.
>>>>
>>>> v5: fix typos in the documentation
>>>>
>>>> v6: fix coding error when excl fence is NULL
>>>>
>>>> v7: one more logic fix
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-resv.c | 100 
>>>> +++++++++++++++++++++++++++++++++++++
>>>>   include/linux/dma-resv.h   |  95 +++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 195 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 84fbe60629e3..3cbcf66a137e 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -323,6 +323,106 @@ void dma_resv_add_excl_fence(struct dma_resv 
>>>> *obj, struct dma_fence *fence)
>>>>   }
>>>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>>>   +/**
>>>> + * dma_resv_iter_restart_unlocked - restart the unlocked iterator
>>>> + * @cursor: The dma_resv_iter object to restart
>>>> + *
>>>> + * Restart the unlocked iteration by initializing the cursor object.
>>>> + */
>>>> +static void dma_resv_iter_restart_unlocked(struct dma_resv_iter 
>>>> *cursor)
>>>> +{
>>>> +    cursor->seq = read_seqcount_begin(&cursor->obj->seq);
>>>> +    cursor->index = -1;
>>>> +    if (cursor->all_fences)
>>>> +        cursor->fences = dma_resv_shared_list(cursor->obj);
>>>> +    else
>>>> +        cursor->fences = NULL;
>>>> +    cursor->is_restarted = true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
>>>> + * @cursor: cursor to record the current position
>>>> + *
>>>> + * Return all the fences in the dma_resv object which are not yet 
>>>> signaled.
>>>> + * The returned fence has an extra local reference so will stay 
>>>> alive.
>>>> + * If a concurrent modify is detected the whole iteration is 
>>>> started over again.
>>>> + */
>>>> +static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>>>> +{
>>>> +    struct dma_resv *obj = cursor->obj;
>>>> +
>>>> +    do {
>>>> +        /* Drop the reference from the previous round */
>>>> +        dma_fence_put(cursor->fence);
>>>> +
>>>> +        if (cursor->index == -1) {
>>>> +            cursor->fence = dma_resv_excl_fence(obj);
>>>> +            cursor->index++;
>>>> +            if (!cursor->fence)
>>>> +                continue;
>>>> +
>>>> +        } else if (!cursor->fences ||
>>>> +               cursor->index >= cursor->fences->shared_count) {
>>>> +            cursor->fence = NULL;
>>>> +            break;
>>>> +
>>>> +        } else {
>>>> +            struct dma_resv_list *fences = cursor->fences;
>>>> +            unsigned int idx = cursor->index++;
>>>> +
>>>> +            cursor->fence = rcu_dereference(fences->shared[idx]);
>>>> +        }
>>>> +        cursor->fence = dma_fence_get_rcu(cursor->fence);
>>>
>>> Worth having an assert dma_fence_get_rcu does not fail here? Not 
>>> sure that I have seen debug build only asserts though on the DRM 
>>> core side.
>>
>> That won't work. It's perfectly valid for dma_fence_get_rcu() to 
>> return NULL when we are racing here. Keep in mind that we don't hold 
>> any locks.
>
> Ah yes.. No need to change anything then, sorry for the confusion. I 
> did not find any holes, the rest was just about how to maybe make the 
> flow more obvious. Let me know if you want r-b now or later.

Now would be good. I've tried to make that more cleaner, but this only 
lead to repeating the code more often.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> What we could do is to return NULL and repeat with a new sequence 
>> immediately though.
>>
>>>
>>> On the bike shedding front, would it be clearer if the continue 
>>> condition on signaled fences was standalone, using the continue 
>>> statement? I'd also possibly re-arrange the three if-else blocks so 
>>> that the end of iteration is not sandwiched between blocks handling 
>>> exclusive and shared, and flow tweaked a bit, like:
>>>
>>>   struct dma_fence *fence = cursor->fence;
>>>   int index = cursor->index;
>>>
>>>   dma_fence_put(fence);
>>>   fence = NULL;
>>>
>>> next:
>>>   if (index == -1) {
>>>     /* Try picking the exclusive fence. */
>>>     index++;
>>>     fence = dma_resv_excl_fence(obj);
>>>     if (!fence)
>>>         goto next;
>>>   } else if (cursor->fences && index < cursor->fences->shared_count) {
>>>       /* Try picking next shared fence. */
>>>     struct dma_resv_list *fences = cursor->fences;
>>>
>>>     fence = rcu_dereference(fences->shared[index++]);
>>>   }
>>>
>>>   if (fence) {
>>>       if (dma_fence_is_signaled(fence))
>>>         goto next; /* Skip signaled. */
>>>
>>>     fence = dma_fence_get_rcu(fence);
>>>     WARN_ON(!fence);
>>> }
>>>
>>>   cursor->fence = fence;
>>>   cursor->index = index;
>>>
>>> (I started with a loop here but ended with goto based flow since it 
>>> ended up more succinct.)
>>>
>>> At least if I don't have a handling flaw in there it looks like 
>>> easier to follow flow to me. Plus picking a not signaled fence works 
>>> without a reference FWIW.
>>
>> I strongly don't think that this will work correctly. You need to 
>> grab a reference first when you want to call dma_fence_is_signaled(), 
>> that's why I used the testbit approach initially.
>>
>>> How does it look to you?
>>
>> Mhm, let me try to reorder the loop once more.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +        if (!cursor->fence || !dma_fence_is_signaled(cursor->fence))
>>>> +            break;
>>>> +    } while (true);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_first_unlocked - first fence in an unlocked 
>>>> dma_resv obj.
>>>> + * @cursor: the cursor with the current position
>>>> + *
>>>> + * Returns the first fence from an unlocked dma_resv obj.
>>>> + */
>>>> +struct dma_fence *dma_resv_iter_first_unlocked(struct 
>>>> dma_resv_iter *cursor)
>>>> +{
>>>> +    rcu_read_lock();
>>>> +    do {
>>>> +        dma_resv_iter_restart_unlocked(cursor);
>>>> +        dma_resv_iter_walk_unlocked(cursor);
>>>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>>>> +    rcu_read_unlock();
>>>> +
>>>> +    return cursor->fence;
>>>> +}
>>>> +EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_next_unlocked - next fence in an unlocked 
>>>> dma_resv obj.
>>>> + * @cursor: the cursor with the current position
>>>> + *
>>>> + * Returns the next fence from an unlocked dma_resv obj.
>>>> + */
>>>> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter 
>>>> *cursor)
>>>> +{
>>>> +    bool restart;
>>>> +
>>>> +    rcu_read_lock();
>>>> +    cursor->is_restarted = false;
>>>> +    restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
>>>> +    do {
>>>> +        if (restart)
>>>> +            dma_resv_iter_restart_unlocked(cursor);
>>>> +        dma_resv_iter_walk_unlocked(cursor);
>>>> +        restart = true;
>>>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>>>> +    rcu_read_unlock();
>>>> +
>>>> +    return cursor->fence;
>>>> +}
>>>> +EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>>>> +
>>>>   /**
>>>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>>>    * @dst: the destination reservation object
>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>> index 9100dd3dc21f..5d7d28cb9008 100644
>>>> --- a/include/linux/dma-resv.h
>>>> +++ b/include/linux/dma-resv.h
>>>> @@ -149,6 +149,101 @@ struct dma_resv {
>>>>       struct dma_resv_list __rcu *fence;
>>>>   };
>>>>   +/**
>>>> + * struct dma_resv_iter - current position into the dma_resv fences
>>>> + *
>>>> + * Don't touch this directly in the driver, use the accessor 
>>>> function instead.
>>>> + */
>>>> +struct dma_resv_iter {
>>>> +    /** @obj: The dma_resv object we iterate over */
>>>> +    struct dma_resv *obj;
>>>> +
>>>> +    /** @all_fences: If all fences should be returned */
>>>> +    bool all_fences;
>>>> +
>>>> +    /** @fence: the currently handled fence */
>>>> +    struct dma_fence *fence;
>>>> +
>>>> +    /** @seq: sequence number to check for modifications */
>>>> +    unsigned int seq;
>>>> +
>>>> +    /** @index: index into the shared fences */
>>>> +    unsigned int index;
>>>> +
>>>> +    /** @fences: the shared fences */
>>>> +    struct dma_resv_list *fences;
>>>> +
>>>> +    /** @is_restarted: true if this is the first returned fence */
>>>> +    bool is_restarted;
>>>> +};
>>>> +
>>>> +struct dma_fence *dma_resv_iter_first_unlocked(struct 
>>>> dma_resv_iter *cursor);
>>>> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter 
>>>> *cursor);
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_begin - initialize a dma_resv_iter object
>>>> + * @cursor: The dma_resv_iter object to initialize
>>>> + * @obj: The dma_resv object which we want to iterate over
>>>> + * @all_fences: If all fences should be returned or just the 
>>>> exclusive one
>>>> + */
>>>> +static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
>>>> +                       struct dma_resv *obj,
>>>> +                       bool all_fences)
>>>> +{
>>>> +    cursor->obj = obj;
>>>> +    cursor->all_fences = all_fences;
>>>> +    cursor->fence = NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_end - cleanup a dma_resv_iter object
>>>> + * @cursor: the dma_resv_iter object which should be cleaned up
>>>> + *
>>>> + * Make sure that the reference to the fence in the cursor is 
>>>> properly
>>>> + * dropped.
>>>> + */
>>>> +static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
>>>> +{
>>>> +    dma_fence_put(cursor->fence);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_is_exclusive - test if the current fence is the 
>>>> exclusive one
>>>> + * @cursor: the cursor of the current position
>>>> + *
>>>> + * Returns true if the currently returned fence is the exclusive one.
>>>> + */
>>>> +static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter 
>>>> *cursor)
>>>> +{
>>>> +    return cursor->index == -1;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_iter_is_restarted - test if this is the first fence 
>>>> after a restart
>>>> + * @cursor: the cursor with the current position
>>>> + *
>>>> + * Return true if this is the first fence in an iteration after a 
>>>> restart.
>>>> + */
>>>> +static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter 
>>>> *cursor)
>>>> +{
>>>> +    return cursor->is_restarted;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dma_resv_for_each_fence_unlocked - unlocked fence iterator
>>>> + * @cursor: a struct dma_resv_iter pointer
>>>> + * @fence: the current fence
>>>> + *
>>>> + * Iterate over the fences in a struct dma_resv object without 
>>>> holding the
>>>> + * &dma_resv.lock and using RCU instead. The cursor needs to be 
>>>> initialized
>>>> + * with dma_resv_iter_begin() and cleaned up with 
>>>> dma_resv_iter_end(). Inside
>>>> + * the iterator a reference to the dma_fence is held and the RCU 
>>>> lock dropped.
>>>> + * When the dma_resv is modified the iteration starts over again.
>>>> + */
>>>> +#define dma_resv_for_each_fence_unlocked(cursor, fence)            \
>>>> +    for (fence = dma_resv_iter_first_unlocked(cursor);        \
>>>> +         fence; fence = dma_resv_iter_next_unlocked(cursor))
>>>> +
>>>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>>   #define dma_resv_assert_held(obj) 
>>>> lockdep_assert_held(&(obj)->lock.base)
>>>>
>>

