Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A98D45B448
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 07:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhKXGdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 01:33:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49162 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhKXGdd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 01:33:33 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 042C7D78;
        Wed, 24 Nov 2021 07:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637735423;
        bh=oLd/p6dnZcznalXXe2bYzvgmoujMsT8+XQYircdZ648=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yi9ld04IgcOoUC/xnaSLdfFAr5+MlkTiI6IU0CD5IxlhBi0blec6hcxP4SBF/YWqX
         P9LZuYyN6JWV/aorQNlZRqTJcmLumgncCepaVLDgbwOnziwwNRQzJ+94eNaMzaCd82
         lKPu3SHbopaZVGEJjRregf//BoyCNIldPyDx+ZUA=
Date:   Wed, 24 Nov 2021 08:30:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Scott K Logan <logans@cottsay.net>
Cc:     linux-uvc-devel@lists.sourceforge.net, linux-media@vger.kernel.org,
        Yuriy M Kaminskiy <yumkam@gmail.com>
Subject: Re: [PATCH v2 1/1] media: uvcvideo: Add quirk for exponential
 exposure
Message-ID: <YZ3b6ObAhJnz9OSF@pendragon.ideasonboard.com>
References: <20211003023554.885815-2-logans@cottsay.net>
 <20211124005834.556428-1-logans@cottsay.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124005834.556428-1-logans@cottsay.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Scott,

Thank you for the patch.

On Wed, Nov 24, 2021 at 12:59:05AM +0000, Scott K Logan wrote:
> At least some of the Microsoft LifeCam series of webcams exhibit a
> behavior which requires a 'quirk' to be handled properly. When
> configuring the absolute exposure value of the image, there are only a
> handful of values which will result in a consistent change to the image
> exposure, while all other values appear to result in a maximum
> exposure.
> The valid values appear to follow an exponential pattern from the
> maximum value (10000) down to the minimum, yielding less than 15
> possible values depending on the device's reported minimum.
> 
> Signed-off-by: Scott K Logan <logans@cottsay.net>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 30bfe9069a1f..2dfc70597858 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2142,6 +2142,40 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +/* --------------------------------------------------------------------------
> + * Quirks
> + */
> +
> +static s32 uvc_ctrl_get_abs_exposure_exponential(
> +	struct uvc_control_mapping *mapping, u8 query, const u8 *data)
> +{
> +	s32 i;
> +	s32 value = uvc_get_le_value(mapping, query, data);
> +
> +	switch (query) {
> +	case UVC_GET_CUR:
> +	case UVC_GET_MIN:
> +	case UVC_GET_MAX:
> +	case UVC_GET_DEF:
> +		for (i = 0; i < 14; ++i) {
> +			if (10000 >> i <= value)
> +				break;
> +		}
> +		return 14 - i;
> +	case UVC_GET_RES:
> +		return 1;
> +	default:
> +		return value;
> +	}
> +}
> +
> +static void uvc_ctrl_set_abs_exposure_exponential(
> +	struct uvc_control_mapping *mapping, s32 value, u8 *data)
> +{
> +	value = 10000 >> (14 - value);

In addition to restricting the values to the ones correctly supported by
the device, this maps a linear scale (1 to 10000) to an exponential
scale (1 to 14). The V4L2 control V4L2_CID_EXPOSURE_ABSOLUTE is supposed
to be linear, and documented as expressed in 100 µs units.

Wouldn't it be better to keep the original scale (1 to 10000) and round
the requested value to the closest supported value ?

Additionally, do we have a guarantee that all the devices that need this
quirk will have the same exposure range (1 to 10000), or could the
maximum value be different ?

> +	uvc_set_le_value(mapping, value, data);
> +}
> +
>  /* --------------------------------------------------------------------------
>   * Control and mapping handling
>   */
> @@ -2210,6 +2244,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		}
>  	}
>  
> +	if ((chain->dev->quirks & UVC_QUIRK_EXPONENTIAL_EXPOSURE) &&
> +	    ctrl->info.selector == UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL) {
> +		uvc_dbg(chain->dev, CONTROL, "Applying exponential exposure quirk\n");
> +		map->get = uvc_ctrl_get_abs_exposure_exponential;
> +		map->set = uvc_ctrl_set_abs_exposure_exponential;
> +	}
> +
>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		uvc_map_get_name(map), ctrl->info.entity,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7c007426e082..9edf77ee30e6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2718,6 +2718,33 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +	/* Microsoft Lifecam HD-5000 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x045e,
> +	  .idProduct		= 0x076d,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
> +	/* Microsoft Lifecam Studio */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x045e,
> +	  .idProduct		= 0x0772,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
> +	/* Microsoft Lifecam HD-3000 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x045e,
> +	  .idProduct		= 0x0810,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
>  	/* Logitech Quickcam Fusion */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 2e5366143b81..b6d5ae0b1c90 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -209,6 +209,7 @@
>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
>  #define UVC_QUIRK_FORCE_Y8		0x00000800
>  #define UVC_QUIRK_FORCE_BPP		0x00001000
> +#define UVC_QUIRK_EXPONENTIAL_EXPOSURE	0x00002000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001

-- 
Regards,

Laurent Pinchart
