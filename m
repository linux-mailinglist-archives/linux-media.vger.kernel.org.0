Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86BE2E1BBC
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 12:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgLWLQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 06:16:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53170 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgLWLQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 06:16:47 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BA15A32;
        Wed, 23 Dec 2020 12:16:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608722164;
        bh=f//T+ENOito5d4H+ss7tw/8I6uL+j3XsJO00JXRzbGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TGJK5WdzxvNgmRKs3lZWJ0zdl8EIO0+nd9QdQsv2ZtDsBgnq6cPehpBOVoigw2mqr
         ZRwUz1w2ZzYvwWtQavA84UaR2b3T5OUxdCf2qjNwTv2DDNPgZ3meCNyim8HCVtMHj4
         IFFAiqiuC+EIJuPZ8eDab7+vWegogXBCiv+DyK9k=
Date:   Wed, 23 Dec 2020 13:15:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/11] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
Message-ID: <X+Mm6x7xPNYJK1YN@pendragon.ideasonboard.com>
References: <20201222230446.1027916-1-ribalda@chromium.org>
 <20201222230446.1027916-7-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201222230446.1027916-7-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 23, 2020 at 12:04:41AM +0100, Ricardo Ribalda wrote:
> Some devices can implement a physical switch to disable the input of the
> camera on demand. Think of it like an elegant privacy sticker.
> 
> The system can read the status of the privacy switch via a GPIO.
> 
> It is important to know the status of the switch, e.g. to notify the
> user when the camera will produce black frames and a videochat
> application is used.
> 
> In some systems, the GPIO is connected to main SoC instead of the

s/to main/to the main/

> camera controller, with the connection reported by the system firmware
> (ACPI or DT). In that case, the UVC device isn't aware of the GPIO. We
> need to implement a virtual entity to handle the GPIO fully on the
> driver side.
> 
> For example, for ACPI-based systems, the GPIO is reported in the USB
> device object:
> 
>   Scope (\_SB.PCI0.XHCI.RHUB.HS07)
>   {
> 
> 	  /.../
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
>                 }
>             }
>         }
>     })
>   }
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |   3 +
>  drivers/media/usb/uvc/uvc_driver.c | 133 +++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_entity.c |   1 +
>  drivers/media/usb/uvc/uvcvideo.h   |  17 ++++
>  4 files changed, 154 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index acdc9b032306..22857b6a71e2 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2311,6 +2311,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
>  			bmControls = entity->camera.bmControls;
>  			bControlSize = entity->camera.bControlSize;
> +		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
> +			bmControls = entity->gpio.bmControls;
> +			bControlSize = entity->gpio.bControlSize;
>  		}
>  
>  		/* Remove bogus/blacklisted controls */
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index c0c5f75ade40..5873237bbfa8 100644
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
> @@ -1020,6 +1021,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  }
>  
>  static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> +static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
>  static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> @@ -1051,6 +1053,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  	 * is initialized by the caller.
>  	 */
>  	switch (type) {
> +	case UVC_EXT_GPIO_UNIT:
> +		memcpy(entity->guid, uvc_gpio_guid, 16);
> +		break;
>  	case UVC_ITT_CAMERA:
>  		memcpy(entity->guid, uvc_camera_guid, 16);
>  		break;
> @@ -1464,6 +1469,115 @@ static int uvc_parse_control(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Privacy GPIO
> + */
> +
> +static u8 uvc_gpio_update_value(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +	struct uvc_video_chain *chain;
> +	u8 gpio_val, old_val, new_val;
> +
> +	gpio_val = new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> +
> +	old_val = atomic_xchg(&unit->gpio.gpio_privacy_value, gpio_val);
> +	if (new_val == old_val)
> +		return new_val;
> +
> +	/* GPIO entities are always on the first chain. */
> +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> +	uvc_ctrl_status_event_direct(chain, unit->controls, &new_val);
> +
> +	return new_val;
> +}
> +
> +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> +			    u8 cs, void *data, u16 size)
> +{
> +	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1 || !dev->gpio_unit)
> +		return -EINVAL;
> +
> +	*(u8 *)data = uvc_gpio_update_value(dev);
> +
> +	return 0;
> +}
> +
> +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
> +			     u8 cs, u8 *caps)
> +{
> +	if (cs != UVC_CT_PRIVACY_CONTROL)
> +		return -EINVAL;
> +
> +	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
> +	return 0;
> +}
> +
> +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> +{
> +	struct uvc_device *dev = data;
> +
> +	if (!dev->gpio_unit)
> +		return IRQ_HANDLED;
> +
> +	uvc_gpio_update_value(dev);
> +	return IRQ_HANDLED;
> +}
> +
> +static int uvc_gpio_parse(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit;
> +	struct gpio_desc *gpio_privacy;
> +	int irq;
> +
> +	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
> +					       GPIOD_IN);
> +	if (IS_ERR_OR_NULL(gpio_privacy))
> +		return PTR_ERR_OR_ZERO(gpio_privacy);
> +
> +	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +	if (!unit)
> +		return -ENOMEM;
> +
> +	irq = gpiod_to_irq(gpio_privacy);
> +	if (irq == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	if (irq < 0)
> +		dev_warn(&dev->udev->dev,
> +			 "No IRQ for privacy GPIO (%d)\n", irq);
> +
> +	atomic_set(&unit->gpio.gpio_privacy_value, -1);
> +	unit->gpio.gpio_privacy = gpio_privacy;
> +	unit->gpio.irq = irq;
> +	unit->gpio.bControlSize = 1;
> +	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
> +	unit->gpio.bmControls[0] = 1;
> +	unit->get_cur = uvc_gpio_get_cur;
> +	unit->get_info = uvc_gpio_get_info;
> +	strncpy(unit->name, "GPIO", sizeof(unit->name) - 1);
> +
> +	list_add_tail(&unit->list, &dev->entities);
> +
> +	dev->gpio_unit = unit;
> +
> +	return 0;
> +}
> +
> +static int uvc_gpio_init_irq(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +
> +	if (!unit || unit->gpio.irq < 0)
> +		return 0;
> +
> +	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
> +					 uvc_gpio_irq,
> +					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> +					   IRQF_TRIGGER_RISING,

Is there any good tool that could check indentation in a git hook ? ;-)

> +					 "uvc_privacy_gpio", dev);
> +}
> +
>  /* ------------------------------------------------------------------------
>   * UVC device scan
>   */
> @@ -1953,6 +2067,13 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> +	/* Add GPIO entity to the first chain. */
> +	if (dev->gpio_unit) {
> +		chain = list_first_entry(&dev->chains,
> +					 struct uvc_video_chain, list);
> +		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2285,6 +2406,12 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> +	/* Parse the associated GPIOs. */
> +	if (uvc_gpio_parse(dev) < 0) {
> +		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> +		goto error;
> +	}
> +
>  	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
>  		dev->uvc_version >> 8, dev->uvc_version & 0xff,
>  		udev->product ? udev->product : "<unnamed>",
> @@ -2329,6 +2456,12 @@ static int uvc_probe(struct usb_interface *intf,
>  			"supported.\n", ret);
>  	}
>  
> +	ret = uvc_gpio_init_irq(dev);
> +	if (ret < 0)
> +		dev_warn(&dev->udev->dev,
> +			 "Unable to request privacy GPIO IRQ %d. Continuing without privacy events\n",
> +			 ret);
> +
>  	uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
>  	usb_enable_autosuspend(udev);
>  	return 0;
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index ca3a9c2eec27..6a9ba5b498db 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -105,6 +105,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>  		case UVC_OTT_DISPLAY:
>  		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>  		case UVC_EXTERNAL_VENDOR_SPECIFIC:
> +		case UVC_EXT_GPIO_UNIT:
>  		default:
>  			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
>  			break;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 64a3d901db19..132513a66ee5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -6,6 +6,7 @@
>  #error "The uvcvideo.h header is deprecated, use linux/uvcvideo.h instead."
>  #endif /* __KERNEL__ */
>  
> +#include <linux/atomic.h>
>  #include <linux/kernel.h>
>  #include <linux/poll.h>
>  #include <linux/usb.h>
> @@ -37,6 +38,8 @@
>  	(UVC_ENTITY_IS_TERM(entity) && \
>  	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
>  
> +#define UVC_EXT_GPIO_UNIT		0x7ffe
> +#define UVC_EXT_GPIO_UNIT_ID		0x100
>  
>  /* ------------------------------------------------------------------------
>   * GUIDs
> @@ -56,6 +59,9 @@
>  #define UVC_GUID_UVC_SELECTOR \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
> +#define UVC_GUID_EXT_GPIO_CONTROLLER \
> +	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> +	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
>  
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> @@ -213,6 +219,7 @@
>   */
>  
>  struct uvc_device;
> +struct gpio_desc;

Alphabetical order ? :-)

Otherwise this looks good, pending an agreement on how to handle the
case where the GPIO can't generate an IRQ.

>  
>  /* TODO: Put the most frequently accessed fields at the beginning of
>   * structures to maximize cache efficiency.
> @@ -353,6 +360,14 @@ struct uvc_entity {
>  			u8  *bmControls;
>  			u8  *bmControlsType;
>  		} extension;
> +
> +		struct {
> +			u8  bControlSize;
> +			u8  *bmControls;
> +			struct gpio_desc *gpio_privacy;
> +			int irq;
> +			atomic_t gpio_privacy_value;
> +		} gpio;
>  	};
>  
>  	u8 bNrInPins;
> @@ -690,6 +705,8 @@ struct uvc_device {
>  		struct uvc_control *ctrl;
>  		const void *data;
>  	} async_ctrl;
> +
> +	struct uvc_entity *gpio_unit;
>  };
>  
>  enum uvc_handle_state {

-- 
Regards,

Laurent Pinchart
