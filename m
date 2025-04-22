Return-Path: <linux-media+bounces-30759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A5EA97A78
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 00:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B2A17AB16C
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103242C3769;
	Tue, 22 Apr 2025 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U0mo0qwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F371E990E
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360732; cv=none; b=s8DdUHPk5S2J19PmfrexTC1VPhb+bSlNmpb6O0+jCVzWoj8+A3BB04UfGKatRRIqVLyW3orE6+vxOr8eEwBtr0mttzZZjihZGlVrb/Wh7a6ZJG+Y3nM8rRpzCEwhNz86c4f63If6NCaRCrUwtOzyEb0drGbg2WwFrI37381KXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360732; c=relaxed/simple;
	bh=IhWiCysnU1O1r+4wj+Iyzx3Zk2b7ovIvXaDh8CZgsmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D01SP+y3911LDp+X6ehmwTOnCyUE6TxYb0Be0742uEnArWurLa7Gs1LaSjryPk0ZqRfQndiGcb1y3vHnr7OD6oqVqrcQhuzclu6cs6u6jZRgxpG9Z7KQ+WfpwyTcM+OUQb+cNUE7SdqKWrtXMH/XBKXWLV0ftgnBZstPnNRjksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U0mo0qwZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so813709466b.0
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745360728; x=1745965528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RisIZZpdy5KkKpBatFJsmDGzCJSoUPI5jtnZDaEF2M=;
        b=U0mo0qwZlXSPAGltb0aNmOqtCZ3/tHHcqdcyVrl1voMGmb4DeFfFsQvwmMt7h3o0Hy
         d94E/MO7CO7Xc8U4bt6D3J2NHdHrDwS23LRS5Ht64dQh7tq0sakv1lkxfzaoYpsvSrer
         Kfa8WUdR7r90Rf9zyDaEhHwbp3+h/Rul502Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360728; x=1745965528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RisIZZpdy5KkKpBatFJsmDGzCJSoUPI5jtnZDaEF2M=;
        b=JqIdqwpcf6VFRNLgvbOm/Cx9NS3jPI8UlsHS2TGRTajTPQ5au4bahVdrFcoPqOa63p
         EJIFci3+GAhjiaY4FphVi1h+JReZWdAv8uLGqr32oWtbbiv/sXG27JIKjxhwaDUxtRKn
         uv4/z5SCinP/Xz5rJIBBNcSbhqYlOfquzeSXFTgjbhEiwEzPUpnGzOzFouKa8nu+ZcJ6
         vsv5JFruAKpvGQnyDnvebxKQMFUXwEdQcrXz+b9YZNOuLlTXMiTungBJjfD6IsXbdKmj
         A6OVBhuMo15pRUIk6PcAxo63BEQoBltzZdefNry7YKcPO7KcxFeXGIsV5kOAk4vITQS1
         igOg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxUAoFPoMlEXwCnT0DfkeoUO1Qs907RC0ktLyUn0o7mwTkjFvmFLJRGIQI43ei07m2cVow0R3+DOmXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB6mzrsS5AkU5AFd47XA2SAl5yexnSTEJvnuRvGg2TAyEc15M3
	4O5AQhyLct+3QyQESxHefIvv9AQfFm7b+wExZY1utKLB5zR6KxcsOpP4+CvBux5570FznvTVKmz
	v8w==
X-Gm-Gg: ASbGncuxLupMAfTadHWTKLWkds4DxIorUVCusxU2qzR8Vug8ZZDKWjvOy9KR5/cf7Wu
	PhHkmngHjKpmjZtvf1B5kHUh+qiPGE6plIU/7rIuT2s4iCyoyo37Jn4FGb52BrMpU4SdWEpscNz
	qgoPM8OMW6xNwEHS3FVfHdZyadIvmZdF6aZ7uJCW818LvFhZpUMWwsz3qcGmQc2g+52uGKH5kQB
	UgP1k/Ug1DlNavG4dXTqhR/3xhh6Mt4suvTY5g3wb4BMAorhyPvTuhjw4oePlJKCOvvXglcGEV5
	Wq+pk97A2waG+sp7EYNdv+X5g8O6K4nUmSd6E7A+lQb/yjon8I5Zg2PZhCBnqqM9CzHyWRgeNvJ
	mwQk=
X-Google-Smtp-Source: AGHT+IHkrdxTkFNvZQtmRSEuqquMc29BUxzogQpnqL1cUze3E8oL0y+lrQ2C4TnB0Ji9yxLGqnrehQ==
X-Received: by 2002:a17:907:2d0b:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acb74aa9af0mr1715168666b.4.1745360728340;
        Tue, 22 Apr 2025 15:25:28 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec91f18sm705043766b.83.2025.04.22.15.25.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:25:27 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so52394825e9.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:25:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUT5M6QCub7L6DKVoxoqfS5mgJ5LU0H0wrr0B6hGX8HsvWHrB7MZ5SlWfVHbZp1hCzdosn8yxChetl0cA==@vger.kernel.org
X-Received: by 2002:a2e:9fc2:0:b0:30d:e104:b67d with SMTP id
 38308e7fff4ca-31090564a9dmr51657691fa.40.1745360423509; Tue, 22 Apr 2025
 15:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org> <20250422212824.GQ17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422212824.GQ17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:20:09 +0800
X-Gmail-Original-Message-ID: <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com>
X-Gm-Features: ATxdqUGIhjZvbmNCpbPrynHifQrHVxxDwsRGMfa0T4T_eCecFDTqz3Zdu3ccroM
Message-ID: <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com>
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its own file
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 23 Apr 2025 at 05:28, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
> functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
> Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
> still use a uvc_entity if it moves to a evdev. There are implications on
> this series too. Unless I'm mistaken, I haven't seen a reply from you to
> my last e-mail. Can we please first finish that discussion ?

Are you referring to:
https://lore.kernel.org/all/0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com/
?

Is it an open discussion? I believe we agreed to remove the uvc_entity.

I posted v4 back in november. In that version I remove completely the
uvc_entity:
https://patchwork.linuxtv.org/project/linux-media/patch/20241125-uvc-subdev-v4-6-51e040599f1a@chromium.org/



Regardss
>
> On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
> > This is just a refactor patch, no new functionality is added.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/Makefile     |   3 +-
> >  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
> >  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
> >  4 files changed, 133 insertions(+), 120 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
> > --- a/drivers/media/usb/uvc/Makefile
> > +++ b/drivers/media/usb/uvc/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
> > -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
> > +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
> > +               uvc_gpio.o
> >  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
> >  uvcvideo-objs  += uvc_entity.o
> >  endif
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -8,7 +8,6 @@
> >
> >  #include <linux/atomic.h>
> >  #include <linux/bits.h>
> > -#include <linux/gpio/consumer.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
> >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> >
> > -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > -             unsigned int num_pads, unsigned int extra_size)
> > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > +                                 unsigned int extra_size)
> >  {
> >       struct uvc_entity *entity;
> >       unsigned int num_inputs;
> > @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
> >       return 0;
> >  }
> >
> > -/* -----------------------------------------------------------------------------
> > - * Privacy GPIO
> > - */
> > -
> > -static void uvc_gpio_event(struct uvc_device *dev)
> > -{
> > -     struct uvc_entity *unit = dev->gpio_unit;
> > -     struct uvc_video_chain *chain;
> > -     u8 new_val;
> > -
> > -     if (!unit)
> > -             return;
> > -
> > -     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > -
> > -     /* GPIO entities are always on the first chain. */
> > -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > -     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > -}
> > -
> > -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > -                         u8 cs, void *data, u16 size)
> > -{
> > -     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > -             return -EINVAL;
> > -
> > -     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > -
> > -     return 0;
> > -}
> > -
> > -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > -                          u8 cs, u8 *caps)
> > -{
> > -     if (cs != UVC_CT_PRIVACY_CONTROL)
> > -             return -EINVAL;
> > -
> > -     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > -     return 0;
> > -}
> > -
> > -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > -{
> > -     struct uvc_device *dev = data;
> > -
> > -     uvc_gpio_event(dev);
> > -     return IRQ_HANDLED;
> > -}
> > -
> > -static int uvc_gpio_parse(struct uvc_device *dev)
> > -{
> > -     struct uvc_entity *unit;
> > -     struct gpio_desc *gpio_privacy;
> > -     int irq;
> > -
> > -     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > -                                            GPIOD_IN);
> > -     if (!gpio_privacy)
> > -             return 0;
> > -
> > -     if (IS_ERR(gpio_privacy))
> > -             return dev_err_probe(&dev->intf->dev,
> > -                                  PTR_ERR(gpio_privacy),
> > -                                  "Can't get privacy GPIO\n");
> > -
> > -     irq = gpiod_to_irq(gpio_privacy);
> > -     if (irq < 0)
> > -             return dev_err_probe(&dev->intf->dev, irq,
> > -                                  "No IRQ for privacy GPIO\n");
> > -
> > -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > -     if (!unit)
> > -             return -ENOMEM;
> > -
> > -     unit->gpio.gpio_privacy = gpio_privacy;
> > -     unit->gpio.irq = irq;
> > -     unit->gpio.bControlSize = 1;
> > -     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > -     unit->gpio.bmControls[0] = 1;
> > -     unit->get_cur = uvc_gpio_get_cur;
> > -     unit->get_info = uvc_gpio_get_info;
> > -     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > -
> > -     list_add_tail(&unit->list, &dev->entities);
> > -
> > -     dev->gpio_unit = unit;
> > -
> > -     return 0;
> > -}
> > -
> > -static int uvc_gpio_init_irq(struct uvc_device *dev)
> > -{
> > -     struct uvc_entity *unit = dev->gpio_unit;
> > -     int ret;
> > -
> > -     if (!unit || unit->gpio.irq < 0)
> > -             return 0;
> > -
> > -     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > -                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > -                                IRQF_TRIGGER_RISING,
> > -                                "uvc_privacy_gpio", dev);
> > -
> > -     unit->gpio.initialized = !ret;
> > -
> > -     return ret;
> > -}
> > -
> > -static void uvc_gpio_deinit(struct uvc_device *dev)
> > -{
> > -     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > -             return;
> > -
> > -     free_irq(dev->gpio_unit->gpio.irq, dev);
> > -}
> > -
> >  /* ------------------------------------------------------------------------
> >   * UVC device scan
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
> > --- /dev/null
> > +++ b/drivers/media/usb/uvc/uvc_gpio.c
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      uvc_gpio.c  --  USB Video Class driver
> > + *
> > + *      Copyright 2025 Google LLC
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/gpio/consumer.h>
> > +#include "uvcvideo.h"
> > +
> > +static void uvc_gpio_event(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *unit = dev->gpio_unit;
> > +     struct uvc_video_chain *chain;
> > +     u8 new_val;
> > +
> > +     if (!unit)
> > +             return;
> > +
> > +     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > +
> > +     /* GPIO entities are always on the first chain. */
> > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +     uvc_ctrl_status_event(chain, unit->controls, &new_val);
> > +}
> > +
> > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                         u8 cs, void *data, u16 size)
> > +{
> > +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > +             return -EINVAL;
> > +
> > +     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > +                          u8 cs, u8 *caps)
> > +{
> > +     if (cs != UVC_CT_PRIVACY_CONTROL)
> > +             return -EINVAL;
> > +
> > +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > +{
> > +     struct uvc_device *dev = data;
> > +
> > +     uvc_gpio_event(dev);
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +int uvc_gpio_parse(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *unit;
> > +     struct gpio_desc *gpio_privacy;
> > +     int irq;
> > +
> > +     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
> > +                                            GPIOD_IN);
> > +     if (!gpio_privacy)
> > +             return 0;
> > +
> > +     if (IS_ERR(gpio_privacy))
> > +             return dev_err_probe(&dev->intf->dev,
> > +                                  PTR_ERR(gpio_privacy),
> > +                                  "Can't get privacy GPIO\n");
> > +
> > +     irq = gpiod_to_irq(gpio_privacy);
> > +     if (irq < 0)
> > +             return dev_err_probe(&dev->intf->dev, irq,
> > +                                  "No IRQ for privacy GPIO\n");
> > +
> > +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > +     if (!unit)
> > +             return -ENOMEM;
> > +
> > +     unit->gpio.gpio_privacy = gpio_privacy;
> > +     unit->gpio.irq = irq;
> > +     unit->gpio.bControlSize = 1;
> > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > +     unit->gpio.bmControls[0] = 1;
> > +     unit->get_cur = uvc_gpio_get_cur;
> > +     unit->get_info = uvc_gpio_get_info;
> > +     strscpy(unit->name, "GPIO", sizeof(unit->name));
> > +
> > +     list_add_tail(&unit->list, &dev->entities);
> > +
> > +     dev->gpio_unit = unit;
> > +
> > +     return 0;
> > +}
> > +
> > +int uvc_gpio_init_irq(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *unit = dev->gpio_unit;
> > +     int ret;
> > +
> > +     if (!unit || unit->gpio.irq < 0)
> > +             return 0;
> > +
> > +     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> > +                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > +                                IRQF_TRIGGER_RISING,
> > +                                "uvc_privacy_gpio", dev);
> > +
> > +     unit->gpio.initialized = !ret;
> > +
> > +     return ret;
> > +}
> > +
> > +void uvc_gpio_deinit(struct uvc_device *dev)
> > +{
> > +     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> > +             return;
> > +
> > +     free_irq(dev->gpio_unit->gpio.irq, dev);
> > +}
> > +
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -683,6 +683,8 @@ do {                                                                      \
> >   */
> >
> >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
> > +                                 unsigned int extra_size);
> >
> >  /* Video buffers queue management. */
> >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >                           size_t size);
> >
> > +/* gpio */
> > +int uvc_gpio_parse(struct uvc_device *dev);
> > +int uvc_gpio_init_irq(struct uvc_device *dev);
> > +void uvc_gpio_deinit(struct uvc_device *dev);
> >  #endif
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

