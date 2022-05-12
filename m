Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C4E524BC4
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 13:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343936AbiELLe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 07:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241298AbiELLe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 07:34:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196931E325D
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 04:34:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j6so9567244ejc.13
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=mYnxmb7ZLbw85x8pvcfGdGU+kJfIKz2pfuO8TVv/FGM=;
        b=SnS6Paxpf8PoWaD+UVdJuIJw9yQcHiEYMw13JvL+Gach2bPrhxV10wRfsqP3HfW/yl
         rFeWgWTB5F/nEn5QuC5KzGRykUy+roHjDvt0lJS/rjaflSZFFomtIAoAWZCB9vIrlnVA
         QOLSwVNF8pedlBYU1IktAfZ3ZQGMNPk37+YFGN2wuYxtWPaQW4v/lr97tsRYddBDRc+P
         KvpOgcyRzwh2Q2g7CuGkSdqwlR91zLc2dOOn8gsqVd0nhv1S0aQEz+7Yuulo8h38Ov1n
         R9s6vQN+JSLpr5UEN5CunvhhYYH2kXBKetQaoyknmTkMHX2J0ngTP++bcrar0b2/m5bz
         OJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mYnxmb7ZLbw85x8pvcfGdGU+kJfIKz2pfuO8TVv/FGM=;
        b=4PewLCI3VHGHICDi09JKYQTH4ljTcx/E836yoDSWIQcO4KtEKgESRxEe5/8yn2UJmc
         xhXxVcf3kN2riKrmh5bf4xEQIqNSS9lihOCTieiuMjkOd+08MUEkbUefbH6PQHu1BNcc
         rejg8Zws2zrMRl71uAjpROo3AP6G+iWC805c1vks0iq+MlXu8KUF4oPNYVTruoFgKiry
         ohiYafBfhvpC+3AwG+IryS0LbpukkkEGWCe5od4b9bEUMLt6HHWugbImJvgFmh6ZDUOU
         C1VNKZn6ba3IeNpG3LV0ZY0ibqv51sSzobKvuBa9eEGwotN3E+HOHlZoPcfp687KMGpB
         xbPw==
X-Gm-Message-State: AOAM532ug75oejOKAEzIQfpv4yP7OIlJjJwXMCGL8uyKK/GXF+qXSLgE
        /C+yNgth6RJhF6TGDayKeb8=
X-Google-Smtp-Source: ABdhPJyA15RXWPQxaZozBxyF3PPbZ9V60JlKnqFjWEJJywxLyihsXE9vmcecqiP/p8FFG0F9aJFoLw==
X-Received: by 2002:a17:907:60d3:b0:6f5:c4c3:2f96 with SMTP id hv19-20020a17090760d300b006f5c4c32f96mr27380366ejc.724.1652355293558;
        Thu, 12 May 2022 04:34:53 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea033.dip0.t-ipconnect.de. [91.14.160.51])
        by smtp.gmail.com with ESMTPSA id n14-20020a170906700e00b006f3ef214e34sm1994117ejj.154.2022.05.12.04.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 04:34:52 -0700 (PDT)
Message-ID: <50832f62-491f-f06f-b38d-74175942a27c@gmail.com>
Date:   Thu, 12 May 2022 13:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <bd90027c-5158-0d53-9b05-97a9e62309b3@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <bd90027c-5158-0d53-9b05-97a9e62309b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Daniel,

a gentle ping on this here. Those patches come before my drm-exec work, 
so would be nice if we could get that reviewed first.

Thanks,
Christian.

Am 06.05.22 um 16:11 schrieb Christian König:
> I had to send this out once more.
>
> This time with the right mail addresses and a much simplified patch #3.
>
> Christian.
>
> Am 06.05.22 um 16:10 schrieb Christian König:
>> The selftests, fix the error handling, remove unused functions and stop
>> leaking memory in failed tests.
>>
>> v2: fix the memory leak correctly.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/st-dma-fence-unwrap.c | 48 +++++++++++----------------
>>   1 file changed, 19 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c 
>> b/drivers/dma-buf/st-dma-fence-unwrap.c
>> index 039f016b57be..e20c5a7dcfe4 100644
>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -4,27 +4,19 @@
>>    * Copyright (C) 2022 Advanced Micro Devices, Inc.
>>    */
>>   +#include <linux/dma-fence.h>
>> +#include <linux/dma-fence-array.h>
>> +#include <linux/dma-fence-chain.h>
>>   #include <linux/dma-fence-unwrap.h>
>> -#if 0
>> -#include <linux/kernel.h>
>> -#include <linux/kthread.h>
>> -#include <linux/mm.h>
>> -#include <linux/sched/signal.h>
>> -#include <linux/slab.h>
>> -#include <linux/spinlock.h>
>> -#include <linux/random.h>
>> -#endif
>>     #include "selftest.h"
>>     #define CHAIN_SZ (4 << 10)
>>   -static inline struct mock_fence {
>> +struct mock_fence {
>>       struct dma_fence base;
>>       spinlock_t lock;
>> -} *to_mock_fence(struct dma_fence *f) {
>> -    return container_of(f, struct mock_fence, base);
>> -}
>> +};
>>     static const char *mock_name(struct dma_fence *f)
>>   {
>> @@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
>>           return NULL;
>>         spin_lock_init(&f->lock);
>> -    dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
>> +    dma_fence_init(&f->base, &mock_ops, &f->lock,
>> +               dma_fence_context_alloc(1), 1);
>>         return &f->base;
>>   }
>> @@ -59,7 +52,7 @@ static struct dma_fence *mock_array(unsigned int 
>> num_fences, ...)
>>         fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>>       if (!fences)
>> -        return NULL;
>> +        goto error_put;
>>         va_start(valist, num_fences);
>>       for (i = 0; i < num_fences; ++i)
>> @@ -70,13 +63,17 @@ static struct dma_fence *mock_array(unsigned int 
>> num_fences, ...)
>>                          dma_fence_context_alloc(1),
>>                          1, false);
>>       if (!array)
>> -        goto cleanup;
>> +        goto error_free;
>>       return &array->base;
>>   -cleanup:
>> -    for (i = 0; i < num_fences; ++i)
>> -        dma_fence_put(fences[i]);
>> +error_free:
>>       kfree(fences);
>> +
>> +error_put:
>> +    va_start(valist, num_fences);
>> +    for (i = 0; i < num_fences; ++i)
>> +        dma_fence_put(va_arg(valist, typeof(*fences)));
>> +    va_end(valist);
>>       return NULL;
>>   }
>>   @@ -113,7 +110,6 @@ static int sanitycheck(void *arg)
>>       if (!chain)
>>           return -ENOMEM;
>>   -    dma_fence_signal(f);
>>       dma_fence_put(chain);
>>       return err;
>>   }
>> @@ -154,10 +150,8 @@ static int unwrap_array(void *arg)
>>           err = -EINVAL;
>>       }
>>   -    dma_fence_signal(f1);
>> -    dma_fence_signal(f2);
>>       dma_fence_put(array);
>> -    return 0;
>> +    return err;
>>   }
>>     static int unwrap_chain(void *arg)
>> @@ -196,10 +190,8 @@ static int unwrap_chain(void *arg)
>>           err = -EINVAL;
>>       }
>>   -    dma_fence_signal(f1);
>> -    dma_fence_signal(f2);
>>       dma_fence_put(chain);
>> -    return 0;
>> +    return err;
>>   }
>>     static int unwrap_chain_array(void *arg)
>> @@ -242,10 +234,8 @@ static int unwrap_chain_array(void *arg)
>>           err = -EINVAL;
>>       }
>>   -    dma_fence_signal(f1);
>> -    dma_fence_signal(f2);
>>       dma_fence_put(chain);
>> -    return 0;
>> +    return err;
>>   }
>>     int dma_fence_unwrap(void)
>

