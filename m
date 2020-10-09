Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB2A2883A4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 09:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731972AbgJIHdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 03:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgJIHdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:33:08 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1708AC0613D2;
        Fri,  9 Oct 2020 00:33:08 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o18so8367814edq.4;
        Fri, 09 Oct 2020 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zHLZR+cdQxUXAapkvnhHRxEGDbtuU0jlMqUOlyS9CQ8=;
        b=IwKJFEewQoSKcdG2YAPPCbvHXC/d2fJCXSoWKxPDWofdhldJOtN8hS/Pi5QmL2msmn
         fgO0tfHHRvDJp5uq9wMO8PF1j4J3ajDFOYcMFiiaYbCL9NgUHnvdfzApp7sEygo8gHxC
         XuNUH0cjc2UyhfzR8KOepak+beCJyiDatAyXYrrwq6vTnuio5ewdh3s45qi6I4MnPepn
         RvfsaAkCY5dUJqRtOzl726dnOvp9VkasIudKgL/r8Bwc1xElpx5geFYNETeMzzNk/itj
         Se2doJ6dBHD+gWR5v+n062bMQQl2yZI38NO7DfFv72qUtNzYYk4S/7RgNX+cj0ebgjTt
         XBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zHLZR+cdQxUXAapkvnhHRxEGDbtuU0jlMqUOlyS9CQ8=;
        b=P6sqXqkAWz3OHeqX77gE/6fZ6tO3ILgJSIlcGHYXxMXCWLMl/Nm2IuCI+jBVXOKqzI
         X4z2RftAEMFYIPmNWmSGoZHFJv2u0rduM3vIpTwrNbmEjADmvTiaKV8kSVXSDu3OLF0p
         7F1fiApK7EJld/fGBZxIeOCrB1IiLWOzia7+S7SpkZs19khAIZEpW2T+d9oYsI7KSBO+
         GtGqK3xsQNvvyYwkp5ncKsf/vm/NZAsr7zkKOKMdX7thFyMV5RjBH3ojvaEcktrqKR5L
         6eN0I5xvwAZowconMiz5gRZn6S1psnAkskGei9Nw9A3ulwspSJoiTkGtsVVmeq0Obef+
         XrOQ==
X-Gm-Message-State: AOAM53328EeCEeKOXS5r4DvHBwgr4IDMaRc7TAMhGO3zE4tXkqUG36un
        i5WZlrWyvzkt1DsJGa5KyCHcGoitBIs=
X-Google-Smtp-Source: ABdhPJzXIarjT4XlMBlwIGVzLRN/9SvySlM1kW8J0vZXEormyHb9njn+Y4gL6yZ2ZXkN7zR7BWjQ5A==
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr12533300edq.59.1602228786703;
        Fri, 09 Oct 2020 00:33:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id gv10sm5824756ejb.46.2020.10.09.00.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 00:33:06 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To:     John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com,
        akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
Date:   Fri, 9 Oct 2020 09:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.10.20 um 23:49 schrieb John Hubbard:
> On 10/8/20 4:23 AM, Christian König wrote:
>> Add the new vma_set_file() function to allow changing
>> vma->vm_file with the necessary refcount dance.
>>
>> v2: add more users of this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
>>   drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>>   drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>>   drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>>   drivers/staging/android/ashmem.c           |  5 ++---
>>   include/linux/mm.h                         |  2 ++
>>   mm/mmap.c                                  | 16 ++++++++++++++++
>>   10 files changed, 32 insertions(+), 28 deletions(-)
>
> Looks like a nice cleanup. Two comments below.
>
> ...
>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 3d69e51f3e4d..c9d5f1a38af3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct 
>> vm_area_struct *vma)
>>        * requires avoiding extraneous references to their filp, hence 
>> why
>>        * we prefer to use an anonymous file for their mmaps.
>>        */
>> -    fput(vma->vm_file);
>> -    vma->vm_file = anon;
>> +    vma_set_file(vma, anon);
>> +    fput(anon);
>
> That's one fput() too many, isn't it?

No, the other cases were replacing the vm_file with something 
pre-allocated and also grabbed a new reference.

But this case here uses the freshly allocated anon file and so 
vma_set_file() grabs another extra reference which we need to drop.

The alternative is to just keep it as it is. Opinions?

>
>
> ...
>
>> diff --git a/drivers/staging/android/ashmem.c 
>> b/drivers/staging/android/ashmem.c
>> index 10b4be1f3e78..a51dc089896e 100644
>> --- a/drivers/staging/android/ashmem.c
>> +++ b/drivers/staging/android/ashmem.c
>> @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct 
>> vm_area_struct *vma)
>>           vma_set_anonymous(vma);
>>       }
>>   -    if (vma->vm_file)
>> -        fput(vma->vm_file);
>> -    vma->vm_file = asma->file;
>> +    vma_set_file(vma, asma->file);
>> +    fput(asma->file);
>
> Same here: that fput() seems wrong, as it was already done within 
> vma_set_file().

No, that case is correct as well. The Android code here has the matching 
get_file() a few lines up, see the surrounding code.

I didn't wanted to replace that since it does some strange error 
handling here, so the result is that we need to drop the extra reference 
as again.

We could also keep it like it is or maybe better put a TODO comment on it.

Regards,
Christian.

>
>
>
> thanks,

