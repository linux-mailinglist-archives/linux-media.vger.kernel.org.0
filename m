Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56078F6AD6
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 19:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfKJSgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 13:36:17 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38921 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfKJSgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 13:36:17 -0500
Received: by mail-lf1-f66.google.com with SMTP id z24so5184952lfh.6;
        Sun, 10 Nov 2019 10:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bEN5UGp+S72kB8ILOpR3/KY8Sc7HD6hL2R/jbxl/gHA=;
        b=O+QT+PUhk3o1Bu/RSAfuSruxlVHxcflEHhsFEGLSf4encN1i4AancZjRrX9fflx4kD
         f7kj4PzUV1Y+vrJxrwPBq0jGhvXtBXiKUw/00Uc44VDHJmzbSNbgGyUY/Z9Vlab4fIK5
         0bobc+OkxN1lp5PYRrP7FP1tKVOwiHsKIKGRgeHLGrLnCCxdFP/nMmn68NjTtFW1pQJY
         lxQ4o4uUVnchrAS/5bI+zOHhYk5l5YFk3xjFfZxXDSnfGJDcyBMW3QJquHwVzxddfud9
         hZK1AKlw7IDk0dpsTTUaO9frZnHj+KPxpGuDIHSfzJ78M2MrF5Fb2SLw0Z/QOjMmVuau
         Tn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bEN5UGp+S72kB8ILOpR3/KY8Sc7HD6hL2R/jbxl/gHA=;
        b=lSa8OmRIRABUFesRt2YfaX2XHlRGAQ2Cnk/2sE89w5Z+wPHZou0UULvzST2DA1yZu5
         5URUqinqkhkn56lb+q5C+kvaUIdXp8eEA03C94iqsVb8mfQGHbG2t0JiWH7iVgM8FEYz
         p81atErJm/0raXKmTJ1jj+T3D5/9xUAJ9ZMhcGlbmv/XctMk+eaZ6Y2TiJ0XFjInS8Ba
         vSdRV/9fGSKH7t2248T3EgWR+zaHyp6kRatol0V42VIWT3fBzNddINSAD6mh5Aa7RGXv
         2pCEECQiQ/SnCokGYSn48A5vgAqdjpT1VTIZgarfxGgUXOK1sdrFXr3VYQ2ltry075Cp
         yG5Q==
X-Gm-Message-State: APjAAAXlUgOKquEu8F92fROcPUzAVJ7ToAfMal+YBcpckkJ2XNt/WmNx
        jlaz+P/g8/h0f/1OiI8H7to1Eu3WHxuw5QMmfW7rrvw5cJk=
X-Google-Smtp-Source: APXvYqx5yfJG5AFogJ8VheiHpoolsZvRlHq6/7u3Wktz0cq94/MUsHL3t/aj4Oad4eLV8t3njNhlZkX7FWJOA9QA3q8=
X-Received: by 2002:ac2:4c86:: with SMTP id d6mr13046119lfl.106.1573410974357;
 Sun, 10 Nov 2019 10:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20191108024509.13067-1-gagallo7@gmail.com> <012e37dc-a307-9e77-2973-e17d2abe4b2d@xs4all.nl>
In-Reply-To: <012e37dc-a307-9e77-2973-e17d2abe4b2d@xs4all.nl>
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
Date:   Sun, 10 Nov 2019 15:35:37 -0300
Message-ID: <CAF2jNbiDNDUJi2hNoy+XL6=ziUhmw1qGjOCc+4y8VYkP=gYy1g@mail.gmail.com>
Subject: Re: [PATCH v4] media: vimc: Implement get/set selection in sink
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        pedro@terraco.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for testing the compilation.

I didn't know that -Wunused-but-set-variable flag was not being
employed in the default kernel compilation.

I just sent a v5 fixing this warning.
This variable was unnecessary since vimc_sca_adjust_sink_crop function
already creates an internal v4l2_rect to be adjusted to the crop
region.

On Sat, Nov 9, 2019 at 8:50 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrot=
e:
>
> On 11/8/19 3:45 AM, Guilherme Alcarde Gallo wrote:
> > Add support for the sink pad of scaler subdevice to respond
> > VIDIOC_G_SELECTION and VIDIOC_S_SELECTION ioctls with the following
> > targets: V4L2_SEL_TGT_COMPOSE_BOUNDS and V4L2_SEL_TGT_CROP.
> >
> > * Add new const struct crop_rect_default to initialize subdev scaler
> >   properly.
> > * Make changes in sink pad format reflect to the crop rectangle. E.g.
> >   changing the frame format to a smaller size one can make the former
> >   crop rectangle selects a non existing frame area. To solve this
> >   situation the crop rectangle is clamped to the frame boundaries.
> > * Clamp crop rectangle respecting the sink bounds during set_selection
> >   ioctl.
> >
> > Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>
> > Co-developed-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
> > Signed-off-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
> > Acked-by: Helen Koike <helen.koike@collabora.com>
> >
> > ---
> > Changes in V4:
> > * Revert an unnecessary change in headers include order.
> > * Sort the declaration order for local variables in function by the siz=
e
> >   descending.
> >
> > Changes in V3:
> > * Sort the headers in alphabetical order.
> > * Change all functions prefix to 'vimc_sca_'.
> > * Remove useless case.
> > * Change commit message subject.
> >
> > Changes in V2:
> > * Use v4l2_rect_map_inside to clamp the crop rectangle.
> > * Do the crop rectangle clamping after changing sink format.
> > * Implement try ioctls for selection with CROP* targets.
> > * Treat tiny rectangles with area smaller than minimal dimensions of
> >   vimc frames.
> > * Allow user to get selection when the streaming is on.
> > * Reuse bound rectangle generation in a static function.
> > * Disable get_selection for Source pads as we did before with
> >   set_selection.
> > ---
> > ---
> >  drivers/media/platform/vimc/vimc-scaler.c | 168 ++++++++++++++++++++--
> >  1 file changed, 153 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/=
platform/vimc/vimc-scaler.c
> > index 2f88a7d9d67b..36425cffc0ad 100644
> > --- a/drivers/media/platform/vimc/vimc-scaler.c
> > +++ b/drivers/media/platform/vimc/vimc-scaler.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/moduleparam.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/v4l2-mediabus.h>
> > +#include <media/v4l2-rect.h>
> >  #include <media/v4l2-subdev.h>
> >
> >  #include "vimc-common.h"
> > @@ -18,6 +19,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplie=
r");
> >
> >  #define MAX_ZOOM     8
> >
> > +#define VIMC_SCA_FMT_WIDTH_DEFAULT  640
> > +#define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
> > +
> >  struct vimc_sca_device {
> >       struct vimc_ent_device ved;
> >       struct v4l2_subdev sd;
> > @@ -25,6 +29,7 @@ struct vimc_sca_device {
> >        * with the width and hight multiplied by mult
> >        */
> >       struct v4l2_mbus_framefmt sink_fmt;
> > +     struct v4l2_rect crop_rect;
> >       /* Values calculated when the stream starts */
> >       u8 *src_frame;
> >       unsigned int src_line_size;
> > @@ -33,22 +38,64 @@ struct vimc_sca_device {
> >  };
> >
> >  static const struct v4l2_mbus_framefmt sink_fmt_default =3D {
> > -     .width =3D 640,
> > -     .height =3D 480,
> > +     .width =3D VIMC_SCA_FMT_WIDTH_DEFAULT,
> > +     .height =3D VIMC_SCA_FMT_HEIGHT_DEFAULT,
> >       .code =3D MEDIA_BUS_FMT_RGB888_1X24,
> >       .field =3D V4L2_FIELD_NONE,
> >       .colorspace =3D V4L2_COLORSPACE_DEFAULT,
> >  };
> >
> > +static const struct v4l2_rect crop_rect_default =3D {
> > +     .width =3D VIMC_SCA_FMT_WIDTH_DEFAULT,
> > +     .height =3D VIMC_SCA_FMT_HEIGHT_DEFAULT,
> > +     .top =3D 0,
> > +     .left =3D 0,
> > +};
> > +
> > +static const struct v4l2_rect crop_rect_min =3D {
> > +     .width =3D VIMC_FRAME_MIN_WIDTH,
> > +     .height =3D VIMC_FRAME_MIN_HEIGHT,
> > +     .top =3D 0,
> > +     .left =3D 0,
> > +};
> > +
> > +static struct v4l2_rect
> > +vimc_sca_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt=
)
> > +{
> > +     /* Get the crop bounds to clamp the crop rectangle correctly */
> > +     struct v4l2_rect r =3D {
> > +             .left =3D 0,
> > +             .top =3D 0,
> > +             .width =3D sink_fmt->width,
> > +             .height =3D sink_fmt->height,
> > +     };
> > +     return r;
> > +}
> > +
> > +static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
> > +                                   const struct v4l2_mbus_framefmt *si=
nk_fmt)
> > +{
> > +     const struct v4l2_rect sink_rect =3D
> > +             vimc_sca_get_crop_bound_sink(sink_fmt);
> > +
> > +     /* Disallow rectangles smaller than the minimal one. */
> > +     v4l2_rect_set_min_size(r, &crop_rect_min);
> > +     v4l2_rect_map_inside(r, &sink_rect);
> > +}
> > +
> >  static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
> >                            struct v4l2_subdev_pad_config *cfg)
> >  {
> >       struct v4l2_mbus_framefmt *mf;
> > +     struct v4l2_rect *r;
> >       unsigned int i;
> >
> >       mf =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> >       *mf =3D sink_fmt_default;
> >
> > +     r =3D v4l2_subdev_get_try_crop(sd, cfg, 0);
> > +     *r =3D crop_rect_default;
> > +
> >       for (i =3D 1; i < sd->entity.num_pads; i++) {
> >               mf =3D v4l2_subdev_get_try_format(sd, cfg, i);
> >               *mf =3D sink_fmt_default;
> > @@ -107,16 +154,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *s=
d,
> >                           struct v4l2_subdev_format *format)
> >  {
> >       struct vimc_sca_device *vsca =3D v4l2_get_subdevdata(sd);
> > +     struct v4l2_rect *crop_rect;
> >
> >       /* Get the current sink format */
> > -     format->format =3D (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) =
?
> > -                      *v4l2_subdev_get_try_format(sd, cfg, 0) :
> > -                      vsca->sink_fmt;
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             format->format =3D *v4l2_subdev_get_try_format(sd, cfg, 0=
);
> > +             crop_rect =3D v4l2_subdev_get_try_crop(sd, cfg, 0);
> > +     } else {
> > +             format->format =3D vsca->sink_fmt;
> > +             crop_rect =3D &vsca->crop_rect;
> > +     }
> >
> >       /* Scale the frame size for the source pad */
> >       if (VIMC_IS_SRC(format->pad)) {
> > -             format->format.width =3D vsca->sink_fmt.width * sca_mult;
> > -             format->format.height =3D vsca->sink_fmt.height * sca_mul=
t;
> > +             format->format.width =3D crop_rect->width * sca_mult;
> > +             format->format.height =3D crop_rect->height * sca_mult;
> >       }
> >
> >       return 0;
> > @@ -148,6 +200,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
> >  {
> >       struct vimc_sca_device *vsca =3D v4l2_get_subdevdata(sd);
> >       struct v4l2_mbus_framefmt *sink_fmt;
> > +     struct v4l2_rect *crop_rect;
> >
> >       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> >               /* Do not change the format while stream is on */
> > @@ -155,8 +208,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd=
,
> >                       return -EBUSY;
> >
> >               sink_fmt =3D &vsca->sink_fmt;
> > +             crop_rect =3D &vsca->crop_rect;
> >       } else {
> >               sink_fmt =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> > +             crop_rect =3D v4l2_subdev_get_try_crop(sd, cfg, 0);
> >       }
> >
> >       /*
> > @@ -165,8 +220,8 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
> >        */
> >       if (VIMC_IS_SRC(fmt->pad)) {
> >               fmt->format =3D *sink_fmt;
> > -             fmt->format.width =3D sink_fmt->width * sca_mult;
> > -             fmt->format.height =3D sink_fmt->height * sca_mult;
> > +             fmt->format.width =3D crop_rect->width * sca_mult;
> > +             fmt->format.height =3D crop_rect->height * sca_mult;
> >       } else {
> >               /* Set the new format in the sink pad */
> >               vimc_sca_adjust_sink_fmt(&fmt->format);
> > @@ -184,6 +239,80 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd=
,
> >                       fmt->format.xfer_func, fmt->format.ycbcr_enc);
> >
> >               *sink_fmt =3D fmt->format;
> > +
> > +             /* Do the crop, but respect the current bounds */
> > +             vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int vimc_sca_get_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_pad_config *cfg,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +     struct vimc_sca_device *vsca =3D v4l2_get_subdevdata(sd);
> > +     struct v4l2_mbus_framefmt *sink_fmt;
> > +     struct v4l2_rect *crop_rect;
> > +
> > +     if (VIMC_IS_SRC(sel->pad))
> > +             return -EINVAL;
> > +
> > +     if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +             sink_fmt =3D &vsca->sink_fmt;
> > +             crop_rect =3D &vsca->crop_rect;
> > +     } else {
> > +             sink_fmt =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> > +             crop_rect =3D v4l2_subdev_get_try_crop(sd, cfg, 0);
> > +     }
> > +
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             sel->r =3D *crop_rect;
> > +             break;
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r =3D vimc_sca_get_crop_bound_sink(sink_fmt);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int vimc_sca_set_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_pad_config *cfg,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +     struct vimc_sca_device *vsca =3D v4l2_get_subdevdata(sd);
> > +     struct v4l2_mbus_framefmt *sink_fmt;
> > +     struct v4l2_rect *crop_rect;
> > +     struct v4l2_rect sink_rect;
> > +
> > +     if (VIMC_IS_SRC(sel->pad))
> > +             return -EINVAL;
> > +
> > +     if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +             /* Do not change the format while stream is on */
> > +             if (vsca->src_frame)
> > +                     return -EBUSY;
> > +
> > +             crop_rect =3D &vsca->crop_rect;
> > +             sink_fmt =3D &vsca->sink_fmt;
> > +     } else {
> > +             crop_rect =3D v4l2_subdev_get_try_crop(sd, cfg, 0);
> > +             sink_fmt =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> > +     }
> > +
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             /* Do the crop, but respect the current bounds */
> > +             sink_rect =3D vimc_sca_get_crop_bound_sink(sink_fmt);
> > +             vimc_sca_adjust_sink_crop(&sel->r, sink_fmt);
> > +             *crop_rect =3D sel->r;
>
> drivers/media/platform/vimc/vimc-scaler.c: In function =E2=80=98vimc_sca_=
set_selection=E2=80=99:
> drivers/media/platform/vimc/vimc-scaler.c:290:19: warning: variable =E2=
=80=98sink_rect=E2=80=99 set but not used [-Wunused-but-set-variable]
>   290 |  struct v4l2_rect sink_rect;
>       |                   ^~~~~~~~~
>
> Something is wrong here.
>
> Regards,
>
>         Hans
>
> > +             break;
> > +     default:
> > +             return -EINVAL;
> >       }
> >
> >       return 0;
> > @@ -195,6 +324,8 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pa=
d_ops =3D {
> >       .enum_frame_size        =3D vimc_sca_enum_frame_size,
> >       .get_fmt                =3D vimc_sca_get_fmt,
> >       .set_fmt                =3D vimc_sca_set_fmt,
> > +     .get_selection          =3D vimc_sca_get_selection,
> > +     .set_selection          =3D vimc_sca_set_selection,
> >  };
> >
> >  static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
> > @@ -213,11 +344,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *=
sd, int enable)
> >               vsca->bpp =3D vpix->bpp;
> >
> >               /* Calculate the width in bytes of the src frame */
> > -             vsca->src_line_size =3D vsca->sink_fmt.width *
> > +             vsca->src_line_size =3D vsca->crop_rect.width *
> >                                     sca_mult * vsca->bpp;
> >
> >               /* Calculate the frame size of the source pad */
> > -             frame_size =3D vsca->src_line_size * vsca->sink_fmt.heigh=
t *
> > +             frame_size =3D vsca->src_line_size * vsca->crop_rect.heig=
ht *
> >                            sca_mult;
> >
> >               /* Allocate the frame buffer. Use vmalloc to be able to
> > @@ -259,9 +390,10 @@ static void vimc_sca_fill_pix(u8 *const ptr,
> >  }
> >
> >  static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsc=
a,
> > -                            const unsigned int lin, const unsigned int=
 col,
> > +                            unsigned int lin, unsigned int col,
> >                              const u8 *const sink_frame)
> >  {
> > +     const struct v4l2_rect crop_rect =3D vsca->crop_rect;
> >       unsigned int i, j, index;
> >       const u8 *pixel;
> >
> > @@ -278,8 +410,10 @@ static void vimc_sca_scale_pix(const struct vimc_s=
ca_device *const vsca,
> >       /* point to the place we are going to put the first pixel
> >        * in the scaled src frame
> >        */
> > +     lin -=3D crop_rect.top;
> > +     col -=3D crop_rect.left;
> >       index =3D VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
> > -                              vsca->sink_fmt.width * sca_mult, vsca->b=
pp);
> > +                              crop_rect.width * sca_mult, vsca->bpp);
> >
> >       dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %=
d\n",
> >               vsca->sd.name, lin * sca_mult, col * sca_mult, index);
> > @@ -307,12 +441,13 @@ static void vimc_sca_scale_pix(const struct vimc_=
sca_device *const vsca,
> >  static void vimc_sca_fill_src_frame(const struct vimc_sca_device *cons=
t vsca,
> >                                   const u8 *const sink_frame)
> >  {
> > +     const struct v4l2_rect r =3D vsca->crop_rect;
> >       unsigned int i, j;
> >
> >       /* Scale each pixel from the original sink frame */
> >       /* TODO: implement scale down, only scale up is supported for now=
 */
> > -     for (i =3D 0; i < vsca->sink_fmt.height; i++)
> > -             for (j =3D 0; j < vsca->sink_fmt.width; j++)
> > +     for (i =3D r.top; i < r.top + r.height; i++)
> > +             for (j =3D r.left; j < r.left + r.width; j++)
> >                       vimc_sca_scale_pix(vsca, i, j, sink_frame);
> >  }
> >
> > @@ -384,5 +519,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_de=
vice *vimc,
> >       /* Initialize the frame format */
> >       vsca->sink_fmt =3D sink_fmt_default;
> >
> > +     /* Initialize the crop selection */
> > +     vsca->crop_rect =3D crop_rect_default;
> > +
> >       return &vsca->ved;
> >  }
> >
>
