Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D164F26E5AC
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 21:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgIQOzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 10:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgIQOyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:54:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EF9C06174A;
        Thu, 17 Sep 2020 07:54:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id i26so3655107ejb.12;
        Thu, 17 Sep 2020 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c1K4OLtO/JfamxhTGQNbBjJeRfDJiu5hBoeNqA7D5Kw=;
        b=g1TYV9VHVKwcz9nTafvKC8w4OmKAEUl0jCZSyHCZA9P8iZbSJXmpP8bs+WeLXftwic
         SsSOtx7TfoibshDaDI+iWUkXjtekOL341z3SkKwjky6y1+CopLdp9NTpae6LdJ4xJd3S
         EIwkv5bMttxj8+Ph0AW6CTHhIHU3xZ89YB2bXXIrZ7aA7UjoeU3gm8glWoZEj2BBxoGm
         WX0PALzCq5TM2R60gsrzrvsw8U7lBiwhCHUBsQR28yKpXBd/5mrouiAACCV5ba4955/l
         ZPSvqd+BQ8GyYTkNnG85JBg3qSBdQjX0XZfS2Fwvs8b9Ghl2xtJRrFnkE7eZEqOuhPuT
         Aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=c1K4OLtO/JfamxhTGQNbBjJeRfDJiu5hBoeNqA7D5Kw=;
        b=TdzsAEZNMnHWQt7OkZj2uWRvJAAK2DWzO2NUVI273aBpaNUztAg0svJrP5OIAAtlgv
         RXkcZAgwIClBKjp6z50ltVuWAfvreNVm6bgrYq/K/GDVkwnC7Sg+o+AN+KdrPI+DwzkH
         xEcW6OJ8gX/mpNy7Bo9aT3PJa/huB5jIdiKYOIc7o+gpk0x8P+ZJoxIE+GcevlzT3Ily
         BkwX2kkAp5EFf/yuOPfXm2pwbjkins2R3c9ZK7c2QYtjHi9Qx+daxqlQ/a4lWIed+3Bd
         Pr+vmLEXX71TM5GcpFPUzdgC/yx95rcQd7Rs+VGfJFczJyxDqVikZJ6TERbPgDvAOuEZ
         KnOQ==
X-Gm-Message-State: AOAM530TxcRltLiB5vMjZ0d56AR5KndUANMPI7YGayetcDaR1pTRMFL5
        ljnmm/8wJNISuJNOy9eFXs1ZhLyIANM=
X-Google-Smtp-Source: ABdhPJyRIXuxIHC4AEt2itGA+aidcLmov+Te1dwtEYl317M/Ql/irqZHREoF1KD7oRMw6129NC5jPQ==
X-Received: by 2002:a17:906:660f:: with SMTP id b15mr32495703ejp.333.1600354486253;
        Thu, 17 Sep 2020 07:54:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id j15sm114248ejs.5.2020.09.17.07.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 07:54:45 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Jason Gunthorpe <jgg@ziepe.ca>, christian.koenig@amd.com
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
Date:   Thu, 17 Sep 2020 16:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917143551.GG8409@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.20 um 16:35 schrieb Jason Gunthorpe:
> On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian König wrote:
>> Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
>>> On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
>>>> Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
>>>>> On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
>>>>>
>>>>>> Yeah, but it doesn't work when forwarding from the drm chardev to the
>>>>>> dma-buf on the importer side, since you'd need a ton of different
>>>>>> address spaces. And you still rely on the core code picking up your
>>>>>> pgoff mangling, which feels about as risky to me as the vma file
>>>>>> pointer wrangling - if it's not consistently applied the reverse map
>>>>>> is toast and unmap_mapping_range doesn't work correctly for our needs.
>>>>> I would think the pgoff has to be translated at the same time the
>>>>> vm->vm_file is changed?
>>>>>
>>>>> The owner of the dma_buf should have one virtual address space and FD,
>>>>> all its dma bufs should be linked to it, and all pgoffs translated to
>>>>> that space.
>>>> Yeah, that is exactly like amdgpu is doing it.
>>>>
>>>> Going to document that somehow when I'm done with TTM cleanups.
>>> BTW, while people are looking at this, is there a way to go from a VMA
>>> to a dma_buf that owns it?
>> Only a driver specific one.
> Sounds OK
>
>> For TTM drivers vma->vm_private_data points to the buffer object. Not sure
>> about the drivers using GEM only.
> Why are drivers in control of the vma? I would think dma_buf should be
> the vma owner. IIRC module lifetime correctness essentially hings on
> the module owner of the struct file

Because the page fault handling is completely driver specific.

We could install some DMA-buf vmops, but that would just be another 
layer of redirection.

>> Why are you asking?
> I'm thinking about using find_vma on something that is not
> get_user_pages()'able to go to the underlying object, in this case dma
> buf.
>
> So, user VA -> find_vma -> dma_buf object -> dma_buf operations on the
> memory it represents

Ah, yes we are already doing this in amdgpu as well. But only for 
DMA-bufs or more generally buffers which are mmaped by this driver instance.

Some applications are braindead enough to mmap() a buffer and then give 
us back the CPU pointer and request to make it a handle (userptr) again.

That is clearly forbidden by OpenGL, OpenCL and Vulkan, but they use it 
anyway.

Christian.

>
> Jason
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

