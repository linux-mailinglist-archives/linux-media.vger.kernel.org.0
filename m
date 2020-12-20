Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C82C2DF644
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 18:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgLTRMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 12:12:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgLTRMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 12:12:43 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE1292CF;
        Sun, 20 Dec 2020 18:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608484319;
        bh=C2tsMY8+djg+oDlQ7FDtGojVJjWF3GrZG115kpmXw6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ccBJ2g746dANPOjlU0rXcWBIkAy2RUmhM7x6dVPhiTf7ov3F8Hiil5BbsWE7MOwyl
         Ni+hA3LPiimfKNPyMOCAw3otLqi+mukJF8b67Gbn99VX1GVXPlxlX5DGR0wgh7ght9
         afgcvn+TlKIGo1usfKqb6c4YhUZBH9JZDdpdbhJU=
Date:   Sun, 20 Dec 2020 19:11:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 7/9] media: uvcvideo: Use dev_ printk aliases
Message-ID: <X9+F1xdFo6iCHUpv@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-8-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-8-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:37PM +0100, Ricardo Ribalda wrote:
> Replace all the uses of printk() and uvc_printk() with its
> equivalent dev_ alias macros.
> 
> They are more standard across the kernel tree and provide
> more context about the error.

A very welcome change !

There's one printk() left in uvc_init() which can't be replaced with
dev_*, but we could simply drop it. There's also another instance in
uvc_ctrl_restore_values() that seems to have been missed by this patch.

The commit message doesn't mention the change from KERN_CONT to
pr_cont(). I would either mention it here, or maybe better move it to
the next patch that replaces the pr_cont() calls.

> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  4 +-
>  drivers/media/usb/uvc/uvc_driver.c | 80 ++++++++++++++++--------------
>  drivers/media/usb/uvc/uvc_entity.c | 10 ++--
>  drivers/media/usb/uvc/uvc_status.c | 13 ++---
>  drivers/media/usb/uvc/uvc_video.c  | 51 ++++++++++---------
>  drivers/media/usb/uvc/uvcvideo.h   | 25 ++++------
>  6 files changed, 95 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 511927e8b746..b78a52b6e193 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1327,8 +1327,8 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  	w->urb->interval = dev->int_ep->desc.bInterval;
>  	ret = usb_submit_urb(w->urb, GFP_KERNEL);
>  	if (ret < 0)
> -		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
> -			   ret);
> +		dev_err(&dev->udev->dev,
> +			"Failed to resubmit status URB (%d).\n", ret);
>  }
>  
>  bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 498de09da07e..4379916a6ac1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -535,8 +535,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>  				sizeof(format->name));
>  			format->fcc = fmtdesc->fcc;
>  		} else {
> -			uvc_printk(KERN_INFO, "Unknown video format %pUl\n",
> -				&buffer[5]);
> +			dev_info(&streaming->intf->dev,
> +				 "Unknown video format %pUl\n", &buffer[5]);
>  			snprintf(format->name, sizeof(format->name), "%pUl\n",
>  				&buffer[5]);
>  			format->fcc = 0;
> @@ -1594,7 +1594,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  	switch (UVC_ENTITY_TYPE(entity)) {
>  	case UVC_VC_EXTENSION_UNIT:
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " <- XU %d", entity->id);
> +			pr_cont(" <- XU %d", entity->id);
>  
>  		if (entity->bNrInPins != 1) {
>  			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
> @@ -1606,7 +1606,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  
>  	case UVC_VC_PROCESSING_UNIT:
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " <- PU %d", entity->id);
> +			pr_cont(" <- PU %d", entity->id);
>  
>  		if (chain->processing != NULL) {
>  			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
> @@ -1619,7 +1619,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  
>  	case UVC_VC_SELECTOR_UNIT:
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " <- SU %d", entity->id);
> +			pr_cont(" <- SU %d", entity->id);
>  
>  		/* Single-input selector units are ignored. */
>  		if (entity->bNrInPins == 1)
> @@ -1638,7 +1638,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  	case UVC_ITT_CAMERA:
>  	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " <- IT %d\n", entity->id);
> +			pr_cont(" <- IT %d\n", entity->id);
>  
>  		break;
>  
> @@ -1646,17 +1646,17 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  	case UVC_OTT_DISPLAY:
>  	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " OT %d", entity->id);
> +			pr_cont(" OT %d", entity->id);
>  
>  		break;
>  
>  	case UVC_TT_STREAMING:
>  		if (UVC_ENTITY_IS_ITERM(entity)) {
>  			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				printk(KERN_CONT " <- IT %d\n", entity->id);
> +				pr_cont(" <- IT %d\n", entity->id);
>  		} else {
>  			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				printk(KERN_CONT " OT %d", entity->id);
> +				pr_cont(" OT %d", entity->id);
>  		}
>  
>  		break;
> @@ -1706,9 +1706,9 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (uvc_trace_param & UVC_TRACE_PROBE) {
>  				if (!found)
> -					printk(KERN_CONT " (->");
> +					pr_cont(" (->");
>  
> -				printk(KERN_CONT " XU %d", forward->id);
> +				pr_cont(" XU %d", forward->id);
>  				found = 1;
>  			}
>  			break;
> @@ -1726,16 +1726,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (uvc_trace_param & UVC_TRACE_PROBE) {
>  				if (!found)
> -					printk(KERN_CONT " (->");
> +					pr_cont(" (->");
>  
> -				printk(KERN_CONT " OT %d", forward->id);
> +				pr_cont(" OT %d", forward->id);
>  				found = 1;
>  			}
>  			break;
>  		}
>  	}
>  	if (found)
> -		printk(KERN_CONT ")");
> +		pr_cont(")");
>  
>  	return 0;
>  }
> @@ -1761,7 +1761,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  		}
>  
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT " <- IT");
> +			pr_cont(" <- IT");
>  
>  		chain->selector = entity;
>  		for (i = 0; i < entity->bNrInPins; ++i) {
> @@ -1782,14 +1782,14 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  			}
>  
>  			if (uvc_trace_param & UVC_TRACE_PROBE)
> -				printk(KERN_CONT " %d", term->id);
> +				pr_cont(" %d", term->id);
>  
>  			list_add_tail(&term->chain, &chain->entities);
>  			uvc_scan_chain_forward(chain, term, entity);
>  		}
>  
>  		if (uvc_trace_param & UVC_TRACE_PROBE)
> -			printk(KERN_CONT "\n");
> +			pr_cont("\n");
>  
>  		id = 0;
>  		break;
> @@ -2044,7 +2044,7 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		uvc_scan_fallback(dev);
>  
>  	if (list_empty(&dev->chains)) {
> -		uvc_printk(KERN_INFO, "No valid video chain found.\n");
> +		dev_info(&dev->udev->dev, "No valid video chain found.\n");
>  		return -1;
>  	}
>  
> @@ -2203,8 +2203,9 @@ int uvc_register_video_device(struct uvc_device *dev,
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {
> -		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
> -			   v4l2_type_names[type], ret);
> +		dev_err(&stream->intf->dev,
> +			"Failed to register %s device (%d).\n",
> +			v4l2_type_names[type], ret);
>  		return ret;
>  	}
>  
> @@ -2220,8 +2221,8 @@ static int uvc_register_video(struct uvc_device *dev,
>  	/* Initialize the streaming interface with default parameters. */
>  	ret = uvc_video_init(stream);
>  	if (ret < 0) {
> -		uvc_printk(KERN_ERR, "Failed to initialize the device (%d).\n",
> -			   ret);
> +		dev_err(&stream->intf->dev,
> +			"Failed to initialize the device (%d).\n", ret);
>  		return ret;
>  	}
>  
> @@ -2255,8 +2256,9 @@ static int uvc_register_terms(struct uvc_device *dev,
>  
>  		stream = uvc_stream_by_id(dev, term->id);
>  		if (stream == NULL) {
> -			uvc_printk(KERN_INFO, "No streaming interface found "
> -				   "for terminal %u.", term->id);
> +			dev_info(&dev->udev->dev,
> +				 "No streaming interface found for terminal %u.",
> +				 term->id);
>  			continue;
>  		}
>  
> @@ -2289,8 +2291,8 @@ static int uvc_register_chains(struct uvc_device *dev)
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  		ret = uvc_mc_register_entities(chain);
>  		if (ret < 0)
> -			uvc_printk(KERN_INFO,
> -				   "Failed to register entities (%d).\n", ret);
> +			dev_info(&dev->udev->dev,
> +				 "Failed to register entities (%d).\n", ret);
>  #endif
>  	}
>  
> @@ -2393,17 +2395,19 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> -	uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> -		dev->uvc_version >> 8, dev->uvc_version & 0xff,
> -		udev->product ? udev->product : "<unnamed>",
> -		le16_to_cpu(udev->descriptor.idVendor),
> -		le16_to_cpu(udev->descriptor.idProduct));
> +	dev_info(&dev->udev->dev,
> +		 "Found UVC %u.%02x device %s (%04x:%04x)\n",

This holds on a single line.

> +		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
> +		 udev->product ? udev->product : "<unnamed>",
> +		 le16_to_cpu(udev->descriptor.idVendor),
> +		 le16_to_cpu(udev->descriptor.idProduct));
>  
>  	if (dev->quirks != dev->info->quirks) {
> -		uvc_printk(KERN_INFO, "Forcing device quirks to 0x%x by module "
> -			"parameter for testing purpose.\n", dev->quirks);
> -		uvc_printk(KERN_INFO, "Please report required quirks to the "
> -			"linux-uvc-devel mailing list.\n");
> +		dev_info(&dev->udev->dev,
> +			 "Forcing device quirks to 0x%x by module parameter for testing purpose.\n",
> +			 dev->quirks);
> +		dev_info(&dev->udev->dev,
> +			 "Please report required quirks to the linux-uvc-devel mailing list.\n");
>  	}
>  
>  	/* Register the V4L2 device. */
> @@ -2432,9 +2436,9 @@ static int uvc_probe(struct usb_interface *intf,
>  
>  	/* Initialize the interrupt URB. */
>  	if ((ret = uvc_status_init(dev)) < 0) {
> -		uvc_printk(KERN_INFO, "Unable to initialize the status "
> -			"endpoint (%d), status interrupt will not be "
> -			"supported.\n", ret);
> +		dev_info(&dev->udev->dev,
> +			 "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
> +			 ret);
>  	}
>  
>  	uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index ca3a9c2eec27..a13bee5aee56 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -139,8 +139,9 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>  	list_for_each_entry(entity, &chain->entities, chain) {
>  		ret = uvc_mc_init_entity(chain, entity);
>  		if (ret < 0) {
> -			uvc_printk(KERN_INFO, "Failed to initialize entity for "
> -				   "entity %u\n", entity->id);
> +			dev_info(&chain->dev->udev->dev,
> +				 "Failed to initialize entity for entity %u\n",
> +				 entity->id);
>  			return ret;
>  		}
>  	}
> @@ -148,8 +149,9 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>  	list_for_each_entry(entity, &chain->entities, chain) {
>  		ret = uvc_mc_create_links(chain, entity);
>  		if (ret < 0) {
> -			uvc_printk(KERN_INFO, "Failed to create links for "
> -				   "entity %u\n", entity->id);
> +			dev_info(&chain->dev->udev->dev,
> +				 "Failed to create links for entity %u\n",
> +				 entity->id);
>  			return ret;
>  		}
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 2bdb0ff203f8..36fa196a9258 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -208,8 +208,9 @@ static void uvc_status_complete(struct urb *urb)
>  		return;
>  
>  	default:
> -		uvc_printk(KERN_WARNING, "Non-zero status (%d) in status "
> -			"completion handler.\n", urb->status);
> +		dev_warn(&dev->udev->dev,
> +			 "Non-zero status (%d) in status completion handler.\n",
> +			 urb->status);
>  		return;
>  	}
>  
> @@ -243,10 +244,10 @@ static void uvc_status_complete(struct urb *urb)
>  
>  	/* Resubmit the URB. */
>  	urb->interval = dev->int_ep->desc.bInterval;
> -	if ((ret = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
> -		uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
> -			ret);
> -	}
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret < 0)
> +		dev_err(&dev->udev->dev,
> +			"Failed to resubmit status URB (%d).\n", ret);
>  }
>  
>  int uvc_status_init(struct uvc_device *dev)
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a6a441d92b94..a4a0f3556986 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,9 +76,9 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> -	uvc_printk(KERN_ERR,
> -		   "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -		   uvc_query_name(query), cs, unit, ret, size);
> +	dev_err(&dev->udev->dev,
> +		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> +		uvc_query_name(query), cs, unit, ret, size);
>  
>  	if (ret != -EPIPE)
>  		return ret;
> @@ -254,9 +254,9 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  		ret = -EIO;
>  		goto out;
>  	} else if (ret != size) {
> -		uvc_printk(KERN_ERR, "Failed to query (%u) UVC %s control : "
> -			"%d (exp. %u).\n", query, probe ? "probe" : "commit",
> -			ret, size);
> +		dev_err(&stream->intf->dev,
> +			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
> +			query, probe ? "probe" : "commit", ret, size);
>  		ret = -EIO;
>  		goto out;
>  	}
> @@ -334,9 +334,9 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
>  		size, uvc_timeout_param);
>  	if (ret != size) {
> -		uvc_printk(KERN_ERR, "Failed to set UVC %s control : "
> -			"%d (exp. %u).\n", probe ? "probe" : "commit",
> -			ret, size);
> +		dev_err(&stream->intf->dev,
> +			"Failed to set UVC %s control : %d (exp. %u).\n",
> +			probe ? "probe" : "commit", ret, size);
>  		ret = -EIO;
>  	}
>  
> @@ -1119,9 +1119,10 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>  	}
>  
>  	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> -	if (ret < 0)
> -		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
> -			   ret);
> +	if (ret < 0) {
> +		dev_err(&uvc_urb->stream->intf->dev,
> +			"Failed to resubmit video URB (%d).\n", ret);
> +	}

No need for curly braces.

>  }
>  
>  static void uvc_video_decode_data(struct uvc_urb *uvc_urb,
> @@ -1507,8 +1508,9 @@ static void uvc_video_complete(struct urb *urb)
>  		break;
>  
>  	default:
> -		uvc_printk(KERN_WARNING, "Non-zero status (%d) in video "
> -			"completion handler.\n", urb->status);
> +		dev_warn(&stream->intf->dev,
> +			 "Non-zero status (%d) in video completion handler.\n",
> +			 urb->status);
>  		fallthrough;
>  	case -ENOENT:		/* usb_poison_urb() called. */
>  		if (stream->frozen)
> @@ -1545,9 +1547,8 @@ static void uvc_video_complete(struct urb *urb)
>  	if (!uvc_urb->async_operations) {
>  		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>  		if (ret < 0)
> -			uvc_printk(KERN_ERR,
> -				   "Failed to resubmit video URB (%d).\n",
> -				   ret);
> +			dev_err(&stream->intf->dev,
> +				"Failed to resubmit video URB (%d).\n", ret);
>  		return;
>  	}
>  
> @@ -1893,8 +1894,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  	for_each_uvc_urb(uvc_urb, stream) {
>  		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>  		if (ret < 0) {
> -			uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
> -				   uvc_urb_index(uvc_urb), ret);
> +			dev_err(&stream->intf->dev,
> +				"Failed to submit URB %u (%d).\n",
> +				uvc_urb_index(uvc_urb), ret);
>  			uvc_video_stop_transfer(stream, 1);
>  			return ret;
>  		}
> @@ -1989,7 +1991,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>  	int ret;
>  
>  	if (stream->nformats == 0) {
> -		uvc_printk(KERN_INFO, "No supported video formats found.\n");
> +		dev_info(&stream->intf->dev,
> +			 "No supported video formats found.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -2029,8 +2032,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>  	}
>  
>  	if (format->nframes == 0) {
> -		uvc_printk(KERN_INFO, "No frame descriptor found for the "
> -			"default format.\n");
> +		dev_info(&stream->intf->dev,
> +			 "No frame descriptor found for the default format.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -2064,8 +2067,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>  		if (stream->intf->num_altsetting == 1)
>  			stream->decode = uvc_video_encode_bulk;
>  		else {
> -			uvc_printk(KERN_INFO, "Isochronous endpoints are not "
> -				"supported for video output devices.\n");
> +			dev_info(&stream->intf->dev,
> +				 "Isochronous endpoints are not supported for video output devices.\n");
>  			return -EINVAL;
>  		}
>  	}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index f87d14fb3f56..d8e2f27bf576 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -742,20 +742,17 @@ extern unsigned int uvc_trace_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
>  
> -#define uvc_trace(flag, msg...) \
> -	do { \
> -		if (uvc_trace_param & flag) \
> -			printk(KERN_DEBUG "uvcvideo: " msg); \
> -	} while (0)
> -
> -#define uvc_warn_once(dev, warn, msg...) \
> -	do { \
> -		if (!test_and_set_bit(warn, &dev->warnings)) \
> -			printk(KERN_INFO "uvcvideo: " msg); \
> -	} while (0)
> -
> -#define uvc_printk(level, msg...) \
> -	printk(level "uvcvideo: " msg)
> +#define uvc_trace(flag, fmt, ...)					\
> +do {									\
> +	if (uvc_trace_param & flag)					\
> +		printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);	\
> +} while (0)

It would be nice to use dev_printk(KERN_DEBUG, dev, ...) :-) (in a
separate patch).

> +
> +#define uvc_warn_once(_dev, warn, fmt, ...)				\
> +do {									\
> +	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
> +		dev_info(&(_dev)->udev->dev, fmt, ##__VA_ARGS__);	\
> +} while (0)

Could you please mention these changes in the commit message ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  /* --------------------------------------------------------------------------
>   * Internal functions.

-- 
Regards,

Laurent Pinchart
