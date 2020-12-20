Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363182DF71D
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 00:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgLTXZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 18:25:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbgLTXZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 18:25:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A466EE60;
        Mon, 21 Dec 2020 00:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608506657;
        bh=Aw1AvNEt6hAzIpfAKdkslTSySlitVRDKFS0iJavGS8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tKkV2O1B4q/gd50jGeY9qNvHFk8zWqPLYXgUTdiFoH+uQmlrV1M0g/V9/Ktt16U46
         y94yyHMKT4qahfWTLwB/Iy42TGWCyqovVhFJ46MlNGOc+9EDuLpG/rv53/2UspBTbj
         imKuIZKGzdm53kZkj5H1bR3ZwF71scIE4cw6PuO8=
Date:   Mon, 21 Dec 2020 01:24:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/9] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
Message-ID: <X9/dGfRX51jprMjD@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-6-ribalda@chromium.org>
 <X9+AqeqzvZopPPJn@pendragon.ideasonboard.com>
 <CANiDSCtgQkkRfTsuFN6iMc5SKdfM7zeiQO10UhGptHgStRodGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtgQkkRfTsuFN6iMc5SKdfM7zeiQO10UhGptHgStRodGQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Sun, Dec 20, 2020 at 11:56:12PM +0100, Ricardo Ribalda wrote:
> On Sun, Dec 20, 2020 at 5:49 PM Laurent Pinchart wrote:
> > On Tue, Dec 15, 2020 at 04:44:35PM +0100, Ricardo Ribalda wrote:
> > > Some devices can implement a physical switch to disable the input of the
> > > camera on demand. Think of it like an elegant privacy sticker.
> > >
> > > The system can read the status of the privacy switch via a GPIO.
> > >
> > > It is important to know the status of the switch, e.g. to notify the
> > > user when the camera will produce black frames and a videochat
> > > application is used.
> > >
> > > Since the uvc device is not aware of this pin (and it should't), we need
> >
> > s/should't/shouldn't/
> >
> > But I don't agree, if this is part of the camera, it should be
> > implemented in the camera firmware. I understand that it's not possible
> > (or desirable) with the hardware architecture you're dealing with
> > though. How about
> >
> > "In some systems, the GPIO is connected to main SoC instead of the
> > camera controller, with the connected reported by the system firmware
> > (ACPI or DT). In that case, the UVC device isn't aware of the GPIO. We
> > need to implement a virtual entity to handle the GPIO fully on the
> > driver side.
> >
> > For example, for ACPI-based systems, the GPIO is reported in the USB
> > device object:"
> >
> > > to implement a virtual entity that can interact with such pin.
> > >
> > > The location of the GPIO is specified via acpi or DT. on the usb device Eg:
> > >
> > >   Scope (\_SB.PCI0.XHCI.RHUB.HS07)
> > >   {
> > >
> > >         /.../
> > >
> > >     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > >     {
> > >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> > >             "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, ,
> > >             )
> > >             {   // Pin list
> > >                 0x0064
> > >             }
> > >     })
> > >     Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
> > >     {
> > >         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
> > >         Package (0x01)
> > >         {
> > >             Package (0x02)
> > >             {
> > >                 "privacy-gpio",
> > >                 Package (0x04)
> > >                 {
> > >                     \_SB.PCI0.XHCI.RHUB.HS07,
> > >                     Zero,
> > >                     Zero,
> > >                     One
> > >                 }
> > >             }
> > >         }
> > >     })
> > >   }
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c   |   6 ++
> > >  drivers/media/usb/uvc/uvc_driver.c | 106 +++++++++++++++++++++++++++++
> > >  drivers/media/usb/uvc/uvcvideo.h   |  12 ++++
> > >  3 files changed, 124 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 531816762892..53da1d984883 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1302,6 +1302,9 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
> > >
> > >       mutex_unlock(&chain->ctrl_mutex);
> > >
> > > +     if (!w->urb)
> > > +             return;
> >
> > A small comment to explain why would be useful.
> >
> > > +
> > >       /* Resubmit the URB. */
> > >       w->urb->interval = dev->int_ep->desc.bInterval;
> > >       ret = usb_submit_urb(w->urb, GFP_KERNEL);
> > > @@ -2286,6 +2289,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > >               } else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
> > >                       bmControls = entity->camera.bmControls;
> > >                       bControlSize = entity->camera.bControlSize;
> > > +             } else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> > > +                     bmControls = entity->gpio.bmControls;
> > > +                     bControlSize = entity->gpio.bControlSize;
> > >               }
> > >
> > >               /* Remove bogus/blacklisted controls */
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 534629ecd60d..498de09da07e 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -7,6 +7,7 @@
> > >   */
> > >
> > >  #include <linux/atomic.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/list.h>
> > >  #include <linux/module.h>
> > > @@ -1020,6 +1021,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> > >  }
> > >
> > >  static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> > > +static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
> > >  static const u8 uvc_media_transport_input_guid[16] =
> > >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > > @@ -1053,6 +1055,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > >        * is initialized by the caller.
> > >        */
> > >       switch (type) {
> > > +     case UVC_EXT_GPIO_UNIT:
> > > +             memcpy(entity->guid, uvc_gpio_guid, 16);
> > > +             break;
> > >       case UVC_ITT_CAMERA:
> > >               memcpy(entity->guid, uvc_camera_guid, 16);
> > >               break;
> > > @@ -1466,6 +1471,93 @@ static int uvc_parse_control(struct uvc_device *dev)
> > >       return 0;
> > >  }
> >
> > Can we add
> >
> > /* -----------------------------------------------------------------------------
> >  * Privacy GPIO
> >  */
> >
> > here ?
> >
> > > +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > > +                         u8 cs, void *data, u16 size)
> > > +{
> > > +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > > +             return -EINVAL;
> > > +
> > > +     *(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > > +                          u8 cs, u8 *caps)
> > > +{
> > > +     if (cs != UVC_CT_PRIVACY_CONTROL)
> > > +             return -EINVAL;
> > > +
> > > +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > > +     return 0;
> > > +}
> > > +
> > > +static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
> > > +{
> > > +     struct uvc_device *dev = data;
> > > +     struct uvc_video_chain *chain;
> > > +     struct uvc_entity *unit;
> > > +     u8 value;
> > > +
> > > +     /* GPIO entities are always on the first chain */
> >
> >
> > s/chain/chain./
> >
> > > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > +     list_for_each_entry(unit, &dev->entities, list) {
> >
> > Can we iterate over entities in the chain instead ?
> >
> > I'd be actually tempted to pass the pointer to the entity as data. We
> > would however need to add a chain pointer to uvc_entity. Not sure if
> > it's worth it, up to you.
> >
> > > +             if (UVC_ENTITY_TYPE(unit) != UVC_EXT_GPIO_UNIT)
> > > +                     continue;
> > > +             value = gpiod_get_value(unit->gpio.gpio_privacy);
> >
> > Could this sleep ? Should we use a threaded IRQ ?
> 
> get_value() should not sleep, but there are platforms that may sleep
> to get the irq.
> 
> In order to support them I have converted to threaded_irq in the next version
> and called gpio_get_value_cansleep()
> 
> > > +             uvc_ctrl_status_event(NULL, chain, unit->controls, &value);
> > > +             return IRQ_HANDLED;
> > > +     }
> > > +
> > > +     return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int uvc_parse_gpio(struct uvc_device *dev)
> >
> > How about making the naming scheme consistent, by using a uvc_gpio_
> > prefix for all four functions ?
> >
> > > +{
> > > +     struct uvc_entity *unit;
> > > +     struct gpio_desc *gpio_privacy;
> > > +     int irq;
> > > +     int ret;
> > > +
> > > +     gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
> > > +                                            GPIOD_IN);
> > > +     if (IS_ERR(gpio_privacy))
> > > +             return PTR_ERR(gpio_privacy);
> > > +
> > > +     if (!gpio_privacy)
> > > +             return 0;
> >
> > This could be folded in
> >
> >         if (IS_ERR_OR_NULL(gpio_privacy))
> >                 return PTR_ERR_OR_ZERO(gpio_privacy);
> >
> > Up to you.
> >
> > > +
> > > +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > +     if (!unit)
> > > +             return -ENOMEM;
> > > +
> > > +     unit->gpio.gpio_privacy = gpio_privacy;
> > > +     unit->gpio.bControlSize = 1;
> > > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > > +     unit->gpio.bmControls[0] = 1;
> > > +     unit->get_cur = uvc_gpio_get_cur;
> > > +     unit->get_info = uvc_gpio_get_info;
> > > +
> > > +     sprintf(unit->name, "GPIO Unit");
> >
> > Other unit names don't contain "Unit", should this be just "GPIO" ?
> >
> > > +
> > > +     list_add_tail(&unit->list, &dev->entities);
> > > +
> > > +     irq = gpiod_to_irq(gpio_privacy);
> > > +     if (irq == -EPROBE_DEFER)
> > > +             return -EPROBE_DEFER;
> >
> > Can this happen in practice ?
> 
> Yes :(, Eg:
> If the irq is handled by an GPIO expansion via I2C, and it has not
> been probed yet.

Won't the devm_gpiod_get_optional() call fail with -EPROBE_DEFER in that
case ?

> > > +
> > > +     if (irq < 0)
> > > +             return 0;
> >
> > So this will succeed, with the GPIO unit created, but it won't be
> > operational. Is this desired ? Shouldn't we at least print a warning ?
> 
> If there is no IRQ, the unit is still functional, but instead of
> sending events when the gpio changes, the user will have to poll it.

Good point.

> > I also wonder if we should create the GPIO unit in this cases. Wouldn't
> > it be more confusing for userspace to see the privacy control being
> > exposed, but without it being functional ? Maybe the call to
> > gpiod_to_irq should be moved to before uvc_alloc_entity() ?
> >
> > > +
> > > +     ret = devm_request_irq(&dev->udev->dev, irq, uvc_privacy_gpio_irq,
> > > +                            IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> > > +                            "uvc_privacy_gpio", dev);
> > > +     if (ret < 0)
> > > +             dev_warn(&dev->udev->dev,
> > > +                    "Unable to request uvc_privacy_gpio irq. Continuing\n");
> >
> > s/uvc_privacy_gpio irq/privacy GPIO IRQ/ ?
> >
> > There's also a race condition, as soon as the IRQ is requested, it could
> > fire, and the driver isn't fully initialized. Walking the chain in the
> > IRQ handler while entities are added to the chain could lead to a crash.
> > I see two options, either adding a flag to tell that initialization is
> > complete and returning from the interrupt handler when the flag isn't
> > set, or moving IRQ registration to a separate function, called later
> > during the initialization. I think I have a preference for the latter.
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  /* ------------------------------------------------------------------------
> > >   * UVC device scan
> > >   */
> > > @@ -1917,6 +2009,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> > >  {
> > >       struct uvc_video_chain *chain;
> > >       struct uvc_entity *term;
> > > +     struct uvc_entity *unit;
> > >
> > >       list_for_each_entry(term, &dev->entities, list) {
> > >               if (!UVC_ENTITY_IS_OTERM(term))
> > > @@ -1955,6 +2048,13 @@ static int uvc_scan_device(struct uvc_device *dev)
> > >               return -1;
> > >       }
> > >
> > > +     /* Add GPIO entities to the first chain */
> >
> > s/chain/chain./
> >
> > > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > +     list_for_each_entry(unit, &dev->entities, list) {
> > > +             if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
> > > +                     list_add_tail(&unit->chain, &chain->entities);
> > > +     }
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -2287,6 +2387,12 @@ static int uvc_probe(struct usb_interface *intf,
> > >               goto error;
> > >       }
> > >
> > > +     /* Parse the associated GPIOs */
> >
> > s/GPIOs/GPIOs./
> >
> > > +     if (uvc_parse_gpio(dev) < 0) {
> > > +             uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> > > +             goto error;
> > > +     }
> > > +
> > >       uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> > >               dev->uvc_version >> 8, dev->uvc_version & 0xff,
> > >               udev->product ? udev->product : "<unnamed>",
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index ae464ba83f4f..f87d14fb3f56 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -6,6 +6,7 @@
> > >  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
> > >  #endif /* __KERNEL__ */
> > >
> > > +#include <linux/gpio/consumer.h>
> >
> > We can use a forward declaration of struct gpio_desc in this file.
> >
> > >  #include <linux/kernel.h>
> > >  #include <linux/poll.h>
> > >  #include <linux/usb.h>
> > > @@ -37,6 +38,8 @@
> > >       (UVC_ENTITY_IS_TERM(entity) && \
> > >       ((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
> > >
> > > +#define UVC_EXT_GPIO_UNIT 0x7ffe
> > > +#define UVC_EXT_GPIO_UNIT_ID 0x100
> >
> > Maybe a couple of tabs to align this with the other defines above ?
> >
> > >
> > >  /* ------------------------------------------------------------------------
> > >   * GUIDs
> > > @@ -56,6 +59,9 @@
> > >  #define UVC_GUID_UVC_SELECTOR \
> > >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
> > > +#define UVC_GUID_EXT_GPIO_CONTROLLER \
> > > +     {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > > +      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > >
> > >  #define UVC_GUID_FORMAT_MJPEG \
> > >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > > @@ -348,6 +354,12 @@ struct uvc_entity {
> > >                       u8  *bmControls;
> > >                       u8  *bmControlsType;
> > >               } extension;
> > > +
> > > +             struct {
> > > +                     u8  bControlSize;
> > > +                     u8  *bmControls;
> > > +                     struct gpio_desc *gpio_privacy;
> > > +             } gpio;
> > >       };
> > >
> > >       u8 bNrInPins;

-- 
Regards,

Laurent Pinchart
