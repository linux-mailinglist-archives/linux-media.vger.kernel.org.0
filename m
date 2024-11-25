Return-Path: <linux-media+bounces-22018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D109D88DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5116283722
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1682F1B3926;
	Mon, 25 Nov 2024 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jS/+LC3t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B3157465
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547430; cv=none; b=VlN+2ggwVlSsYhI8Y2Vxm50vzxcXW3hHQMKxNEc7me1VG7ApN7d2IBbNZk43TvRPRee8w9dfS8OxtpOBvXrWpKOeAedLHirRcN4vCnfoJAt4S597PnEjreCPMSrEgERhwSklmA3zTNJCuU20I+lS5cjYDfZaFf0u1mORFW3VVXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547430; c=relaxed/simple;
	bh=atf/Nz4TS5oB81I1hwXMwxwhW+NENmbFQY4fTZoqfKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ss8/qC7npUYEWH+C0okraW9GGVlDOIbKVysQXYlodAGId7Dws3a13uO6w1NEbPCY1h9EwfGJkwVr1P2Q5lXvadRaoAesNCktVZu9rxTqqf46UV6+pM3bGBZ6o9hqDJkCwVPgHb6tQOT1yjLVHAZlRC4UD8NJhTNJOWGFvm46Xgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jS/+LC3t; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f450f7f11dso3246198a12.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732547427; x=1733152227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3msunHjcfAboNwcVyr01gajcurYTlIrGSDpenqCNow4=;
        b=jS/+LC3tEH55SBpfdLvcPH6W4uMKHyUP5kJcWeDEvZeDQOCovDdnDtZghYecWq0qIX
         7MNhfgxGfJY18rqX/tzu+ocCC1kU8olkzZIXpoq1Hyd2WPalh9shBzudkc6xUNbEKr96
         zmJRZnzvPYXr6OnlmBEhgjk4h8gUJiO63trNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547427; x=1733152227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3msunHjcfAboNwcVyr01gajcurYTlIrGSDpenqCNow4=;
        b=OFG7FG+xpVmrf7ZROGUdJYoS870rpLlKc+6JkdedCqz11Gxikf4XryiGIabqcvHOnK
         XT5NMVEND8669qQJW8tQhb8aUuDxvMv1IOgEs1zw2Hyq5bFzQaqlSJTfgJLB02GYkz+F
         aO7mLgOyTZccmM/pTROuLQWRX7tpHY1rhXwC7bDE+Y4Mzm8JLqkRIJXtpWhi6tOQNJAD
         YCD3M5XPNw9jKHQiTyjhGCfzvW0UWNhB4j39u3DACb1wHzpfp56IWpjQg/l7CEbdr1sv
         GXRcCBkzAPl9tsgz7QAvSpipfsNtSL7mNPCjG9ODzo5RVSS7xgpmjQ/v4hKWy5lHqO6N
         pwQg==
X-Forwarded-Encrypted: i=1; AJvYcCUW2MFSc7PJIuNmkwIdg28ys2YYO8jcI3uyLSOGt/F4Aepnu3e/VhR1rx9qTSsnc1rsbOo6TSX/l55uqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1G831k7qNMI1gyq0tIevIejHTrK2jz4fncQcZleQCSdwrtkr
	joWAFz+UgDFz0jVz377wtzDWVNppAmdGgAI2FSPIG7JBOBWkeH1V/aERMVkTP1EcapTGtvqLah0
	=
X-Gm-Gg: ASbGncsZ+dhjkIlAixkrHtSeup5iL3WIr6t4gbSkWrnpqDUrhoz8RsBD9wjFLlKgT5d
	xC3RzpcJ73K3nxzSu3vVNW1DoI54nU/5Ciwxd+a5hu4RO7qUb4B15Ad8G7JtT8stvEcsw1U+hah
	oRXKlmT1W0bFyneUqlKRRdajwzeITv3nVeTfDhfflcN5JjPC1JnsZLBn6DZZkzTY2l2YKt+BOk2
	jB4MWa/Sk2GPqdiYxuBWTodRQMvqXX4VYIrtlLxt7eIlyzu2ykBUuy5LMiMsNPqnCdMPiW7BxrZ
	i+mCia9IlKECOCuu
X-Google-Smtp-Source: AGHT+IGfr4mYbs9PdwhvPVsSW0oNmtyH0MLYXK+ZDrqO9TggTTeQMyohIHXyw6+w/yCx8t4hoXfCag==
X-Received: by 2002:a05:6a20:1582:b0:1d4:fc66:30e8 with SMTP id adf61e73a8af0-1e09e3f0006mr18711218637.10.1732547426615;
        Mon, 25 Nov 2024 07:10:26 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfbfe5fsm5742143a12.15.2024.11.25.07.10.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:10:25 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724f42c1c38so1649066b3a.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 07:10:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbhM5YE90LIdt29874gOeRK3QhVPs5gzOgp4Xu1FsD/dRpkxxLdzkUTYbLfu5MBzUMFUtRN+ZAiOZoCw==@vger.kernel.org
X-Received: by 2002:a05:6a00:17a1:b0:71e:427a:68de with SMTP id
 d2e1a72fcca58-724df6a9469mr18627612b3a.24.1732547424469; Mon, 25 Nov 2024
 07:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <20241112-uvc-subdev-v3-2-0ea573d41a18@chromium.org> <7da09249-f2ff-4a0c-8a06-1594b02ce87a@redhat.com>
In-Reply-To: <7da09249-f2ff-4a0c-8a06-1594b02ce87a@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Nov 2024 16:10:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCsQ3Rp55+9WbporH37W_-XHaXCR0iww6n6kHXngKh67TQ@mail.gmail.com>
Message-ID: <CANiDSCsQ3Rp55+9WbporH37W_-XHaXCR0iww6n6kHXngKh67TQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] media: uvcvideo: Factor out gpio functions to its
 own file
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 15:45, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> > This is just a refactor patch, no new functionality is added.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I guess this patch may need to change depending on if we want
> to keep the GPIO handling as a UVC entity or not.

I have a v4 that removes the virtual uvc entity. Still with that
approach IMHO this patch makes sense.

I was planning to send it today, I am testing it right now.

>
> Laurent what is your take on this, should this stay as
> a struct uvc_entity; or should the gpio_desc and input_device
> be stored directly inside struct uvc_device as is done for
> the snapshot-button input_device?
>
>
> Also de we want a separate input_device for this or do
> we re-use the snapshot button one ?
>
> Since my plan is to open-up the permission on the device with
> the SW_CAMERA_LENS_COVER to be equal to the /dev/video#
> permissions sharing has the downside of allowing keylogging
> of the snapshot button.

A downside of having 2 devices is that userspace will have to either
figure out what evdev they want to use or listen to both....

I do not have a strong preference.


>
> Either way (one or 2 input-devices) I don't have a strong
> preference.
>
> Regards,
>
> Hans
>
>
>
>
> > ---
> >  drivers/media/usb/uvc/Makefile     |   3 +-
> >  drivers/media/usb/uvc/uvc_driver.c | 119 +------------------------------------
> >  drivers/media/usb/uvc/uvc_gpio.c   | 118 ++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |   8 +++
> >  4 files changed, 131 insertions(+), 117 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
> > index 4f9eee4f81ab..85514b6e538f 100644
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
> > index cd13bf01265d..5b48768a4f7f 100644
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
> > @@ -775,9 +774,9 @@ static const u8 uvc_media_transport_input_guid[16] =
> >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> >
> > -static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > -                                            u16 id, unsigned int num_pads,
> > -                                            unsigned int extra_size)
> > +struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > +                                     u16 id, unsigned int num_pads,
> > +                                     unsigned int extra_size)
> >  {
> >       struct uvc_entity *entity;
> >       unsigned int num_inputs;
> > @@ -1240,118 +1239,6 @@ static int uvc_parse_control(struct uvc_device *dev)
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
> > -     if (IS_ERR_OR_NULL(gpio_privacy))
> > -             return PTR_ERR_OR_ZERO(gpio_privacy);
> > -
> > -     irq = gpiod_to_irq(gpio_privacy);
> > -     if (irq < 0)
> > -             return dev_err_probe(&dev->intf->dev, irq,
> > -                                  "No IRQ for privacy GPIO\n");
> > -
> > -     unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > -                                 UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > -     if (IS_ERR(unit))
> > -             return PTR_ERR(unit);
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
> > index 000000000000..453739acbe8f
> > --- /dev/null
> > +++ b/drivers/media/usb/uvc/uvc_gpio.c
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      uvc_gpio.c  --  USB Video Class driver
> > + *
> > + *      Copyright 2024 Google LLC
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
> > +     if (IS_ERR_OR_NULL(gpio_privacy))
> > +             return PTR_ERR_OR_ZERO(gpio_privacy);
> > +
> > +     irq = gpiod_to_irq(gpio_privacy);
> > +     if (irq < 0)
> > +             return dev_err_probe(&dev->udev->dev, irq,
> > +                                  "No IRQ for privacy GPIO\n");
> > +
> > +     unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > +                                 UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > +     if (IS_ERR(unit))
> > +             return PTR_ERR(unit);
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
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 965a789ed03e..91ed59b54d9a 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -673,6 +673,9 @@ do {                                                                      \
> >  extern struct uvc_driver uvc_driver;
> >
> >  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > +struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > +                                     u16 id, unsigned int num_pads,
> > +                                     unsigned int extra_size);
> >
> >  /* Video buffers queue management. */
> >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> > @@ -817,4 +820,9 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
> >  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
> >                           size_t size);
> >
> > +/* gpio */
> > +int uvc_gpio_parse(struct uvc_device *dev);
> > +int uvc_gpio_init_irq(struct uvc_device *dev);
> > +void uvc_gpio_deinit(struct uvc_device *dev);
> > +
> >  #endif
> >
>


-- 
Ricardo Ribalda

