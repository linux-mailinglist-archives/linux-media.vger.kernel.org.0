Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F17A2A8F27
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 07:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgKFGGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 01:06:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFGGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 01:06:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0208B16;
        Fri,  6 Nov 2020 07:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604642764;
        bh=IjbstpbyXQqNG/MhYVC7kceEAc/hrmAH8zKyIe4wb8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MYWqXt7r4PfRmo7jN6NP9ybdfpIXxU8czqc1hI0DS2GAqI27ED3vrFhFSb2o1aFl6
         6VK0o32VGwwulgBPKSveLmw4yq09Gtbvlq6C6K0QynJm3BhpiAkYZ6lXSy0oPvpcLD
         6BeX/DHeGsAeAcwGY19TQwPAki26DJ9wk9OaCNfk=
Date:   Fri, 6 Nov 2020 08:06:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: uvcvideo: Move guid to entity
Message-ID: <20201106060602.GA6926@pendragon.ideasonboard.com>
References: <20201104180734.286789-1-ribalda@chromium.org>
 <20201104180734.286789-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104180734.286789-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 04, 2020 at 07:07:29PM +0100, Ricardo Ribalda wrote:
> Instead of having multiple copies of the entity guid on the code, move
> it to the entity structure.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++--------------------------
>  drivers/media/usb/uvc/uvc_driver.c | 21 +++++++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  3 files changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f479d8971dfb..0e480b75e724 100644
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
> index 9fc0b600eab1..77fea26faa9a 100644
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
> @@ -1038,6 +1043,18 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
>  	entity->id = id;
>  	entity->type = type;
>  
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

Given that the GUID is set in uvc_parse_vendor_control() and
uvc_parse_standard_control() for extension units, I'm wondering if it
would make sense to move it there for the other entity types too. Up to
you. Otherwise, I'd add the following comment above the switch:

	/*
	 * Set the GUID for standard entity types. For extension units, the GUID
	 * is initialized by the caller.
	 */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	entity->num_links = 0;
>  	entity->num_pads = num_pads;
>  	entity->pads = ((void *)(entity + 1)) + extra_size;
> @@ -1109,7 +1126,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  		if (unit == NULL)
>  			return -ENOMEM;
>  
> -		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
> +		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
>  		memcpy(unit->baSourceID, &buffer[22], p);
>  		unit->extension.bControlSize = buffer[22+p];
> @@ -1368,7 +1385,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
