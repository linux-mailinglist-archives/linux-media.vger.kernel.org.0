Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F0F413868
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhIURh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhIURhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:37:25 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5599C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:35:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u15so41542436wru.6
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pjqKqzaBO9YyQO367dYMB1dDo+YYIgVSgR/HrzoDvi8=;
        b=VAWOp3vu7I9NZWj+CDh0Uq6VZIkinG4zw2HMbEZHawTH16JcaVUQsPRjvliVWnXV3+
         hnugVB9+23rO1xEwveQtykl4KJALqNGkJFBqrDEe0xeS5LDIqC1DM+4Tnsmw9a3XWfFx
         Kp9CWeis9kXuzWbVGhlIpATvazFfzDTzp5bEt0Bl08GNEJdSepDebs2ykaJJTRaoq8Ra
         pfZgcun+poAF6cHb3uQ15ZAhvEs3sqUptn/HTzwM5Roxr1hKR5NYYz1xOYZiViJw7K75
         CB23B33OiBOu7rmPnGhLvCwbSAl6FWxMQjR5WQeZ528P6+WyjkhbCLF4Ju44R40QSwxZ
         4itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pjqKqzaBO9YyQO367dYMB1dDo+YYIgVSgR/HrzoDvi8=;
        b=D/0PRjz+WzMKb2yJwYxVmLNbrIzsGqe0knSPFwmWsZFq+lW2ZSQ5CjtKQ6AHXir4kS
         6UXvuSQbhXtluS2j9+q10ogYWl2XTVinqlPzHdkjStXM4ipA/VF/eoCd92Ug+6C0uBv9
         24osZoufvWh6UwVv0TVrjMuD70ckllaX+hFvt2bwy5S0ztLpJzo51GVFCOTfgMzotBKL
         GdaK9zAabAbyJezc8ZWQqXteZdGN8b8tk2xIZZJ4sN/6MuZPJiMOs17PQEAVWSMJ2Bt9
         PbyZpOfZ09m9/Wdeh8Y12e0M26s6IvVbsnk/3kK3EqW3GkzHznmyVVE+9yIJ3OEkgYVH
         +0fA==
X-Gm-Message-State: AOAM533u+lkoWusXNZkgZ6u1irWo6xvYkUHkQQ1KHsr9DF1XuAkx9Jmy
        ZsGrIR8d26Yav6gaNjqkDMs=
X-Google-Smtp-Source: ABdhPJwJWQCDHc22GOt0rL6e5r9tsPU6MOyCstVOccOTTCM2dqPsA7Oo/iRnbKWpSF53M64HeTWEwA==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr5964375wmc.19.1632245755419;
        Tue, 21 Sep 2021 10:35:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e90f:ea29:b3d5:61cf? ([2a02:908:1252:fb60:e90f:ea29:b3d5:61cf])
        by smtp.gmail.com with ESMTPSA id g13sm3359161wmh.20.2021.09.21.10.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 10:35:54 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 16/26] drm/i915: use new iterator in
 i915_gem_object_wait_reservation v2
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-17-christian.koenig@amd.com>
 <e0954bdd-2183-f662-8192-c44f931c602b@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e66dd0dc-02a6-7437-ab98-dff4e8ff8de3@gmail.com>
Date:   Tue, 21 Sep 2021 19:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e0954bdd-2183-f662-8192-c44f931c602b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.09.21 um 12:00 schrieb Tvrtko Ursulin:
>
> On 17/09/2021 13:35, Christian König wrote:
>> Simplifying the code a bit.
>>
>> v2: add missing rcu read unlock.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 57 ++++++------------------
>>   1 file changed, 14 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> index f909aaa09d9c..e416cf528635 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> @@ -37,55 +37,26 @@ i915_gem_object_wait_reservation(struct dma_resv 
>> *resv,
>>                    unsigned int flags,
>>                    long timeout)
>>   {
>> -    struct dma_fence *excl;
>> -    bool prune_fences = false;
>> -
>> -    if (flags & I915_WAIT_ALL) {
>> -        struct dma_fence **shared;
>> -        unsigned int count, i;
>> -        int ret;
>> -
>> -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>> -        if (ret)
>> -            return ret;
>> -
>> -        for (i = 0; i < count; i++) {
>> -            timeout = i915_gem_object_wait_fence(shared[i],
>> -                                 flags, timeout);
>> -            if (timeout < 0)
>> -                break;
>> -
>> -            dma_fence_put(shared[i]);
>> -        }
>> -
>> -        for (; i < count; i++)
>> -            dma_fence_put(shared[i]);
>> -        kfree(shared);
>> -
>> -        /*
>> -         * If both shared fences and an exclusive fence exist,
>> -         * then by construction the shared fences must be later
>> -         * than the exclusive fence. If we successfully wait for
>> -         * all the shared fences, we know that the exclusive fence
>> -         * must all be signaled. If all the shared fences are
>> -         * signaled, we can prune the array and recover the
>> -         * floating references on the fences/requests.
>> -         */
>> -        prune_fences = count && timeout >= 0;
>> -    } else {
>> -        excl = dma_resv_get_excl_unlocked(resv);
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *fence;
>> +
>> +    rcu_read_lock();
>> +    dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        rcu_read_unlock();
>> +        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
>
> Converting this one could be problematic. It's the wait ioctl which 
> used to grab an atomic snapshot and wait for that rendering to 
> complete. With this change I think it has the potential to run forever 
> keeps catching new activity against the same object.
>
> I am not sure whether or not the difference is relevant for how 
> userspace uses it but I think needs discussion.

It was years ago, but IIRC we had the same discussion for the 
dma_resv_wait_timeout() function and the result was that this is not a 
valid use case and waiting forever if you see new work over and over 
again is a valid result.

Let me double check the history of this code here as well.

> Hm actually there are internal callers as well, and at least some of 
> those have the object locked. Would a wider refactoring to separate 
> those into buckets (locked vs unlocked) make sense?

Yes definitely.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>
>> +        rcu_read_lock();
>> +        if (timeout < 0)
>> +            break;
>>       }
>> -
>> -    if (excl && timeout >= 0)
>> -        timeout = i915_gem_object_wait_fence(excl, flags, timeout);
>> -
>> -    dma_fence_put(excl);
>> +    dma_resv_iter_end(&cursor);
>> +    rcu_read_unlock();
>>         /*
>>        * Opportunistically prune the fences iff we know they have 
>> *all* been
>>        * signaled.
>>        */
>> -    if (prune_fences)
>> +    if (timeout > 0)
>>           dma_resv_prune(resv);
>>         return timeout;
>>

