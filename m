Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE99372117
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 22:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhECUHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 16:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECUHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 16:07:05 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D900C06174A
        for <linux-media@vger.kernel.org>; Mon,  3 May 2021 13:06:12 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id q127so6400347qkb.1
        for <linux-media@vger.kernel.org>; Mon, 03 May 2021 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F2io10OAL67cb7EHMlJRCzofAP/Qs75/sPOGNK5/d6o=;
        b=fJkMqqW4BsgYDoQdC+rpvXd6PP2Kwhd5l1y08IonEtTtWULi3c3M0PEaE7Rb0GZlqu
         xBpMeYNhIBZHSp1kAeDUx0ErAB+UL6ryjm6iWnCkZhNsaquj2XYfvIM4XVDQL3EVWNW6
         tu1iGpsGZo8xVPCmEF6ISJSawjhUXdcJm7hU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F2io10OAL67cb7EHMlJRCzofAP/Qs75/sPOGNK5/d6o=;
        b=hTwFnPATJr90ndheAXaa5TVjX+Q7VLbpdUScYV6TH2TqACROQCH/Pcf5lklyVHk1ud
         G8eyLH8TF0ylaADLydJVHL25Rejy6HTv0dOuP/AHizO7W6urCPvaqZH6MGmJWhxbOuH4
         8kwkCpZDD97x3TXyvvF6DM+/BY57Mk400Pl3k23U2EEa/IvN8XbzT+B0GRHUVjI4LqlT
         RTTthpiq4vhy6gl7KdzR0AuFqJ0wLxAdaM0O/wKTiIgIVh2DVYiS1HPMf/GGgo1juBP/
         8jb9Nk61sMDMLCDMaO4xB/MEN7WBcABjJ6+Ndhbyht9W9C4NLn+IMDsnOnguXh1rccgb
         9QEA==
X-Gm-Message-State: AOAM533cwk89PWws4+u7KehFpa6vYIEmth968CUrTU/xKFzuP3zb4jJm
        RtB+Y0KYQ5SUAlMKYOBHZ9yc/g==
X-Google-Smtp-Source: ABdhPJzE75yCgO1kCiFHoMg8Xem5C4qDa9BAPkckdLhrJrnp69tnFeLo1hfZHUjlMVEx4ujuWnsYaw==
X-Received: by 2002:a37:5945:: with SMTP id n66mr21057766qkb.138.1620072371604;
        Mon, 03 May 2021 13:06:11 -0700 (PDT)
Received: from [192.168.151.33] (50-232-25-43-static.hfc.comcastbusiness.net. [50.232.25.43])
        by smtp.gmail.com with ESMTPSA id l16sm720725qtr.65.2021.05.03.13.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 13:06:11 -0700 (PDT)
Subject: Re: [PATCH] media: em28xx: Fix possible memory leak of em28xx struct
To:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, Shuah Khan <skhan@linuxfoundation.org>
References: <20210503173716.21652-1-igormtorrente@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dc285959-080a-3809-2f3e-e1de3440374a@linuxfoundation.org>
Date:   Mon, 3 May 2021 16:06:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210503173716.21652-1-igormtorrente@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Igor,

On 5/3/21 11:37 AM, Igor Matheus Andrade Torrente wrote:
> The em28xx struct kref isn't being decreased after an error in the
> em28xx_ir_init, leading to a possible memory leak.
> 
> A kref_put is added to the error handler code.
> 
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
>   drivers/media/usb/em28xx/em28xx-input.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
> index 5aa15a7a49de..b89527014cad 100644
> --- a/drivers/media/usb/em28xx/em28xx-input.c
> +++ b/drivers/media/usb/em28xx/em28xx-input.c
> @@ -720,7 +720,8 @@ static int em28xx_ir_init(struct em28xx *dev)
>   			dev->board.has_ir_i2c = 0;
>   			dev_warn(&dev->intf->dev,
>   				 "No i2c IR remote control device found.\n");
> -			return -ENODEV;
> +			err = -ENODEV;
> +			goto ref_put;

This doesn't look right. em28xx_init_buttons() is already happened and
em28xx_shutdown_buttons() needs to be done from fini. fini needs to run
with this ref. If ref is released here, device might be released before
em28xx_shutdown_buttons() can run leading to potential use-after-free

>   		}
>   	}
>   
> @@ -735,7 +736,7 @@ static int em28xx_ir_init(struct em28xx *dev)
>   
>   	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
>   	if (!ir)
> -		return -ENOMEM;
> +		goto ref_put;

This doesn't look right. Same comment as above. fini accounts for null
ir.

        em28xx_shutdown_buttons(dev);

         /* skip detach on non attached boards */
         if (!ir)
                 goto ref_put;


>   	rc = rc_allocate_device(RC_DRIVER_SCANCODE);
>   	if (!rc)
>   		goto error;
> @@ -839,6 +840,8 @@ static int em28xx_ir_init(struct em28xx *dev)
>   	dev->ir = NULL;
>   	rc_free_device(rc);
>   	kfree(ir);
> +ref_put:
> +	kref_put(&dev->ref, em28xx_free_device);
>   	return err;
>   }
>   
> 

thanks,
-- Shuah
