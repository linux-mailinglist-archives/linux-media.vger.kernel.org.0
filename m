Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DE2373052
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 21:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhEDTIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 15:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhEDTI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 15:08:26 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5852C06174A;
        Tue,  4 May 2021 12:07:31 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id 76so7883899qkn.13;
        Tue, 04 May 2021 12:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2GHL/SEgSOnHu9ybvCk72F3enffJ+oqaNygEn1HzTJQ=;
        b=R/JSj+Dq8U4sMWy39msHdEPCd1+/8QkjFJzCgo9juFXOdyk+28I00LwgvPv+Xr+y7j
         WXlmoz2Gfl6ONsLx0fos5mxA2xQAQd8SVe0TZ4Flfx3qzQ6VYn6vETPlL8CqknDmt0x0
         QtubWFpTsVcu5yPprtY+P+VPBlQ1XDqh65SxL79kJqYNDwLlLTK4vnZRcekDM250bwqp
         q92Uf3pg1Xl4MEwW79HKIILwpw946eRGwhUGC/F2mr3FXZZFIdKVgyOhoSMqyu7yzNPh
         gIUEKQN5j+O6OSfvBY8G4+WtexXpdsTqcnfNHSDttNjxAH/sbyMdg7D0cyAUWTp9JgRP
         gN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2GHL/SEgSOnHu9ybvCk72F3enffJ+oqaNygEn1HzTJQ=;
        b=aLlO/K9lt/cVd+V09WIn7Vk9m3G54ZQg5rA4MjGAbUbpH2TyX89B3npeAr9fXdh9qD
         hDQ1BkCiaCYvgWWqDNQ5UNGSyykM3Bm99gJe5PJ0SiNQiYI9/mzu3Ark16TbdKaJSP+h
         b0eQtJLZjaAMW/ymK6v5Lx1u/cNEj3+tPYChTnfep/kCVv3SnbzBwa4sxG8btND2C4Zs
         Mtv2liUVp36XI5nmTGNaaMosMNpsoR8ghoQXIfK68IetYajKp5kGKV1inwk/s59RHUBt
         WY3uR2XsPVqppyOBqaASNgs9C+ZHkRKgKGE1mM79tKpQBhqsnsI5a1oQmMJaam5IUfvP
         HiZg==
X-Gm-Message-State: AOAM5309V7p8htFzvD3xq9Vzbsp+UtKP+yctqcjFmXSEHhkPxnzpgtUv
        Sws2njZ22HO3LEZWPSqoS3Z2GoW9+sbCcQ==
X-Google-Smtp-Source: ABdhPJziMVhIhR3ZpRonQ8FNTyJsfiu4+N+8fWV2sAyiXHXK7nZ/i3jAPnq2rNc6ZpbDnyT2DsOxOg==
X-Received: by 2002:a37:6850:: with SMTP id d77mr22571773qkc.57.1620155250886;
        Tue, 04 May 2021 12:07:30 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b:fbbc:3360:40c4:fb64? ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.gmail.com with ESMTPSA id t1sm3059094qto.78.2021.05.04.12.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 12:07:30 -0700 (PDT)
Subject: Re: [PATCH] media: em28xx: Fix possible memory leak of em28xx struct
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
References: <20210503173716.21652-1-igormtorrente@gmail.com>
 <dc285959-080a-3809-2f3e-e1de3440374a@linuxfoundation.org>
From:   Igor Torrente <igormtorrente@gmail.com>
Message-ID: <e5fa7752-a6d4-7d5b-160c-c92a38fed0e6@gmail.com>
Date:   Tue, 4 May 2021 16:07:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dc285959-080a-3809-2f3e-e1de3440374a@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/3/21 5:06 PM, Shuah Khan wrote:
> Hi Igor,
> 
> On 5/3/21 11:37 AM, Igor Matheus Andrade Torrente wrote:
>> The em28xx struct kref isn't being decreased after an error in the
>> em28xx_ir_init, leading to a possible memory leak.
>>
>> A kref_put is added to the error handler code.
>>
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
>>   drivers/media/usb/em28xx/em28xx-input.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/usb/em28xx/em28xx-input.c 
>> b/drivers/media/usb/em28xx/em28xx-input.c
>> index 5aa15a7a49de..b89527014cad 100644
>> --- a/drivers/media/usb/em28xx/em28xx-input.c
>> +++ b/drivers/media/usb/em28xx/em28xx-input.c
>> @@ -720,7 +720,8 @@ static int em28xx_ir_init(struct em28xx *dev)
>>               dev->board.has_ir_i2c = 0;
>>               dev_warn(&dev->intf->dev,
>>                    "No i2c IR remote control device found.\n");
>> -            return -ENODEV;
>> +            err = -ENODEV;
>> +            goto ref_put;
> 
> This doesn't look right. em28xx_init_buttons() is already happened and
> em28xx_shutdown_buttons() needs to be done from fini. fini needs to run
> with this ref. If ref is released here, device might be released before
> em28xx_shutdown_buttons() can run leading to potential use-after-free
> 

Thanks for the feedback.

I sent a patch V2 that I think fix the problem pointed out.

>>           }
>>       }
>> @@ -735,7 +736,7 @@ static int em28xx_ir_init(struct em28xx *dev)
>>       ir = kzalloc(sizeof(*ir), GFP_KERNEL);
>>       if (!ir)
>> -        return -ENOMEM;
>> +        goto ref_put;
> 
> This doesn't look right. Same comment as above. fini accounts for null
> ir.
> 
>        em28xx_shutdown_buttons(dev);
> 
>         /* skip detach on non attached boards */
>         if (!ir)
>                 goto ref_put;
> 
> 
>>       rc = rc_allocate_device(RC_DRIVER_SCANCODE);
>>       if (!rc)
>>           goto error;
>> @@ -839,6 +840,8 @@ static int em28xx_ir_init(struct em28xx *dev)
>>       dev->ir = NULL;
>>       rc_free_device(rc);
>>       kfree(ir);
>> +ref_put:
>> +    kref_put(&dev->ref, em28xx_free_device);
>>       return err;
>>   }
>>
> 
> thanks,
> -- Shuah

Best regard,
---
Igor M. A. Torrente
