Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AD14130CF
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 11:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhIUJnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 05:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhIUJnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 05:43:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFBDC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 02:41:55 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d21so37189197wra.12
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lhKy8aw3qz18WoJCn9BMq8t8vFOczTyYGa6bT8vvq40=;
        b=BmHd6yMMPHdEgnvHlRJtatT9HbSmrNtHG/X/GfMCHnmVWusFjkEtaNZpFD8t1aPtky
         iKuYgZHlA3+iGCUFN/VRPiafTrtsMFY1UFeFUoDHjxjSeoH98JXblO7cTfRr4LFhyki3
         KBc/78souy9wsXqzT4kE0T5HPHQtfywc+voR9i1oP50QPrvpyea53Vzn+2cJButAuitw
         snfglU4bZraTBIGW37zZayAFHbSmltE3zRbaUFai7O3UvVTTqoBqY7Psr61tCnmcaeg9
         8UEVaAUcynqDW4TWU5ryOH9L3lGXAnGQHi3wgFMirbU78Fbh8xSnlSDdkQHztyO0b2Yj
         WhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lhKy8aw3qz18WoJCn9BMq8t8vFOczTyYGa6bT8vvq40=;
        b=uSpiGMXHtb7w6xHr7+6u+Qz0oI9DJsJKHoS8EA8bV/T5XURH1yLx0Oz6ylSZsh2aZ8
         KIJpaSropFjxrxL5QzHtq/FGpC3In902P1EEtOXDB6HSZjWo/BvqvMfEbEgktTqo7762
         d6BMhouGvD0/YmRSaI0tvC/jjedawGEk0+MNmjL73tzBfWEzx6G71Jgr45Urv1mlKw8M
         lJAACfzvi31701S1NRIEX4hBKkAiDU7FM+HY/AyZiRXGdrXrs7YJaEfQwowDPJ6pCkdu
         Xn+jmPg80HvvO1yJbLI5wtx14BwnYMFxHDk1q2BHOZQbxyWgREWpBnaZW2EAZrhKwPw7
         HI1Q==
X-Gm-Message-State: AOAM533K6PAEVN9zG70ODEzJxe29GKa3frfo+b9zvVYIaORaqgPHaavM
        8kfY60Z4L/fmaZfKGUzHtKE=
X-Google-Smtp-Source: ABdhPJx9nQdVuGGy9wMdElYgZLnuNTs32BWOoQ8xeJsHeWKaP1XN12OLjWgPt9yZUC6aBjhEO9VgxA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr3563637wmi.86.1632217314584;
        Tue, 21 Sep 2021 02:41:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9e25:63a7:d115:3eab? ([2a02:908:1252:fb60:9e25:63a7:d115:3eab])
        by smtp.gmail.com with ESMTPSA id n186sm2168506wme.31.2021.09.21.02.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 02:41:53 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-14-christian.koenig@amd.com>
 <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
 <368e8495-f4de-cbb2-3584-e022a5937885@gmail.com>
 <563bb7c3-f956-212d-6085-b1b88292887c@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <64b6a924-be38-0ed0-da92-86296702f71c@gmail.com>
Date:   Tue, 21 Sep 2021 11:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <563bb7c3-f956-212d-6085-b1b88292887c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.09.21 um 12:33 schrieb Tvrtko Ursulin:
> On 20/09/2021 11:13, Christian König wrote:
>> Am 20.09.21 um 10:45 schrieb Tvrtko Ursulin:
>>>
>>> On 17/09/2021 13:35, Christian König wrote:
>>>> This makes the function much simpler since the complex
>>>> retry logic is now handled else where.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 
>>>> ++++++++----------------
>>>>   1 file changed, 11 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> index 6234e17259c1..b1cb7ba688da 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>>> *data,
>>>>   {
>>>>       struct drm_i915_gem_busy *args = data;
>>>>       struct drm_i915_gem_object *obj;
>>>> -    struct dma_resv_list *list;
>>>> -    unsigned int seq;
>>>> +    struct dma_resv_iter cursor;
>>>> +    struct dma_fence *fence;
>>>>       int err;
>>>>         err = -ENOENT;
>>>> @@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>        * to report the overall busyness. This is what the 
>>>> wait-ioctl does.
>>>>        *
>>>>        */
>>>> -retry:
>>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>>> -
>>>> -    /* Translate the exclusive fence to the READ *and* WRITE 
>>>> engine */
>>>> -    args->busy = 
>>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>>> -
>>>> -    /* Translate shared fences to READ set of engines */
>>>> -    list = dma_resv_shared_list(obj->base.resv);
>>>> -    if (list) {
>>>> -        unsigned int shared_count = list->shared_count, i;
>>>> -
>>>> -        for (i = 0; i < shared_count; ++i) {
>>>> -            struct dma_fence *fence =
>>>> -                rcu_dereference(list->shared[i]);
>>>> -
>>>> +    args->busy = false;
>>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>
>>> You did not agree with my suggestion to reset args->busy on restart 
>>> and so preserve current behaviour?
>>
>> No, I want to keep the restart behavior internally to the dma_resv 
>> object and as far as I can see it should not make a difference here.
>
> To be clear, on paper difference between old and new implementation is 
> if the restart happens while processing the shared fences.
>
> Old implementation unconditionally goes to "args->busy =
> >>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));" and so 
> overwrites the set of flags returned to userspace.
>
> New implementation can merge new read flags to the old set of flags 
> and so return a composition of past and current fences.
>
> Maybe it does not matter hugely in this case, depends if userspace 
> typically just restarts until flags are clear. But I am not sure.
>
> On the higher level - what do you mean with wanting to keep the 
> restart behaviour internal? Not providing iterators users means of 
> detecting it? I think it has to be provided.

Ok I will adjust that for now to get the patch set upstream. But in 
general when somebody outside of the dma_resv code base depends on the 
restart behavior then that's a bug inside the design of that code.

The callers should only care about what unsignaled fences are inside the 
dma_resv container and it shouldn't matter if those fences are presented 
once or multiple times because of a reset..

When this makes a difference we have a bug in the handling and should 
probably consider taking the dma_resv.lock instead.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>>> +            /* Translate the exclusive fence to the READ *and* 
>>>> WRITE engine */
>>>> +            args->busy = busy_check_writer(fence);
>>>> +        else
>>>> +            /* Translate shared fences to READ set of engines */
>>>>               args->busy |= busy_check_reader(fence);
>>>> -        }
>>>>       }
>>>> -
>>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>>> -        goto retry;
>>>> +    dma_resv_iter_end(&cursor);
>>>>         err = 0;
>>>>   out:
>>>>
>>

