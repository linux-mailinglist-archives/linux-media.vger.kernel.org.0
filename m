Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09094148B5
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 14:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhIVMX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 08:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhIVMXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 08:23:53 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD2CC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:22:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q11so6140741wrr.9
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tSWNs0kGk+q1W6LT/3/0miI8jhwfdPFbV97Eh9vLDtQ=;
        b=J9LsT9+8y4ExWJHzDm+gWvpo+L3XRzkV7sOeoq1T1A8D/YpSJ+N8gcyijgX7AusvLY
         K6FsChREpMewAJ+fBEkNTBHnHVapNzpbQFKq9oF/4pqiy6R6B0PKOOBplyZ9CxBQ3xgT
         Jvqkp8rjan12DBW1WBxv54RTl/t/x/5CNY0T6PJcc/GtVn7cvEv7plY41bKgQlYiEQqS
         mdem95RYC5De+2TQ35pZWtWR8rehjX8fzo3j6OLDUufxjvu7WB5wYVz7lsUPRxiwfDMc
         AH3r0ZOoiRwyYqw7EDOO7+cUtkmFEIuWczEVL/NluQll5KO7rShD3+1GeJtcNubURZAW
         Ivcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tSWNs0kGk+q1W6LT/3/0miI8jhwfdPFbV97Eh9vLDtQ=;
        b=b45Y0EjsAzJQecutWjZdvP5i9UdRD/FaqDXk6WRvQisIYyEt7QheiuSO6AHev6shoJ
         Ug9LGs11fFfIXZfwoLP7Nt6KJXYL+ocol+gFG6ObU+iKXrComkQh5w0QeSyXMRdzTl0B
         fm5fX+ErKo8MVvNcEvWOHAgnULufd+Rp29L0RPs4WNwFjZJUJ+/CGpPoxLbnMLJWHoc+
         E1m5XLmFizqV5l3vPWPoYO9L94nex0irB6eHC0MPApYB1BmkHcNlVmNL6wpGp/qVNJQy
         oVPrTHjwbdOQhp/RZHca87j8T+k5HSKg53whQx/vbALBraQ62212sjYV3v9IhQ72LqZP
         EK6g==
X-Gm-Message-State: AOAM531djSZxJT/5O4ZuKmAg3tYR6hEn271lD6mquhIuULnSlUJaqfQ5
        s6Bg7/1u/RITcK6MmlGgHxvql82Q2/0=
X-Google-Smtp-Source: ABdhPJx6gbuuQAUhFbxl0ifV15VDHIHbwi/lV3H5yS5QKqeV8MD66+nObdjL7UN+ymWT5LVzZfaKPw==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr41369389wrn.389.1632313342446;
        Wed, 22 Sep 2021 05:22:22 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u13sm1738575wmq.33.2021.09.22.05.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 05:22:21 -0700 (PDT)
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
 <4c357136-3279-ff57-1c4f-62276534c887@linux.intel.com>
 <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
 <6f8140bd-9cff-e0d8-e014-b3fb8d2d8ab0@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7e03d687-4381-5263-4f03-a34f16ce8f1c@gmail.com>
Date:   Wed, 22 Sep 2021 14:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6f8140bd-9cff-e0d8-e014-b3fb8d2d8ab0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.09.21 um 14:20 schrieb Tvrtko Ursulin:
>
> On 22/09/2021 13:15, Christian König wrote:
>> Am 22.09.21 um 13:46 schrieb Tvrtko Ursulin:
>>>
>>> On 22/09/2021 11:21, Tvrtko Ursulin wrote:
>>>>
>>>> On 22/09/2021 10:10, Christian König wrote:
>>>>> This makes the function much simpler since the complex
>>>>> retry logic is now handled else where.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 
>>>>> ++++++++++--------------
>>>>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> index 6234e17259c1..313afb4a11c7 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>>>> *data,
>>>>>   {
>>>>>       struct drm_i915_gem_busy *args = data;
>>>>>       struct drm_i915_gem_object *obj;
>>>>> -    struct dma_resv_list *list;
>>>>> -    unsigned int seq;
>>>>> +    struct dma_resv_iter cursor;
>>>>> +    struct dma_fence *fence;
>>>>>       int err;
>>>>>       err = -ENOENT;
>>>>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>>> void *data,
>>>>>        * to report the overall busyness. This is what the 
>>>>> wait-ioctl does.
>>>>>        *
>>>>>        */
>>>>> -retry:
>>>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>>>> -
>>>>> -    /* Translate the exclusive fence to the READ *and* WRITE 
>>>>> engine */
>>>>> -    args->busy = 
>>>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>>>> -
>>>>> -    /* Translate shared fences to READ set of engines */
>>>>> -    list = dma_resv_shared_list(obj->base.resv);
>>>>> -    if (list) {
>>>>> -        unsigned int shared_count = list->shared_count, i;
>>>>> -
>>>>> -        for (i = 0; i < shared_count; ++i) {
>>>>> -            struct dma_fence *fence =
>>>>> -                rcu_dereference(list->shared[i]);
>>>>> -
>>>>> +    args->busy = false;
>>>>
>>>> You can drop this line, especially since it is not a boolean. With 
>>>> that:
>>>>
>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Having said this, one thing to add in the commit message is some 
>>> commentary that although simpler in code, the new implementation has 
>>> a lot more atomic instructions due all the extra fence get/put.
>>>
>>> Saying this because I remembered busy ioctl is quite an over-popular 
>>> one. Thinking about traces from some real userspaces I looked at in 
>>> the past.
>>>
>>> So I think ack from maintainers will be required here. Because I 
>>> just don't know if any performance impact will be visible or not. So 
>>> view my r-b as "code looks fine" but I am on the fence if it should 
>>> actually be merged. Probably leaning towards no actually - given how 
>>> the code is localised here and I dislike burdening old platforms 
>>> with more CPU time it could be cheaply left as is.
>>
>> Well previously we would have allocated memory, which as far as I 
>> know has more overhead than a few extra atomic operations.
>
> It doesn't, it only uses dma_resv_excl_fence and dma_resv_shared_list.

Yeah, ok then that's not really an option any more.

I think Daniel and I are totally on the same page that we won't allow 
this RCU dance in the drivers any more.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> On the other hand I could as well stick with dma_resv_get_fences() here.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> + dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>> +        if (dma_resv_iter_is_restarted(&cursor))
>>>>> +            args->busy = 0;
>>>>> +
>>>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>>>> +            /* Translate the exclusive fence to the READ *and* 
>>>>> WRITE engine */
>>>>> +            args->busy |= busy_check_writer(fence);
>>>>> +        else
>>>>> +            /* Translate shared fences to READ set of engines */
>>>>>               args->busy |= busy_check_reader(fence);
>>>>> -        }
>>>>>       }
>>>>> -
>>>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, 
>>>>> seq))
>>>>> -        goto retry;
>>>>> +    dma_resv_iter_end(&cursor);
>>>>>       err = 0;
>>>>>   out:
>>>>>
>>

