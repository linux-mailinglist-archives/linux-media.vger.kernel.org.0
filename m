Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA183378C2
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbhCKQHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:07:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbhCKQGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:06:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17ADF879;
        Thu, 11 Mar 2021 17:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615478807;
        bh=zqE3tb3TPbmWm5tlENwnf6ijRHHK0k3RLc5N+j1FgkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QL9AMLkn4xthiRsNqV1xLqIbFXb38lQB3PBoHT4Lmwlr9VDcL+x9PiR/AwmMCoMzE
         9fIZizKMJaZqgn5KTiL9uh1vgP+83PLscra7L1jYqBTdqbTeRtxL2JK0G9ls/0dItc
         5DWwXLk/X4h3W+fYd3WYEXqawji3GfKChfS1YsuY=
Date:   Thu, 11 Mar 2021 18:06:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH 06/10] media: uvcvideo: Implement UVC_CTRL_CLASS_UNIT
Message-ID: <YEo/9bP4kiiBZcRD@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-8-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311122040.1264410-8-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 01:20:36PM +0100, Ricardo Ribalda wrote:
> Create a virtual entity that holds all the class control.

Isn't this making control classes too complicated ? Can't they be
handled explicitly in uvc_query_v4l2_ctrl(), as that's the only place
where it should matter ? When registering V4L2 controls you'd set a
bitmask to track which classes are used (similarly to 10/10, but with
the bitmask stored in the chain, not an entity), and
uvc_query_v4l2_ctrl() would then handle the classes explicitly.

> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(216): missing control class for class 00980000
>                 fail: v4l2-test-controls.cpp(253): missing control class for class 009a0000
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  3 ++
>  drivers/media/usb/uvc/uvc_driver.c | 52 +++++++++++++++++++++++++++---
>  drivers/media/usb/uvc/uvc_entity.c |  1 +
>  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++++
>  4 files changed, 61 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index fd4d5ad098b9..273eccc136b8 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2354,6 +2354,9 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
>  			bmControls = entity->gpio.bmControls;
>  			bControlSize = entity->gpio.bControlSize;
> +		} else if (UVC_ENTITY_TYPE(entity) == UVC_CTRL_CLASS_UNIT) {
> +			bmControls = entity->ctrl_class.bmControls;
> +			bControlSize = entity->ctrl_class.bControlSize;
>  		}
>  
>  		/* Remove bogus/blacklisted controls */
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 30ef2a3110f7..996e8bd06ac5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1025,6 +1025,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  }
>  
>  static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> +static const u8 uvc_ctrl_class_guid[16] = UVC_GUID_CTRL_CLASS;
>  static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
>  static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> @@ -1057,6 +1058,9 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  	 * is initialized by the caller.
>  	 */
>  	switch (type) {
> +	case UVC_CTRL_CLASS_UNIT:
> +		memcpy(entity->guid, uvc_ctrl_class_guid, 16);
> +		break;
>  	case UVC_EXT_GPIO_UNIT:
>  		memcpy(entity->guid, uvc_gpio_guid, 16);
>  		break;
> @@ -1474,6 +1478,39 @@ static int uvc_parse_control(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Control Class
> + */
> +
> +static int uvc_ctrl_class_get_info(struct uvc_device *dev,
> +				   struct uvc_entity *entity,
> +				   u8 cs, u8 *caps)
> +{
> +	*caps = 0;
> +	return 0;
> +}
> +
> +static int uvc_ctrl_class_parse(struct uvc_device *dev)
> +{
> +	struct uvc_entity *unit;
> +
> +	unit = uvc_alloc_entity(UVC_CTRL_CLASS_UNIT,
> +				UVC_CTRL_CLASS_UNIT_ID, 0, 1);
> +	if (!unit)
> +		return -ENOMEM;
> +
> +	unit->ctrl_class.bControlSize = 1;
> +	unit->ctrl_class.bmControls = (u8 *)unit + sizeof(*unit);
> +	unit->ctrl_class.bmControls[0] = (1 << (UVC_CC_LAST_CLASS + 1)) - 1;
> +	unit->get_info = uvc_ctrl_class_get_info;
> +	strncpy(unit->name, "Control Class", sizeof(unit->name) - 1);
> +
> +	list_add_tail(&unit->list, &dev->entities);
> +	dev->ctrl_class_unit = unit;
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Privacy GPIO
>   */
> @@ -2054,12 +2091,11 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> -	/* Add GPIO entity to the first chain. */
> -	if (dev->gpio_unit) {
> -		chain = list_first_entry(&dev->chains,
> -					 struct uvc_video_chain, list);
> +	/* Add virtual entities to the first chain. */
> +	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
> +	list_add_tail(&dev->ctrl_class_unit->chain, &chain->entities);
> +	if (dev->gpio_unit)
>  		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> -	}
>  
>  	return 0;
>  }
> @@ -2399,6 +2435,12 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> +	/* Parse the control class. */
> +	if (uvc_ctrl_class_parse(dev) < 0) {
> +		uvc_dbg(dev, PROBE, "Unable to parse UVC CTRL CLASS\n");
> +		goto error;
> +	}
> +
>  	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
>  		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
>  		 udev->product ? udev->product : "<unnamed>",
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index 7c4d2f93d351..5285030a738c 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>  		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>  		case UVC_EXTERNAL_VENDOR_SPECIFIC:
>  		case UVC_EXT_GPIO_UNIT:
> +		case UVC_CTRL_CLASS_UNIT:
>  		default:
>  			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
>  			break;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5792232ed312..1d59ac10c2eb 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -41,6 +41,9 @@
>  #define UVC_EXT_GPIO_UNIT		0x7ffe
>  #define UVC_EXT_GPIO_UNIT_ID		0x100
>  
> +#define UVC_CTRL_CLASS_UNIT		0x7ffd
> +#define UVC_CTRL_CLASS_UNIT_ID		0x101
> +
>  /* ------------------------------------------------------------------------
>   * GUIDs
>   */
> @@ -183,6 +186,7 @@
>   */
>  #define UVC_CC_CAMERA_CLASS	0
>  #define UVC_CC_USER_CLASS	1
> +#define UVC_CC_LAST_CLASS	UVC_CC_USER_CLASS
>  
>  /* ------------------------------------------------------------------------
>   * Driver specific constants.
> @@ -375,6 +379,11 @@ struct uvc_entity {
>  			struct gpio_desc *gpio_privacy;
>  			int irq;
>  		} gpio;
> +
> +		struct {
> +			u8  bControlSize;
> +			u8  *bmControls;
> +		} ctrl_class;
>  	};
>  
>  	u8 bNrInPins;
> @@ -715,6 +724,7 @@ struct uvc_device {
>  	} async_ctrl;
>  
>  	struct uvc_entity *gpio_unit;
> +	struct uvc_entity *ctrl_class_unit;
>  };
>  
>  enum uvc_handle_state {

-- 
Regards,

Laurent Pinchart
