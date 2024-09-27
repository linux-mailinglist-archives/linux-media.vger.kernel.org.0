Return-Path: <linux-media+bounces-18704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CB988859
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 17:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D830A1C21081
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 15:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A24D1C1739;
	Fri, 27 Sep 2024 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwpyzGFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE931BFE13;
	Fri, 27 Sep 2024 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451342; cv=none; b=l+HERJTN7NVgzqrUypOc4+OwACYX/BNKdfx2YcksGsSsODKEsPTBa2KsLaCLCD2ppIiTcSD1XE5iyQWX6jdScBqKLYFwB3fPoQ4cMJcTknZnmVPvicbdcytnR71sc9L1yI6vgQoWzxCXqwhPnw9z8l5NNZ8bvuV5qfmSasi1R14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451342; c=relaxed/simple;
	bh=9DGGe7h2OtZ7tZB0fADGtwmdUrG3yqpjZAX1uETYG/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwsGi89e75/jneT0j/b2F6maMSfDIa47G6kjyNLRRuShH7foyICAitvf4vbf+RQhl+ZSJ1k55XXx/1neHEuPrskLOnUl6EDTbVu9ADLI0IE8K2CoLvhkibHk9VHKKfk9VDmoqJE4m8vIlrzaIPQbY7TAKm7wheFKAaypqgIycAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwpyzGFC; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-45aeed46f5eso9981941cf.3;
        Fri, 27 Sep 2024 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727451340; x=1728056140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RVoIgwpj4imbc8DwVoTuL68vnlYwQQnQejDRDQw/gk=;
        b=jwpyzGFCVsOI/sHBnPwzflgSWbZu0pu2FhDZ0KbAT7+tX2s78If5iM0hMPdA0jjgu5
         kr1bS8pzmyVyY3H59hjIJHhjs1HPdND95ibZyw7Wxk7V5IrSWwVlfocbwruR/YVWf2If
         id7Ev/Z6rJ91pcjSjhKSZHrIB/96jkPS20ljQqtn65sKP6blB6Vm8wMBuK9/yV9/+OTk
         WHUTzhWKcJGxNEo4pGrL72DKDNKLLYiVk3ouBvMm/IBeEhFA4asgdaHDAw2rPOff30VU
         tnIWjfMmoaIP2qOv+Lu4O0mVLKOT2ihq7u0m8TLhqQEVnPiAqU6NETJAV0Uy3K82vw27
         2ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727451340; x=1728056140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RVoIgwpj4imbc8DwVoTuL68vnlYwQQnQejDRDQw/gk=;
        b=FVlBuxVrwE8iYU1r4JI/H93deq4Cz9zaUeZ+qBC7Sd02DEB1xEgEtzDpW0relwHCoH
         GBfYw9CwWvBJ8ZU8JIp+C+B4Sa/Q1i3qUv4UVycejBlDs80uMaM6hbxvTPA33dI4M5ik
         IrYtyGatDg/BdMavhYqqIpd3h1LXOvLpzp6MRBMMeby+X/xHOUI2bLNbDBHijolHfbIC
         7R9KuvX/ToB5pkATbbcCOIKEwzKFXk+a6B9BhMHqqtJNvyrGDbeRrTMrGkBevgwPzegy
         oKcV+/Gsm35COl7pSLvHsGoOVsy/AInDF3591Jf+qByv33dwY++0RbJ1fWexaX8t4E24
         FFBA==
X-Forwarded-Encrypted: i=1; AJvYcCUch18akzKL93NTsfkPJ+n+sK4yruhd6DLakkmdHdj2r/2e6tQq/ToDTK9z39QIw1EZuwt2QNnAihS8cvQ=@vger.kernel.org, AJvYcCUfmpTrlWzeiXm250mYN5jRAyp/jV/qlR/BSBx0DkDOPo1TVt4hvGdmGw+jtFlwks5eTkwneUW3DJpoUPU=@vger.kernel.org, AJvYcCVAkgoRFryGeVUEB3DWE0QcEHicokPasrJ1CQKKglWxq150mAmDAJpXsHR5Vkno8t1pB4tI0LuU8f+nu3xZ8j3stdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1P2F9fGpjrvjxyvJ7pE560u5I/TYYFaDj01MoSYJUjUkIZ6V
	bCy6FVim6rT1krDB8QHcpWN0dRKuL4SlJ32qH/vGZj1tbbkrm1Ik/mEE7oAvmy+QEljIoB0GCmB
	baqGZUP5/yRSY3WlRip0wzakkqJ4AFSF4
X-Google-Smtp-Source: AGHT+IEH7+x1lDEE4K125oQNgzyeZnmo4p9wiygywNZ8LiMlntVVjEE3BZ99FrpWwSJ+mcLKP+p1NV7nWTt9DXVYH6Y=
X-Received: by 2002:a05:622a:1a24:b0:458:5cbb:bc7 with SMTP id
 d75a77b69052e-45c9f2100bdmr51545881cf.36.1727451339541; Fri, 27 Sep 2024
 08:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240925162153.GA27666@pendragon.ideasonboard.com> <ZvWCdn-lN66_tXeZ@kekkonen.localdomain>
In-Reply-To: <ZvWCdn-lN66_tXeZ@kekkonen.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Sep 2024 16:35:13 +0100
Message-ID: <CA+V-a8t+=55T5m7qjJyN7S2c2yJjPurAq-N=DhtffKZb7OWXZw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] media: i2c: ov5645: Add internal image sink pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu, Sep 26, 2024 at 4:49=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Laurent, Prabhakar,
>
> On Wed, Sep 25, 2024 at 07:21:53PM +0300, Laurent Pinchart wrote:
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > On Tue, Sep 10, 2024 at 06:06:08PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Use the newly added internal pad API to expose the internal
> > > configuration of the sensor to userspace in a standard manner.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  drivers/media/i2c/ov5645.c | 107 +++++++++++++++++++++++++++--------=
--
> > >  1 file changed, 79 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index dc93514608ee..255c6395a268 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -60,6 +60,10 @@
> > >  #define OV5645_SDE_SAT_U           0x5583
> > >  #define OV5645_SDE_SAT_V           0x5584
> > >
> > > +#define OV5645_NATIVE_FORMAT       MEDIA_BUS_FMT_SBGGR8_1X8
> > > +#define OV5645_NATIVE_WIDTH        2592
> > > +#define OV5645_NATIVE_HEIGHT       1944
> > > +
> > >  /* regulator supplies */
> > >  static const char * const ov5645_supply_name[] =3D {
> > >     "vdddo", /* Digital I/O (1.8V) supply */
> > > @@ -69,6 +73,12 @@ static const char * const ov5645_supply_name[] =3D=
 {
> > >
> > >  #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
> > >
> > > +enum ov5645_pad_ids {
> > > +   OV5645_PAD_SOURCE,
> > > +   OV5645_PAD_IMAGE,
> > > +   OV5645_NUM_PADS,
> > > +};
> > > +
> > >  struct reg_value {
> > >     u16 reg;
> > >     u8 val;
> > > @@ -87,7 +97,7 @@ struct ov5645 {
> > >     struct i2c_client *i2c_client;
> > >     struct device *dev;
> > >     struct v4l2_subdev sd;
> > > -   struct media_pad pad;
> > > +   struct media_pad pads[OV5645_NUM_PADS];
> > >     struct v4l2_fwnode_endpoint ep;
> > >     struct v4l2_rect crop;
> > >     struct clk *xclk;
> > > @@ -826,7 +836,10 @@ static int ov5645_enum_mbus_code(struct v4l2_sub=
dev *sd,
> > >     if (code->index > 0)
> > >             return -EINVAL;
> > >
> > > -   code->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > > +   if (code->pad =3D=3D OV5645_PAD_IMAGE)
> > > +           code->code =3D OV5645_NATIVE_FORMAT;
> > > +   else
> > > +           code->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > >
> > >     return 0;
> > >  }
> > > @@ -835,16 +848,24 @@ static int ov5645_enum_frame_size(struct v4l2_s=
ubdev *subdev,
> > >                               struct v4l2_subdev_state *sd_state,
> > >                               struct v4l2_subdev_frame_size_enum *fse=
)
> > >  {
> > > -   if (fse->code !=3D MEDIA_BUS_FMT_UYVY8_1X16)
> > > -           return -EINVAL;
> > > -
> > > -   if (fse->index >=3D ARRAY_SIZE(ov5645_mode_info_data))
> > > -           return -EINVAL;
> > > -
> > > -   fse->min_width =3D ov5645_mode_info_data[fse->index].width;
> > > -   fse->max_width =3D ov5645_mode_info_data[fse->index].width;
> > > -   fse->min_height =3D ov5645_mode_info_data[fse->index].height;
> > > -   fse->max_height =3D ov5645_mode_info_data[fse->index].height;
> > > +   if (fse->pad =3D=3D OV5645_PAD_IMAGE) {
> > > +           if (fse->code !=3D OV5645_NATIVE_FORMAT || fse->index > 0=
)
> > > +                   return -EINVAL;
> > > +
> > > +           fse->min_width =3D OV5645_NATIVE_WIDTH;
> > > +           fse->max_width =3D OV5645_NATIVE_WIDTH;
> > > +           fse->min_height =3D OV5645_NATIVE_HEIGHT;
> > > +           fse->max_height =3D OV5645_NATIVE_HEIGHT;
> > > +   } else {
> > > +           if (fse->code !=3D MEDIA_BUS_FMT_UYVY8_1X16 ||
> >
> > This will be interesting. With internal pads we will introduce the
> > concept of a "subdev model", which will formally document how the V4L2
> > subdev configuration items (formats, selection rectangles, ...) maps to
> > hardware features. Sakari is working on the definition of a subdev mode=
l
> > for raw sensors, that should catter for the needs of raw sensors withou=
t
> > a bayer scaler (the vast majority of them). To use internal pads with a
> > non-raw sensor, we'll have to define a model. It may be more
> > challenging/complicated to do so, as the YUV sensor features are less
> > standardized, but it will be an interesting development.
>
> I think I'll make the sub-device model a bitmask, to allow implementing
> more than one at the same time.
>
> I'll try to remember to cc you to the patchset when I'll send it, likely
> next week.
>
Great, I'll withhold sending a v3.

> >
> > > +               fse->index >=3D ARRAY_SIZE(ov5645_mode_info_data))
> > > +                   return -EINVAL;
> > > +
> > > +           fse->min_width =3D ov5645_mode_info_data[fse->index].widt=
h;
> > > +           fse->max_width =3D ov5645_mode_info_data[fse->index].widt=
h;
> > > +           fse->min_height =3D ov5645_mode_info_data[fse->index].hei=
ght;
> > > +           fse->max_height =3D ov5645_mode_info_data[fse->index].hei=
ght;
> > > +   }
> > >
> > >     return 0;
> > >  }
> > > @@ -855,18 +876,55 @@ static int ov5645_set_format(struct v4l2_subdev=
 *sd,
> > >  {
> > >     struct ov5645 *ov5645 =3D to_ov5645(sd);
> > >     struct v4l2_mbus_framefmt *__format;
> > > +   struct v4l2_rect *compose;
> > >     struct v4l2_rect *__crop;
> >
> > While at it, could you rename __crop to crop ?
> >
> > >     const struct ov5645_mode_info *new_mode;
> > >     int ret;
> > >
> > > -   __crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> > > +   if (format->pad !=3D OV5645_PAD_SOURCE)
> > > +           return v4l2_subdev_get_fmt(sd, sd_state, format);
> > > +
> > >     new_mode =3D v4l2_find_nearest_size(ov5645_mode_info_data,
> > >                                       ARRAY_SIZE(ov5645_mode_info_dat=
a),
> > >                                       width, height, format->format.w=
idth,
> > >                                       format->format.height);
> > > -
> > > -   __crop->width =3D new_mode->width;
> > > -   __crop->height =3D new_mode->height;
> > > +   format->format.code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > > +   format->format.width =3D new_mode->width;
> > > +   format->format.height =3D new_mode->height;
> > > +   format->format.field =3D V4L2_FIELD_NONE;
> > > +   format->format.colorspace =3D V4L2_COLORSPACE_SRGB;
> > > +   format->format.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > > +   format->format.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> > > +   format->format.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> >
> > Drivers are not supposed to return DEFAULT values, you should pick
> > appropriate values.
> >
> > > +
> > > +   __format =3D v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IM=
AGE);
> >
> > Maybe __format could also become fmt.
> >
> > > +   *__format =3D format->format;
> > > +   __format->code =3D OV5645_NATIVE_FORMAT;
> > > +   __format->width =3D OV5645_NATIVE_WIDTH;
> > > +   __format->height =3D OV5645_NATIVE_HEIGHT;
> > > +
> > > +   __crop =3D v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE)=
;
> > > +   __crop->width =3D format->format.width;
> > > +   __crop->height =3D format->format.height;
> > > +
> > > +   /*
> > > +    * The compose rectangle models binning, its size is the sensor o=
utput
> > > +    * size.
> > > +    */
> > > +   compose =3D v4l2_subdev_state_get_compose(sd_state, OV5645_PAD_IM=
AGE);
> > > +   compose->left =3D 0;
> > > +   compose->top =3D 0;
> > > +   compose->width =3D format->format.width;
> > > +   compose->height =3D format->format.height;
> > > +
> > > +   __crop =3D v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE=
);
> > > +   __crop->left =3D 0;
> > > +   __crop->top =3D 0;
> > > +   __crop->width =3D format->format.width;
> > > +   __crop->height =3D format->format.height;
> > > +
> > > +   __format =3D v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SO=
URCE);
> > > +   *__format =3D format->format;
> > >
> > >     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >             ret =3D __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
> > > @@ -882,14 +940,6 @@ static int ov5645_set_format(struct v4l2_subdev =
*sd,
> > >             ov5645->current_mode =3D new_mode;
> > >     }
> > >
> > > -   __format =3D v4l2_subdev_state_get_format(sd_state, 0);
> > > -   __format->width =3D __crop->width;
> > > -   __format->height =3D __crop->height;
> > > -   __format->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > > -   __format->field =3D V4L2_FIELD_NONE;
> > > -   __format->colorspace =3D V4L2_COLORSPACE_SRGB;
> > > -
> > > -   format->format =3D *__format;
> > >
> > >     return 0;
> > >  }
> > > @@ -899,7 +949,7 @@ static int ov5645_init_state(struct v4l2_subdev *=
subdev,
> > >  {
> > >     struct v4l2_subdev_format fmt =3D {
> > >             .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > > -           .pad =3D 0,
> > > +           .pad =3D OV5645_PAD_SOURCE,
> > >             .format =3D {
> > >                     .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > >                     .width =3D ov5645_mode_info_data[1].width,
> > > @@ -919,7 +969,7 @@ static int ov5645_get_selection(struct v4l2_subde=
v *sd,
> > >     if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > >             return -EINVAL;
> > >
> > > -   sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);
> > > +   sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> >
> > Now there's a compose rectangle, you should support getting it.
> >
> > >     return 0;
> > >  }
> > >
> > > @@ -1123,11 +1173,12 @@ static int ov5645_probe(struct i2c_client *cl=
ient)
> > >     v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > >     ov5645->sd.internal_ops =3D &ov5645_internal_ops;
> > >     ov5645->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL=
_HAS_EVENTS;
> > > -   ov5645->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > > +   ov5645->pads[OV5645_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> > > +   ov5645->pads[OV5645_PAD_IMAGE].flags =3D MEDIA_PAD_FL_SINK | MEDI=
A_PAD_FL_INTERNAL;
> > >     ov5645->sd.dev =3D dev;
> > >     ov5645->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > >
> > > -   ret =3D media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pa=
d);
> > > +   ret =3D media_entity_pads_init(&ov5645->sd.entity, ARRAY_SIZE(ov5=
645->pads), ov5645->pads);
> >
> > Line wrap.
>
> It's good to run:
>
>         scripts/checkpatch.pl --strict --max-line-length=3D80
>
> on the patches.
>
Thanks for the pointer.

Cheers,
Prabhakar

