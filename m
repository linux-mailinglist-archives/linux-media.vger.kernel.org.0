Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE42EFED3
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 14:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389006AbfKENkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 08:40:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36697 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388615AbfKENkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 08:40:02 -0500
Received: by mail-wm1-f68.google.com with SMTP id c22so20177371wmd.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=b0UuCF0aZQ2aI4sXMhK55aJLis22oaUy2VUMpSDxgso=;
        b=CUqNwSoarPHuHTIr2+8gVOa44pJC6vMOr+Eukgv7xaoow0yLUfWXtbonm7uUT95uGl
         Ty0tDiNpGjEFv2JuoDjxn3dkgeaH0Qig3eZ5DzDU0dpHn1lqvBffuO/33nyoBLfftQEC
         BItIwev7gzLMrWRxQxwB22t9LlIOPoQ7xG4VAknq0PqA75hq1vbZ+pOV+WmXh5NFDtUg
         WFmeKL4xcU8CGjSJXjheghqM35FrErJARAcRixhnt3lWXIwMzLZj2i/WpOcxJwDazwFF
         R9phxIIAwuHqg10L25RwF3x3pvYxN8+hf5d2fESLggegKm7l69L98iesHKyKvI4cSIi4
         E2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=b0UuCF0aZQ2aI4sXMhK55aJLis22oaUy2VUMpSDxgso=;
        b=IJRO0jo48u7FwFG3tapFWh1SrreF499DaRwFl+mYYoT4oMl4xJDeYcQ/rWah7XZLb6
         2QPhVeUxwXdg6h9NBiZ0MgpCQcWP5DJdibGpX3nkwrCOt39UDQ4J+VbsVCeQ2BQ26SBX
         KA/jWnfefgCqx2hXYYukW88XIvpIfeIe0Kt7liTknEkInZOyrESAo2EmiCpucsljcBNa
         WLfaCLVUd7xF4eiTRDGxJIn305dH8pA+j+cKKjL+D4tKW8CA6h1ZcNClX66HX21lmg3d
         d6V9SiIiaVpbwXrtcLF4Du2c6lCRz3xKSZMmo859RPw9QQPpSvD34F07blzQWbS3rm1A
         odJw==
X-Gm-Message-State: APjAAAVpAjp8XYBcGrENQbyxqx7wXLr8AqkfpTTBH0Ao/E1wR9/53abN
        Za595yqX9X9m7sa++grKOXA=
X-Google-Smtp-Source: APXvYqzZ6sdPhnPCT5teu/ZgEP0SZG0SRu2jQT/ZQ3dDbBTGI9htRohDdc5AHqxb6x0HBdCoe6Uiag==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr4081706wmj.139.1572961199528;
        Tue, 05 Nov 2019 05:39:59 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id h124sm21913478wmf.30.2019.11.05.05.39.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 05:39:58 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-6-christian.koenig@amd.com>
 <20191105105252.GE10326@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c506743-1def-2c49-886a-4fa125b33151@gmail.com>
Date:   Tue, 5 Nov 2019 14:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105105252.GE10326@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.11.19 um 11:52 schrieb Daniel Vetter:
> On Tue, Oct 29, 2019 at 11:40:49AM +0100, Christian König wrote:
>> Implement the importer side of unpinned DMA-buf handling.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 28 ++++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +++++
>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 3629cfe53aad..af39553c51ad 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -456,7 +456,33 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>   	return ERR_PTR(ret);
>>   }
>>   
>> +/**
>> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
>> + *
>> + * @attach: the DMA-buf attachment
>> + *
>> + * Invalidate the DMA-buf attachment, making sure that the we re-create the
>> + * mapping before the next use.
>> + */
>> +static void
>> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>> +{
>> +	struct ttm_operation_ctx ctx = { false, false };
>> +	struct drm_gem_object *obj = attach->importer_priv;
>> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>> +	struct ttm_placement placement = {};
>> +	int r;
>> +
>> +	if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
>> +		return;
>> +
>> +	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
>> +	if (r)
>> +		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
> Where do you update pagetables?
>
> The only thing I've found is in the amdgpu CS code, which is way to late
> for this stuff here. Plus TTM doesn't handle virtual memory at all (aside
> from the gart tt), so clearly you need to call into amdgpu code somewhere
> for this. But I didn't find it, neither in your ->move_notify nor the
> ->move callback in ttm_bo_driver.
>
> How does this work?

Page tables are not updated until the next command submission, e.g. in 
amdgpu_cs.c

This is save since all previous command submissions are added to the 
dma_resv object as fences and the dma_buf can't be moved before those 
are signaled.

Christian.

> -Daniel
>
>> +}
>> +
>>   static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
>> +	.move_notify = amdgpu_dma_buf_move_notify
>>   };
>>   
>>   /**
>> @@ -492,7 +518,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>>   		return obj;
>>   
>>   	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
>> -					&amdgpu_dma_buf_attach_ops, NULL);
>> +					&amdgpu_dma_buf_attach_ops, obj);
>>   	if (IS_ERR(attach)) {
>>   		drm_gem_object_put(obj);
>>   		return ERR_CAST(attach);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index ac776d2620eb..cfa46341c9a7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -861,6 +861,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
>>   		return 0;
>>   	}
>>   
>> +	if (bo->tbo.base.import_attach)
>> +		dma_buf_pin(bo->tbo.base.import_attach);
>> +
>>   	bo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>>   	/* force to pin into visible video ram */
>>   	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
>> @@ -944,6 +947,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
>>   
>>   	amdgpu_bo_subtract_pin_size(bo);
>>   
>> +	if (bo->tbo.base.import_attach)
>> +		dma_buf_unpin(bo->tbo.base.import_attach);
>> +
>>   	for (i = 0; i < bo->placement.num_placement; i++) {
>>   		bo->placements[i].lpfn = 0;
>>   		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

