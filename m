Return-Path: <linux-media+bounces-22403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876D9DFB94
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7886BB218AC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FD51F9AAB;
	Mon,  2 Dec 2024 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVHiqNBw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8CF9E6
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733126567; cv=none; b=ZwBOyKNGEo6hDs8QVzzyubsBF37xkWv2QBgfEyNEwP/ktjWVheg4BhRFjzyAc8S9XiQjH6WeOxuwhZxpiZcOcd7WPgJblkK76QMhhq7Uo/fNYPNwYvip3SpjSXEuP88SHF8yf8Fyq+PK1otdNN83xDLc4vlpksaH3wepv6uvqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733126567; c=relaxed/simple;
	bh=XjcvYaPoaOaCkRsJ12nahVkfFRNwZzKr66uvXv1Q13w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOzsGb1ed3s2VuU6up/7wPEh+cE/izeTvgH/IjL8uR9VYHZ0DzyFMRbriNtIyb85kLYAnsh8WbIFMvWsvkcdkMeXTAggfJXzS5qTkxY78gFAzO5teH/8YlMUP5cPJWXy2Z2sEozUeH/pupKWnWNp8pEle62q7ynVfhA5qITHd+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVHiqNBw; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso448799a91.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 00:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733126565; x=1733731365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOdbML7s9AFwet9bXLxQXjVFT93zyYyd3bhw4v95B0Y=;
        b=MVHiqNBw7gm8FTDaevwGbVANpYRZO2oJTlTM0CbblDVSJJLZrX4Q0quw+V2c011+ED
         swURd2v/Qtx8P7FPti+1ftdrtXdM2JFutTwqOTnxszMxAhbuQ0Hzn22Ap0tfSUve7jCw
         Ero+bcu19kQOsdkSVzy9+20iJIYO7qRyFU9avS/Rk87FEzs7GZX7+ym9rJ9DGilzbA1S
         gYcO/t1YIl0iUofUAiZNw6qCeXoHpfuD0pr+jz46TNpffralY58fZxdmJ+B4lx4SvrjW
         CZJjJPHjUre0kwQX9q9Ec3pgJisMdHjHlwWJ4b0lc5qPvDAekaOhvoetMUfb89z3p86T
         UTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733126565; x=1733731365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOdbML7s9AFwet9bXLxQXjVFT93zyYyd3bhw4v95B0Y=;
        b=hAfZKpdUjR/z7XVZlUXUHQJLqgw7pD3yY3HZcCRpH6spgzRjZjltaV4bcVFEpRl3GT
         wmkjNPDvUK+VYsVzBQXTPZSZIvoboRiTAuXke36PtpR+dCDZ9UlUtgnt3IehJN5PKjGj
         9rKdhCAURWSw2iK8rPg/avkYKs4J9XZJO+5igVpP/cf5rEswhCTCeJjD6PjWko/++uvY
         6B6MbLCtrAa2skjB6UKL+9awg7QiELxOCdGeM8TZUVUCJUfAf8M0jHXPp2BYVErwrxqj
         4fBdPM8uXZQXxNOy5QttxBhlKqJKuQ1viIc6QDEtFbDKTOLWTSVcVrzXpIreBqhuR+AP
         789w==
X-Forwarded-Encrypted: i=1; AJvYcCUpgnW+P5K1bWdMdD0dT2Xr4pdHiaeeoOVndbYC48fMopBHOrvPAhBMNzKGnARtVLEX8F93pKV1S5wfKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydcbpxrhXThRR7UvzXojuJuQC8CoY8SOUnfObcAlWYb31tupz2
	jlWWxTvUGvT+keJX2iBFPlEEWM0D9aLouSfmgcIPZoEY9/6qd4X3ggmb9lfu8I0pCj0kTpN8jwb
	wb5dN2l1nBDAu74yjaDPcvAOxW4Gr8mnUNisE
X-Gm-Gg: ASbGncv1OVGqh3FKjdsbIByyHea4DIE2bmu1qtflwyY6Avl9oHCbQsyC/gNj9mbE0lc
	Q3WsxZO2n9iADatq0y86OCLd9xQE/eeDIAkuFxasGwLKcjSu6hBqcx3GTuclyCA==
X-Google-Smtp-Source: AGHT+IFtZK4LQyh15m+SRdyxq/e4iFm7HY886U3LyaGafwOLzFKkIITl23yDQvCWlo3RWnFj0oAqbxWEFAptWtptC4M=
X-Received: by 2002:a17:90b:380c:b0:2ea:c096:b738 with SMTP id
 98e67ed59e1d1-2ee097bafaemr25286739a91.28.1733126564517; Mon, 02 Dec 2024
 00:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org> <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
From: Yunke Cao <yunkec@google.com>
Date: Mon, 2 Dec 2024 17:02:32 +0900
Message-ID: <CANqU6Fdu2dg+1RADfOFG=3M6sLDgMuQZJMv1Vb46pnhLbR1ttA@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

Thanks for the new version!!

On Fri, Nov 15, 2024 at 4:11=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> From: Yunke Cao <yunkec@google.com>
>
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
>
> ROI control is implemented using V4L2 control API as
> two UVC-specific controls:
> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
>  include/uapi/linux/usb/video.h     |  1 +
>  include/uapi/linux/uvcvideo.h      | 13 ++++++
>  include/uapi/linux/v4l2-controls.h |  9 +++++
>  5 files changed, 111 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index f262e05ad3a8..5b619ef40dd3 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] =3D=
 {
>                 .flags          =3D UVC_CTRL_FLAG_GET_CUR
>                                 | UVC_CTRL_FLAG_AUTO_UPDATE,
>         },
> +       /*
> +        * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
> +        * by sensors.
> +        * "This RoI should be the same as specified in most recent SET_C=
UR
> +        * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> +        * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> +        * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> +        */
> +       {
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .index          =3D 21,
> +               .size           =3D 10,
> +               .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> +                               | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> +                               | UVC_CTRL_FLAG_GET_DEF
> +                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> +       },
>  };
>
>  static const u32 uvc_control_classes[] =3D {
> @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_fi=
lter_plf_mapping(
>         return out_mapping;
>  }
>
> +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
> +                       const void *uvc_in, size_t v4l2_size, void *v4l2_=
out)
> +{
> +       const struct uvc_rect *uvc_rect =3D uvc_in;
> +       struct v4l2_rect *v4l2_rect =3D v4l2_out;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> +               return -EINVAL;
> +
> +       if (uvc_rect->left > uvc_rect->right ||
> +           uvc_rect->top > uvc_rect->bottom)
> +               return -EIO;
> +
> +       v4l2_rect->top =3D uvc_rect->top;
> +       v4l2_rect->left =3D uvc_rect->left;
> +       v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> +       v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> +
> +       return 0;
> +}
> +
> +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4l2=
_size,
> +                       const void *v4l2_in, void *uvc_out)
> +{
> +       struct uvc_rect *uvc_rect =3D uvc_out;
> +       const struct v4l2_rect *v4l2_rect =3D v4l2_in;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(struct v4l2_rect)))
> +               return -EINVAL;
> +
> +       uvc_rect->top =3D max(0xffff, v4l2_rect->top);
> +       uvc_rect->left =3D max(0xffff, v4l2_rect->left);
> +       uvc_rect->bottom =3D max(0xffff, v4l2_rect->height + v4l2_rect->t=
op - 1);
> +       uvc_rect->right =3D max(0xffff, v4l2_rect->width + v4l2_rect->lef=
t - 1);

Should these be min()?

>
> +
> +       return 0;
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
>         {
>                 .id             =3D V4L2_CID_BRIGHTNESS,
> @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_map=
pings[] =3D {
>                 .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
>                 .filter_mapping =3D uvc_ctrl_filter_plf_mapping,
>         },
> +       {
> +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           =3D sizeof(struct uvc_rect) * 8,
> +               .offset         =3D 0,
> +               .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> +               .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> +               .get            =3D uvc_get_rect,
> +               .set            =3D uvc_set_rect,
> +               .name           =3D "Region Of Interest Rectangle",
> +       },
> +       {
> +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           =3D 16,
> +               .offset         =3D 64,
> +               .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> +               .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> +               .name           =3D "Region Of Interest Auto Controls",
> +       },
>  };
>
>  /* ---------------------------------------------------------------------=
---
> @@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_vi=
deo_chain *chain,
>
>  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
>  {
> +       if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_RECT)
> +               return sizeof(struct v4l2_rect);
> +
>         if (uvc_ctrl_mapping_is_compound(mapping))
>                 return DIV_ROUND_UP(mapping->size, 8);
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 8aca1a2fe587..d910a5e5b514 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -294,6 +294,13 @@ struct uvc_streaming_header {
>         u8 bTriggerUsage;
>  };
>
> +struct uvc_rect {
> +       u16 top;
> +       u16 left;
> +       u16 bottom;
> +       u16 right;
> +} __packed;
> +
>  enum uvc_buffer_state {
>         UVC_BUF_STATE_IDLE      =3D 0,
>         UVC_BUF_STATE_QUEUED    =3D 1,
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vide=
o.h
> index 2ff0e8a3a683..2afb4420e6c4 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -104,6 +104,7 @@
>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
>  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
>  #define UVC_CT_PRIVACY_CONTROL                         0x11
> +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
>
>  /* A.9.5. Processing Unit Control Selectors */
>  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.=
h
> index f86185456dc5..cbe15bca9569 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -16,6 +16,7 @@
>  #define UVC_CTRL_DATA_TYPE_BOOLEAN     3
>  #define UVC_CTRL_DATA_TYPE_ENUM                4
>  #define UVC_CTRL_DATA_TYPE_BITMASK     5
> +#define UVC_CTRL_DATA_TYPE_RECT                6
>
>  /* Control flags */
>  #define UVC_CTRL_FLAG_SET_CUR          (1 << 0)
> @@ -38,6 +39,18 @@
>
>  #define UVC_MENU_NAME_LEN 32
>
> +/* V4L2 driver-specific controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT   (V4L2_CID_USER_UVC_BASE +=
 1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO   (V4L2_CID_USER_UVC_BASE +=
 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION   (1 << 6)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY                (=
1 << 7)
> +
>  struct uvc_menu_info {
>         __u32 value;
>         __u8 name[UVC_MENU_NAME_LEN];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 974fd254e573..6c91d6fa4708 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -215,6 +215,13 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_THP7312_BASE             (V4L2_CID_USER_BASE + 0x1=
1c0)
>
> +/*
> + * The base for the uvc driver controls.
> + * See linux/uvcvideo.h for the list of controls.
> + * We reserve 64 controls for this driver.
> + */
> +#define V4L2_CID_USER_UVC_BASE                 (V4L2_CID_USER_BASE + 0x1=
1e0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> @@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
>
>  #define V4L2_CID_HDR_SENSOR_MODE               (V4L2_CID_CAMERA_CLASS_BA=
SE+36)
>
> +/* CAMERA-class private control IDs */
> +

Do we still need this comment?

Best,
Yunke

>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE              (V4L2_CTRL_CLASS_FM_TX | =
0x900)
>
> --
> 2.47.0.338.g60cca15819-goog
>

