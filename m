Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3878376F11
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 18:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfGZQ3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 12:29:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50961 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfGZQ3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 12:29:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so48539937wml.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nJUGBOsWDyiw8R9hvEymNv7YZNVbl/anKoNGOrwDEbI=;
        b=096np3kiFI0L+5v2C8C2N5V013L0+30ctf/vWwFPlqjgKR9rAeuluK8kfxy2TFEzdV
         qJCGEYdJCxwOUTuOaG9Y1Mwux4sqOSjo7hkh1G6p5nq2S+EY6zfnYOs/oifgUPj2x1tX
         boG+5on8yjYhOb4SKqnGXnY7pNWgYFBthArM205bjMnqhqHDEojIfPOTPI0SqVYNnp2L
         11YyTfjnRDM1SkpdxRV+BOA1bjMBrqCG3ShuOKnehgXOObrD2omdc9Q8OrxgrQK/z4oX
         9Q2/9V2t15sfojOY9JKuLO8ogoiMdlP1AXmxEX3XeLes61790QpgWbpEP7JbK+i8Y74T
         If7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJUGBOsWDyiw8R9hvEymNv7YZNVbl/anKoNGOrwDEbI=;
        b=fL5RRW2JtWd1JPq9PkMvVGCp5FIxZ+UgsbGLb/vgXBeudp6joWpxYv8GFlF/Ty95ji
         3VVEe68Kinzz6xBxGIZbq3AKsw5azDs22oRwCBH9dCZTmI3EOHJRhAOLf4f1eWxlEO4E
         HdUP3p2owsJ0882oujmOsDUgwRfhdc8KlJ/jyg5wln3ljZbl2Df9PtQe/jGJDaLE9UN8
         vwSEOMvU7hO9YFFuQ7oRrHrDQg8oQKZtHpN77OCugmoMBtDONy4TqJUsBDbhUkS1kSaN
         RpV7hbhKUdCVN/jFs8hmbxx1QRNq1RNyXYTBIdgXDcq3ul71nrhT61/234PN/aTnQQfT
         uhmw==
X-Gm-Message-State: APjAAAX6hU2X6uNKrTr8LDz2tgBZNbF6gQCRPN72FW3MrAIPhPlVO1yr
        +zF7fueGkp7r9JwvcpdnvF0az2hO
X-Google-Smtp-Source: APXvYqxP20m1C2G5YwjGzKh82Tf7RKbTu4/3tsgfPldAr+q9gfJkxlaIHYiBMZjNm8YU8Azhp1vRYA==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr87761863wmf.111.1564158591804;
        Fri, 26 Jul 2019 09:29:51 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id p3sm43664436wmg.15.2019.07.26.09.29.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 09:29:50 -0700 (PDT)
From:   Laura Nao <laura.nao@kynetics.com>
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Eugen.Hristev@microchip.com, eric@nelint.com, festevam@gmail.com,
        slongerbeam@gmail.com, p.zabel@pengutronix.de
Cc:     loic.poulain@linaro.org, linux-media@vger.kernel.org
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
 <913336b5-c2a1-5c2c-f893-6a28ccfedd63@nelint.com>
 <c2ad1ba3-a93e-8fb0-8720-aacf3075c6d6@microchip.com>
Message-ID: <9fb9b4ad-cb38-8a9c-4cd1-ca8522669dd9@kynetics.com>
Date:   Fri, 26 Jul 2019 18:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c2ad1ba3-a93e-8fb0-8720-aacf3075c6d6@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eric and Eugen,

On 7/23/19 9:51 AM, Eugen.Hristev@microchip.com wrote:
> 
> 
> On 22.07.2019 19:25, Eric Nelson wrote:
>> Hi Laura,
>>
>> On 7/22/19 8:50 AM, Laura Nao wrote:
>>> Thanks Fabio!
>>>
>>> I tried tweaking the PLL configuration in the driver and did some
>>> further tests on 5.2 kernel.
>>>
>>> I was finally able to capture RAW frames that match the test pattern
>>> for 1280x720 and 1920x1080 resolutions. The 2592x1944 frame is still
>>> not perfectly aligned, but it looks much closer to the test pattern.
>>>
>>> I uploaded the images here:
>>>
>>> https://imgur.com/a/ywHokMf
>>>
>>> The changes I made in the driver are below. Not sure these changes
>>> make much sense, but they seem to fix 1280x720 and 1920x1080 frames.
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index 759d60c6..cfa678e 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -795,13 +795,13 @@ static int ov5640_mod_reg(struct ov5640_dev
>>> *sensor, u16 reg,
>>>     * FIXME: to be re-calcualted for 1 data lanes setups
>>>     */
>>>    #define OV5640_MIPI_DIV_PCLK    2
>>> -#define OV5640_MIPI_DIV_SCLK    1
>>> +#define OV5640_MIPI_DIV_SCLK    2
>>>
>>>    /*
>>>     * This is supposed to be ranging from 1 to 2, but the value is always
>>>     * set to 2 in the vendor kernels.
>>>     */
>>> -#define OV5640_PLL_ROOT_DIV            2
>>> +#define OV5640_PLL_ROOT_DIV            1
>>>    #define OV5640_PLL_CTRL3_PLL_ROOT_DIV_2        BIT(4)
>>>
>>>    /*
>>> @@ -836,8 +836,8 @@ static unsigned long ov5640_compute_sys_clk(struct
>>> ov5640_dev *sensor,
>>>        unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
>>>
>>>        /* PLL1 output cannot exceed 1GHz. */
>>> -    if (sysclk / 1000000 > 1000)
>>> -        return 0;
>>> +    // if (sysclk / 1000000 > 1000)
>>> +    //     return 0;
>>>
>>>        return sysclk / sysdiv;
>>>    }
>>> @@ -1818,7 +1824,7 @@ static int ov5640_set_mode(struct ov5640_dev
>>> *sensor)
>>>         * All the formats we support have 16 bits per pixel, seems to
>>> require
>>>         * the same rate than YUV, so we can just use 16 bpp all the time.
>>>         */
>>> -    rate = mode->vtot * mode->htot * 16;
>>> +    rate = mode->vtot * mode->htot * 8;
>>>        rate *= ov5640_framerates[sensor->current_fr];
>>>        if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>>>            rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
>>>
>>
>> How many frames per second are you getting out of this?
>>
>> If I'm reading this right, the change to ov5640_set_mode is reducing
>> the frame rate (to 7.5 fps?), but I don't follow how the changes
>> to OV5640_MIPI_DIV_SCLK and OV5640_PLL_ROOT_DIV are affecting things
>> and the data sheet isn't very clear.
>>

I'm getting 15fps for 640x480 and 1280x720 resolutions, 7.5 fps for 
1920x1080. For the higher 2592x1944 resolution I'm getting 1.15fps, 
which is quite low.

I obtained these values from v4l2-utils.

> 
> Hello ,
> 
> Are you using parallel or csi2 interface for this sensor ?
> 
> During my tests with atmel image sensor controller (parallel),  I could
> not get RAW frames at all. they were all garbled, as you described.
> 
> I would be happy to test patches if you fixed the RAW formats for this
> sensor.
> (currently, it works in YUV422 and RGB565 directly from the sensor for me)
> 
> Thanks,
> 
> Eugen
> 

I'm using CSI-2 interface. I cannot test capture on parallel interface 
at the moment, but I'll be happy to share a patch if we find out a valid 
register configuration for RAW8 format.

Best regards,

Laura
