Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1F840ABDD
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 12:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbhINKlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 06:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbhINKlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 06:41:06 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5649BC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 03:39:49 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m9so19443709wrb.1
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gaNlTnM22ZgHEti35wvdLQPE6D1YFYS28Y/vm+DUkXQ=;
        b=QqCodjx6Wt7rxplRHp69uRmXcsDdQIGAGXcqU7jaZmKSst71F7O6SY/HtIw2IqE0eL
         g+0Rcnv2rUXqR6bHLdcqSBncLyp5GUhGDRpDeCfr+zzAukioMLm19ML6stXZdOeMF80h
         4AphPhTzQGEi0CFjsXV7fR9xgufdoErodhL4ZuTQqT/lfY19Eel+bLv1+mw8m8IPQq2B
         XAsWcQ0sa3tT3faKlSsfVtXuX/62FouHm6nZPGiyjv0bUU1nRH/2uJHpZXRUXyOCXIMd
         07AgaZSgPv3FSdz+kA2iRlQ1/5VZ0rbm4dibUdqOTkW7zj5FeIP3Wm5NoD7TEif+93Rp
         cDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gaNlTnM22ZgHEti35wvdLQPE6D1YFYS28Y/vm+DUkXQ=;
        b=vciwQVuIlD//zfRgIO3xUP4N+Oopeupz39hVK7dcsAL7weQ4Mj2VrgPgiqL+U8UYWR
         pbz4KW1hbF+cBghYKtGV3gvYsXzc0UdlHyWSBQhbB+z4mStTdegPLqvRJtnTjTei7HQy
         J0mvGppDN+scdSI674+W/Mls0Z90ExwPxEffOQs0BQQIOjClPZ+fG8Mk9QfPkPk6NePN
         69jY3pNvf+CULjZryfldbN6xxZ7SI9piGd8XPaIkLkZFPaYEoyWG4ur0csUz8/5cLSiJ
         +oYgw5eoaJY8gQmjmRqAsKCW2OZPKiAm+pdyE+W4HhX2nvrbUJPkI29KUzWlz7rn6eNY
         xXiQ==
X-Gm-Message-State: AOAM532y7JvzuWebw9wanR/6KA+8k+1kSK2yEwvd6QgJt9hf31yCfm4W
        fc5sqbzeHcOvGSMXBoUfy+55t7AopqcYdHYF
X-Google-Smtp-Source: ABdhPJzE0BLcszS++MT/qDVFC7rZ2jvXTXxN6JrKYzMXzPaWIgUtfMSNN5JQc9KRPYzbpk2FJTUZrg==
X-Received: by 2002:adf:f011:: with SMTP id j17mr10547094wro.320.1631615987999;
        Tue, 14 Sep 2021 03:39:47 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id 129sm750642wmz.26.2021.09.14.03.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 03:39:47 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-16-christian.koenig@amd.com>
 <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <698f042e-4fc5-2944-8d77-b89352034fcf@gmail.com>
Date:   Tue, 14 Sep 2021 12:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.09.21 um 12:26 schrieb Tvrtko Ursulin:
>
> On 13/09/2021 14:16, Christian König wrote:
>> Simplifying the code a bit.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
>>   1 file changed, 7 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>> b/drivers/gpu/drm/i915/i915_request.c
>> index 37aef1308573..b81045ceb619 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request 
>> *to,
>>                 struct drm_i915_gem_object *obj,
>>                 bool write)
>>   {
>> -    struct dma_fence *excl;
>> +    struct dma_resv_cursor cursor;
>> +    struct dma_fence *fence;
>>       int ret = 0;
>>   -    if (write) {
>> -        struct dma_fence **shared;
>> -        unsigned int count, i;
>> -
>> -        ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
>> -                      &shared);
>> -        if (ret)
>> -            return ret;
>> -
>> -        for (i = 0; i < count; i++) {
>> -            ret = i915_request_await_dma_fence(to, shared[i]);
>> -            if (ret)
>> -                break;
>> -
>> -            dma_fence_put(shared[i]);
>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, 
>> fence) {
>
> I think callers have the object locked for this one. At least if you 
> haven't tried it it's worth asking CI (you have the assert already so 
> it will tell you). But I think it's important to have an atomic 
> snapshot here.

Thanks for the info. In this case I'm just going to use the locked 
variant of the iterator here for the next round.

Could you point me to the place where the lock is grabed/released for 
reference?

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +        ret = i915_request_await_dma_fence(to, fence);
>> +        if (ret) {
>> +            dma_fence_put(fence);
>> +            break;
>>           }
>> -
>> -        for (; i < count; i++)
>> -            dma_fence_put(shared[i]);
>> -        kfree(shared);
>> -    } else {
>> -        excl = dma_resv_get_excl_unlocked(obj->base.resv);
>> -    }
>> -
>> -    if (excl) {
>> -        if (ret == 0)
>> -            ret = i915_request_await_dma_fence(to, excl);
>> -
>> -        dma_fence_put(excl);
>>       }
>>         return ret;
>>

