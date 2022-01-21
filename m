Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D892D495E10
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 12:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344686AbiAULBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 06:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbiAULBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 06:01:02 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB10C061574
        for <linux-media@vger.kernel.org>; Fri, 21 Jan 2022 03:01:02 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso18217858wmf.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jan 2022 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=lLGSMeSTcWsRfSp17dIUaYIF6uHiKPgnKaoYj+UhetE=;
        b=Da5Q19RT9sKauGiAg5uihyv17alwbZ54wgYoty71gfOKsgSjcvl1QHE0j4h/QF3sSE
         LQdHA++y5BYhw2crsgOCTleptiWVqyIPKhQ67FssaZ/1omNhKwc82xeH6Wf/sxMQZvjw
         aZJ/hYUXAPRkLnb+dTyQbSOvyzJKWSrLUeFtpZeZqJmHe7yew+23KbEnRE19L+2LVxFK
         NYCgwz6eRJPUP3Hnz+DyqNlRKXjJ+G2H9MQOliWMo3D90paFHLfBltJX8UrYNERUKH8x
         tDTHsqQgQJem97kuDbPtDgtsyYstcE5VOZAlbHOl9Po1hd+vxtf/F5ZUJ2twkH/9c0On
         QGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lLGSMeSTcWsRfSp17dIUaYIF6uHiKPgnKaoYj+UhetE=;
        b=TWjl8ic65LaPz2sslg8bx3Z7Qud91BfUnOHHHaCkrDY+uVICvGh1di0h31zGJoECeo
         Wmqnf+8j4NnNfOOSRK9rdGRNHTCA25nMK3Oec8XiuzcHWx1TfV06ls+/T5kYsrzY3e80
         DbrM7+4F1Q0mxjYWK4bCbnvPTqImY/nb+EuAP4At9h1K2BXLoBA+HdnN67vTrr0dpU6s
         jrCqy1wwjdf2zfZDardqc0uSYkj6LNhnUmK9MyEgZclQyunsIUA6nNv9UxMw87KUbEbi
         PRzMDdJDndCl+Y+WojdKd+dCMH13PPyz4lDlC7fEVTiuIWgstKG9Kj9s0MOr51Dkb8gu
         +aYg==
X-Gm-Message-State: AOAM532Hg0Z11mdCN5+DsQwlwzFBQjzmrMctIny6YzwsomjgbKpu5w3j
        IQRNg2+3xtt3T3h8ziTV5DI=
X-Google-Smtp-Source: ABdhPJz/O/FAYxlPiiHWdB2t6V7yRcg/qlKlC3RhCYLkPqf5aKGXjCIDlVZU18GNA+ObqNxaxYjeyw==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr3328004wrr.526.1642762860852;
        Fri, 21 Jan 2022 03:01:00 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:5ab7:6e01:32ef:2782? ([2a02:908:1252:fb60:5ab7:6e01:32ef:2782])
        by smtp.gmail.com with ESMTPSA id y15sm2413366wry.36.2022.01.21.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 03:01:00 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 2/9] dma-buf: warn about dma_fence_array
 container rules
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-3-christian.koenig@amd.com>
 <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <532d9358-f5b2-73fb-5931-f14b2c264169@gmail.com>
Date:   Fri, 21 Jan 2022 12:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 21.01.22 um 08:31 schrieb Thomas Hellström:
>
> On 1/20/22 14:27, Christian König wrote:
>> It's not allowed to nest another dma_fence container into a 
>> dma_fence_array
>> or otherwise we can run into recursion.
>>
>> Warn about that when we create a dma_fence_array.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 3e07f961e2f3..4bfbcb885bbc 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -176,6 +176,19 @@ struct dma_fence_array 
>> *dma_fence_array_create(int num_fences,
>>         array->base.error = PENDING_ERROR;
>>   +    /* dma_fence_array objects should never contain any other fence
> Nit: First comment line of multi-line comments shouldn't contain text.
>> +     * containers or otherwise we run into recursion and potential 
>> kernel
>> +     * stack overflow on operations on the dma_fence_array.
>> +     *
>> +     * The correct way of handling this is to flatten out the array 
>> by the
>> +     * caller instead.
>> +     *
>> +     * Enforce this here by checking that we don't create a 
>> dma_fence_array
>> +     * with any container inside.
>> +     */
>> +    while (seqno--)
>> +        WARN_ON(dma_fence_is_container(fences[seqno]));
>> +
>
> s/seqno/num_fences/g ?

Ah, of course! Typing to fast.

Thanks,
Christian.

>
> Thanks,
>
> Thomas
>
>
>
>>       return array;
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_create);
>

