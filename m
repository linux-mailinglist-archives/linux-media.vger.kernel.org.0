Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4022D30431B
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 16:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391957AbhAZPyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 10:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404017AbhAZPyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 10:54:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5087AC061D7F;
        Tue, 26 Jan 2021 07:53:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9E82C1;
        Tue, 26 Jan 2021 16:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611676417;
        bh=W4bQjoGXwILIiUBeqpNhEN0QvF1jH/IzyCDRfW2sWCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=et2k3k3+KCeAgZCb3ix+8D+qX7ZferOessnjHjDtE7cEFt8l0fTzYInPbFujYwz9U
         fSgmwWfinf87h72VTmJD+mrxCiOB7IaLCHNNJBkLdXmLrjWemapeJ7iQ1GjwRbduq7
         4TKQtZHHIF81czxuexRBBytNGFkj5lWk1oEa6kBk=
Date:   Tue, 26 Jan 2021 17:53:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/12] media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
Message-ID: <YBA67sapYU3almJb@pendragon.ideasonboard.com>
References: <20201223133528.55014-1-ribalda@chromium.org>
 <20201223133528.55014-7-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201223133528.55014-7-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 23, 2020 at 02:35:22PM +0100, Ricardo Ribalda wrote:
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
>  drivers/media/usb/uvc/uvc_driver.c | 127 +++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_entity.c |   1 +
>  drivers/media/usb/uvc/uvcvideo.h   |  16 ++++
>  4 files changed, 147 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 1a5e85368af4..e0ab55583dd8 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2291,6 +2291,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> index c0c5f75ade40..b0bf93c44999 100644
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
> @@ -1464,6 +1469,108 @@ static int uvc_parse_control(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Privacy GPIO
> + */
> +
> +static void uvc_gpio_event(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit = dev->gpio_unit;
> +	struct uvc_video_chain *chain;
> +	u8 new_val;
> +
> +	if (!unit)
> +		return;
> +
> +	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
> +
> +	/* GPIO entities are always on the first chain. */
> +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> +	uvc_ctrl_status_event(chain, unit->controls, &new_val);
> +}
> +
> +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> +			    u8 cs, void *data, u16 size)
> +{
> +	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
> +		return -EINVAL;
> +
> +	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
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
> +	uvc_gpio_event(dev);

Should uvc_gpio_event() be inlined here ? If so I can make the
modification when applying, there's no need for a v8 just for this.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> +	if (irq < 0) {
> +		if (irq != EPROBE_DEFER)
> +			dev_err(&dev->udev->dev,
> +				"No IRQ for privacy GPIO (%d)\n", irq);
> +		return irq;
> +	}
> +
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
> +					 IRQF_TRIGGER_RISING,
> +					 "uvc_privacy_gpio", dev);
> +}
> +
>  /* ------------------------------------------------------------------------
>   * UVC device scan
>   */
> @@ -1953,6 +2060,13 @@ static int uvc_scan_device(struct uvc_device *dev)
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
> @@ -2285,6 +2399,12 @@ static int uvc_probe(struct usb_interface *intf,
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
> @@ -2329,6 +2449,13 @@ static int uvc_probe(struct usb_interface *intf,
>  			"supported.\n", ret);
>  	}
>  
> +	ret = uvc_gpio_init_irq(dev);
> +	if (ret < 0) {
> +		dev_err(&dev->udev->dev,
> +			"Unable to request privacy GPIO IRQ (%d)\n", ret);
> +		goto error;
> +	}
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
> index 6465711fe5bb..4211531a3558 100644
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
> @@ -212,6 +218,7 @@
>   * Structures.
>   */
>  
> +struct gpio_desc;
>  struct uvc_device;
>  
>  /* TODO: Put the most frequently accessed fields at the beginning of
> @@ -353,6 +360,13 @@ struct uvc_entity {
>  			u8  *bmControls;
>  			u8  *bmControlsType;
>  		} extension;
> +
> +		struct {
> +			u8  bControlSize;
> +			u8  *bmControls;
> +			struct gpio_desc *gpio_privacy;
> +			int irq;
> +		} gpio;
>  	};
>  
>  	u8 bNrInPins;
> @@ -690,6 +704,8 @@ struct uvc_device {
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
