Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406865ED73D
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 10:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbiI1INk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 04:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbiI1IN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 04:13:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E54BB24A3
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 01:13:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m3so16207446eda.12
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=eqwwBkjNmzJBjRV5Kt+d/fy3lF5bLLFVPM/Ru0wKheI=;
        b=AoVI5+Te8ofQrYpuUbBjd4BbhMOQ1JTuSjTaexMbwXWcojFgqnPpUV2qtLyVk+l79c
         I+gwZV7YpQY3z8/+4VS3+gL5CmdjFrxBDCfLXMPqfVeZE6MUC+L8OaiVvCSczPlkIz1T
         n4jYoARpefrQl0EptQJBxmJ9bpNDKiOlhgdlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eqwwBkjNmzJBjRV5Kt+d/fy3lF5bLLFVPM/Ru0wKheI=;
        b=xidItErr2BySu9ivyRjcSTGEEyuNkXVluJ3CQotauNlz5Qt9Gtq7xZxcPVL85kKSon
         MRn7HxCm/V2kCmV79dm7cvULWSM9zTSvp6zTV+C7bO441vZfYZESOU7IgQ8FxwSLw72x
         VwBhRsWTmXO4+HJX7Y7kb/bz7GWb26b4ikLC9az9f8VRuadHvLo0mykSJoenO5Kvz9/U
         BHvURkllocitsFRICbZFcbBAnAFjhfev8J2iRaCqZhroQJ+gIfuBBdtLXC6KgKa/aQ8W
         lVjQZMTzkd4yDQsjSkZKY1mKr2F7PMmrn7YKbihzMOwRQfnIx8CwIVVpYcT9B0Buvaaq
         Fgeg==
X-Gm-Message-State: ACrzQf1ONzLKs7NX6Rozwsm94ODxdgju4fIJJ4YOmJ1aE3vvzGfft6R8
        znxmDt1wMr5xVzipE9/3QN2S4vD+oNQI/BcoG64=
X-Google-Smtp-Source: AMsMyM66XJGCOUS02WiIuMLHBBTUDih7ho4dHEv5qCnXieh+089dRCJCIpTEDRd2HhJHFNOFt//iLw==
X-Received: by 2002:a05:6402:5254:b0:450:e9be:e13 with SMTP id t20-20020a056402525400b00450e9be0e13mr31957894edd.398.1664352803683;
        Wed, 28 Sep 2022 01:13:23 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id qb24-20020a1709077e9800b007807e4f6b30sm2002907ejc.103.2022.09.28.01.13.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:13:22 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id sd10so25536175ejc.2
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 01:13:21 -0700 (PDT)
X-Received: by 2002:a17:907:c13:b0:781:d3c2:5015 with SMTP id
 ga19-20020a1709070c1300b00781d3c25015mr26031142ejc.457.1664352801116; Wed, 28
 Sep 2022 01:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-5-yunkec@google.com>
 <YwaL6BgwEwif7b16@pendragon.ideasonboard.com> <CANqU6Fc+Lm1dk4CnBpO_EkfSBFyWZ8msveqfD6V8K_kbyrcBew@mail.gmail.com>
In-Reply-To: <CANqU6Fc+Lm1dk4CnBpO_EkfSBFyWZ8msveqfD6V8K_kbyrcBew@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 28 Sep 2022 10:13:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCvjBJpu+hJq=ABH2LjHDAV_GeK=_0AjpmoRNHg7nVcmyw@mail.gmail.com>
Message-ID: <CANiDSCvjBJpu+hJq=ABH2LjHDAV_GeK=_0AjpmoRNHg7nVcmyw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] media: uvcvideo: implement UVC v1.5 ROI
To:     Yunke Cao <yunkec@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 29 Aug 2022 at 07:48, Yunke Cao <yunkec@google.com> wrote:
>
> Hi Laurent,
>
> Thanks for the review!
>
> On Thu, Aug 25, 2022 at 5:37 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Yunke,
> >
> > Thank you for the patch.
> >
> > On Tue, Jun 28, 2022 at 04:57:02PM +0900, Yunke Cao wrote:
> > > Implement support for ROI as described in UVC 1.5:
> > > 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > >
> > > ROI control is implemented using V4L2 control API as
> > > two uvc-specific controls:
> >
> > s/uvc/UVC/
> >
> > > V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> > >
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c   | 146 +++++++++++++++++++++++++++=
+-
> > >  drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
> > >  drivers/media/usb/uvc/uvcvideo.h   |   7 ++
> > >  include/uapi/linux/usb/video.h     |   1 +
> > >  include/uapi/linux/uvcvideo.h      |  13 +++
> > >  include/uapi/linux/v4l2-controls.h |   8 ++
> > >  6 files changed, 178 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> > > index 508ee04afbcd..00482269233a 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -355,6 +355,23 @@ static const struct uvc_control_info uvc_ctrls[]=
 =3D {
> > >               .flags          =3D UVC_CTRL_FLAG_GET_CUR
> > >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> > >       },
> > > +     /* UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get =
updated
> >
> >         /*
> >          * UVC_CTRL_...
> >
> > > +      * by sensors.
> > > +      * "This RoI should be the same as specified in most recent SET=
_CUR
> > > +      * except in the case where the =E2=80=98Auto Detect and Track=
=E2=80=99 and/or
> > > +      * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > > +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > > +      */
> > > +     {
> > > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +             .index          =3D 21,
> > > +             .size           =3D 10,
> > > +             .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FL=
AG_GET_CUR
> > > +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG=
_GET_MAX
> > > +                             | UVC_CTRL_FLAG_GET_DEF
> > > +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> > > +     },
> > >  };
> > >
> > >  static const u32 uvc_control_classes[] =3D {
> > > @@ -429,6 +446,64 @@ static void uvc_ctrl_set_rel_speed(struct uvc_co=
ntrol_mapping *mapping,
> > >       data[first+1] =3D min_t(int, abs(value), 0xff);
> > >  }
> > >
> > > +static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> > > +                          const struct uvc_rect *uvc_rect)
> > > +{
> > > +     v4l2_rect->top =3D uvc_rect->top;
> > > +     v4l2_rect->left =3D uvc_rect->left;
> > > +     v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > > +     v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> >
> > What happens if the device sends a bogus value with top > bottom or lef=
t
> > > right ?
> >
>
> Hmm. I didn't think of this.  I guess we should check and return -EINVAL.
>
> > > +}
> > > +
> > > +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> > > +                         const struct v4l2_rect *v4l2_rect)
> > > +{
> > > +     // Safely converts s32 and u32 to u16.
> >
> > C-style comments.
> >
> > > +     if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> > > +         v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> > > +         v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 |=
|
> > > +         v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
> > > +         v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> > > +         v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> > > +             return -ERANGE;
> >
> > Doesn't V4L2 adjust the control value instead ?
> >
>
> videoc-g-ext-ctrls.rst says
> " When the value is out of bounds drivers can choose to take the closest
> valid value or return an ERANGE error code, whatever seems more appropria=
te."
>
> I chose to return ERANGE because it's a bit easier. Is it acceptable?
>
> > > +
> > > +     uvc_rect->top =3D v4l2_rect->top;
> > > +     uvc_rect->left =3D v4l2_rect->left;
> > > +     uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
> > > +     uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_get_array_rect(struct uvc_control_mapping *mapping,
> > > +                           const u8 *data,  u8 *data_out)
> > > +{
> > > +     struct uvc_rect *uvc_rect;
> > > +
> > > +     if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> > > +             return -EINVAL;
> > > +     if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> > > +             return -EINVAL;
> > > +
> >
> > These checks should go to mapping creation time.
> >
> > > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> >
> > If the offset happens to not be a multiple of 2 bytes this will cause
> > unaligned accesses on some platforms.
> >
> > > +     uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
> >
> > Same here if not aligned on 4 bytes.
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_set_array_rect(struct uvc_control_mapping *mapping,
> > > +                           const u8 *data_in, u8 *data)
> > > +{
> > > +     struct uvc_rect *uvc_rect;
> > > +
> > > +     if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> > > +             return -EINVAL;
> > > +     if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> > > +             return -EINVAL;
> > > +
> >
> > Same here.
> >
> > > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> > > +     return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> > > +}
> > > +
> > >  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> > >       {
> > >               .id             =3D V4L2_CID_BRIGHTNESS,
> > > @@ -728,6 +803,26 @@ static const struct uvc_control_mapping uvc_ctrl=
_mappings[] =3D {
> > >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> > >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > >       },
> > > +     {
> > > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_REC=
T,
> > > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +             .size           =3D 64,
> >
> > sizeof(struct uvc_rect)
> >
> > > +             .offset         =3D 0,
> > > +             .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > > +             .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > > +             .get_array      =3D uvc_get_array_rect,
> > > +             .set_array      =3D uvc_set_array_rect,
> > > +     },
> > > +     {
> > > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUT=
O,
> > > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +             .size           =3D 16,
> > > +             .offset         =3D 64,
> > > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,

Now that we have a private control, we need to setup the name here for
both controls.


> > > +     },
> > >  };
> > >
> > >  /* -----------------------------------------------------------------=
-------
> > > @@ -1061,7 +1156,16 @@ static int __uvc_ctrl_get_compound_to_user(str=
uct uvc_control_mapping *mapping,
> > >       if (WARN_ON(!mapping->size % 8))
> > >               return -EINVAL;
> > >
> > > -     size =3D mapping->size / 8;
> > > +     switch (mapping->v4l2_type) {
> > > +     case V4L2_CTRL_TYPE_RECT:
> > > +             size =3D sizeof(struct v4l2_rect);
> >
> > Oohhh that sounds fragile. I'm worried we may be using mapping->size as
> > the V4L2 control size somewhere else.
> >
> > It would be safer to split the size field of uvc_control_mapping into a
> > v4l2_size and a uvc_size (or possibly data_size to match the v4l2_type
> > and data_type names) in a patch before this. This will force reviewing
> > all the users of the size field to check which size they need.
> >
>
> Thanks for the suggestion! That makes a lot of sense. I will try to imple=
ment
> this in the next version, and fix other places you pointed out.
>
> Best,
> Yunke
>
> > > +             break;
> > > +
> > > +     default:
> > > +             size =3D mapping->size / 8;
> > > +             break;
> > > +     }
> > > +
> > >       if (xctrl->size < size) {
> > >               xctrl->size =3D size;
> > >               return -ENOSPC;
> > > @@ -2578,6 +2682,40 @@ static void uvc_ctrl_prune_entity(struct uvc_d=
evice *dev,
> > >       }
> > >  }
> > >
> > > +static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_cont=
rol *ctrl)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev-=
>intfnum,
> > > +                          UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +                          uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > > +                          ctrl->info.size);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     /*
> > > +      * Most firmwares have wrong GET_CURRENT configuration. E.g. it=
's
> >
> > s/GET_CURRENT/GET_CUR/
> >
> > > +      * below GET_MIN, or have rectangle coordinates mixed up. This
> > > +      * causes problems sometimes, because we are unable to set
> > > +      * auto-controls value without first setting ROI rectangle to
> > > +      * valid configuration.
> > > +      *
> > > +      * We expect that default configuration is always correct and
> > > +      * is within the GET_MIN / GET_MAX boundaries.
> >
> > A dangerous expectation to make given the quality of most UVC camera
> > firmwares...
> >
> > > +      *
> > > +      * Set current ROI configuration to GET_DEF, so that we will
> > > +      * always have properly configured ROI.
> > > +      */
> > > +     ret =3D uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
> > > +                          UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +                          uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > > +                          ctrl->info.size);
> > > +out:
> > > +     if (ret)
> > > +             dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n",=
 ret);
> >
> > s/(%d)./(%d)/
> >
> > > +     return ret;
> > > +}
> > > +
> > >  /*
> > >   * Add control information and hardcoded stock control mappings to t=
he given
> > >   * device.
> > > @@ -2590,6 +2728,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video=
_chain *chain,
> > >       const struct uvc_control_mapping *mapping =3D uvc_ctrl_mappings=
;
> > >       const struct uvc_control_mapping *mend =3D
> > >               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > > +     const u8 camera_entity[16] =3D UVC_GUID_UVC_CAMERA;
> > >
> > >       /* XU controls initialization requires querying the device for =
control
> > >        * information. As some buggy UVC devices will crash when queri=
ed
> > > @@ -2610,6 +2749,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_vide=
o_chain *chain,
> > >                        * GET_INFO on standard controls.
> > >                        */
> > >                       uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->inf=
o);
> > > +
> > > +                     if (ctrl->info.selector =3D=3D
> > > +                             UVC_CT_REGION_OF_INTEREST_CONTROL &&
> > > +                         uvc_entity_match_guid(ctrl->entity, camera_=
entity))
> > > +                             uvc_ctrl_init_roi(chain->dev, ctrl);
> >
> > Should we instead add an init operation to the uvc_control_info
> > structure ?
> >
> > >                       break;
> > >                }
> > >       }
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc=
/uvc_v4l2.c
> > > index 0366d05895a9..aad61af36271 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -998,7 +998,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file =
*file, void *fh,
> > >       qec->step =3D qc.step;
> > >       qec->default_value =3D qc.default_value;
> > >       qec->flags =3D qc.flags;
> > > -     qec->elem_size =3D 4;
> > > +     if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
> > > +             qec->elem_size =3D sizeof(struct v4l2_rect);
> > > +     else
> > > +             qec->elem_size =3D 4;
> > >       qec->elems =3D 1;
> > >       qec->nr_of_dims =3D 0;
> > >       memset(qec->dims, 0, sizeof(qec->dims));
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc=
/uvcvideo.h
> > > index 2f9b75faae83..9ff95bbad251 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -431,6 +431,13 @@ struct uvc_streaming_header {
> > >       u8 bTriggerUsage;
> > >  };
> > >
> > > +struct uvc_rect {
> > > +     u16 top;
> > > +     u16 left;
> > > +     u16 bottom;
> > > +     u16 right;
> > > +} __packed;
> > > +
> > >  enum uvc_buffer_state {
> > >       UVC_BUF_STATE_IDLE      =3D 0,
> > >       UVC_BUF_STATE_QUEUED    =3D 1,
> > > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/=
video.h
> > > index bfdae12cdacf..9076a444758a 100644
> > > --- a/include/uapi/linux/usb/video.h
> > > +++ b/include/uapi/linux/usb/video.h
> > > @@ -104,6 +104,7 @@
> > >  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                 0x0f
> > >  #define UVC_CT_ROLL_RELATIVE_CONTROL                 0x10
> > >  #define UVC_CT_PRIVACY_CONTROL                               0x11
> > > +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
> > >
> > >  /* A.9.5. Processing Unit Control Selectors */
> > >  #define UVC_PU_CONTROL_UNDEFINED                     0x00
> > > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvi=
deo.h
> > > index 8288137387c0..e2feee15cb1b 100644
> > > --- a/include/uapi/linux/uvcvideo.h
> > > +++ b/include/uapi/linux/uvcvideo.h
> > > @@ -16,6 +16,7 @@
> > >  #define UVC_CTRL_DATA_TYPE_BOOLEAN   3
> > >  #define UVC_CTRL_DATA_TYPE_ENUM              4
> > >  #define UVC_CTRL_DATA_TYPE_BITMASK   5
> > > +#define UVC_CTRL_DATA_TYPE_RECT              6
> > >
> > >  /* Control flags */
> > >  #define UVC_CTRL_FLAG_SET_CUR                (1 << 0)
> > > @@ -36,6 +37,18 @@
> > >        UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
> > >        UVC_CTRL_FLAG_GET_DEF)
> > >
> > > +/* V4L2 private controls */
> > > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_CAMERA_UVC_BA=
SE + 1)
> > > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_CAMERA_UVC_BA=
SE + 2)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0=
)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                       =
 (1 << 1)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE              =
 (1 << 2)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                      =
 (1 << 3)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4=
)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5=
)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6=
)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY             =
 (1 << 7)
> > > +
> > >  struct uvc_menu_info {
> > >       __u32 value;
> > >       __u8 name[32];
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index dfff69ed88f7..d85be46e46f2 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1013,6 +1013,14 @@ enum v4l2_auto_focus_range {
> > >
> > >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMER=
A_CLASS_BASE+35)
> > >
> > > +/* CAMERA-class private control IDs */
> > > +
> >
> > Why doesn't this go in the driver-specific controls range ?
> >
> > > +/*
> > > + * The base for the uvc driver controls. See linux/uvcvideo.h for th=
e list
> > > + * of controls. We reserve 16 controls for this driver.
> >
> > I'd reserve more just in case, UVC 1.5 has quite a few controls that ma=
y
> > not be exposed through standard V4L2 controls, especially for encoding
> > units.
> >
> > > + */
> > > +#define V4L2_CID_CAMERA_UVC_BASE             (V4L2_CID_CAMERA_CLASS_=
BASE + 0x1000)
> > > +
> > >  /* FM Modulator class control IDs */
> > >
> > >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX =
| 0x900)
> >
> > --
> > Regards,
> >
> > Laurent Pinchart



--=20
Ricardo Ribalda
