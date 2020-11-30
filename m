Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50B92C7F4D
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 08:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgK3HxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 02:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgK3HxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 02:53:05 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA237C0617A6
        for <linux-media@vger.kernel.org>; Sun, 29 Nov 2020 23:52:23 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id a16so19825097ejj.5
        for <linux-media@vger.kernel.org>; Sun, 29 Nov 2020 23:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2LA2E6rBy3e7tr0KYfuwIv6z/MAGSSZreT27PuzEoI8=;
        b=rtTAOzn31jGFe70k+r1tfLH2f2m28g/XL+8mgiYuVbNBDrrPsYS/nW9CWraxQdZptA
         7cPEG9MxA3ULhSM5Cy/yvn2EGFdihfX7VofV3TDi30P4lo0XzrUrc/icIJRt1BPbQ3hW
         lscto6n84YptqCzm1SEMJ44DcAlvBagxtG5Vm87k8P1Ga74LqbOT4kFgdV5gLpxywrak
         9ETQ/9yQHR4gnviAr7gCmyaLZsNLkQTzdjmmInkx1USADEVddX51j30OWT3lauaqOFC2
         HxGQBmva+7ihW360vgU/HY+xJAqRE5rGvvEmlV80OAEa0dzdj/QxwKlFO8SkAps0Nswp
         Q/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2LA2E6rBy3e7tr0KYfuwIv6z/MAGSSZreT27PuzEoI8=;
        b=SMoNtwhle6gT2DRgBYc6uk0vHpPaxzqmQrYjpTOjKP1PGvEVxxPorUkgDx9LqE/7Xq
         oMRPy9reJ0Th08M5Z5iFcffzdbdqkPRz3kVDN5TS6v7Te99fajReUgoFHmZlhZIF4diY
         ZHX1E+FdTbh7yMlfFJVOHzRpTjPk3llwNWp2CEuMb/iCUyARqLShDrgC8GXCeAyLHeHN
         B7bWtrTn8ls/ZkiIfIUt8VMJ8gxPYU7FNbIy7sywQyK+8lTyRaGq+bRD4iNb7dnrpEwT
         wGMca3lezTc3ftq/Uy1S6AqOeaHnVYNIHGmYYYnvKkLJYqKzVNAtY6Uz0HkOMfiglPqH
         j0xg==
X-Gm-Message-State: AOAM533+3+1/kspKU7KM/goBCWu2nVZEka4yXrgjWT3bnSMrX+mdMpAs
        7O4zWHyOXPkg7T9IdyEmq0dKfA==
X-Google-Smtp-Source: ABdhPJyGoYJkuCQBR94Y63mUgS6+RgtrV6JrdM/h+YjbBN5B/K/f+oCd+0l1U+SQGVRLgkABL3nSdA==
X-Received: by 2002:a17:907:20cc:: with SMTP id qq12mr8935762ejb.316.1606722742475;
        Sun, 29 Nov 2020 23:52:22 -0800 (PST)
Received: from [192.168.0.3] (hst-221-49.medicom.bg. [84.238.221.49])
        by smtp.googlemail.com with ESMTPSA id v16sm2300169eds.64.2020.11.29.23.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 23:52:21 -0800 (PST)
Subject: Re: [PATCH v2 4/8] venus: helpers: Calculate properly compressed
 buffer size
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
 <20201111143755.24541-5-stanimir.varbanov@linaro.org>
 <CAMfZQbwMwPkQzakC+6aLqCnoHnjEL7ZhSn_WngcycAF0=6MFxg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a7e3e582-93c7-d0e8-41a0-71d89a16fc70@linaro.org>
Date:   Mon, 30 Nov 2020 09:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfZQbwMwPkQzakC+6aLqCnoHnjEL7ZhSn_WngcycAF0=6MFxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/29/20 8:07 AM, Fritz Koenig wrote:
> On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> For resolutions below 720p the size of the compressed buffer must
>> be bigger. Correct this by checking the resolution when calculating
>> buffer size and multiply by four.
> 
> I'm confused because the commit message doesn't appear to line up with
> the code.  It says multiply by four here, but the code has by eight.

Yes, it is confusing. I will correct it in next version.

> 
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>> index 688e3e3e8362..490c026b58a3 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -986,6 +986,8 @@ u32 venus_helper_get_framesz(u32 v4l2_fmt, u32 width, u32 height)
>>
>>         if (compressed) {
>>                 sz = ALIGN(height, 32) * ALIGN(width, 32) * 3 / 2 / 2;
>> +               if (width < 1280 || height < 720)
>> +                       sz *= 8;
>>                 return ALIGN(sz, SZ_4K);
>>         }
>>
>> --
>> 2.17.1
>>

-- 
regards,
Stan
