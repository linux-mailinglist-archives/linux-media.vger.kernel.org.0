Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF5A1B17F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 23:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgDTVEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 17:04:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53516 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgDTVEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 17:04:33 -0400
Received: from [IPv6:2804:431:e7cc:a5f6:9375:2a8f:ddf7:24fe] (unknown [IPv6:2804:431:e7cc:a5f6:9375:2a8f:ddf7:24fe])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A675226D79C;
        Mon, 20 Apr 2020 22:04:29 +0100 (BST)
Subject: Re: [PATCH v2 3/3] media: vimc: deb: Add support for {RGB,BGR,GBR}888
 bus formats on source pad
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-4-nfraprado@protonmail.com>
 <b5bc6ab8-274a-adc7-9d86-a91a1efb8805@linuxfoundation.org>
 <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
 <20200420210135.bmca5qw5ilaavuo6@ArchWay.local>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <64a28b0a-f4fc-2623-ac42-d7ebec52ceba@collabora.com>
Date:   Mon, 20 Apr 2020 18:04:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420210135.bmca5qw5ilaavuo6@ArchWay.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/20/20 6:01 PM, Nícolas F. R. A. Prado wrote:
> Hi Helen,
> 
> thanks for the review.
> 
> Some comments below.
> 
> On Mon, Mar 30, 2020 at 04:43:53PM -0300, Helen Koike wrote:
>>
>> Hello,
>>
>> On 3/26/20 7:06 PM, Shuah Khan wrote:
>>> On 3/26/20 3:47 PM, Nícolas F. R. A. Prado wrote:
>>>> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
>>>> the source pad of debayer subdevices.
>>>>
>>>> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
>>>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Change commit message to reflect v2 changes
>>>> - Rename variables
>>>> - Fix array formatting
>>>> - Add vimc_deb_is_src_code_valid function
>>>> - Add other BGR888 and RGB888 formats to debayer source pad supported
>>>>    formats
>>>>
>>>>   drivers/media/platform/vimc/vimc-debayer.c | 61 +++++++++++++++++-----
>>>>   1 file changed, 49 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>>>> index baf6bf9f65b5..33a9bea770bc 100644
>>>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>>>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>>>> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>>>       .colorspace = V4L2_COLORSPACE_DEFAULT,
>>>>   };
>>>>   +static const u32 vimc_deb_src_mbus_codes[] = {
>>>> +    MEDIA_BUS_FMT_GBR888_1X24,
>>>> +    MEDIA_BUS_FMT_BGR888_1X24,
>>>> +    MEDIA_BUS_FMT_BGR888_3X8,
>>>> +    MEDIA_BUS_FMT_RGB888_1X24,
>>>> +    MEDIA_BUS_FMT_RGB888_2X12_BE,
>>>> +    MEDIA_BUS_FMT_RGB888_2X12_LE,
>>>> +    MEDIA_BUS_FMT_RGB888_3X8,
>>>> +    MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>> +    MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>>> +    MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>>> +};
>>>> +
>>>>   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>>       {
>>>>           .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>>>> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pix_map_by_code(u32 code)
>>>>       return NULL;
>>>>   }
>>>>   +static int vimc_deb_is_src_code_invalid(u32 code)
>>>> +{
>>>> +    unsigned int i;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(vimc_deb_src_mbus_codes); i++)
>>>> +        if (vimc_deb_src_mbus_codes[i] == code)
>>>> +            return 0;
>>>> +
>>>> +    return -EINVAL;
>>>> +}
>>
>> The naming is a bit confusing, since it checks if it is invalid, but returns a negative number if so.
>>
>> How about renaming to vimc_deb_src_code_is_valid ?
> 
> I also don't like that the function is called 'is_invalid', but I gave it that
> name because I think it actually is less confusing when calling.
> For example, later in this patch I do:
> 
>     } else if (vimc_deb_is_src_code_invalid(fse->code)) {
>         return -EINVAL;
> 
> Which to me becomes very clear.
> 
> Since the error values evaluate to True, the other alternative that I
> see is to call it 'is_valid', but return 0 when invalid and 1 when valid.
> But then we no longer return the -EINVAL value, which I think makes the function
> less clear.
> 
> What do you think?

How about make the function to return bool instead of int?

Regards,
Helen

> 
> Thank you,
> Nícolas
> 
>>
>>>> +
>>>>   static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
>>>>                    struct v4l2_subdev_pad_config *cfg)
>>>>   {
>>>> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>>>>                      struct v4l2_subdev_pad_config *cfg,
>>>>                      struct v4l2_subdev_mbus_code_enum *code)
>>>>   {
>>>> -    /* We only support one format for source pads */
>>>>       if (VIMC_IS_SRC(code->pad)) {
>>>> -        struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>>> -
>>>> -        if (code->index)
>>>> +        if (code->index >= ARRAY_SIZE(vimc_deb_src_mbus_codes))
>>>>               return -EINVAL;
>>>>   -        code->code = vdeb->src_code;
>>>> +        code->code = vimc_deb_src_mbus_codes[code->index];
>>>>       } else {
>>>>           if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>>>>               return -EINVAL;
>>>> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>>>                       struct v4l2_subdev_pad_config *cfg,
>>>>                       struct v4l2_subdev_frame_size_enum *fse)
>>>>   {
>>>> -    struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>>> -
>>>>       if (fse->index)
>>>>           return -EINVAL;
>>>>   @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>>>>             if (!vpix)
>>>>               return -EINVAL;
>>>> -    } else if (fse->code != vdeb->src_code) {
>>>> +    } else if (vimc_deb_is_src_code_invalid(fse->code)) {
>>>>           return -EINVAL;
>>>>       }
>>>>   @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>>   {
>>>>       struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>>>>       struct v4l2_mbus_framefmt *sink_fmt;
>>>> +    u32 *src_code;
>>>>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>>           /* Do not change the format while stream is on */
>>>> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>>               return -EBUSY;
>>>>             sink_fmt = &vdeb->sink_fmt;
>>>> +        src_code = &vdeb->src_code;
>>>>       } else {
>>>>           sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> +        src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
>>>>       }
>>>>         /*
>>>> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>>>        * it is propagated from the sink
>>>>        */
>>>>       if (VIMC_IS_SRC(fmt->pad)) {
>>>> +        u32 code = fmt->format.code;
>>>> +
>>>>           fmt->format = *sink_fmt;
>>>> -        /* TODO: Add support for other formats */
>>>> -        fmt->format.code = vdeb->src_code;
>>>> +
>>>> +        if (!vimc_deb_is_src_code_invalid(code))
>>>> +            *src_code = code;
>>>> +
>>>> +        fmt->format.code = *src_code;
>>>>       } else {
>>>>           /* Set the new format in the sink pad */
>>>>           vimc_deb_adjust_sink_fmt(&fmt->format);
>>>> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
>>>>                             unsigned int col,
>>>>                             unsigned int rgb[3])
>>>
>>> Change this to pass a pointer and size.
>>
>> Hi Shuah,
>>
>> Modifying vimc_deb_set_rgb_mbus_fmt_rgb888_1x24() is not part of this patch, or do you mean another part of the code?
>>
>> Thanks for reviewing
>> Helen
>>
>>>
>>>>   {
>>>> +    const struct vimc_pix_map *vpix;
>>>>       unsigned int i, index;
>>>>   +    vpix = vimc_pix_map_by_code(vdeb->src_code);
>>>>       index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>> -    for (i = 0; i < 3; i++)
>>>> -        vdeb->src_frame[index + i] = rgb[i];
>>>> +    for (i = 0; i < 3; i++) {
>>>> +        switch (vpix->pixelformat) {
>>>> +        case V4L2_PIX_FMT_RGB24:
>>>> +            vdeb->src_frame[index + i] = rgb[i];
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_BGR24:
>>>> +            vdeb->src_frame[index + i] = rgb[2-i];
>>>> +            break;
>>>> +        }
>>>> +    }
>>>>   }
>>>>     static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>>>>
>>>
>>> thanks,
>>> -- Shuah
> 
