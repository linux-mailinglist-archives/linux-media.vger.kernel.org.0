Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299EA2DF79D
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 03:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLUCJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 21:09:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55620 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgLUCJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 21:09:30 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2AE0BA4;
        Mon, 21 Dec 2020 03:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608516528;
        bh=VFyuhu0C7PhDkhFxK1Zip8BGGnGNNPiL7CZvji/Sc6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wemrd4Izn0WTK0ulNwIq3y0+WEwH8rh5hfHyjxqZ1ik+pU7XNDOJgQ7Nxu1cMxECe
         Mn3Fa4K3FQ9KHtqbDNi+hTb2T3n1cOFyV30baZe/hc5JUsLtghHKU+OHxBJIyzcbVc
         0OGy9iJQkaqkGJEEUFUXFfIjm1fwC0IDT8tqQxf0=
Date:   Mon, 21 Dec 2020 04:08:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 9/9] media: uvcvideo: Implement
 UVC_QUIRK_PRIVACY_DURING_STREAM
Message-ID: <X+ADp39sCVv0Jnzs@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-10-ribalda@chromium.org>
 <X9+IMF9yIdzPrkgg@pendragon.ideasonboard.com>
 <CANiDSCtSuHFnS85xUsfv9KSKFzaT-KLHeadCzr+5bBRRYZ-arQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtSuHFnS85xUsfv9KSKFzaT-KLHeadCzr+5bBRRYZ-arQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Dec 21, 2020 at 02:10:18AM +0100, Ricardo Ribalda wrote:
> On Sun, Dec 20, 2020 at 6:22 PM Laurent Pinchart wrote:
> > On Tue, Dec 15, 2020 at 04:44:39PM +0100, Ricardo Ribalda wrote:
> > > Some devices, can only read the privacy_pin if the device is
> > > streaming.
> >
> > :-(
> 
> :"-(
> 
> > > This patch implement a quirk for such devices, in order to avoid invalid
> > > reads and/or spurious events.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 97 ++++++++++++++++++++++++++----
> > >  drivers/media/usb/uvc/uvc_queue.c  |  3 +
> > >  drivers/media/usb/uvc/uvcvideo.h   |  6 ++
> > >  3 files changed, 94 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index e49491250e87..61313019e226 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -7,6 +7,7 @@
> > >   */
> > >
> > >  #include <linux/atomic.h>
> > > +#include <linux/dmi.h>
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/list.h>
> > > @@ -1471,13 +1472,39 @@ static int uvc_parse_control(struct uvc_device *dev)
> > >       return 0;
> > >  }
> > >
> > > +static bool uvc_ext_gpio_is_streaming(struct uvc_device *dev)
> > > +{
> > > +     struct uvc_streaming *streaming;
> > > +
> > > +     list_for_each_entry(streaming, &dev->streams, list) {
> > > +             if (uvc_queue_streaming(&streaming->queue))
> > > +                     return true;
> > > +     }
> > > +
> > > +     return false;
> > > +}
> > > +
> > > +/* Update the cached value and return true if it has changed */
> > > +static bool uvc_gpio_update_value(struct uvc_entity *unit, u8 *new_val)
> > > +{
> > > +     *new_val = gpiod_get_value(unit->gpio.gpio_privacy);
> > > +
> > > +     return atomic_xchg(&unit->gpio.gpio_privacy_value, *new_val) !=
> > > +                                                                   *new_val;
> >
> > That's a weird indentation. Also, as the left hand side modifies
> > *new_val, does C guarantee the order in which the two operands to != are
> > evaluated ? Could the code be written in an easier to read way ?
> >
> > > +}
> > > +
> > >  static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > >                           u8 cs, void *data, u16 size)
> > >  {
> > >       if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> > >               return -EINVAL;
> > >
> > > -     *(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
> > > +     if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
> > > +         !uvc_ext_gpio_is_streaming(dev))
> > > +             return -EBUSY;
> > > +
> > > +     uvc_gpio_update_value(entity, (uint8_t *)data);
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -1491,26 +1518,69 @@ static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> > >       return 0;
> > >  }
> > >
> > > -static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
> > > +static struct uvc_entity *uvc_find_ext_gpio_unit(struct uvc_device *dev)
> > >  {
> > > -     struct uvc_device *dev = data;
> > > -     struct uvc_video_chain *chain;
> > >       struct uvc_entity *unit;
> > > -     u8 value;
> > >
> > > -     /* GPIO entities are always on the first chain */
> > > -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > >       list_for_each_entry(unit, &dev->entities, list) {
> > > -             if (UVC_ENTITY_TYPE(unit) != UVC_EXT_GPIO_UNIT)
> > > -                     continue;
> > > -             value = gpiod_get_value(unit->gpio.gpio_privacy);
> > > -             uvc_ctrl_status_event(NULL, chain, unit->controls, &value);
> > > -             return IRQ_HANDLED;
> > > +             if (UVC_ENTITY_TYPE(unit) == UVC_EXT_GPIO_UNIT)
> > > +                     return unit;
> > >       }
> > >
> > > +     return unit;
> > > +}
> > > +
> > > +void uvc_privacy_gpio_event(struct uvc_device *dev)
> > > +{
> > > +     struct uvc_entity *unit;
> > > +     struct uvc_video_chain *chain;
> > > +     u8 new_value;
> > > +
> > > +     unit = uvc_find_ext_gpio_unit(dev);
> > > +     if (WARN_ONCE(!unit, "Unable to find entity ext_gpio_unit"))
> > > +             return;
> > > +
> > > +     if (!uvc_gpio_update_value(unit, &new_value))
> > > +             return;
> >
> > If VIDIOC_G_CTRL() is called before the IRQ is processed, this
> > uvc_gpio_update_value() call will return false, and no event will be
> > generated. I don't think that's right, and even should be generated
> > every time the control changes.
> >
> I was almost sure that get_cur had also the events wired.... but no.
> 
> > > +
> > > +     /* GPIO entities are always on the first chain */
> > > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > > +     uvc_ctrl_status_event(NULL, chain, unit->controls, &new_value);
> > > +}
> > > +
> > > +static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
> > > +{
> > > +     struct uvc_device *dev = data;
> > > +
> > > +     /* Ignore privacy events during streamoff */
> > > +     if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > > +             if (!uvc_ext_gpio_is_streaming(dev))
> > > +                     return IRQ_HANDLED;
> >
> >         if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) {
> >                 if (!uvc_ext_gpio_is_streaming(dev))
> >                         return IRQ_HANDLED;
> >         }
> >
> > There's a potential race condition with VIDIOC_STREAMON and
> > VIDIOC_STREAMOFF. Could you explain what the device does exactly when
> > not streaming ? As the GPIO isn't tied to the UVC controller, how comes
> > the streaming state influences it ? Any hope the firmware could be fixed
> > instead ?
> 
> In the affected devices, the privacy_pin is an output of the camera
> module instead of an independent pin.

So the privacy switch is an input of a camera module, which then output
its state on a GPIO instead of exposing it through the UVC privacy
control ? Amazing design !

> When the camera is not streaming, the camera does not drive the pin,
> so the system reads whatever pull-up, pull-down the pin is configured
> by default in the firmware/hardware.
> 
> Unfortunately the only way to fix it would be to change the module, or
> the firmware of the module, and neigher things are not feasable :(. So
> we have to use a quirk for them.
> Future models have this fixed.

Changing the hardware, obviously. Changing the firmware of the module...
Someone needs to be scolded along the development chain, can you take
care of that at least ? ;-)

Thinking more about this, do you have a use case for knowing the state
of the privacy switch when not streaming ?

> Regarding the race condition... The use of the atomic_t was to avoid
> that race, but what I did not realise was that by default get_cur does
> not send an event... So I am working on a new series, which also
> includes a fix for the async_control wq.
> 
> Thanks for your review!!!
> 
> > > +
> > > +     uvc_privacy_gpio_event(dev);
> > > +
> > >       return IRQ_HANDLED;
> > >  }
> > >
> > > +static const struct dmi_system_id privacy_valid_during_streamon[] = {
> > > +     {
> > > +             .ident = "HP Elite c1030 Chromebook",
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
> > > +             },
> > > +     },
> > > +     {
> > > +             .ident = "HP Pro c640 Chromebook",
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
> > > +             },
> > > +     },
> > > +     { } /* terminate list */
> > > +};
> > > +
> > > +
> > >  static int uvc_parse_gpio(struct uvc_device *dev)
> > >  {
> > >       struct uvc_entity *unit;
> > > @@ -1545,6 +1615,9 @@ static int uvc_parse_gpio(struct uvc_device *dev)
> > >       if (irq == -EPROBE_DEFER)
> > >               return -EPROBE_DEFER;
> > >
> > > +     if (dmi_check_system(privacy_valid_during_streamon))
> > > +             dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
> > > +
> > >       if (irq < 0)
> > >               return 0;
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > > index cd60c6c1749e..e800d491303f 100644
> > > --- a/drivers/media/usb/uvc/uvc_queue.c
> > > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > > @@ -337,9 +337,12 @@ int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
> > >  int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> > >  {
> > >       int ret;
> > > +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> > >
> > >       mutex_lock(&queue->mutex);
> > >       ret = vb2_streamon(&queue->queue, type);
> > > +     if (stream->dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> > > +             uvc_privacy_gpio_event(stream->dev);
> > >       mutex_unlock(&queue->mutex);
> > >
> > >       return ret;
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 2b5ba4b02d3a..2a95b3ed3ea8 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -6,6 +6,7 @@
> > >  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
> > >  #endif /* __KERNEL__ */
> > >
> > > +#include <linux/atomic.h>
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/poll.h>
> > > @@ -209,6 +210,7 @@
> > >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> > >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> > >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > > +#define UVC_QUIRK_PRIVACY_DURING_STREAM      0x00002000
> > >
> > >  /* Format flags */
> > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > > @@ -359,6 +361,7 @@ struct uvc_entity {
> > >                       u8  bControlSize;
> > >                       u8  *bmControls;
> > >                       struct gpio_desc *gpio_privacy;
> > > +                     atomic_t  gpio_privacy_value;
> > >               } gpio;
> > >       };
> > >
> > > @@ -815,6 +818,9 @@ extern const struct v4l2_file_operations uvc_fops;
> > >  int uvc_mc_register_entities(struct uvc_video_chain *chain);
> > >  void uvc_mc_cleanup_entity(struct uvc_entity *entity);
> > >
> > > +/* Privacy gpio */
> > > +void uvc_privacy_gpio_event(struct uvc_device *dev);
> > > +
> > >  /* Video */
> > >  int uvc_video_init(struct uvc_streaming *stream);
> > >  int uvc_video_suspend(struct uvc_streaming *stream);

-- 
Regards,

Laurent Pinchart
