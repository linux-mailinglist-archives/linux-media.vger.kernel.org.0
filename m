Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FFB2A63CB
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbgKDL7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbgKDL7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:59:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD00C0613D3;
        Wed,  4 Nov 2020 03:59:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B98C6563;
        Wed,  4 Nov 2020 12:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604491183;
        bh=napnBHbJvahh4EiVh/EOWm2U/B7i8cAb3bUhpu2DqZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WuONevM0iIoHk9U+RdmYR7+u32i0we6a2HDqI/na27adtchx+aThrEJOwHBxpGE1k
         +kUQPeJyilntV7ByCavFum1FB28Fbx8tQPTq9AymFLP1KxeHzwIFpQ06qvPv4zhZGa
         KY9ecd1aWSqf3si80hlWWwOgCKAgF6UUT8a3BSPU=
Date:   Wed, 4 Nov 2020 13:58:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 5/6] media: uvcvideo: Implement UVC_GPIO_UNIT
Message-ID: <20201104115856.GK26171@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-6-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022133753.310506-6-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 22, 2020 at 03:37:52PM +0200, Ricardo Ribalda wrote:
> Some devices can implement a physical switch to disable the input of the
> camera on demand. Think of it like an elegant privacy sticker.
> 
> The system can read the status of the privacy switch via a GPIO.
> 
> It is important to know the status of the switch, e.g. to notify the
> user when the camera will produce black frames and a videochat
> application is used.
> 
> Since the uvc device is not aware of this pin (and it should't), we need

I'd argue that it should, we wouldn't have to deal with all this if the
switch was connected to the UVC device. This series is a hack to
workaround a bad hardware design :-)

> to implement a virtual entity that can interact with such pin.
> 
> The location of the GPIO is specified via acpi or DT. on the usb device Eg:

How does it look like for DT-based systems ? Do we need to add DT
bindings ?

> 
>     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>     {
>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>             "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x0064
>             }
>     })
>     Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
>     {
>         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
>         Package (0x01)
>         {
>             Package (0x02)
>             {
>                 "privacy-gpio",
>                 Package (0x04)
>                 {
>                     \_SB.PCI0.XHCI.RHUB.HS07,
>                     Zero,
>                     Zero,
>                     One

What do the last three values represent ?

>                 }
>             }
>         }
>     })

Can you add a bit of context to show in which ACPI device object this is
located (I assume \_SB.PCI0.XHCI.RHUB.HS07) ?

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  3 ++
>  drivers/media/usb/uvc/uvc_driver.c | 72 ++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  8 ++++
>  3 files changed, 83 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 786498e66646..3a49a1326a90 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2332,6 +2332,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
>  			bmControls = entity->camera.bmControls;
>  			bControlSize = entity->camera.bControlSize;
> +		} else if (UVC_ENTITY_TYPE(entity) == UVC_GPIO_UNIT) {
> +			bmControls = entity->gpio.bmControls;
> +			bControlSize = entity->gpio.bControlSize;
>  		}
>  
>  		/* Remove bogus/blacklisted controls */
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ddb9eaa11be7..180e503e900f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/atomic.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -1440,6 +1441,58 @@ static int uvc_parse_control(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +static int uvc_gpio_get_cur(struct uvc_entity *entity, u8 cs, void *data, u16 size)

Line break at 80 columns please.

> +{
> +	if ((cs != UVC_CT_PRIVACY_CONTROL) || (size < 1))

No need for the inner parentheses.

> +		return -EINVAL;

Should we mimick the error value returned when querying the device with
an invalid control selector ? Same below.

> +
> +	*(uint8_t *)data = gpiod_get_value(entity->gpio.gpio_privacy);
> +	return 0;
> +}
> +
> +static int uvc_gpio_get_info(struct uvc_entity *entity, u8 cs, u8 *caps)
> +{
> +

Extra blank line.

> +	if (cs != UVC_CT_PRIVACY_CONTROL)
> +		return -EINVAL;
> +
> +	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> +	return 0;
> +}
> +
> +static int uvc_parse_gpio(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit;
> +	struct gpio_desc *gpio_privacy;
> +	int irq;
> +	int ret;
> +
> +	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy", GPIOD_IN);

Line break at 80 columns please.

> +
> +	if (IS_ERR(gpio_privacy))
> +		return PTR_ERR(gpio_privacy);
> +
> +	if (!gpio_privacy)
> +		return 0;
> +
> +	unit = uvc_alloc_entity(UVC_GPIO_UNIT, 0xff, 1, 2);

Isn't there a risk, at least in theory, that entity ID 255 would be used
by a real UVC entity ? What are the implication of entity ID conflicts ?

It doesn't seem like the entity will be linked, does it need any pad ?

Why do you need two bytes of extra size, don't you use one only ?

> +	if (!unit)
> +		return -ENOMEM;
> +
> +	unit->gpio.gpio_privacy = gpio_privacy;
> +	unit->gpio.bControlSize = 1;
> +	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> +	unit->gpio.bmControls[0] = 1;
> +	unit->get_cur = uvc_gpio_get_cur;
> +	unit->get_info = uvc_gpio_get_info;
> +
> +	sprintf(unit->name, "GPIO Unit");
> +
> +	list_add_tail(&unit->list, &dev->entities);
> +
> +	return 0;
> +}
> +
>  /* ------------------------------------------------------------------------
>   * UVC device scan
>   */
> @@ -1532,6 +1585,12 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  
>  		break;
>  
> +	case UVC_GPIO_UNIT:
> +		if (uvc_trace_param & UVC_TRACE_PROBE)
> +			printk(KERN_CONT " GPIO %d", entity->id);
> +
> +		break;
> +

Let's move this after UVC_TT_STREAMING.

>  	case UVC_TT_STREAMING:
>  		if (UVC_ENTITY_IS_ITERM(entity)) {
>  			if (uvc_trace_param & UVC_TRACE_PROBE)
> @@ -1929,6 +1988,13 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> +	/* Add GPIO entities to the first_chain */

s/first_chain/first chain./

This leads to an interesting question. What if we have a UVC device with
two sensors ? There could be a different privacy GPIO for each of them
in theory. This would need to be reflected in the ACPI and DT bindings,
we would need to specify a GPIO per input terminal.

> +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> +	list_for_each_entry(term, &dev->entities, list) {
> +		if (UVC_ENTITY_TYPE(term) == UVC_GPIO_UNIT)
> +			list_add_tail(&term->chain, &chain->entities);
> +	}

As this is done after calling uvc_scan_chain(), and thus after
uvc_scan_chain_entity(), do we need the previous hunk ?

Alternatively, we could hook up with the existing chain scanning
mechanism if the GPIO entity was linked to another entity. This may
however be difficult to implement.

> +
>  	return 0;
>  }
>  
> @@ -2261,6 +2327,12 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> +	/* Parse the associated GPIOs */
> +	if (uvc_parse_gpio(dev) < 0) {
> +		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> +		goto error;
> +	}
> +
>  	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
>  		dev->uvc_version >> 8, dev->uvc_version & 0xff,
>  		udev->product ? udev->product : "<unnamed>",
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a493bc383d3e..7ca78005b6a9 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -6,6 +6,7 @@
>  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
>  #endif /* __KERNEL__ */
>  
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/poll.h>
>  #include <linux/usb.h>
> @@ -37,6 +38,7 @@
>  	(UVC_ENTITY_IS_TERM(entity) && \
>  	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
>  
> +#define UVC_GPIO_UNIT 0x7ffe

I'd name this UVC_EXT_GPIO_UNIT.

>  
>  /* ------------------------------------------------------------------------
>   * GUIDs
> @@ -351,6 +353,12 @@ struct uvc_entity {
>  			u8  *bmControls;
>  			u8  *bmControlsType;
>  		} extension;
> +
> +		struct {
> +			u8  bControlSize;
> +			u8  *bmControls;
> +			struct gpio_desc *gpio_privacy;
> +		} gpio;
>  	};
>  
>  	u8 bNrInPins;

-- 
Regards,

Laurent Pinchart
