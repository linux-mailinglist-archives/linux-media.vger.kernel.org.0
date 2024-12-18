Return-Path: <linux-media+bounces-23728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77049F6F35
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F76E7A22AA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632EF1FC7FA;
	Wed, 18 Dec 2024 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="idIyGcj/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA61FC0E9
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734555973; cv=none; b=St+bfLI5eSxSh94qC5SkNfRLmB20ExafwakJY9sQSG+9MLHkHU2TsUQxQ5p4KRvXAUC76dPC6mzYOxUuKwSnp4IDnEV/0OGXcMMNoQVzoTyjVPMoviryc2Xzj+nwCkX4bJ7t/ZRgmPEa4erY1sZ9VRf6abdsG7Rf1f34nplD6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734555973; c=relaxed/simple;
	bh=gzc8m70UHtorm0p3yBuIEagSXPSMv201uUaBiV6a/E4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmDoIPfQlZr/Sy0ugGmRx/PLcWhkyLwo/lFWsk9d22zwc6mZZktTJPdmJRjEs4c30EQNMOiCCOntgLZuVu1rxyAHNnPmM6XBtRvzFY4nFGOyNnD4/cBSMe0eP2a8albyyOF0Ccgaff90sdLNhyKJO6W/KXQZyAImXul5lY3vFGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=idIyGcj/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so83163a91.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734555971; x=1735160771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VwKevi7WKaUvgvlhQbOqDcEg3Qhnfk10+cH4cG4zi8=;
        b=idIyGcj/6QBHPlXpMeuVLyc5wue4nRfby9L7oOOyX1zi4T3EhOPX4LaQSLyaWXCIom
         /bO+6sQQpk1JcOPPZALVMmoQz8RlH/lTGFr+oytKmP1Zw8hxyp9xbyjKhirY70BA8Sc+
         OGkwjLTGFlzMM9GaRTUD5EwbIVvvbSILNoimQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555971; x=1735160771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VwKevi7WKaUvgvlhQbOqDcEg3Qhnfk10+cH4cG4zi8=;
        b=cNxCt0jsAiayluBf4pDmkShA59ZOSxLxrxWS5ZuUHLZS4Pi4+dRmmKURdrEB4uY8rU
         jjyQbgxMcG7xK3LwZcn79W4/x1AIRWrl/E4wjxNFtxDaAYSRvsY/F6URzbR6UaMkPNvU
         D/LnwIpMqY6aCOIn36URUNB7IHhpQgYRoac+N23ONL/ydD2jTLNEFbFV/jnnc3uZlCLX
         t6TD5WI3U3PdKD21PjJmFFRgPzbZzfgpISxfw65+Yyg9X0RWZJbcUJ8Ikno8QnNibpa0
         rlbVMiTq6rqx17+cw+y4hEn2wKb+50edxoVMQ3FIkuJtDoj4j4m52+lcHnXsmuRFENj0
         UuWg==
X-Forwarded-Encrypted: i=1; AJvYcCUPH7bvyj+BZpeaEPp1+msIBFL8ia3Yf+okq16dC5j6d25ExgAVcXOTZBNicPgUiRI5ZaAwLXhoQSdUlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKAXOXS8R0PYDbSzTw3HTgn2vp2mkgSJCTbu09LVLN/5A3Cya
	tqRee0xFVJZrcnFuTGyxN6iYNbMlADiq/LK5PAaJmvyfTGz+D12CtWljYRz4kpLNhRxQCr1qxeQ
	=
X-Gm-Gg: ASbGncv7JYD3JbqJka+lY1fY6T7AqA/WdH/sLtDawHFJM3kUOKu0RrymTcGM06xdUby
	KeRMLdPt1MBvLzGJT80EjSE8ESFWyL3QirlggKH0pg4VzRdLGJTC1vM4n8ZwTovNCh3+JbKqWNV
	23k7OrkSdhWSPsIpMppAVZQy05bnQF90JnGD1zxqDBJcCzDIAHQWG6C/v78GonAlW8MSgoYHE5W
	zG3YO9eS04ettK6NReh+zhtf9ECCU/henugc9TXLo07ULfsPFoufYGr4cwoXK8tEaZR7SBoLKlU
	pZLlyxo1oxSONL03+68=
X-Google-Smtp-Source: AGHT+IFR5lg2+4tQaAKiz7i8zQ+q+SUL6xbHjqPo6HeI9uCNKIFu/zKg3fjPzYkE90blxnVYs39SEg==
X-Received: by 2002:a17:90b:4f:b0:2f2:8bdd:cd8b with SMTP id 98e67ed59e1d1-2f2e9375547mr6554960a91.29.1734555971152;
        Wed, 18 Dec 2024 13:06:11 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218d31fde88sm22729225ad.231.2024.12.18.13.06.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 13:06:08 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so81999a91.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:06:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUTzKfC8Ykpb2nG+jQfV0xvLhHHJpJDzrYJ4xhI3I6TcXLQIStcOflSzpoUvMw/FthgvnOUC0KvDFKkg==@vger.kernel.org
X-Received: by 2002:a17:90a:e7cb:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-2f2e91f10b8mr6869952a91.14.1734555967811; Wed, 18 Dec 2024
 13:06:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
 <20241210-uvc-roi-v16-17-e8201f7e8e57@chromium.org> <9837f93e-cc45-4927-b1bf-e3351400e699@redhat.com>
In-Reply-To: <9837f93e-cc45-4927-b1bf-e3351400e699@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 22:05:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCs0Cp3HoXEMVZ5tAFtJmUmDWC5yNW-+urJOt7YaV1T1aw@mail.gmail.com>
X-Gm-Features: AbW1kvZqeX6AoZH_08PGX4O-PI8LisDpYUphtvE56FrShMyv8BGIkiS0aE-9bIk
Message-ID: <CANiDSCs0Cp3HoXEMVZ5tAFtJmUmDWC5yNW-+urJOt7YaV1T1aw@mail.gmail.com>
Subject: Re: [PATCH v16 17/18] media: uvcvideo: implement UVC v1.5 ROI
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Dec 2024 at 22:02, Hans de Goede <hdegoede@redhat.com> wrote:
>
> p.s.
>
> On 10-Dec-24 10:42 AM, Ricardo Ribalda wrote:
> > From: Yunke Cao <yunkec@google.com>
> >
> > Implement support for ROI as described in UVC 1.5:
> > 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >
> > ROI control is implemented using V4L2 control API as
> > two UVC-specific controls:
> > V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > Reviewed-by: Yunke Cao <yunkec@google.com>
> > Tested-by: Yunke Cao <yunkec@google.com>
>
> I just noticed this is missing a:
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Ricardo, I assume it is ok if we add that while merging
> this series?
Sure, please do. Thanks!

To make b4 happy:
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>



>
> Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++=
++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
> >  include/uapi/linux/usb/video.h     |  1 +
> >  include/uapi/linux/uvcvideo.h      | 13 ++++++
> >  include/uapi/linux/v4l2-controls.h |  7 ++++
> >  5 files changed, 109 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index dd6129becf58..86ea24b10b54 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] =
=3D {
> >               .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     /*
> > +      * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
> > +      * by sensors.
> > +      * "This RoI should be the same as specified in most recent SET_C=
UR
> > +      * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> > +      * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > +      */
> > +     {
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .index          =3D 21,
> > +             .size           =3D 10,
> > +             .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> > +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> > +                             | UVC_CTRL_FLAG_GET_DEF
> > +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] =3D {
> > @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_=
filter_plf_mapping(
> >       return out_mapping;
> >  }
> >
> > +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
> > +                     const void *uvc_in, size_t v4l2_size, void *v4l2_=
out)
> > +{
> > +     const struct uvc_rect *uvc_rect =3D uvc_in;
> > +     struct v4l2_rect *v4l2_rect =3D v4l2_out;
> > +
> > +     if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > +             return -EINVAL;
> > +
> > +     if (uvc_rect->left > uvc_rect->right ||
> > +         uvc_rect->top > uvc_rect->bottom)
> > +             return -EIO;
> > +
> > +     v4l2_rect->top =3D uvc_rect->top;
> > +     v4l2_rect->left =3D uvc_rect->left;
> > +     v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > +     v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4=
l2_size,
> > +                     const void *v4l2_in, void *uvc_out)
> > +{
> > +     struct uvc_rect *uvc_rect =3D uvc_out;
> > +     const struct v4l2_rect *v4l2_rect =3D v4l2_in;
> > +
> > +     if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > +             return -EINVAL;
> > +
> > +     uvc_rect->top =3D min(0xffff, v4l2_rect->top);
> > +     uvc_rect->left =3D min(0xffff, v4l2_rect->left);
> > +     uvc_rect->bottom =3D min(0xffff, v4l2_rect->top + v4l2_rect->heig=
ht - 1);
> > +     uvc_rect->right =3D min(0xffff, v4l2_rect->left + v4l2_rect->widt=
h - 1);
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >       {
> >               .id             =3D V4L2_CID_BRIGHTNESS,
> > @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_m=
appings[] =3D {
> >               .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> >               .filter_mapping =3D uvc_ctrl_filter_plf_mapping,
> >       },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .size           =3D sizeof(struct uvc_rect) * 8,
> > +             .offset         =3D 0,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > +             .get            =3D uvc_get_rect,
> > +             .set            =3D uvc_set_rect,
> > +             .name           =3D "Region Of Interest Rectangle",
> > +     },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .size           =3D 16,
> > +             .offset         =3D 64,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > +             .name           =3D "Region Of Interest Auto Controls",
> > +     },
> >  };
> >
> >  /* -------------------------------------------------------------------=
-----
> > @@ -1473,6 +1551,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_=
video_chain *chain,
> >
> >  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mappin=
g)
> >  {
> > +     if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_RECT)
> > +             return sizeof(struct v4l2_rect);
> > +
> >       if (uvc_ctrl_mapping_is_compound(mapping))
> >               return DIV_ROUND_UP(mapping->size, 8);
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 8aca1a2fe587..17b79108599f 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -538,6 +538,13 @@ struct uvc_device_info {
> >       u16     uvc_version;
> >  };
> >
> > +struct uvc_rect {
> > +     u16 top;
> > +     u16 left;
> > +     u16 bottom;
> > +     u16 right;
> > +} __packed;
> > +
> >  struct uvc_status_streaming {
> >       u8      button;
> >  } __packed;
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vi=
deo.h
> > index 2ff0e8a3a683..2afb4420e6c4 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -104,6 +104,7 @@
> >  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                 0x0f
> >  #define UVC_CT_ROLL_RELATIVE_CONTROL                 0x10
> >  #define UVC_CT_PRIVACY_CONTROL                               0x11
> > +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
> >
> >  /* A.9.5. Processing Unit Control Selectors */
> >  #define UVC_PU_CONTROL_UNDEFINED                     0x00
> > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvide=
o.h
> > index f86185456dc5..cbe15bca9569 100644
> > --- a/include/uapi/linux/uvcvideo.h
> > +++ b/include/uapi/linux/uvcvideo.h
> > @@ -16,6 +16,7 @@
> >  #define UVC_CTRL_DATA_TYPE_BOOLEAN   3
> >  #define UVC_CTRL_DATA_TYPE_ENUM              4
> >  #define UVC_CTRL_DATA_TYPE_BITMASK   5
> > +#define UVC_CTRL_DATA_TYPE_RECT              6
> >
> >  /* Control flags */
> >  #define UVC_CTRL_FLAG_SET_CUR                (1 << 0)
> > @@ -38,6 +39,18 @@
> >
> >  #define UVC_MENU_NAME_LEN 32
> >
> > +/* V4L2 driver-specific controls */
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_USER_UVC_BASE +=
 1)
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_USER_UVC_BASE +=
 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                        (=
1 << 1)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (=
1 << 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                       (=
1 << 3)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (=
1 << 7)
> > +
> >  struct uvc_menu_info {
> >       __u32 value;
> >       __u8 name[UVC_MENU_NAME_LEN];
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 974fd254e573..72e32814ea83 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -215,6 +215,13 @@ enum v4l2_colorfx {
> >   */
> >  #define V4L2_CID_USER_THP7312_BASE           (V4L2_CID_USER_BASE + 0x1=
1c0)
> >
> > +/*
> > + * The base for the uvc driver controls.
> > + * See linux/uvcvideo.h for the list of controls.
> > + * We reserve 64 controls for this driver.
> > + */
> > +#define V4L2_CID_USER_UVC_BASE                       (V4L2_CID_USER_BA=
SE + 0x11e0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
> >
>


--=20
Ricardo Ribalda

