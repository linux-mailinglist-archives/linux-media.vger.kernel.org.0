Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A286433692
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 15:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbhJSNEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 09:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235557AbhJSNEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 09:04:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8DCC061745
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 06:02:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r18so47607832wrg.6
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zoeKeQkU3KvxnJa2mZcZh7Nvtdmvi6KvvNHJWqgrlL8=;
        b=FSCLJ7rXFMRdh8Hphd/PqIDV+GZiMLqJSKAwavuZJNmFA/mMD9Ak0NQPQbbpgDDnNc
         fXKDZZ1y9N1+JUIR4tKmMmLZOZ3nnVtTcDn8tRKqQbKVIX6v7xwHeff2kEU7BiR1NA+g
         PQV/Nwg7i1nm+yqzXLYYhPVunq2dbEY0AuI+jw943gw1sg35lXKh2L/36UxV8SoLJa0l
         K7mBye1O98rGDeQKm4zm16bdddNgVXAXlKvqLPcxu1k1UlWpsV9KV5AmlNlydNp8OYDV
         FDoW/JXk8+BGNCmOWKNE8QMVSKSjFNSqd8lns9m6GnYyI4059eFsZI7tKciAzZzjQqyg
         2RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zoeKeQkU3KvxnJa2mZcZh7Nvtdmvi6KvvNHJWqgrlL8=;
        b=YLktDq8wpCooAUIL3Qf4a/n652GykDnn9KKRnU9ZNsrCky/3aHy9WqEQQDVy6r2eJU
         U57OXVXzVU+G5SVhZRMb6SLmp5HZc+imqpEASQm89g5mh2oHc4ktOlafA2z8uLOltW+s
         L/WCJOUsjw/MyWoAYuzhGo+y4mGtK4/AYwbYvcB8rwBrx60qHimehq2VBLX3Rc9c++YI
         yx0Dlod/BTXGYKnEDB7mtl5jlekK731WJoQ7YdwjtiLoS/ws2X1881AARlYpwd/MyBLV
         SMqPBpmN10s02HEYZTQYV3NDHDaIthTreaMxJ3cV0xhUJU1zFAvUmnup59Zqjp7tjTq5
         8xyA==
X-Gm-Message-State: AOAM533HsmoTgbwCu8e7kjvM8819UN40hE7sca+Tl1KNVw2fnR265key
        uFG9PzHRb26Fevm2+iGcnqpPX4ycRYE=
X-Google-Smtp-Source: ABdhPJwYkuZW66DOQ5LnvWYT8S9+EZRh5ym4fe7u61zzmk2TGTHLVlTipFq0g7dFHF62PBJ/0ELvHg==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr43616254wrb.103.1634648547710;
        Tue, 19 Oct 2021 06:02:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50? ([2a02:908:1252:fb60:f344:748e:38f7:c50])
        by smtp.gmail.com with ESMTPSA id t8sm15103147wrx.46.2021.10.19.06.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 06:02:27 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-25-christian.koenig@amd.com>
 <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <405b9df8-58fd-b8f2-cec2-acde69aa5633@gmail.com>
Date:   Tue, 19 Oct 2021 15:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.10.21 um 16:23 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:38PM +0200, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> v2: improve coding and documentation
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index e570398abd78..8534f78d4d6d 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -143,6 +143,7 @@
>>    */
>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   {
>> +	struct dma_resv_iter cursor;
>>   	struct drm_gem_object *obj;
>>   	struct dma_fence *fence;
>>   
>> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>>   		return 0;
>>   
>>   	obj = drm_gem_fb_get_obj(state->fb, 0);
>> -	fence = dma_resv_get_excl_unlocked(obj->resv);
>> -	drm_atomic_set_fence_for_plane(state, fence);
>> +	dma_resv_iter_begin(&cursor, obj->resv, false);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		/* TODO: We only use the first write fence here and need to fix
>> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
>> +		 * one. */
> I'm confused, right now there is only one write fence. So no need to
> iterate, and also no need to add a TODO. If/when we add more write fences
> then I think this needs to be revisited, and ofc then we do need to update
> the set_fence helpers to carry an entire array of fences.

Well could be that I misunderstood you, but in your last explanation it 
sounded like the drm_atomic_set_fence_for_plane() function needs fixing 
anyway because a plane could have multiple BOs.

So in my understanding what we need is a 
drm_atomic_add_dependency_for_plane() function which records that a 
certain fence needs to be signaled before a flip.

Support for more than one write fence then comes totally naturally.

Christian.

> -Daniel
>
>> +		dma_fence_get(fence);
>> +		break;
>> +	}
>> +	dma_resv_iter_end(&cursor);
>>   
>> +	drm_atomic_set_fence_for_plane(state, fence);
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>> -- 
>> 2.25.1
>>

