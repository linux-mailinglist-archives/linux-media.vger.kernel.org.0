Return-Path: <linux-media+bounces-27380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCBAA4C670
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 048CE189AB7C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AB222C35C;
	Mon,  3 Mar 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IyH28uLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5802215043
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018021; cv=none; b=tKPbdxWy+LUf/Prd8EbbMsfg9Dv4NGYx/2TYq0g+PvdSsNJ1JENZDa7Yno00gpm+02D52svcumjgEOZfbieVqfakOK0Vi9IijC37xY0GJPIuPcoteFDai5oJT7xZ0QYHDbEjB0ZsFjEphZTCcto6+BUY+zqTO5nNHG4waWcQn40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018021; c=relaxed/simple;
	bh=mdK/27T0th98lUj6AspCt9UHeaA7mmFvDrHNnOHvX+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fdjp1TP2ESXuJF/GZurJuq0cptyZX3p7LDWdXARjinE0WBvWP5BmewB4nkAF+8BjTH0NVqir4GH6NJjJSAJBmwxrYmi3eEGxPO9rb/MHRP5mBma+FQOAU0PlrYF4L8w0/T9yq85AvroYqntiAYZLrbxrbvm7uAOXCMRWpIqYQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IyH28uLf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5495e926364so1696919e87.3
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 08:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741018017; x=1741622817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40DjvY2Q0Md+RpT3LEzNMLKAE3HHwLHS4DZWO9wU3WQ=;
        b=IyH28uLfkMMdZfU1ISyb1ezw6LCC7VA3MJRm2y+/uJhI5UDYIvDejArKXNZLY95S11
         WsyXx+XsesuKGtZMdOfxoDcvTDNcmJufJXcARnmHwi/MA5nlpgR4w1Ghx6Xq2NzhayHI
         U4koTV/1r6NZ7xx1JDgrG4DDjnEs1rfSUckI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018017; x=1741622817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40DjvY2Q0Md+RpT3LEzNMLKAE3HHwLHS4DZWO9wU3WQ=;
        b=VBr+c45jw6fBTYmuFM/ljiU8sZIDpFpTx8IGaH5RRPtUqkz7bVVPy8kXt5ymBDMU0e
         T/P1hQcTRfeQiec4tzRNPyUw8Bw+Mk29BcZoPAuvxspCYFEsI4LZYfne8TKx1GSs6hmn
         LH8+h3nw02rlIGfG82EL+SFaq1QcIzvsFOqOR1+s9HUjepuPtCbto4rIixO92b8Up5u+
         oWhRk/XeT/IqlpxuoKbixk5TLNhNpKrUYavlvVQ9HkXKrT2Ph7smcol5OONA4vUupCv1
         VuwZdmnJEfgUvu0BzrZHCxTZDpeZGtNhfrmWwTwZH4bEbMOaxmP2HBHAkYvk4vNppsaO
         eGgg==
X-Forwarded-Encrypted: i=1; AJvYcCWPzpl78imtBpxdlb+rRMkOEdxIKFgsJB6yvR1E5umRX8uMEDwLVI0lXxeqyCUIP8p7U/Me8+GC/TNoiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hM2Ment1j04M1Fw4bfLuWv+uYquK3XLr1ZX5TXvm7j4XFfr8
	MnxIq9B8szkGXkGBD+NYO0VXErnDRKGmsN6tV533/6SZE1e0FIT40H1RiunVDLV9zwafILOwBeQ
	=
X-Gm-Gg: ASbGncuH4KYzUGqUs2g2YQfd8A83xTSyr8oS1xMRm6mb7O22MV8TuXbNAIpYg3iKdZR
	DgraOTn64Cdfe/hd44YgzYdpQBDlpoZ/1mxrXSQo02NKpZaTatORH+XbkGMo7zNxWJidJR6C9NV
	1qd+8LNCW3NN1caC9cOmKZPdK1NoHxzJWuTwU2N1MVl/i7/BgYIlxQ/mZBR6dELG1yJFifP1UyI
	z1X2B36j7/1yuMw0+LiLEJDJePN/mksRiHWqZAPrFRYEeLUz6viVdR5rA7Q3aoTwt+J8MIFE1IZ
	Zon53DeaTpQL4NQMigMdWqtSgomdsmSjmy4H50YZFi+nipoPWHeOWZl0CqiNggXjMRnFfC7IzHS
	e9EjzuR5goyI=
X-Google-Smtp-Source: AGHT+IFU7BY7YB3BIAsKVc1gxnSQJ2wBUsVtYvn6/fHVLUOvrYYT7bRB19X7CVqqu5IMFhmrLsRuxw==
X-Received: by 2002:a05:6512:3041:b0:549:3b4f:4b31 with SMTP id 2adb3069b0e04-5494c332c50mr5887517e87.39.1741018016589;
        Mon, 03 Mar 2025 08:06:56 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495cba23a1sm667274e87.16.2025.03.03.08.06.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:06:55 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30b9b1979b9so34077481fa.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 08:06:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLp1c0UhlKPCxtErfl4h06iYXe0VB8Vann+0L8kmcUuhs52Mxn2mW3jEvua/Q1uTntZJ2SUg5kkEGXXA==@vger.kernel.org
X-Received: by 2002:a2e:7007:0:b0:307:e498:1254 with SMTP id
 38308e7fff4ca-30b9331088bmr49290821fa.35.1741018014197; Mon, 03 Mar 2025
 08:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
 <20250203-uvc-roi-v17-16-5900a9fed613@chromium.org> <6944a221-b0b4-4042-9d4a-98a0cc806116@xs4all.nl>
 <5d229e8e-f4b9-4589-a978-e80848678e38@redhat.com> <43f528b5-2c0e-4154-9a7d-7d1003ac109b@xs4all.nl>
In-Reply-To: <43f528b5-2c0e-4154-9a7d-7d1003ac109b@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Mar 2025 17:06:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCv_XkU=1Uvfo5-xNiJB4WnMC8j-F-zFXXCLc0EVBYdxKw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq_H_21FJ6JSlT3Mcv1ujdN-koS2ynkuLhhzq78wF3Er0XL_3AUUQKaopY
Message-ID: <CANiDSCv_XkU=1Uvfo5-xNiJB4WnMC8j-F-zFXXCLc0EVBYdxKw@mail.gmail.com>
Subject: Re: [PATCH v17 16/17] media: uvcvideo: implement UVC v1.5 ROI
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Mar 2025 at 15:58, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 03/03/2025 15:02, Hans de Goede wrote:
> > Hi,
> >
> > On 3-Mar-25 14:32, Hans Verkuil wrote:
> >> Hans, Laurent, Yunke,
> >>
> >> On 03/02/2025 12:55, Ricardo Ribalda wrote:
> >>> From: Yunke Cao <yunkec@google.com>
> >>>
> >>> Implement support for ROI as described in UVC 1.5:
> >>> 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >>>
> >>> ROI control is implemented using V4L2 control API as
> >>> two UVC-specific controls:
> >>> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> >>> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >>>
> >>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> Reviewed-by: Yunke Cao <yunkec@google.com>
> >>> Tested-by: Yunke Cao <yunkec@google.com>
> >>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++=
++++++++++
> >>>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
> >>>  include/uapi/linux/usb/video.h     |  1 +
> >>>  include/uapi/linux/uvcvideo.h      | 13 ++++++
> >>>  include/uapi/linux/v4l2-controls.h |  7 ++++
> >>>  5 files changed, 109 insertions(+)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> >>> index 17a7ce525f71..1906ce5b7d50 100644
> >>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>> @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[]=
 =3D {
> >>>             .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >>>                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> >>>     },
> >>> +   /*
> >>> +    * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
> >>> +    * by sensors.
> >>> +    * "This RoI should be the same as specified in most recent SET_C=
UR
> >>> +    * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> >>> +    * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> >>> +    * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >>> +    */
> >>> +   {
> >>> +           .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +           .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +           .index          =3D 21,
> >>> +           .size           =3D 10,
> >>> +           .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> >>> +                           | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> >>> +                           | UVC_CTRL_FLAG_GET_DEF
> >>> +                           | UVC_CTRL_FLAG_AUTO_UPDATE,
> >>> +   },
> >>>  };
> >>>
> >>>  static const u32 uvc_control_classes[] =3D {
> >>> @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctr=
l_filter_plf_mapping(
> >>>     return out_mapping;
> >>>  }
> >>>
> >>> +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 quer=
y,
> >>> +                   const void *uvc_in, size_t v4l2_size, void *v4l2_=
out)
> >>> +{
> >>> +   const struct uvc_rect *uvc_rect =3D uvc_in;
> >>> +   struct v4l2_rect *v4l2_rect =3D v4l2_out;
> >>> +
> >>> +   if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> >>> +           return -EINVAL;
> >>> +
> >>> +   if (uvc_rect->left > uvc_rect->right ||
> >>> +       uvc_rect->top > uvc_rect->bottom)
> >>> +           return -EIO;
> >>> +
> >>> +   v4l2_rect->top =3D uvc_rect->top;
> >>> +   v4l2_rect->left =3D uvc_rect->left;
> >>> +   v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> >>> +   v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t =
v4l2_size,
> >>> +                   const void *v4l2_in, void *uvc_out)
> >>> +{
> >>> +   struct uvc_rect *uvc_rect =3D uvc_out;
> >>> +   const struct v4l2_rect *v4l2_rect =3D v4l2_in;
> >>> +
> >>> +   if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> >>> +           return -EINVAL;
> >>> +
> >>> +   uvc_rect->top =3D min(0xffff, v4l2_rect->top);
> >>> +   uvc_rect->left =3D min(0xffff, v4l2_rect->left);
> >>> +   uvc_rect->bottom =3D min(0xffff, v4l2_rect->top + v4l2_rect->heig=
ht - 1);
> >>> +   uvc_rect->right =3D min(0xffff, v4l2_rect->left + v4l2_rect->widt=
h - 1);
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>>  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >>>     {
> >>>             .id             =3D V4L2_CID_BRIGHTNESS,
> >>> @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl=
_mappings[] =3D {
> >>>             .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> >>>             .filter_mapping =3D uvc_ctrl_filter_plf_mapping,
> >>>     },
> >>> +   {
> >>> +           .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> >>> +           .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +           .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +           .size           =3D sizeof(struct uvc_rect) * 8,
> >>> +           .offset         =3D 0,
> >>> +           .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> >>> +           .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> >>> +           .get            =3D uvc_get_rect,
> >>> +           .set            =3D uvc_set_rect,
> >>> +           .name           =3D "Region Of Interest Rectangle",
> >>
> >> According to how titles are capitalized in english, this should be low=
er-case "of".
> >>
> >>> +   },
> >>> +   {
> >>> +           .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> >>> +           .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +           .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +           .size           =3D 16,
> >>> +           .offset         =3D 64,
> >>> +           .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> >>> +           .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> >>> +           .name           =3D "Region Of Interest Auto Controls",
> >>
> >> Ditto.
> >>
> >> This string is also one character too long (the control description st=
ring is at
> >> most 31 characters). Suggested alternatives:
> >>
> >> "Region of Interest Auto Ctrls"
> >
> > FWIW my vote goes to the above one, rationale:
> >
> > 1. ROI is unclear
> > 2. "Ctrls" with the _s_ over "Control" as this is a bitmask which allow=
s
> >    multiple options to be set at the same time (so not a menu style con=
trol)
> >
> >> "ROI Auto Controls"
> >> "Region Of Interest Auto Control"
> >>
> >> I can make the changes myself, but I need to know which alternative to=
 use for
> >> this string.
> >
> > Regards,
> >
> >       Hans
>
> Thank you for your quick reply! I'll merge it with this change.

A bit late to the party but +1 to Hans' choice.

On top of that, all the other controls are "Region of Interest X" not "ROI =
X"

>
> Regards,
>
>         Hans
>
> >
> >
> >
> >
> >
> >>
> >>> +   },
> >>>  };
> >>>
> >>>  /* -----------------------------------------------------------------=
-------
> >>> @@ -1473,6 +1551,9 @@ static int __uvc_queryctrl_boundaries(struct uv=
c_video_chain *chain,
> >>>
> >>>  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapp=
ing)
> >>>  {
> >>> +   if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_RECT)
> >>> +           return sizeof(struct v4l2_rect);
> >>> +
> >>>     if (uvc_ctrl_mapping_is_compound(mapping))
> >>>             return DIV_ROUND_UP(mapping->size, 8);
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc=
/uvcvideo.h
> >>> index 6fc1cb9e99d1..b63720e21075 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -543,6 +543,13 @@ struct uvc_device_info {
> >>>     u16     uvc_version;
> >>>  };
> >>>
> >>> +struct uvc_rect {
> >>> +   u16 top;
> >>> +   u16 left;
> >>> +   u16 bottom;
> >>> +   u16 right;
> >>> +} __packed;
> >>> +
> >>>  struct uvc_status_streaming {
> >>>     u8      button;
> >>>  } __packed;
> >>> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/=
video.h
> >>> index 526b5155e23c..e1d9f5773187 100644
> >>> --- a/include/uapi/linux/usb/video.h
> >>> +++ b/include/uapi/linux/usb/video.h
> >>> @@ -104,6 +104,7 @@
> >>>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                       0x0f
> >>>  #define UVC_CT_ROLL_RELATIVE_CONTROL                       0x10
> >>>  #define UVC_CT_PRIVACY_CONTROL                             0x11
> >>> +#define UVC_CT_REGION_OF_INTEREST_CONTROL          0x14
> >>>
> >>>  /* A.9.5. Processing Unit Control Selectors */
> >>>  #define UVC_PU_CONTROL_UNDEFINED                   0x00
> >>> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvi=
deo.h
> >>> index f86185456dc5..cbe15bca9569 100644
> >>> --- a/include/uapi/linux/uvcvideo.h
> >>> +++ b/include/uapi/linux/uvcvideo.h
> >>> @@ -16,6 +16,7 @@
> >>>  #define UVC_CTRL_DATA_TYPE_BOOLEAN 3
> >>>  #define UVC_CTRL_DATA_TYPE_ENUM            4
> >>>  #define UVC_CTRL_DATA_TYPE_BITMASK 5
> >>> +#define UVC_CTRL_DATA_TYPE_RECT            6
> >>>
> >>>  /* Control flags */
> >>>  #define UVC_CTRL_FLAG_SET_CUR              (1 << 0)
> >>> @@ -38,6 +39,18 @@
> >>>
> >>>  #define UVC_MENU_NAME_LEN 32
> >>>
> >>> +/* V4L2 driver-specific controls */
> >>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT       (V4L2_CID_USER_UV=
C_BASE + 1)
> >>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO       (V4L2_CID_USER_UV=
C_BASE + 2)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE          (1 << 0)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                      (=
1 << 1)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE             (=
1 << 2)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                     (=
1 << 3)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT               (=
1 << 4)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK  (1 << 5)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION       (=
1 << 6)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY            (=
1 << 7)
> >>> +
> >>>  struct uvc_menu_info {
> >>>     __u32 value;
> >>>     __u8 name[UVC_MENU_NAME_LEN];
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> >>> index 974fd254e573..72e32814ea83 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -215,6 +215,13 @@ enum v4l2_colorfx {
> >>>   */
> >>>  #define V4L2_CID_USER_THP7312_BASE         (V4L2_CID_USER_BASE + 0x1=
1c0)
> >>>
> >>> +/*
> >>> + * The base for the uvc driver controls.
> >>> + * See linux/uvcvideo.h for the list of controls.
> >>> + * We reserve 64 controls for this driver.
> >>> + */
> >>> +#define V4L2_CID_USER_UVC_BASE                     (V4L2_CID_USER_BA=
SE + 0x11e0)
> >>> +
> >>>  /* MPEG-class control IDs */
> >>>  /* The MPEG controls are applicable to all codec controls
> >>>   * and the 'MPEG' part of the define is historical */
> >>>
> >>
> >>
> >
>


--=20
Ricardo Ribalda

