Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FC72FAAE2
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437712AbhARUEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 15:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437800AbhARUDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 15:03:47 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D516C061574
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 12:03:07 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b26so25811999lff.9
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 12:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7alCZU74sYXZV+z2uTznaZthaKp3BCYeASOmff2ui7k=;
        b=SrYXliND6Oh+2oSBueZymwtXnV3QfzIfdTGfexRuvg5TStwvicae9b2Lo9AlyzB/BY
         BuZRORCvr9q0XlU4F/RkPQPYA0ECgzcupN+N+LHX2W/vB/Q9O4e/Vv6ucXkqjKkOZkZM
         nx0dntzNLu0tQtHuZIjvm60/HUsSMCK7mvptfhUx+96Yna6CiO+8dGIBfD01PFZyeB9g
         h4bKTbjLlxM+lv33mlhhWXZV2uuEbgULiP30fo6Bg/zaaQ3FbVYwXE6ixt4aVSJo+fL1
         2WtcNCVdw3AcQBUjj+sJJE8SGkl73GYZPINwg04imZfeH5c4C5dBvtERa26lIuzuV2mF
         YBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7alCZU74sYXZV+z2uTznaZthaKp3BCYeASOmff2ui7k=;
        b=E61YGtBz14imy9Os09TuQCf+MQ5tluB8wHrLjiGEND5sqlckivyPR4R5JaXabmYn1B
         5gr4r/X91fvZWYlza+PigOouIjXiOQodXFxYG2ZDzzEk9XADl47OaPd6aF70N7kIOTse
         ANrLTpGNfZix2+O5XJE728SyulQSLcU4Fd+aBWcMihtvMZvQPgLdeToMEgJb684+zZdx
         GP8ETkzsiWcsVp8q5RbX3OZQHmZhUOQvy1RIRLmOh6JOivRmtYEw+2mEsiGiObD8cQYv
         E3l8ypOEWrnCiDYTN3Xvzv2DNgky1AQK4xxsXqwMZgbU3B08BZAqKzAMBEmGMVTzgW3w
         Fz4A==
X-Gm-Message-State: AOAM532DYd8k4pVKA734lIMiycV8kS5O9ML+ui6uNGW8y05aAQB+LaA+
        vtajZi8r9bpEtVuSF1TfcFPCMA==
X-Google-Smtp-Source: ABdhPJwF51/aX4FTbG5kCK1BB4KSS9O5EWPwO2EInwvKz65Wd6gW5mAeIodUdbkWqYzZ4oJ4hIgsXw==
X-Received: by 2002:a19:997:: with SMTP id 145mr355979lfj.588.1611000185480;
        Mon, 18 Jan 2021 12:03:05 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id i19sm1999072lfj.212.2021.01.18.12.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 12:03:04 -0800 (PST)
Subject: Re: [PATCH v4] media: ov8856: Configure sensor for GRBG Bayer for all
 modes
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Tomasz Figa <tfiga@google.com>
References: <20210118190132.1045913-1-robert.foss@linaro.org>
 <db76aedb-de5e-2040-1e1c-777848614a7f@linaro.org>
 <357f6099-7a36-bbf6-723c-a4ca76835d00@linaro.org>
 <CAG3jFyuzs00KoMQ2FZfqNAE9+hULTLoXJ2ja0pO-ikS8rvKW3A@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <af6eb377-6f7a-7b08-4a28-14f1a79a9d4a@linaro.org>
Date:   Mon, 18 Jan 2021 23:03:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyuzs00KoMQ2FZfqNAE9+hULTLoXJ2ja0pO-ikS8rvKW3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 18.01.2021 22:54, Robert Foss wrote:
> I was going for row, but got a bit wild with the Ctrl-C + Ctrl-V, is

Yeah... "raw" was in my original text

> that alright with you?

Other than these few raw vs row mistypes the patch is fine for me.
My Reviewed-by tag holds.

Thanks,
Andrey

> On Mon, 18 Jan 2021 at 20:28, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> Oops.. I've missed a few mistypes
>>
>> On 18.01.2021 22:18, Andrey Konovalov wrote:
>>> Hi Robert,
>>>
>>> Thanks for you patch!
>>>
>>> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>
>>> On 18.01.2021 22:01, Robert Foss wrote:
>>>> The previously added modes 3264x2448 & 1632x1224 are actually
>>>> configuring the sensor for BGGR mode, this is an issue since
>>>> the mode that is exposed through V4L incorrectly is set as GRBG.
>>>>
>>>> This patch fixes the issue by moving the output crop window of
>>>> internal sensor ISP uses by one row, which means that the Bayer
>>>> pattern of the output is changed.
>>>>
>>>> From:
>>>> row 1: B G B G B G ...
>>>> row 2: G R G R G R ...
>>>> raw 3: B G B G B G ...
>> - row
>>>> ...
>>>>
>>>> To:
>>>> raw 2: G R G R G R ...
>> - row
>>>> raw 3: B G B G B G ...
>> - row
>>
>> Thanks,
>> Andrey
>>
>>>> ...
>>>>
>>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>>> Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>> ---
>>>>
>>>> Changes since v1:
>>>>    - Sakari: Added mode information to ov8856_mode struct
>>>>    - Sakari: enum_mbus_code updated
>>>>
>>>> Changes since v2:
>>>>    - Andrey: Switched approach to changing the sensor configuration
>>>>      to yield identical Bayer modes for all modes
>>>>
>>>> Changes since v3:
>>>>    - Andrey: Improve commit msg to explain Bayer shift better
>>>>
>>>>    drivers/media/i2c/ov8856.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
>>>> index 2f4ceaa80593..8a355135c7db 100644
>>>> --- a/drivers/media/i2c/ov8856.c
>>>> +++ b/drivers/media/i2c/ov8856.c
>>>> @@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
>>>>        {0x3810, 0x00},
>>>>        {0x3811, 0x04},
>>>>        {0x3812, 0x00},
>>>> -    {0x3813, 0x02},
>>>> +    {0x3813, 0x01},
>>>>        {0x3814, 0x01},
>>>>        {0x3815, 0x01},
>>>>        {0x3816, 0x00},
>>>> @@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
>>>>        {0x3810, 0x00},
>>>>        {0x3811, 0x02},
>>>>        {0x3812, 0x00},
>>>> -    {0x3813, 0x02},
>>>> +    {0x3813, 0x01},
>>>>        {0x3814, 0x03},
>>>>        {0x3815, 0x01},
>>>>        {0x3816, 0x00},
>>>>
