Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7949A2EF0F8
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 11:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbhAHK73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 05:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHK73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 05:59:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B614EC0612F4
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 02:58:48 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id i24so10734386edj.8
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 02:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TOm13NRGHy5Sqh3vog/0XZzm1iyrOm+MRP8TdK1CfMg=;
        b=KVehekSoUNThax2CKt3lTjAesH+8/eHmROF1JIF6RMQ0gz4viBtpcXlHn7Qy3uO92f
         4yZXdQt8GOIis3xpGQv6yg8e7ZNDq6fFJ7Nvs8EN9OiheeO5Q8i7lKnqyfAfn3LBXZeK
         VI3HAe37TFWAvyDtFniueTIQ2Q1UGVlACAlAiaD+Ic8TSkEQblsAzPt5TVox5P5veC7f
         726z3+7hRiBDIRJTd0pUt5ifUGR0JCdsEXpJwQWtgTQJjjUN5qizyPvnalFvBRJMntjw
         hGSRHippbUw4kd3JwrQ9GPUPrL1/GbruvW9o2svnmCrD/kh6f0AaGVHrt0AwcrhiBLBn
         3fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TOm13NRGHy5Sqh3vog/0XZzm1iyrOm+MRP8TdK1CfMg=;
        b=jDSqyn1NYg0Cr9sxRT3BDRBpaekuDmvoCRgRiLjjGQ2ppu45RKUJaVwI2cJ1TqEKWL
         MC04qnAJOLK+7hcDMpvfaf/ja4Gsn/oO5iI8nGuus/MyiNiXEqPDXqrRmwi8wWRu69jA
         +gj01Hcb5O8WAD1/dDlOYJL5m4kzn3d/+LwhGC05PThEBW0+GYIB+iePLkumPCP0ccZ6
         SrbCvDMADnFTCAMz756GWN+ghsnQTI781bFCNSmniUJiiUd6jXZKW92Gx+EcDHv86Yzx
         jb1G5zmislPrq8GSS3APiw2fXtJCbZWnzr7MEAggzMEiXo6bFKIpAjiDmKFNeqA5++pt
         nPXw==
X-Gm-Message-State: AOAM530Ye5IgcDWW0Sp114ipss+4ZM9LS2W3ZdH5WsW86Nyca2cHGqTT
        3tCroGyGVIBXxmZp8osX6mo=
X-Google-Smtp-Source: ABdhPJzQ1p3qGIF9RvvpV4+O+RVVjNL7bNHK5QsAsD4Vp7NDE+OMMwNDPHGfGAB6pGc2b6IyygR5sw==
X-Received: by 2002:a05:6402:45:: with SMTP id f5mr4785454edu.273.1610103527497;
        Fri, 08 Jan 2021 02:58:47 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id j25sm3419167ejx.125.2021.01.08.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 02:58:46 -0800 (PST)
Subject: Re: [PATCH 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
 <20210104165739.116404-2-ezequiel@collabora.com>
 <d07ac542-8b1c-779f-0b69-683c0d0ae2d1@gmail.com>
 <3950cb4b337e6373b066034c32e51a1e9e88a50f.camel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <c8b39f6c-7a21-b597-c633-b053d701fe67@gmail.com>
Date:   Fri, 8 Jan 2021 12:02:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3950cb4b337e6373b066034c32e51a1e9e88a50f.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne 06. 01. 21 v 16:53 Ezequiel Garcia napsal(a):
> Hi Petr,
> 
> Thanks a lot for reviewing and testing the series.
> 
> On Tue, 2021-01-05 at 17:41 +0100, Petr Cvek wrote:
>>
>> Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
>>> The pxa-camera capture driver currently registers a v4l2-clk
>>> clock, named "mclk", to represent the mt9m111 sensor clock.
>>>
>>> Register a proper fixed-rate clock using the generic clock framework,
>>> which will allow to remove the v4l2-clk clock in the pxa-camera
>>> driver in a follow-up commit.
>>>
>>
>> BTW the mclk output to a sensor is actually a variable rate, divided from lcdclk (which can be changed too). PXA camera driver  is using variable
>> pcdev->mclk_divisor to generate the mclk from lcdclk. 
>>
> 
> Hm, now that I look at this, I see the pxa-camera driver
> is requiring a clock:
> 
>         pcdev->clk = devm_clk_get(&pdev->dev, NULL);                             
>         if (IS_ERR(pcdev->clk))                                                  
>                 return PTR_ERR(pcdev->clk);   
> 
> Where is this clock registered in the non-devicetree case?
> 

I think this is where the clock is defined 

	PXA27X_CKEN_1RATE("pxa27x-camera.0", NULL, CAMERA, pxa27x_lcd_bus_parents, 0),

https://elixir.bootlin.com/linux/v5.10.2/source/drivers/clk/pxa/clk-pxa27x.c#L180


>> The rate change is done in pxa_camera_activate():
>>
>> https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/media/platform/pxa_camera.c#L1136
>>
>>         __raw_writel(pcdev->mclk_divisor | cicr4, pcdev->base + CICR4);
>>
>> Would it be possible to register a correct clock type with possibility to change the divisor by the standard way?
>>
> 
> Right, so you mean the pxa-camera driver is the one providing the clock for the sensors?
> 
> In that case, I guess the pxa-camera driver should be the one registering
> a CCF clock. Other drivers are doing this, through clk_register for instance.
> 

Yeah that would make the sense, because the camera controller controls the divider and enable signals.

> However, for the sake of this series, which is meant to get rid
> of the v4l2-clk API, I would say it's fine to just register a fixed-rate.
> 
> This is similar to what v4l2_clk_register was doing, which was registering
> a dummy clock.
> 

I guess. Just the 1:1 replacement. 

> Having said that, as I mentioned above, I'm wondering if the mach-pxa
> boards are really working, given I'm not seeing the clock for pxa-camera.
> 
> Maybe the best way forward is to just accept that pxa-camera
> is only supported for the device tree platforms, and therefore drop the
> support from mach-pxa/ boards.
> 

PXA camera worked without devicetree without problems (I'm not sure if I ever used devicetree). The definition should be in that file above (but I'm not that familiar with the clock framework).

best regards,
Petr

> Thanks,
> Ezequiel
>  
> 
>> Petr
>>
>>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>>  arch/arm/mach-pxa/devices.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
>>> index 524d6093e0c7..09b8495f3fd9 100644
>>> --- a/arch/arm/mach-pxa/devices.c
>>> +++ b/arch/arm/mach-pxa/devices.c
>>> @@ -4,6 +4,7 @@
>>>  #include <linux/init.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/clkdev.h>
>>> +#include <linux/clk-provider.h>
>>>  #include <linux/dma-mapping.h>
>>>  #include <linux/dmaengine.h>
>>>  #include <linux/spi/pxa2xx_spi.h>
>>> @@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
>>>  
>>>  void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
>>>  {
>>> +       struct clk *mclk;
>>> +
>>> +       /* Register a fixed-rate clock for camera sensors. */
>>> +       mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
>>> +                                            info->mclk_10khz * 10000);
>>> +       if (!IS_ERR(mclk))
>>> +               clkdev_create(mclk, "mclk", NULL);
>>>         pxa_register_device(&pxa27x_device_camera, info);
>>>  }
>>>  
>>>
> 
> 
