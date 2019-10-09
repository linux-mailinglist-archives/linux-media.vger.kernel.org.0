Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D54D0FAD
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfJINKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:10:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40502 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731129AbfJINKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 09:10:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so2913767wrv.7
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vzaTTrF4KJIoLtgxoj5PluvZsZC/0i3InXaG/lQH1VA=;
        b=GnFLtj9EZ5d/HfgB5GBL2qwQ1VFDFmLQrT7d6vy9ec4i0oD0STil1BwTz7w/uskWoF
         2miBKROoD6snTohxmVVxczZqLQZuFppN9CPU59LZjqBcBJ9k2X+niZwMG37vaoxymsSi
         qGj+cQ3Btc3Dk3urId01qq+lAuQWOW1xTk4cSwPPuYEdu4lIS1nSa496Aq3ynqO45cy2
         GkKhAFISZFq9vrePCKsZ1eG91u3QKmOY/i+OkmkiO7qbcjwYFU2zrCH/O3WcPtRhTpo8
         RFRIwIbM8Q47bNxqdRU6tdEnwBiWWrBAmefa2N9YbdyzaQXss3iFkKFRajveSb1xWJIQ
         Mkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=vzaTTrF4KJIoLtgxoj5PluvZsZC/0i3InXaG/lQH1VA=;
        b=WzuoFi9lL1sL4Fw58CUflysQUSuEoIIuQigObtEfflYNicufTgZ2lf8cpyJ/GclFuA
         p0yszGAlR4FUMCFVTB1CrQRAM3v3/sFlncXjGHrgx2QbPcjd6QdI60g7gIRFekzLP7do
         N8c02hLDK/PBIZSNc8j0J0HY8OAaPRxChqDRCXuh6xNnH6ll9nhiyDuYyW93yArJ1hDl
         URXfxDukvYHDlvHLy6BZTXgWHGfQN6L3p60KTYlKaCNXSex2qtMWEA93Iks2p0GZ6dO2
         Vk/5MRocMwt2mZNXwzlnyF9an08qiLYyqKCZMtSEWpTcrFK3fQdIB6wv8wgmjZBNSDKB
         f/yg==
X-Gm-Message-State: APjAAAWN2ortB7Okw/ZEdXmJ3eaRp/lSkOfJDS31Mk4o0CCwwSWvJAxj
        vqyJgK6znoyVLeG+/ekayZ8=
X-Google-Smtp-Source: APXvYqyUsoeQL71x6y1pF4VHQfKQaKru0b/PZKZyqJoIWa5aQSip6LHZ4aCzy10h821zYOyXbBUF3Q==
X-Received: by 2002:adf:814d:: with SMTP id 71mr2969304wrm.193.1570626611493;
        Wed, 09 Oct 2019 06:10:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id a2sm3526687wrt.45.2019.10.09.06.10.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:10:10 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-3-christian.koenig@amd.com>
 <20191008092552.GG16989@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d36c1631-1262-8c73-e62b-bbbddb708f1e@gmail.com>
Date:   Wed, 9 Oct 2019 15:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008092552.GG16989@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.10.19 um 11:25 schrieb Daniel Vetter:
> On Thu, Aug 29, 2019 at 04:29:15PM +0200, Christian König wrote:
>> This way we can even pipeline imported BO evictions.
>>
>> v2: Limit this to only cases when the parent object uses a separate
>>      reservation object as well. This fixes another OOM problem.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Since I read quite a bit of ttm I figured I'll review this too, but I'm
> totally lost. And git blame gives me at best commits with one-liner commit
> messages, and the docs aren't explaining much at all either (and generally
> they didn't get updated at all with all the changes in the past years).
>
> I have a vague idea of what you're doing here, but not enough to do review
> with any confidence. And from other ttm patches from amd it feels a lot
> like we have essentially a bus factor of 1 for all things ttm :-/

Yeah, that's one of a couple of reasons why I want to get rid of TTM in 
the long term.

Basically this is a bug fix for delay freeing ttm objects. When we hang 
the ttm object on a ghost object to be freed and the ttm object is an 
imported DMA-buf we run into the problem that we want to drop the 
mapping, but have the wrong lock taken (the lock of the ghost and not of 
the parent).

Regards,
Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index fe81c565e7ef..2ebe9fe7f6c8 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -517,7 +517,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>   	kref_init(&fbo->base.kref);
>>   	fbo->base.destroy = &ttm_transfered_destroy;
>>   	fbo->base.acc_size = 0;
>> -	fbo->base.base.resv = &fbo->base.base._resv;
>> +	if (bo->base.resv == &bo->base._resv)
>> +		fbo->base.base.resv = &fbo->base.base._resv;
>> +
>>   	dma_resv_init(fbo->base.base.resv);
>>   	ret = dma_resv_trylock(fbo->base.base.resv);
>>   	WARN_ON(!ret);
>> @@ -716,7 +718,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>>   		if (ret)
>>   			return ret;
>>   
>> -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
>> +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
>>   
>>   		/**
>>   		 * If we're not moving to fixed memory, the TTM object
>> @@ -729,7 +731,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>>   		else
>>   			bo->ttm = NULL;
>>   
>> -		ttm_bo_unreserve(ghost_obj);
>> +		dma_resv_unlock(&ghost_obj->base._resv);
>>   		ttm_bo_put(ghost_obj);
>>   	}
>>   
>> @@ -772,7 +774,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>>   		if (ret)
>>   			return ret;
>>   
>> -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
>> +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
>>   
>>   		/**
>>   		 * If we're not moving to fixed memory, the TTM object
>> @@ -785,7 +787,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>>   		else
>>   			bo->ttm = NULL;
>>   
>> -		ttm_bo_unreserve(ghost_obj);
>> +		dma_resv_unlock(&ghost_obj->base._resv);
>>   		ttm_bo_put(ghost_obj);
>>   
>>   	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
>> @@ -841,7 +843,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = dma_resv_copy_fences(ghost->base.resv, bo->base.resv);
>> +	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
>>   	/* Last resort, wait for the BO to be idle when we are OOM */
>>   	if (ret)
>>   		ttm_bo_wait(bo, false, false);
>> @@ -850,7 +852,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>>   	bo->mem.mem_type = TTM_PL_SYSTEM;
>>   	bo->ttm = NULL;
>>   
>> -	ttm_bo_unreserve(ghost);
>> +	dma_resv_unlock(&ghost->base._resv);
>>   	ttm_bo_put(ghost);
>>   
>>   	return 0;
>> -- 
>> 2.17.1
>>

