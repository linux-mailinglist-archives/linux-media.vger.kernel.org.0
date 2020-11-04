Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F9E2A635D
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbgKDLd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:33:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728700AbgKDLd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:33:27 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F1B5563;
        Wed,  4 Nov 2020 12:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604489605;
        bh=qzViUK5hol1fctUVlmPguaB97Qe8i4d37GxIVLbu4Ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DzyXItOo7m457X/5XsqvQ/1NOEh3X8QwkHrMBEZP0n22hU8tj5BITmg6HQsyLCIpA
         FJvNliFXgguUxgOtU0TRcx3OdQJoPhDmPx/bxm5+IGOuQIJ9vzi3JD3Fb9zQfY72ge
         DpFK1KdCcVCu547WsEwU/ykgB9cXmVR0GeW4s8Ms=
Date:   Wed, 4 Nov 2020 13:32:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 3/6] media: uvcvideo: Add UVC_GUID_EXT_GPIO_CONTROLLER
Message-ID: <20201104113238.GI26171@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022133753.310506-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 22, 2020 at 03:37:50PM +0200, Ricardo Ribalda wrote:
> Create a new GUID for GPIO controller entities that do not belong to the
> USB video device.
> 
> This GUID is selected on an address range completely different that the
> UVC standard to avoid collisions.

I'd squash this patch with 5/6.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
>  drivers/media/usb/uvc/uvcvideo.h | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0a8835742d49..913739915863 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -830,6 +830,7 @@ static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>  static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
>  static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> +static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
>  
>  static int uvc_entity_match_guid(const struct uvc_entity *entity,
>  	const u8 guid[16])
> @@ -848,6 +849,9 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>  		return memcmp(entity->extension.guidExtensionCode,
>  			      guid, 16) == 0;
>  
> +	case UVC_GPIO_UNIT:

This won't compile, UVC_GPIO_UNIT is defined in 5/6.

> +		return memcmp(uvc_gpio_guid, guid, 16) == 0;

I wonder if it would make sense to store the GUID in the uvc_entity
structure instead of adding new entries to this function.

> +
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 08922d889bb6..8e5a9fc35820 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -56,6 +56,9 @@
>  #define UVC_GUID_UVC_SELECTOR \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}

None of the GUIDs above are defined by the UVC specification. You could
use { 0x00 * 14, 0x01, 0x03 } or { 0x00 * 14, 0x02, 0x01 } instead of
going for 0xff. Not that it matters much, it's all internal.

> +#define UVC_GUID_EXT_GPIO_CONTROLLER \
> +	{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf, \

I assume the last value was meant to be 0xff ?

> +	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}
>  
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
Regards,

Laurent Pinchart
