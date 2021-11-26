Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884DA45EC31
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 12:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235331AbhKZLJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 06:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235779AbhKZLHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 06:07:32 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4FDC0619F6
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 02:30:22 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so6486786wmb.0
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 02:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zTg0WacJr7kzwrsnQJsQDndFsSlk7FEd+90GUlUHgJI=;
        b=o6BgQc+l+C4RBDUwYZTioNATMY6ijtPxOhlL2eg6/yNMCiU6RhD6u2R4bMkx7dGIOJ
         M7Hi7pSKfDOppaNmI3xCaoQg+wN/d7k2Uaqz5rEFxykNt5tkzLvgR/iQszQaRxW+VUYn
         mkb5LJXmscDRFd10ZtW2Xmlygpt86CLq6Xac4qLHwhtiNw646RXheHzNmZGgxBC0tWBi
         wh1Plz8ot0Y4Oaf6YNkCZpz0jLHDvWcLiHpp5IHlOuNazGT6Urr3W8BNKSjAHq7O5l/E
         kPCD9h/UDZrYjsw9lk1EJGGVI681GwGDQbq0voKEzIG4EXVr2+JANPkGFXjYxnaP3F9c
         kLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zTg0WacJr7kzwrsnQJsQDndFsSlk7FEd+90GUlUHgJI=;
        b=RFe65H/RSgpkdQJSOKo0md1ldjHqqKUlm2vpxDoFUILTjv0hoDci3qhSDbqQl/kySq
         SD8KfKzGFoCn0ESf+PYj6P/4hKrOSotdzLhvjGAd8w2SlamyQ5zhiBnjFol/xk6ifS2C
         LJ0dvwBag8/YueIoot6sm6GikdSJYIRthnjdWYEGF8EviTBOedyAwEDi8mlucfKwluUh
         LYklFY1kfkU0HssDUzfOqKR7+Blh2ILM6OyqbNaa5RM2SVup6l3RwL1LQmggwTZ89wJd
         UCMGGg2ZquYPM5NB7fSfl0f5RtQJ5Ht2gry/nNLewvCNzDe6U0jEFOcjv6dUSuSJbe3y
         SW3w==
X-Gm-Message-State: AOAM532U4MT+Yfx6X95qY+KGIkApZjQqZ3nAtPyqBiCPpQmY709APjAF
        2Yb17qWSi5gf075OQFRBqFoPBycL2pQ=
X-Google-Smtp-Source: ABdhPJzFenGp5brgkbj5MZQnP7FS6lJhdyGMVEwRhXdQZTcZJLb6MPZQPA33OW7GQm6nsgS0NHfbiA==
X-Received: by 2002:a05:600c:364f:: with SMTP id y15mr13749998wmq.7.1637922621452;
        Fri, 26 Nov 2021 02:30:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:108:c3ea:37df:ad4c? ([2a02:908:1252:fb60:108:c3ea:37df:ad4c])
        by smtp.gmail.com with ESMTPSA id o10sm6549508wri.15.2021.11.26.02.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 02:30:20 -0800 (PST)
Subject: Re: [PATCH 19/26] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-20-christian.koenig@amd.com>
 <YZ+wCxjFSI4EAIvx@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0a3f93f1-278e-c393-3e79-745a52694f3d@gmail.com>
Date:   Fri, 26 Nov 2021 11:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+wCxjFSI4EAIvx@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.11.21 um 16:47 schrieb Daniel Vetter:
> On Tue, Nov 23, 2021 at 03:21:04PM +0100, Christian König wrote:
>> Use dma_resv_get_singleton() here to eventually get more than one write
>> fence as single fence.
> Yeah this is nice, atomic commit helpers not supporting multiple write
> fences was really my main worry in this entire endeavour. Otherwise looks
> all rather reasonable.
>
> I'll try to find some review bandwidth, but would be really if you can
> volunteer others too (especially making sure ttm drivers set the KERNEL
> fences correctly in all cases).

Maybe I should split that up into switching over to adding the enum and 
then switching to kernel/bookkeep(previously other) for some use cases.

It would be good if I could get an rb on the trivial driver cleanups 
first. I can send those out individually if that helps.

Thanks,
Christian.

> -Daniel
>
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
>>   1 file changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index c3189afe10cb..9338ddb7edff 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -143,25 +143,21 @@
>>    */
>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   {
>> -	struct dma_resv_iter cursor;
>>   	struct drm_gem_object *obj;
>>   	struct dma_fence *fence;
>> +	int ret;
>>   
>>   	if (!state->fb)
>>   		return 0;
>>   
>>   	obj = drm_gem_fb_get_obj(state->fb, 0);
>> -	dma_resv_iter_begin(&cursor, obj->resv, false);
>> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> -		/* TODO: Currently there should be only one write fence, so this
>> -		 * here works fine. But drm_atomic_set_fence_for_plane() should
>> -		 * be changed to be able to handle more fences in general for
>> -		 * multiple BOs per fb anyway. */
>> -		dma_fence_get(fence);
>> -		break;
>> -	}
>> -	dma_resv_iter_end(&cursor);
>> +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
>> +	if (ret)
>> +		return ret;
>>   
>> +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
>> +	 * to handle more fences in general for multiple BOs per fb.
>> +	 */
>>   	drm_atomic_set_fence_for_plane(state, fence);
>>   	return 0;
>>   }
>> -- 
>> 2.25.1
>>

