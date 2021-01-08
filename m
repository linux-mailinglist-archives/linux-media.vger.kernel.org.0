Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27762EF13F
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 12:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbhAHL2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 06:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbhAHL2r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 06:28:47 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76CCC0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 03:28:06 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o10so11215368lfl.13
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lS76xy/ppY53yeFgRK9lPlVnhMGFdbc36EC1VOjyjcU=;
        b=szQ2mLAmF/GZrZeond+4zTzdeypaZxGO0ygu4tuMgQxMrbSncWHRDUB9ji909mFCmK
         LNMsiZ7qk9CS6WMVRWZpC7kIUbZASzSAGtJWEEIIXjwUvpYqua68kCzuULsP4Szjvn2h
         9mcG6muO+sxA8uX0yXEwy2TJ5wuVSdvMg2ycULsXO2vMIynV/D/yfyHbCeoJkSrho60W
         oforQ621ZsoEYxiPY54DAfpxFeMds2Az98kZ8AZdevp+Vg9f8fHBNlQpBGsn44c4ZqRI
         UAEnulHEl8TrwD1J37PEYGr8o8tlDjjwdRTJFinvkMJC2cusD2iyNat8/v8z2rPTgAb5
         QUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lS76xy/ppY53yeFgRK9lPlVnhMGFdbc36EC1VOjyjcU=;
        b=qAsz4qYcTNu6nnXc3BH1r3YqxFMDK8TT0Z9AQ1BAyhLualr25Sg9Mzp90JaS3ELuWT
         55xlzFLX3j4LWMHRvuntJr29zkAV+C5dmpa47mru690S9u3qxQhBkqX5X3kO3o77T5Ub
         q2/UW3q/KuRqXc4ppfgqKLmTET1IlV6+XZc3+FNuINiOrRoihTSXWmyy2dZQfKAf9Dza
         GtZbI6AJVTo2fd/j+nv3CPv/AVXPSVTgWChfWrzjjCMLo7Z5jMCT75DioSwPsuPFL++I
         //PPNxFmaNVTkbtCe9LeNIg6ZJ23J3k/lPQVSysDm7cNeIq7QoDjMZHHc8BJP9LKIlq3
         bsOQ==
X-Gm-Message-State: AOAM532dciwe99KVZ4oVubpBwCVOIhhQgZjbgJPvCDxqdtl8y0KCSbku
        AiVZo5E0gI6MxYZq4TkcsYm3YA==
X-Google-Smtp-Source: ABdhPJy8R/fFX7Do0evMLeZd4uo5N07rEFkDQm4h7mSiNaTylRg+xMTmW+uIQfenpT97OtqFRV4DCg==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr1309988ljf.469.1610105285085;
        Fri, 08 Jan 2021 03:28:05 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id q23sm1906733lfo.278.2021.01.08.03.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 03:28:04 -0800 (PST)
Subject: Re: [PATCH v2] media: ov8856: Fix Bayer format dependance on mode
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     Tomasz Figa <tfiga@google.com>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
References: <20210107142123.639477-1-robert.foss@linaro.org>
 <CAAFQd5BVSNGDV7ZkiVpZwbfTfRLJmNvopMQFnQno+CDs+bo3Gg@mail.gmail.com>
 <6ec75d88-0cd5-79cc-6413-81f169b5e976@linaro.org>
Message-ID: <ce4ce8ea-853b-1b15-4c1f-2490c252c2ad@linaro.org>
Date:   Fri, 8 Jan 2021 14:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6ec75d88-0cd5-79cc-6413-81f169b5e976@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 08.01.2021 13:46, Andrey Konovalov wrote:
> Hi Robert and Tomasz,
> 
> On 08.01.2021 12:49, Tomasz Figa wrote:
>> Hi Robert,
>>
>> On Thu, Jan 7, 2021 at 11:21 PM Robert Foss <robert.foss@linaro.org> wrote:
>>>
>>> The Bayer GRBG10 mode used for earlier modes 3280x2460 and
>>> 1640x1232 isn't the mode output by the sensor for the
>>> 3264x2448 and 1632x1224 modes.
>>>
>>> Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
>>> for 3264x2448 & 1632x1224 modes.
>>>
>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>> ---
>>>
>>> Changes since v1:
>>>   - Sakari: Added mode information to ov8856_mode struct
>>>   - Sakari: enum_mbus_code updated
>>>
>>>   drivers/media/i2c/ov8856.c | 24 ++++++++++++++++++------
>>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
>>> index 2f4ceaa80593..7cd83564585c 100644
>>> --- a/drivers/media/i2c/ov8856.c
>>> +++ b/drivers/media/i2c/ov8856.c
>>> @@ -126,6 +126,9 @@ struct ov8856_mode {
>>>
>>>          /* Sensor register settings for this resolution */
>>>          const struct ov8856_reg_list reg_list;
>>> +
>>> +       /* MEDIA_BUS_FMT for this mode */
>>> +       u32 code;
>>>   };
>>>
>>>   static const struct ov8856_reg mipi_data_rate_720mbps[] = {
>>> @@ -942,6 +945,11 @@ static const char * const ov8856_test_pattern_menu[] = {
>>>          "Bottom-Top Darker Color Bar"
>>>   };
>>>
>>> +static const u32 ov8856_formats[] = {
>>> +       MEDIA_BUS_FMT_SBGGR10_1X10,
>>> +       MEDIA_BUS_FMT_SGRBG10_1X10,
>>> +};
>>> +
>>>   static const s64 link_freq_menu_items[] = {
>>>          OV8856_LINK_FREQ_360MHZ,
>>>          OV8856_LINK_FREQ_180MHZ
>>> @@ -974,6 +982,7 @@ static const struct ov8856_mode supported_modes[] = {
>>>                          .regs = mode_3280x2464_regs,
>>>                  },
>>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>>          },
>>>          {
>>>                  .width = 3264,
>>> @@ -986,6 +995,7 @@ static const struct ov8856_mode supported_modes[] = {
>>>                          .regs = mode_3264x2448_regs,
>>>                  },
>>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>>>          },
>>>          {
>>>                  .width = 1640,
>>> @@ -998,6 +1008,7 @@ static const struct ov8856_mode supported_modes[] = {
>>>                          .regs = mode_1640x1232_regs,
>>>                  },
>>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>>          },
>>>          {
>>>                  .width = 1632,
>>> @@ -1010,6 +1021,7 @@ static const struct ov8856_mode supported_modes[] = {
>>>                          .regs = mode_1632x1224_regs,
>>>                  },
>>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>>>          }
>>>   };
>>>
>>> @@ -1281,8 +1293,8 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
>>>   {
>>>          fmt->width = mode->width;
>>>          fmt->height = mode->height;
>>> -       fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>>          fmt->field = V4L2_FIELD_NONE;
>>> +       fmt->code = mode->code;
>>>   }
>>>
>>>   static int ov8856_start_streaming(struct ov8856 *ov8856)
>>> @@ -1519,11 +1531,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
>>>                                   struct v4l2_subdev_pad_config *cfg,
>>>                                   struct v4l2_subdev_mbus_code_enum *code)
>>>   {
>>> -       /* Only one bayer order GRBG is supported */
>>> -       if (code->index > 0)
>>> +       if (code->index >= ARRAY_SIZE(ov8856_formats))
>>>                  return -EINVAL;
>>>
>>> -       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>> +       code->code = ov8856_formats[code->index];
>>>
>>>          return 0;
>>>   }
>>> @@ -1532,10 +1543,11 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
>>>                                    struct v4l2_subdev_pad_config *cfg,
>>>                                    struct v4l2_subdev_frame_size_enum *fse)
>>>   {
>>> -       if (fse->index >= ARRAY_SIZE(supported_modes))
>>> +       if ((fse->code != ov8856_formats[0]) &&
>>> +           (fse->code != ov8856_formats[1]))
>>
>> Shouldn't this be validated against the current mode? I guess it's the
>> question about which part of the state takes precedence - the mbus
>> code or the frame size.
> 
> The docs [1] say "enumerate all frame sizes supported by a sub-device on the given pad
> for the given media bus format". It doesn't seem to mention the current mode. But the
> frame sizes reported should be filtered by the mbus code, and this patch misses that
> if I read it correct.
> 
> But this situation when the mbus code depends on the mode (on the resolution in fact)...
> Yes, if we read the pixels from a rectangle smaller than the active area, we can change
> the bayer order by moving this "read-out" rectangle by one pixel along x, y, or both x
> and y axes. But wouldn't it be better if we try to review the register setting for the
> current modes so that the bayer order would be the same for all the modes?

This untested change should make the 3264x2448 and 1632x1224 modes to use
the GRBG bayer order (I would prefer BGGR as this is the "native" order of the pixel
array, but GRBG appeared in the driver first):

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index d8cefd3d4045..b337f729d5e3 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
         {0x3810, 0x00},
         {0x3811, 0x04},
         {0x3812, 0x00},
-       {0x3813, 0x02},
+       {0x3813, 0x01},
         {0x3814, 0x01},
         {0x3815, 0x01},
         {0x3816, 0x00},
@@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
         {0x3810, 0x00},
         {0x3811, 0x02},
         {0x3812, 0x00},
-       {0x3813, 0x02},
+       {0x3813, 0x01},
         {0x3814, 0x03},
         {0x3815, 0x01},
         {0x3816, 0x00},


Thanks,
Andrey

> Thanks,
> Andrey
> 
>> Best regards,
>> Tomasz
>>
> 
> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-subdev-enum-frame-size.html
