Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B101374C7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 18:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgAJR01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 12:26:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56014 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgAJR00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 12:26:26 -0500
Received: from [IPv6:2804:14c:482:1ce:9679:dca0:9712:6bd3] (unknown [IPv6:2804:14c:482:1ce:9679:dca0:9712:6bd3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF0BD293F5B;
        Fri, 10 Jan 2020 17:26:17 +0000 (GMT)
Subject: Re: [PATCH v4] media: vimc: Enable set resolution at the scaler src
 pad
To:     Pedro Terra Delboni <pirate@terraco.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
References: <20191229194214.4592-1-pirate@terraco.de>
 <5b0227ba-dd3d-abb9-073f-2b778310cf44@collabora.com>
 <b8a8da93-f36f-6401-75dc-f5cb66a0fa89@collabora.com>
 <CAHKDPP-waoonVmxJ4CMysmCPj50Bt+mtBiD9tvSPcv-=qXTKVA@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <f45fcab2-b3dd-94ec-4691-12000df1f76e@collabora.com>
Date:   Fri, 10 Jan 2020 14:26:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAHKDPP-waoonVmxJ4CMysmCPj50Bt+mtBiD9tvSPcv-=qXTKVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/10/20 3:21 PM, Pedro Terra Delboni wrote:
> Hello!
> 
> On Wed, Jan 1, 2020 at 7:10 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>>
>>
>> On 30.12.19 14:59, Helen Koike wrote:
>>> Hi,
>>>
>>> Thanks for the patch, just minor comments below.
>>>
>>> On 12/29/19 5:42 PM, Pedro Terra wrote:
>>>> Modify the scaler subdevice to accept setting the resolution of the source
>>>> pad (previously the source resolution would always be 3 times the sink for
>>>> both dimensions). Now any resolution can be set at src (even smaller ones)
>>>> and the sink video will be scaled to match it.
>>>>
>>>> Test example: With the vimc module up (using the default vimc topology)
>>>> media-ctl -d /dev/media0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>>>> media-ctl -d /dev/media0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>>> media-ctl -d /dev/media0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
>>>> media-ctl -d /dev/media0 -V '"Scaler":0[crop:(100,50)/400x150]'
>>>> media-ctl -d /dev/media0 -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
>>>> v4l2-ctl -d /dev/video2 -v width=300,height=700
>>>> v4l2-ctl -d /dev/video0 -v pixelformat=BA81
>>>> v4l2-ctl --stream-mmap --stream-count=10 -d /dev/video2 \
>>>>      --stream-to=test.raw
>>>> ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
>>>>      -video_size "300x700" test.raw
>>>>
>>>> Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>>>> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>>>> Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
>>>> Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
>>>> Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>
>>>>
>>>> ---
>>>>
>>>> Changes in V4:
>>>> * Rebased with media/master
>>>> * Scaling is now compatible with crop
>>>> * Updated test example at the commit message
>>>> * Add vimc prefix to the pad enumeration
>>>>
>>>> Changes in V3:
>>>> * Corrections suggested by Hans:
>>>>      - Default scaling factor is now 1 (we removed the define and
>>>>        set the source format equals the sink).
>>>>      - Removed SCA_COUNT (enum that represents the number of pads)
>>>>        as there always 2
>>>>      - Swapped the per byte pixel copy to memcpy.
>>>> * Corrections suggested by Dafna:
>>>>      - Removed from the documentation the old scaler parameter which
>>>>        isn't necessary anymore.
>>>> * Added a thank you note at the end of the email
>>>>
>>>> Changes in V2:
>>>> * Patch was not sent to media list mail for some reason (even though it
>>>> was on the Cc list), trying again.
>>>> * Updating documentation.
>>>>
>>>> Hello!
>>>> This code is the result of friends getting together with too much
>>>> coffee, sugar and beer trying to get started with some kernel coding.
>>>> Please, don't go easy on us! s2
>>>>
>>>> Running
>>>> /usr/local/bin/v4l2-compliance -m /dev/media0
>>>> Gave the following result:
>>>> v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
>>>> Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
>>>> ---
>>>>   Documentation/media/v4l-drivers/vimc.rst  |  21 +-
>>>>   drivers/media/platform/vimc/vimc-scaler.c | 248 +++++++---------------
>>>>   2 files changed, 87 insertions(+), 182 deletions(-)
>>>>
>>>> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
>>>> index 8f5d7f8d83bb..af04ebbd4fa1 100644
>>>> --- a/Documentation/media/v4l-drivers/vimc.rst
>>>> +++ b/Documentation/media/v4l-drivers/vimc.rst
>>>> @@ -61,9 +61,11 @@ vimc-debayer:
>>>>      * 1 Pad source
>>>>
>>>>   vimc-scaler:
>>>> -    Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
>>>> -        1920x1440 image. (this value can be configured, see at
>>>> -        `Module options`_).
>>>> +    Re-size the image to meet the source pad resolution. E.g.: if the sync pad
>>>> +is configured to 360x480 and the source to 1280x720, the image will be stretched
>>>> +to fit the source resolution. Works for any resolution within the vimc
>>>> +limitations (even shrinking the image if necessary).
>>>> +
>>>>      Exposes:
>>>>
>>>>      * 1 Pad sink
>>>> @@ -76,19 +78,6 @@ vimc-capture:
>>>>      * 1 Pad sink
>>>>      * 1 Pad source
>>>>
>>>> -
>>>> -Module options
>>>> ---------------
>>>> -
>>>> -Vimc has a module parameter to configure the driver.
>>>> -
>>>> -* ``sca_mult=<unsigned int>``
>>>> -
>>>> -        Image size multiplier factor to be used to multiply both width and
>>>> -        height, so the image size will be ``sca_mult^2`` bigger than the
>>>> -        original one. Currently, only supports scaling up (the default value
>>>> -        is 3).
>>>> -
>>>>   Source code documentation
>>>>   -------------------------
>>>>
>>>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>>>> index e2e551bc3ded..785009b7ac9e 100644
>>>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>>>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>>>> @@ -6,6 +6,7 @@
>>>>    */
>>>>
>>>>   #include <linux/moduleparam.h>
>>>> +#include <linux/string.h>
>>>>   #include <linux/vmalloc.h>
>>>>   #include <linux/v4l2-mediabus.h>
>>>>   #include <media/v4l2-rect.h>
>>>> @@ -13,11 +14,11 @@
>>>>
>>>>   #include "vimc-common.h"
>>>>
>>>> -static unsigned int sca_mult = 3;
>>>> -module_param(sca_mult, uint, 0000);
>>>> -MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>>> -
>>>> -#define MAX_ZOOM    8
>>>> +/* Pad identifier */
>>>> +enum vimc_sca_pad {
>>>> +    VIMC_SCA_SINK = 0,
>>>> +    VIMC_SCA_SRC = 1,
>>>> +};
>>>>
>>>>   #define VIMC_SCA_FMT_WIDTH_DEFAULT  640
>>>>   #define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
>>>> @@ -25,14 +26,11 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>>>   struct vimc_sca_device {
>>>>      struct vimc_ent_device ved;
>>>>      struct v4l2_subdev sd;
>>>> -    /* NOTE: the source fmt is the same as the sink
>>>> -     * with the width and hight multiplied by mult
>>>> -     */
>>>> -    struct v4l2_mbus_framefmt sink_fmt;
>>>>      struct v4l2_rect crop_rect;
>>>> +    /* Frame format for both sink and src pad */
>>>> +    struct v4l2_mbus_framefmt fmt[2];
>>>>      /* Values calculated when the stream starts */
>>>>      u8 *src_frame;
>>>> -    unsigned int src_line_size;
>>>>      unsigned int bpp;
>>>>      struct media_pad pads[2];
>>>>   };
>>>> @@ -90,17 +88,15 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>>>>      struct v4l2_rect *r;
>>>>      unsigned int i;
>>>>
>>>> -    mf = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> +    mf = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
>>>>      *mf = sink_fmt_default;
>>>>
>>>> -    r = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>> +    r = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
>>>>      *r = crop_rect_default;
>>>>
>>>>      for (i = 1; i < sd->entity.num_pads; i++) {
>>>>              mf = v4l2_subdev_get_try_format(sd, cfg, i);
>>>>              *mf = sink_fmt_default;
>>>> -            mf->width = mf->width * sca_mult;
>>>> -            mf->height = mf->height * sca_mult;
>>>>      }
>>>>
>>>>      return 0;
>>>> @@ -137,14 +133,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>>>>
>>>>      fse->min_width = VIMC_FRAME_MIN_WIDTH;
>>>>      fse->min_height = VIMC_FRAME_MIN_HEIGHT;
>>>> -
>>>> -    if (VIMC_IS_SINK(fse->pad)) {
>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH;
>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT;
>>>> -    } else {
>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH * MAX_ZOOM;
>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT * MAX_ZOOM;
>>>> -    }
>>>> +    fse->max_width = VIMC_FRAME_MAX_WIDTH;
>>>> +    fse->max_height = VIMC_FRAME_MAX_HEIGHT;
>>>>
>>>>      return 0;
>>>>   }
>>>> @@ -154,95 +144,73 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>>>>                          struct v4l2_subdev_format *format)
>>>>   {
>>>>      struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>>> -    struct v4l2_rect *crop_rect;
>>>>
>>>> -    /* Get the current sink format */
>>>> -    if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>>> -            format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>> -    } else {
>>>> -            format->format = vsca->sink_fmt;
>>>> -            crop_rect = &vsca->crop_rect;
>>>> -    }
>>>> -
>>>> -    /* Scale the frame size for the source pad */
>>>> -    if (VIMC_IS_SRC(format->pad)) {
>>>> -            format->format.width = crop_rect->width * sca_mult;
>>>> -            format->format.height = crop_rect->height * sca_mult;
>>>> -    }
>>>> +    if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>>>> +            format->format = *v4l2_subdev_get_try_format(sd, cfg,
>>>> +                                                         format->pad);
>>>> +    else
>>>> +            format->format = vsca->fmt[format->pad];
>>>>
>>>>      return 0;
>>>>   }
>>>>
>>>> -static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>>>> +static void vimc_sca_adjust_fmt(struct v4l2_mbus_framefmt *fmt[], __u32 pad)
>>>>   {
>>>> -    const struct vimc_pix_map *vpix;
>>>> +    if (pad == VIMC_SCA_SINK) {
>>>> +            const struct vimc_pix_map *vpix;
>>>>
>>>> -    /* Only accept code in the pix map table in non bayer format */
>>>> -    vpix = vimc_pix_map_by_code(fmt->code);
>>>> -    if (!vpix || vpix->bayer)
>>>> -            fmt->code = sink_fmt_default.code;
>>>> +            /* Only accept code in the pix map table in non bayer format */
>>>> +            vpix = vimc_pix_map_by_code(fmt[VIMC_SCA_SINK]->code);
>>>> +            if (!vpix || vpix->bayer)
>>>> +                    fmt[VIMC_SCA_SINK]->code = sink_fmt_default.code;
>>>> +            if (fmt[VIMC_SCA_SINK]->field == V4L2_FIELD_ANY)
>>>> +                    fmt[VIMC_SCA_SINK]->field = sink_fmt_default.field;
>>>>
>>>> -    fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>>>> +            vimc_colorimetry_clamp(fmt[VIMC_SCA_SINK]);
>>>> +    }
>>>> +
>>>> +    fmt[pad]->width = clamp_t(u32, fmt[pad]->width, VIMC_FRAME_MIN_WIDTH,
>>>>                           VIMC_FRAME_MAX_WIDTH) & ~1;
>>>
>>> Could you fix the alignment here?
>>> For some reason checkpatch doesn't catch this :(
>>>
>>>> -    fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
>>>> +    fmt[pad]->height = clamp_t(u32, fmt[pad]->height, VIMC_FRAME_MIN_HEIGHT,
>>>>                            VIMC_FRAME_MAX_HEIGHT) & ~1;
>>>
>>> Also here.
>>>
>>>>
>>>> -    if (fmt->field == V4L2_FIELD_ANY)
>>>> -            fmt->field = sink_fmt_default.field;
>>>> -
>>>> -    vimc_colorimetry_clamp(fmt);
>>>> +    /* Assure src pad attributes besides dimensions are the same as sink */
>>>> +    fmt[VIMC_SCA_SRC]->code = fmt[VIMC_SCA_SINK]->code;
>>>> +    fmt[VIMC_SCA_SRC]->field = fmt[VIMC_SCA_SINK]->field;
>>>> +    fmt[VIMC_SCA_SRC]->colorspace = fmt[VIMC_SCA_SINK]->colorspace;
>>>
>>> Ideally we should propagate all the other fields to src. Maybe save width and height to
>>> a tmp var, assing the whole sink fmt to src, and restore width and height.
>>>
>> Acctually according to the subdevices documentation, when changing the
>> sink format, the width and height of the src format should reset to the
>> same values:
>>
>> ""
>> -  Sub-devices that scale frames using variable scaling factors should
>>     reset the scale factors to default values when sink pads formats are
>>     modified. If the 1:1 scaling ratio is supported, this means that
>>     source pads formats should be reset to the sink pads formats.
>> ""
> 
> I have a small question: Should I worry about the crop? I believe that
> in the current
> implementation setting the sink does not necessarily reset the crop zone.
> Should we reset to the sink resolution or to the one determined by the crop?
> With that said, the way we implemented the scaller, setting a crop
> does not affect the
> source resolution (it retains the sink dimensions), should we change this too?

From the docs, it seems that the idea is to keep 1:1 scaling ration, so if you
have crop in the sink, then the source pad should have dimentions of the crop.

At least that is my understanding, and the docs should be updated to make it more
clear.

I would like to hear other people's opinions on this.

Helen

>>>
>>>
>>> With these changes:
>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>
>>> Thanks
>>> Helen
>>>
>>>
>>>>   }
>>>>
>>>>   static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>>>                          struct v4l2_subdev_pad_config *cfg,
>>>> -                        struct v4l2_subdev_format *fmt)
>>>> +                        struct v4l2_subdev_format *format)
>>>>   {
>>>>      struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>>> -    struct v4l2_mbus_framefmt *sink_fmt;
>>>> +    struct v4l2_mbus_framefmt *fmt[2];
>>>>      struct v4l2_rect *crop_rect;
>>>>
>>>> -    if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>> +    if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>>              /* Do not change the format while stream is on */
>>>>              if (vsca->src_frame)
>>>>                      return -EBUSY;
>>>>
>>>> -            sink_fmt = &vsca->sink_fmt;
>>>> +            fmt[VIMC_SCA_SINK] = &vsca->fmt[VIMC_SCA_SINK];
>>>> +            fmt[VIMC_SCA_SRC] = &vsca->fmt[VIMC_SCA_SRC];
>>>>              crop_rect = &vsca->crop_rect;
>>>>      } else {
>>>> -            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>> +            fmt[VIMC_SCA_SINK] = v4l2_subdev_get_try_format(sd, cfg,
>>>> +                                                            VIMC_SCA_SINK);
>>>> +            fmt[VIMC_SCA_SRC] = v4l2_subdev_get_try_format(sd, cfg,
>>>> +                                                           VIMC_SCA_SRC);
>>>> +            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
>>>>      }
>>>>
>>>> -    /*
>>>> -     * Do not change the format of the source pad,
>>>> -     * it is propagated from the sink
>>>> -     */
>>>> -    if (VIMC_IS_SRC(fmt->pad)) {
>>>> -            fmt->format = *sink_fmt;
>>>> -            fmt->format.width = crop_rect->width * sca_mult;
>>>> -            fmt->format.height = crop_rect->height * sca_mult;
>>>> -    } else {
>>>> -            /* Set the new format in the sink pad */
>>>> -            vimc_sca_adjust_sink_fmt(&fmt->format);
>>>> -
>>>> -            dev_dbg(vsca->ved.dev, "%s: sink format update: "
>>>> -                    "old:%dx%d (0x%x, %d, %d, %d, %d) "
>>>> -                    "new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
>>>> -                    /* old */
>>>> -                    sink_fmt->width, sink_fmt->height, sink_fmt->code,
>>>> -                    sink_fmt->colorspace, sink_fmt->quantization,
>>>> -                    sink_fmt->xfer_func, sink_fmt->ycbcr_enc,
>>>> -                    /* new */
>>>> -                    fmt->format.width, fmt->format.height, fmt->format.code,
>>>> -                    fmt->format.colorspace, fmt->format.quantization,
>>>> -                    fmt->format.xfer_func, fmt->format.ycbcr_enc);
>>>> -
>>>> -            *sink_fmt = fmt->format;
>>>> +    *fmt[format->pad] = format->format;
>>>> +    vimc_sca_adjust_fmt(fmt, format->pad);
>>>> +    format->format = *fmt[format->pad];
>>>>
>>>> +    if (format->pad == VIMC_SCA_SINK)
>>>>              /* Do the crop, but respect the current bounds */
>>>> -            vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
>>>> -    }
>>>> +            vimc_sca_adjust_sink_crop(crop_rect, fmt[VIMC_SCA_SINK]);
>>>>
>>>>      return 0;
>>>>   }
>>>> @@ -259,11 +227,11 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
>>>>              return -EINVAL;
>>>>
>>>>      if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>> -            sink_fmt = &vsca->sink_fmt;
>>>> +            sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
>>>>              crop_rect = &vsca->crop_rect;
>>>>      } else {
>>>> -            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>> +            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
>>>> +            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
>>>>      }
>>>>
>>>>      switch (sel->target) {
>>>> @@ -297,10 +265,10 @@ static int vimc_sca_set_selection(struct v4l2_subdev *sd,
>>>>                      return -EBUSY;
>>>>
>>>>              crop_rect = &vsca->crop_rect;
>>>> -            sink_fmt = &vsca->sink_fmt;
>>>> +            sink_fmt = &vsca->fmt[VIMC_SCA_SINK];
>>>>      } else {
>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>> -            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>> +            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
>>>> +            sink_fmt = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
>>>>      }
>>>>
>>>>      switch (sel->target) {
>>>> @@ -338,16 +306,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>>>>                      return 0;
>>>>
>>>>              /* Save the bytes per pixel of the sink */
>>>> -            vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
>>>> +            vpix = vimc_pix_map_by_code(vsca->fmt[VIMC_SCA_SINK].code);
>>>>              vsca->bpp = vpix->bpp;
>>>>
>>>> -            /* Calculate the width in bytes of the src frame */
>>>> -            vsca->src_line_size = vsca->crop_rect.width *
>>>> -                                  sca_mult * vsca->bpp;
>>>> -
>>>>              /* Calculate the frame size of the source pad */
>>>> -            frame_size = vsca->src_line_size * vsca->crop_rect.height *
>>>> -                         sca_mult;
>>>> +            frame_size = vsca->fmt[VIMC_SCA_SRC].width
>>>> +                         * vsca->fmt[VIMC_SCA_SRC].height * vsca->bpp;
>>>>
>>>>              /* Allocate the frame buffer. Use vmalloc to be able to
>>>>               * allocate a large amount of memory
>>>> @@ -376,77 +340,28 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
>>>>      .video = &vimc_sca_video_ops,
>>>>   };
>>>>
>>>> -static void vimc_sca_fill_pix(u8 *const ptr,
>>>> -                          const u8 *const pixel,
>>>> -                          const unsigned int bpp)
>>>> -{
>>>> -    unsigned int i;
>>>> -
>>>> -    /* copy the pixel to the pointer */
>>>> -    for (i = 0; i < bpp; i++)
>>>> -            ptr[i] = pixel[i];
>>>> -}
>>>> -
>>>> -static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>>> -                           unsigned int lin, unsigned int col,
>>>> -                           const u8 *const sink_frame)
>>>> -{
>>>> -    const struct v4l2_rect crop_rect = vsca->crop_rect;
>>>> -    unsigned int i, j, index;
>>>> -    const u8 *pixel;
>>>> -
>>>> -    /* Point to the pixel value in position (lin, col) in the sink frame */
>>>> -    index = VIMC_FRAME_INDEX(lin, col,
>>>> -                             vsca->sink_fmt.width,
>>>> -                             vsca->bpp);
>>>> -    pixel = &sink_frame[index];
>>>> -
>>>> -    dev_dbg(vsca->ved.dev,
>>>> -            "sca: %s: --- scale_pix sink pos %dx%d, index %d ---\n",
>>>> -            vsca->sd.name, lin, col, index);
>>>> -
>>>> -    /* point to the place we are going to put the first pixel
>>>> -     * in the scaled src frame
>>>> -     */
>>>> -    lin -= crop_rect.top;
>>>> -    col -= crop_rect.left;
>>>> -    index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
>>>> -                             crop_rect.width * sca_mult, vsca->bpp);
>>>> -
>>>> -    dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
>>>> -            vsca->sd.name, lin * sca_mult, col * sca_mult, index);
>>>> -
>>>> -    /* Repeat this pixel mult times */
>>>> -    for (i = 0; i < sca_mult; i++) {
>>>> -            /* Iterate through each beginning of a
>>>> -             * pixel repetition in a line
>>>> -             */
>>>> -            for (j = 0; j < sca_mult * vsca->bpp; j += vsca->bpp) {
>>>> -                    dev_dbg(vsca->ved.dev,
>>>> -                            "sca: %s: sca: scale_pix src pos %d\n",
>>>> -                            vsca->sd.name, index + j);
>>>> -
>>>> -                    /* copy the pixel to the position index + j */
>>>> -                    vimc_sca_fill_pix(&vsca->src_frame[index + j],
>>>> -                                      pixel, vsca->bpp);
>>>> -            }
>>>> -
>>>> -            /* move the index to the next line */
>>>> -            index += vsca->src_line_size;
>>>> -    }
>>>> -}
>>>> -
>>>>   static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>>>>                                  const u8 *const sink_frame)
>>>>   {
>>>> -    const struct v4l2_rect r = vsca->crop_rect;
>>>> -    unsigned int i, j;
>>>> -
>>>> -    /* Scale each pixel from the original sink frame */
>>>> -    /* TODO: implement scale down, only scale up is supported for now */
>>>> -    for (i = r.top; i < r.top + r.height; i++)
>>>> -            for (j = r.left; j < r.left + r.width; j++)
>>>> -                    vimc_sca_scale_pix(vsca, i, j, sink_frame);
>>>> +    const struct v4l2_mbus_framefmt *src_fmt = &vsca->fmt[VIMC_SCA_SRC];
>>>> +    const struct v4l2_rect *r = &vsca->crop_rect;
>>>> +    unsigned int s_width = vsca->fmt[VIMC_SCA_SINK].width;
>> better replace 's_width' with 'snk_width' (s can also indicate 'source')
>>
>>>> +    unsigned int lin, col, index;
>> maybe replace 'lin' and 'col' with 'src_lin' 'src_col' and move 'index'
>> to inside the loop
>>>> +    u8 *walker = vsca->src_frame;
>>>> +
>>>> +    /* Set each pixel at the src_frame to its sink_frame equivalent */
>>>> +    for (lin = 0; lin < src_fmt->height; lin++) {
>>>> +            for (col = 0; col < src_fmt->width; col++) {
>>>> +                    unsigned int s_lin, s_col;
>> the 's_' prefix is confusing, better replace with 'snk_'
>>>> +
>>>> +                    s_lin = (lin * r->height) / src_fmt->height + r->top;
>>>> +                    s_col = (col * r->width) / src_fmt->width + r->left;
>>>> +                    index = VIMC_FRAME_INDEX(s_lin, s_col, s_width,
>>>> +                                             vsca->bpp);
>>>> +                    memcpy(walker, &sink_frame[index], vsca->bpp);
>>>> +                    walker += vsca->bpp;
>>>> +            }
>>>> +    }
>>>>   }
>>>>
>>>>   static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
>>>> @@ -498,8 +413,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>>>              return NULL;
>>>>
>>>>      /* Initialize ved and sd */
>>>> -    vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
>>>> -    vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
>>>> +    vsca->pads[VIMC_SCA_SINK].flags = MEDIA_PAD_FL_SINK;
>>>> +    vsca->pads[VIMC_SCA_SRC].flags = MEDIA_PAD_FL_SOURCE;
>>>>
>>>>      ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
>>>>                                 vcfg_name,
>>>> @@ -515,7 +430,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>>>      vsca->ved.dev = &vimc->pdev.dev;
>>>>
>>>>      /* Initialize the frame format */
>>>> -    vsca->sink_fmt = sink_fmt_default;
>>>> +    vsca->fmt[VIMC_SCA_SINK] = sink_fmt_default;
>>>> +    vsca->fmt[VIMC_SCA_SRC] = sink_fmt_default;
>>>>
>>>>      /* Initialize the crop selection */
>>>>      vsca->crop_rect = crop_rect_default;
>>>>
>>
>> Thanks,
>> Dafna
> 
> Thank you!
> 
