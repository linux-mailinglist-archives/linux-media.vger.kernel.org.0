Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1304B2DF646
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 18:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgLTROM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 12:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbgLTROM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 12:14:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE031C061282;
        Sun, 20 Dec 2020 09:13:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 591ED2CF;
        Sun, 20 Dec 2020 18:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608484403;
        bh=TNSklQhN8wAjO0Ttx3zvBPLxBf+EViFG8aeElMOPISs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0MFpW5ko+ra9e49ao4ynfeksTwyEIW7W2uUsfhzoqqYLm5ECfqHQFRH9K9a6Yzgl
         3MzmBVYdvBpze7uRGm8jnm0v1zKXFDrBoMhaaDg+AvNHC3xGwnPa6Wf2f28MmKPiVN
         SQ/YANccSqBtYdVCfrkyKRdfHTLvpMH/eEPaEC3c=
Date:   Sun, 20 Dec 2020 19:13:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 8/9] media: uvcvideo: New macro uvc_trace_cont
Message-ID: <X9+GK3/BY60kwxoX@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-9-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-9-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:38PM +0100, Ricardo Ribalda wrote:
> Remove all the duplicated code around pr_cont with a new macro.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 57 +++++++++++-------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  6 ++++
>  2 files changed, 27 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 4379916a6ac1..e49491250e87 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1593,8 +1593,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  {
>  	switch (UVC_ENTITY_TYPE(entity)) {
>  	case UVC_VC_EXTENSION_UNIT:
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" <- XU %d", entity->id);
> +		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
>  
>  		if (entity->bNrInPins != 1) {
>  			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
> @@ -1605,8 +1604,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		break;
>  
>  	case UVC_VC_PROCESSING_UNIT:
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" <- PU %d", entity->id);
> +		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
>  
>  		if (chain->processing != NULL) {
>  			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
> @@ -1618,8 +1616,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		break;
>  
>  	case UVC_VC_SELECTOR_UNIT:
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" <- SU %d", entity->id);
> +		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
>  
>  		/* Single-input selector units are ignored. */
>  		if (entity->bNrInPins == 1)
> @@ -1637,27 +1634,22 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  	case UVC_ITT_VENDOR_SPECIFIC:
>  	case UVC_ITT_CAMERA:
>  	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" <- IT %d\n", entity->id);
> +		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
>  
>  		break;
>  
>  	case UVC_OTT_VENDOR_SPECIFIC:
>  	case UVC_OTT_DISPLAY:
>  	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" OT %d", entity->id);
> +		uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
>  
>  		break;
>  
>  	case UVC_TT_STREAMING:
> -		if (UVC_ENTITY_IS_ITERM(entity)) {
> -			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				pr_cont(" <- IT %d\n", entity->id);
> -		} else {
> -			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				pr_cont(" OT %d", entity->id);
> -		}
> +		if (UVC_ENTITY_IS_ITERM(entity))
> +			uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
> +		else
> +			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
>  
>  		break;
>  
> @@ -1704,13 +1696,11 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  			}
>  
>  			list_add_tail(&forward->chain, &chain->entities);
> -			if (uvc_trace_param & UVC_TRACE_PROBE) {
> -				if (!found)
> -					pr_cont(" (->");
> +			if (!found)
> +				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
>  
> -				pr_cont(" XU %d", forward->id);
> -				found = 1;
> -			}
> +			uvc_trace_cont(UVC_TRACE_PROBE, " XU %d", forward->id);
> +			found = 1;
>  			break;
>  
>  		case UVC_OTT_VENDOR_SPECIFIC:
> @@ -1724,18 +1714,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  			}
>  
>  			list_add_tail(&forward->chain, &chain->entities);
> -			if (uvc_trace_param & UVC_TRACE_PROBE) {
> -				if (!found)
> -					pr_cont(" (->");
> +			if (!found)
> +				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
>  
> -				pr_cont(" OT %d", forward->id);
> -				found = 1;
> -			}
> +			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", forward->id);
> +			found = 1;
>  			break;
>  		}
>  	}
>  	if (found)
> -		pr_cont(")");
> +		uvc_trace_cont(UVC_TRACE_PROBE, ")");
>  
>  	return 0;
>  }
> @@ -1760,8 +1748,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  			break;
>  		}
>  
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont(" <- IT");
> +		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
>  
>  		chain->selector = entity;
>  		for (i = 0; i < entity->bNrInPins; ++i) {
> @@ -1781,15 +1768,13 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  				return -EINVAL;
>  			}
>  
> -			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				pr_cont(" %d", term->id);
> +			uvc_trace_cont(UVC_TRACE_PROBE, " %d", term->id);
>  
>  			list_add_tail(&term->chain, &chain->entities);
>  			uvc_scan_chain_forward(chain, term, entity);
>  		}
>  
> -		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			pr_cont("\n");
> +		uvc_trace_cont(UVC_TRACE_PROBE, "\n");
>  
>  		id = 0;
>  		break;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index d8e2f27bf576..2b5ba4b02d3a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -748,6 +748,12 @@ do {									\
>  		printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);	\
>  } while (0)
>  
> +#define uvc_trace_cont(flag, fmt, ...)					\
> +do {									\
> +	if (uvc_trace_param & flag)					\
> +		pr_cont(fmt, ##__VA_ARGS__);				\
> +} while (0)
> +
>  #define uvc_warn_once(_dev, warn, fmt, ...)				\
>  do {									\
>  	if (!test_and_set_bit(warn, &(_dev)->warnings))			\

-- 
Regards,

Laurent Pinchart
