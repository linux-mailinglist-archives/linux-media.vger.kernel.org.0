Return-Path: <linux-media+bounces-36395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E58AEF322
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB901BC2218
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6187626E715;
	Tue,  1 Jul 2025 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DNT/Xo0p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246526B0A7
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361749; cv=none; b=bGaPhHrYDx4yR3xXsASdAIxAYvNbKEPDfRjiT4guze00uSzoaddGBhbnB7FdXI91kzAj+5aM7mQ1/zTyyV/mPzvtdH4B1r4ETcqL8agvI3g8HOOJBSMIHFZ3LQoXOmkIbghOtpJlQnSJq19R1Uqv8pRsqjJlR8cFTR3esci8Hz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361749; c=relaxed/simple;
	bh=j5wlMbPmUjf27ANZh10nnvtw/xfZ70MwhNN1zPJjxpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJApis4j+PPGVNoVF+XT5cAbBrtfIBLOnaPHPmE9HaoT613nKSh3XaFKaUKA1Xind7Y1rpjePqboLQIV8uwXlvLxWCPuUcq4ZkM5vFcyB6Roif77Fvr4tYac/4mJWWJDDzsEdp0PUkBSdB4okQz7Z46YEmNngD6ZHUhyzwedNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DNT/Xo0p; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b544e7b4so3157981e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751361746; x=1751966546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9tMwKKV17TTvsTFK7dQXew3Cofw+lQuFXBbrD3s440=;
        b=DNT/Xo0ppMBViHLK5XI03YGlmx4IaVnrzEPnfIJJV+LNxtxFnQIOv855TIoh++aF3K
         wZ+Qe9/uLUogzmaXANQbFMyujYUsogVO7+1g4+2aRRfTla4Uvf82/ERatw1vMK5ctRoz
         vZQG+4s/9Ddz3nkuuFP+Tt6SsrIaI0p1E+Bkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361746; x=1751966546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9tMwKKV17TTvsTFK7dQXew3Cofw+lQuFXBbrD3s440=;
        b=CWDSyKISdcYGEDtkMjJ5xUC9s/iaa+9f2IGQ6Em05V1a0/qDptcGQoi1Urjs9wjxKl
         0BYIUs0noV8FU5WEpAkDGl4WmJNYlmGg8OhkBCt+l7UMqN2MBUu0dQiXUmETkuXF7y6P
         yDJLZFZQOw60t25Nny5bs+pWxAcNI7zWFvTOt6BylF9tLvpBu8NFm8uKLlrpj9YCZVsg
         EfSlQFk8/3J0O46uRmO3I9ndss90aCuF/YkyqgS0AkKXgyy8XE2uBHfrq/kStvaoxihk
         XQsCIjQux02w+dP4jeS7CMHcfTFndZwjFRqyqu2+PiY/+ZE7laW0SZu7Hx1VgnuzwMMA
         lxgg==
X-Forwarded-Encrypted: i=1; AJvYcCU2NCk0D08Ux8OuIral890ViLZmSq6+xZN+S3uOPLShMwZFOmmX8fraZ72cTWZVwo+2ogx011SFFUDMCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxhWyTbbVS4OaRtjsjrvnjqGcQ4ytgswbQNlpFp0SA6Dd52PCX
	XAo7Y+ZKLvMB3Aq0rKHk3yxFRLSP3ceSUuMsgM8VN93Ygs/i8SAxSwfbdFqTqV+aNlHFRXd9vW2
	CT/hZkg==
X-Gm-Gg: ASbGncv96geCiIkRC4G6WFAAEvTaKcCitFGLUcaS1PJFWex4+QheEQCcp9Do9JKAvX5
	uZdsw1v2XCBT2AtTS7ggt5IRT5e/E6VXTmd2LR9o24yR57wArujaY9HGVIjHH1pwF06omh0ISKQ
	tuOifkjRVjqB6yu+vTIHB4bSEMIimFQKTJokpHvN4FzpkA+b5Pcu1mxEhlifnxi6eZBej5HhjAb
	Y3eVY1C4UMsDXQSnik4AlxMefrxWH6okuSzB19b1UZQyFu9ApX8Dfd0vYtUU6c3I0ErgheBFQ7U
	sniVUYqsL7EfLncfrkCF7NYrhtuIthfsn03XBrH4xQK6iAYLLaV6672qziA66mbEG2v/rhk7xSo
	BI9wpTuzwKsjgBxQgdyAE0eqT6QAw
X-Google-Smtp-Source: AGHT+IFJctnVl3kAivitqXQwO6WiV+HcT09pB5cJ/QUjC004rSXYmchG7+a9AExtBSWJk7tswmYDbg==
X-Received: by 2002:a05:6512:318f:b0:553:510d:f46b with SMTP id 2adb3069b0e04-5550b8b0549mr5997813e87.32.1751361745495;
        Tue, 01 Jul 2025 02:22:25 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b934csm1733763e87.95.2025.07.01.02.22.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:22:23 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b5226e6beso26386661fa.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 02:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGsXKYPZnqQcSdOfwAtOAa8qUncUU/bL9HLv2OlDHH54IDILpMPn3oINthbjbmlXTuXwbZYRhem9o8lw==@vger.kernel.org
X-Received: by 2002:a05:651c:3c6:b0:32b:590f:47cb with SMTP id
 38308e7fff4ca-32cdc49c942mr31566521fa.15.1751361742529; Tue, 01 Jul 2025
 02:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org> <20250629175045.GC6260@pendragon.ideasonboard.com>
In-Reply-To: <20250629175045.GC6260@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 11:22:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCuUFUtwenuefqf__=bpyNr0jxFML0hq5spktA+w441Jjw@mail.gmail.com>
X-Gm-Features: Ac12FXw-vWZDkC22fNJPHs7bYPytUF_2gtuqpU-8HcNvZI1K7oxyCe6dK0RwoJs
Message-ID: <CANiDSCuUFUtwenuefqf__=bpyNr0jxFML0hq5spktA+w441Jjw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
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

On Sun, 29 Jun 2025 at 19:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Jun 05, 2025 at 05:53:01PM +0000, Ricardo Ribalda wrote:
> > Fetch the orientation from the fwnode and map it into a control.
> >
> > The uvc driver does not use the media controller, so we need to create a
> > virtual entity, like we previously did with the external gpio.
> >
> > We do not re-purpose the external gpio entity because its is planned to
> > remove it.
>
> Comparing the GUIDs for the EXT_GPIO_CONTROLLER and SWENTITY, we have
>
> #define UVC_GUID_EXT_GPIO_CONTROLLER \
>         {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> #define UVC_GUID_SWENTITY \
>         {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
>
> The GUIDs don't carry any special meaning in their values. I agree with
> the plan to drop the existing features of the GPIO entity, but wouldn't
> it be easier to rename UVC_GUID_EXT_GPIO_CONTROLLER to UVC_GUID_SWENTITY
> and UVC_EXT_GPIO_UNIT* to UVC_SWENTITY_UNIT* (the macros are not exposed
> to userspace), and later drop the existing GPIO controls from the entity

It would make my life easier if we keep the naming as is, the final
result will be identical.

Maybe you want to take a look into
https://patchwork.linuxtv.org/project/linux-media/list/?series=14066 ?

Will it help if I rebase it to the current media-committers/next. It
has been hanging around since november.



> ?
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/Makefile       |  3 +-
> >  drivers/media/usb/uvc/uvc_ctrl.c     | 21 +++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c   | 14 +++++--
> >  drivers/media/usb/uvc/uvc_entity.c   |  1 +
> >  drivers/media/usb/uvc/uvc_swentity.c | 73 ++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h     | 14 +++++++
> >  include/linux/usb/uvc.h              |  3 ++
> >  7 files changed, 125 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..b4398177c4bb0a9bd49dfd4ca7f2e933b4a1d7df 100644
> > --- a/drivers/media/usb/uvc/Makefile
> > +++ b/drivers/media/usb/uvc/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > +               uvc_swentity.o
> >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> >  uvcvideo-objs  += uvc_entity.o
> >  endif
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 47e8ccc39234d1769384b55539a21df07f3d57c7..b2768080c08aafa85acb9b7f318672c043d84e55 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -376,6 +376,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >                               | UVC_CTRL_FLAG_GET_DEF
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = 0,
> > +             .index          = 0,
> > +             .size           = 1,
> > +             .flags          = UVC_CTRL_FLAG_GET_CUR,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -975,6 +982,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> >               .name           = "Region of Interest Auto Ctrls",
> >       },
> > +     {
> > +             .id             = V4L2_CID_CAMERA_ORIENTATION,
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = 0,
> > +             .size           = 8,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > +             .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> > +                                       V4L2_CAMERA_ORIENTATION_FRONT),
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > @@ -3210,6 +3228,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
> >               } else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> >                       bmControls = entity->gpio.bmControls;
> >                       bControlSize = entity->gpio.bControlSize;
> > +             } else if (UVC_ENTITY_TYPE(entity) == UVC_SWENTITY_UNIT) {
> > +                     bmControls = entity->swentity.bmControls;
> > +                     bControlSize = entity->swentity.bControlSize;
> >               }
> >
> >               /* Remove bogus/blacklisted controls */
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index bcc97f71fa1703aea1119469fb32659c17d9409a..96eeb3aee546487d15f3c30dfe1775189ddf7e47 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
> >               return -1;
> >       }
> >
> > -     /* Add GPIO entity to the first chain. */
> > -     if (dev->gpio_unit) {
> > +     /* Add virtual entities to the first chain. */
> > +     if (dev->gpio_unit || dev->swentity_unit) {
> >               chain = list_first_entry(&dev->chains,
> >                                        struct uvc_video_chain, list);
> > -             list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > +             if (dev->gpio_unit)
> > +                     list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> > +             if (dev->swentity_unit)
> > +                     list_add_tail(&dev->swentity_unit->chain,
> > +                                   &chain->entities);
> >       }
> >
> >       return 0;
> > @@ -2249,6 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
> >       if (ret < 0)
> >               goto error;
> >
> > +     ret = uvc_swentity_init(dev);
> > +     if (ret < 0)
> > +             goto error;
> > +
> >       dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> >                dev->uvc_version >> 8, dev->uvc_version & 0xff,
> >                udev->product ? udev->product : "<unnamed>",
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..d1a652ef35ec34801bd39a5124b834edf838a79e 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >               case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> >               case UVC_EXTERNAL_VENDOR_SPECIFIC:
> >               case UVC_EXT_GPIO_UNIT:
> > +             case UVC_SWENTITY_UNIT:
> >               default:
> >                       function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> >                       break;
> > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..702a2c26e029a0655dade177ed2a9b88d7a4136d
> > --- /dev/null
> > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      uvc_swentity.c  --  USB Video Class driver
> > + *
> > + *      Copyright 2025 Google LLC
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/usb/uvc.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include "uvcvideo.h"
>
> Blank lines between header groups would be nice.
ack
>
> > +
> > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *data, u16 size)
> > +{
> > +     if (size < 1)
> > +             return -EINVAL;
> > +
> > +     switch (entity->swentity.props.orientation) {
> > +     case V4L2_FWNODE_ORIENTATION_FRONT:
> > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_FRONT;
> > +             break;
> > +     case V4L2_FWNODE_ORIENTATION_BACK:
> > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_BACK;
> > +             break;
> > +     default:
> > +             *(u8 *)data = V4L2_CAMERA_ORIENTATION_EXTERNAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_swentity_get_info(struct uvc_device *dev,
> > +                              struct uvc_entity *entity, u8 cs, u8 *caps)
> > +{
> > +     *caps = UVC_CONTROL_CAP_GET;
> > +     return 0;
> > +}
> > +
> > +int uvc_swentity_init(struct uvc_device *dev)
> > +{
> > +     static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> > +     struct v4l2_fwnode_device_properties props;
> > +     struct uvc_entity *unit;
> > +     int ret;
> > +
> > +     ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > +     if (ret)
> > +             return dev_err_probe(&dev->intf->dev, ret,
> > +                                  "Can't parse fwnode\n");
> > +
> > +     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > +             return 0;
> > +
> > +     unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > +     if (!unit)
> > +             return -ENOMEM;
> > +
> > +     memcpy(unit->guid, uvc_swentity_guid, sizeof(unit->guid));
> > +     unit->swentity.props = props;
> > +     unit->swentity.bControlSize = 1;
> > +     unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > +     unit->swentity.bmControls[0] = 1;
> > +     unit->get_cur = uvc_swentity_get_cur;
> > +     unit->get_info = uvc_swentity_get_info;
> > +     strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> > +
> > +     list_add_tail(&unit->list, &dev->entities);
> > +
> > +     dev->swentity_unit = unit;
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index dc23d8a97340dc4615d4182232d395106e6d9ed5..a931750bdea25b9062dcc7644bf5f2ed89c1cb4c 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -19,6 +19,7 @@
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fh.h>
> >  #include <media/videobuf2-v4l2.h>
> > +#include <media/v4l2-fwnode.h>
>
> Alphabetical order.
>
> >
> >  /* --------------------------------------------------------------------------
> >   * UVC constants
> > @@ -41,6 +42,9 @@
> >  #define UVC_EXT_GPIO_UNIT            0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID         0x100
> >
> > +#define UVC_SWENTITY_UNIT            0x7ffd
> > +#define UVC_SWENTITY_UNIT_ID         0x101
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
> > @@ -242,6 +246,12 @@ struct uvc_entity {
> >                       int irq;
> >                       bool initialized;
> >               } gpio;
> > +
> > +             struct {
> > +                     u8  bControlSize;
> > +                     u8  *bmControls;
> > +                     struct v4l2_fwnode_device_properties props;
> > +             } swentity;
> >       };
> >
> >       u8 bNrInPins;
> > @@ -617,6 +627,7 @@ struct uvc_device {
> >       } async_ctrl;
> >
> >       struct uvc_entity *gpio_unit;
> > +     struct uvc_entity *swentity_unit;
> >  };
> >
> >  enum uvc_handle_state {
> > @@ -836,4 +847,7 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >                           size_t size);
> >
> > +/* swentity */
> > +int uvc_swentity_init(struct uvc_device *dev);
> > +
> >  #endif
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index bce95153e5a65613a710d7316fc17cf5462b5bce..88a23e8919d1294da4308e0e3ca0eccdc66a318f 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_SWENTITY \
> > +     {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > +      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
> >
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

