Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725FD2883B4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 09:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732128AbgJIHgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 03:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732122AbgJIHgp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:36:45 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DA8C0613D2;
        Fri,  9 Oct 2020 00:36:44 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dt13so11681442ejb.12;
        Fri, 09 Oct 2020 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KDyUTK8HE57boREsu/kkQV3gAaTaD15LV09WfHJl7QA=;
        b=kIGXTJl/kOjQKxmgRI69WHaqY7wqG2Iftx5wG5g2WhEIYTHKNVtTW0rZIYWWs4UDho
         DM2mbQx2xiJ0y3D0Py2Dsju2CITpUnRITmBmsIJrS4mTjp5L5oEgPHYvtwRpHreYFZWs
         YQ0GFatuSc7Ed2uFiNpB8CotQXhkN7tvSToTlnE+UsFez1BjvKcNuqrfN2kv80c+LHI+
         tsonF8erzFyfkOUt8NqnsJZLxO0ZL4mzCChcWxnQQrqU2nMKDLWF0PGAygmnFsu8t0+O
         l4x1RBptHp5dY4jISuBlzc9/4LH1UZnUbJHu8lenU1eHd56zkQX0xo8cM2jccYBXTble
         0jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KDyUTK8HE57boREsu/kkQV3gAaTaD15LV09WfHJl7QA=;
        b=EBUulbAFdsPMykMQc+sUhax7yNERg8N+SuxCofXYlxPW8pqWfD9wZmUmYwnySVOvcn
         1x6EJghS9OyiQAA8vWI34gds32SN5ijZgSuSLK6kYWDWK4qPQV54r6nlxGUgW+vr15d+
         klHV39hMtcxelor/CfO8q+bus76tIcti0U4nyeJ52FvqBNT+eTP7zvMXVqxVqJCqI1Cl
         2ihz5lDGOfjDsjK3apZQ7RThcvC9+UdbQ+GNJBvuvktGppoCZ2Q1V27DXK8292dbxwNr
         Eg6Oqee5VjHZTojIzZ9dNOr1+0yN4AtRcU2I3bxIlE5eD1OXSeBLMbzKOoXLJfckhObt
         AqYg==
X-Gm-Message-State: AOAM531K1nOyFoL5CCKXmvPcXkQl2r+aeNp13NjviAqrwUN3mpE/ycpz
        L6AN7wHGueKHo+N1GBFb4Iw=
X-Google-Smtp-Source: ABdhPJwmLU0/zFy/biwCWPdlbly4yd8EXZvqkIyBmFwrU0xdwElcWIp7GYrCCXyxceMhCvEZZAAqtw==
X-Received: by 2002:a17:906:68c4:: with SMTP id y4mr13159828ejr.197.1602229003288;
        Fri, 09 Oct 2020 00:36:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id w25sm5360262ejy.123.2020.10.09.00.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 00:36:42 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org,
        sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
 <20201008140914.GF438822@phenom.ffwll.local>
 <20201008141419.GH438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
Date:   Fri, 9 Oct 2020 09:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008141419.GH438822@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 08.10.20 um 16:14 schrieb Daniel Vetter:
> On Thu, Oct 08, 2020 at 04:09:14PM +0200, Daniel Vetter wrote:
>> On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian König wrote:
>>> We have reoccurring requests on this so better document that
>>> this approach doesn't work and dma_buf_mmap() needs to be used instead.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_prime.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 4910c446db83..16fa2bfc271e 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>>>   /**
>>>    * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
>>>    * @sgt: scatter-gather table to convert
>>> - * @pages: optional array of page pointers to store the page array in
>>> + * @pages: deprecated array of page pointers to store the page array in
>>>    * @addrs: optional array to store the dma bus address of each page
>>>    * @max_entries: size of both the passed-in arrays
>>>    *
>>> @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>>>    *
>>>    * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
>>>    * implementation.
>>> + *
>>> + * Specifying the pages array is deprecated and strongly discouraged for new
>>> + * drivers. The pages array is only useful for page faults and those can
>>> + * corrupt fields in the struct page if they are not handled by the exporting
>>> + * driver.
>>>    */
>> I'd make this a _lot_ stronger: Aside from amdgpu and radeon all drivers
>> using this only need it for the pages array. Imo just open-code the sg
>> table walking loop in amdgpu/radeon (it's really not much code), and then
>> drop the dma_addr_t parameter from this function here (it's set to NULL by
>> everyone else).
>>
>> And then deprecate this entire function here with a big warning that a)
>> dma_buf_map_attachment is allowed to leave the struct page pointers NULL
>> and b) this breaks mmap, users must call dma_buf_mmap instead.
>>
>> Also maybe make it an uppercase DEPRECATED or something like that :-)
> OK I just realized I missed nouveau. That would be 3 places where we need
> to stuff the dma_addr_t list into something ttm can take. Still feels
> better than this half-deprecated function kludge ...

Mhm, I don't see a reason why nouveau would need the struct page either.

How about we split that up into two function?

One for converting the sg_table into a linear dma_addr array.

And one for converting the sg_table into a linear struct page array with 
a __deprecated attribute on it?

Christian.

> -Daniel
>
>> -Daniel
>>
>>>   int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>>>   				     dma_addr_t *addrs, int max_entries)
>>> -- 
>>> 2.17.1
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

