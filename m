Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FB411018
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 09:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhITHci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 03:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbhITHch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 03:32:37 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DA5C061574
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 00:31:11 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso11383784wme.0
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C+nvY/BAbTa7xL9nvPKJe3AuiPmfIWaUColu4UW3xMk=;
        b=OqISqpoYcxBujvtx67SbnL8TeOJWntq93m8yGSJ6KZnynG+H0m+xeFBQSlif5WL4qh
         XF7NuDJqOFkeK+rK5yq6EwJDSxRV3qHHN/h/cfndtwgqXCNhP0+GXqiPiNyvIjVI4jHp
         uKyps+vByGX2yGwVsHmtSG+zgKfYgo94OUt1e2AqugJnZzV76z9SitUrmT1JEiauO+r2
         gc3hHS0/dQ4ZQm0HKVdJNY03YC6rjVAl1M1zxMIsguatxqtO8tNCrIZnEQar7LINrTKb
         dX6MD/OxdGeHkrEgztYQKqsG3Sn0F8XBMG4c2H27Xu4rvpyW78TinhI2DqMxTX7HxiDH
         i8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C+nvY/BAbTa7xL9nvPKJe3AuiPmfIWaUColu4UW3xMk=;
        b=M9zULYkzFKDMOuIVbieyjxbQZkY0BL67y4KdkOQaP095qEmRGOn3/aDGXD7WB9iGws
         dKlx9YNn587xf+nYpTKF2vQd7S6PFAsUJSey/bXB1RUpJGMtESb7iEP+c2I1vyqMMlUn
         qzg2PTXhbGb3DRqKFTdxJQQSDm/0WINa2Ig0A0LMu3LSKX+rWN/YhqDcfGHeYtd/Sn4d
         7c4Z9eXoun4cAammuifrtLL/WsDEvijT1ZoQ/kSGu8GaTIE9a4BCZIj+vcBn7jc/MEy5
         oLG4savA0cwejY2xm8zNpGisBlqIYbvZ30ZVAgr+K0jHOFNLXLFbeUSrigE2NB1lMjGO
         8exg==
X-Gm-Message-State: AOAM532ooM9jpTCa9aMrUWGKiAN3+SbjAyq1FYHHxjcARnO2mvWLDKdi
        PuZAI4ipQj432pRNHZ965qmxjIFvCYk=
X-Google-Smtp-Source: ABdhPJw/Ntw29LRKB7ZUkAUXnJ/6trbaxzAp6Mj1XsFXISe1P5uJ0g4pHAgvCS/BPgom+xqmNI6JzQ==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr22858196wmj.33.1632123069769;
        Mon, 20 Sep 2021 00:31:09 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm15204382wmq.23.2021.09.20.00.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 00:31:09 -0700 (PDT)
Subject: Re: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-21-christian.koenig@amd.com>
 <YUSr7AN3vv6kpreo@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0ed5793b-7b24-dede-cb89-deda082dde5b@gmail.com>
Date:   Mon, 20 Sep 2021 09:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUSr7AN3vv6kpreo@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.21 um 16:53 schrieb Daniel Vetter:
> On Fri, Sep 17, 2021 at 02:35:07PM +0200, Christian König wrote:
>> Simplifying the code a bit.
>>
>> v2: add missing rcu_read_lock()/unlock()
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> This will be gone as soon as I can land the last conversion patches. Plus
> it's always called with dma_resv_lock held.

Yeah, already thought so as well. I will just keep that around to get 
rid of dma_resv_get_excl_unlocked() for now until your patch lands.

Regards,
Christian.

>
> I wouldn't bother tbh.
> -Daniel
>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 34 ++++++++++++----------------------
>>   1 file changed, 12 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 09c820045859..c2c41b668f40 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>>   				     struct drm_gem_object *obj,
>>   				     bool write)
>>   {
>> -	int ret;
>> -	struct dma_fence **fences;
>> -	unsigned int i, fence_count;
>> -
>> -	if (!write) {
>> -		struct dma_fence *fence =
>> -			dma_resv_get_excl_unlocked(obj->resv);
>> -
>> -		return drm_gem_fence_array_add(fence_array, fence);
>> -	}
>> -
>> -	ret = dma_resv_get_fences(obj->resv, NULL,
>> -						&fence_count, &fences);
>> -	if (ret || !fence_count)
>> -		return ret;
>> -
>> -	for (i = 0; i < fence_count; i++) {
>> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
>> +	struct dma_resv_iter cursor;
>> +	struct dma_fence *fence;
>> +	int ret = 0;
>> +
>> +	rcu_read_lock();
>> +	dma_resv_iter_begin(&cursor, obj->resv, write);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		rcu_read_unlock();
>> +		ret = drm_gem_fence_array_add(fence_array, fence);
>> +		rcu_read_lock();
>>   		if (ret)
>>   			break;
>>   	}
>> -
>> -	for (; i < fence_count; i++)
>> -		dma_fence_put(fences[i]);
>> -	kfree(fences);
>> +	dma_resv_iter_end(&cursor);
>> +	rcu_read_unlock();
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
>> -- 
>> 2.25.1
>>

