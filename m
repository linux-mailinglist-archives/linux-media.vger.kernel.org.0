Return-Path: <linux-media+bounces-22945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACC29E9A62
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2CE1885D60
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32741BEF9C;
	Mon,  9 Dec 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aAvYcAxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602D1B0428
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757839; cv=none; b=gomJoXPAUihVNfCSUxqFxAcgOAxQKY+hQJ5wUQfTpd0qsRKOqrx1u7M8W0iOlZ1VoJs5uNC1RmiBRk2CMAWbFmQShCcTpJwy61zxnGR4hS7glhbgLeBxca3HKwyko3FhpcfCgyeuCit9FUd4J1N2SqjiAihmkHKDRMDlkR0P3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757839; c=relaxed/simple;
	bh=r/WPAh4mTeYj8oNYFuvxsKmn2syxCq4/bcxuN8xuYM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx2JKUCPeeDGYXH2oESBhSphZd3QYrYFsM/+XEzZbXOOFU8kTzedTjfsmNND4YgOhXVgJos3d9SIfB+7Az3uUjjNeGC1iv1RJIjZXcc1q2sh3+rhMeW01mJNAJQaM/VOF57/UTZCdwPkVB7H4GpiVTmOjaenoyP8bmz1k0tWf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aAvYcAxS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725dbdf380aso1323716b3a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733757837; x=1734362637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hictPQbjZ7rJYwMvs0YJZF1b6NrE66ZOdYqbXNzdf8=;
        b=aAvYcAxS5gPYjytYZjbSflU+mPMl8qnqcrTEHBN/hkpjBaLTPgx1JRHobrJlzmerlI
         1m+5RjipPyN8tUUl5YRZxuLxafL3n6xY2BvM8qY5lFtGFyG0ghYUF3JPR8yZ6sYcTrRF
         9TrK4yjOKWmdm0BIxCo4FCjNi2Lgi0zhg0PZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757837; x=1734362637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hictPQbjZ7rJYwMvs0YJZF1b6NrE66ZOdYqbXNzdf8=;
        b=Mw/+5v+KjaUI1Ly0vC96hu079M1XNN/snmWFYiQt/glXdYYhE4HKm9JNs5t3TMYGhN
         LpCrdZpwgS0+dK6RIc06go12H3vb7k1+3jaktXyyVMH2CQYMEp3HEAiEHTjf5gm1+aD2
         HVCYKbzt7UWZb/v40g8NUxut9qj9MokT1DXdzoaBnZGGCPSFOvm9/gTUYByd8DVfyuw0
         a5tRv+jZIYjp047NsK3M0egy7wldZAJs4EajjziN6v7rV6dCj8T1M6BqYBZ7+rlI8HBh
         o1AmXVFKJO+CGZSQP5mksZvACwBQT+bqeYKN42vN+DTKWFkju9R/AhRPfy2G7Vmg4OhI
         Z4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW40Z6YQBx+OfC/CTPwMDfvRnD5TDs9FfBr/6VGUAr9AbxKCdz/K/lTJetb2knkNBchyPZ7FLrMr/brqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlkYKy3Opl/kGG0hZVlNzOpRFMApfKAQmnA48BpXHjP7nMu8P
	p3ncXC2vmKGVHC60a3XJe+/0obtMxuea5igMYZts3jAybC+0xq/8ECw9ixBw6TGAXKbeMg3Xta4
	=
X-Gm-Gg: ASbGncvErxR5ls+rZ7lAy0LHFpJjJS0CsboNp+/fFwl2TJVu2wfuP4gF3ax4o/gmxhg
	LTLFKAiBajZXsfhampyh01VoGZORkVR+f/K6Bsqijp3ti+t+pMhWXluPJYBQiQmvPNyiCiGPy6K
	V4x+20UTRIvp/mWTK75v/FPlujyWsFLU0uI2oH3+wPJEbrdhwGZ8Czh84Om5+Oy/EQyLd7YgZ8K
	V02Xf7dBc5NxxftsL+VVM/n+HoSn70Q+Wb+LeMBMCM8ll9D/2lbQ+q1CNt2ysdp/CrsfLD8rh0X
	cI1u18hGYTv8U8lB
X-Google-Smtp-Source: AGHT+IE1QGOYR+dVcV8jd/drzgMUZLQvPRVogQQ/Ky5SeogRZ0l8AR/+k1uaJP0WANHZIRcW6QBd6g==
X-Received: by 2002:a05:6a20:d80d:b0:1e1:9765:8ecf with SMTP id adf61e73a8af0-1e1b1b09c44mr1436452637.20.1733757836674;
        Mon, 09 Dec 2024 07:23:56 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725da385bfcsm3903150b3a.70.2024.12.09.07.23.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:23:54 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so2982525a12.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:23:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlLaM3P4iOP6cr/jQWxfdzBKuvJMQtRZC0DEh5/W9+3SxSYCNvEWBREy/tPNTz54Es5jJ4KmAPrMy49w==@vger.kernel.org
X-Received: by 2002:a17:90b:53d0:b0:2ee:cd83:8fc3 with SMTP id
 98e67ed59e1d1-2efcf26e5e0mr1430809a91.37.1733757834106; Mon, 09 Dec 2024
 07:23:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <2e90c10a-71fe-4e80-9ac3-80393bc8b266@redhat.com>
In-Reply-To: <2e90c10a-71fe-4e80-9ac3-80393bc8b266@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 16:23:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCvO4DvAHfYpkSi_ZMuV6huk0fTA94-jPafeGrUw+6WoZQ@mail.gmail.com>
X-Gm-Features: AZHOrDnQEn1ubToD_yuupv_yBP9syTygw9yT_eMIETW4cv2VIlCnEuhvX1CMggU
Message-ID: <CANiDSCvO4DvAHfYpkSi_ZMuV6huk0fTA94-jPafeGrUw+6WoZQ@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Mon, 9 Dec 2024 at 15:22, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
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
> > +     uvc_rect->top =3D max(0xffff, v4l2_rect->top);
> > +     uvc_rect->left =3D max(0xffff, v4l2_rect->left);
> > +     uvc_rect->bottom =3D max(0xffff, v4l2_rect->height + v4l2_rect->t=
op - 1);
> > +     uvc_rect->right =3D max(0xffff, v4l2_rect->width + v4l2_rect->lef=
t - 1);
>
> As already remarked all 4 lines should be min() not max()
>
> Also this might just be me, but I have a preference for writing top + hei=
ght
> for the bottom rather then writing height + top, since the window starts =
with
> skippig top pixels and then has height pixels filled in. And same for
> calculating rect->width. IOW I have a preference for writing this as:
>
>         uvc_rect->bottom =3D min(0xffff, v4l2_rect->top + v4l2_rect->heig=
ht - 1);
>         uvc_rect->right =3D min(0xffff, v4l2_rect->left + v4l2_rect->widt=
h - 1);
>
> As I said this might just be me, but to me the above reads more naturally=
.
>
>
>
>
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
> > @@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_=
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
> > index 8aca1a2fe587..d910a5e5b514 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -294,6 +294,13 @@ struct uvc_streaming_header {
> >       u8 bTriggerUsage;
> >  };
> >
> > +struct uvc_rect {
> > +     u16 top;
> > +     u16 left;
> > +     u16 bottom;
> > +     u16 right;
> > +} __packed;
> > +
>
> This should probably be grouped togather with uvc_status_* structs which =
are
> also marked __packed because they represent hw API rather then just host
> in memory structures.
>
> >  enum uvc_buffer_state {
> >       UVC_BUF_STATE_IDLE      =3D 0,
> >       UVC_BUF_STATE_QUEUED    =3D 1,
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
>
> Hmm, shoudn't these be standardized. At least the ROI rect control seems =
like
> something which could be standardized ?

I believe that back in 2022 we deciced to go with custom controls:
https://lore.kernel.org/linux-media/a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs=
4all.nl/

>
> Was using driver specific CIDs for this discussed with Hans Verkuil ?
>
> >  struct uvc_menu_info {
> >       __u32 value;
> >       __u8 name[UVC_MENU_NAME_LEN];
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 974fd254e573..6c91d6fa4708 100644
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
> > @@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE             (V4L2_CID_CAMERA_CLASS_BA=
SE+36)
> >
> > +/* CAMERA-class private control IDs */
> > +
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX | =
0x900)
> >
>
>
> Regards,
>
> Hans
>
>


--=20
Ricardo Ribalda

