Return-Path: <linux-media+bounces-37687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23AB044E5
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EF61188BE49
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB27923C8A1;
	Mon, 14 Jul 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HRD+xeik"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1E25BF13
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508784; cv=none; b=c0JJDC6q8oZOvE9A7bS5x/0vgEnLm8No1j1GyYWlWUhdfPUpWOZklgWqDt3Hgn8sMNIoJ4THAM+rUQQvoMUezQ6A2ybh8w4sCmfcAnF0SuXKhzhxNXgKtAcp8zVglanEMUxBsKF4XkXyHyNTSs9oblWRurugs8r/RKTbhGaNh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508784; c=relaxed/simple;
	bh=jkfpbBDz6fsZzySxLlb7hy7jGu+rjZvw977kguTtv3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDeNdOlFMYqmaYzHKRdwjXjHIOxrxHRWpSXXKXyReZ7yHFGkEc8k80KAmvzuoNll91QCC6FIJYDjc3FfxvElbCRRs7LFieFgftPWUKdTWBhyXvr/cYtRTSHSq1/bqZYo9WatdLxPbpmGqPth7e8z03fOPXJ1lhkFzQmXYw9Mreg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HRD+xeik; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5551a770828so4495848e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752508780; x=1753113580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hof50iYCL5T7/Bkgw5ZGSrfNWjcSfleM91HbwvcCRsY=;
        b=HRD+xeikeD6vQVifHUplqWFmZ3tniT2lPed1upbz7Ny3g0rr+9Nl12XBtGmdbI5bMX
         YPHoa3tejbWxZXCdU8XqEvgA4n7WuawI1hBv6c+Tzihvnh8D+DBx+++SdAJ9bvr8zQuh
         LHKZJDrohZTlHZA20MUBOj4z+8I30jwikDcMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508780; x=1753113580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hof50iYCL5T7/Bkgw5ZGSrfNWjcSfleM91HbwvcCRsY=;
        b=u2LeN7T3jdeS76tdz18iR36ZFqmpBC/3S+oYgFsAm7FPSvxCfRkzk6J713f4LZ6Tr4
         GTSUfQ38NDC6Si1etGDPhVfAw6beXsOVA7mQkMGqNz0w/27aSjCS0QAi+bxKN5xqg2Jx
         3evv8NlTzlI6XusqrVjR7rjPx/Pt+6+PeA3ogRa8tpZud/g2foCdS3bSfh52/KApLoYD
         6N8XKS9nypLFaq8Z3xJVszEv6RvKdRpQMPzKEOCERei/Ap7R+LyxMtZJwMwvhKVpDEIM
         p7LdLZ9k3RpOqdzmX5zzzRHuHLccvpmFgt6JrfFZYk19+RnFvIt/eayDAOeUPV7ZVKfx
         ZOTA==
X-Forwarded-Encrypted: i=1; AJvYcCXKBGa/sGH2HbHL6Ctltkui6B+SbdTPCRi6E9mkwuhVTldyAF4E12Kr+jlcf8WEPXVwmo/YJeFkdz7JUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNsEFMFFtvX1KUzdibKYcTWX5I3KxFRN3tlwX6t+hhiptaa/o
	5rx4N0GQoy6H8UHK3UhnAy/dtUPbgvxdwz68OpV3wudR/hiT3afTklPT3H3kP12dU9alJF1Zyh1
	EK+pC2g==
X-Gm-Gg: ASbGncskMa5XVCJ9c3DAXjESc4WVqp8/uXgR6xvlITPSq0/VnHtBD5l1lr6Qu8C9HAU
	RxgeovkF2+rauCDEEENr5mB8IeUXsCo+aCixqXexXRvtOJNu5wEYUumHQSeqKM6Jo269BPRLKrm
	TiKOyyDQ/ejng3fWcNEEE2EZye3TmSwIV0RvLzG9yHpnNi52uLL8sT4UQ+P1Y8tdyb1eWFF3sVX
	uSezz0pjZPh0kLhI9kdNgUxe6k0HxKr/2/oduW/qT5HkpKpQoF+7Br63VAk4saNcOMdgS4w9zPj
	omtbskCkh7hEb+m0r9yt9ychNwsTJfr9NeimpY2typKwijPLqDwEngnpx38c1ZbRVsylAeh5nO1
	XNDWp98KxIVDx+qn0FU6H2k6id9hffLkxdm+tfGvXupIET2naR+2/DmHq2x5n/74X
X-Google-Smtp-Source: AGHT+IFeb0So1R5FZLKGCEx4WHVfB3aSJbcvGKAi4X4LMvjvlUQOZ5a+0SbXn0Gmw9xpOea+EPfoVQ==
X-Received: by 2002:a05:6512:159f:b0:553:ad28:210a with SMTP id 2adb3069b0e04-55a04663602mr3600238e87.51.1752508780065;
        Mon, 14 Jul 2025 08:59:40 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbb16sm1976185e87.11.2025.07.14.08.59.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:59:39 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso47854271fa.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxwOqFooDKzmSC+q9eNE9+CiSipXaCcK0ncWkAznnAMDOOlHfgnutNFbCFxy344Wm35WICpdDTXycVFw==@vger.kernel.org
X-Received: by 2002:a2e:b5af:0:b0:32c:de97:6ff7 with SMTP id
 38308e7fff4ca-330535f6a83mr36141461fa.29.1752508778131; Mon, 14 Jul 2025
 08:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org>
 <20250629181440.GO24912@pendragon.ideasonboard.com> <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
 <20250714143120.GJ8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714143120.GJ8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 17:59:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCt6Xy_5bj6H7qFvG+g=FMfW7GWXvPGa5T+gdKPDqCa5BQ@mail.gmail.com>
X-Gm-Features: Ac12FXx_F9n-LUsxRwoh8ZmPOJZUgV6UwgyllEtyANUua67LvfGkioCuWb8sCms
Message-ID: <CANiDSCt6Xy_5bj6H7qFvG+g=FMfW7GWXvPGa5T+gdKPDqCa5BQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] media: uvcvideo: Add support for V4L2_CID_CAMERA_ROTATION
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 16:31, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Jul 01, 2025 at 01:26:51PM +0200, Ricardo Ribalda wrote:
> > On Sun, 29 Jun 2025 at 20:15, Laurent Pinchart wrote:
> > > On Thu, Jun 05, 2025 at 05:53:04PM +0000, Ricardo Ribalda wrote:
> > > > Fetch the rotation from the fwnode and map it into a control.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
> > > >  drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
> > > >  drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
> > > >  3 files changed, 74 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
> > > >       },
> > > >       {
> > > >               .entity         = UVC_GUID_SWENTITY,
> > > > -             .selector       = 0,
> > > > -             .index          = 0,
> > > > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > > > +             .index          = UVC_SWENTITY_ORIENTATION,
> > > >               .size           = 1,
> > > >               .flags          = UVC_CTRL_FLAG_GET_CUR,
> > > >       },
> > > > +     {
> > > > +             .entity         = UVC_GUID_SWENTITY,
> > > > +             .selector       = UVC_SWENTITY_ROTATION,
> > > > +             .index          = UVC_SWENTITY_ROTATION,
> > > > +             .size           = 2,
> > > > +             .flags          = UVC_CTRL_FLAG_GET_RANGE,
> > > > +     },
> > > >  };
> > > >
> > > >  static const u32 uvc_control_classes[] = {
> > > > @@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > > >       {
> > > >               .id             = V4L2_CID_CAMERA_ORIENTATION,
> > > >               .entity         = UVC_GUID_SWENTITY,
> > > > -             .selector       = 0,
> > > > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > > >               .size           = 8,
> > > >               .offset         = 0,
> > > >               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > > @@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > > >               .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> > > >                                         V4L2_CAMERA_ORIENTATION_FRONT),
> > > >       },
> > > > +     {
> > > > +             .id             = V4L2_CID_CAMERA_SENSOR_ROTATION,
> > > > +             .entity         = UVC_GUID_SWENTITY,
> > > > +             .selector       = UVC_SWENTITY_ROTATION,
> > > > +             .size           = 16,
> > > > +             .offset         = 0,
> > > > +             .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> > > > +             .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> > > > +     },
> > > >  };
> > > >
> > > >  /* ------------------------------------------------------------------------
> > > > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > > > index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
> > > > --- a/drivers/media/usb/uvc/uvc_swentity.c
> > > > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > > > @@ -10,10 +10,11 @@
> > > >  #include <media/v4l2-fwnode.h>
> > > >  #include "uvcvideo.h"
> > > >
> > > > -static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > -                             u8 cs, void *data, u16 size)
> > > > +static int uvc_swentity_get_orientation(struct uvc_device *dev,
> > > > +                                     struct uvc_entity *entity, u8 cs,
> > > > +                                     void *data, u16 size)
> > > >  {
> > > > -     if (size < 1)
> > > > +     if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
> > > >               return -EINVAL;
> > > >
> > > >       switch (entity->swentity.props.orientation) {
> > > > @@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int uvc_swentity_get_rotation(struct uvc_device *dev,
> > > > +                                  struct uvc_entity *entity, u8 cs, void *data,
> > > > +                                  u16 size)
> > > > +{
> > > > +     if (cs != UVC_SWENTITY_ROTATION || size != 2)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ((u8 *)data)[0] = entity->swentity.props.rotation;
> > > > +     ((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                             u8 cs, void *data, u16 size)
> > > > +{
> > > > +     switch (cs) {
> > > > +     case UVC_SWENTITY_ORIENTATION:
> > > > +             return uvc_swentity_get_orientation(dev, entity, cs, data, size);
> > > > +     case UVC_SWENTITY_ROTATION:
> > > > +             return uvc_swentity_get_rotation(dev, entity, cs, data, size);
> > > > +     }
> > > > +     return -EINVAL;
> > > > +}
> > > > +
> > > >  static int uvc_swentity_get_info(struct uvc_device *dev,
> > > >                                struct uvc_entity *entity, u8 cs, u8 *caps)
> > > >  {
> > > > @@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                             u8 cs, void *res, u16 size)
> > > > +{
> > > > +     if (size == 0)
> > > > +             return -EINVAL;
> > >
> > > The get_cur functions return an error if the size doesn't match the
> > > expected size. I think you can return -EINVAL if size != 1.
> > >
> > > > +     ((u8 *)res)[0] = 1;
> > > > +     memset(res + 1, 0, size - 1);
> > >
> > > And drop the memset.
> > >
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  int uvc_swentity_init(struct uvc_device *dev)
> > > >  {
> > > >       static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> > > >       struct v4l2_fwnode_device_properties props;
> > > >       struct uvc_entity *unit;
> > > > +     u8 controls = 0;
> > > >       int ret;
> > > >
> > > >       ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > > > @@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
> > > >               return dev_err_probe(&dev->intf->dev, ret,
> > > >                                    "Can't parse fwnode\n");
> > > >
> > > > -     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > > > +     if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
> > > > +             controls |= BIT(UVC_SWENTITY_ORIENTATION);
> > > > +     if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > > > +             controls |= BIT(UVC_SWENTITY_ROTATION);
> > > > +     if (!controls)
> > > >               return 0;
> > > >
> > > >       unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > > > @@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
> > > >       unit->swentity.props = props;
> > > >       unit->swentity.bControlSize = 1;
> > > >       unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > > > -     unit->swentity.bmControls[0] = 1;
> > > > +     unit->swentity.bmControls[0] = controls;
> > > >       unit->get_cur = uvc_swentity_get_cur;
> > > >       unit->get_info = uvc_swentity_get_info;
> > > > +     unit->get_res = uvc_swentity_get_res;
> > > > +     unit->get_def = uvc_swentity_get_rotation;
> > > > +     unit->get_min = uvc_swentity_get_rotation;
> > > > +     unit->get_max = uvc_swentity_get_rotation;
> > >
> > > Why do you support GET_DEF, GET_MIN and GET_MAX for rotation only ?
> >
> > Orientation has enum type. It does not require min or max.
> >
> > For get_def I could use get_cur, but 0 is as good as any other value
> > within range.
>
> Both the orientation and rotation are read-only, and should report min
> == max == def == cur. What am I missing ?

V4L2_CID_CAMERA_ORIENTATION has type V4L2_CTRL_TYPE_MENU
In _uvc_queryctrl_boundaries(), min and max are auto calculated, they
are not based on information from the device.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n1504

I can change  unit->get_(def|min|max)=uvc_swentity_get_cur if you
think that it is cleaner...

Regards!

>
> > > >       strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> > > >
> > > >       list_add_tail(&unit->list, &dev->entities);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -45,6 +45,11 @@
> > > >  #define UVC_SWENTITY_UNIT            0x7ffd
> > > >  #define UVC_SWENTITY_UNIT_ID         0x101
> > > >
> > > > +enum {
> > > > +     UVC_SWENTITY_ORIENTATION,
> > > > +     UVC_SWENTITY_ROTATION
> > > > +};
> > > > +
> > > >  /* ------------------------------------------------------------------------
> > > >   * Driver specific constants.
> > > >   */
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

