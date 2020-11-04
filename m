Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426232A672F
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 16:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgKDPLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 10:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgKDPK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 10:10:57 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E476C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 07:10:56 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t143so10902590oif.10
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pe0n3OBoJqjipPLYcfX69l+G551uebaKdROT6+o5CZ4=;
        b=H3Vn5DzUDPPOykucdg1JFsJ4Zl9dxMD8aE48e0XXeObIE2MiC2S8oFMpmLbSgowGEQ
         6Jx4Te5TO3wE3I20e4SaAwvAXmKouzZJS3tmV90rng3JQX67FEBn/td+uocQ7x2IS8jm
         /Oc8g2Mly1Vk1UEFxslYdWrG2s6Y/Rrab8Ouo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pe0n3OBoJqjipPLYcfX69l+G551uebaKdROT6+o5CZ4=;
        b=LFaZr7h586naDncgIdLHvXix5fwgogbgyaHdkSdC9aepBxnm1I4U+RmHF3nJflhoNZ
         idpSCiEYg6GmugkS1ZCig49NahwvICMkP46rwltp8LAwvc4/Mol2+J98krcGPUe4yGFC
         dJe5Wndlr9ZIpU4izHOp1B/NcaAB6lPkVR22dUTR+ibibw8OOY8u3Q3D3AiUyXPt03gO
         8D8Nj84LkCRudl+hcYmobqsRi1D4+aITX8Cdt/9ddbzc3OJjSDKBV57NGRRtg1u6TCjg
         yDC/AuBsI5nJzj6ufikH0LOYq7o8ZAfH+0fwlU9Fx2rYHqZbeK3w32ZCxIWOuz8nqMIg
         f9ew==
X-Gm-Message-State: AOAM531r10SdEAqJMTUDqgDb0x732UTFv1xSiN//OeQLXKMOi0vNF2Go
        tuSD8L+LcX/0odkhakCjRurCFrfMuX7lKnNo
X-Google-Smtp-Source: ABdhPJwNnPlz1tI+nfMD31ZelDii5ivbmugg0IXm1xhLgNM7R1nIHl/25JON7Tbc3+29HeHjWg3jGw==
X-Received: by 2002:aca:670b:: with SMTP id z11mr2742765oix.116.1604502655175;
        Wed, 04 Nov 2020 07:10:55 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id q23sm536797ota.7.2020.11.04.07.10.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 07:10:54 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id h62so19551772oth.9
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 07:10:54 -0800 (PST)
X-Received: by 2002:a05:6830:141:: with SMTP id j1mr18203136otp.132.1604502653470;
 Wed, 04 Nov 2020 07:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20201022133753.310506-1-ribalda@chromium.org> <20201022133753.310506-6-ribalda@chromium.org>
 <20201104115856.GK26171@pendragon.ideasonboard.com>
In-Reply-To: <20201104115856.GK26171@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Nov 2020 16:10:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCuha1C5pTWY3qPRhHF56COSsbgDh3JWVGgu478mCayQ0g@mail.gmail.com>
Message-ID: <CANiDSCuha1C5pTWY3qPRhHF56COSsbgDh3JWVGgu478mCayQ0g@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: uvcvideo: Implement UVC_GPIO_UNIT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Laurent

On Wed, Nov 4, 2020 at 12:59 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Oct 22, 2020 at 03:37:52PM +0200, Ricardo Ribalda wrote:
> > Some devices can implement a physical switch to disable the input of the
> > camera on demand. Think of it like an elegant privacy sticker.
> >
> > The system can read the status of the privacy switch via a GPIO.
> >
> > It is important to know the status of the switch, e.g. to notify the
> > user when the camera will produce black frames and a videochat
> > application is used.
> >
> > Since the uvc device is not aware of this pin (and it should't), we need
>
> I'd argue that it should, we wouldn't have to deal with all this if the
> switch was connected to the UVC device. This series is a hack to
> workaround a bad hardware design :-)

I have mixed feelings about this.

I like a design where the camera is independent from the uvc.
Otherwise a malicious camera could try to bypass the privacy pin (eg,
set the gpio as output and put a low value)

But you are right, this is just a hack.

>
> > to implement a virtual entity that can interact with such pin.
> >
> > The location of the GPIO is specified via acpi or DT. on the usb device Eg:
>
> How does it look like for DT-based systems ? Do we need to add DT
> bindings ?

I guess it is for us to define. I can prepare a patch with a DT
binding, although I do not have
a hardware with DT and this feature.

>
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
>
> What do the last three values represent ?
Package () { "name", Package () { ref, index, pin, active_low }}
Documentation/firmware-guide/acpi/gpio-properties.rst

>
> >                 }
> >             }
> >         }
> >     })
>
> Can you add a bit of context to show in which ACPI device object this is
> located (I assume \_SB.PCI0.XHCI.RHUB.HS07) ?
>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   |  3 ++
> >  drivers/media/usb/uvc/uvc_driver.c | 72 ++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  8 ++++
> >  3 files changed, 83 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 786498e66646..3a49a1326a90 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2332,6 +2332,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >               } else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
> >                       bmControls = entity->camera.bmControls;
> >                       bControlSize = entity->camera.bControlSize;
> > +             } else if (UVC_ENTITY_TYPE(entity) == UVC_GPIO_UNIT) {
> > +                     bmControls = entity->gpio.bmControls;
> > +                     bControlSize = entity->gpio.bControlSize;
> >               }
> >
> >               /* Remove bogus/blacklisted controls */
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index ddb9eaa11be7..180e503e900f 100644
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
> > @@ -1440,6 +1441,58 @@ static int uvc_parse_control(struct uvc_device *dev)
> >       return 0;
> >  }
> >
> > +static int uvc_gpio_get_cur(struct uvc_entity *entity, u8 cs, void *data, u16 size)
>
> Line break at 80 columns please.
>
> > +{
> > +     if ((cs != UVC_CT_PRIVACY_CONTROL) || (size < 1))
>
> No need for the inner parentheses.
>
> > +             return -EINVAL;
>
> Should we mimick the error value returned when querying the device with
> an invalid control selector ? Same below.

Not sure what you mean here. Don't we return  -EINVAL in that case ?

from uvc_query_ctrl()

switch (error) {
case 0:
/* Cannot happen - we received a STALL */
return -EPIPE;
case 1: /* Not ready */
return -EBUSY;
case 2: /* Wrong state */
return -EILSEQ;
case 3: /* Power */
return -EREMOTE;
case 4: /* Out of range */
return -ERANGE;
case 5: /* Invalid unit */
case 6: /* Invalid control
case 7: /* Invalid Request */
case 8: /* Invalid value within range */
return -EINVAL;
default: /* reserved or unknown */
break;

}

>
> > +
> > +     *(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
> > +     return 0;
> > +}
> > +
> > +static int uvc_gpio_get_info(struct uvc_entity *entity, u8 cs, u8 *caps)
> > +{
> > +
>
> Extra blank line.
>
> > +     if (cs != UVC_CT_PRIVACY_CONTROL)
> > +             return -EINVAL;
> > +
> > +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> > +     return 0;
> > +}
> > +
> > +static int uvc_parse_gpio(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *unit;
> > +     struct gpio_desc *gpio_privacy;
> > +     int irq;
> > +     int ret;
> > +
> > +     gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy", GPIOD_IN);
>
> Line break at 80 columns please.
>
> > +
> > +     if (IS_ERR(gpio_privacy))
> > +             return PTR_ERR(gpio_privacy);
> > +
> > +     if (!gpio_privacy)
> > +             return 0;
> > +
> > +     unit = uvc_alloc_entity(UVC_GPIO_UNIT, 0xff, 1, 2);
>
> Isn't there a risk, at least in theory, that entity ID 255 would be used
> by a real UVC entity ? What are the implication of entity ID conflicts ?
>
> It doesn't seem like the entity will be linked, does it need any pad ?
>
> Why do you need two bytes of extra size, don't you use one only ?
>
> > +     if (!unit)
> > +             return -ENOMEM;
> > +
> > +     unit->gpio.gpio_privacy = gpio_privacy;
> > +     unit->gpio.bControlSize = 1;
> > +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> > +     unit->gpio.bmControls[0] = 1;
> > +     unit->get_cur = uvc_gpio_get_cur;
> > +     unit->get_info = uvc_gpio_get_info;
> > +
> > +     sprintf(unit->name, "GPIO Unit");
> > +
> > +     list_add_tail(&unit->list, &dev->entities);
> > +
> > +     return 0;
> > +}
> > +
> >  /* ------------------------------------------------------------------------
> >   * UVC device scan
> >   */
> > @@ -1532,6 +1585,12 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
> >
> >               break;
> >
> > +     case UVC_GPIO_UNIT:
> > +             if (uvc_trace_param & UVC_TRACE_PROBE)
> > +                     printk(KERN_CONT " GPIO %d", entity->id);
> > +
> > +             break;
> > +
>
> Let's move this after UVC_TT_STREAMING.
>
> >       case UVC_TT_STREAMING:
> >               if (UVC_ENTITY_IS_ITERM(entity)) {
> >                       if (uvc_trace_param & UVC_TRACE_PROBE)
> > @@ -1929,6 +1988,13 @@ static int uvc_scan_device(struct uvc_device *dev)
> >               return -1;
> >       }
> >
> > +     /* Add GPIO entities to the first_chain */
>
> s/first_chain/first chain./
>
> This leads to an interesting question. What if we have a UVC device with
> two sensors ? There could be a different privacy GPIO for each of them
> in theory. This would need to be reflected in the ACPI and DT bindings,
> we would need to specify a GPIO per input terminal.

My approach was to "contaminate" as little as possible the uvc driver
with a hack.

As of now I do not have any device with two sensors and an external
gpio. If we ever
go there we can decide what to do.

>
> > +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> > +     list_for_each_entry(term, &dev->entities, list) {
> > +             if (UVC_ENTITY_TYPE(term) == UVC_GPIO_UNIT)
> > +                     list_add_tail(&term->chain, &chain->entities);
> > +     }
>
> As this is done after calling uvc_scan_chain(), and thus after
> uvc_scan_chain_entity(), do we need the previous hunk ?
>
> Alternatively, we could hook up with the existing chain scanning
> mechanism if the GPIO entity was linked to another entity. This may
> however be difficult to implement.
>
> > +
> >       return 0;
> >  }
> >
> > @@ -2261,6 +2327,12 @@ static int uvc_probe(struct usb_interface *intf,
> >               goto error;
> >       }
> >
> > +     /* Parse the associated GPIOs */
> > +     if (uvc_parse_gpio(dev) < 0) {
> > +             uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> > +             goto error;
> > +     }
> > +
> >       uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> >               dev->uvc_version >> 8, dev->uvc_version & 0xff,
> >               udev->product ? udev->product : "<unnamed>",
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a493bc383d3e..7ca78005b6a9 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -6,6 +6,7 @@
> >  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
> >  #endif /* __KERNEL__ */
> >
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/kernel.h>
> >  #include <linux/poll.h>
> >  #include <linux/usb.h>
> > @@ -37,6 +38,7 @@
> >       (UVC_ENTITY_IS_TERM(entity) && \
> >       ((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
> >
> > +#define UVC_GPIO_UNIT 0x7ffe
>
> I'd name this UVC_EXT_GPIO_UNIT.
>
> >
> >  /* ------------------------------------------------------------------------
> >   * GUIDs
> > @@ -351,6 +353,12 @@ struct uvc_entity {
> >                       u8  *bmControls;
> >                       u8  *bmControlsType;
> >               } extension;
> > +
> > +             struct {
> > +                     u8  bControlSize;
> > +                     u8  *bmControls;
> > +                     struct gpio_desc *gpio_privacy;
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
