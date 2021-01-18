Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA42FAA31
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 20:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437207AbhARTaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 14:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437124AbhART3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 14:29:36 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FFAC0613D6
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 11:28:55 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x20so25622311lfe.12
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 11:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qRJii4TUO3xb/vsP6e9MhNn3yiEX4ATh1PbQegkZ8gE=;
        b=flo29NdPgDnp6ykA8ad2XsgGSJ6JDUqPRCEczmwsuss8+MU3KHHfihDWo4StrCaiAq
         jeK5JXUhFzxQ/LDOlohRGM4rNOqvOVW5ZJWmVumv60mlGgRINNg6viQvP10olZoUXSZG
         f1Vb9RLHLDlZX27EeThPlI3FeuTpIb4ZZ9FgTFAYgoyHfJOdCPIvjkUH1erfQmfnjrtJ
         /q+PwtjWjBQEh0r4IgspRUB86Ts0Iq6yIcalQVGMH6TfZIH3sKL/aPjvLGEzgkxCXE6g
         BUT52lhnPjawv866foHdsp4OLPS58Wm3KBtgA46vuDqjKZZv7ZP8Rz4/vIfql0YT2/OO
         DepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qRJii4TUO3xb/vsP6e9MhNn3yiEX4ATh1PbQegkZ8gE=;
        b=fTxUyceYUBGshOBvxnAvixvFDU+/IkW9b1WVPI2QeLJpaR0GX1xvALXogYCc2sOfK/
         H18AmMfJMkU/IbEzcHnK4Oi4hAkmhUW1Gi5m5j92+2mOoLfi3mXwU1u8KLiAr7888M1X
         NA5GQgvTFJAv2UZhFyzFQIYinl4zDpO6XRS7QsJSgklDEqE20qiM3VDUktvk7IvCi4qa
         fIjpb7Roqv/McC7quzC9LHCZ0au1XvBUPlMB5QM3LatiIxWVaurXxxgaCLj7u8w4g8Vk
         wEjmja6NfHlIGGG2DZLfgmU9ZVjpG8QgVykZ/Vtn0QkLNdNp0++v8fXdVTcyyX5P8WSQ
         M9Ig==
X-Gm-Message-State: AOAM532qdwGJgVJEbNkl1VvfyiTGyqde3bEsyIEEH9XFDXDeNGNymhfe
        0CLcCIVinc0xX+c71LlC7ble6CzaCzOK4g==
X-Google-Smtp-Source: ABdhPJydb0h3oJoDW9pd0Zf2gu1mzV1Rh0So5CQtkYaZ9zxNlQJUyntr2B+m5EV5Bnifk1k4mnQzmQ==
X-Received: by 2002:a19:4008:: with SMTP id n8mr273031lfa.660.1610998134342;
        Mon, 18 Jan 2021 11:28:54 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id 206sm2051257lfd.180.2021.01.18.11.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 11:28:53 -0800 (PST)
Subject: Re: [PATCH v4] media: ov8856: Configure sensor for GRBG Bayer for all
 modes
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>, dongchun.zhu@mediatek.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@google.com>
References: <20210118190132.1045913-1-robert.foss@linaro.org>
 <db76aedb-de5e-2040-1e1c-777848614a7f@linaro.org>
Message-ID: <357f6099-7a36-bbf6-723c-a4ca76835d00@linaro.org>
Date:   Mon, 18 Jan 2021 22:28:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db76aedb-de5e-2040-1e1c-777848614a7f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oops.. I've missed a few mistypes

On 18.01.2021 22:18, Andrey Konovalov wrote:
> Hi Robert,
> 
> Thanks for you patch!
> 
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> 
> On 18.01.2021 22:01, Robert Foss wrote:
>> The previously added modes 3264x2448 & 1632x1224 are actually
>> configuring the sensor for BGGR mode, this is an issue since
>> the mode that is exposed through V4L incorrectly is set as GRBG.
>>
>> This patch fixes the issue by moving the output crop window of
>> internal sensor ISP uses by one row, which means that the Bayer
>> pattern of the output is changed.
>>
>> From:
>> row 1: B G B G B G ...
>> row 2: G R G R G R ...
>> raw 3: B G B G B G ...
- row
>> ...
>>
>> To:
>> raw 2: G R G R G R ...
- row
>> raw 3: B G B G B G ...
- row

Thanks,
Andrey

>> ...
>>
>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>> Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>
>> Changes since v1:
>>   - Sakari: Added mode information to ov8856_mode struct
>>   - Sakari: enum_mbus_code updated
>>
>> Changes since v2:
>>   - Andrey: Switched approach to changing the sensor configuration
>>     to yield identical Bayer modes for all modes
>>
>> Changes since v3:
>>   - Andrey: Improve commit msg to explain Bayer shift better
>>
>>   drivers/media/i2c/ov8856.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
>> index 2f4ceaa80593..8a355135c7db 100644
>> --- a/drivers/media/i2c/ov8856.c
>> +++ b/drivers/media/i2c/ov8856.c
>> @@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
>>       {0x3810, 0x00},
>>       {0x3811, 0x04},
>>       {0x3812, 0x00},
>> -    {0x3813, 0x02},
>> +    {0x3813, 0x01},
>>       {0x3814, 0x01},
>>       {0x3815, 0x01},
>>       {0x3816, 0x00},
>> @@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
>>       {0x3810, 0x00},
>>       {0x3811, 0x02},
>>       {0x3812, 0x00},
>> -    {0x3813, 0x02},
>> +    {0x3813, 0x01},
>>       {0x3814, 0x03},
>>       {0x3815, 0x01},
>>       {0x3816, 0x00},
>>
