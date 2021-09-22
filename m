Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029DA414BFA
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 16:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbhIVOcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 10:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbhIVOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 10:32:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9E0C061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 07:31:14 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so7358784wrv.10
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6+ziFqfFy8tUj5gzWw86pYLxOc595Xo/AjkfAmBa908=;
        b=K67bSyxTp3ZCWesKPb97kyJAm3vnTIN17UBOtqFBWEV5azCeYOHHHhVlux5V0oR2j6
         HbAAnVqAcX6k0GQXAe5oPRd8d5+YvMlK0QtRdtTWHmWMvGJj0oZOS6kpO881yrpPs12X
         Q0zPhcxDkxPlw5lB00MtlRIzjlZBiJOkVpRNuIF2AHXtAODNvmqKq1Frvy4eZ/aczBKh
         lEH1ETXwtO0jQg8eSmSXI7OBtNMR/NCe7T3e48Jqf8ztmSWvqZVAN1rVR4BYkNQ1bHwg
         aoPaFCPYECdPKrFGfEd4rH7FNOA33hx051yI8kMWhTT54PKAOr9XADHjgletpWicG3I8
         IQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6+ziFqfFy8tUj5gzWw86pYLxOc595Xo/AjkfAmBa908=;
        b=VAsmokg1tawOwQnLqCDsaNZvqIoKxALgHZ7Q7gzr99h9VAW3zEWpvsTfRllBFcv04W
         p9iqKE0MWl1vWQ+N/sjC9GRonsJCJJ1/mCEd2r2jPmzvahqsw7+5QokGL0YuXyhT8lN0
         8uuG7wABoCLJk6hMfm86cK+HPb4HCJUhFwnIRpbhzKoHUddfuSc2EkFtMKbA4aefUxfB
         9IjoUgHd/b8ALGNFlOihQpbKkc1rFe8ULDtgE+ImOcB1wg+xNt++2YWDJkB0NR3Otafl
         N9hDZseoBDAFKMm7bir0pKgs+4GgOxEAblYSvpVDmf3TlUEaJ0XfRBIxG9FrZT6MGCeQ
         GdBQ==
X-Gm-Message-State: AOAM531bPjVecQbfJ55czYL+kH06ZcNwdj95D4/8WQNI/9HvbTtAuigx
        ecSsxcvLJNu6HeOQ+QL37jUac3hcMAg=
X-Google-Smtp-Source: ABdhPJx+1fhNG4+4ei6QAwpCbb/RRpqC5TGiPZYBRWYQUFK2+/82eGkOvanY1qn8p5mJxdbPjVmGEg==
X-Received: by 2002:adf:d21c:: with SMTP id j28mr1660105wrh.43.1632321073308;
        Wed, 22 Sep 2021 07:31:13 -0700 (PDT)
Received: from [192.168.158.115] (ip-178-202-40-91.hsi09.unitymediagroup.de. [178.202.40.91])
        by smtp.gmail.com with ESMTPSA id j21sm2348710wrd.48.2021.09.22.07.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 07:31:11 -0700 (PDT)
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2afbdc22-28a7-9a47-186c-f47b4f5aceab@gmail.com>
Date:   Wed, 22 Sep 2021 16:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.09.21 um 12:21 schrieb Tvrtko Ursulin:
>
> On 22/09/2021 10:10, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..313afb4a11c7 100644
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
>> +    args->busy = false;
>
> You can drop this line, especially since it is not a boolean. With that:

I just realized that this won't work. We still need to initialize the 
return value when there is no fence at all in the resv object.

>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Does that still counts if I set args->busy to zero?

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
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

