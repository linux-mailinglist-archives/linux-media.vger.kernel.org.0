Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADF52E0773
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 09:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgLVIwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 03:52:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42498 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgLVIwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 03:52:46 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEB479E6;
        Tue, 22 Dec 2020 09:52:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608627121;
        bh=GvqP4zh3FBGYgf9kZ+hurYwdbxpwiDzv08F3f2GrOPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mvniqmE9JqhuXU8jLjhsHLAIzEC7MAvWZ/4lAOVDuFgK8M+15oOev0aJxkX2Amvki
         G/HkZ43FkumRSEzTu9KnU3Ce3M6vq8UaNsjGJ54ewMj8K5dTMV+wusLl1ST+RPkDUc
         2cSZxK+ODv9ceMmK2VW7uRUGoQHK/zVmrFsvP4/M=
Date:   Tue, 22 Dec 2020 10:51:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/12] media: uvcvideo: use dev_dbg() for uvc_trace()
Message-ID: <X+GzqZv7G3HmVAx/@pendragon.ideasonboard.com>
References: <20201221164819.792019-1-ribalda@chromium.org>
 <20201221164819.792019-13-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201221164819.792019-13-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 21, 2020 at 05:48:19PM +0100, Ricardo Ribalda wrote:
> Instead of calling prink() inside uvc_trace, use dev_dbg(), which add

You're using dev_printk(KERN_DEBUG), which is right, but doesn't match
the commit message.

> context to the output.
> 
> Now that we are at it, regroup the strings so the messages can be easily
> "grepable".
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  66 ++++---
>  drivers/media/usb/uvc/uvc_driver.c | 298 +++++++++++++++--------------
>  drivers/media/usb/uvc/uvc_isight.c |  16 +-
>  drivers/media/usb/uvc/uvc_queue.c  |   9 +-
>  drivers/media/usb/uvc/uvc_status.c |  19 +-
>  drivers/media/usb/uvc/uvc_v4l2.c   |  53 +++--
>  drivers/media/usb/uvc/uvc_video.c  |  72 +++----
>  drivers/media/usb/uvc/uvcvideo.h   |  11 +-
>  8 files changed, 291 insertions(+), 253 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 1f1323a649fb..febe20e2887d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -906,8 +906,8 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  	}
>  
>  	if (ctrl == NULL && !next)
> -		uvc_trace(UVC_TRACE_CONTROL, "Control 0x%08x not found.\n",
> -				v4l2_id);
> +		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> +			  "Control 0x%08x not found.\n", v4l2_id);
>  
>  	return ctrl;
>  }
> @@ -1828,9 +1828,9 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  	ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
>  			     info->selector, data, 2);
>  	if (ret < 0) {
> -		uvc_trace(UVC_TRACE_CONTROL,
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
>  			  "GET_LEN failed on control %pUl/%u (%d).\n",
> -			   info->entity, info->selector, ret);
> +			  info->entity, info->selector, ret);
>  		goto done;
>  	}
>  
> @@ -1841,7 +1841,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  
>  	ret = uvc_ctrl_get_flags(dev, ctrl, info);
>  	if (ret < 0) {
> -		uvc_trace(UVC_TRACE_CONTROL,
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
>  			  "Failed to get flags for control %pUl/%u (%d).\n",
>  			  info->entity, info->selector, ret);
>  		goto done;
> @@ -1849,8 +1849,8 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  
>  	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
>  
> -	uvc_trace(UVC_TRACE_CONTROL, "XU control %pUl/%u queried: len %u, "
> -		  "flags { get %u set %u auto %u }.\n",
> +	uvc_trace(dev, UVC_TRACE_CONTROL,
> +		  "XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }.\n",
>  		  info->entity, info->selector, info->size,
>  		  (info->flags & UVC_CTRL_FLAG_GET_CUR) ? 1 : 0,
>  		  (info->flags & UVC_CTRL_FLAG_SET_CUR) ? 1 : 0,
> @@ -1879,9 +1879,10 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  
>  	ret = uvc_ctrl_add_info(dev, ctrl, &info);
>  	if (ret < 0)
> -		uvc_trace(UVC_TRACE_CONTROL, "Failed to initialize control "
> -			  "%pUl/%u on device %s entity %u\n", info.entity,
> -			  info.selector, dev->udev->devpath, ctrl->entity->id);
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
> +			  "Failed to initialize control %pUl/%u on device %s entity %u\n",
> +			  info.entity, info.selector, dev->udev->devpath,
> +			  ctrl->entity->id);
>  
>  	return ret;
>  }
> @@ -1909,8 +1910,8 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	}
>  
>  	if (!found) {
> -		uvc_trace(UVC_TRACE_CONTROL, "Extension unit %u not found.\n",
> -			xqry->unit);
> +		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> +			  "Extension unit %u not found.\n", xqry->unit);
>  		return -ENOENT;
>  	}
>  
> @@ -1925,8 +1926,9 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	}
>  
>  	if (!found) {
> -		uvc_trace(UVC_TRACE_CONTROL, "Control %pUl/%u not found.\n",
> -			entity->guid, xqry->selector);
> +		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> +			  "Control %pUl/%u not found.\n", entity->guid,
> +			  xqry->selector);
>  		return -ENOENT;
>  	}
>  
> @@ -2074,9 +2076,10 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  
>  	ctrl->initialized = 1;
>  
> -	uvc_trace(UVC_TRACE_CONTROL, "Added control %pUl/%u to device %s "
> -		"entity %u\n", ctrl->info.entity, ctrl->info.selector,
> -		dev->udev->devpath, ctrl->entity->id);
> +	uvc_trace(dev, UVC_TRACE_CONTROL,
> +		  "Added control %pUl/%u to device %s entity %u\n",
> +		  ctrl->info.entity, ctrl->info.selector, dev->udev->devpath,
> +		  ctrl->entity->id);
>  
>  	return 0;
>  }
> @@ -2113,9 +2116,9 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>  		map->set = uvc_set_le_value;
>  
>  	list_add_tail(&map->list, &ctrl->info.mappings);
> -	uvc_trace(UVC_TRACE_CONTROL,
> -		"Adding mapping '%s' to control %pUl/%u.\n",
> -		map->name, ctrl->info.entity, ctrl->info.selector);
> +	uvc_trace(dev, UVC_TRACE_CONTROL,
> +		  "Adding mapping '%s' to control %pUl/%u.\n",
> +		  map->name, ctrl->info.entity, ctrl->info.selector);
>  
>  	return 0;
>  }
> @@ -2131,9 +2134,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	if (mapping->id & ~V4L2_CTRL_ID_MASK) {
> -		uvc_trace(UVC_TRACE_CONTROL, "Can't add mapping '%s', control "
> -			"id 0x%08x is invalid.\n", mapping->name,
> -			mapping->id);
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
> +			  "Can't add mapping '%s', control id 0x%08x is invalid.\n",
> +			  mapping->name, mapping->id);
>  		return -EINVAL;
>  	}
>  
> @@ -2178,9 +2181,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  
>  	list_for_each_entry(map, &ctrl->info.mappings, list) {
>  		if (mapping->id == map->id) {
> -			uvc_trace(UVC_TRACE_CONTROL, "Can't add mapping '%s', "
> -				"control id 0x%08x already exists.\n",
> -				mapping->name, mapping->id);
> +			uvc_trace(dev, UVC_TRACE_CONTROL,
> +				  "Can't add mapping '%s', control id 0x%08x already exists.\n",
> +				  mapping->name, mapping->id);
>  			ret = -EEXIST;
>  			goto done;
>  		}
> @@ -2189,9 +2192,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	/* Prevent excess memory consumption */
>  	if (atomic_inc_return(&dev->nmappings) > UVC_MAX_CONTROL_MAPPINGS) {
>  		atomic_dec(&dev->nmappings);
> -		uvc_trace(UVC_TRACE_CONTROL, "Can't add mapping '%s', maximum "
> -			"mappings count (%u) exceeded.\n", mapping->name,
> -			UVC_MAX_CONTROL_MAPPINGS);
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
> +			  "Can't add mapping '%s', maximum mappings count (%u) exceeded.\n",
> +			  mapping->name, UVC_MAX_CONTROL_MAPPINGS);
>  		ret = -ENOMEM;
>  		goto done;
>  	}
> @@ -2260,8 +2263,9 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>  		    !uvc_test_bit(controls, blacklist[i].index))
>  			continue;
>  
> -		uvc_trace(UVC_TRACE_CONTROL, "%u/%u control is black listed, "
> -			"removing it.\n", entity->id, blacklist[i].index);
> +		uvc_trace(dev, UVC_TRACE_CONTROL,
> +			  "%u/%u control is black listed, removing it.\n",
> +			  entity->id, blacklist[i].index);
>  
>  		uvc_clear_bit(controls, blacklist[i].index);
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ea64c716f1f3..f857bb9b7755 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -521,10 +521,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	case UVC_VS_FORMAT_FRAME_BASED:
>  		n = buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED ? 27 : 28;
>  		if (buflen < n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d FORMAT error\n",
> -			       dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d FORMAT error\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -585,10 +585,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  	case UVC_VS_FORMAT_MJPEG:
>  		if (buflen < 11) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d FORMAT error\n",
> -			       dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d FORMAT error\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -601,10 +601,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  	case UVC_VS_FORMAT_DV:
>  		if (buflen < 9) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d FORMAT error\n",
> -			       dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d FORMAT error\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -619,9 +619,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>  			strscpy(format->name, "HD-DV", sizeof(format->name));
>  			break;
>  		default:
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d: unknown DV format %u\n",
> -			       dev->udev->devnum,
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d: unknown DV format %u\n",
> +				  dev->udev->devnum,
>  			       alts->desc.bInterfaceNumber, buffer[8]);
>  			return -EINVAL;
>  		}
> @@ -648,14 +648,14 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	case UVC_VS_FORMAT_STREAM_BASED:
>  		/* Not supported yet. */
>  	default:
> -		uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -		       "interface %d unsupported format %u\n",
> -		       dev->udev->devnum, alts->desc.bInterfaceNumber,
> -		       buffer[2]);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d videostreaming interface %d unsupported format %u\n",
> +			  dev->udev->devnum, alts->desc.bInterfaceNumber,
> +			  buffer[2]);
>  		return -EINVAL;
>  	}
>  
> -	uvc_trace(UVC_TRACE_DESCR, "Found format %s.\n", format->name);
> +	uvc_trace(dev, UVC_TRACE_DESCR, "Found format %s.\n", format->name);
>  
>  	buflen -= buffer[0];
>  	buffer += buffer[0];
> @@ -674,9 +674,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		n = n ? n : 3;
>  
>  		if (buflen < 26 + 4*n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d FRAME error\n", dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d FRAME error\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -738,10 +739,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  				frame->dwDefaultFrameInterval;
>  		}
>  
> -		uvc_trace(UVC_TRACE_DESCR, "- %ux%u (%u.%u fps)\n",
> -			frame->wWidth, frame->wHeight,
> -			10000000/frame->dwDefaultFrameInterval,
> -			(100000000/frame->dwDefaultFrameInterval)%10);
> +		uvc_trace(dev, UVC_TRACE_DESCR, "- %ux%u (%u.%u fps)\n",
> +			  frame->wWidth, frame->wHeight,
> +			  10000000 / frame->dwDefaultFrameInterval,
> +			  (100000000 / frame->dwDefaultFrameInterval) % 10);
>  
>  		format->nframes++;
>  		buflen -= buffer[0];
> @@ -757,10 +758,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>  	    buffer[2] == UVC_VS_COLORFORMAT) {
>  		if (buflen < 6) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			       "interface %d COLORFORMAT error\n",
> -			       dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d COLORFORMAT error\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -792,16 +793,18 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass
>  		!= UVC_SC_VIDEOSTREAMING) {
> -		uvc_trace(UVC_TRACE_DESCR, "device %d interface %d isn't a "
> -			"video streaming interface\n", dev->udev->devnum,
> -			intf->altsetting[0].desc.bInterfaceNumber);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d interface %d isn't a video streaming interface\n",
> +			  dev->udev->devnum,
> +			  intf->altsetting[0].desc.bInterfaceNumber);
>  		return -EINVAL;
>  	}
>  
>  	if (usb_driver_claim_interface(&uvc_driver.driver, intf, dev)) {
> -		uvc_trace(UVC_TRACE_DESCR, "device %d interface %d is already "
> -			"claimed\n", dev->udev->devnum,
> -			intf->altsetting[0].desc.bInterfaceNumber);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d interface %d is already claimed\n",
> +			  dev->udev->devnum,
> +			  intf->altsetting[0].desc.bInterfaceNumber);
>  		return -EINVAL;
>  	}
>  
> @@ -823,8 +826,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  			if (ep->extralen > 2 &&
>  			    ep->extra[1] == USB_DT_CS_INTERFACE) {
> -				uvc_trace(UVC_TRACE_DESCR, "trying extra data "
> -					"from endpoint %u.\n", i);
> +				uvc_trace(dev, UVC_TRACE_DESCR,
> +					  "trying extra data from endpoint %u.\n",
> +					  i);
>  				buffer = alts->endpoint[i].extra;
>  				buflen = alts->endpoint[i].extralen;
>  				break;
> @@ -839,8 +843,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (buflen <= 2) {
> -		uvc_trace(UVC_TRACE_DESCR, "no class-specific streaming "
> -			"interface descriptors found.\n");
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "no class-specific streaming interface descriptors found.\n");
>  		goto error;
>  	}
>  
> @@ -857,9 +861,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  		break;
>  
>  	default:
> -		uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming interface "
> -			"%d HEADER descriptor not found.\n", dev->udev->devnum,
> -			alts->desc.bInterfaceNumber);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d videostreaming interface %d HEADER descriptor not found.\n",
> +			  dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -867,9 +871,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	n = buflen >= size ? buffer[size-1] : 0;
>  
>  	if (buflen < size + p*n) {
> -		uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -			"interface %d HEADER descriptor is invalid.\n",
> -			dev->udev->devnum, alts->desc.bInterfaceNumber);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d videostreaming interface %d HEADER descriptor is invalid.\n",
> +			  dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -919,10 +923,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  		case UVC_VS_FORMAT_MPEG2TS:
>  		case UVC_VS_FORMAT_STREAM_BASED:
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
> -				"interface %d FORMAT %u is not supported.\n",
> -				dev->udev->devnum,
> -				alts->desc.bInterfaceNumber, _buffer[2]);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videostreaming interface %d FORMAT %u is not supported.\n",
> +				  dev->udev->devnum,
> +				  alts->desc.bInterfaceNumber, _buffer[2]);
>  			break;
>  
>  		case UVC_VS_FRAME_UNCOMPRESSED:
> @@ -944,9 +948,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (nformats == 0) {
> -		uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming interface "
> -			"%d has no supported formats defined.\n",
> -			dev->udev->devnum, alts->desc.bInterfaceNumber);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d videostreaming interface %d has no supported formats defined.\n",
> +			  dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -993,9 +997,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (buflen)
> -		uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming interface "
> -			"%d has %u bytes of trailing descriptor garbage.\n",
> -			dev->udev->devnum, alts->desc.bInterfaceNumber, buflen);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "device %d videostreaming interface %d has %u bytes of trailing descriptor garbage.\n",
> +			  dev->udev->devnum, alts->desc.bInterfaceNumber,
> +			  buflen);
>  
>  	/* Parse the alternate settings to find the maximum bandwidth. */
>  	for (i = 0; i < intf->num_altsetting; ++i) {
> @@ -1128,9 +1133,9 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  		n = buflen >= 25 + p ? buffer[22+p] : 0;
>  
>  		if (buflen < 25 + p + 2*n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d EXTENSION_UNIT error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d EXTENSION_UNIT error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			break;
>  		}
>  
> @@ -1177,9 +1182,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		n = buflen >= 12 ? buffer[11] : 0;
>  
>  		if (buflen < 12 + n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d HEADER error\n", udev->devnum,
> -				alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d HEADER error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1190,9 +1195,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		for (i = 0; i < n; ++i) {
>  			intf = usb_ifnum_to_if(udev, buffer[12+i]);
>  			if (intf == NULL) {
> -				uvc_trace(UVC_TRACE_DESCR, "device %d "
> -					"interface %d doesn't exists\n",
> -					udev->devnum, i);
> +				uvc_trace(dev, UVC_TRACE_DESCR,
> +					  "device %d interface %d doesn't exists\n",
> +					  udev->devnum, i);
>  				continue;
>  			}
>  
> @@ -1202,9 +1207,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  	case UVC_VC_INPUT_TERMINAL:
>  		if (buflen < 8) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d INPUT_TERMINAL error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d INPUT_TERMINAL error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1221,11 +1226,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		 */
>  		type = get_unaligned_le16(&buffer[4]);
>  		if ((type & 0x7f00) == 0 || (type & 0x8000) != 0) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d INPUT_TERMINAL %d has invalid "
> -				"type 0x%04x, skipping\n", udev->devnum,
> -				alts->desc.bInterfaceNumber,
> -				buffer[3], type);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d INPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber,
> +				  buffer[3], type);
>  			return 0;
>  		}
>  
> @@ -1244,9 +1248,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		}
>  
>  		if (buflen < len + n + p) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d INPUT_TERMINAL error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d INPUT_TERMINAL error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1291,9 +1295,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  	case UVC_VC_OUTPUT_TERMINAL:
>  		if (buflen < 9) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d OUTPUT_TERMINAL error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d OUTPUT_TERMINAL error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1302,10 +1306,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		 */
>  		type = get_unaligned_le16(&buffer[4]);
>  		if ((type & 0xff00) == 0) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d OUTPUT_TERMINAL %d has invalid "
> -				"type 0x%04x, skipping\n", udev->devnum,
> -				alts->desc.bInterfaceNumber, buffer[3], type);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d OUTPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber,
> +				  buffer[3], type);
>  			return 0;
>  		}
>  
> @@ -1329,9 +1333,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		p = buflen >= 5 ? buffer[4] : 0;
>  
>  		if (buflen < 5 || buflen < 6 + p) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d SELECTOR_UNIT error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d SELECTOR_UNIT error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1355,9 +1359,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		p = dev->uvc_version >= 0x0110 ? 10 : 9;
>  
>  		if (buflen < p + n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d PROCESSING_UNIT error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1388,9 +1392,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		n = buflen >= 24 + p ? buffer[22+p] : 0;
>  
>  		if (buflen < 24 + p + n) {
> -			uvc_trace(UVC_TRACE_DESCR, "device %d videocontrol "
> -				"interface %d EXTENSION_UNIT error\n",
> -				udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "device %d videocontrol interface %d EXTENSION_UNIT error\n",
> +				  udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1415,8 +1419,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		break;
>  
>  	default:
> -		uvc_trace(UVC_TRACE_DESCR, "Found an unknown CS_INTERFACE "
> -			"descriptor (%u)\n", buffer[2]);
> +		uvc_trace(dev, UVC_TRACE_DESCR,
> +			  "Found an unknown CS_INTERFACE descriptor (%u)\n",
> +			  buffer[2]);
>  		break;
>  	}
>  
> @@ -1461,8 +1466,9 @@ static int uvc_parse_control(struct uvc_device *dev)
>  		if (usb_endpoint_is_int_in(desc) &&
>  		    le16_to_cpu(desc->wMaxPacketSize) >= 8 &&
>  		    desc->bInterval != 0) {
> -			uvc_trace(UVC_TRACE_DESCR, "Found a Status endpoint "
> -				"(addr %02x).\n", desc->bEndpointAddress);
> +			uvc_trace(dev, UVC_TRACE_DESCR,
> +				  "Found a Status endpoint (addr %02x).\n",
> +				  desc->bEndpointAddress);
>  			dev->int_ep = ep;
>  		}
>  	}
> @@ -1689,8 +1695,9 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
>  
>  		if (entity->bNrInPins != 1) {
> -			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
> -				"than 1 input pin.\n", entity->id);
> +			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +				  "Extension unit %d has more than 1 input pin.\n",
> +				  entity->id);
>  			return -1;
>  		}
>  
> @@ -1700,8 +1707,8 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
>  
>  		if (chain->processing != NULL) {
> -			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
> -				"Processing Units in chain.\n");
> +			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +				  "Found multiple Processing Units in chain.\n");
>  			return -1;
>  		}
>  
> @@ -1716,8 +1723,8 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  			break;
>  
>  		if (chain->selector != NULL) {
> -			uvc_trace(UVC_TRACE_DESCR, "Found multiple Selector "
> -				"Units in chain.\n");
> +			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +				  "Found multiple Selector Units in chain.\n");
>  			return -1;
>  		}
>  
> @@ -1747,8 +1754,9 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		break;
>  
>  	default:
> -		uvc_trace(UVC_TRACE_DESCR, "Unsupported entity type "
> -			"0x%04x found in chain.\n", UVC_ENTITY_TYPE(entity));
> +		uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +			  "Unsupported entity type 0x%04x found in chain.\n",
> +			  UVC_ENTITY_TYPE(entity));
>  		return -1;
>  	}
>  
> @@ -1774,16 +1782,17 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  		if (forward == prev)
>  			continue;
>  		if (forward->chain.next || forward->chain.prev) {
> -			uvc_trace(UVC_TRACE_DESCR, "Found reference to "
> -				"entity %d already in chain.\n", forward->id);
> +			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +				  "Found reference to entity %d already in chain.\n",
> +				  forward->id);
>  			return -EINVAL;
>  		}
>  
>  		switch (UVC_ENTITY_TYPE(forward)) {
>  		case UVC_VC_EXTENSION_UNIT:
>  			if (forward->bNrInPins != 1) {
> -				uvc_trace(UVC_TRACE_DESCR, "Extension unit %d "
> -					  "has more than 1 input pin.\n",
> +				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +					  "Extension unit %d has more than 1 input pin.\n",
>  					  entity->id);
>  				return -EINVAL;
>  			}
> @@ -1801,8 +1810,9 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>  		case UVC_TT_STREAMING:
>  			if (UVC_ENTITY_IS_ITERM(forward)) {
> -				uvc_trace(UVC_TRACE_DESCR, "Unsupported input "
> -					"terminal %u.\n", forward->id);
> +				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +					  "Unsupported input terminal %u.\n",
> +					  forward->id);
>  				return -EINVAL;
>  			}
>  
> @@ -1848,16 +1858,16 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  			id = entity->baSourceID[i];
>  			term = uvc_entity_by_id(chain->dev, id);
>  			if (term == NULL || !UVC_ENTITY_IS_ITERM(term)) {
> -				uvc_trace(UVC_TRACE_DESCR, "Selector unit %d "
> -					"input %d isn't connected to an "
> -					"input terminal\n", entity->id, i);
> +				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +					  "Selector unit %d input %d isn't connected to an input terminal\n",
> +					  entity->id, i);
>  				return -1;
>  			}
>  
>  			if (term->chain.next || term->chain.prev) {
> -				uvc_trace(UVC_TRACE_DESCR, "Found reference to "
> -					"entity %d already in chain.\n",
> -					term->id);
> +				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +					  "Found reference to entity %d already in chain.\n",
> +					  term->id);
>  				return -EINVAL;
>  			}
>  
> @@ -1890,8 +1900,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  
>  	entity = uvc_entity_by_id(chain->dev, id);
>  	if (entity == NULL) {
> -		uvc_trace(UVC_TRACE_DESCR, "Found reference to "
> -			"unknown entity %d.\n", id);
> +		uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +			  "Found reference to unknown entity %d.\n", id);
>  		return -EINVAL;
>  	}
>  
> @@ -1904,7 +1914,7 @@ static int uvc_scan_chain(struct uvc_video_chain *chain,
>  {
>  	struct uvc_entity *entity, *prev;
>  
> -	uvc_trace(UVC_TRACE_PROBE, "Scanning UVC chain:");
> +	uvc_trace(chain->dev, UVC_TRACE_PROBE, "Scanning UVC chain:");
>  
>  	entity = term;
>  	prev = NULL;
> @@ -1912,8 +1922,9 @@ static int uvc_scan_chain(struct uvc_video_chain *chain,
>  	while (entity != NULL) {
>  		/* Entity must not be part of an existing chain */
>  		if (entity->chain.next || entity->chain.prev) {
> -			uvc_trace(UVC_TRACE_DESCR, "Found reference to "
> -				"entity %d already in chain.\n", entity->id);
> +			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> +				  "Found reference to entity %d already in chain.\n",
> +				  entity->id);
>  			return -EINVAL;
>  		}
>  
> @@ -2067,7 +2078,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
>  
>  	list_add_tail(&chain->list, &dev->chains);
>  
> -	uvc_trace(UVC_TRACE_PROBE,
> +	uvc_trace(dev, UVC_TRACE_PROBE,
>  		  "Found a video chain by fallback heuristic (%s).\n",
>  		  uvc_print_chain(chain));
>  
> @@ -2112,7 +2123,8 @@ static int uvc_scan_device(struct uvc_device *dev)
>  			continue;
>  		}
>  
> -		uvc_trace(UVC_TRACE_PROBE, "Found a valid video chain (%s).\n",
> +		uvc_trace(dev, UVC_TRACE_PROBE,
> +			  "Found a valid video chain (%s).\n",
>  			  uvc_print_chain(chain));
>  
>  		list_add_tail(&chain->list, &dev->chains);
> @@ -2393,14 +2405,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	int function;
>  	int ret;
>  
> -	if (id->idVendor && id->idProduct)
> -		uvc_trace(UVC_TRACE_PROBE, "Probing known UVC device %s "
> -				"(%04x:%04x)\n", udev->devpath, id->idVendor,
> -				id->idProduct);
> -	else
> -		uvc_trace(UVC_TRACE_PROBE, "Probing generic UVC device %s\n",
> -				udev->devpath);
> -
>  	/* Allocate memory for the device and initialize it. */
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (dev == NULL)
> @@ -2420,6 +2424,14 @@ static int uvc_probe(struct usb_interface *intf,
>  	dev->quirks = uvc_quirks_param == -1
>  		    ? dev->info->quirks : uvc_quirks_param;
>  
> +	if (id->idVendor && id->idProduct)
> +		uvc_trace(dev, UVC_TRACE_PROBE,
> +			  "Probing known UVC device %s (%04x:%04x)\n",
> +			  udev->devpath, id->idVendor, id->idProduct);
> +	else
> +		uvc_trace(dev, UVC_TRACE_PROBE,
> +			  "Probing generic UVC device %s\n", udev->devpath);
> +
>  	if (udev->product != NULL)
>  		strscpy(dev->name, udev->product, sizeof(dev->name));
>  	else
> @@ -2462,14 +2474,14 @@ static int uvc_probe(struct usb_interface *intf,
>  
>  	/* Parse the Video Class control descriptor. */
>  	if (uvc_parse_control(dev) < 0) {
> -		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC "
> -			"descriptors.\n");
> +		uvc_trace(dev, UVC_TRACE_PROBE,
> +			  "Unable to parse UVC descriptors.\n");
>  		goto error;
>  	}
>  
>  	/* Parse the associated GPIOs. */
>  	if (uvc_gpio_parse(dev) < 0) {
> -		uvc_trace(UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> +		uvc_trace(dev, UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
>  		goto error;
>  	}
>  
> @@ -2524,7 +2536,7 @@ static int uvc_probe(struct usb_interface *intf,
>  			 "Unable to request uvc_privacy_gpio irq %d. Continuing wihtout privacy events\n",
>  			 ret);
>  
> -	uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
> +	uvc_trace(dev, UVC_TRACE_PROBE, "UVC device initialized.\n");
>  	usb_enable_autosuspend(udev);
>  	return 0;
>  
> @@ -2556,7 +2568,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
>  	struct uvc_device *dev = usb_get_intfdata(intf);
>  	struct uvc_streaming *stream;
>  
> -	uvc_trace(UVC_TRACE_SUSPEND, "Suspending interface %u\n",
> +	uvc_trace(dev, UVC_TRACE_SUSPEND, "Suspending interface %u\n",
>  		intf->cur_altsetting->desc.bInterfaceNumber);
>  
>  	/* Controls are cached on the fly so they don't need to be saved. */
> @@ -2574,8 +2586,8 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
>  			return uvc_video_suspend(stream);
>  	}
>  
> -	uvc_trace(UVC_TRACE_SUSPEND, "Suspend: video streaming USB interface "
> -			"mismatch.\n");
> +	uvc_trace(dev, UVC_TRACE_SUSPEND,
> +		  "Suspend: video streaming USB interface mismatch.\n");
>  	return -EINVAL;
>  }
>  
> @@ -2585,8 +2597,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  	struct uvc_streaming *stream;
>  	int ret = 0;
>  
> -	uvc_trace(UVC_TRACE_SUSPEND, "Resuming interface %u\n",
> -		intf->cur_altsetting->desc.bInterfaceNumber);
> +	uvc_trace(dev, UVC_TRACE_SUSPEND, "Resuming interface %u\n",
> +		  intf->cur_altsetting->desc.bInterfaceNumber);
>  
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass ==
>  	    UVC_SC_VIDEOCONTROL) {
> @@ -2614,8 +2626,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  		}
>  	}
>  
> -	uvc_trace(UVC_TRACE_SUSPEND, "Resume: video streaming USB interface "
> -			"mismatch.\n");
> +	uvc_trace(dev, UVC_TRACE_SUSPEND,
> +		  "Resume: video streaming USB interface mismatch.\n");
>  	return -EINVAL;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
> index 135fd7fe6852..d06fa2ea9420 100644
> --- a/drivers/media/usb/uvc/uvc_isight.c
> +++ b/drivers/media/usb/uvc/uvc_isight.c
> @@ -43,21 +43,23 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  	unsigned int maxlen, nbytes;
>  	u8 *mem;
>  	int is_header = 0;
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue);

The driver more or less orders variable declarations by line size, could
you please move this up ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	if (buf == NULL)
>  		return 0;
>  
>  	if ((len >= 14 && memcmp(&data[2], hdr, 12) == 0) ||
>  	    (len >= 15 && memcmp(&data[3], hdr, 12) == 0)) {
> -		uvc_trace(UVC_TRACE_FRAME, "iSight header found\n");
> +		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +			  "iSight header found\n");
>  		is_header = 1;
>  	}
>  
>  	/* Synchronize to the input stream by waiting for a header packet. */
>  	if (buf->state != UVC_BUF_STATE_ACTIVE) {
>  		if (!is_header) {
> -			uvc_trace(UVC_TRACE_FRAME, "Dropping packet (out of "
> -				  "sync).\n");
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "Dropping packet (out of sync).\n");
>  			return 0;
>  		}
>  
> @@ -85,8 +87,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  		buf->bytesused += nbytes;
>  
>  		if (len > maxlen || buf->bytesused == buf->length) {
> -			uvc_trace(UVC_TRACE_FRAME, "Frame complete "
> -				  "(overflow).\n");
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "Frame complete (overflow).\n");
>  			buf->state = UVC_BUF_STATE_DONE;
>  		}
>  	}
> @@ -103,8 +105,8 @@ void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
>  
>  	for (i = 0; i < urb->number_of_packets; ++i) {
>  		if (urb->iso_frame_desc[i].status < 0) {
> -			uvc_trace(UVC_TRACE_FRAME, "USB isochronous frame "
> -				  "lost (%d).\n",
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "USB isochronous frame lost (%d).\n",
>  				  urb->iso_frame_desc[i].status);
>  		}
>  
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index e800d491303f..66f2b2f19d65 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -32,12 +32,6 @@
>   * the driver.
>   */
>  
> -static inline struct uvc_streaming *
> -uvc_queue_to_stream(struct uvc_video_queue *queue)
> -{
> -	return container_of(queue, struct uvc_streaming, queue);
> -}
> -
>  static inline struct uvc_buffer *uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)
>  {
>  	return container_of(buf, struct uvc_buffer, buf);
> @@ -109,7 +103,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
> -		uvc_trace(UVC_TRACE_CAPTURE, "[E] Bytes used out of bounds.\n");
> +		uvc_trace(uvc_queue_to_stream(queue)->dev, UVC_TRACE_CAPTURE,
> +			  "[E] Bytes used out of bounds.\n");
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 36fa196a9258..b5f493216fcd 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -93,20 +93,20 @@ static void uvc_event_streaming(struct uvc_device *dev,
>  				struct uvc_streaming_status *status, int len)
>  {
>  	if (len < 3) {
> -		uvc_trace(UVC_TRACE_STATUS, "Invalid streaming status event "
> -				"received.\n");
> +		uvc_trace(dev, UVC_TRACE_STATUS,
> +			  "Invalid streaming status event received.\n");
>  		return;
>  	}
>  
>  	if (status->bEvent == 0) {
>  		if (len < 4)
>  			return;
> -		uvc_trace(UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
> +		uvc_trace(dev, UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
>  			  status->bOriginator,
>  			  status->bValue[0] ? "pressed" : "released", len);
>  		uvc_input_report_key(dev, KEY_CAMERA, status->bValue[0]);
>  	} else {
> -		uvc_trace(UVC_TRACE_STATUS,
> +		uvc_trace(dev, UVC_TRACE_STATUS,
>  			  "Stream %u error event %02x len %d.\n",
>  			  status->bOriginator, status->bEvent, len);
>  	}
> @@ -163,12 +163,12 @@ static bool uvc_event_control(struct urb *urb,
>  
>  	if (len < 6 || status->bEvent != 0 ||
>  	    status->bAttribute >= ARRAY_SIZE(attrs)) {
> -		uvc_trace(UVC_TRACE_STATUS, "Invalid control status event "
> -				"received.\n");
> +		uvc_trace(dev, UVC_TRACE_STATUS,
> +			  "Invalid control status event received.\n");
>  		return false;
>  	}
>  
> -	uvc_trace(UVC_TRACE_STATUS, "Control %u/%u %s change len %d.\n",
> +	uvc_trace(dev, UVC_TRACE_STATUS, "Control %u/%u %s change len %d.\n",
>  		  status->bOriginator, status->bSelector,
>  		  attrs[status->bAttribute], len);
>  
> @@ -236,8 +236,9 @@ static void uvc_status_complete(struct urb *urb)
>  		}
>  
>  		default:
> -			uvc_trace(UVC_TRACE_STATUS, "Unknown status event "
> -				"type %u.\n", dev->status[0]);
> +			uvc_trace(dev, UVC_TRACE_STATUS,
> +				  "Unknown status event type %u.\n",
> +				  dev->status[0]);
>  			break;
>  		}
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index fa06bfa174ad..3a2d17bc766b 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -75,8 +75,9 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  		break;
>  
>  	default:
> -		uvc_trace(UVC_TRACE_CONTROL, "Unsupported V4L2 control type "
> -			  "%u.\n", xmap->v4l2_type);
> +		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> +			  "Unsupported V4L2 control type %u.\n",
> +			  xmap->v4l2_type);
>  		ret = -ENOTTY;
>  		goto free_map;
>  	}
> @@ -164,10 +165,11 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  		return -EINVAL;
>  
>  	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
> -	uvc_trace(UVC_TRACE_FORMAT, "Trying format 0x%08x (%c%c%c%c): %ux%u.\n",
> -			fmt->fmt.pix.pixelformat,
> -			fcc[0], fcc[1], fcc[2], fcc[3],
> -			fmt->fmt.pix.width, fmt->fmt.pix.height);
> +	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +		  "Trying format 0x%08x (%c%c%c%c): %ux%u.\n",
> +		  fmt->fmt.pix.pixelformat,
> +		  fcc[0], fcc[1], fcc[2], fcc[3],
> +		  fmt->fmt.pix.width, fmt->fmt.pix.height);
>  
>  	/* Check if the hardware supports the requested format, use the default
>  	 * format otherwise.
> @@ -207,16 +209,18 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (frame == NULL) {
> -		uvc_trace(UVC_TRACE_FORMAT, "Unsupported size %ux%u.\n",
> -				fmt->fmt.pix.width, fmt->fmt.pix.height);
> +		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +			  "Unsupported size %ux%u.\n", fmt->fmt.pix.width,
> +			  fmt->fmt.pix.height);
>  		return -EINVAL;
>  	}
>  
>  	/* Use the default frame interval. */
>  	interval = frame->dwDefaultFrameInterval;
> -	uvc_trace(UVC_TRACE_FORMAT, "Using default frame interval %u.%u us "
> -		"(%u.%u fps).\n", interval/10, interval%10, 10000000/interval,
> -		(100000000/interval)%10);
> +	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +		  "Using default frame interval %u.%u us (%u.%u fps).\n",
> +		  interval / 10, interval % 10, 10000000 / interval,
> +		 (100000000 / interval) % 10);
>  
>  	/* Set the format index, frame index and frame interval. */
>  	memset(probe, 0, sizeof(*probe));
> @@ -258,7 +262,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (i == stream->nformats) {
> -		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFormatIndex %u\n",
> +		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +			  "Unknown bFormatIndex %u\n",
>  			  probe->bFormatIndex);
>  		return -EINVAL;
>  	}
> @@ -271,7 +276,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (i == format->nframes) {
> -		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFrameIndex %u\n",
> +		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +			  "Unknown bFrameIndex %u\n",
>  			  probe->bFrameIndex);
>  		return -EINVAL;
>  	}
> @@ -416,8 +422,9 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  
>  	interval = uvc_fraction_to_interval(timeperframe.numerator,
>  		timeperframe.denominator);
> -	uvc_trace(UVC_TRACE_FORMAT, "Setting frame interval to %u/%u (%u).\n",
> -		timeperframe.numerator, timeperframe.denominator, interval);
> +	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> +		  "Setting frame interval to %u/%u (%u).\n",
> +		  timeperframe.numerator, timeperframe.denominator, interval);
>  
>  	mutex_lock(&stream->mutex);
>  
> @@ -545,8 +552,8 @@ static int uvc_v4l2_open(struct file *file)
>  	struct uvc_fh *handle;
>  	int ret = 0;
>  
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_open\n");
>  	stream = video_drvdata(file);
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
>  
>  	ret = usb_autopm_get_interface(stream->dev->intf);
>  	if (ret < 0)
> @@ -588,7 +595,7 @@ static int uvc_v4l2_release(struct file *file)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_release\n");
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
>  
>  	/* Only free resources if this is a privileged handle. */
>  	if (uvc_has_privileges(handle))
> @@ -1461,7 +1468,11 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>  		    size_t count, loff_t *ppos)
>  {
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_read: not implemented.\n");
> +	struct uvc_fh *handle = file->private_data;
> +	struct uvc_streaming *stream = handle->stream;
> +
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS,
> +		  "uvc_v4l2_read: not implemented.\n");
>  	return -EINVAL;
>  }
>  
> @@ -1470,7 +1481,7 @@ static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_mmap\n");
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_mmap(&stream->queue, vma);
>  }
> @@ -1480,7 +1491,7 @@ static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_poll\n");
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_poll(&stream->queue, file, wait);
>  }
> @@ -1493,7 +1504,7 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_get_unmapped_area\n");
> +	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
>  }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 71e643e6d006..26251ed0c3fd 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (ret != 1)
>  		return ret < 0 ? ret : -EPIPE;
>  
> -	uvc_trace(UVC_TRACE_CONTROL, "Control error %u\n", error);
> +	uvc_trace(dev, UVC_TRACE_CONTROL, "Control error %u\n", error);
>  
>  	switch (error) {
>  	case 0:
> @@ -705,8 +705,8 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	sof = y;
>  
> -	uvc_trace(UVC_TRACE_CLOCK, "%s: PTS %u y %llu.%06llu SOF %u.%06llu "
> -		  "(x1 %u x2 %u y1 %u y2 %u SOF offset %u)\n",
> +	uvc_trace(stream->dev, UVC_TRACE_CLOCK,
> +		  "%s: PTS %u y %llu.%06llu SOF %u.%06llu (x1 %u x2 %u y1 %u y2 %u SOF offset %u)\n",
>  		  stream->dev->name, buf->pts,
>  		  y >> 16, div_u64((y & 0xffff) * 1000000, 65536),
>  		  sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> @@ -740,8 +740,8 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	timestamp = ktime_to_ns(first->host_time) + y - y1;
>  
> -	uvc_trace(UVC_TRACE_CLOCK, "%s: SOF %u.%06llu y %llu ts %llu "
> -		  "buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %u)\n",
> +	uvc_trace(stream->dev, UVC_TRACE_CLOCK,
> +		  "%s: SOF %u.%06llu y %llu ts %llu buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %u)\n",
>  		  stream->dev->name,
>  		  sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
>  		  y, timestamp, vbuf->vb2_buf.timestamp,
> @@ -875,9 +875,8 @@ static void uvc_video_stats_update(struct uvc_streaming *stream)
>  {
>  	struct uvc_stats_frame *frame = &stream->stats.frame;
>  
> -	uvc_trace(UVC_TRACE_STATS, "frame %u stats: %u/%u/%u packets, "
> -		  "%u/%u/%u pts (%searly %sinitial), %u/%u scr, "
> -		  "last pts/stc/sof %u/%u/%u\n",
> +	uvc_trace(stream->dev, UVC_TRACE_STATS,
> +		  "frame %u stats: %u/%u/%u packets, %u/%u/%u pts (%searly %sinitial), %u/%u scr, last pts/stc/sof %u/%u/%u\n",
>  		  stream->sequence, frame->first_data,
>  		  frame->nb_packets - frame->nb_empty, frame->nb_packets,
>  		  frame->nb_pts_diffs, frame->last_pts_diff, frame->nb_pts,
> @@ -1039,8 +1038,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  
>  	/* Mark the buffer as bad if the error bit is set. */
>  	if (data[1] & UVC_STREAM_ERR) {
> -		uvc_trace(UVC_TRACE_FRAME, "Marking buffer as bad (error bit "
> -			  "set).\n");
> +		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +			  "Marking buffer as bad (error bit set).\n");
>  		buf->error = 1;
>  	}
>  
> @@ -1054,8 +1053,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	 */
>  	if (buf->state != UVC_BUF_STATE_ACTIVE) {
>  		if (fid == stream->last_fid) {
> -			uvc_trace(UVC_TRACE_FRAME, "Dropping payload (out of "
> -				"sync).\n");
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "Dropping payload (out of sync).\n");
>  			if ((stream->dev->quirks & UVC_QUIRK_STREAM_NO_FID) &&
>  			    (data[1] & UVC_STREAM_EOF))
>  				stream->last_fid ^= UVC_STREAM_FID;
> @@ -1086,8 +1085,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	 * previous payload had the EOF bit set.
>  	 */
>  	if (fid != stream->last_fid && buf->bytesused != 0) {
> -		uvc_trace(UVC_TRACE_FRAME, "Frame complete (FID bit "
> -				"toggled).\n");
> +		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +			  "Frame complete (FID bit toggled).\n");
>  		buf->state = UVC_BUF_STATE_READY;
>  		return -EAGAIN;
>  	}
> @@ -1148,7 +1147,8 @@ static void uvc_video_decode_data(struct uvc_urb *uvc_urb,
>  
>  	/* Complete the current frame if the buffer size was exceeded. */
>  	if (len > maxlen) {
> -		uvc_trace(UVC_TRACE_FRAME, "Frame complete (overflow).\n");
> +		uvc_trace(uvc_urb->stream->dev, UVC_TRACE_FRAME,
> +			  "Frame complete (overflow).\n");
>  		buf->error = 1;
>  		buf->state = UVC_BUF_STATE_READY;
>  	}
> @@ -1161,9 +1161,11 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
>  {
>  	/* Mark the buffer as done if the EOF marker is set. */
>  	if (data[1] & UVC_STREAM_EOF && buf->bytesused != 0) {
> -		uvc_trace(UVC_TRACE_FRAME, "Frame complete (EOF found).\n");
> +		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +			  "Frame complete (EOF found).\n");
>  		if (data[0] == len)
> -			uvc_trace(UVC_TRACE_FRAME, "EOF in empty payload.\n");
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "EOF in empty payload.\n");
>  		buf->state = UVC_BUF_STATE_READY;
>  		if (stream->dev->quirks & UVC_QUIRK_STREAM_NO_FID)
>  			stream->last_fid ^= UVC_STREAM_FID;
> @@ -1279,7 +1281,7 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	memcpy(&meta->length, mem, length);
>  	meta_buf->bytesused += length + sizeof(meta->ns) + sizeof(meta->sof);
>  
> -	uvc_trace(UVC_TRACE_FRAME,
> +	uvc_trace(stream->dev, UVC_TRACE_FRAME,
>  		  "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
>  		  __func__, ktime_to_ns(time), meta->sof, meta->length,
>  		  meta->flags,
> @@ -1339,8 +1341,9 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
>  
>  	for (i = 0; i < urb->number_of_packets; ++i) {
>  		if (urb->iso_frame_desc[i].status < 0) {
> -			uvc_trace(UVC_TRACE_FRAME, "USB isochronous frame "
> -				"lost (%d).\n", urb->iso_frame_desc[i].status);
> +			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> +				  "USB isochronous frame lost (%d).\n",
> +				  urb->iso_frame_desc[i].status);
>  			/* Mark the buffer as faulty. */
>  			if (buf != NULL)
>  				buf->error = 1;
> @@ -1628,15 +1631,16 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  		}
>  
>  		if (i == UVC_URBS) {
> -			uvc_trace(UVC_TRACE_VIDEO, "Allocated %u URB buffers "
> -				"of %ux%u bytes each.\n", UVC_URBS, npackets,
> -				psize);
> +			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +				  "Allocated %u URB buffers of %ux%u bytes each.\n",
> +				  UVC_URBS, npackets, psize);
>  			return npackets;
>  		}
>  	}
>  
> -	uvc_trace(UVC_TRACE_VIDEO, "Failed to allocate URB buffers (%u bytes "
> -		"per packet).\n", psize);
> +	uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +		  "Failed to allocate URB buffers (%u bytes per packet).\n",
> +		  psize);
>  	return 0;
>  }
>  
> @@ -1835,12 +1839,13 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  		bandwidth = stream->ctrl.dwMaxPayloadTransferSize;
>  
>  		if (bandwidth == 0) {
> -			uvc_trace(UVC_TRACE_VIDEO, "Device requested null "
> -				"bandwidth, defaulting to lowest.\n");
> +			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +				  "Device requested null bandwidth, defaulting to lowest.\n");
>  			bandwidth = 1;
>  		} else {
> -			uvc_trace(UVC_TRACE_VIDEO, "Device requested %u "
> -				"B/frame bandwidth.\n", bandwidth);
> +			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +				  "Device requested %u B/frame bandwidth.\n",
> +				  bandwidth);
>  		}
>  
>  		for (i = 0; i < intf->num_altsetting; ++i) {
> @@ -1863,13 +1868,14 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  		}
>  
>  		if (best_ep == NULL) {
> -			uvc_trace(UVC_TRACE_VIDEO, "No fast enough alt setting "
> -				"for requested bandwidth.\n");
> +			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +				  "No fast enough alt setting for requested bandwidth.\n");
>  			return -EIO;
>  		}
>  
> -		uvc_trace(UVC_TRACE_VIDEO, "Selecting alternate setting %u "
> -			"(%u B/frame bandwidth).\n", altsetting, best_psize);
> +		uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> +			  "Selecting alternate setting %u (%u B/frame bandwidth).\n",
> +			  altsetting, best_psize);
>  
>  		ret = usb_set_interface(stream->dev->udev, intfnum, altsetting);
>  		if (ret < 0)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 4a7d1fb76eee..60626feeee27 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -757,10 +757,11 @@ extern unsigned int uvc_trace_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
>  
> -#define uvc_trace(flag, fmt, ...)					\
> +#define uvc_trace(_dev, flag, fmt, ...)					\
>  do {									\
>  	if (uvc_trace_param & flag)					\
> -		printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);	\
> +		dev_printk(KERN_DEBUG, &(_dev)->udev->dev, fmt,		\
> +			   ##__VA_ARGS__);				\
>  } while (0)
>  
>  #define uvc_trace_cont(flag, fmt, ...)					\
> @@ -822,6 +823,12 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>  	return vb2_is_streaming(&queue->queue);
>  }
>  
> +static inline struct uvc_streaming *
> +uvc_queue_to_stream(struct uvc_video_queue *queue)
> +{
> +	return container_of(queue, struct uvc_streaming, queue);
> +}
> +
>  /* V4L2 interface */
>  extern const struct v4l2_ioctl_ops uvc_ioctl_ops;
>  extern const struct v4l2_file_operations uvc_fops;

-- 
Regards,

Laurent Pinchart
