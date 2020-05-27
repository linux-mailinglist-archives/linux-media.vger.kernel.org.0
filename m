Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DCC1E3C51
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 10:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388172AbgE0Im0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 04:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387929AbgE0ImZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 04:42:25 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63335C061A0F
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 01:42:25 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id e125so13990527lfd.1
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0cVbaBKHPFRHFgLj7eTRo1bAadVyagSGQGQWcN/OrRE=;
        b=oJxUyzIVgZq7u4vhV2WTxYtWXGyQmwh7FnwZ8aW0G3ACHvkdtdA5Vg8o7/V1sOarON
         yNJdUef2IB0O73wQevzC4PCIMlKH3IWiY6zcax+lX2CmWdkv8j2+pjwlJkLtYIpsWFgp
         SuQ5IhYNHlfCZxc8AijCOMtBvTka3/7rbhfY3Nc6zRHthYsIW9Ia5YXmDFUO15q7K9hn
         gv0TJ0vBP1RCF2fErFoKvNPuVJOLNxLkd0zU42psapjDni5JhYPlHuSrQgTT1TsaksnW
         bLzX4DiKNHL6Hr18kFZRWSRt4TTWKotEOD6xkTw9O+WJMFFWo3KHfgwwU34C3KRgL8N2
         oZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0cVbaBKHPFRHFgLj7eTRo1bAadVyagSGQGQWcN/OrRE=;
        b=KOHDxdfsuPk2dHBICLjb4TAnEH7mBKe/d7sHREndfv+xzxofaQV5Q5FQWA8/t+WlXj
         TSlNuHNc1AUNarAXGyUO7TJlc3wjlzYJlNLL24eKDiH1MQN+XGHGbsdG7mCqaWwGpI7K
         vdrMdKnCEouDfQFqJ7x6xQFTMv+4GCxnqm74CMzSPyU3DvIJ5npPmc8vJV+CnRXoQt53
         c2S9fdSDEXIdwaZ9MIBW4iqHKHwGz0Rp0GAp882irTF/j2g/D84gQEBYCKNKCjhI58O6
         EisQbSTswAyp9jH1rjhe+ODmDQAcv6Y5g9frJTf62oV1LL3LZwlRYm4V0F6bIwpvFugn
         B3zg==
X-Gm-Message-State: AOAM530/qxRQsPLUfrXbS9tzFJtVFJFZvzTr6JpiQXiY7NTv4lVuq+wX
        GfIEKremzt4N0jfRjYPJ8oy8vQ==
X-Google-Smtp-Source: ABdhPJyNlPGUsdKFIc4nPUUBfYBG9iP9HgT7+hNyJKOoA+mEZpSqes4qfc2yvtAB8gm2VZvscTPBfw==
X-Received: by 2002:a19:550e:: with SMTP id n14mr2628879lfe.81.1590568943796;
        Wed, 27 May 2020 01:42:23 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id f2sm543541ljf.113.2020.05.27.01.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 01:42:23 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] media: i2c: imx290: Add RAW12 mode support
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        manivannan.sadhasivam@linaro.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, Peter Griffin <peter.griffin@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
 <20200524192505.20682-8-andrey.konovalov@linaro.org>
 <CAPY8ntAW+yfxw0NTDi3yEwoZ+AqUuXD__pqB977bXgJr=jnNXg@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <3597b850-5ce6-0e88-8f1f-e16bad5f75ef@linaro.org>
Date:   Wed, 27 May 2020 11:42:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAW+yfxw0NTDi3yEwoZ+AqUuXD__pqB977bXgJr=jnNXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On 26.05.2020 19:05, Dave Stevenson wrote:
> Hi Andrey
> 
> Thanks for the patch.
> 
> On Sun, 24 May 2020 at 20:26, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
>> 12 bit formats. Since the driver already supports RAW10 mode, let's add
>> the missing RAW12 mode as well.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/i2c/imx290.c | 36 +++++++++++++++++++++++++++++++++---
>>   1 file changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
>> index 162c345fffac..6e70ff22bc5f 100644
>> --- a/drivers/media/i2c/imx290.c
>> +++ b/drivers/media/i2c/imx290.c
>> @@ -71,6 +71,7 @@ struct imx290 {
>>          struct clk *xclk;
>>          struct regmap *regmap;
>>          u8 nlanes;
>> +       u8 bpp;
>>
>>          struct v4l2_subdev sd;
>>          struct v4l2_fwnode_endpoint ep;
>> @@ -90,10 +91,12 @@ struct imx290 {
>>
>>   struct imx290_pixfmt {
>>          u32 code;
>> +       u8 bpp;
>>   };
>>
>>   static const struct imx290_pixfmt imx290_formats[] = {
>> -       { MEDIA_BUS_FMT_SRGGB10_1X10 },
>> +       { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
>> +       { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
>>   };
>>
>>   static const struct regmap_config imx290_regmap_config = {
>> @@ -261,6 +264,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
>>          { 0x300b, 0x00},
>>   };
>>
>> +static const struct imx290_regval imx290_12bit_settings[] = {
>> +       { 0x3005, 0x01 },
>> +       { 0x3046, 0x01 },
>> +       { 0x3129, 0x00 },
>> +       { 0x317c, 0x00 },
>> +       { 0x31ec, 0x0e },
>> +       { 0x3441, 0x0c },
>> +       { 0x3442, 0x0c },
>> +       { 0x300a, 0xf0 },
>> +       { 0x300b, 0x00 },
>> +};
>> +
>>   /* supported link frequencies */
>>   static const s64 imx290_link_freq_2lanes[] = {
>>          891000000, /* 1920x1080 -  2 lane */
>> @@ -421,7 +436,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>>                  } else {
>>                          imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
>>                          msleep(10);
>> -                       imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
>> +                       if (imx290->bpp == 10)
>> +                               imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
>> +                                                0x3c);
>> +                       else /* 12 bits per pixel */
>> +                               imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
>> +                                                0xf0);
>>                          imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
>>                  }
>>                  break;
>> @@ -496,7 +516,7 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
>>          u8 nlanes = imx290->nlanes;
>>
>>          /* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
>> -       return (link_freq * 2 * nlanes / 10);
>> +       return (link_freq * 2 * nlanes / imx290->bpp);
> 
> This doesn't link on a 32bit system as it's a 64bit divide:
> ERROR: "__aeabi_ldivmod" [drivers/media/i2c/imx290.ko] undefined!
> It ought to be using do_div().

Nice catch, thanks!
I'll fix this in the next version of the patchset.

Thanks,
Andrey

> Admittedly it didn't compile before as you still had a s64 divide by
> 10, but I hadn't tried that :-)
> 
>    Dave
> 
>>   }
>>
>>   static int imx290_set_fmt(struct v4l2_subdev *sd,
>> @@ -533,6 +553,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>>          } else {
>>                  format = &imx290->current_format;
>>                  imx290->current_mode = mode;
>> +               imx290->bpp = imx290_formats[i].bpp;
>>
>>                  if (imx290->link_freq)
>>                          __v4l2_ctrl_s_ctrl(imx290->link_freq,
>> @@ -577,6 +598,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
>>                          return ret;
>>                  }
>>                  break;
>> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
>> +               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
>> +                                               ARRAY_SIZE(
>> +                                                       imx290_12bit_settings));
>> +               if (ret < 0) {
>> +                       dev_err(imx290->dev, "Could not set format registers\n");
>> +                       return ret;
>> +               }
>> +               break;
>>          default:
>>                  dev_err(imx290->dev, "Unknown pixel format\n");
>>                  return -EINVAL;
>> --
>> 2.17.1
>>
