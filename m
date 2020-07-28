Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8422FE61
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 02:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgG1ANn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 20:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgG1ANm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 20:13:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10A3C061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 17:13:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F319556;
        Tue, 28 Jul 2020 02:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595895215;
        bh=3EyFS3OVxs3CXP2/ou7RVVp66TVLaik037hpclIQys0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K7alIz5boN7jPJPfRHrIi6XJO+xaq3IpEbwMhwy+lFDstay2gn8z49IiB1olIGmlo
         Vbtw2XZVM81leYemfSs67SPaxqQc1dhNmJB9ZxM6pDGtsqYGwkY4LUoUL9LCJrUrgB
         kk4NQ1W3tQvB2yazpyFwr6P6xQ/PIkdUCl4viEWQ=
Date:   Tue, 28 Jul 2020 03:13:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Set media controller entity functions
Message-ID: <20200728001326.GA30712@pendragon.ideasonboard.com>
References: <20200607022047.29111-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200607022047.29111-1-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran, would you have time to give this a review ?

On Sun, Jun 07, 2020 at 05:20:47AM +0300, Laurent Pinchart wrote:
> The media controller core prints a warning when an entity is registered
> without a function being set. This affect the uvcvideo driver, as the
> warning was added without first addressing the issue in existing
> drivers. The problem is harmless, but unnecessarily worries users. Fix
> it by mapping UVC entity types to MC entity functions as accurately as
> possible using the existing functions.
> 
> Fixes: b50bde4e476d ("[media] v4l2-subdev: use MEDIA_ENT_T_UNKNOWN for new subdevs")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_entity.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index b4499cddeffe..ca3a9c2eec27 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -73,10 +73,45 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> +		u32 function;
> +
>  		v4l2_subdev_init(&entity->subdev, &uvc_subdev_ops);
>  		strscpy(entity->subdev.name, entity->name,
>  			sizeof(entity->subdev.name));
>  
> +		switch (UVC_ENTITY_TYPE(entity)) {
> +		case UVC_VC_SELECTOR_UNIT:
> +			function = MEDIA_ENT_F_VID_MUX;
> +			break;
> +		case UVC_VC_PROCESSING_UNIT:
> +		case UVC_VC_EXTENSION_UNIT:
> +			/* For lack of a better option. */
> +			function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +			break;
> +		case UVC_COMPOSITE_CONNECTOR:
> +		case UVC_COMPONENT_CONNECTOR:
> +			function = MEDIA_ENT_F_CONN_COMPOSITE;
> +			break;
> +		case UVC_SVIDEO_CONNECTOR:
> +			function = MEDIA_ENT_F_CONN_SVIDEO;
> +			break;
> +		case UVC_ITT_CAMERA:
> +			function = MEDIA_ENT_F_CAM_SENSOR;
> +			break;
> +		case UVC_TT_VENDOR_SPECIFIC:
> +		case UVC_ITT_VENDOR_SPECIFIC:
> +		case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> +		case UVC_OTT_VENDOR_SPECIFIC:
> +		case UVC_OTT_DISPLAY:
> +		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> +		case UVC_EXTERNAL_VENDOR_SPECIFIC:
> +		default:
> +			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> +			break;
> +		}
> +
> +		entity->subdev.entity.function = function;
> +
>  		ret = media_entity_pads_init(&entity->subdev.entity,
>  					entity->num_pads, entity->pads);
>  

-- 
Regards,

Laurent Pinchart
