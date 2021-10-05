Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AB2422360
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 12:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhJEK3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 06:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbhJEK3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 06:29:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621E6C061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 03:27:57 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o4-20020a05600c510400b0030d55d6449fso2501521wms.5
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kho0a35tcTvwlWpi5rtKIMqf35HFHYFjgSKnZBnXZsw=;
        b=T70aUK9jA4vKL40rXJdZt8UdxDE5rcJtolyMQHjgK2Xc0e+UYo2yuvRh/f35X9x/de
         90mNlB6c2BMXmufHRi/rySvgCZzt5Pc7aPNjP7UKLFuYJzSJr/FWO9MLbqV1xiZM+CPT
         GtSQ4eKOMKLlH13uQJWFfC4rPyfxHuSW24pnAXWQpQ01R6zZbzSXN4DJCo1OEk+WAdtN
         ujF4OekTH1TXkqNDf/amCQ0+PQqnGdgYkOP1qR/Av6S9Far6S/bl0xfHz2u8k6WzqLd1
         JFn2pScqoEF5OvoGHWePftYwpNZW/ioWtojRpz0UIHoe+qK1H79fagxwHL9vC+uuHJ68
         98xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kho0a35tcTvwlWpi5rtKIMqf35HFHYFjgSKnZBnXZsw=;
        b=pnrmLsPdo4Qktv9v68D0n28Idt1LJjbEDELg/rjGevryW8aT7kBst8Vu77CeEQ/o+v
         L7ysqGZJfRCtiE0Hfm+637Lw2fTsjwMOFJiWsBqPcjPBafFwcS+n8AMVdpw+/jihfrVy
         wlBVHGDV9n4RJWrkz3QgokpAPN9pgSGAYnl6IBMmLtLVEC576SuPYejRfLSKeXnlWNXj
         LELK0X6AndsoJ2a/MXa3sKZmV7gA5Klbyxk/Io9ZgOxvhZWFP1Z+F6MnGNixpD1mJ/hf
         Rv4L5NWi9c2ooj7UwZGG2VDl4Sro3inv6MnWP9NFWnbHMW2owoC75jAMouAu7RWT9nq4
         yboA==
X-Gm-Message-State: AOAM533Pua5ILMwv/s/1cKPOfxWbDmi+FWGqCyk0WPfCbQ8RWWEdTpEc
        oIVyqnAoMoSFV1pONbC0flRGDvaCM5o=
X-Google-Smtp-Source: ABdhPJxfUh2w+bcIbJ9A2HD7U1SbcakoN0gg4Y1tCsPkyWfmc74pveYYb7fxwPzGvmatmwb+2YfI/g==
X-Received: by 2002:a05:600c:230f:: with SMTP id 15mr2546316wmo.19.1633429676019;
        Tue, 05 Oct 2021 03:27:56 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id m14sm1390738wmi.47.2021.10.05.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 03:27:55 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-25-christian.koenig@amd.com>
 <80bb132f-0e40-68a1-d034-2d4b17d321ad@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4e94e263-fd20-4779-690a-b530c220b350@gmail.com>
Date:   Tue, 5 Oct 2021 12:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <80bb132f-0e40-68a1-d034-2d4b17d321ad@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.10.21 um 09:53 schrieb Tvrtko Ursulin:
>
> On 01/10/2021 11:06, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c 
>> b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index e570398abd78..21ed930042b8 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -143,6 +143,7 @@
>>    */
>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct 
>> drm_plane_state *state)
>>   {
>> +    struct dma_resv_iter cursor;
>>       struct drm_gem_object *obj;
>>       struct dma_fence *fence;
>>   @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct 
>> drm_plane *plane, struct drm_plane_st
>>           return 0;
>>         obj = drm_gem_fb_get_obj(state->fb, 0);
>> -    fence = dma_resv_get_excl_unlocked(obj->resv);
>> -    drm_atomic_set_fence_for_plane(state, fence);
>> +    dma_resv_iter_begin(&cursor, obj->resv, false);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        dma_fence_get(fence);
>> +        dma_resv_iter_end(&cursor);
>> +        /* TODO: We only use the first write fence here */
>
> What is the TODO? NB instead?

The drm atomic API can unfortunately handle only one fence and we can 
certainly have more than that.

>
>> + drm_atomic_set_fence_for_plane(state, fence);
>> +        return 0;
>> +    }
>> +    dma_resv_iter_end(&cursor);
>>   +    drm_atomic_set_fence_for_plane(state, NULL);
>
>     dma_resv_iter_begin(&cursor, obj->resv, false);
>     dma_resv_for_each_fence_unlocked(&cursor, fence) {
>         dma_fence_get(fence);
>         break;
>     }
>     dma_resv_iter_end(&cursor);
>
>     drm_atomic_set_fence_for_plane(state, fence);
>
> Does this work?

Yeah that should work as well.

>
> But overall I am not sure this is nicer. Is the goal to remove 
> dma_resv_get_excl_unlocked as API it just does not happen in this series?

Yes, the only user left is the i915_gem_object_last_write_engine() 
function and that one you already removed in i915.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>       return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>

