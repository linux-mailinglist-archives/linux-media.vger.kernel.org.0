Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159B11A982F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895117AbgDOJPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:15:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54274 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635972AbgDOJPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:15:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E4F352A1BA4
Subject: Re: [PATCH v4] media: vimc: get pixformat info from v4l2_format_info
To:     Carlos Eduardo Climaco Barbosa <barbosa.carlos.ec@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <20200412205916.3333547-1-barbosa.carlos.ec@gmail.com>
 <00452e47-15b6-14e6-0c48-7846f9da542e@collabora.com>
 <CALBj8qeo_1d09LbRu+gqpXjXQrFkr7Gq0JBbK6UXwnLdDprVYg@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <348e5daa-bdbe-b288-5770-af5eab1034b0@collabora.com>
Date:   Wed, 15 Apr 2020 11:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALBj8qeo_1d09LbRu+gqpXjXQrFkr7Gq0JBbK6UXwnLdDprVYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 14.04.20 16:03, Carlos Eduardo Climaco Barbosa wrote:
> On Mon, Apr 13, 2020 at 10:24 AM Dafna Hirschfeld <dafna.hirschfeld@collabora.com <mailto:dafna.hirschfeld@collabora.com>> wrote:
> 
>     Hi,
> 
>     Thanks for tha patch!
> 
>     On 12.04.20 22:59, Carlos E. C. Barbosa wrote:
>      > From: "Carlos E.C. Barbosa" <barbosa.carlos.ec@gmail.com <mailto:barbosa.carlos.ec@gmail.com>>
>      >
>      > There is overlapping code over two distinct lists. This repurposes
>      > vimc_pix_map for mapping formats and remaps the calls to the matching
>      > v4l2_format_info.
>      >
>      > Signed-off-by: Carlos E. C. Barbosa <barbosa.carlos.ec@gmail.com <mailto:barbosa.carlos.ec@gmail.com>>
>      >
>      > ---
>      >
>      > Changes in v2:
>      > As advised by Helen Koike and Hans Verkuil, the const qualifiers are
>      > not
>      > removed, the bayer flag is kept and the unnecessary changes are not
>      > made.
>      >
>      > Changes in v3:
>      > Change declaration order of variables and some minor style changes.
>      >
>      > Changes in v4:
>      > Unused variables were removed.
>      >
>      > v4l2-compliance -m /dev/media0 output:
>      > https://pastebin.com/F98792eW
>      > ---
>      >   drivers/media/platform/vimc/vimc-capture.c | 14 ++++++++-----
>      >   drivers/media/platform/vimc/vimc-common.c  | 23 ----------------------
>      >   drivers/media/platform/vimc/vimc-common.h  |  2 --
>      >   drivers/media/platform/vimc/vimc-debayer.c |  7 +++++--
>      >   drivers/media/platform/vimc/vimc-scaler.c  |  8 ++++++--
>      >   drivers/media/platform/vimc/vimc-sensor.c  |  9 +++++++--
>      >   6 files changed, 27 insertions(+), 36 deletions(-)
>      >
>      > diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>      > index 23e740c1c5c0..4f85e0bb8f27 100644
>      > --- a/drivers/media/platform/vimc/vimc-capture.c
>      > +++ b/drivers/media/platform/vimc/vimc-capture.c
>      > @@ -85,6 +85,7 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>      >                                   struct v4l2_format *f)
>      >   {
>      >       struct v4l2_pix_format *format = &f->fmt.pix;
>      > +     const struct v4l2_format_info *vinfo;
>      >       const struct vimc_pix_map *vpix;
>      >
>      >       format->width = clamp_t(u32, format->width, VIMC_FRAME_MIN_WIDTH,
>      > @@ -94,12 +95,13 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>      >
>      >       /* Don't accept a pixelformat that is not on the table */
>      >       vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
>      > -     if (!vpix) {
>      > +     if (!vpix)
>      >               format->pixelformat = fmt_default.pixelformat;
>      > -             vpix = vimc_pix_map_by_pixelformat(format->pixelformat);
>      > -     }
>      > +
>      > +     vinfo = v4l2_format_info(format->pixelformat);
>      > +
>      >       /* TODO: Add support for custom bytesperline values */
>      > -     format->bytesperline = format->width * vpix->bpp;
>      > +     format->bytesperline = format->width * vinfo->bpp[0];
>      >       format->sizeimage = format->bytesperline * format->height;
>      >
>      >       if (format->field == V4L2_FIELD_ANY)
>      > @@ -386,6 +388,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>      >                                    const char *vcfg_name)
>      >   {
>      >       struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>      > +     const struct v4l2_format_info *vinfo;
>      >       const struct vimc_pix_map *vpix;
>      >       struct vimc_cap_device *vcap;
>      >       struct video_device *vdev;
>      > @@ -435,7 +438,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>      >       /* Set default frame format */
>      >       vcap->format = fmt_default;
>      >       vpix = vimc_pix_map_by_pixelformat(vcap->format.pixelformat);
>      > -     vcap->format.bytesperline = vcap->format.width * vpix->bpp;
>      > +     vinfo = v4l2_format_info(vpix->pixelformat);
>     you can do instead "vinfo = v4l2_format_info(vcap->format.pixelformat);"
>     and then you don't need vpix at all
>      > +     vcap->format.bytesperline = vcap->format.width * vinfo->bpp[0];
>      >       vcap->format.sizeimage = vcap->format.bytesperline *
>      >                                vcap->format.height;
>      >
>      > diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>      > index c95c17c048f2..fc881daee627 100644
>      > --- a/drivers/media/platform/vimc/vimc-common.c
>      > +++ b/drivers/media/platform/vimc/vimc-common.c
>      > @@ -21,19 +21,16 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>      >       {
>      >               .code = MEDIA_BUS_FMT_BGR888_1X24,
>      >               .pixelformat = V4L2_PIX_FMT_BGR24,
>      > -             .bpp = 3,
>      >               .bayer = false,
>     I know you already removed the bayer field in the first version, I think
>     it is actually a good idea since it can be retrieved from the v4l2_format_info
>     through the .pixel_enc field and there is even a helper "v4l2_is_format_bayer".
>     Then you can add a function
>     "const struct v4l2_format_info *vimc_code_to_format_info(u32 mbus_code)"
>     that returns the vinfo directly from the code.
> 
>     Thank,
>     Dafna
> 
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_RGB888_1X24,
>      >               .pixelformat = V4L2_PIX_FMT_RGB24,
>      > -             .bpp = 3,
>      >               .bayer = false,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_ARGB8888_1X32,
>      >               .pixelformat = V4L2_PIX_FMT_ARGB32,
>      > -             .bpp = 4,
>      >               .bayer = false,
>      >       },
>      >
>      > @@ -41,49 +38,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>      >       {
>      >               .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SBGGR8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGBRG8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGBRG8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGRBG8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGRBG8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SRGGB8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SRGGB8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
>      >               .pixelformat = V4L2_PIX_FMT_SBGGR10,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGBRG10_1X10,
>      >               .pixelformat = V4L2_PIX_FMT_SGBRG10,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>      >               .pixelformat = V4L2_PIX_FMT_SGRBG10,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SRGGB10_1X10,
>      >               .pixelformat = V4L2_PIX_FMT_SRGGB10,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >
>      > @@ -91,25 +80,21 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>      >       {
>      >               .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SBGGR10ALAW8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGBRG10ALAW8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGRBG10ALAW8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SRGGB10ALAW8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >
>      > @@ -117,49 +102,41 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>      >       {
>      >               .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SBGGR10DPCM8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGBRG10DPCM8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
>      >               .pixelformat = V4L2_PIX_FMT_SRGGB10DPCM8,
>      > -             .bpp = 1,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SBGGR12_1X12,
>      >               .pixelformat = V4L2_PIX_FMT_SBGGR12,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGBRG12_1X12,
>      >               .pixelformat = V4L2_PIX_FMT_SGBRG12,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SGRBG12_1X12,
>      >               .pixelformat = V4L2_PIX_FMT_SGRBG12,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >       {
>      >               .code = MEDIA_BUS_FMT_SRGGB12_1X12,
>      >               .pixelformat = V4L2_PIX_FMT_SRGGB12,
>      > -             .bpp = 2,
>      >               .bayer = true,
>      >       },
>      >   };
>      > diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>      > index 616d5a6b0754..838d5df7b9ed 100644
>      > --- a/drivers/media/platform/vimc/vimc-common.h
>      > +++ b/drivers/media/platform/vimc/vimc-common.h
>      > @@ -62,7 +62,6 @@ do {                                                                        \
>      >    * struct vimc_pix_map - maps media bus code with v4l2 pixel format
>      >    *
>      >    * @code:           media bus format code defined by MEDIA_BUS_FMT_* macros
>      > - * @bbp:             number of bytes each pixel occupies
>      >    * @pixelformat:    pixel format devined by V4L2_PIX_FMT_* macros
>      >    *
>      >    * Struct which matches the MEDIA_BUS_FMT_* codes with the corresponding
>      > @@ -70,7 +69,6 @@ do {                                                                        \
>      >    */
>      >   struct vimc_pix_map {
>      >       unsigned int code;
>      > -     unsigned int bpp;
>      >       u32 pixelformat;
>      >       bool bayer;
>      >   };
>      > diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>      > index baf6bf9f65b5..c141a307851c 100644
>      > --- a/drivers/media/platform/vimc/vimc-debayer.c
>      > +++ b/drivers/media/platform/vimc/vimc-debayer.c
>      > @@ -303,6 +303,7 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>      >       struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>      >
>      >       if (enable) {
>      > +             const struct v4l2_format_info *vinfo;
>      >               const struct vimc_pix_map *vpix;
>      >               unsigned int frame_size;
>      >
>      > @@ -311,12 +312,14 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>      >
>      >               /* Calculate the frame size of the source pad */
>      >               vpix = vimc_pix_map_by_code(vdeb->src_code);
>      > +             vinfo = v4l2_format_info(vpix->pixelformat);
>      >               frame_size = vdeb->sink_fmt.width * vdeb->sink_fmt.height *
>      > -                             vpix->bpp;
>      > +                             vinfo->bpp[0];
>      >
>      >               /* Save the bytes per pixel of the sink */
>      >               vpix = vimc_pix_map_by_code(vdeb->sink_fmt.code);
>      > -             vdeb->sink_bpp = vpix->bpp;
>      > +             vinfo = v4l2_format_info(vpix->pixelformat);
>      > +             vdeb->sink_bpp = vinfo->bpp[0];
>      >
>      >               /* Get the corresponding pixel map from the table */
>      >               vdeb->sink_pix_map =
>      > diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>      > index 7521439747c5..9429aeea9cee 100644
>      > --- a/drivers/media/platform/vimc/vimc-scaler.c
>      > +++ b/drivers/media/platform/vimc/vimc-scaler.c
>      > @@ -180,8 +180,10 @@ static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
>      >
>      >       /* Only accept code in the pix map table in non bayer format */
>      >       vpix = vimc_pix_map_by_code(fmt->code);
>      > -     if (!vpix || vpix->bayer)
>      > +     if (!vpix || vpix->bayer) {
>      >               fmt->code = sink_fmt_default.code;
>      > +             vpix = vimc_pix_map_by_code(fmt->code);
>      > +     }
>      >
>      >       fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
>      >                            VIMC_FRAME_MAX_WIDTH) & ~1;
>      > @@ -331,6 +333,7 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>      >       struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>      >
>      >       if (enable) {
>      > +             const struct v4l2_format_info *vinfo;
>      >               const struct vimc_pix_map *vpix;
>      >               unsigned int frame_size;
>      >
>      > @@ -339,7 +342,8 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>      >
>      >               /* Save the bytes per pixel of the sink */
>      >               vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
>      > -             vsca->bpp = vpix->bpp;
>      > +             vinfo = v4l2_format_info(vpix->pixelformat);
>      > +             vsca->bpp = vinfo->bpp[0];
>      >
>      >               /* Calculate the width in bytes of the src frame */
>      >               vsca->src_line_size = vsca->crop_rect.width *
>      > diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>      > index 92daee58209e..fac2260b939f 100644
>      > --- a/drivers/media/platform/vimc/vimc-sensor.c
>      > +++ b/drivers/media/platform/vimc/vimc-sensor.c
>      > @@ -102,10 +102,13 @@ static void vimc_sen_tpg_s_format(struct vimc_sen_device *vsen)
>      >   {
>      >       const struct vimc_pix_map *vpix =
>      >                               vimc_pix_map_by_code(vsen->mbus_format.code);
>      > +     const struct v4l2_format_info *vinfo =
>      > +                             v4l2_format_info(vpix->pixelformat);
>      >
>      >       tpg_reset_source(&vsen->tpg, vsen->mbus_format.width,
>      >                        vsen->mbus_format.height, vsen->mbus_format.field);
>      > -     tpg_s_bytesperline(&vsen->tpg, 0, vsen->mbus_format.width * vpix->bpp);
>      > +     tpg_s_bytesperline(&vsen->tpg, 0,
>      > +                        vsen->mbus_format.width * vinfo->bpp[0]);
>      >       tpg_s_buf_height(&vsen->tpg, vsen->mbus_format.height);
>      >       tpg_s_fourcc(&vsen->tpg, vpix->pixelformat);
>      >       /* TODO: add support for V4L2_FIELD_ALTERNATE */
>      > @@ -198,12 +201,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>      >                               container_of(sd, struct vimc_sen_device, sd);
>      >
>      >       if (enable) {
>      > +             const struct v4l2_format_info *vinfo;
>      >               const struct vimc_pix_map *vpix;
>      >               unsigned int frame_size;
>      >
>      >               /* Calculate the frame size */
>      >               vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>      > -             frame_size = vsen->mbus_format.width * vpix->bpp *
>      > +             vinfo = v4l2_format_info(vpix->pixelformat);
>      > +             frame_size = vsen->mbus_format.width * vinfo->bpp[0] *
>      >                            vsen->mbus_format.height;
>      >
>      >               /*
>      >
> 
> 
> Hi Dafna,
> Thank you for the feedback
> I don't see why a "const struct v4l2_format_info *vimc_code_to_format_info(u32 mbus_code)" would be necessary, as there is the "const struct v4l2_format_info *v4l2_format_info(u32)" function.
Hi, the function v4l2_format_info get the pixelformat as input, but in many palces in vimc we want to get the format_info
from the v4l2_mbus_pixelcode, maybe a better name is "const struct v4l2_format_info *vimc_mbus_pixelcode_to_format_info(u32 mbus_code)"
> I guess there could be a "inline static bool is_v4l2_format_code_bayer(u32 mbus_code)" functio which returns n that would replace the usage of v4l2_is_format_bayer(v4l2_format_info(vpix->pixelformat))
>   for a single function. But in that case, should this change be submitted by this patch?
I don't think there is a need to add such a function,

you can do

vinfo = vimc_mbus_pixelcode_to_format_info(mbus_code)
v4l2_is_format_bayer(vinfo)

Thanks,
Dafna

> 
> Thank,
> Carlos
