Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6C640C449
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 13:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhIOLVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 07:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhIOLVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 07:21:13 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CBAC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 04:19:54 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q11so3272205wrr.9
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=93lsXU/Z3uxd8n34/9P2RUUBOmtBhYmL6uqJmdWmF/o=;
        b=FQNYqWS4ukF31jcFARjgKDPNO9U9aouBEuBONB/qI4hHlUp1KzR9maed8WVf3OWJO8
         85TLH+YTmkH3tw0CfVzOXwI+iOtJF4kOffF0dTr1s/Pjd2670p2Qf4LuQFyIqp8JXQFi
         XWkenTcCx01zB81GfqOYW4UP/io6X8tVe9sT0ndKSlPfX4HE/EP1HzYCGTYLITN/H6Dc
         3jxKXiSzQt+ZEIcz7DzBtRD4eNIU501L864O2eOyBIyFgvTf7mKxgiAtev3bjuTcF/nW
         kVbw7aRw3wSsT7OzhJhjOZNXXZSmicoz4m/9xxj3L8xv/Mjc5bmoWY876ggpDz0AOyS6
         utbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=93lsXU/Z3uxd8n34/9P2RUUBOmtBhYmL6uqJmdWmF/o=;
        b=jzhlkgsN6xp2iyQ4Q7B6C684/8QmAt0u78dsTKYMhHOUGb2BrjY/MD2vs3msokMT92
         rzmB7R+gT+RtGLu8QH4TjTkMujdhsNenaoTKmjebhIRjXtcslhMAQxGgDxRL7+mvm3QT
         7FTrNohpCOPqDOuDAJRLVKF+ub74vRGjVK0Rtac/qXXdjsSN2cFoXu97/Stglyg7J21e
         UKazGePzxDAdpLUQkqQMLE7bdFCe4/Hktdx45Mb+dh/wrs8JXFOyvtl0EbfhmjW539fx
         6HWMG0nstLfUgHRkYVzJJ4KARd2rRr3F/c317zhft4t/8QRvabaTa86eIR0uZB7XtD2q
         IGAQ==
X-Gm-Message-State: AOAM531MlvFUYeaU6Fa4L1B6fObmtD7tIEa3ZP9tgXdOLNUc39aPoSTt
        3XyK9BYWUpFs6jIftuA1zgg=
X-Google-Smtp-Source: ABdhPJzo7z9Zb7dkNgAWCsWWmzcOTtaDbeuyUXJErhg6OxOAjyeFUh0u1y5yexp4OvMxrUy1oSqjJQ==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr4451441wrr.98.1631704793321;
        Wed, 15 Sep 2021 04:19:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d03d:8939:3840:1f95? ([2a02:908:1252:fb60:d03d:8939:3840:1f95])
        by smtp.gmail.com with ESMTPSA id l1sm3450397wmq.8.2021.09.15.04.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 04:19:52 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-19-christian.koenig@amd.com>
 <46a40614-b448-7f2d-7b6b-0705c4277e2b@linux.intel.com>
 <6c0217a7-6ac8-0c12-4087-ee55f456f99c@gmail.com>
 <f9b65430-de19-7c3b-c77f-5a88114037c5@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <be670538-cba3-1362-c79d-910a0bb54b3d@gmail.com>
Date:   Wed, 15 Sep 2021 13:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f9b65430-de19-7c3b-c77f-5a88114037c5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.09.21 um 14:47 schrieb Tvrtko Ursulin:
>
> On 14/09/2021 13:32, Christian König wrote:
>> Am 14.09.21 um 14:27 schrieb Tvrtko Ursulin:
>>>
>>> On 13/09/2021 14:16, Christian König wrote:
>>>> This is maybe even a fix since the RCU usage here looks incorrect.
>>>
>>> What you think is incorrect? Pointless extra rcu locking?
>>
>> Yeah, exactly that. I also wondered for a second if rcu_read_lock() 
>> can nest or not. But obviously it either works or lockdep hasn't 
>> complained yet.
>>
>> But I've made a mistake here and at a couple of other places to 
>> remove to many rcu_read_lock() calls. Thanks for pointing that out, 
>> going to fix it as well.
>
> Ack.
>
>>> Also, FWIW, I submitted a patch to remove this function altogether 
>>> since its IMO pretty useless, just failed in getting anyone to ack 
>>> it so far.
>>
>> I was on the edge of suggesting that as well since it's only debugfs 
>> usage looked quite pointless to me.
>>
>> Feel free to CC me on the patch and you can have my acked-by.
>
> Patch is here 
> https://patchwork.freedesktop.org/patch/451864/?series=94202&rev=1, 
> thanks!

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to that one.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Thanks,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
>>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index e9eecebf5c9d..3343922af4d6 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
>>>>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>>>>   {
>>>>       struct intel_engine_cs *engine = NULL;
>>>> +    struct dma_resv_cursor cursor;
>>>>       struct dma_fence *fence;
>>>>   -    rcu_read_lock();
>>>> -    fence = dma_resv_get_excl_unlocked(obj->base.resv);
>>>> -    rcu_read_unlock();
>>>> -
>>>> -    if (fence && dma_fence_is_i915(fence) && 
>>>> !dma_fence_is_signaled(fence))
>>>> -        engine = to_request(fence)->engine;
>>>> -    dma_fence_put(fence);
>>>> -
>>>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
>>>> +                     fence) {
>>>> +        if (fence && dma_fence_is_i915(fence) &&
>>>> +            !dma_fence_is_signaled(fence))
>>>> +            engine = to_request(fence)->engine;
>>>> +    }
>>>>       return engine;
>>>>   }
>>>>
>>

