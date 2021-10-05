Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7034226F9
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 14:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbhJEMqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 08:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhJEMqo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 08:46:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0C8C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 05:44:53 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u18so37142401wrg.5
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YMDignomC08BRwfUF/sIHCEC10nMlQk67HXzVn7ZgmM=;
        b=kcJKNkA8MP3I3nwjUUdmLOsGEoBkTzagGxarJ0cb/Lp8dHfy1mkTCiVS07Or/O8Tvf
         kUIUp3AkgnVjVEAZVG7erWoxbVm2wXH3KT32M1IjWyzbby0eX6XaLlKhNJ+ucAfRtdsW
         Idy+LdhaCKwNSV7/9oLUti9Mj6ZeKD4bbBI0uPxtn4KdBj6v3nsEh6vUBPvh25SKpk8t
         hKlyatAeCD6FZwAgiIbDZPjp1PKI4M+i+PZe1cFyhSfcqers2UmilbXmzIAZ4WH6mtMB
         KKzYagjhkkE41HdfAVsJnuzyV+t8PMOd2KalVxoDNIEPR0IBe20yFjvpRfbfeHHqkpDg
         eqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YMDignomC08BRwfUF/sIHCEC10nMlQk67HXzVn7ZgmM=;
        b=lr1MliSGuQevRthdgxmkl2rH17xge4J5zXbWwoWLXeaFKZFm7Rd1xMoSCUSWOSgvOg
         zlRChS+bjBExa/q55YJDoh2ent5nZoGpfr7D5UuvN04MhFtyfeUe7LVMUcaSMdsbKLXZ
         Mmxp1YVhjUQbf5SBwBwEGkxMjkr0kBQK6tKXD+tauCauxq7huz+siXcta9zGFKLfPLxC
         qEC80TZwDQXYrJ5dfGG+ElzN4hJU6pRAziZUddyDF9DB69tiPR+D2wg1AVagw20BHQa/
         utP4P6NgUL+Hol8ByQr+MHyBM78M6ByV/zd8U63ULNl5o8SW8Bo5XiqIQElmKlhsugme
         Otjw==
X-Gm-Message-State: AOAM532NY1hCtm7QmLM++9Ry0QdRW9or/weUk5kf1MWqtqCrfVuhR8/y
        34NFE0PMXHylpDd8y9+0vLs=
X-Google-Smtp-Source: ABdhPJzMC2KLIRqY0Nit2YvLoMyvCYBUDyf84pyfU7SSY9HZsKtYwNlBnTdpeDAU8lKbJG76NGuY8Q==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr21566451wri.62.1633437892428;
        Tue, 05 Oct 2021 05:44:52 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id k26sm2571252wms.39.2021.10.05.05.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 05:44:52 -0700 (PDT)
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-18-christian.koenig@amd.com>
 <50b8ffb7-2720-619d-3140-af2f90450a21@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <65e28697-6f0a-7f97-d49b-ebf8d0b8d23f@gmail.com>
Date:   Tue, 5 Oct 2021 14:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <50b8ffb7-2720-619d-3140-af2f90450a21@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.10.21 um 14:40 schrieb Tvrtko Ursulin:
>
> On 05/10/2021 12:37, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Reminder - r-b was retracted until at least more text is added to 
> commit message about pros and cons. But really some discussion had 
> inside the i915 team on the topic.

Sure, going to move those to a different branch.

But I really only see the following options:
1. Grab the lock.
2. Use the _unlocked variant with get/put.
3. Add another _rcu iterator just for this case.

I'm fine with either, but Daniel pretty much already rejected #3 and 
#2/#1 has more overhead then the original one.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..dc72b36dae54 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>> *data,
>>   {
>>       struct drm_i915_gem_busy *args = data;
>>       struct drm_i915_gem_object *obj;
>> -    struct dma_resv_list *list;
>> -    unsigned int seq;
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *fence;
>>       int err;
>>         err = -ENOENT;
>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>> void *data,
>>        * to report the overall busyness. This is what the wait-ioctl 
>> does.
>>        *
>>        */
>> -retry:
>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>> -
>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>> -    args->busy = 
>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>> -
>> -    /* Translate shared fences to READ set of engines */
>> -    list = dma_resv_shared_list(obj->base.resv);
>> -    if (list) {
>> -        unsigned int shared_count = list->shared_count, i;
>> -
>> -        for (i = 0; i < shared_count; ++i) {
>> -            struct dma_fence *fence =
>> -                rcu_dereference(list->shared[i]);
>> -
>> +    args->busy = 0;
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        if (dma_resv_iter_is_restarted(&cursor))
>> +            args->busy = 0;
>> +
>> +        if (dma_resv_iter_is_exclusive(&cursor))
>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>> engine */
>> +            args->busy |= busy_check_writer(fence);
>> +        else
>> +            /* Translate shared fences to READ set of engines */
>>               args->busy |= busy_check_reader(fence);
>> -        }
>>       }
>> -
>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>> -        goto retry;
>> +    dma_resv_iter_end(&cursor);
>>         err = 0;
>>   out:
>>

