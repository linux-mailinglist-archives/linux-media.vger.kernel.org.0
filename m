Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4B82C40C7
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgKYNBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 08:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbgKYNBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:01:07 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEB1C0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:01:06 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c198so1945915wmd.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 05:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irbsSXjHImcSLHJ6uxXDu2MKDqhSUoJJSkeWgL8xBoA=;
        b=AJCg3v4STEBBRZaHLAE53XA3KcnbyMQzjsoXOCVgOtQnPzop3nkbwp553x5xqFIMQd
         wAz6sVvPFfpFQnS3UWtT5pbzYJCp/iLZQgo93d3RPzIX1uKyhzGCLaW1XPj8H5JMzljf
         bTLjMOMhE6N3+93TUjcobXv7XZUMubFPnW//4CSD1mYMfIzl852OCu6bhFaZHCmpxv8n
         3eEDa5Sq/XkMZi4ZwK5/K94LmZte8lZ20pq4CHr2JpYBO42voDoKFnglO/RopT3FFhox
         la4/k7bEVHKdgIhEanahTj2Ms05JzrU+pv8jgMPxy2ZKKTJ6uOGdD/Iq+UY7g0vrXJk0
         DV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irbsSXjHImcSLHJ6uxXDu2MKDqhSUoJJSkeWgL8xBoA=;
        b=b0V2ybv7puZiAKqf68s52Q+VPBVH4cT2fyGo8iqgm2HthdHfSycD9Do8EKt0Hp4acY
         U+umbWaO1TBj/COCbeNdyS6FIpa545uea9suGe5XTRjKWyUq1isJjqp+03Aad6Z8Td4e
         Zh+hRVzef2pFp/sdaWx5+vnz42nzhpb7eGkKeEKGN4saTwYhZgCY0+11nU08W2UJ1dQK
         I9m9mXBJ+ZudCgUtRYujHVXa94nkxD6eAA203tF0kfSkG+OANMTzenPh1B1Xi/X6KC4+
         dDejSlfChDcz+dBQsPh3gI0eSRsKT7faJBkyC5YmHy2maRjlcrla86PC+wGBVmzQ91JZ
         512A==
X-Gm-Message-State: AOAM533ovaEEVANk4reZHX/UJqylXsBXLSFpZot+ScRiuaBIn1G+8Wo9
        PNHyGmE0JYWNeiGBb19OyZsRdw==
X-Google-Smtp-Source: ABdhPJxBT007KlVzudG3ay9wbN5BHrb/bBbDAzKTJNgH+sjzEYq3ALv1ftOsxPP19AsfdL/U339OQQ==
X-Received: by 2002:a1c:e1c5:: with SMTP id y188mr3853828wmg.81.1606309263056;
        Wed, 25 Nov 2020 05:01:03 -0800 (PST)
Received: from [192.168.0.3] (hst-221-27.medicom.bg. [84.238.221.27])
        by smtp.googlemail.com with ESMTPSA id f18sm4686733wru.42.2020.11.25.05.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 05:01:02 -0800 (PST)
Subject: Re: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-3-stanimir.varbanov@linaro.org>
 <CAPBb6MUnXmtSKy9NwikYXjafgB+WM9TKEFjkYK16T2V7KRx=JQ@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8c6231b2-61c2-d432-aa47-ddc29de8da19@linaro.org>
Date:   Wed, 25 Nov 2020 15:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUnXmtSKy9NwikYXjafgB+WM9TKEFjkYK16T2V7KRx=JQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/25/20 5:46 AM, Alexandre Courbot wrote:
> On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Currently we rely on firmware to return error when we reach the maximum
>> supported number of sessions. But this errors are happened at reqbuf
>> time which is a bit later. The more reasonable way looks like is to
>> return the error on driver open.
>>
>> To achieve that modify hfi_session_create to return error when we reach
>> maximum count of sessions and thus refuse open.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h      |  1 +
>>  drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
>>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index db0e6738281e..3a477fcdd3a8 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -96,6 +96,7 @@ struct venus_format {
>>  #define MAX_CAP_ENTRIES                32
>>  #define MAX_ALLOC_MODE_ENTRIES 16
>>  #define MAX_CODEC_NUM          32
>> +#define MAX_SESSIONS           16
>>
>>  struct raw_formats {
>>         u32 buftype;
>> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
>> index 638ed5cfe05e..8420be6d3991 100644
>> --- a/drivers/media/platform/qcom/venus/hfi.c
>> +++ b/drivers/media/platform/qcom/venus/hfi.c
>> @@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
>>  int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>>  {
>>         struct venus_core *core = inst->core;
>> +       int ret;
>>
>>         if (!ops)
>>                 return -EINVAL;
>> @@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>>         init_completion(&inst->done);
>>         inst->ops = ops;
>>
>> -       mutex_lock(&core->lock);
>> -       list_add_tail(&inst->list, &core->instances);
>> -       atomic_inc(&core->insts_count);
>> +       ret = mutex_lock_interruptible(&core->lock);
>> +       if (ret)
>> +               return ret;
> 
> Why do we change to mutex_lock_interruptible() here? This makes this

Because mutex_lock_interruptible is preferable in kernel docs, but I
agree that changing mutex_lock with mutex_lock_interruptible should be
subject of another lock related patches. I will drop this in next patch
version.

> function return an error even though we could obtain the lock just by
> trying a bit harder.

I didn't get that. The behavior of mutex_lock_interruptible is that same
as mutex_lock, i.e. the it will sleep to acquire the lock. The
difference is that the sleep could be interrupted by a signal. You might
think about mutex_trylock?

> 
>> +
>> +       ret = atomic_read(&core->insts_count);
>> +       if (ret + 1 > core->max_sessions_supported) {
>> +               ret = -EAGAIN;
>> +       } else {
>> +               atomic_inc(&core->insts_count);
>> +               list_add_tail(&inst->list, &core->instances);
>> +               ret = 0;
>> +       }
>> +
>>         mutex_unlock(&core->lock);
>>
>> -       return 0;
>> +       return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(hfi_session_create);
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index 363ee2a65453..52898633a8e6 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>>                 words_count--;
>>         }
>>
>> +       if (!core->max_sessions_supported)
>> +               core->max_sessions_supported = MAX_SESSIONS;
>> +
>>         parser_fini(inst, codecs, domain);
>>
>>         return HFI_ERR_NONE;
>> --
>> 2.17.1
>>

-- 
regards,
Stan
