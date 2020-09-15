Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23B526A3FA
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 13:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgIOLQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgIOLPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:15:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF7CC061221;
        Tue, 15 Sep 2020 04:03:42 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id q13so4373484ejo.9;
        Tue, 15 Sep 2020 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tf9aVEsdXq4hvSPyIfdqowWXQx44PZPondYe5kmz/4k=;
        b=opnPO/r49FBHXTZplwVibG1zx7WYGIg0k+7HzzemOWXPDTJAPb5OaPiQofB6VKHYOx
         ZWmCKlUgo/+KApsc/iM6Oyr4UPU+GkFsE1rxiRcjVFtsKyclzVS7L2eDdFUTpqHIZqYr
         tcrG+95v6XQBOR5ouXG6EKOILLHlseliNnS4GFlamKMXnY6Hd9PfygI9TdpOShLPoWCj
         XjxK8ROzbHIFXcOM1WGnatlEBXSKtkwCTunXSooQ9yv0kiF07dJpWLVw0p8Jx9SWdPhn
         HoXYJLSHNaN5AAz5V5Iao4eX4tBfm4tc98ouvb12ri5RA8DAjAKotawpUjfV3h6JHuYB
         gBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=tf9aVEsdXq4hvSPyIfdqowWXQx44PZPondYe5kmz/4k=;
        b=WOYe8xRpBMBYZHKLlIFPEVk04wlSGJH6Tl1ISzrxejWm57P5HuB8MkBzZFhkwIWQVt
         XVcf6csbSj48gqTqGAreOn8MWuMcLx/gyXUcKMTPKU0q15iAtCBiQkhFsU7HRj4Gjg6J
         fEpKPqDAFEQPadqBWim3xW5cg3WDxFKRzt4TRBVYtrs2Aw/B8+a33bvyTa2vLpyaQIAE
         DdfnKg7CLz4meJfzcUwA1Ej9aSrfR41mQwCuBv8g01dMIEB7iHroOmVs+veF+aTSwjMA
         jppjgILa6uk4s6sQZlZQXT8jKnq9gteXPqjLhCEutkqKC/agXAKvwxdPn49mfD0ffdIP
         VT+Q==
X-Gm-Message-State: AOAM530dE+2r+qDwx//arM4M+yMai3JbM56RSF6u1roWdM9OHyiUTrkO
        YSci573YXg0BrmU2ekzYzpT7v9Np6Yy2rw==
X-Google-Smtp-Source: ABdhPJxfW0HVgypcFl09FE5Qg1TZt4Ht/6KefSB8Cm0t+kwNcgrEBFWDZzSO/WzygzmfhzF4uCiGjg==
X-Received: by 2002:a17:906:9491:: with SMTP id t17mr20156636ejx.253.1600167821140;
        Tue, 15 Sep 2020 04:03:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id ks21sm9916283ejb.63.2020.09.15.04.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 04:03:40 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported
 dma-buf"
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <20200914132920.59183-2-christian.koenig@amd.com>
 <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
Date:   Tue, 15 Sep 2020 13:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.09.20 um 12:39 schrieb Daniel Vetter:
> On Mon, Sep 14, 2020 at 3:29 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> This reverts commit 26d3ac3cb04d171a861952e89324e347598a347f.
>>
>> We need to figure out if dma_buf_mmap() is valid or not first.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> The trouble is that doing dma-buf mmap by looking at the struct pages
> behind the sg list and just inserting those into userspace doesn't
> really work any better. You still won't get the unmap_mapping_range
> and hence pte shoot-down. So maybe dma_buf_mmap forwarding doesn't
> work, but this doesn't make it any better.

Good point. Question is what should we do? Return -EPERM?

>
> Also commit message should probably explain a bit the context here,
> not a lot of people have been in our private discussion on this.

Well, that's certain true.

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 0a952f27c184..cd727343f72b 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -594,9 +594,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>>          /* Remove the fake offset */
>>          vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>>
>> -       if (obj->import_attach)
>> -               return dma_buf_mmap(obj->dma_buf, vma, 0);
>> -
>>          shmem = to_drm_gem_shmem_obj(obj);
>>
>>          ret = drm_gem_shmem_get_pages(shmem);
>> --
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>

