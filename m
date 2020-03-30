Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0EF31984C6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgC3Tq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:46:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40998 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbgC3Tq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:46:26 -0400
Received: by mail-io1-f66.google.com with SMTP id b12so2942669ion.8
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2020 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cbEXIHVwR9L5bubI1IDtzdA6dYbKrE9rM1bkfmUxK/E=;
        b=QtJ04bQbfpzYhQgZRhiM0uDiljjstX90G27lxC6ic2FEFBPd538evo329rInZrQsYx
         qlmrfivoUgNuh3L0dM5A1o3aa3xPU6xkcGfD/oTFs6m9zWoXiy0jyS8bqPLLIqIs8OuD
         cqbBfBrA0aATvLFcIQHIPG09g+0l25BPMiRiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cbEXIHVwR9L5bubI1IDtzdA6dYbKrE9rM1bkfmUxK/E=;
        b=Z0K3dOW/kRpLSe957bFP0eF4sOqTSMD2YesJo7WvIKsfI1fE2J6cfHwoZ4OwHURkse
         5UOiVxjYLfXe9xN1lqom9KO3HgCT2CqsZr1iKo9TKST4nBPkBwRmPz9IriPeQabv+z28
         NIGO4aKjhM1v32ZtZB4RYQp5saTmDnz4JtRGaB/l5gFMaA0M5Z97SGFcQN+cm+MoGIwG
         rXh2NBNEsQCRhERbe0htONVV9PRevnX8FeUGDIV6emh3EAtghY7xzDsmGxlQU50D0WPF
         noJb7hiSt/CG9ybkM0/LUmFosolpkPaQq29E8T7DIKkEiXNg8j2b2xrRdUmq0B3LDqi7
         FVzg==
X-Gm-Message-State: ANhLgQ0zHgDY25i0veeyuuABeEI48mv06yKj27xa7i5Xqqw+k+ASkLe/
        jCCThlJwGzoh9JqUwrumFMbnsw==
X-Google-Smtp-Source: ADFU+vv/EfAIPFR3h9XD0MuIMIhXM1k3jexi/KjQy6Hw3+ZHmcGTexiriqlREX02lES8sAIWk2kRIQ==
X-Received: by 2002:a02:774a:: with SMTP id g71mr11559711jac.68.1585597583342;
        Mon, 30 Mar 2020 12:46:23 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id m71sm5173197ilb.67.2020.03.30.12.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 12:46:22 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] media: vimc: deb: Add support for {RGB,BGR,GBR}888
 bus formats on source pad
To:     Helen Koike <helen.koike@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-4-nfraprado@protonmail.com>
 <b5bc6ab8-274a-adc7-9d86-a91a1efb8805@linuxfoundation.org>
 <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <daccd8d8-8132-9aef-0a19-5804c562a843@linuxfoundation.org>
Date:   Mon, 30 Mar 2020 13:46:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/30/20 1:43 PM, Helen Koike wrote:
> Hello,
> 
> On 3/26/20 7:06 PM, Shuah Khan wrote:
>> On 3/26/20 3:47 PM, Nícolas F. R. A. Prado wrote:
>>> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
>>> the source pad of debayer subdevices.
>>>
>>> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
>>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
>>> ---
>>>
>>> Changes in v2:
>>> - Change commit message to reflect v2 changes
>>> - Rename variables
>>> - Fix array formatting
>>> - Add vimc_deb_is_src_code_valid function
>>> - Add other BGR888 and RGB888 formats to debayer source pad supported
>>>     formats
>>>
>>>    drivers/media/platform/vimc/vimc-debayer.c | 61 +++++++++++++++++-----
>>>    1 file changed, 49 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>>> index baf6bf9f65b5..33a9bea770bc 100644
>>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>>> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>>        .colorspace = V4L2_COLORSPACE_DEFAULT,
>>>    };
>>>    +static const u32 vimc_deb_src_mbus_codes[] = {
>>> +    MEDIA_BUS_FMT_GBR888_1X24,
>>> +    MEDIA_BUS_FMT_BGR888_1X24,
>>> +    MEDIA_BUS_FMT_BGR888_3X8,
>>> +    MEDIA_BUS_FMT_RGB888_1X24,
>>> +    MEDIA_BUS_FMT_RGB888_2X12_BE,
>>> +    MEDIA_BUS_FMT_RGB888_2X12_LE,
>>> +    MEDIA_BUS_FMT_RGB888_3X8,
>>> +    MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>> +    MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>> +    MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>> +};
>>> +
>>>    static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>        {
>>>            .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>>> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pix_map_by_code(u32 code)
>>>        return NULL;
>>>    }
>>>    +static int vimc_deb_is_src_code_invalid(u32 code)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(vimc_deb_src_mbus_codes); i++)
>>> +        if (vimc_deb_src_mbus_codes[i] == code)
>>> +            return 0;
>>> +
>>> +    return -EINVAL;
>>> +}
> 
> The naming is a bit confusing, since it checks if it is invalid, but returns a negative number if so.
> 
> How about renaming to vimc_deb_src_code_is_valid ?
> 
>>> +
>>>    static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
>>>                     struct v4l2_subdev_pad_config *cfg)
>>>    {
>>> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>>>                       struct v4l2_subdev_pad_config *cfg,
>>>                       struct v4l2_subdev_mbus_code_enum *code)
>>>    {
>>> -    /* We only support one format for source pads */
>>>        if (VIMC_IS_SRC(code->pad)) {
>>> -        struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>> -
>>> -        if (code->index)
>>> +        if (code->index >= ARRAY_SIZE(vimc_deb_src_mbus_codes))
>>>                return -EINVAL;
>>>    -        code->code = vdeb->src_code;
>>> +        code->code = vimc_deb_src_mbus_codes[code->index];
>>>        } else {
>>>            if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>>>                return -EINVAL;
>>> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>>                        struct v4l2_subdev_pad_config *cfg,
>>>                        struct v4l2_subdev_frame_size_enum *fse)
>>>    {
>>> -    struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>> -
>>>        if (fse->index)
>>>            return -EINVAL;
>>>    @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>>              if (!vpix)
>>>                return -EINVAL;
>>> -    } else if (fse->code != vdeb->src_code) {
>>> +    } else if (vimc_deb_is_src_code_invalid(fse->code)) {
>>>            return -EINVAL;
>>>        }
>>>    @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>    {
>>>        struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>>        struct v4l2_mbus_framefmt *sink_fmt;
>>> +    u32 *src_code;
>>>          if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>            /* Do not change the format while stream is on */
>>> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>                return -EBUSY;
>>>              sink_fmt = &vdeb->sink_fmt;
>>> +        src_code = &vdeb->src_code;
>>>        } else {
>>>            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +        src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
>>>        }
>>>          /*
>>> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>         * it is propagated from the sink
>>>         */
>>>        if (VIMC_IS_SRC(fmt->pad)) {
>>> +        u32 code = fmt->format.code;
>>> +
>>>            fmt->format = *sink_fmt;
>>> -        /* TODO: Add support for other formats */
>>> -        fmt->format.code = vdeb->src_code;
>>> +
>>> +        if (!vimc_deb_is_src_code_invalid(code))
>>> +            *src_code = code;
>>> +
>>> +        fmt->format.code = *src_code;
>>>        } else {
>>>            /* Set the new format in the sink pad */
>>>            vimc_deb_adjust_sink_fmt(&fmt->format);
>>> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
>>>                              unsigned int col,
>>>                              unsigned int rgb[3])
>>
>> Change this to pass a pointer and size.
> 
> Hi Shuah,
> 
> Modifying vimc_deb_set_rgb_mbus_fmt_rgb888_1x24() is not part of this patch, or do you mean another part of the code?
> 

I know it isn't part of this patch. However, this could use improvment
and pass pointer and size.

Can be handled as a separate patch.

thanks,
-- Shuah

