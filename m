Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F29713C69E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 15:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgAOOvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 09:51:12 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58725 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbgAOOvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 09:51:12 -0500
Received: from [IPv6:2001:420:44c1:2577:18d8:d5d6:4408:6200]
 ([IPv6:2001:420:44c1:2577:18d8:d5d6:4408:6200])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rk0eiEwOhT6sRrk0iiaemI; Wed, 15 Jan 2020 15:51:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579099869; bh=NO5vu+soaXQE7Wso9SZijdneoBnI+zay+KgTCj9phAM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NKe/OarGU7rxEjhrp8adeoH7VW1w08O7FermPso9zF+iPtYKjovR+IrQfw1dY8kXy
         zf1uuVVd3PRFcj8q0pYbvECn7fV42bwPr3tUnzAIxglijBB926suEnThZctCq9Ncss
         +L9bXKKnV0mBrO7SUA+BYxHXE/T5e2NLteLut6PszrB6AE9+yO7TcdTUD6bthziePc
         q1rf4+ASPsdzR6HG8CTR46NnSBuZ1AzgCREkuM2KhHaSpdyl8waOgPEJStf2BW24mg
         DRymNvXbDNpHdLjPT4aRvxY61pF78/Dri0A4kBPMZgMoic1pn2hOelrS6heFRpqr0G
         yfdZstQToKWXg==
Subject: Re: [PATCH v4] media: vimc: Enable set resolution at the scaler src
 pad
To:     Helen Koike <helen.koike@collabora.com>,
        Pedro Terra Delboni <pirate@terraco.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
References: <20191229194214.4592-1-pirate@terraco.de>
 <5b0227ba-dd3d-abb9-073f-2b778310cf44@collabora.com>
 <b8a8da93-f36f-6401-75dc-f5cb66a0fa89@collabora.com>
 <CAHKDPP-waoonVmxJ4CMysmCPj50Bt+mtBiD9tvSPcv-=qXTKVA@mail.gmail.com>
 <f45fcab2-b3dd-94ec-4691-12000df1f76e@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <16b7cf85-f4a6-d1a8-f917-ddd4f8d9a9ce@xs4all.nl>
Date:   Wed, 15 Jan 2020 15:51:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f45fcab2-b3dd-94ec-4691-12000df1f76e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ5E89UFrOJhhxOnudL7j+kBVYlS4s671ixqkCht/epsi/TNzHfQHh4Mv4QX77idCJA9rg8zK0/DngJq6bypBMLTKiLNR22oKCiF4CLVS9lGexEuvXB6
 l1jh8XGxv3dGzEa3skQwyvaHNhTkKRlZfuEulFgvpQIdR4TCiTp1i0hlMoiEC2N5wEmgefXKvWOfUu5WDcEfiYfAHJ7PdP+ZKpO/3jNLJL/5ZT2P1yzvtFqc
 gjfxzQNt1Q3IsyCgx/4dIxS7l3QKQnTHaAoAJB/FKf7xsCKqbLSVY5If4eqceKGhMjCsK2Ce2ul7/00WOD/pXhlBaxSIGEs7O9EyXCyl44hHlbE8ztbNqwQC
 Ag06GFXMjXFbgRvuWxSGie9kgvw8q2yYkXOeycWXfbc9FCGs1TYbmAEQ/BFF/0xqAb/v1UhfhevP/NCR2x1+p5vniCnj6Ky04fXbx2qGNJicXtwZX47b4qLp
 +rFxbaEmkCyc1LKHKIo7lXn1K29y0etg4QEurBXmkI8y5R84Ukh1fKF5QOpuMxso/nRDmZ6889DyT55LkAGl5LygluwlR2psrIn/XvjzsHKWl+0UKioC8rSl
 3s0/PjzwLXRV28/vAUVw2WC8HL6n9UI4KYGUDrj86n8ToCn5K3Zdt1DWQm0YnRyr8Q8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/10/20 6:26 PM, Helen Koike wrote:
> 
> 
> On 1/10/20 3:21 PM, Pedro Terra Delboni wrote:
>> Hello!
>>
>> On Wed, Jan 1, 2020 at 7:10 AM Dafna Hirschfeld
>> <dafna.hirschfeld@collabora.com> wrote:
>>>
>>> Hi,
>>>
>>>
>>> On 30.12.19 14:59, Helen Koike wrote:
>>>> Hi,
>>>>
>>>> Thanks for the patch, just minor comments below.
>>>>
>>>> On 12/29/19 5:42 PM, Pedro Terra wrote:
>>>>> Modify the scaler subdevice to accept setting the resolution of the source
>>>>> pad (previously the source resolution would always be 3 times the sink for
>>>>> both dimensions). Now any resolution can be set at src (even smaller ones)
>>>>> and the sink video will be scaled to match it.
>>>>>
>>>>> Test example: With the vimc module up (using the default vimc topology)
>>>>> media-ctl -d /dev/media0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>>>>> media-ctl -d /dev/media0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>>>> media-ctl -d /dev/media0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
>>>>> media-ctl -d /dev/media0 -V '"Scaler":0[crop:(100,50)/400x150]'
>>>>> media-ctl -d /dev/media0 -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
>>>>> v4l2-ctl -d /dev/video2 -v width=300,height=700
>>>>> v4l2-ctl -d /dev/video0 -v pixelformat=BA81
>>>>> v4l2-ctl --stream-mmap --stream-count=10 -d /dev/video2 \
>>>>>      --stream-to=test.raw
>>>>> ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
>>>>>      -video_size "300x700" test.raw
>>>>>
>>>>> Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>>>>> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>>>>> Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
>>>>> Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
>>>>> Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in V4:
>>>>> * Rebased with media/master
>>>>> * Scaling is now compatible with crop
>>>>> * Updated test example at the commit message
>>>>> * Add vimc prefix to the pad enumeration
>>>>>
>>>>> Changes in V3:
>>>>> * Corrections suggested by Hans:
>>>>>      - Default scaling factor is now 1 (we removed the define and
>>>>>        set the source format equals the sink).
>>>>>      - Removed SCA_COUNT (enum that represents the number of pads)
>>>>>        as there always 2
>>>>>      - Swapped the per byte pixel copy to memcpy.
>>>>> * Corrections suggested by Dafna:
>>>>>      - Removed from the documentation the old scaler parameter which
>>>>>        isn't necessary anymore.
>>>>> * Added a thank you note at the end of the email
>>>>>
>>>>> Changes in V2:
>>>>> * Patch was not sent to media list mail for some reason (even though it
>>>>> was on the Cc list), trying again.
>>>>> * Updating documentation.
>>>>>
>>>>> Hello!
>>>>> This code is the result of friends getting together with too much
>>>>> coffee, sugar and beer trying to get started with some kernel coding.
>>>>> Please, don't go easy on us! s2
>>>>>
>>>>> Running
>>>>> /usr/local/bin/v4l2-compliance -m /dev/media0
>>>>> Gave the following result:
>>>>> v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
>>>>> Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
>>>>> ---
>>>>>   Documentation/media/v4l-drivers/vimc.rst  |  21 +-
>>>>>   drivers/media/platform/vimc/vimc-scaler.c | 248 +++++++---------------
>>>>>   2 files changed, 87 insertions(+), 182 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
>>>>> index 8f5d7f8d83bb..af04ebbd4fa1 100644
>>>>> --- a/Documentation/media/v4l-drivers/vimc.rst
>>>>> +++ b/Documentation/media/v4l-drivers/vimc.rst
>>>>> @@ -61,9 +61,11 @@ vimc-debayer:
>>>>>      * 1 Pad source
>>>>>
>>>>>   vimc-scaler:
>>>>> -    Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
>>>>> -        1920x1440 image. (this value can be configured, see at
>>>>> -        `Module options`_).
>>>>> +    Re-size the image to meet the source pad resolution. E.g.: if the sync pad
>>>>> +is configured to 360x480 and the source to 1280x720, the image will be stretched
>>>>> +to fit the source resolution. Works for any resolution within the vimc
>>>>> +limitations (even shrinking the image if necessary).
>>>>> +
>>>>>      Exposes:
>>>>>
>>>>>      * 1 Pad sink
>>>>> @@ -76,19 +78,6 @@ vimc-capture:
>>>>>      * 1 Pad sink
>>>>>      * 1 Pad source
>>>>>
>>>>> -
>>>>> -Module options
>>>>> ---------------
>>>>> -
>>>>> -Vimc has a module parameter to configure the driver.
>>>>> -
>>>>> -* ``sca_mult=<unsigned int>``
>>>>> -
>>>>> -        Image size multiplier factor to be used to multiply both width and
>>>>> -        height, so the image size will be ``sca_mult^2`` bigger than the
>>>>> -        original one. Currently, only supports scaling up (the default value
>>>>> -        is 3).
>>>>> -
>>>>>   Source code documentation
>>>>>   -------------------------
>>>>>
>>>>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>>>>> index e2e551bc3ded..785009b7ac9e 100644
>>>>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>>>>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>>>>> @@ -6,6 +6,7 @@
>>>>>    */
>>>>>
>>>>>   #include <linux/moduleparam.h>
>>>>> +#include <linux/string.h>
>>>>>   #include <linux/vmalloc.h>
>>>>>   #include <linux/v4l2-mediabus.h>
>>>>>   #include <media/v4l2-rect.h>
>>>>> @@ -13,11 +14,11 @@
>>>>>
>>>>>   #include "vimc-common.h"
>>>>>
>>>>> -static unsigned int sca_mult = 3;
>>>>> -module_param(sca_mult, uint, 0000);
>>>>> -MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>>>> -
>>>>> -#define MAX_ZOOM    8
>>>>> +/* Pad identifier */
>>>>> +enum vimc_sca_pad {
>>>>> +    VIMC_SCA_SINK = 0,
>>>>> +    VIMC_SCA_SRC = 1,
>>>>> +};
>>>>>
>>>>>   #define VIMC_SCA_FMT_WIDTH_DEFAULT  640
>>>>>   #define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
>>>>> @@ -25,14 +26,11 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>>>>   struct vimc_sca_device {
>>>>>      struct vimc_ent_device ved;
>>>>>      struct v4l2_subdev sd;
>>>>> -    /* NOTE: the source fmt is the same as the sink
>>>>> -     * with the width and hight multiplied by mult
>>>>> -     */
>>>>> -    struct v4l2_mbus_framefmt sink_fmt;
>>>>>      struct v4l2_rect crop_rect;
>>>>> +    /* Frame format for both sink and src pad */
>>>>> +    struct v4l2_mbus_framefmt fmt[2];
>>>>>      /* Values calculated when the stream starts */
>>>>>      u8 *src_frame;
>>>>> -    unsigned int src_line_size;
>>>>>      unsigned int bpp;
>>>>>      struct media_pad pads[2];
>>>>>   };
>>>>> @@ -90,17 +88,15 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>>>>>      struct v4l2_rect *r;
>>>>>      unsigned int i;
>>>>>
>>>>> -    mf = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>>> +    mf = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
>>>>>      *mf = sink_fmt_default;
>>>>>
>>>>> -    r = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>>> +    r = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
>>>>>      *r = crop_rect_default;
>>>>>
>>>>>      for (i = 1; i < sd->entity.num_pads; i++) {
>>>>>              mf = v4l2_subdev_get_try_format(sd, cfg, i);
>>>>>              *mf = sink_fmt_default;
>>>>> -            mf->width = mf->width * sca_mult;
>>>>> -            mf->height = mf->height * sca_mult;
>>>>>      }
>>>>>
>>>>>      return 0;
>>>>> @@ -137,14 +133,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>>>>>
>>>>>      fse->min_width = VIMC_FRAME_MIN_WIDTH;
>>>>>      fse->min_height = VIMC_FRAME_MIN_HEIGHT;
>>>>> -
>>>>> -    if (VIMC_IS_SINK(fse->pad)) {
>>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH;
>>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT;
>>>>> -    } else {
>>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH * MAX_ZOOM;
>>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT * MAX_ZOOM;
>>>>> -    }
>>>>> +    fse->max_width = VIMC_FRAME_MAX_WIDTH;
>>>>> +    fse->max_height = VIMC_FRAME_MAX_HEIGHT;
>>>>>
>>>>>      return 0;
>>>>>   }
>>>>> @@ -154,95 +144,73 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>>>>>                          struct v4l2_subdev_format *format)
>>>>>   {
>>>>>      struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>>>> -    struct v4l2_rect *crop_rect;
>>>>>
>>>>> -    /* Get the current sink format */
>>>>> -    if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>>>> -            format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
>>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>>> -    } else {
>>>>> -            format->format = vsca->sink_fmt;
>>>>> -            crop_rect = &vsca->crop_rect;
>>>>> -    }
>>>>> -
>>>>> -    /* Scale the frame size for the source pad */
>>>>> -    if (VIMC_IS_SRC(format->pad)) {
>>>>> -            format->format.width = crop_rect->width * sca_mult;
>>>>> -            format->format.height = crop_rect->height * sca_mult;
>>>>> -    }
>>>>> +    if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>>>>> +            format->format = *v4l2_subdev_get_try_format(sd, cfg,
>>>>> +                                                         format->pad);
>>>>> +    else
>>>>> +            format->format = vsca->fmt[format->pad];
>>>>>
>>>>>      return 0;
>>>>>   }
>>>>>
>>>>> -static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>>>>> +static void vimc_sca_adjust_fmt(struct v4l2_mbus_framefmt *fmt[], __u32 pad)
>>>>>   {
>>>>> -    const struct vimc_pix_map *vpix;
>>>>> +    if (pad == VIMC_SCA_SINK) {
>>>>> +            const struct vimc_pix_map *vpix;
>>>>>
>>>>> -    /* Only accept code in the pix map table in non bayer format */
>>>>> -    vpix = vimc_pix_map_by_code(fmt->code);
>>>>> -    if (!vpix || vpix->bayer)
>>>>> -            fmt->code = sink_fmt_default.code;
>>>>> +            /* Only accept code in the pix map table in non bayer format */
>>>>> +            vpix = vimc_pix_map_by_code(fmt[VIMC_SCA_SINK]->code);
>>>>> +            if (!vpix || vpix->bayer)
>>>>> +                    fmt[VIMC_SCA_SINK]->code = sink_fmt_default.code;
>>>>> +            if (fmt[VIMC_SCA_SINK]->field == V4L2_FIELD_ANY)
>>>>> +                    fmt[VIMC_SCA_SINK]->field = sink_fmt_default.field;
>>>>>
>>>>> -    fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>>>>> +            vimc_colorimetry_clamp(fmt[VIMC_SCA_SINK]);
>>>>> +    }
>>>>> +
>>>>> +    fmt[pad]->width = clamp_t(u32, fmt[pad]->width, VIMC_FRAME_MIN_WIDTH,
>>>>>                           VIMC_FRAME_MAX_WIDTH) & ~1;
>>>>
>>>> Could you fix the alignment here?
>>>> For some reason checkpatch doesn't catch this :(
>>>>
>>>>> -    fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
>>>>> +    fmt[pad]->height = clamp_t(u32, fmt[pad]->height, VIMC_FRAME_MIN_HEIGHT,
>>>>>                            VIMC_FRAME_MAX_HEIGHT) & ~1;
>>>>
>>>> Also here.
>>>>
>>>>>
>>>>> -    if (fmt->field == V4L2_FIELD_ANY)
>>>>> -            fmt->field = sink_fmt_default.field;
>>>>> -
>>>>> -    vimc_colorimetry_clamp(fmt);
>>>>> +    /* Assure src pad attributes besides dimensions are the same as sink */
>>>>> +    fmt[VIMC_SCA_SRC]->code = fmt[VIMC_SCA_SINK]->code;
>>>>> +    fmt[VIMC_SCA_SRC]->field = fmt[VIMC_SCA_SINK]->field;
>>>>> +    fmt[VIMC_SCA_SRC]->colorspace = fmt[VIMC_SCA_SINK]->colorspace;
>>>>
>>>> Ideally we should propagate all the other fields to src. Maybe save width and height to
>>>> a tmp var, assing the whole sink fmt to src, and restore width and height.
>>>>
>>> Acctually according to the subdevices documentation, when changing the
>>> sink format, the width and height of the src format should reset to the
>>> same values:
>>>
>>> ""
>>> -  Sub-devices that scale frames using variable scaling factors should
>>>     reset the scale factors to default values when sink pads formats are
>>>     modified. If the 1:1 scaling ratio is supported, this means that
>>>     source pads formats should be reset to the sink pads formats.
>>> ""
>>
>> I have a small question: Should I worry about the crop? I believe that
>> in the current
>> implementation setting the sink does not necessarily reset the crop zone.
>> Should we reset to the sink resolution or to the one determined by the crop?
>> With that said, the way we implemented the scaller, setting a crop
>> does not affect the
>> source resolution (it retains the sink dimensions), should we change this too?
> 
> From the docs, it seems that the idea is to keep 1:1 scaling ration, so if you
> have crop in the sink, then the source pad should have dimentions of the crop.

Correct.

> 
> At least that is my understanding, and the docs should be updated to make it more
> clear.

Patches are welcome :-)

> 
> I would like to hear other people's opinions on this.

I agree with you, this is my understanding as well.

Regards,

	Hans
