Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE05F4334C8
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 13:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhJSLim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 07:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhJSLim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 07:38:42 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E300C06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 04:36:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id p21so11561243wmq.1
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M3LiI2dynM1nZYamguT3elJaAc7JLzbkcv2J5Oa0PxI=;
        b=ax+//QLOzRzifYURKML/tpp9AHBIzuQk6Eb/IVxhDu6QdiTQJke+WQUPauvV2csBmx
         vbPKIuyiSVuZi6DEux2yncqUbJPeYbXJ70zZjwlwYyLarry5WIdUU8oJqwwqBvTNXexF
         Axa38j9hCiGDqxWXABvDM2kiU1Ht7FmAYx2MTyXhNOvHpHwXgdGarwrChwlX2XJmy4//
         sbr/fsjx8QO11RqD2J+ip+sGz5dLM/exoR2UYnRdHdJ0MRCAVUSySKp1ZII/dOuSwhF5
         IWnSJa0nEKe8FRJA8NX/x4JD6yuoUdjDA2p9o8gz3EflwgSJAY0PycNHbOD1aCwQ0PNM
         I84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M3LiI2dynM1nZYamguT3elJaAc7JLzbkcv2J5Oa0PxI=;
        b=IqhXUpccAcXX/WTOhYgi1bwYjVPGo0dVmJFdJufgjEf5kRWCjJElSizNUyNgdR+0Ey
         7EfLk1KMKAZrMHxJfaY3OaYGTsh04clKhJc+g6G9yQJXWhyYVUI6EM/bqXdyTFRRGctM
         UqwZSKwGmmBXZ7JH8nEXk+edMq2qF5Za3JoLB+X5d1S+NFju5b2gl1EgVffQESBUWoLb
         u4DcsPP3HxHPY7wP5Tw9kOBbBZWSlTyww78dF0C+brHPsrRjl9qRDdpcKYH8V82R40BS
         9DWDB3AQgITT7nLBS6qvQvMEJhCQ5hwsJ0CKUJ2+ikk16Bt+XbYVOLtZzwmO8CpVdb59
         wDJg==
X-Gm-Message-State: AOAM530XJq/3Da2e3QibicxUsVR42FkyNAuQe0eSRC77TwDF98iOOiJ6
        hpN4EIFpGRW1Xqixm7CxmTNaQburrn8=
X-Google-Smtp-Source: ABdhPJxKJUE9DPjZGw2RK07XvLt3WGtWLRzf2uHEQt87Ekn7KXR93fRKOrmLCyCNH19mhUgCaBWjQw==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr5228360wml.177.1634643387780;
        Tue, 19 Oct 2021 04:36:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50? ([2a02:908:1252:fb60:f344:748e:38f7:c50])
        by smtp.gmail.com with ESMTPSA id c3sm13657502wrw.66.2021.10.19.04.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 04:36:27 -0700 (PDT)
Subject: Re: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-13-christian.koenig@amd.com>
 <YWboMfLOIjl1l7tF@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a0a926a7-13d0-b996-5f32-36aa6d74165e@gmail.com>
Date:   Tue, 19 Oct 2021 13:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWboMfLOIjl1l7tF@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.10.21 um 16:07 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:26PM +0200, Christian König wrote:
>> Simplifying the code a bit.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
>>   1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index e8d70b6e6737..722e3c9e8882 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1345,10 +1345,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>   					    const struct ttm_place *place)
>>   {
>>   	unsigned long num_pages = bo->resource->num_pages;
>> +	struct dma_resv_iter resv_cursor;
>>   	struct amdgpu_res_cursor cursor;
>> -	struct dma_resv_list *flist;
>>   	struct dma_fence *f;
>> -	int i;
>>   
>>   	/* Swapout? */
>>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>> @@ -1362,14 +1361,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>   	 * If true, then return false as any KFD process needs all its BOs to
>>   	 * be resident to run successfully
>>   	 */
>> -	flist = dma_resv_shared_list(bo->base.resv);
>> -	if (flist) {
>> -		for (i = 0; i < flist->shared_count; ++i) {
>> -			f = rcu_dereference_protected(flist->shared[i],
>> -				dma_resv_held(bo->base.resv));
>> -			if (amdkfd_fence_check_mm(f, current->mm))
>> -				return false;
>> -		}
>> +	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
> 							    ^false?
>
> At least I'm not seeing the code look at the exclusive fence here.

Yes, but that's correct. We need to look at all potential fences.

It's a design problem in KFD if you ask me, but that is a completely 
different topic.

Christian.

> -Daniel
>
>> +		if (amdkfd_fence_check_mm(f, current->mm))
>> +			return false;
>>   	}
>>   
>>   	switch (bo->resource->mem_type) {
>> -- 
>> 2.25.1
>>

