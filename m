Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B867626DB75
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgIQMY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgIQMYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:24:53 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EDFC061788;
        Thu, 17 Sep 2020 05:24:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j2so2264531eds.9;
        Thu, 17 Sep 2020 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GBPWnK+O45hDPiwD6Yl2FVueQas8+06W2RHndFOU4x0=;
        b=YSwvclpgwQrjaZJLio4+fZCnlFslcy8Smk4D3Nl1taPur3YUbCtbgZhfm/6+rxDLDb
         wnpQZk8wKk/ZMKnF8vQJK7jlxVoRuJE6PwMpAZIlrRUdYNDuAbOMf896/BwdweSdvEDR
         egGfWHIWpyYNDLR+YDZFocW3Spw/+1H3TuHMdAE5hQV4Sa7vq171+oowCUwvVE1XPned
         BNGCHnafxMkf0uGcmrVb/SW+uYrSjukjUsITqm1O0eLlKXIQ//sx5vYoWXnSP9AjX43r
         JzICsn9YQNoT2j5O7gynMB4YyLqxhQ4BfDYgM40y/TSWY5dKWblFY0toaz+U49m5h2eD
         SrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=GBPWnK+O45hDPiwD6Yl2FVueQas8+06W2RHndFOU4x0=;
        b=NlN69kOP9FDRpkuv6GNSuvUE6DRgjq01q50HJGYBRlV7pWR3hoeypwQelEAo4y+c2d
         VPSxGvJnZIExFtavV88KyWUL6nkwYT//3lhBkGZaeiEVmzN+wHrRrna2DrC/+HmhvCTv
         BD6gLeCQdQgV0m1DLeVY4QBm2VPVqawVZilLdsO5F8Ph3iPmwTvXbNijlODZSJf87EoY
         qcA9m10qEXxLp2YD4ge0oBlYxF6bvbtzoNSa2sF1iEGnQ6y/7V8VFTTDEq6w0zimRxU1
         UqURXC10lrqwErD5xUGn3xBEgPrOCJH6dsGKWrTbvAWgIiIQfMiSLLeroLc5tItQQn4I
         K5BA==
X-Gm-Message-State: AOAM5334VeEOwXUhP1mj3IG1clhp9PsF8ld4WXLUSBXWTBoGkByx2Bok
        eQu4wq9hbQcWjfkAexWLbzgzQAczzdg=
X-Google-Smtp-Source: ABdhPJxjg1yiXefIk0NeL3VjLQ2zbCP7yoFRn/H/W2k2rNszWXwepBIqx8bZOzhUQkVeMcmckHNfJw==
X-Received: by 2002:a05:6402:1110:: with SMTP id u16mr32547477edv.253.1600345471990;
        Thu, 17 Sep 2020 05:24:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id b5sm16198291edq.69.2020.09.17.05.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:24:31 -0700 (PDT)
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
References: <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
Date:   Thu, 17 Sep 2020 14:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917121858.GF8409@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
>> Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
>>> On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
>>>
>>>> Yeah, but it doesn't work when forwarding from the drm chardev to the
>>>> dma-buf on the importer side, since you'd need a ton of different
>>>> address spaces. And you still rely on the core code picking up your
>>>> pgoff mangling, which feels about as risky to me as the vma file
>>>> pointer wrangling - if it's not consistently applied the reverse map
>>>> is toast and unmap_mapping_range doesn't work correctly for our needs.
>>> I would think the pgoff has to be translated at the same time the
>>> vm->vm_file is changed?
>>>
>>> The owner of the dma_buf should have one virtual address space and FD,
>>> all its dma bufs should be linked to it, and all pgoffs translated to
>>> that space.
>> Yeah, that is exactly like amdgpu is doing it.
>>
>> Going to document that somehow when I'm done with TTM cleanups.
> BTW, while people are looking at this, is there a way to go from a VMA
> to a dma_buf that owns it?

Only a driver specific one.

For TTM drivers vma->vm_private_data points to the buffer object. Not 
sure about the drivers using GEM only.

Why are you asking?

Regards,
Christian.

>
> Jason
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

