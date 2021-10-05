Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BD94224F3
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhJELZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbhJELZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:25:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E01C061764
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:23:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t2so13158997wrb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PWa0G8LLCncqq6J/n1Fr1FpsEkDA9qNPpQve05GZfrg=;
        b=it6T8Kfbu+jcw1C0phj7AmEpqUFOh80NXnr2KQSpgiDFK0qmn6hZM+4nAns7XPmzQL
         K0oWanDcdFZnHca9SMYuVOR61ZWh+l3HvmSo9prGIPTtR+SjPfWsVM4vBMhRBIU2Pbg1
         1um2Ei4G7oUIvu7mAiqQbkQhho0sYEIlFD7L3rMrBj7M5fnvrXuONKRlVOgoGBJKZzRn
         8O2IgiMHqddCsJn65fJjhO+zZUrfT8np2ZyVBUCW4dcpa6BBWLqWzI9E32+M1SdZMhsv
         xtsLjdC+DeBH3UkISfOIaxqTL55G2J9/PJmZS4NLmy42xfnJfilHzRxTvNhKu2J6heVf
         z8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PWa0G8LLCncqq6J/n1Fr1FpsEkDA9qNPpQve05GZfrg=;
        b=mywIIRluEFAX2MnlmFlud5oZ+L44eRuKpEdaQ+6hD28AkstX6dy7VkPxy6KmCF304P
         YuIRUtN8+E6T8fcnu1h763HULs5yFWIo6xPr707tVL3KMyQfhIZSCDs1zxS2jKohQ6aM
         +CdJYQj7lApm9gI/DNpWyg8N8cWmAkDf0M2E4RHgTqU7dPsEz3+TylU2SUYxX9tI2voC
         DWwSSTlk7pJevfiWEycQQ+XvhVH8EDEkbcIxsnswSEpyyxufz+lXjdswOTNaNMQr5VFo
         Pl57WNVeKZ4Kwvd7m6VEN2SsBg0ArZs0KdPgjyi8WR0RJMgA6gBiTnyYtmm97BHuaQ+6
         ouMQ==
X-Gm-Message-State: AOAM530L/hhHuDKaeeewQsiaLhqQRckGfQLT6wn47+084Voc8G4ISeMj
        2LZeQZ3MleHep1fhpr9lBAuKQQvo2Zw=
X-Google-Smtp-Source: ABdhPJzpxkpSlwzjrOFU/Ealgx1O7BSn1yO1wib6cKwvh5qjPa7VG/r5qzlgeOdH4OFek4yLJ2Cdrg==
X-Received: by 2002:adf:959a:: with SMTP id p26mr853129wrp.342.1633433002913;
        Tue, 05 Oct 2021 04:23:22 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id g2sm17256112wrq.62.2021.10.05.04.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 04:23:22 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-25-christian.koenig@amd.com>
 <80bb132f-0e40-68a1-d034-2d4b17d321ad@linux.intel.com>
 <4e94e263-fd20-4779-690a-b530c220b350@gmail.com>
 <32d9b655-0b18-417a-eefc-cc1dc41fb554@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <71441139-707b-f47d-4edb-444ac665f6a6@gmail.com>
Date:   Tue, 5 Oct 2021 13:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <32d9b655-0b18-417a-eefc-cc1dc41fb554@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.10.21 um 12:47 schrieb Tvrtko Ursulin:
>
> On 05/10/2021 11:27, Christian König wrote:
>> Am 05.10.21 um 09:53 schrieb Tvrtko Ursulin:
>>>
>>> On 01/10/2021 11:06, Christian König wrote:
>>>> Makes the handling a bit more complex, but avoids the use of
>>>> dma_resv_get_excl_unlocked().
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c 
>>>> b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> index e570398abd78..21ed930042b8 100644
>>>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> @@ -143,6 +143,7 @@
>>>>    */
>>>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, 
>>>> struct drm_plane_state *state)
>>>>   {
>>>> +    struct dma_resv_iter cursor;
>>>>       struct drm_gem_object *obj;
>>>>       struct dma_fence *fence;
>>>>   @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct 
>>>> drm_plane *plane, struct drm_plane_st
>>>>           return 0;
>>>>         obj = drm_gem_fb_get_obj(state->fb, 0);
>>>> -    fence = dma_resv_get_excl_unlocked(obj->resv);
>>>> -    drm_atomic_set_fence_for_plane(state, fence);
>>>> +    dma_resv_iter_begin(&cursor, obj->resv, false);
>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> +        dma_fence_get(fence);
>>>> +        dma_resv_iter_end(&cursor);
>>>> +        /* TODO: We only use the first write fence here */
>>>
>>> What is the TODO? NB instead?
>>
>> The drm atomic API can unfortunately handle only one fence and we can 
>> certainly have more than that.
>>
>>>
>>>> + drm_atomic_set_fence_for_plane(state, fence);
>>>> +        return 0;
>>>> +    }
>>>> +    dma_resv_iter_end(&cursor);
>>>>   +    drm_atomic_set_fence_for_plane(state, NULL);
>>>
>>>     dma_resv_iter_begin(&cursor, obj->resv, false);
>>>     dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>         dma_fence_get(fence);
>>>         break;
>>>     }
>>>     dma_resv_iter_end(&cursor);
>>>
>>>     drm_atomic_set_fence_for_plane(state, fence);
>>>
>>> Does this work?
>>
>> Yeah that should work as well.
>>
>>>
>>> But overall I am not sure this is nicer. Is the goal to remove 
>>> dma_resv_get_excl_unlocked as API it just does not happen in this 
>>> series?
>>
>> Yes, the only user left is the i915_gem_object_last_write_engine() 
>> function and that one you already removed in i915.
>
> To me the above feels clumsier than dma_resv_get_excl_unlocked and you 
> can even view it as open coding that helper. So don't know, someone 
> else can have a casting vote.
>
> I guess if support for more than one fence is coming soon(-ish) do drm 
> atomic api then I could be convinced the iterator here makes sense today.

Well Daniel noted that the drm atomic API needs some more work here 
because we don't handle different fences for different planes correctly 
either.

We could as well postpone this change and fix the atomic functions first.

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
>>>>       return 0;
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>>>
>>

