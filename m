Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFC84112BE
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 12:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhITKQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 06:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhITKQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 06:16:11 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D80C061574
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 03:14:44 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id w29so28018253wra.8
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+apC5JxraIi9XnUbenkB6zsj+jT1AkPdAZhfDaY0/v0=;
        b=UU5S0gXMkaLgT22FL8u7q7ClemU+rsXCqmg08b57Lq39L1VejhAjRb6zljx7QdAZZh
         zxAg64pHaQO4y6OTgp5uARWIQq3mnLiU9mRR9B15QNXMtU3XIt/6olcCOdat5K4g7i1m
         Q8s4GpiM3WdaNYflS+o/a6P7rMoQeggLekVKLUWZs9KXIix1+rsGLjNkJWsyMt0dGM3j
         AbriRT7fFda6QkaQcMoB5MxrnT1BRfzGzxk8Xfmyf6D9TlYH9eMrlILzkrBilvVkyuVC
         7JrdPFg6KhAiFwkc2QnqPwjPuFGMI2IJWHOjyeDKJGwn598ieFoz0PWkp8hNl+AQfh+5
         IpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+apC5JxraIi9XnUbenkB6zsj+jT1AkPdAZhfDaY0/v0=;
        b=CRiF7HkeV5m2FCAZhIorwctjOGlR6H43AQIePuXe9xHu8v3HqChPHag6yvphv4nFa7
         B4TmGOV1Sb9OH31FYWS/M6Uabo5YOW0lyudWW+uiJmPmwXMWOweEA3I8Pl2NYiJ7fzSl
         QoPIPzseNHRFOtUvFOe09VAx99v4eF/O4EgKQsIt/wec9dc7HeefnVIqfwTuchG3mhoC
         Zv2HPInTt+hIl2y71xQyqfHRZnKuff3Y0lD3/wm/jmoccuQgrU8LwIxBZ2GxdYHlCKoe
         FtomrNPl/v8pu+10+dxyAnZOx9bY9glmDK+gZW2Ou26tKyh2YPUXRgdBEzoKO+DmBR9m
         uGHg==
X-Gm-Message-State: AOAM532yAhBfMDe3r2ReX7I4BZgc1408Ke4f0BlKsEXnmWbcsIuCjQIi
        zkUMAIFyMrVmMn4CSToHTnADeJ87q5c=
X-Google-Smtp-Source: ABdhPJzOGMrZWZx0h8K8o0iVBQ2Hv8r57sd/+E+hm7Ot4KkLG7Ct2SBV+DbPgKDuKkPBBUjH/z4+qg==
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr23905344wmi.145.1632132883040;
        Mon, 20 Sep 2021 03:14:43 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l124sm19159561wml.8.2021.09.20.03.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 03:14:42 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-15-christian.koenig@amd.com>
 <93b93f00-7ad3-9ea3-e947-77297b4552c9@linux.intel.com>
 <60595ff8-7935-c0a4-7c0f-2a4c3a1d62b9@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3a029992-a648-7684-235e-b5bc53391d5d@gmail.com>
Date:   Mon, 20 Sep 2021 12:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <60595ff8-7935-c0a4-7c0f-2a4c3a1d62b9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.09.21 um 10:47 schrieb Tvrtko Ursulin:
>
> On 20/09/2021 09:45, Tvrtko Ursulin wrote:
>>
>> On 17/09/2021 13:35, Christian König wrote:
>>> Simplifying the code a bit.
>>>
>>> v2: use dma_resv_for_each_fence instead, according to Tvrtko the 
>>> lock is
>>>      held here anyway.
>>> v3: back to using dma_resv_for_each_fence_unlocked.
>>
>> It did not work out - what happened?
> Wait, my suggestion to try the locked iterator was against 
> i915_request_await_object. I haven't looked at this one at the time or 
> even now.

Exactly! I've mixed the two up and this one here is really called 
without holding a lock.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_sw_fence.c | 57 
>>> ++++++++--------------------
>>>   1 file changed, 15 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c 
>>> b/drivers/gpu/drm/i915/i915_sw_fence.c
>>> index c589a681da77..7635b0478ea5 100644
>>> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
>>> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>>> @@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct 
>>> i915_sw_fence *fence,
>>>                       unsigned long timeout,
>>>                       gfp_t gfp)
>>>   {
>>> -    struct dma_fence *excl;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *f;
>>>       int ret = 0, pending;
>>>       debug_fence_assert(fence);
>>>       might_sleep_if(gfpflags_allow_blocking(gfp));
>>> -    if (write) {
>>> -        struct dma_fence **shared;
>>> -        unsigned int count, i;
>>> -
>>> -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> -        for (i = 0; i < count; i++) {
>>> -            if (shared[i]->ops == exclude)
>>> -                continue;
>>> -
>>> -            pending = i915_sw_fence_await_dma_fence(fence,
>>> -                                shared[i],
>>> -                                timeout,
>>> -                                gfp);
>>> -            if (pending < 0) {
>>> -                ret = pending;
>>> -                break;
>>> -            }
>>> -
>>> -            ret |= pending;
>>> -        }
>>> -
>>> -        for (i = 0; i < count; i++)
>>> -            dma_fence_put(shared[i]);
>>> -        kfree(shared);
>>> -    } else {
>>> -        excl = dma_resv_get_excl_unlocked(resv);
>>> -    }
>>> -
>>> -    if (ret >= 0 && excl && excl->ops != exclude) {
>>> -        pending = i915_sw_fence_await_dma_fence(fence,
>>> -                            excl,
>>> -                            timeout,
>>> +    rcu_read_lock();
>>> +    dma_resv_iter_begin(&cursor, resv, write);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, f) {
>>> +        rcu_read_unlock();
>>> +        pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>>>                               gfp);
>>> -        if (pending < 0)
>>> +        rcu_read_lock();
>>> +        if (pending < 0) {
>>>               ret = pending;
>>> -        else
>>> -            ret |= pending;
>>> -    }
>>> -
>>> -    dma_fence_put(excl);
>>> +            break;
>>> +        }
>>> +        ret |= pending;
>>> +    }
>>> +    dma_resv_iter_end(&cursor);
>>> +    rcu_read_unlock();
>>>       return ret;
>>>   }
>>>

