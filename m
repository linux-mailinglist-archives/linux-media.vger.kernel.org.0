Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A23DB9D0
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 15:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238991AbhG3Nzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 09:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhG3Nzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 09:55:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3988DC06175F;
        Fri, 30 Jul 2021 06:55:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3FAE89B;
        Fri, 30 Jul 2021 15:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627653338;
        bh=AA9Ihdd9daRF8vdlqQ1mX5UI2mKTEusqLe2zmInmgD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WagvGa6RjMC6ZvWEwjn4osh46XmyqRisVqC64Kohkw2+hjAB0iPKCR3Xbku/ETjU8
         za8wudBsm94rXeFDdx8sXXSNzhZ8dlX7nLyGCPr2NlaLjo38yIpcbJqwVt/1kBTapP
         iFwJpd5IT52pFhtWDLDRSDanBOoadLbEj9Yq2Btg=
Date:   Fri, 30 Jul 2021 16:55:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Pedro Terra Delboni <pirate@terraco.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>
Subject: Re: [PATCH v4] media: vimc: Enable set resolution at the scaler src
 pad
Message-ID: <YQQE0RV27YGs192c@pendragon.ideasonboard.com>
References: <20191229194214.4592-1-pirate@terraco.de>
 <5b0227ba-dd3d-abb9-073f-2b778310cf44@collabora.com>
 <b8a8da93-f36f-6401-75dc-f5cb66a0fa89@collabora.com>
 <CAHKDPP-waoonVmxJ4CMysmCPj50Bt+mtBiD9tvSPcv-=qXTKVA@mail.gmail.com>
 <f45fcab2-b3dd-94ec-4691-12000df1f76e@collabora.com>
 <16b7cf85-f4a6-d1a8-f917-ddd4f8d9a9ce@xs4all.nl>
 <CAHKDPP8qRN32jsJjtt92pohTLH_wxpvnEpZcdBjdYAv253CQaA@mail.gmail.com>
 <99372b94-241c-f0d2-b1db-c4fa3d423018@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99372b94-241c-f0d2-b1db-c4fa3d423018@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Reviving an old thread.

On Tue, Jan 21, 2020 at 10:42:10AM -0300, Helen Koike wrote:
> On 1/17/20 7:56 PM, Pedro Terra Delboni wrote:
> > Sorry to keep bumping this thread, but while doing some testing I got
> > confused with the following:
> > The documentation mentions that the scaler should be reset whenever
> > the sink format is set.
> > Does this mean that I should reset it independently if the sink set
> > changes the dimensions?
> > For example: if I change the pixels from RGB to another format, should
> > that also reset the source dimensions?
> 
> Confusing indeed.
> 
> My understanding is:
> If you make any changes in the sink pad that would affect the scaling
> ratio, then you should adjust the source pad to make a scaling ration
> 1:1.
> So, if you only change the pixel format, it shouldn't reset the scaling
> ratio.

It's not clearly described in the documentation, but I would have done
the opposite, resetting the scaler to 1:1 every time S_FMT is called on
the sink pad, regardless of what is being changed.

> > Another thing that got me confused was:
> > At by the functions names, setting the crop dimensions is not
> > considered changing the pad format, it's considered setting a selection.
> > Should I also update the set_selection function to propagate the
> > changes to the source pad?
> 
> Following my understanding above, yes.

I disagree here too :-) The crop rectangle on the source pad is used to
control digital zoom, during streaming. This requires the output size to
stay the same when the crop rectangle size changes.

Pedro, would you consider submitting a v5 ? Or should I take over ?

> > Otherwise, by changing the crop (without changing the sink format)
> > will cause the scaling to behave in the same way it would if we didn't
> > propagate the sink properties to the source.
> > 
> > So:
> > Should I check if the set_fmt is actually changing the sink dimensions
> > in order to propagate them to the source?
> 
> Following my understanding above, yes.
> 
> > Should I also propagate the dimensions when setting the sink crop?
> 
> Following my understanding above, yes.
> 
> I wonder now how other drivers are doing this.
> 
> At least, I'm sure the driver rkisp1 is not doing the right thing
> and needs to be corrected.
> 
> > Sorry for the long email!
> > Thanks for the attention that you've all been giving us so far!
> > 
> > On Wed, Jan 15, 2020 at 11:51 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 1/10/20 6:26 PM, Helen Koike wrote:
> >>>
> >>>
> >>> On 1/10/20 3:21 PM, Pedro Terra Delboni wrote:
> >>>> Hello!
> >>>>
> >>>> On Wed, Jan 1, 2020 at 7:10 AM Dafna Hirschfeld
> >>>> <dafna.hirschfeld@collabora.com> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>>
> >>>>> On 30.12.19 14:59, Helen Koike wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Thanks for the patch, just minor comments below.
> >>>>>>
> >>>>>> On 12/29/19 5:42 PM, Pedro Terra wrote:
> >>>>>>> Modify the scaler subdevice to accept setting the resolution of the source
> >>>>>>> pad (previously the source resolution would always be 3 times the sink for
> >>>>>>> both dimensions). Now any resolution can be set at src (even smaller ones)
> >>>>>>> and the sink video will be scaled to match it.
> >>>>>>>
> >>>>>>> Test example: With the vimc module up (using the default vimc topology)
> >>>>>>> media-ctl -d /dev/media0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> >>>>>>> media-ctl -d /dev/media0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> >>>>>>> media-ctl -d /dev/media0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
> >>>>>>> media-ctl -d /dev/media0 -V '"Scaler":0[crop:(100,50)/400x150]'
> >>>>>>> media-ctl -d /dev/media0 -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
> >>>>>>> v4l2-ctl -d /dev/video2 -v width=300,height=700
> >>>>>>> v4l2-ctl -d /dev/video0 -v pixelformat=BA81
> >>>>>>> v4l2-ctl --stream-mmap --stream-count=10 -d /dev/video2 \
> >>>>>>>      --stream-to=test.raw
> >>>>>>> ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
> >>>>>>>      -video_size "300x700" test.raw
> >>>>>>>
> >>>>>>> Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> >>>>>>> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> >>>>>>> Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> >>>>>>> Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> >>>>>>> Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>
> >>>>>>>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> Changes in V4:
> >>>>>>> * Rebased with media/master
> >>>>>>> * Scaling is now compatible with crop
> >>>>>>> * Updated test example at the commit message
> >>>>>>> * Add vimc prefix to the pad enumeration
> >>>>>>>
> >>>>>>> Changes in V3:
> >>>>>>> * Corrections suggested by Hans:
> >>>>>>>      - Default scaling factor is now 1 (we removed the define and
> >>>>>>>        set the source format equals the sink).
> >>>>>>>      - Removed SCA_COUNT (enum that represents the number of pads)
> >>>>>>>        as there always 2
> >>>>>>>      - Swapped the per byte pixel copy to memcpy.
> >>>>>>> * Corrections suggested by Dafna:
> >>>>>>>      - Removed from the documentation the old scaler parameter which
> >>>>>>>        isn't necessary anymore.
> >>>>>>> * Added a thank you note at the end of the email
> >>>>>>>
> >>>>>>> Changes in V2:
> >>>>>>> * Patch was not sent to media list mail for some reason (even though it
> >>>>>>> was on the Cc list), trying again.
> >>>>>>> * Updating documentation.
> >>>>>>>
> >>>>>>> Hello!
> >>>>>>> This code is the result of friends getting together with too much
> >>>>>>> coffee, sugar and beer trying to get started with some kernel coding.
> >>>>>>> Please, don't go easy on us! s2
> >>>>>>>
> >>>>>>> Running
> >>>>>>> /usr/local/bin/v4l2-compliance -m /dev/media0
> >>>>>>> Gave the following result:
> >>>>>>> v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
> >>>>>>> Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
> >>>>>>> ---
> >>>>>>>   Documentation/media/v4l-drivers/vimc.rst  |  21 +-
> >>>>>>>   drivers/media/platform/vimc/vimc-scaler.c | 248 +++++++---------------
> >>>>>>>   2 files changed, 87 insertions(+), 182 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> >>>>>>> index 8f5d7f8d83bb..af04ebbd4fa1 100644
> >>>>>>> --- a/Documentation/media/v4l-drivers/vimc.rst
> >>>>>>> +++ b/Documentation/media/v4l-drivers/vimc.rst
> >>>>>>> @@ -61,9 +61,11 @@ vimc-debayer:
> >>>>>>>      * 1 Pad source
> >>>>>>>
> >>>>>>>   vimc-scaler:
> >>>>>>> -    Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
> >>>>>>> -        1920x1440 image. (this value can be configured, see at
> >>>>>>> -        `Module options`_).
> >>>>>>> +    Re-size the image to meet the source pad resolution. E.g.: if the sync pad
> >>>>>>> +is configured to 360x480 and the source to 1280x720, the image will be stretched
> >>>>>>> +to fit the source resolution. Works for any resolution within the vimc
> >>>>>>> +limitations (even shrinking the image if necessary).
> >>>>>>> +
> >>>>>>>      Exposes:
> >>>>>>>
> >>>>>>>      * 1 Pad sink
> >>>>>>> @@ -76,19 +78,6 @@ vimc-capture:
> >>>>>>>      * 1 Pad sink
> >>>>>>>      * 1 Pad source
> >>>>>>>
> >>>>>>> -
> >>>>>>> -Module options
> >>>>>>> ---------------
> >>>>>>> -
> >>>>>>> -Vimc has a module parameter to configure the driver.
> >>>>>>> -
> >>>>>>> -* ``sca_mult=<unsigned int>``
> >>>>>>> -
> >>>>>>> -        Image size multiplier factor to be used to multiply both width and
> >>>>>>> -        height, so the image size will be ``sca_mult^2`` bigger than the
> >>>>>>> -        original one. Currently, only supports scaling up (the default value
> >>>>>>> -        is 3).
> >>>>>>> -
> >>>>>>>   Source code documentation
> >>>>>>>   -------------------------
> >>>>>>>
> >>>>>>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> >>>>>>> index e2e551bc3ded..785009b7ac9e 100644
> >>>>>>> --- a/drivers/media/platform/vimc/vimc-scaler.c
> >>>>>>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> >>>>>>> @@ -6,6 +6,7 @@
> >>>>>>>    */
> >>>>>>>
> >>>>>>>   #include <linux/moduleparam.h>
> >>>>>>> +#include <linux/string.h>
> >>>>>>>   #include <linux/vmalloc.h>
> >>>>>>>   #include <linux/v4l2-mediabus.h>
> >>>>>>>   #include <media/v4l2-rect.h>
> >>>>>>> @@ -13,11 +14,11 @@
> >>>>>>>
> >>>>>>>   #include "vimc-common.h"
> >>>>>>>
> >>>>>>> -static unsigned int sca_mult = 3;
> >>>>>>> -module_param(sca_mult, uint, 0000);
> >>>>>>> -MODULE_PARM_DESC(sca_mult, " the image size multiplier");
> >>>>>>> -
> >>>>>>> -#define MAX_ZOOM    8
> >>>>>>> +/* Pad identifier */
> >>>>>>> +enum vimc_sca_pad {
> >>>>>>> +    VIMC_SCA_SINK = 0,
> >>>>>>> +    VIMC_SCA_SRC = 1,
> >>>>>>> +};
> >>>>>>>
> >>>>>>>   #define VIMC_SCA_FMT_WIDTH_DEFAULT  640
> >>>>>>>   #define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
> >>>>>>> @@ -25,14 +26,11 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
> >>>>>>>   struct vimc_sca_device {
> >>>>>>>      struct vimc_ent_device ved;
> >>>>>>>      struct v4l2_subdev sd;
> >>>>>>> -    /* NOTE: the source fmt is the same as the sink
> >>>>>>> -     * with the width and hight multiplied by mult
> >>>>>>> -     */
> >>>>>>> -    struct v4l2_mbus_framefmt sink_fmt;
> >>>>>>>      struct v4l2_rect crop_rect;
> >>>>>>> +    /* Frame format for both sink and src pad */
> >>>>>>> +    struct v4l2_mbus_framefmt fmt[2];
> >>>>>>>      /* Values calculated when the stream starts */
> >>>>>>>      u8 *src_frame;
> >>>>>>> -    unsigned int src_line_size;
> >>>>>>>      unsigned int bpp;
> >>>>>>>      struct media_pad pads[2];
> >>>>>>>   };
> >>>>>>> @@ -90,17 +88,15 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
> >>>>>>>      struct v4l2_rect *r;
> >>>>>>>      unsigned int i;
> >>>>>>>
> >>>>>>> -    mf = v4l2_subdev_get_try_format(sd, cfg, 0);
> >>>>>>> +    mf = v4l2_subdev_get_try_format(sd, cfg, VIMC_SCA_SINK);
> >>>>>>>      *mf = sink_fmt_default;
> >>>>>>>
> >>>>>>> -    r = v4l2_subdev_get_try_crop(sd, cfg, 0);
> >>>>>>> +    r = v4l2_subdev_get_try_crop(sd, cfg, VIMC_SCA_SINK);
> >>>>>>>      *r = crop_rect_default;
> >>>>>>>
> >>>>>>>      for (i = 1; i < sd->entity.num_pads; i++) {
> >>>>>>>              mf = v4l2_subdev_get_try_format(sd, cfg, i);
> >>>>>>>              *mf = sink_fmt_default;
> >>>>>>> -            mf->width = mf->width * sca_mult;
> >>>>>>> -            mf->height = mf->height * sca_mult;
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      return 0;
> >>>>>>> @@ -137,14 +133,8 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
> >>>>>>>
> >>>>>>>      fse->min_width = VIMC_FRAME_MIN_WIDTH;
> >>>>>>>      fse->min_height = VIMC_FRAME_MIN_HEIGHT;
> >>>>>>> -
> >>>>>>> -    if (VIMC_IS_SINK(fse->pad)) {
> >>>>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH;
> >>>>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT;
> >>>>>>> -    } else {
> >>>>>>> -            fse->max_width = VIMC_FRAME_MAX_WIDTH * MAX_ZOOM;
> >>>>>>> -            fse->max_height = VIMC_FRAME_MAX_HEIGHT * MAX_ZOOM;
> >>>>>>> -    }
> >>>>>>> +    fse->max_width = VIMC_FRAME_MAX_WIDTH;
> >>>>>>> +    fse->max_height = VIMC_FRAME_MAX_HEIGHT;
> >>>>>>>
> >>>>>>>      return 0;
> >>>>>>>   }
> >>>>>>> @@ -154,95 +144,73 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
> >>>>>>>                          struct v4l2_subdev_format *format)
> >>>>>>>   {
> >>>>>>>      struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
> >>>>>>> -    struct v4l2_rect *crop_rect;
> >>>>>>>
> >>>>>>> -    /* Get the current sink format */
> >>>>>>> -    if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> >>>>>>> -            format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
> >>>>>>> -            crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
> >>>>>>> -    } else {
> >>>>>>> -            format->format = vsca->sink_fmt;
> >>>>>>> -            crop_rect = &vsca->crop_rect;
> >>>>>>> -    }
> >>>>>>> -
> >>>>>>> -    /* Scale the frame size for the source pad */
> >>>>>>> -    if (VIMC_IS_SRC(format->pad)) {
> >>>>>>> -            format->format.width = crop_rect->width * sca_mult;
> >>>>>>> -            format->format.height = crop_rect->height * sca_mult;
> >>>>>>> -    }
> >>>>>>> +    if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> >>>>>>> +            format->format = *v4l2_subdev_get_try_format(sd, cfg,
> >>>>>>> +                                                         format->pad);
> >>>>>>> +    else
> >>>>>>> +            format->format = vsca->fmt[format->pad];
> >>>>>>>
> >>>>>>>      return 0;
> >>>>>>>   }
> >>>>>>>
> >>>>>>> -static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
> >>>>>>> +static void vimc_sca_adjust_fmt(struct v4l2_mbus_framefmt *fmt[], __u32 pad)
> >>>>>>>   {
> >>>>>>> -    const struct vimc_pix_map *vpix;
> >>>>>>> +    if (pad == VIMC_SCA_SINK) {
> >>>>>>> +            const struct vimc_pix_map *vpix;
> >>>>>>>
> >>>>>>> -    /* Only accept code in the pix map table in non bayer format */
> >>>>>>> -    vpix = vimc_pix_map_by_code(fmt->code);
> >>>>>>> -    if (!vpix || vpix->bayer)
> >>>>>>> -            fmt->code = sink_fmt_default.code;
> >>>>>>> +            /* Only accept code in the pix map table in non bayer format */
> >>>>>>> +            vpix = vimc_pix_map_by_code(fmt[VIMC_SCA_SINK]->code);
> >>>>>>> +            if (!vpix || vpix->bayer)
> >>>>>>> +                    fmt[VIMC_SCA_SINK]->code = sink_fmt_default.code;
> >>>>>>> +            if (fmt[VIMC_SCA_SINK]->field == V4L2_FIELD_ANY)
> >>>>>>> +                    fmt[VIMC_SCA_SINK]->field = sink_fmt_default.field;
> >>>>>>>
> >>>>>>> -    fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
> >>>>>>> +            vimc_colorimetry_clamp(fmt[VIMC_SCA_SINK]);
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    fmt[pad]->width = clamp_t(u32, fmt[pad]->width, VIMC_FRAME_MIN_WIDTH,
> >>>>>>>                           VIMC_FRAME_MAX_WIDTH) & ~1;
> >>>>>>
> >>>>>> Could you fix the alignment here?
> >>>>>> For some reason checkpatch doesn't catch this :(
> >>>>>>
> >>>>>>> -    fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
> >>>>>>> +    fmt[pad]->height = clamp_t(u32, fmt[pad]->height, VIMC_FRAME_MIN_HEIGHT,
> >>>>>>>                            VIMC_FRAME_MAX_HEIGHT) & ~1;
> >>>>>>
> >>>>>> Also here.
> >>>>>>
> >>>>>>>
> >>>>>>> -    if (fmt->field == V4L2_FIELD_ANY)
> >>>>>>> -            fmt->field = sink_fmt_default.field;
> >>>>>>> -
> >>>>>>> -    vimc_colorimetry_clamp(fmt);
> >>>>>>> +    /* Assure src pad attributes besides dimensions are the same as sink */
> >>>>>>> +    fmt[VIMC_SCA_SRC]->code = fmt[VIMC_SCA_SINK]->code;
> >>>>>>> +    fmt[VIMC_SCA_SRC]->field = fmt[VIMC_SCA_SINK]->field;
> >>>>>>> +    fmt[VIMC_SCA_SRC]->colorspace = fmt[VIMC_SCA_SINK]->colorspace;
> >>>>>>
> >>>>>> Ideally we should propagate all the other fields to src. Maybe save width and height to
> >>>>>> a tmp var, assing the whole sink fmt to src, and restore width and height.
> >>>>>>
> >>>>> Acctually according to the subdevices documentation, when changing the
> >>>>> sink format, the width and height of the src format should reset to the
> >>>>> same values:
> >>>>>
> >>>>> ""
> >>>>> -  Sub-devices that scale frames using variable scaling factors should
> >>>>>     reset the scale factors to default values when sink pads formats are
> >>>>>     modified. If the 1:1 scaling ratio is supported, this means that
> >>>>>     source pads formats should be reset to the sink pads formats.
> >>>>> ""
> >>>>
> >>>> I have a small question: Should I worry about the crop? I believe that
> >>>> in the current
> >>>> implementation setting the sink does not necessarily reset the crop zone.
> >>>> Should we reset to the sink resolution or to the one determined by the crop?
> >>>> With that said, the way we implemented the scaller, setting a crop
> >>>> does not affect the
> >>>> source resolution (it retains the sink dimensions), should we change this too?
> >>>
> >>> From the docs, it seems that the idea is to keep 1:1 scaling ration, so if you
> >>> have crop in the sink, then the source pad should have dimentions of the crop.
> >>
> >> Correct.
> >>
> >>>
> >>> At least that is my understanding, and the docs should be updated to make it more
> >>> clear.
> >>
> >> Patches are welcome :-)
> >>
> >>>
> >>> I would like to hear other people's opinions on this.
> >>
> >> I agree with you, this is my understanding as well.

-- 
Regards,

Laurent Pinchart
