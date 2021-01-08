Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118A42EF0D6
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 11:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbhAHKqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 05:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbhAHKqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 05:46:50 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C429C0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 02:46:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so21861811lff.9
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p+waloq0fk/MGdpK82nCZe9TIaeg5dnHeMElfg7ryM4=;
        b=BKpjsFphvWdKBCHkA4RhemDDINeDoPUwbMlWozZMEDjYKYz3sh+JQclxys0m1+XuBa
         /4wzP5ULgApjOCKj1Yj/SnkVAcmbQxg/z+piNUuZFMXnxvl/LXgrjrGPJIONoRNGP3zq
         kaq3n+jRGjg3c5T5aPU+gtXdJlY+4PzERzZMRmPH2xnCbBugiLGgeXO3svaK/5Xnlfd+
         Zlpd7vz3SVh+bkAWO0NvLK7Yg+f581MV8OX0R4eyjxAYzD5rF3UJy84HesNTYrYk3mxK
         uAfSm2h9Y9PjEUYzZ56eGgJ18xsRv49HxBI+U7SAw5Cwak8pZmywGwnO6PSO/4UICsFD
         ZMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p+waloq0fk/MGdpK82nCZe9TIaeg5dnHeMElfg7ryM4=;
        b=kMQaCx7qCn0RjkG4R9H6uCNNW/mPdRni1itS6OMNQkPPApA1HFVmmEmvIAjb8HcDhW
         BYHSxpCnUZQ2HyWE3zVH9ZHSaKbQAo0vzTOpC9OBkXxJTCVuhhl7gSwsQ96Rzqi1anXd
         EfEJhSLgNaFyk3jl98jRLJVq4D3UDIuScDkNIgKY3BZ3mvZ/cfH74X5+a8tkvmH5FWQP
         BcJpKS6M7CZw4FGjQP7DZnlkRpWktm4uBOW+Dgc1FkHpzlr1J1wRmKUlD/GxG1O00OmG
         yBN3P7TL9ypAW7Cj6aTwV1wB1uV0/vKH3jO63zciLrFGZYM1cXdu6B1/FblqXLk+HH6I
         n9Pw==
X-Gm-Message-State: AOAM530+XO2uG37wDwZOuI2ZiN/vgfOpkvHWihvM35EHawJBzHkLSCid
        txWAyu0RJ2Gz9Ld+tmF8YdUkaA==
X-Google-Smtp-Source: ABdhPJxyd5pjnYXDovgitsQk+ePH2PwRGsbg5/X5D8xjJRjKtyVtA+LosBWIyYGCr+TskuNhZ3AOZw==
X-Received: by 2002:ac2:5042:: with SMTP id a2mr1322451lfm.42.1610102768460;
        Fri, 08 Jan 2021 02:46:08 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id a15sm1983948lji.105.2021.01.08.02.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 02:46:07 -0800 (PST)
Subject: Re: [PATCH v2] media: ov8856: Fix Bayer format dependance on mode
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
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <6ec75d88-0cd5-79cc-6413-81f169b5e976@linaro.org>
Date:   Fri, 8 Jan 2021 13:46:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BVSNGDV7ZkiVpZwbfTfRLJmNvopMQFnQno+CDs+bo3Gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert and Tomasz,

On 08.01.2021 12:49, Tomasz Figa wrote:
> Hi Robert,
> 
> On Thu, Jan 7, 2021 at 11:21 PM Robert Foss <robert.foss@linaro.org> wrote:
>>
>> The Bayer GRBG10 mode used for earlier modes 3280x2460 and
>> 1640x1232 isn't the mode output by the sensor for the
>> 3264x2448 and 1632x1224 modes.
>>
>> Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
>> for 3264x2448 & 1632x1224 modes.
>>
>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>> ---
>>
>> Changes since v1:
>>   - Sakari: Added mode information to ov8856_mode struct
>>   - Sakari: enum_mbus_code updated
>>
>>   drivers/media/i2c/ov8856.c | 24 ++++++++++++++++++------
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
>> index 2f4ceaa80593..7cd83564585c 100644
>> --- a/drivers/media/i2c/ov8856.c
>> +++ b/drivers/media/i2c/ov8856.c
>> @@ -126,6 +126,9 @@ struct ov8856_mode {
>>
>>          /* Sensor register settings for this resolution */
>>          const struct ov8856_reg_list reg_list;
>> +
>> +       /* MEDIA_BUS_FMT for this mode */
>> +       u32 code;
>>   };
>>
>>   static const struct ov8856_reg mipi_data_rate_720mbps[] = {
>> @@ -942,6 +945,11 @@ static const char * const ov8856_test_pattern_menu[] = {
>>          "Bottom-Top Darker Color Bar"
>>   };
>>
>> +static const u32 ov8856_formats[] = {
>> +       MEDIA_BUS_FMT_SBGGR10_1X10,
>> +       MEDIA_BUS_FMT_SGRBG10_1X10,
>> +};
>> +
>>   static const s64 link_freq_menu_items[] = {
>>          OV8856_LINK_FREQ_360MHZ,
>>          OV8856_LINK_FREQ_180MHZ
>> @@ -974,6 +982,7 @@ static const struct ov8856_mode supported_modes[] = {
>>                          .regs = mode_3280x2464_regs,
>>                  },
>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>          },
>>          {
>>                  .width = 3264,
>> @@ -986,6 +995,7 @@ static const struct ov8856_mode supported_modes[] = {
>>                          .regs = mode_3264x2448_regs,
>>                  },
>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>>          },
>>          {
>>                  .width = 1640,
>> @@ -998,6 +1008,7 @@ static const struct ov8856_mode supported_modes[] = {
>>                          .regs = mode_1640x1232_regs,
>>                  },
>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>          },
>>          {
>>                  .width = 1632,
>> @@ -1010,6 +1021,7 @@ static const struct ov8856_mode supported_modes[] = {
>>                          .regs = mode_1632x1224_regs,
>>                  },
>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>>          }
>>   };
>>
>> @@ -1281,8 +1293,8 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
>>   {
>>          fmt->width = mode->width;
>>          fmt->height = mode->height;
>> -       fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>          fmt->field = V4L2_FIELD_NONE;
>> +       fmt->code = mode->code;
>>   }
>>
>>   static int ov8856_start_streaming(struct ov8856 *ov8856)
>> @@ -1519,11 +1531,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
>>                                   struct v4l2_subdev_pad_config *cfg,
>>                                   struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> -       /* Only one bayer order GRBG is supported */
>> -       if (code->index > 0)
>> +       if (code->index >= ARRAY_SIZE(ov8856_formats))
>>                  return -EINVAL;
>>
>> -       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>> +       code->code = ov8856_formats[code->index];
>>
>>          return 0;
>>   }
>> @@ -1532,10 +1543,11 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
>>                                    struct v4l2_subdev_pad_config *cfg,
>>                                    struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -       if (fse->index >= ARRAY_SIZE(supported_modes))
>> +       if ((fse->code != ov8856_formats[0]) &&
>> +           (fse->code != ov8856_formats[1]))
> 
> Shouldn't this be validated against the current mode? I guess it's the
> question about which part of the state takes precedence - the mbus
> code or the frame size.

The docs [1] say "enumerate all frame sizes supported by a sub-device on the given pad
for the given media bus format". It doesn't seem to mention the current mode. But the
frame sizes reported should be filtered by the mbus code, and this patch misses that
if I read it correct.

But this situation when the mbus code depends on the mode (on the resolution in fact)...
Yes, if we read the pixels from a rectangle smaller than the active area, we can change
the bayer order by moving this "read-out" rectangle by one pixel along x, y, or both x
and y axes. But wouldn't it be better if we try to review the register setting for the
current modes so that the bayer order would be the same for all the modes?

Thanks,
Andrey

> Best regards,
> Tomasz
> 

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-subdev-enum-frame-size.html
