Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D60C2E0E43
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 19:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgLVShq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 13:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLVShq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 13:37:46 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212A2C061793
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 10:37:06 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id q137so12821201iod.9
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 10:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFRKlZMQ3y8Jn2gz1E3cY4AWXQFcO7a6N7lOXVfjKE0=;
        b=mmBm5m3NuLCuxwe7q7l27YrracpfWAMp0H7ctles5OYbr1LFOVXWy/Y07E4EJQr0t9
         ihT1hrt3DemhscVExy6JhwCwdof+C/5ixyVCGJyLmKaQF1Re915jGO+/IadxXqXiGRt0
         2LftQPR0/MuTaTLgfl3BQbRB0yH60BboshxgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFRKlZMQ3y8Jn2gz1E3cY4AWXQFcO7a6N7lOXVfjKE0=;
        b=WNPju5dxr+0u6hmgMYbKvcwDbhl6ZQBlAlDwPXmq2njTUjgzi0Vr6LA9Fyz0KNToY5
         qCCczuSUYm1hiySC2XuqtRCWl9s5xKeXyK4n4mk6soxxY0vC043jvrG1Gyo/PiHBIVMG
         QW7JGu6wGoXnoCH4N6KbjJLdOu5bhmx+pQf1u2o1jc/pO9A4T8182UtVWzXH8Ei/6ans
         llBwvZUOl87bRXIJahM9PvbaQx6CqzgXCVrstE7CKMG6G8OuV5h5x1Wyck880is/HI8K
         IUtt52fkDh7ZHb4IG33zFXIZ26amZRJey0VWIndGHA1tGzuzVc2AAF6vNx/GOSMVG63g
         f26w==
X-Gm-Message-State: AOAM530Jsa85W2h6XAAMuy001DoxdcB3SqnoDJn24Eiau1FCnQrri/2e
        qQNkDvztKtZkO/e3Mea3fmcCKY9bKvrSJQ==
X-Google-Smtp-Source: ABdhPJw6A6uOt2XmLsRqVjObPCAHqSfZxu+bnA8vPmJ0HOZHw2IZwkT0WopE8xWZIfCurBPMS1I5uQ==
X-Received: by 2002:a05:6638:ecd:: with SMTP id q13mr20184200jas.62.1608662224793;
        Tue, 22 Dec 2020 10:37:04 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id v5sm24375990iob.26.2020.12.22.10.37.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 10:37:04 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id y5so12856756iow.5
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 10:37:03 -0800 (PST)
X-Received: by 2002:a05:6638:248a:: with SMTP id x10mr19817991jat.29.1608662223067;
 Tue, 22 Dec 2020 10:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20201221164819.792019-1-ribalda@chromium.org> <20201221164819.792019-8-ribalda@chromium.org>
 <X+GvbpC0vhitCHRo@pendragon.ideasonboard.com>
In-Reply-To: <X+GvbpC0vhitCHRo@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 22 Dec 2020 19:36:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCuHZB+Y-043t+4jd39vH+-zG+LAtB3P5AaRcYvSPTnY+Q@mail.gmail.com>
Message-ID: <CANiDSCuHZB+Y-043t+4jd39vH+-zG+LAtB3P5AaRcYvSPTnY+Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for your review!

On Tue, Dec 22, 2020 at 9:34 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Dec 21, 2020 at 05:48:14PM +0100, Ricardo Ribalda wrote:
> > Some devices can implement a physical switch to disable the input of the
> > camera on demand. Think of it like an elegant privacy sticker.
> >
> > The system can read the status of the privacy switch via a GPIO.
> >
> > It is important to know the status of the switch, e.g. to notify the
> > user when the camera will produce black frames and a videochat
> > application is used.
> >
> > In some systems, the GPIO is connected to main SoC instead of the
> > camera controller, with the connected reported by the system firmware
>
> s/connected/connection/
>
> > (ACPI or DT). In that case, the UVC device isn't aware of the GPIO. We
> > need to implement a virtual entity to handle the GPIO fully on the
> > driver side.
> >
> > For example, for ACPI-based systems, the GPIO is reported in the USB
> > device object:
> >
> >   Scope (\_SB.PCI0.XHCI.RHUB.HS07)
> >   {
> >
> >         /.../
> >
> >     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> >     {
> >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> >             "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, ,
> >             )
> >             {   // Pin list
> >                 0x0064
> >             }
> >     })
> >     Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
> >     {
> >         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
> >         Package (0x01)
> >         {
> >             Package (0x02)
> >             {
> >                 "privacy-gpio",
> >                 Package (0x04)
> >                 {
> >                     \_SB.PCI0.XHCI.RHUB.HS07,
> >                     Zero,
> >                     Zero,
> >                     One
> >                 }
> >             }
> >         }
> >     })
> >   }
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   |   7 ++
> >  drivers/media/usb/uvc/uvc_driver.c | 156 +++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_entity.c |   1 +
> >  drivers/media/usb/uvc/uvcvideo.h   |  16 +++
> >  4 files changed, 180 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 528254230535..a430fa666897 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1300,6 +1300,10 @@ static void __uvc_ctrl_status_event_work(struct uvc_device *dev,
> >
> >       mutex_unlock(&chain->ctrl_mutex);
> >
> > +     /* Events not started by the UVC device. E.g. the GPIO unit */
> > +     if (!w->urb)
> > +             return;
> > +
> >       /* Resubmit the URB. */
> >       w->urb->interval = dev->int_ep->desc.bInterval;
> >       ret = usb_submit_urb(w->urb, GFP_KERNEL);
> > @@ -2317,6 +2321,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >               } else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
> >                       bmControls = entity->camera.bmControls;
> >                       bControlSize = entity->camera.bControlSize;
> > +             } else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> > +                     bmControls = entity->gpio.bmControls;
> > +                     bControlSize = entity->gpio.bControlSize;
> >               }
> >
> >               /* Remove bogus/blacklisted controls */
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index c0c5f75ade40..72516101fdd0 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/atomic.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > @@ -1020,6 +1021,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >  }
> >
> >  static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> > +static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
> >  static const u8 uvc_media_transport_input_guid[16] =
> >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > @@ -1051,6 +1053,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> >        * is initialized by the caller.
> >        */
> >       switch (type) {
> > +     case UVC_EXT_GPIO_UNIT:
> > +             memcpy(entity->guid, uvc_gpio_guid, 16);
> > +             break;
> >       case UVC_ITT_CAMERA:
> >               memcpy(entity->guid, uvc_camera_guid, 16);
> >               break;
> > @@ -1464,6 +1469,137 @@ static int uvc_parse_control(struct uvc_device *dev)
> >       return 0;
> >  }
> >
> > +/* -----------------------------------------------------------------------------
> > + * Privacy GPIO
> > + */
> > +
> > +
> > +static u8 uvc_gpio_update_value(struct uvc_device *dev,
> > +                             struct uvc_entity *unit)
> > +{
> > +     struct uvc_video_chain *chain;
> > +     u8 gpio_val, old_val, new_val;
> > +
> > +     gpio_val = new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> > +
> > +     old_val = atomic_xchg(&unit->gpio.gpio_privacy_value, gpio_val);
> > +     if (new_val == old_val)
> > +             return new_val;
> > +
> > +     /* GPIO entities are always on the first chain. */
> > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +     uvc_ctrl_status_event(NULL, chain, unit->controls, &new_val);
> > +
> > +     return new_val;
> > +}
> > +
> > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                         u8 cs, void *data, u16 size)
> > +{
> > +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > +             return -EINVAL;
> > +
> > +     *(uint8_t *)data = uvc_gpio_update_value(dev, entity);
>
> s/uint8_t/u8/
>
> Do we really need to generate an event when the GPIO is read, if there's
> no IRQ support ?

I think so. Imagine a scenario where you have one process checking for
events and notifying the user about changes, and another process
handling the camera.
Also I think that is the way the v4l2-ctrl behaves.



>
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
> > +static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
> > +{
> > +     struct uvc_video_chain *chain;
> > +     struct uvc_entity *unit;
> > +
> > +     /* GPIO entities are always on the first chain. */
> > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +     list_for_each_entry(unit, &chain->entities, chain) {
> > +             if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
> > +                     return unit;
> > +     }
>
> As there can only be a single GPIO entity, would it make sense to store
> a pointer to it in struct uvc_device to avoid walking the chain every
> time ?
>
> > +
> > +     return NULL;
> > +}
> > +
> > +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> > +{
> > +     struct uvc_device *dev = data;
> > +     struct uvc_entity *unit;
> > +
> > +     unit = uvc_gpio_find_entity(dev);
> > +     if (!unit)
> > +             return IRQ_HANDLED;
> > +
> > +     uvc_gpio_update_value(dev, unit);
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int uvc_gpio_parse(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *unit;
> > +     struct gpio_desc *gpio_privacy;
> > +     int irq;
> > +
> > +     gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
> > +                                            GPIOD_IN);
> > +     if (IS_ERR_OR_NULL(gpio_privacy))
> > +             return PTR_ERR_OR_ZERO(gpio_privacy);
> > +
> > +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > +     if (!unit)
> > +             return -ENOMEM;
> > +
> > +     irq = gpiod_to_irq(gpio_privacy);
> > +     if (irq == -EPROBE_DEFER)
> > +             return -EPROBE_DEFER;
> > +
> > +     if (irq < 0)
> > +             dev_warn(&dev->udev->dev,
> > +                    "Unable to find privacy_gpio: %d\n", irq);
>
> That's not right, the GPIO is found, it's only the IRQ that is
> unsupported.
>
>                 dev_warn(&dev->udev->dev,
>                          "No IRQ for privacy GPIO (%d)\n", irq);
>
> > +
> > +     atomic_set(&unit->gpio.gpio_privacy_value, -1);
> > +     unit->gpio.gpio_privacy = gpio_privacy;
> > +     unit->gpio.irq = irq;
> > +     unit->gpio.bControlSize = 1;
> > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > +     unit->gpio.bmControls[0] = 1;
> > +     unit->get_cur = uvc_gpio_get_cur;
> > +     unit->get_info = uvc_gpio_get_info;
> > +
> > +     sprintf(unit->name, "GPIO");
>
> strncpy() would be simpler.
>
> > +
> > +     list_add_tail(&unit->list, &dev->entities);
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_gpio_init_irq(struct uvc_device *dev)
> > +{
> > +     int ret;
> > +     struct uvc_entity *unit;
>
> Could you please swap those two lines ?
>
> > +
> > +     unit = uvc_gpio_find_entity(dev);
> > +     if (!unit)
> > +             return 0;
> > +
> > +     if (unit->gpio.irq < 0)
> > +             return 0;
> > +
> > +     ret = devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
> > +                                     uvc_gpio_irq,
> > +                                     IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> > +                                      IRQF_TRIGGER_RISING,
>
> Extra space in the indentation.
>
> > +                                     "uvc_privacy_gpio", dev);
> > +     return ret;
>
> No need for a ret variable, you can write
>
>         return devm_request_threaded_irq(...);
>
> (unless you want to move the error message here, see below).
>
> > +}
> > +
> >  /* ------------------------------------------------------------------------
> >   * UVC device scan
> >   */
> > @@ -1915,6 +2051,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> >  {
> >       struct uvc_video_chain *chain;
> >       struct uvc_entity *term;
> > +     struct uvc_entity *unit;
> >
> >       list_for_each_entry(term, &dev->entities, list) {
> >               if (!UVC_ENTITY_IS_OTERM(term))
> > @@ -1953,6 +2090,13 @@ static int uvc_scan_device(struct uvc_device *dev)
> >               return -1;
> >       }
> >
> > +     /* Add GPIO entities to the first chain. */
> > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +     list_for_each_entry(unit, &dev->entities, list) {
> > +             if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
> > +                     list_add_tail(&unit->chain, &chain->entities);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > @@ -2285,6 +2429,12 @@ static int uvc_probe(struct usb_interface *intf,
> >               goto error;
> >       }
> >
> > +     /* Parse the associated GPIOs. */
> > +     if (uvc_gpio_parse(dev) < 0) {
> > +             uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> > +             goto error;
> > +     }
> > +
> >       uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> >               dev->uvc_version >> 8, dev->uvc_version & 0xff,
> >               udev->product ? udev->product : "<unnamed>",
> > @@ -2329,6 +2479,12 @@ static int uvc_probe(struct usb_interface *intf,
> >                       "supported.\n", ret);
> >       }
> >
> > +     ret = uvc_gpio_init_irq(dev);
> > +     if (ret < 0)
> > +             dev_warn(&dev->udev->dev,
> > +                      "Unable to request uvc_privacy_gpio irq %d. Continuing wihtout privacy events\n",
>
> s/uvc_privacy_gpio irq/privacy GPIO IRQ/ ?
>
> > +                      ret);
>
> This could be moved to uvc_gpio_init_irq(), up to you.
>
> > +
> >       uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
> >       usb_enable_autosuspend(udev);
> >       return 0;
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index ca3a9c2eec27..6a9ba5b498db 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -105,6 +105,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >               case UVC_OTT_DISPLAY:
> >               case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> >               case UVC_EXTERNAL_VENDOR_SPECIFIC:
> > +             case UVC_EXT_GPIO_UNIT:
> >               default:
> >                       function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> >                       break;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 6edbf79b2ff1..079a407ebba5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -6,6 +6,7 @@
> >  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
> >  #endif /* __KERNEL__ */
> >
> > +#include <linux/atomic.h>
> >  #include <linux/kernel.h>
> >  #include <linux/poll.h>
> >  #include <linux/usb.h>
> > @@ -37,6 +38,8 @@
> >       (UVC_ENTITY_IS_TERM(entity) && \
> >       ((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
> >
> > +#define UVC_EXT_GPIO_UNIT            0x7ffe
> > +#define UVC_EXT_GPIO_UNIT_ID         0x100
> >
> >  /* ------------------------------------------------------------------------
> >   * GUIDs
> > @@ -56,6 +59,9 @@
> >  #define UVC_GUID_UVC_SELECTOR \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
> > +#define UVC_GUID_EXT_GPIO_CONTROLLER \
> > +     {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > +      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> >
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > @@ -278,6 +284,8 @@ struct uvc_format_desc {
> >       u32 fcc;
> >  };
> >
> > +struct gpio_desc;
> > +
>
> This could be moved a bit up, with the other forward declaration.
>
> >  /* The term 'entity' refers to both UVC units and UVC terminals.
> >   *
> >   * The type field is either the terminal type (wTerminalType in the terminal
> > @@ -353,6 +361,14 @@ struct uvc_entity {
> >                       u8  *bmControls;
> >                       u8  *bmControlsType;
> >               } extension;
> > +
> > +             struct {
> > +                     u8  bControlSize;
> > +                     u8  *bmControls;
> > +                     struct gpio_desc *gpio_privacy;
> > +                     int irq;
> > +                     atomic_t gpio_privacy_value;
> > +             } gpio;
> >       };
> >
> >       u8 bNrInPins;
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
