Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAA140F25A
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 08:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhIQGeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 02:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbhIQGeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78058C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 23:32:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t8so13351448wrq.4
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DYacMBCZ5vJCp8ZHnptSvRYNq1rxGxZ0iwYDnR+lSRM=;
        b=AvJElUxr8Ju42g+bWG4wkdvLTtU2gxraw1tJ0OEBgj32irZu+E48FSTWF/YCEf5Gxg
         Rz/PcjG2e6iphOW6BMjtWoBTat8otZqtXk0I32be+7COtdVqUqgGZKCh+SCynNrYGsbw
         zGZSkiMYiYrWl96ZGNkdaDs+oOOSuOFC1AQ140ZX2IRBGmeTEcnAuUdrtcNQDJsHNPw3
         iCZhXIKKhKAxwCyq/brkCkVoe8CcWP+ns7Mimu813h3DwZzV47BZdNDvSaNIY8AjOdBg
         mPsiZp2GKhNZd266ra7tNBnlhZ2TCCJWLrHIXbG0kVTgwbXI0xp6TGRrz8+uR8pFpgjN
         lcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DYacMBCZ5vJCp8ZHnptSvRYNq1rxGxZ0iwYDnR+lSRM=;
        b=Ju5icwsCgO4ri4L7OtjhdJkjFvmBICN6AjiAVMg6RHrmzdXgKn1ItVIobJq7muS7nN
         OMJTJhfD5U3tC7VZGlu/5zEW9dZnK+JApCPQ4J+ApQYj96nJphxnXIHF3MtnUwgV7+0Q
         OKye/4nFLeJkaCIyjAHlA8YopawB0sdLssanV7sG5skt/6/A4TZC0Xl86XJhgl9Z3c9N
         oP2Cg1MVvQyony39wHdOGa5CUGBWVcHp+hVJcmy7an1FVCYPfEmrHH0KgWeCsgyZbOoe
         LR5ZggBXBso/rW+RkLXWkOV8VoDl392B+yx8hyA1+SkaddCZ+897BQfDhD67ljNC2NOB
         aXIA==
X-Gm-Message-State: AOAM531idbGKYHdCoNtIB3/vf4G0F9USbwE3QndIFYygUQtVoPNFWzyG
        yZtXjZSCqy1vHiPfG4+703cKBIRkoGk5OwNj
X-Google-Smtp-Source: ABdhPJzxww/qB5IkRPFUnTHhPZ5Eof2VFGaFU3PmY7gTkpOJJM05MaCj9qyGSIVq17lrG33fW4WuGQ==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr9711493wrp.223.1631860371006;
        Thu, 16 Sep 2021 23:32:51 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id m18sm5635825wrn.85.2021.09.16.23.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 23:32:50 -0700 (PDT)
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210910082655.82168-1-christian.koenig@amd.com>
 <YUDWHw19iUMfFr7K@phenom.ffwll.local>
 <26f766c9-9a3c-3894-9256-e07090655dc2@gmail.com>
 <CAKMK7uFcU-Dh8kMDrfY1rigVf0J-_R8GJ-d+C-iYNmOWx57W7Q@mail.gmail.com>
 <0bc024c5-a54c-eb3c-4c88-3eb7fbf77261@gmail.com>
 <YUNQJlSwzoKNRYIk@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <604fd887-10ce-0841-bb29-b756bd08d9ab@gmail.com>
Date:   Fri, 17 Sep 2021 08:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUNQJlSwzoKNRYIk@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.09.21 um 16:09 schrieb Daniel Vetter:
> On Thu, Sep 16, 2021 at 02:49:26PM +0200, Christian König wrote:
>> Am 16.09.21 um 14:14 schrieb Daniel Vetter:
>>> On Thu, Sep 16, 2021 at 10:50 AM Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 14.09.21 um 19:04 schrieb Daniel Vetter:
>>>>> On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
>>>>>> Abstract the complexity of iterating over all the fences
>>>>>> in a dma_resv object.
>>>>>>
>>>>>> The new loop handles the whole RCU and retry dance and
>>>>>> returns only fences where we can be sure we grabbed the
>>>>>> right one.
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>>>>>>     include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>>>>>>     2 files changed, 99 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>>>> index 84fbe60629e3..213a9b7251ca 100644
>>>>>> --- a/drivers/dma-buf/dma-resv.c
>>>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>>>> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>>>>> +/**
>>>>>> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
>>>>>> + * @obj: the dma_resv object
>>>>>> + * @cursor: cursor to record the current position
>>>>>> + * @all_fences: true returns also the shared fences
>>>>>> + * @first: if we should start over
>>>>>> + *
>>>>>> + * Return all the fences in the dma_resv object which are not yet signaled.
>>>>>> + * The returned fence has an extra local reference so will stay alive.
>>>>>> + * If a concurrent modify is detected the whole iterator is started over again.
>>>>>> + */
>>>>>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>>>>>> +                                     struct dma_resv_cursor *cursor,
>>>>>> +                                     bool all_fences, bool first)
>>>>>> +{
>>>>>> +    struct dma_fence *fence = NULL;
>>>>>> +
>>>>>> +    do {
>>>>>> +            /* Drop the reference from the previous round */
>>>>>> +            dma_fence_put(fence);
>>>>>> +
>>>>>> +            cursor->is_first = first;
>>>>>> +            if (first) {
>>>>>> +                    cursor->seq = read_seqcount_begin(&obj->seq);
>>>>>> +                    cursor->index = -1;
>>>>>> +                    cursor->fences = dma_resv_shared_list(obj);
>>>>>> +                    cursor->is_exclusive = true;
>>>>>> +
>>>>>> +                    fence = dma_resv_excl_fence(obj);
>>>>>> +                    if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>> +                                          &fence->flags))
>>>>>> +                            fence = NULL;
>>>>>> +            } else {
>>>>>> +                    fence = NULL;
>>>>>> +            }
>>>>>> +
>>>>>> +            if (fence) {
>>>>>> +                    fence = dma_fence_get_rcu(fence);
>>>>>> +            } else if (all_fences && cursor->fences) {
>>>>>> +                    struct dma_resv_list *fences = cursor->fences;
>>>>>> +
>>>>>> +                    cursor->is_exclusive = false;
>>>>>> +                    while (++cursor->index < fences->shared_count) {
>>>>>> +                            fence = rcu_dereference(fences->shared[
>>>>>> +                                                    cursor->index]);
>>>>>> +                            if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>> +                                          &fence->flags))
>>>>>> +                                    break;
>>>>>> +                    }
>>>>>> +                    if (cursor->index < fences->shared_count)
>>>>>> +                            fence = dma_fence_get_rcu(fence);
>>>>>> +                    else
>>>>>> +                            fence = NULL;
>>>>>> +            }
>>>>>> +
>>>>>> +            /* For the eventually next round */
>>>>>> +            first = true;
>>>>>> +    } while (read_seqcount_retry(&obj->seq, cursor->seq));
>>>>>> +
>>>>>> +    return fence;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
>>>>>> +
>>>>>>     /**
>>>>>>      * dma_resv_copy_fences - Copy all fences from src to dst.
>>>>>>      * @dst: the destination reservation object
>>>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>>>> index 9100dd3dc21f..f5b91c292ee0 100644
>>>>>> --- a/include/linux/dma-resv.h
>>>>>> +++ b/include/linux/dma-resv.h
>>>>>> @@ -149,6 +149,39 @@ struct dma_resv {
>>>>>>        struct dma_resv_list __rcu *fence;
>>>>>>     };
>>>>>> +/**
>>>>>> + * struct dma_resv_cursor - current position into the dma_resv fences
>>>>>> + * @seq: sequence number to check
>>>>>> + * @index: index into the shared fences
>>>>>> + * @shared: the shared fences
>>>>>> + * @is_first: true if this is the first returned fence
>>>>>> + * @is_exclusive: if the current fence is the exclusive one
>>>>>> + */
>>>>>> +struct dma_resv_cursor {
>>>>>> +    unsigned int seq;
>>>>>> +    unsigned int index;
>>>>>> +    struct dma_resv_list *fences;
>>>>>> +    bool is_first;
>>>>>> +    bool is_exclusive;
>>>>>> +};
>>>>> A bit a bikeshed, but I think I'd be nice to align this with the other
>>>>> iterators we have, e.g. for the drm_connector list.
>>>>>
>>>>> So struct dma_resv_fence_iter, dma_resv_fence_iter_begin/next/end().
>>>> I've renamed the structure to dma_resv_iter.
>>>>
>>>>> Also I think the for_each macro must not include begin/end calls. If we
>>>>> include that then it saves 2 lines of code at the cost of a pile of
>>>>> awkward bugs because people break; out of the loop or return early  (only
>>>>> continue is safe) and we leak a fence. Or worse.
>>>>>
>>>>> Explicit begin/end is much more robust at a very marginal cost imo.
>>>> The key point is that this makes it quite a bunch more complicated to
>>>> implement. See those functions are easiest when you centralize them and
>>>> try to not spread the functionality into begin/end.
>>>>
>>>> The only thing I could see in the end function would be to drop the
>>>> reference for the dma_fence and that is not really something I would
>>>> like to do because we actually need to keep that reference in a bunch of
>>>> cases.
>>> Yeah but it's extremely fragile. See with drm_connector_iter we also have
>>> the need to grab a reference to that connector in a few place, and I do
>>> think that open-code that is much clearer instead of inheriting a
>>> reference that the for_each macro acquired for you, and which you cleverly
>>> leaked through a break; Compare
>>>
>>> for_each_fence(fence) {
>>> 	if (fence) {
>>> 		found_fence = fence;
>>> 		break;
>>> 	}
>>> }
>>>
>>> /* do some itneresting stuff with found_fence */
>>>
>>> dma_fence_put(found_fence); /* wtf, where is this fence reference from */
>>>
>>> Versus what I'm proposing:
>>>
>>> fence_iter_init(&fence_iter)
>>> for_each_fence(fence, &fence_iter) {
>>> 	if (fence) {
>>> 		found_fence = fence;
>>> 		dma_fence_get(found_fence);
>>> 		break;
>>> 	}
>>> }
>>> fence_iter_end(&fence_iter)
>>>
>>> /* do some itneresting stuff with found_fence */
>>>
>>> dma_fence_put(found_fence); /* 100% clear which reference we're putting here */
>>>
>>> One of these patterns is maintainable and clear, at the cost of 3 more
>>> lines. The other one is frankly just clever but fragile nonsense.
>>>
>>> So yeah I really think we need the iter_init/end/next triple of functions
>>> here. Too clever is no good at all. And yes that version means you have an
>>> additional kref_get/put in there for the found fence, but I really don't
>>> think that matters in any of these paths here.
>> Yeah, that's what I've pondered on as well but I thought that avoiding the
>> extra get/put dance would be more important to avoid.
> Yeah, but if that shows up in a benchmark/profile, we can fix it with some
> fence_iter_get_fence() or so wrapper which explicitly hands the reference
> over to you (by clearing the pointer in the iter or wherever so the
> _next() or _end() do not call dma_fence_put anymore). So if necessary, we
> can have clarity and speed here.

Ok fine with me, going to rework the code.

>
>> Anyway, going to change that to make clear what happens here.
>>
>> But question is can you go over the patch set and see if we can replace some
>> more dma_fence_for_each_fence_unlock() with dma_fence_for_each_fence()
>> because the lock is either held or can be taken? I would have a much better
>> feeling to avoid the unlocked access in the first place.
> Yeah fully agreed, I think we should aim as much for fully locked.

The problem is that I can't really say for a lot of code if we should 
use the locked or unlocked variant.

For example Tvrtko suggested to use the locked variant in 
i915_request_await_object() and I mixed that up with 
i915_sw_fence_await_reservation(). End result is that the CI system blew 
up immediately.

Good that the CI system caught that, but I will certainly only move to 
the locked variant if somebody explicitly confirm to me that we can do 
that for an use case.

> Btw on that did you see my other reply where I toss around an idea for the
> dma_resv unsharing problem?

At least I don't know what you are talking about. So no I probably 
somehow missed that.

Christian.


> -Daniel
>
>> Thanks,
>> Christian.
>>
>>> Cheers, Daniel
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Otherwise I think this fence iterator is a solid concept that yeah we
>>>>> should roll out everywhere.
>>>>> -Daniel
>>>>>
>>>>>> +
>>>>>> +/**
>>>>>> + * dma_resv_for_each_fence_unlocked - fence iterator
>>>>>> + * @obj: a dma_resv object pointer
>>>>>> + * @cursor: a struct dma_resv_cursor pointer
>>>>>> + * @all_fences: true if all fences should be returned
>>>>>> + * @fence: the current fence
>>>>>> + *
>>>>>> + * Iterate over the fences in a struct dma_resv object without holding the
>>>>>> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
>>>>>> + * be dropped and re-taken as necessary inside the loop. @all_fences controls
>>>>>> + * if the shared fences are returned as well.
>>>>>> + */
>>>>>> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
>>>>>> +    for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
>>>>>> +         fence; dma_fence_put(fence),                                   \
>>>>>> +         fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
>>>>>> +
>>>>>>     #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>>>>     #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>>>>>> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>>>>>>     int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>>>>>>     void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>>>>>>     void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>>>>>> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
>>>>>> +                                     struct dma_resv_cursor *cursor,
>>>>>> +                                     bool first, bool all_fences);
>>>>>>     int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>>>>>>                        unsigned *pshared_count, struct dma_fence ***pshared);
>>>>>>     int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>>>>> --
>>>>>> 2.25.1
>>>>>>

