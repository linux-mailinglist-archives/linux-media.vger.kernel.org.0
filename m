Return-Path: <linux-media+bounces-22771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747059E6838
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032981882904
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F1A1DE2DA;
	Fri,  6 Dec 2024 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IZJjqr6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62D197548
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471435; cv=none; b=Iqx2Q9l6Xfu5xX1Aa1gVR/+i0BlndnLzBz2t8rhOGVtUAzxIrueEJfGtTFTQowgVttv7H7A62l7qmzKCXwwQ1FJFNtvai6w4ablGe+9RzlgZ9P80wj7tIpFm3HkaFVvNG3100ka/9q0mKb2dMjbT1VsTPT3CgAp5YyvO6jYTOAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471435; c=relaxed/simple;
	bh=0/bGdqNKLoQiAH+hrlqvfT5nJ5UgX8BIUYgKzYJ9oyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyzDBK1VglmwaIJZURAQBRRtr3LQIp1AyNTO8tiApTlPAKHxgd08ppQCPvAzV/ktTQGRkVlJN99s52LzvNj1ArO6Qw3r+95evw4HTdsFoz2fJB5zTbmpEvDkcyBB5ykOayLv+Yb9af5eKG7kfG1i9VDosKTwoGTbRPa3N1PnEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IZJjqr6W; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e398823d6aaso3040211276.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 23:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733471433; x=1734076233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSDDb5mERFCo0QwZbL44X5fUrxXmtfvA55jO0duSp/c=;
        b=IZJjqr6WTy9wuFar6UUD/io8kU3Xw/SgmlG1KVv5HY4R5jjj9BnGALg+LVbNt0bOWR
         NECPmFo0GSoarYIgtrIO50egk3IvaqTVy44k3lO/BW94F1ENSrw1PGapyCNf6ZgHAHqe
         4U62aPS0X7w96nI92+ESlgG1Qw7SBnjfnNiE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471433; x=1734076233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSDDb5mERFCo0QwZbL44X5fUrxXmtfvA55jO0duSp/c=;
        b=OsBg++J2BD5r6a5gV5TU4quJD4sbIP1v8gEutOjCQBQrtgEplL+HzA7c7XKCqx0cPq
         2yogLRPsRR338HKPy1R65HLmkwrI+aCZC4efV+iug2R3ko3UMbrn/3rZmcMCPxAubSC1
         yOccxvivzHpyJCmykJhxxi8N0jq4QAUOjL2VykVvfHRqwYpZm1kqdV9TpFGKf2yKE859
         l2wWmYhVIhEoS3WaOwiePS3z2esyojzjv1PGKTjbav+xyXoETMYTWDnPGWc38e8tUuAh
         PjnBwGTek1KP0TpVzGVyd+hXQ++UMLdmhN60Dhh5MfjTIz1O2IqTyuzlsYxPtqIxvCUv
         hn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIwnK9Wo3yGOZcRCiYdjW/ZwSH+UkeI+oKFHYNNEaqncOLQf9eA3DS3Ao79ShOW/geQlpjh/TbQNv1fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUY/QBa6gNBP2qHunMAwLl2IW/uaGpXrnPgWJuWhOR0Jau4cK
	aNSx48q9dBGwn36Igz3rfaAp5w/+NoXUttDWnTUWWv/I6+VmdA4/CftvX6tUEd5dpEs3Xfx3t3p
	fwU6q9GavxD9s8Xias0KCDSam9WW+z457EzLe
X-Gm-Gg: ASbGncszmogfz8Dv0nyfSLRzweX/+sy8n527Ha0AOACLAOpxpjWycGLGGXzuF+/BsLn
	3d4+BQPMZhgDJTNBQm9ySKCKKQAidtlE=
X-Google-Smtp-Source: AGHT+IFSH81RY4uPbb86gYbn/M8FDXsXAYp1DmvC2oEOFy7Z1BbfZIiiJhpyOO66Io4DOGB2qdFKSY2ZU9iaNhKvsZ4=
X-Received: by 2002:a05:690c:4609:b0:6ea:88d4:fd4f with SMTP id
 00721157ae682-6efe3962965mr16664387b3.18.1733471432844; Thu, 05 Dec 2024
 23:50:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <CANqU6Fdu2dg+1RADfOFG=3M6sLDgMuQZJMv1Vb46pnhLbR1ttA@mail.gmail.com>
 <CANiDSCtQXrgRx-uoSMynN8Os0TA_FFY8zDwnharyzP-cXSjVKA@mail.gmail.com>
In-Reply-To: <CANiDSCtQXrgRx-uoSMynN8Os0TA_FFY8zDwnharyzP-cXSjVKA@mail.gmail.com>
From: Yunke Cao <yunkec@chromium.org>
Date: Fri, 6 Dec 2024 16:50:22 +0900
Message-ID: <CAEDqmY6yS2dLKs8TuM7gYHw1MqL6JL_QEzUQDmCAudnCKDncDA@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 6:26=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> On Mon, 2 Dec 2024 at 09:02, Yunke Cao <yunkec@google.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for the new version!!
> >
> > On Fri, Nov 15, 2024 at 4:11=E2=80=AFAM Ricardo Ribalda <ribalda@chromi=
um.org> wrote:
> > >
> > > From: Yunke Cao <yunkec@google.com>
> > >
> > > Implement support for ROI as described in UVC 1.5:
> > > 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > >
> > > ROI control is implemented using V4L2 control API as
> > > two UVC-specific controls:
> > > V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> > >
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++=
++++++++++
> > >  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
> > >  include/uapi/linux/usb/video.h     |  1 +
> > >  include/uapi/linux/uvcvideo.h      | 13 ++++++
> > >  include/uapi/linux/v4l2-controls.h |  9 +++++
> > >  5 files changed, 111 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> > > index f262e05ad3a8..5b619ef40dd3 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[]=
 =3D {
> > >                 .flags          =3D UVC_CTRL_FLAG_GET_CUR
> > >                                 | UVC_CTRL_FLAG_AUTO_UPDATE,
> > >         },
> > > +       /*
> > > +        * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may ge=
t updated
> > > +        * by sensors.
> > > +        * "This RoI should be the same as specified in most recent S=
ET_CUR
> > > +        * except in the case where the =E2=80=98Auto Detect and Trac=
k=E2=80=99 and/or
> > > +        * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > > +        * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > > +        */
> > > +       {
> > > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL=
,
> > > +               .index          =3D 21,
> > > +               .size           =3D 10,
> > > +               .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_=
FLAG_GET_CUR
> > > +                               | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FL=
AG_GET_MAX
> > > +                               | UVC_CTRL_FLAG_GET_DEF
> > > +                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> > > +       },
> > >  };
> > >
> > >  static const u32 uvc_control_classes[] =3D {
> > > @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctr=
l_filter_plf_mapping(
> > >         return out_mapping;
> > >  }
> > >
> > > +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 quer=
y,
> > > +                       const void *uvc_in, size_t v4l2_size, void *v=
4l2_out)
> > > +{
> > > +       const struct uvc_rect *uvc_rect =3D uvc_in;
> > > +       struct v4l2_rect *v4l2_rect =3D v4l2_out;
> > > +
> > > +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > > +               return -EINVAL;
> > > +
> > > +       if (uvc_rect->left > uvc_rect->right ||
> > > +           uvc_rect->top > uvc_rect->bottom)
> > > +               return -EIO;
> > > +
> > > +       v4l2_rect->top =3D uvc_rect->top;
> > > +       v4l2_rect->left =3D uvc_rect->left;
> > > +       v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > > +       v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t =
v4l2_size,
> > > +                       const void *v4l2_in, void *uvc_out)
> > > +{
> > > +       struct uvc_rect *uvc_rect =3D uvc_out;
> > > +       const struct v4l2_rect *v4l2_rect =3D v4l2_in;
> > > +
> > > +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > > +               return -EINVAL;
> > > +
> > > +       uvc_rect->top =3D max(0xffff, v4l2_rect->top);
> > > +       uvc_rect->left =3D max(0xffff, v4l2_rect->left);
> > > +       uvc_rect->bottom =3D max(0xffff, v4l2_rect->height + v4l2_rec=
t->top - 1);
> > > +       uvc_rect->right =3D max(0xffff, v4l2_rect->width + v4l2_rect-=
>left - 1);
> >
> > Should these be min()?
>
> Ups :).
>
> Fixed in the next version.
>
> Thanks!

I've tested the patchset with this fix on Chrome OS and verified ROI
works as expected.

Reviewed-by: Yunke Cao <yunkec@google.com>
Tested-by: Yunke Cao <yunkec@google.com>

>
> >
> > >
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> > >         {
> > >                 .id             =3D V4L2_CID_BRIGHTNESS,
> > > @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl=
_mappings[] =3D {
> > >                 .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTR=
OL,
> > >                 .filter_mapping =3D uvc_ctrl_filter_plf_mapping,
> > >         },
> > > +       {
> > > +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_R=
ECT,
> > > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL=
,
> > > +               .size           =3D sizeof(struct uvc_rect) * 8,
> > > +               .offset         =3D 0,
> > > +               .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > > +               .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > > +               .get            =3D uvc_get_rect,
> > > +               .set            =3D uvc_set_rect,
> > > +               .name           =3D "Region Of Interest Rectangle",
> > > +       },
> > > +       {
> > > +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_A=
UTO,
> > > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL=
,
> > > +               .size           =3D 16,
> > > +               .offset         =3D 64,
> > > +               .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > > +               .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > > +               .name           =3D "Region Of Interest Auto Controls=
",
> > > +       },
> > >  };
> > >
> > >  /* -----------------------------------------------------------------=
-------
> > > @@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uv=
c_video_chain *chain,
> > >
> > >  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapp=
ing)
> > >  {
> > > +       if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_RECT)
> > > +               return sizeof(struct v4l2_rect);
> > > +
> > >         if (uvc_ctrl_mapping_is_compound(mapping))
> > >                 return DIV_ROUND_UP(mapping->size, 8);
> > >
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc=
/uvcvideo.h
> > > index 8aca1a2fe587..d910a5e5b514 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -294,6 +294,13 @@ struct uvc_streaming_header {
> > >         u8 bTriggerUsage;
> > >  };
> > >
> > > +struct uvc_rect {
> > > +       u16 top;
> > > +       u16 left;
> > > +       u16 bottom;
> > > +       u16 right;
> > > +} __packed;
> > > +
> > >  enum uvc_buffer_state {
> > >         UVC_BUF_STATE_IDLE      =3D 0,
> > >         UVC_BUF_STATE_QUEUED    =3D 1,
> > > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/=
video.h
> > > index 2ff0e8a3a683..2afb4420e6c4 100644
> > > --- a/include/uapi/linux/usb/video.h
> > > +++ b/include/uapi/linux/usb/video.h
> > > @@ -104,6 +104,7 @@
> > >  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
> > >  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
> > >  #define UVC_CT_PRIVACY_CONTROL                         0x11
> > > +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
> > >
> > >  /* A.9.5. Processing Unit Control Selectors */
> > >  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> > > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvi=
deo.h
> > > index f86185456dc5..cbe15bca9569 100644
> > > --- a/include/uapi/linux/uvcvideo.h
> > > +++ b/include/uapi/linux/uvcvideo.h
> > > @@ -16,6 +16,7 @@
> > >  #define UVC_CTRL_DATA_TYPE_BOOLEAN     3
> > >  #define UVC_CTRL_DATA_TYPE_ENUM                4
> > >  #define UVC_CTRL_DATA_TYPE_BITMASK     5
> > > +#define UVC_CTRL_DATA_TYPE_RECT                6
> > >
> > >  /* Control flags */
> > >  #define UVC_CTRL_FLAG_SET_CUR          (1 << 0)
> > > @@ -38,6 +39,18 @@
> > >
> > >  #define UVC_MENU_NAME_LEN 32
> > >
> > > +/* V4L2 driver-specific controls */
> > > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT   (V4L2_CID_USER_UVC_BA=
SE + 1)
> > > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO   (V4L2_CID_USER_UVC_BA=
SE + 2)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 <<=
 0)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                  (1 <<=
 1)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 <<=
 2)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                 (1 <<=
 3)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 <<=
 4)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 <<=
 5)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION   (1 <<=
 6)
> > > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY             =
   (1 << 7)
> > > +
> > >  struct uvc_menu_info {
> > >         __u32 value;
> > >         __u8 name[UVC_MENU_NAME_LEN];
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index 974fd254e573..6c91d6fa4708 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -215,6 +215,13 @@ enum v4l2_colorfx {
> > >   */
> > >  #define V4L2_CID_USER_THP7312_BASE             (V4L2_CID_USER_BASE +=
 0x11c0)
> > >
> > > +/*
> > > + * The base for the uvc driver controls.
> > > + * See linux/uvcvideo.h for the list of controls.
> > > + * We reserve 64 controls for this driver.
> > > + */
> > > +#define V4L2_CID_USER_UVC_BASE                 (V4L2_CID_USER_BASE +=
 0x11e0)
> > > +
> > >  /* MPEG-class control IDs */
> > >  /* The MPEG controls are applicable to all codec controls
> > >   * and the 'MPEG' part of the define is historical */
> > > @@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
> > >
> > >  #define V4L2_CID_HDR_SENSOR_MODE               (V4L2_CID_CAMERA_CLAS=
S_BASE+36)
> > >
> > > +/* CAMERA-class private control IDs */
> > > +
> >
> > Do we still need this comment?
> >
> > Best,
> > Yunke
> >
> > >  /* FM Modulator class control IDs */
> > >
> > >  #define V4L2_CID_FM_TX_CLASS_BASE              (V4L2_CTRL_CLASS_FM_T=
X | 0x900)
> > >
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
>
>
>
> --
> Ricardo Ribalda

