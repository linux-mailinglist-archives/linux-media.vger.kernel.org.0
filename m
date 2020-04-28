Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D311BBD83
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgD1MZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:25:33 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38058 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgD1MZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:25:33 -0400
Received: by mail-qt1-f193.google.com with SMTP id i68so17043950qtb.5;
        Tue, 28 Apr 2020 05:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zeUXn8O3NhvQC+1Ea0EFYL4fqcL5svckmOzVYxv7r/c=;
        b=O5+CL/+jg3Hyo5YZhUFPVoc8szQkbS5fOiU5CNxRxmQ4ZgUznW/tb6mUnmcEYU30qC
         F+KIJaEr76WOJtoUP5erSHkQJ/yJ7r4g0AwRPzcMR5Q/n2U03oG5iZe5hPBO3xJiH+hX
         d0KsybQ8XEn6m8ZORkOg6l4wEFU/+fEgUZvAxmLwa4LcKRn1UuAxh2MaeJrg+sc0Gga1
         5GvdlhrxCmvVFRfd9+RKFjJ/fRCoiTZhkTECPCQOyDy/8di8FhSb4z6O2mWEmDbZxIB9
         k2DggElO5U5fK9xWIFFmL54YikbJFlGjIyIpwLXAJ6fTF9dV+8hFBrb1mfaHbvPJXqhc
         JvDQ==
X-Gm-Message-State: AGi0PuZ6UmF1VeeDKzRn9HaIUcbK5S/NIq7784STA6XlE4XeoermoZe8
        8Noo6Ge8uAL+SKKSjplVdvA=
X-Google-Smtp-Source: APiQypInrWvY8tExKEie/oPSMJcFFaaLSgWigzq8NLmo4v0zRji9Fd7m63eDYg1QNOxutQGm+YRYQA==
X-Received: by 2002:ac8:2d94:: with SMTP id p20mr27330087qta.121.1588076731545;
        Tue, 28 Apr 2020 05:25:31 -0700 (PDT)
Received: from ?IPv6:2804:431:e7cc:dff4:7411:8bdd:69e5:f5d8? ([2804:431:e7cc:dff4:7411:8bdd:69e5:f5d8])
        by smtp.gmail.com with ESMTPSA id h13sm11727380qti.32.2020.04.28.05.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 05:25:30 -0700 (PDT)
Subject: Re: [Lkcamp] [PATCH v3 3/3] media: vimc: deb: Add support for {RGB,
 BGR, GBR}888 bus formats on source pad
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        lkcamp@lists.libreplanetbr.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200427230234.3114565-4-nfraprado@protonmail.com>
 <1fcbe67e-db71-7841-6165-e62b74d82994@collabora.com>
From:   Helen Koike <helen@koikeco.de>
Message-ID: <cd585b72-067f-88d6-7ec6-30044101db38@koikeco.de>
Date:   Tue, 28 Apr 2020 09:25:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1fcbe67e-db71-7841-6165-e62b74d82994@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 4/28/20 4:46 AM, Dafna Hirschfeld wrote:
> hi,
> Thanks for the patches!
> 
> On 28.04.20 01:03, Nícolas F. R. A. Prado wrote:
>> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
>> the source pad of debayer subdevices.
>>
>> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
>> ---
>>
>> Changes in v3:
>> - Rename vimc_deb_is_src_code_invalid() to vimc_deb_src_code_is_valid()
>> - Change vimc_deb_src_code_is_valid() to return bool
>>
>> Changes in v2:
>> - Change commit message to reflect v2 changes
>> - Rename variables
>> - Fix array formatting
>> - Add vimc_deb_is_src_code_valid function
>> - Add other BGR888 and RGB888 formats to debayer source pad supported
>>    formats
>>
>>   .../media/test-drivers/vimc/vimc-debayer.c    | 61 +++++++++++++++----
>>   1 file changed, 49 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>> index d10aee9f84c4..7e87706d417e 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>       .colorspace = V4L2_COLORSPACE_DEFAULT,
>>   };
>>   +static const u32 vimc_deb_src_mbus_codes[] = {
>> +    MEDIA_BUS_FMT_GBR888_1X24,
>> +    MEDIA_BUS_FMT_BGR888_1X24,
>> +    MEDIA_BUS_FMT_BGR888_3X8,
>> +    MEDIA_BUS_FMT_RGB888_1X24,
>> +    MEDIA_BUS_FMT_RGB888_2X12_BE,
>> +    MEDIA_BUS_FMT_RGB888_2X12_LE,
>> +    MEDIA_BUS_FMT_RGB888_3X8,
>> +    MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>> +    MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>> +    MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>> +};
>> +
>>   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>       {
>>           .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pix_map_by_code(u32 code)
>>       return NULL;
>>   }
>>   +static bool vimc_deb_src_code_is_valid(u32 code)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(vimc_deb_src_mbus_codes); i++)
>> +        if (vimc_deb_src_mbus_codes[i] == code)
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>>   static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
>>                    struct v4l2_subdev_pad_config *cfg)
>>   {
>> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>>                      struct v4l2_subdev_pad_config *cfg,
>>                      struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> -    /* We only support one format for source pads */
>>       if (VIMC_IS_SRC(code->pad)) {
>> -        struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>> -
>> -        if (code->index)
>> +        if (code->index >= ARRAY_SIZE(vimc_deb_src_mbus_codes))
>>               return -EINVAL;
>>   -        code->code = vdeb->src_code;
>> +        code->code = vimc_deb_src_mbus_codes[code->index];
>>       } else {
>>           if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>>               return -EINVAL;
>> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>                       struct v4l2_subdev_pad_config *cfg,
>>                       struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -    struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>> -
>>       if (fse->index)
>>           return -EINVAL;
>>   @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>             if (!vpix)
>>               return -EINVAL;
>> -    } else if (fse->code != vdeb->src_code) {
>> +    } else if (!vimc_deb_src_code_is_valid(fse->code)) {
>>           return -EINVAL;
>>       }
>>   @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>   {
>>       struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>       struct v4l2_mbus_framefmt *sink_fmt;
>> +    u32 *src_code;
>>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>           /* Do not change the format while stream is on */
>> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>               return -EBUSY;
>>             sink_fmt = &vdeb->sink_fmt;
>> +        src_code = &vdeb->src_code;
>>       } else {
>>           sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>> +        src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
>>       }
>>         /*
>> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>        * it is propagated from the sink
>>        */
>>       if (VIMC_IS_SRC(fmt->pad)) {
>> +        u32 code = fmt->format.code;
>> +
>>           fmt->format = *sink_fmt;
>> -        /* TODO: Add support for other formats */
>> -        fmt->format.code = vdeb->src_code;
>> +
>> +        if (vimc_deb_src_code_is_valid(code))
>> +            *src_code = code;
>> +
>> +        fmt->format.code = *src_code;
>>       } else {
>>           /* Set the new format in the sink pad */
>>           vimc_deb_adjust_sink_fmt(&fmt->format);
>> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
> I guess the name of the function should now change to vimc_deb_set_rgb_mbus_fmt ?
> Or better vimc_deb_process_rgb_frame.
> Also, it seems that it is a assigned as a callback so that each src_fmt have a different callback
> but you already did it with a switch case. So maybe you can add a patch to call it directly

Agreed that it should be renamed. Removing the callback could be done later (up to you Nícolas).

With the rename, and with or without the callback removal:
Acked-by: Helen Koike <helen.koike@collabora.com>

> 
> Thanks,
> Dafna
> 
>>                             unsigned int col,
>>                             unsigned int rgb[3])
>>   {
>> +    const struct vimc_pix_map *vpix;
>>       unsigned int i, index;
>>   +    vpix = vimc_pix_map_by_code(vdeb->src_code);
>>       index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>> -    for (i = 0; i < 3; i++)
>> -        vdeb->src_frame[index + i] = rgb[i];
>> +    for (i = 0; i < 3; i++) {
>> +        switch (vpix->pixelformat) {
>> +        case V4L2_PIX_FMT_RGB24:
>> +            vdeb->src_frame[index + i] = rgb[i];
>> +            break;
>> +        case V4L2_PIX_FMT_BGR24:
>> +            vdeb->src_frame[index + i] = rgb[2-i];
>> +            break;
>> +        }
>> +    }
>>   }
>>     static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>>
> 
> _______________________________________________
> Lkcamp mailing list
> Lkcamp@lists.libreplanetbr.org
> https://lists.libreplanetbr.org/mailman/listinfo/lkcamp
