Return-Path: <linux-media+bounces-36411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A09AEF680
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C445D1C015C7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EDA272E56;
	Tue,  1 Jul 2025 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CuVYTd+n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557932727F7
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369230; cv=none; b=lqWH2weFnH1vhc9yDGzlAJO5xkDmgepLdHst2Vr9b6KYxsHmFNrQd8LQ5HRwD40Ogk6yv6I6LQO1UGy1lnFqXSh4QeS6nO/+H4APgF4c8m92nkq2W47OwpC9vFX5nUhMI5Fk15tnUSex7dzYjZahVW/WLRGCYJyWqWBT7GSCdso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369230; c=relaxed/simple;
	bh=ESXaDOI0ClJQb3/rnUaSslnZdyZvIXDxHVvhpQGw5jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvtQW6NuPyChG9bhqhoAt8rDJsQOic8Cjgund3MUUi/PMbFEZX9ZKQen8ROKzbJPRBm+zez3zQRU7po5hmUAye79bl4mCQEEmua1zD6Dnob76sU/H2kakUwLWfCjqRT3H9hIkdbMI8nOo3kIkH0KzNN6NmuEe0ZFViWaVmDRfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CuVYTd+n; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553d52cb80dso5828235e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751369226; x=1751974026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=CuVYTd+n2g2Vb/QBS/N08T9c53MeehQ7UqIRwqRT0qpFfhmavTHfyokf1nNZxt/Sg+
         x6ob6tIe8lLYbGVBnc7qhsmNBsLy1c9Mpkn5tcaSp1I8VJG2DQvMpoZwE8/wzy1bnwsq
         4jnVq3l6HkubpUmHcjpbk2V84XISp9wqF/WkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369226; x=1751974026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=reVnKI3eqETwWYwokDwoS6UNPzlL/eAab3vZnxaHxahnfOdulB1c6V36R/d7L/X/Nj
         q+N/+HQaR8UD0EEJUwKp7G3a6oBIBG5yq49y/gHeGpEZbX04BgAV8usj6fSVOJ4/6hd1
         4vj/ry+8EpQehPSht0ro6q7q/mkCnbm/xFz5vMlFdSArspAyLM2P93F83R0J5tPtdoq7
         Vzsgo0y8pAePhzSmb7Ie6XMpk6gmy+irOVqiO+dt/9K+Jq3Yt6Rs4WW0GxKq8CGMiwmG
         nATBZwBVm1zSo33r9FrGis/DBtUnQNJ+jv22uyZWKCvqZ6/UbgvG9u8tYQmJVb//lRjo
         LYzg==
X-Forwarded-Encrypted: i=1; AJvYcCVazWWXgzW3C2Zza0CiDvtcKzjlZnydYOHpuAwMH4pfwCZVxSAt0RPE7wZ1K9aMEJcGyraQdsUZoPt8Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Hh+XttO/czjy2iQWy7Ecom5Mvgnb0MzS6oXRnVvNKzIX3sf5
	fRWm6rXNy8aGJ6vdk91/KPqvvOZ5MMkVc1Ruy6wYhdW3NKMIoOpQJy7QHBP/7qvYg5Uivfr/3ic
	AkxQUiw==
X-Gm-Gg: ASbGncs3z+6QF2pe9bacYvlSloF1wzqxBp6BJHfwiLyat2/Veh6QuWq2Extd5cXgH5/
	paYKg7Uc0iCNVJB8/y7fg4HBGr66zUOF4oCAa1zj4ZF4wPTy1AW/T4dtpR1FYzOJyAV2KPY9+RT
	sVlYTwzy/eRcXfS7csnRQrZAxE6uwmqmaHFphFAEE1UWPwRBYY87FPt4wHHNLoM9vYf8WBMF+xY
	HTu0E7Q0Yhlph6tJRNCjfpCuQEHJXXOJp/Za7ZBTGzgHJ19MbWJVp2vWEDZhmYO/f8NXQUdS9d+
	Ky5Zd9xBFjYgh3oPFu8QfZ4BeB9Lk8nSkzpi3zNkWabfxQtzxIWvfoPQEbunC4pW7KhWbHk+1B8
	h6PK3qzVdohH3Z790vHovugme
X-Google-Smtp-Source: AGHT+IHpFE38YpE13g6PHLW2y2hOiAxrZbUpdOHijot54+toSBPLL+NVcvUj4W1/uccCbTzt9LiMsA==
X-Received: by 2002:ac2:4e01:0:b0:54f:c1cc:1241 with SMTP id 2adb3069b0e04-55623530820mr696040e87.25.1751369225980;
        Tue, 01 Jul 2025 04:27:05 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d94fbsm1788859e87.211.2025.07.01.04.27.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:27:05 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so7209443e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWY5IPhI5GEtZVA/IaBc5t3Ou9+vUrO8psA9DkvZ66ny0/7cAH/J5DSGu+PlstcmwPNtJwknc25QaOZ+g==@vger.kernel.org
X-Received: by 2002:a05:6512:3996:b0:553:2a16:2503 with SMTP id
 2adb3069b0e04-5562351cd2bmr643670e87.22.1751369224941; Tue, 01 Jul 2025
 04:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org> <20250629181440.GO24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629181440.GO24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:26:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
X-Gm-Features: Ac12FXzX2o2y2l8S2fLY5YNiZDeM3lsThn02nyBQ6azDUzOojOVrPSfT9VAdjyY
Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
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

On Sun, 29 Jun 2025 at 20:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 05, 2025 at 05:53:04PM +0000, Ricardo Ribalda wrote:
> > Fetch the rotation from the fwnode and map it into a control.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
> >  drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
> >  drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
> >  3 files changed, 74 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >       },
> >       {
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > -             .index          = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > +             .index          = UVC_SWENTITY_ORIENTATION,
> >               .size           = 1,
> >               .flags          = UVC_CTRL_FLAG_GET_CUR,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .index          = UVC_SWENTITY_ROTATION,
> > +             .size           = 2,
> > +             .flags          = UVC_CTRL_FLAG_GET_RANGE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >       {
> >               .id             = V4L2_CID_CAMERA_ORIENTATION,
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> >               .size           = 8,
> >               .offset         = 0,
> >               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > @@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> >                                         V4L2_CAMERA_ORIENTATION_FRONT),
> >       },
> > +     {
> > +             .id             = V4L2_CID_CAMERA_SENSOR_ROTATION,
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .size           = 16,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
> > --- a/drivers/media/usb/uvc/uvc_swentity.c
> > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > @@ -10,10 +10,11 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include "uvcvideo.h"
> >
> > -static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > -                             u8 cs, void *data, u16 size)
> > +static int uvc_swentity_get_orientation(struct uvc_device *dev,
> > +                                     struct uvc_entity *entity, u8 cs,
> > +                                     void *data, u16 size)
> >  {
> > -     if (size < 1)
> > +     if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
> >               return -EINVAL;
> >
> >       switch (entity->swentity.props.orientation) {
> > @@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_rotation(struct uvc_device *dev,
> > +                                  struct uvc_entity *entity, u8 cs, void *data,
> > +                                  u16 size)
> > +{
> > +     if (cs != UVC_SWENTITY_ROTATION || size != 2)
> > +             return -EINVAL;
> > +
> > +     ((u8 *)data)[0] = entity->swentity.props.rotation;
> > +     ((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *data, u16 size)
> > +{
> > +     switch (cs) {
> > +     case UVC_SWENTITY_ORIENTATION:
> > +             return uvc_swentity_get_orientation(dev, entity, cs, data, size);
> > +     case UVC_SWENTITY_ROTATION:
> > +             return uvc_swentity_get_rotation(dev, entity, cs, data, size);
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> >  static int uvc_swentity_get_info(struct uvc_device *dev,
> >                                struct uvc_entity *entity, u8 cs, u8 *caps)
> >  {
> > @@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *res, u16 size)
> > +{
> > +     if (size == 0)
> > +             return -EINVAL;
>
> The get_cur functions return an error if the size doesn't match the
> expected size. I think you can return -EINVAL if size != 1.
>
> > +     ((u8 *)res)[0] = 1;
> > +     memset(res + 1, 0, size - 1);
>
> And drop the memset.
>
> > +     return 0;
> > +}
> > +
> >  int uvc_swentity_init(struct uvc_device *dev)
> >  {
> >       static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> >       struct v4l2_fwnode_device_properties props;
> >       struct uvc_entity *unit;
> > +     u8 controls = 0;
> >       int ret;
> >
> >       ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > @@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
> >               return dev_err_probe(&dev->intf->dev, ret,
> >                                    "Can't parse fwnode\n");
> >
> > -     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > +     if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ORIENTATION);
> > +     if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ROTATION);
> > +     if (!controls)
> >               return 0;
> >
> >       unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > @@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
> >       unit->swentity.props = props;
> >       unit->swentity.bControlSize = 1;
> >       unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > -     unit->swentity.bmControls[0] = 1;
> > +     unit->swentity.bmControls[0] = controls;
> >       unit->get_cur = uvc_swentity_get_cur;
> >       unit->get_info = uvc_swentity_get_info;
> > +     unit->get_res = uvc_swentity_get_res;
> > +     unit->get_def = uvc_swentity_get_rotation;
> > +     unit->get_min = uvc_swentity_get_rotation;
> > +     unit->get_max = uvc_swentity_get_rotation;
>
> Why do you support GET_DEF, GET_MIN and GET_MAX for rotation only ?

Orientation has enum type. It does not require min or max.

For get_def I could use get_cur, but 0 is as good as any other value
within range.

>
> >       strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> >
> >       list_add_tail(&unit->list, &dev->entities);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -45,6 +45,11 @@
> >  #define UVC_SWENTITY_UNIT            0x7ffd
> >  #define UVC_SWENTITY_UNIT_ID         0x101
> >
> > +enum {
> > +     UVC_SWENTITY_ORIENTATION,
> > +     UVC_SWENTITY_ROTATION
> > +};
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

