Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1573348E70
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCYK4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhCYKzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:55:50 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C862C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:55:50 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y6so1911643eds.1
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z1GZucc6xAe4CvMSCSTJPL9ro5+l4YgYD4RbEdU33x8=;
        b=eqyPVNX0BupwLrvjOOHm64Zyq+Qnq155y4CjVjA5OOXktimYImHFbBCf9mzNl27V1M
         4gnxEMCfZlM00kCHpkeg4wHSit7aw2UBjcEc0X6bhOapoRNL+JO0IFbWFlps3TOeBHQM
         lKxl33DtTioBpUkOr8inhTZHd+FtgP/Tr+2cxQdm6Sjjg//ZDhA+0gkzAuVYDx5oicn7
         8fs02rh9q7saANapc1GWyFYSHthgzr81BSrPb4OpmLn2SFubDzqOhiYj9fXA+ZcrzKXz
         Ps0RnLVzpPDz8bmDhYwzGAg4bRw42NfUtiT6CqsczdW2CpWy5xMcFd/AmusbSgs0OPwF
         d+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z1GZucc6xAe4CvMSCSTJPL9ro5+l4YgYD4RbEdU33x8=;
        b=Uv5qrtMWzxvJ3kWO7WDfu5EN0W+SoogtBKFDQp0XMNzyyNBEPNKopvF2xKsEylclA8
         liHaqhFkYgHC8PB7TgsJpDYPKqcu55yX0HsaDRvx4F47SkAp5zkt7ALe1hCaTrFCLrEn
         sbhllq338VDqHwi/ZeVVcWc5FKV/UZOC8qH0boRKBAB3XYNPxSshC9R82GrjI14ocxnv
         dHrjHZKqQdgdjFoK1T8xVUZWAhAmgSz8Wt8w7gup6qJfnkYEo1v3mDUYFf7hwfK6fOQd
         Tdc9B3C9pgiOFfLvGR9zc78aelej9dPxEYJV83BTSQQTFGwwMZRNWYK+xPfSFTKpYCta
         jYUA==
X-Gm-Message-State: AOAM530pbmtgHEUrsEJN80vGkV+hL73wcM44Ls561VNIht7BPQwepE9f
        N2YccMmsGXMTN4Hz0FhfVieang==
X-Google-Smtp-Source: ABdhPJw2rDMbO8JHDX2lUXJvLooSMCXg5b/5z7UfOVk2DSk+V1hPEFNAdf+6JS6vyLx20eiD54VPWA==
X-Received: by 2002:a50:fa42:: with SMTP id c2mr8450803edq.159.1616669749131;
        Thu, 25 Mar 2021 03:55:49 -0700 (PDT)
Received: from [192.168.1.54] (hst-221-22.medicom.bg. [84.238.221.22])
        by smtp.googlemail.com with ESMTPSA id u15sm2537567eds.6.2021.03.25.03.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 03:55:48 -0700 (PDT)
Subject: Re: [PATCH] v4l: Cast timestamp tv_usec to singned
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210325102952.1126952-1-stanimir.varbanov@linaro.org>
 <CAK8P3a0uCJ0U=mUiuUfT53r27KLBHaMOpZpLTp4BrbvG1P7sMw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <29b4179f-b3d2-8c7e-eed6-af5aed80d430@linaro.org>
Date:   Thu, 25 Mar 2021 12:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0uCJ0U=mUiuUfT53r27KLBHaMOpZpLTp4BrbvG1P7sMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/25/21 12:51 PM, Arnd Bergmann wrote:
> On Thu, Mar 25, 2021 at 11:29 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Some of the MPEG4 standards allows negative timestamps. Correct
>> tv_usec cast to s32.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> Can you clarify what exactly is allowed in MPEG4? Normally we require
> a normalized timestamp to come from user space in other kernel interfaces,
> i.e. an arbitrary .tv_sec value that may or may not be negative, plus
> a sub-second .tv_usec between 0 and 999999, or a .tv_nsect between 0
> and 999999999 to indicate the time after the last full second.
> 
> E.g. a negative timestamp of -1.0001 seconds would be represented as
> .tv_sec = -2, .tv_usec = 999900.

Sure, I will try to collect some more info. Thanks!

> 
> What is the range defined in MPEG4? It might be necessary to check
> for the specific range and reject anything outside of that, in particular
> if MPEG4 also allows positive microsecond values larger than 999999.
> 
>          Arnd
> 
>>  include/media/v4l2-common.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index 3eb202259e8c..1ed61416003a 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -544,11 +544,11 @@ static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>>  {
>>         /*
>>          * When the timestamp comes from 32-bit user space, there may be
>> -        * uninitialized data in tv_usec, so cast it to u32.
>> +        * uninitialized data in tv_usec, so cast it to s32.
>>          * Otherwise allow invalid input for backwards compatibility.
>>          */
>>         return buf->timestamp.tv_sec * NSEC_PER_SEC +
>> -               (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
>> +               (s32)buf->timestamp.tv_usec * NSEC_PER_USEC;
>>  }
>>

-- 
regards,
Stan
