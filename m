Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35638463051
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbhK3J4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbhK3J4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:56:55 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4498C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:53:35 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a9so43069172wrr.8
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9jAewgkfdkUy13oF0Vw+kQJGP1Q2pCXHsO2ZLYtP7M0=;
        b=phrPCoj0CiuURlG16h2qWABn6t52M7iGfACBC+ybHTOjBql2MSBknBAjHvDN3PmKnc
         IEtiNlRwD0yxwLgZnpTAUOWZjwtcu8LKZjXP2Je/gfFa7drRQD/fZlOYnHUHYoGPmDAU
         h8vp2+nFRoDX8ky7IrJ8vNNb1jLcf/993VsCyoUTBlMA8NhaHmnw1T1HdI2GnyE+7jNP
         FhbveaKknYaDOSVdckhS6jNDw3mnZYCRJ3GKXDms61xMb2Bnq9XYWAIdLhHplm9FN7n0
         U34U3g4QVZDJgmDyUvTz5Wozc0WWBBXDC+OBXS1RF9sJQYmGqylxhELMDpefyO/thuNC
         e3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9jAewgkfdkUy13oF0Vw+kQJGP1Q2pCXHsO2ZLYtP7M0=;
        b=sSF697GcBHG/mJnmbhJNTokbocPRCs6TlLe+WEbwOY0l1HwmX+k9Ur/Cw7G4PzTTyi
         eMEloE88uaqyrysytvTB7FBNgzrhiVH9HZBDYBwXrhTpHJQKaVjQ/pyJGuxNeTQw5ckg
         7VkTzitJs38fNUTzZu61CgnngpBIhOG2BPPQiQYG91DBIVP+xcnCh1e2sb57MvVji05x
         yVFE7aJ5DgUNjPKKiqQpgUyDOAnttBEfht+CzEBZnK7LRFCP/O3ti+bFwyfhQwsOlM8V
         JprSJeJgCZtJBW/SVryzd45csH8mRCo+cLbWa+lC166jC8QNJ35RKh4zKRbf+Y35COfc
         iB6Q==
X-Gm-Message-State: AOAM530pFNapkilr5sd+crj8FOFgSGHYqWA6lUBC/XYpjNaEmr0NkdX8
        263HnI5qdsQl6O3Ski3nfAw=
X-Google-Smtp-Source: ABdhPJyb8GszFkk38gyLPHHKmnI8Lk+84enAQ/szYWXJsWstRgri0a5eUjGLB0DaZAfqd4Mz7Enjhg==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr39322072wrt.31.1638266014415;
        Tue, 30 Nov 2021 01:53:34 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3? ([2a02:908:1252:fb60:fa20:e17b:e063:b6d3])
        by smtp.gmail.com with ESMTPSA id n15sm1927871wmq.38.2021.11.30.01.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 01:53:33 -0800 (PST)
Subject: Re: [PATCH 02/28] drm/ttm: stop pruning fences after wait
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-3-christian.koenig@amd.com>
 <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cae36fd4-4d15-508a-e91c-62135ffd2f06@gmail.com>
Date:   Tue, 30 Nov 2021 10:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 30.11.21 um 10:02 schrieb Daniel Vetter:
> On Mon, Nov 29, 2021 at 01:06:33PM +0100, Christian König wrote:
>> This is just abusing internals of the dma_resv object.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Yeah I think if we want this back we could do a _locked version of the
> wait, which prunes internally.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Btw I wonder, should we put the ttm_bo_wait wrapper on the chopping block
> in gpu/todo.rst? It's really just complications I think in most cases. And
> it would be nice if ttm has the same errno semantics for these as everyone
> else, I always get very confused about this stuff ...

I've already done that quite a bit, e.g. removed most of the users.

What's left are the cases where we wait or test signaling inside of TTM 
and I think I can get rid of that with the LRU rework.

So yeah, already in the pipeline.

Regards,
Christian.

>
> Cheers, Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index e4a20a3a5d16..fc124457ba2f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>>   	if (timeout == 0)
>>   		return -EBUSY;
>>   
>> -	dma_resv_add_excl_fence(bo->base.resv, NULL);
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(ttm_bo_wait);
>> -- 
>> 2.25.1
>>

