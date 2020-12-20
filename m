Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBA32DF608
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 17:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgLTQGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:06:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727702AbgLTQGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:06:30 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8EF5593;
        Sun, 20 Dec 2020 17:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608480346;
        bh=mSNzw2IzEByhRYY/jSeBJuuUDaOwIDPs6kO78E5XIx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J4V2eFF+qtUZwricdzwyMkvbJUu8Xe6uIE+e9A2Fy8S2D1B0d1VgbjEbsSa5w21+1
         fXipApEP0SozmqGOYRlIe102jeFsxf00vjWdqcdWDiM5TtmCyDQZXzv6z5T59LTCDA
         WUFJmuIu9R1yxwGpccaMTnJXTHYKjjcrL4gfRyp4=
Date:   Sun, 20 Dec 2020 18:05:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] media: uvcvideo: Move guid to entity
Message-ID: <X992U/SCVGd41fML@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-2-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:31PM +0100, Ricardo Ribalda wrote:
> Instead of having multiple copies of the entity guid on the code, move
> it to the entity structure.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++--------------------------
>  drivers/media/usb/uvc/uvc_driver.c | 26 ++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  3 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 011e69427b7c..9f6174a10e73 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -826,31 +826,10 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>   * Terminal and unit management
>   */
>  
> -static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> -static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> -static const u8 uvc_media_transport_input_guid[16] =
> -	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> -
>  static int uvc_entity_match_guid(const struct uvc_entity *entity,
> -	const u8 guid[16])
> +				 const u8 guid[16])
>  {
> -	switch (UVC_ENTITY_TYPE(entity)) {
> -	case UVC_ITT_CAMERA:
> -		return memcmp(uvc_camera_guid, guid, 16) == 0;
> -
> -	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> -		return memcmp(uvc_media_transport_input_guid, guid, 16) == 0;
> -
> -	case UVC_VC_PROCESSING_UNIT:
> -		return memcmp(uvc_processing_guid, guid, 16) == 0;
> -
> -	case UVC_VC_EXTENSION_UNIT:
> -		return memcmp(entity->extension.guidExtensionCode,
> -			      guid, 16) == 0;
> -
> -	default:
> -		return 0;
> -	}
> +	return memcmp(entity->guid, guid, sizeof(entity->guid)) == 0;
>  }
>  
>  /* ------------------------------------------------------------------------
> @@ -1776,8 +1755,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  	if (data == NULL)
>  		return -ENOMEM;
>  
> -	memcpy(info->entity, ctrl->entity->extension.guidExtensionCode,
> -	       sizeof(info->entity));
> +	memcpy(info->entity, ctrl->entity->guid, sizeof(info->entity));
>  	info->index = ctrl->index;
>  	info->selector = ctrl->index + 1;
>  
> @@ -1883,7 +1861,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  
>  	if (!found) {
>  		uvc_trace(UVC_TRACE_CONTROL, "Control %pUl/%u not found.\n",
> -			entity->extension.guidExtensionCode, xqry->selector);
> +			entity->guid, xqry->selector);
>  		return -ENOENT;
>  	}
>  
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ddb9eaa11be7..4cdd65d252d9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1019,6 +1019,11 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	return ret;
>  }
>  
> +static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> +static const u8 uvc_media_transport_input_guid[16] =
> +	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> +static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> +
>  static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
>  		unsigned int num_pads, unsigned int extra_size)
>  {
> @@ -1038,6 +1043,23 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
>  	entity->id = id;
>  	entity->type = type;
>  
> +

Nearly there, just one blank line to remove :-) I'll fix this when
applying.

> +	/*
> +	 * Set the GUID for standard entity types. For extension units, the GUID
> +	 * is initialized by the caller.
> +	 */
> +	switch (type) {
> +	case UVC_ITT_CAMERA:
> +		memcpy(entity->guid, uvc_camera_guid, 16);
> +		break;
> +	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> +		memcpy(entity->guid, uvc_media_transport_input_guid, 16);
> +		break;
> +	case UVC_VC_PROCESSING_UNIT:
> +		memcpy(entity->guid, uvc_processing_guid, 16);
> +		break;
> +	}
> +
>  	entity->num_links = 0;
>  	entity->num_pads = num_pads;
>  	entity->pads = ((void *)(entity + 1)) + extra_size;
> @@ -1109,7 +1131,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  		if (unit == NULL)
>  			return -ENOMEM;
>  
> -		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
> +		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
>  		memcpy(unit->baSourceID, &buffer[22], p);
>  		unit->extension.bControlSize = buffer[22+p];
> @@ -1368,7 +1390,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		if (unit == NULL)
>  			return -ENOMEM;
>  
> -		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
> +		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
>  		memcpy(unit->baSourceID, &buffer[22], p);
>  		unit->extension.bControlSize = buffer[22+p];
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..df7bf2d104a3 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -304,6 +304,7 @@ struct uvc_entity {
>  	u8 id;
>  	u16 type;
>  	char name[64];
> +	u8 guid[16];
>  
>  	/* Media controller-related fields. */
>  	struct video_device *vdev;
> @@ -342,7 +343,6 @@ struct uvc_entity {
>  		} selector;
>  
>  		struct {
> -			u8  guidExtensionCode[16];
>  			u8  bNumControls;
>  			u8  bControlSize;
>  			u8  *bmControls;

-- 
Regards,

Laurent Pinchart
