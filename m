Return-Path: <linux-media+bounces-22411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A29DFD0A
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDEC5162406
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A171FA24A;
	Mon,  2 Dec 2024 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RvHon0Tb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3C1F9F63
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131588; cv=none; b=Hop+wXsxmOWJdJStbARs14x/wS70yVVY0P1yemC+l23JgiFI80xUPBzq3kf6RkTIUDvJcHFcdEIdtPYNgkhGFbTQQ8Ry6GPQ8HxeWCziAAaPXY9b7PPA8oomz65VsHWOyrntDZzxDsGEH/biLxPQEH55EyIGU0Skjcv/3idg13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131588; c=relaxed/simple;
	bh=r9cYLSmBXLNISePRM6MZyEP6Az5SStlNGJTRxbLVSCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMKv/QNN2ImgDYGKQP6C0gCgKFPr2+mvgCIj0rSCmZZsTRbbfOeDH2Y4BWAI4kZyakK9w54CwKZWJzZDYCFlpX1h2v95C+FJnrF23oez49CDDqfOXTT1iEBbExEzGoVNwHs7qklXe3RPFZPNvDGXPrHKdRUfb6b0M3u5x1760SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RvHon0Tb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21539e1d09cso34114655ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733131585; x=1733736385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKScqxNmeJweUdnYkdvjKwl5NOq5sz+lX2p9egBtJis=;
        b=RvHon0TbhNx+wvcZ7DFURiQMV+RmbSr+TMwNYza+ZGaJP1OQ4Ami/0gqtF1/qtjoAg
         aurkS/k1cMj31aZNICosxtAtN0ygkVJpumKBDX6SlLdjhxRnQACpznft2XRDuoaW4FBJ
         mwJh20GqvaZeWa6CpVOvUwRwBr9gbe6zovIKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131585; x=1733736385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKScqxNmeJweUdnYkdvjKwl5NOq5sz+lX2p9egBtJis=;
        b=gnagTW96dX7UiqHav9yw/0lV/Zw0NTcr4dC0o6Nj2WKrUSUT5H9cw6dqq7pqsJwwLG
         xBma+x3Qv8c3v4EocXYRrt0apCbyIiYwvvI+XrsBWEv53TZo5C8rPq2k4eNth07yyF7I
         SOgKeRj6O3TBmP7dI7Iq8PAjGti/Cf2C/fqJ5k3sPJMp+ygEKxqnEcxpDzhOgCl5prQT
         YgSj8dySRip4Ry7tgjlQntQE3UL4FODJO4kQ623dOJ5ZSBSSOqvz8U2VgeZAUaYijr4W
         MftneZAsD/7BWfAf2DsYNYBzdq7kS4Em9ZWZrR3AWW88XV8vKctKy+IyYgxke10+BUGG
         Ybsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPV/19WN+coqtQnboFV4xyGq2ZqqEvOSdv358KSCO0vVsA7KPpoB2ekk2e6yO395j/kVOysVbZVfcJNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/WyM1oZw9xvs+KfVJd2Xw30q7XzfDiTksDcnieEyNNrcvGgn
	zC0YiVCcRCQZTzbF0PsQonN7CB5aQhlTgyokYZ/IqsnX+dq5pPVFieh4ZqvgBAUHTFV7hOQN/lg
	=
X-Gm-Gg: ASbGnctxU4wOnjOCTdgzNMrl0qJAyZiYTGLtY56CJnctpO0XU4RMtD4fDd4yA/IYxWL
	7vU24a0zWRSLAcrrFBkbhPsCqRHE6OyFDG5qbyfMPwxuLVYber3v9/sG9CtcreeL7sfZQZj/PSY
	olOToWI0RWbsFju1WCuDj9YYZN50zKhz1qIdco2lDP40Iv5zE4vZUSLGuQbfy2vEM+1sN+XT8O6
	DmCvjAtwO9P8z97Tw1R9L3LJUAAQpdr39HW8Qab4EVhbZgK83hY7gHUWc6B+KhGKsfuKv8iZ3LL
	4Ns6TUaY/OCc
X-Google-Smtp-Source: AGHT+IGE2lxIlLNtAYWRABehGBeTSunXM2uvsbDivcEjW1yEVNJDHudBcEcHoYpgWBNaBrf7iSoYVw==
X-Received: by 2002:a17:902:f682:b0:20c:a44b:3221 with SMTP id d9443c01a7336-2150109b2b4mr253819525ad.15.1733131584752;
        Mon, 02 Dec 2024 01:26:24 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219672e7sm72518505ad.130.2024.12.02.01.26.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 01:26:23 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2eecc01b5ebso530129a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 01:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5S1yd9baT8aH65UeJ5ClUmePgJ+jJ0O3RRBrMhLua4mfMaJJI1IK/ojsNLsToH2CJRHEYiDhWuJFLIA==@vger.kernel.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:8abd:7254 with SMTP id
 98e67ed59e1d1-2ee8abd742amr9556792a91.36.1733131582873; Mon, 02 Dec 2024
 01:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <CANqU6Fdu2dg+1RADfOFG=3M6sLDgMuQZJMv1Vb46pnhLbR1ttA@mail.gmail.com>
In-Reply-To: <CANqU6Fdu2dg+1RADfOFG=3M6sLDgMuQZJMv1Vb46pnhLbR1ttA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 10:26:10 +0100
X-Gmail-Original-Message-ID: <CANiDSCtQXrgRx-uoSMynN8Os0TA_FFY8zDwnharyzP-cXSjVKA@mail.gmail.com>
Message-ID: <CANiDSCtQXrgRx-uoSMynN8Os0TA_FFY8zDwnharyzP-cXSjVKA@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Yunke Cao <yunkec@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Dec 2024 at 09:02, Yunke Cao <yunkec@google.com> wrote:
>
> Hi Ricardo,
>
> Thanks for the new version!!
>
> On Fri, Nov 15, 2024 at 4:11=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
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
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++=
++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
> >  include/uapi/linux/usb/video.h     |  1 +
> >  include/uapi/linux/uvcvideo.h      | 13 ++++++
> >  include/uapi/linux/v4l2-controls.h |  9 +++++
> >  5 files changed, 111 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index f262e05ad3a8..5b619ef40dd3 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] =
=3D {
> >                 .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >                                 | UVC_CTRL_FLAG_AUTO_UPDATE,
> >         },
> > +       /*
> > +        * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get =
updated
> > +        * by sensors.
> > +        * "This RoI should be the same as specified in most recent SET=
_CUR
> > +        * except in the case where the =E2=80=98Auto Detect and Track=
=E2=80=99 and/or
> > +        * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > +        * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > +        */
> > +       {
> > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +               .index          =3D 21,
> > +               .size           =3D 10,
> > +               .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FL=
AG_GET_CUR
> > +                               | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG=
_GET_MAX
> > +                               | UVC_CTRL_FLAG_GET_DEF
> > +                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> > +       },
> >  };
> >
> >  static const u32 uvc_control_classes[] =3D {
> > @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_=
filter_plf_mapping(
> >         return out_mapping;
> >  }
> >
> > +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
> > +                       const void *uvc_in, size_t v4l2_size, void *v4l=
2_out)
> > +{
> > +       const struct uvc_rect *uvc_rect =3D uvc_in;
> > +       struct v4l2_rect *v4l2_rect =3D v4l2_out;
> > +
> > +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > +               return -EINVAL;
> > +
> > +       if (uvc_rect->left > uvc_rect->right ||
> > +           uvc_rect->top > uvc_rect->bottom)
> > +               return -EIO;
> > +
> > +       v4l2_rect->top =3D uvc_rect->top;
> > +       v4l2_rect->left =3D uvc_rect->left;
> > +       v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > +       v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> > +
> > +       return 0;
> > +}
> > +
> > +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4=
l2_size,
> > +                       const void *v4l2_in, void *uvc_out)
> > +{
> > +       struct uvc_rect *uvc_rect =3D uvc_out;
> > +       const struct v4l2_rect *v4l2_rect =3D v4l2_in;
> > +
> > +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> > +               return -EINVAL;
> > +
> > +       uvc_rect->top =3D max(0xffff, v4l2_rect->top);
> > +       uvc_rect->left =3D max(0xffff, v4l2_rect->left);
> > +       uvc_rect->bottom =3D max(0xffff, v4l2_rect->height + v4l2_rect-=
>top - 1);
> > +       uvc_rect->right =3D max(0xffff, v4l2_rect->width + v4l2_rect->l=
eft - 1);
>
> Should these be min()?

Ups :).

Fixed in the next version.

Thanks!

>
> >
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >         {
> >                 .id             =3D V4L2_CID_BRIGHTNESS,
> > @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_m=
appings[] =3D {
> >                 .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL=
,
> >                 .filter_mapping =3D uvc_ctrl_filter_plf_mapping,
> >         },
> > +       {
> > +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_REC=
T,
> > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +               .size           =3D sizeof(struct uvc_rect) * 8,
> > +               .offset         =3D 0,
> > +               .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > +               .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > +               .get            =3D uvc_get_rect,
> > +               .set            =3D uvc_set_rect,
> > +               .name           =3D "Region Of Interest Rectangle",
> > +       },
> > +       {
> > +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUT=
O,
> > +               .entity         =3D UVC_GUID_UVC_CAMERA,
> > +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +               .size           =3D 16,
> > +               .offset         =3D 64,
> > +               .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > +               .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > +               .name           =3D "Region Of Interest Auto Controls",
> > +       },
> >  };
> >
> >  /* -------------------------------------------------------------------=
-----
> > @@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_=
video_chain *chain,
> >
> >  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mappin=
g)
> >  {
> > +       if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_RECT)
> > +               return sizeof(struct v4l2_rect);
> > +
> >         if (uvc_ctrl_mapping_is_compound(mapping))
> >                 return DIV_ROUND_UP(mapping->size, 8);
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 8aca1a2fe587..d910a5e5b514 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -294,6 +294,13 @@ struct uvc_streaming_header {
> >         u8 bTriggerUsage;
> >  };
> >
> > +struct uvc_rect {
> > +       u16 top;
> > +       u16 left;
> > +       u16 bottom;
> > +       u16 right;
> > +} __packed;
> > +
> >  enum uvc_buffer_state {
> >         UVC_BUF_STATE_IDLE      =3D 0,
> >         UVC_BUF_STATE_QUEUED    =3D 1,
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vi=
deo.h
> > index 2ff0e8a3a683..2afb4420e6c4 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -104,6 +104,7 @@
> >  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
> >  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
> >  #define UVC_CT_PRIVACY_CONTROL                         0x11
> > +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
> >
> >  /* A.9.5. Processing Unit Control Selectors */
> >  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvide=
o.h
> > index f86185456dc5..cbe15bca9569 100644
> > --- a/include/uapi/linux/uvcvideo.h
> > +++ b/include/uapi/linux/uvcvideo.h
> > @@ -16,6 +16,7 @@
> >  #define UVC_CTRL_DATA_TYPE_BOOLEAN     3
> >  #define UVC_CTRL_DATA_TYPE_ENUM                4
> >  #define UVC_CTRL_DATA_TYPE_BITMASK     5
> > +#define UVC_CTRL_DATA_TYPE_RECT                6
> >
> >  /* Control flags */
> >  #define UVC_CTRL_FLAG_SET_CUR          (1 << 0)
> > @@ -38,6 +39,18 @@
> >
> >  #define UVC_MENU_NAME_LEN 32
> >
> > +/* V4L2 driver-specific controls */
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT   (V4L2_CID_USER_UVC_BASE=
 + 1)
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO   (V4L2_CID_USER_UVC_BASE=
 + 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION   (1 << 6=
)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY               =
 (1 << 7)
> > +
> >  struct uvc_menu_info {
> >         __u32 value;
> >         __u8 name[UVC_MENU_NAME_LEN];
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 974fd254e573..6c91d6fa4708 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -215,6 +215,13 @@ enum v4l2_colorfx {
> >   */
> >  #define V4L2_CID_USER_THP7312_BASE             (V4L2_CID_USER_BASE + 0=
x11c0)
> >
> > +/*
> > + * The base for the uvc driver controls.
> > + * See linux/uvcvideo.h for the list of controls.
> > + * We reserve 64 controls for this driver.
> > + */
> > +#define V4L2_CID_USER_UVC_BASE                 (V4L2_CID_USER_BASE + 0=
x11e0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
> > @@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE               (V4L2_CID_CAMERA_CLASS_=
BASE+36)
> >
> > +/* CAMERA-class private control IDs */
> > +
>
> Do we still need this comment?
>
> Best,
> Yunke
>
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE              (V4L2_CTRL_CLASS_FM_TX =
| 0x900)
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--=20
Ricardo Ribalda

