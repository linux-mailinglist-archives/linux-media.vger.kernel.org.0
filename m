Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01BB305BF9
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313121AbhAZWxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390945AbhAZRUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 12:20:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D254C061355;
        Tue, 26 Jan 2021 09:05:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D22F2E0;
        Tue, 26 Jan 2021 18:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611680733;
        bh=mCFc7GavLMV5v+nKYPKTxiYvNzBVWOYx4hX9eCBFAWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BvTLsAstyr7neMaaJnT9JqawdswzhJ+MXV2k36jqRYCMMXE0Xx3HxyQuNpVFARNub
         kAQ21SB/SZYBt2DQJV7hqe3u3D1jW9SF50SfUvwi4Trzf/AUy3UkEV96iLj7IYnpyA
         HeXODq24Setyj3x3dBZmQB98bey1gDJazHN7tIPU=
Date:   Tue, 26 Jan 2021 19:05:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v7 11/12] media: uvcvideo: Rename debug functions
Message-ID: <YBBLyYfqU0ozHYHj@pendragon.ideasonboard.com>
References: <20201223133528.55014-1-ribalda@chromium.org>
 <20201223133528.55014-12-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201223133528.55014-12-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo and Joe,

Thank you for the patch.

On Wed, Dec 23, 2020 at 02:35:27PM +0100, Ricardo Ribalda wrote:
> From: Joe Perches <joe@perches.com>
> 
> trace isn't a good name as it's not a trace mechanism, it is a
> typical debug mechanism.
> 
> Rename uvc_trace/uvc_trace_cont macros to uvc_dbg/uvc_dbg_cont.
> Rename uvc_trace_param to uvc_dbg_param
> Rename UVC_TRACE_<FOO> defines to UVC_DBG_<FOO>
> Use ## concatenation in uvc_dbg macros to avoid overly long and
> repetitive UVC_DBG uses
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  81 ++++---
>  drivers/media/usb/uvc/uvc_driver.c | 343 ++++++++++++++---------------
>  drivers/media/usb/uvc/uvc_isight.c |  17 +-
>  drivers/media/usb/uvc/uvc_queue.c  |   4 +-
>  drivers/media/usb/uvc/uvc_status.c |  29 ++-
>  drivers/media/usb/uvc/uvc_v4l2.c   |  55 ++---
>  drivers/media/usb/uvc/uvc_video.c  | 120 +++++-----
>  drivers/media/usb/uvc/uvcvideo.h   |  34 +--
>  8 files changed, 331 insertions(+), 352 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index befaeb90e569..b3dde98499f4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -906,8 +906,8 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  	}
>  
>  	if (ctrl == NULL && !next)
> -		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> -			  "Control 0x%08x not found.\n", v4l2_id);
> +		uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n",
> +			v4l2_id);
>  
>  	return ctrl;
>  }
> @@ -1800,9 +1800,9 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  	ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
>  			     info->selector, data, 2);
>  	if (ret < 0) {
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "GET_LEN failed on control %pUl/%u (%d).\n",
> -			  info->entity, info->selector, ret);
> +		uvc_dbg(dev, CONTROL,
> +			"GET_LEN failed on control %pUl/%u (%d)\n",
> +			info->entity, info->selector, ret);
>  		goto done;
>  	}
>  
> @@ -1813,20 +1813,20 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  
>  	ret = uvc_ctrl_get_flags(dev, ctrl, info);
>  	if (ret < 0) {
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "Failed to get flags for control %pUl/%u (%d).\n",
> -			  info->entity, info->selector, ret);
> +		uvc_dbg(dev, CONTROL,
> +			"Failed to get flags for control %pUl/%u (%d)\n",
> +			info->entity, info->selector, ret);
>  		goto done;
>  	}
>  
>  	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
>  
> -	uvc_trace(dev, UVC_TRACE_CONTROL,
> -		  "XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }.\n",
> -		  info->entity, info->selector, info->size,
> -		  (info->flags & UVC_CTRL_FLAG_GET_CUR) ? 1 : 0,
> -		  (info->flags & UVC_CTRL_FLAG_SET_CUR) ? 1 : 0,
> -		  (info->flags & UVC_CTRL_FLAG_AUTO_UPDATE) ? 1 : 0);
> +	uvc_dbg(dev, CONTROL,
> +		"XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
> +		info->entity, info->selector, info->size,
> +		(info->flags & UVC_CTRL_FLAG_GET_CUR) ? 1 : 0,
> +		(info->flags & UVC_CTRL_FLAG_SET_CUR) ? 1 : 0,
> +		(info->flags & UVC_CTRL_FLAG_AUTO_UPDATE) ? 1 : 0);
>  
>  done:
>  	kfree(data);
> @@ -1851,10 +1851,10 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  
>  	ret = uvc_ctrl_add_info(dev, ctrl, &info);
>  	if (ret < 0)
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "Failed to initialize control %pUl/%u on device %s entity %u\n",
> -			  info.entity, info.selector, dev->udev->devpath,
> -			  ctrl->entity->id);
> +		uvc_dbg(dev, CONTROL,
> +			"Failed to initialize control %pUl/%u on device %s entity %u\n",
> +			info.entity, info.selector, dev->udev->devpath,
> +			ctrl->entity->id);
>  
>  	return ret;
>  }
> @@ -1882,8 +1882,8 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	}
>  
>  	if (!found) {
> -		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> -			  "Extension unit %u not found.\n", xqry->unit);
> +		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
> +			xqry->unit);
>  		return -ENOENT;
>  	}
>  
> @@ -1898,9 +1898,8 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	}
>  
>  	if (!found) {
> -		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> -			  "Control %pUl/%u not found.\n", entity->guid,
> -			  xqry->selector);
> +		uvc_dbg(chain->dev, CONTROL, "Control %pUl/%u not found\n",
> +			entity->guid, xqry->selector);
>  		return -ENOENT;
>  	}
>  
> @@ -2048,10 +2047,9 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  
>  	ctrl->initialized = 1;
>  
> -	uvc_trace(dev, UVC_TRACE_CONTROL,
> -		  "Added control %pUl/%u to device %s entity %u\n",
> -		  ctrl->info.entity, ctrl->info.selector, dev->udev->devpath,
> -		  ctrl->entity->id);
> +	uvc_dbg(dev, CONTROL, "Added control %pUl/%u to device %s entity %u\n",
> +		ctrl->info.entity, ctrl->info.selector, dev->udev->devpath,
> +		ctrl->entity->id);
>  
>  	return 0;
>  }
> @@ -2088,9 +2086,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>  		map->set = uvc_set_le_value;
>  
>  	list_add_tail(&map->list, &ctrl->info.mappings);
> -	uvc_trace(dev, UVC_TRACE_CONTROL,
> -		  "Adding mapping '%s' to control %pUl/%u.\n",
> -		  map->name, ctrl->info.entity, ctrl->info.selector);
> +	uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> +		map->name, ctrl->info.entity, ctrl->info.selector);
>  
>  	return 0;
>  }
> @@ -2106,9 +2103,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	if (mapping->id & ~V4L2_CTRL_ID_MASK) {
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "Can't add mapping '%s', control id 0x%08x is invalid.\n",
> -			  mapping->name, mapping->id);
> +		uvc_dbg(dev, CONTROL,
> +			"Can't add mapping '%s', control id 0x%08x is invalid\n",
> +			mapping->name, mapping->id);
>  		return -EINVAL;
>  	}
>  
> @@ -2153,9 +2150,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  
>  	list_for_each_entry(map, &ctrl->info.mappings, list) {
>  		if (mapping->id == map->id) {
> -			uvc_trace(dev, UVC_TRACE_CONTROL,
> -				  "Can't add mapping '%s', control id 0x%08x already exists.\n",
> -				  mapping->name, mapping->id);
> +			uvc_dbg(dev, CONTROL,
> +				"Can't add mapping '%s', control id 0x%08x already exists\n",
> +				mapping->name, mapping->id);
>  			ret = -EEXIST;
>  			goto done;
>  		}
> @@ -2164,9 +2161,9 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	/* Prevent excess memory consumption */
>  	if (atomic_inc_return(&dev->nmappings) > UVC_MAX_CONTROL_MAPPINGS) {
>  		atomic_dec(&dev->nmappings);
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "Can't add mapping '%s', maximum mappings count (%u) exceeded.\n",
> -			  mapping->name, UVC_MAX_CONTROL_MAPPINGS);
> +		uvc_dbg(dev, CONTROL,
> +			"Can't add mapping '%s', maximum mappings count (%u) exceeded\n",
> +			mapping->name, UVC_MAX_CONTROL_MAPPINGS);
>  		ret = -ENOMEM;
>  		goto done;
>  	}
> @@ -2235,9 +2232,9 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>  		    !uvc_test_bit(controls, blacklist[i].index))
>  			continue;
>  
> -		uvc_trace(dev, UVC_TRACE_CONTROL,
> -			  "%u/%u control is black listed, removing it.\n",
> -			  entity->id, blacklist[i].index);
> +		uvc_dbg(dev, CONTROL,
> +			"%u/%u control is black listed, removing it\n",
> +			entity->id, blacklist[i].index);
>  
>  		uvc_clear_bit(controls, blacklist[i].index);
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f4e822b8b962..f1f6b9cfa676 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -32,7 +32,7 @@ unsigned int uvc_clock_param = CLOCK_MONOTONIC;
>  unsigned int uvc_hw_timestamps_param;
>  unsigned int uvc_no_drop_param;
>  static unsigned int uvc_quirks_param = -1;
> -unsigned int uvc_trace_param;
> +unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
>  
>  /* ------------------------------------------------------------------------
> @@ -520,10 +520,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	case UVC_VS_FORMAT_FRAME_BASED:
>  		n = buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED ? 27 : 28;
>  		if (buflen < n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d FORMAT error\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FORMAT error\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -584,10 +584,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  	case UVC_VS_FORMAT_MJPEG:
>  		if (buflen < 11) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d FORMAT error\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FORMAT error\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -600,10 +600,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  	case UVC_VS_FORMAT_DV:
>  		if (buflen < 9) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d FORMAT error\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FORMAT error\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -618,10 +618,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  			strscpy(format->name, "HD-DV", sizeof(format->name));
>  			break;
>  		default:
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d: unknown DV format %u\n",
> -				  dev->udev->devnum,
> -			       alts->desc.bInterfaceNumber, buffer[8]);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d: unknown DV format %u\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber, buffer[8]);
>  			return -EINVAL;
>  		}
>  
> @@ -647,14 +647,14 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	case UVC_VS_FORMAT_STREAM_BASED:
>  		/* Not supported yet. */
>  	default:
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d videostreaming interface %d unsupported format %u\n",
> -			  dev->udev->devnum, alts->desc.bInterfaceNumber,
> -			  buffer[2]);
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d unsupported format %u\n",
> +			dev->udev->devnum, alts->desc.bInterfaceNumber,
> +			buffer[2]);
>  		return -EINVAL;
>  	}
>  
> -	uvc_trace(dev, UVC_TRACE_DESCR, "Found format %s.\n", format->name);
> +	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
>  
>  	buflen -= buffer[0];
>  	buffer += buffer[0];
> @@ -673,10 +673,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		n = n ? n : 3;
>  
>  		if (buflen < 26 + 4*n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d FRAME error\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FRAME error\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -738,10 +738,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  				frame->dwDefaultFrameInterval;
>  		}
>  
> -		uvc_trace(dev, UVC_TRACE_DESCR, "- %ux%u (%u.%u fps)\n",
> -			  frame->wWidth, frame->wHeight,
> -			  10000000 / frame->dwDefaultFrameInterval,
> -			  (100000000 / frame->dwDefaultFrameInterval) % 10);
> +		uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> +			frame->wWidth, frame->wHeight,
> +			10000000 / frame->dwDefaultFrameInterval,
> +			(100000000 / frame->dwDefaultFrameInterval) % 10);
>  
>  		format->nframes++;
>  		buflen -= buffer[0];
> @@ -757,10 +757,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>  	    buffer[2] == UVC_VS_COLORFORMAT) {
>  		if (buflen < 6) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d COLORFORMAT error\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d COLORFORMAT error\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -792,18 +792,18 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass
>  		!= UVC_SC_VIDEOSTREAMING) {
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d interface %d isn't a video streaming interface\n",
> -			  dev->udev->devnum,
> -			  intf->altsetting[0].desc.bInterfaceNumber);
> +		uvc_dbg(dev, DESCR,
> +			"device %d interface %d isn't a video streaming interface\n",
> +			dev->udev->devnum,
> +			intf->altsetting[0].desc.bInterfaceNumber);
>  		return -EINVAL;
>  	}
>  
>  	if (usb_driver_claim_interface(&uvc_driver.driver, intf, dev)) {
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d interface %d is already claimed\n",
> -			  dev->udev->devnum,
> -			  intf->altsetting[0].desc.bInterfaceNumber);
> +		uvc_dbg(dev, DESCR,
> +			"device %d interface %d is already claimed\n",
> +			dev->udev->devnum,
> +			intf->altsetting[0].desc.bInterfaceNumber);
>  		return -EINVAL;
>  	}
>  
> @@ -825,9 +825,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  			if (ep->extralen > 2 &&
>  			    ep->extra[1] == USB_DT_CS_INTERFACE) {
> -				uvc_trace(dev, UVC_TRACE_DESCR,
> -					  "trying extra data from endpoint %u.\n",
> -					  i);
> +				uvc_dbg(dev, DESCR,
> +					"trying extra data from endpoint %u\n",
> +					i);
>  				buffer = alts->endpoint[i].extra;
>  				buflen = alts->endpoint[i].extralen;
>  				break;
> @@ -842,8 +842,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (buflen <= 2) {
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "no class-specific streaming interface descriptors found.\n");
> +		uvc_dbg(dev, DESCR,
> +			"no class-specific streaming interface descriptors found\n");
>  		goto error;
>  	}
>  
> @@ -860,9 +860,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  		break;
>  
>  	default:
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d videostreaming interface %d HEADER descriptor not found.\n",
> -			  dev->udev->devnum, alts->desc.bInterfaceNumber);
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d HEADER descriptor not found\n",
> +			dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -870,9 +870,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	n = buflen >= size ? buffer[size-1] : 0;
>  
>  	if (buflen < size + p*n) {
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d videostreaming interface %d HEADER descriptor is invalid.\n",
> -			  dev->udev->devnum, alts->desc.bInterfaceNumber);
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d HEADER descriptor is invalid\n",
> +			dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -922,10 +922,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  
>  		case UVC_VS_FORMAT_MPEG2TS:
>  		case UVC_VS_FORMAT_STREAM_BASED:
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videostreaming interface %d FORMAT %u is not supported.\n",
> -				  dev->udev->devnum,
> -				  alts->desc.bInterfaceNumber, _buffer[2]);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FORMAT %u is not supported\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber, _buffer[2]);
>  			break;
>  
>  		case UVC_VS_FRAME_UNCOMPRESSED:
> @@ -947,9 +947,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (nformats == 0) {
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d videostreaming interface %d has no supported formats defined.\n",
> -			  dev->udev->devnum, alts->desc.bInterfaceNumber);
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d has no supported formats defined\n",
> +			dev->udev->devnum, alts->desc.bInterfaceNumber);
>  		goto error;
>  	}
>  
> @@ -996,10 +996,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (buflen)
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "device %d videostreaming interface %d has %u bytes of trailing descriptor garbage.\n",
> -			  dev->udev->devnum, alts->desc.bInterfaceNumber,
> -			  buflen);
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d has %u bytes of trailing descriptor garbage\n",
> +			dev->udev->devnum, alts->desc.bInterfaceNumber, buflen);
>  
>  	/* Parse the alternate settings to find the maximum bandwidth. */
>  	for (i = 0; i < intf->num_altsetting; ++i) {
> @@ -1132,9 +1131,9 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  		n = buflen >= 25 + p ? buffer[22+p] : 0;
>  
>  		if (buflen < 25 + p + 2*n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d EXTENSION_UNIT error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d EXTENSION_UNIT error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			break;
>  		}
>  
> @@ -1181,9 +1180,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		n = buflen >= 12 ? buffer[11] : 0;
>  
>  		if (buflen < 12 + n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d HEADER error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d HEADER error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1194,9 +1193,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		for (i = 0; i < n; ++i) {
>  			intf = usb_ifnum_to_if(udev, buffer[12+i]);
>  			if (intf == NULL) {
> -				uvc_trace(dev, UVC_TRACE_DESCR,
> -					  "device %d interface %d doesn't exists\n",
> -					  udev->devnum, i);
> +				uvc_dbg(dev, DESCR,
> +					"device %d interface %d doesn't exists\n",
> +					udev->devnum, i);
>  				continue;
>  			}
>  
> @@ -1206,9 +1205,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  	case UVC_VC_INPUT_TERMINAL:
>  		if (buflen < 8) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d INPUT_TERMINAL error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d INPUT_TERMINAL error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1225,10 +1224,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		 */
>  		type = get_unaligned_le16(&buffer[4]);
>  		if ((type & 0x7f00) == 0 || (type & 0x8000) != 0) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d INPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber,
> -				  buffer[3], type);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d INPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> +				udev->devnum, alts->desc.bInterfaceNumber,
> +				buffer[3], type);
>  			return 0;
>  		}
>  
> @@ -1247,9 +1246,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		}
>  
>  		if (buflen < len + n + p) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d INPUT_TERMINAL error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d INPUT_TERMINAL error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1294,9 +1293,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  	case UVC_VC_OUTPUT_TERMINAL:
>  		if (buflen < 9) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d OUTPUT_TERMINAL error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d OUTPUT_TERMINAL error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1305,10 +1304,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		 */
>  		type = get_unaligned_le16(&buffer[4]);
>  		if ((type & 0xff00) == 0) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d OUTPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber,
> -				  buffer[3], type);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d OUTPUT_TERMINAL %d has invalid type 0x%04x, skipping\n",
> +				udev->devnum, alts->desc.bInterfaceNumber,
> +				buffer[3], type);
>  			return 0;
>  		}
>  
> @@ -1332,9 +1331,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		p = buflen >= 5 ? buffer[4] : 0;
>  
>  		if (buflen < 5 || buflen < 6 + p) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d SELECTOR_UNIT error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d SELECTOR_UNIT error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1358,9 +1357,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		p = dev->uvc_version >= 0x0110 ? 10 : 9;
>  
>  		if (buflen < p + n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d PROCESSING_UNIT error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1391,9 +1390,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		n = buflen >= 24 + p ? buffer[22+p] : 0;
>  
>  		if (buflen < 24 + p + n) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "device %d videocontrol interface %d EXTENSION_UNIT error\n",
> -				  udev->devnum, alts->desc.bInterfaceNumber);
> +			uvc_dbg(dev, DESCR,
> +				"device %d videocontrol interface %d EXTENSION_UNIT error\n",
> +				udev->devnum, alts->desc.bInterfaceNumber);
>  			return -EINVAL;
>  		}
>  
> @@ -1418,9 +1417,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		break;
>  
>  	default:
> -		uvc_trace(dev, UVC_TRACE_DESCR,
> -			  "Found an unknown CS_INTERFACE descriptor (%u)\n",
> -			  buffer[2]);
> +		uvc_dbg(dev, DESCR,
> +			"Found an unknown CS_INTERFACE descriptor (%u)\n",
> +			buffer[2]);
>  		break;
>  	}
>  
> @@ -1465,9 +1464,9 @@ static int uvc_parse_control(struct uvc_device *dev)
>  		if (usb_endpoint_is_int_in(desc) &&
>  		    le16_to_cpu(desc->wMaxPacketSize) >= 8 &&
>  		    desc->bInterval != 0) {
> -			uvc_trace(dev, UVC_TRACE_DESCR,
> -				  "Found a Status endpoint (addr %02x).\n",
> -				  desc->bEndpointAddress);
> +			uvc_dbg(dev, DESCR,
> +				"Found a Status endpoint (addr %02x)\n",
> +				desc->bEndpointAddress);
>  			dev->int_ep = ep;
>  		}
>  	}
> @@ -1612,23 +1611,23 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  {
>  	switch (UVC_ENTITY_TYPE(entity)) {
>  	case UVC_VC_EXTENSION_UNIT:
> -		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
> +		uvc_dbg_cont(PROBE, " <- XU %d", entity->id);
>  
>  		if (entity->bNrInPins != 1) {
> -			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -				  "Extension unit %d has more than 1 input pin.\n",
> -				  entity->id);
> +			uvc_dbg(chain->dev, DESCR,
> +				"Extension unit %d has more than 1 input pin\n",
> +				entity->id);
>  			return -1;
>  		}
>  
>  		break;
>  
>  	case UVC_VC_PROCESSING_UNIT:
> -		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
> +		uvc_dbg_cont(PROBE, " <- PU %d", entity->id);
>  
>  		if (chain->processing != NULL) {
> -			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -				  "Found multiple Processing Units in chain.\n");
> +			uvc_dbg(chain->dev, DESCR,
> +				"Found multiple Processing Units in chain\n");
>  			return -1;
>  		}
>  
> @@ -1636,15 +1635,15 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  		break;
>  
>  	case UVC_VC_SELECTOR_UNIT:
> -		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
> +		uvc_dbg_cont(PROBE, " <- SU %d", entity->id);
>  
>  		/* Single-input selector units are ignored. */
>  		if (entity->bNrInPins == 1)
>  			break;
>  
>  		if (chain->selector != NULL) {
> -			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -				  "Found multiple Selector Units in chain.\n");
> +			uvc_dbg(chain->dev, DESCR,
> +				"Found multiple Selector Units in chain\n");
>  			return -1;
>  		}
>  
> @@ -1654,29 +1653,29 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
>  	case UVC_ITT_VENDOR_SPECIFIC:
>  	case UVC_ITT_CAMERA:
>  	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> -		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
> +		uvc_dbg_cont(PROBE, " <- IT %d\n", entity->id);
>  
>  		break;
>  
>  	case UVC_OTT_VENDOR_SPECIFIC:
>  	case UVC_OTT_DISPLAY:
>  	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
> -		uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
> +		uvc_dbg_cont(PROBE, " OT %d", entity->id);
>  
>  		break;
>  
>  	case UVC_TT_STREAMING:
>  		if (UVC_ENTITY_IS_ITERM(entity))
> -			uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
> +			uvc_dbg_cont(PROBE, " <- IT %d\n", entity->id);
>  		else
> -			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
> +			uvc_dbg_cont(PROBE, " OT %d", entity->id);
>  
>  		break;
>  
>  	default:
> -		uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -			  "Unsupported entity type 0x%04x found in chain.\n",
> -			  UVC_ENTITY_TYPE(entity));
> +		uvc_dbg(chain->dev, DESCR,
> +			"Unsupported entity type 0x%04x found in chain\n",
> +			UVC_ENTITY_TYPE(entity));
>  		return -1;
>  	}
>  
> @@ -1702,26 +1701,26 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  		if (forward == prev)
>  			continue;
>  		if (forward->chain.next || forward->chain.prev) {
> -			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -				  "Found reference to entity %d already in chain.\n",
> -				  forward->id);
> +			uvc_dbg(chain->dev, DESCR,
> +				"Found reference to entity %d already in chain\n",
> +				forward->id);
>  			return -EINVAL;
>  		}
>  
>  		switch (UVC_ENTITY_TYPE(forward)) {
>  		case UVC_VC_EXTENSION_UNIT:
>  			if (forward->bNrInPins != 1) {
> -				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -					  "Extension unit %d has more than 1 input pin.\n",
> -					  entity->id);
> +				uvc_dbg(chain->dev, DESCR,
> +					"Extension unit %d has more than 1 input pin\n",
> +					entity->id);
>  				return -EINVAL;
>  			}
>  
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (!found)
> -				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
> +				uvc_dbg_cont(PROBE, " (->");
>  
> -			uvc_trace_cont(UVC_TRACE_PROBE, " XU %d", forward->id);
> +			uvc_dbg_cont(PROBE, " XU %d", forward->id);
>  			found = 1;
>  			break;
>  
> @@ -1730,23 +1729,23 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>  		case UVC_TT_STREAMING:
>  			if (UVC_ENTITY_IS_ITERM(forward)) {
> -				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -					  "Unsupported input terminal %u.\n",
> -					  forward->id);
> +				uvc_dbg(chain->dev, DESCR,
> +					"Unsupported input terminal %u\n",
> +					forward->id);
>  				return -EINVAL;
>  			}
>  
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (!found)
> -				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
> +				uvc_dbg_cont(PROBE, " (->");
>  
> -			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", forward->id);
> +			uvc_dbg_cont(PROBE, " OT %d", forward->id);
>  			found = 1;
>  			break;
>  		}
>  	}
>  	if (found)
> -		uvc_trace_cont(UVC_TRACE_PROBE, ")");
> +		uvc_dbg_cont(PROBE, ")");
>  
>  	return 0;
>  }
> @@ -1771,33 +1770,33 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  			break;
>  		}
>  
> -		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
> +		uvc_dbg_cont(PROBE, " <- IT");
>  
>  		chain->selector = entity;
>  		for (i = 0; i < entity->bNrInPins; ++i) {
>  			id = entity->baSourceID[i];
>  			term = uvc_entity_by_id(chain->dev, id);
>  			if (term == NULL || !UVC_ENTITY_IS_ITERM(term)) {
> -				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -					  "Selector unit %d input %d isn't connected to an input terminal\n",
> -					  entity->id, i);
> +				uvc_dbg(chain->dev, DESCR,
> +					"Selector unit %d input %d isn't connected to an input terminal\n",
> +					entity->id, i);
>  				return -1;
>  			}
>  
>  			if (term->chain.next || term->chain.prev) {
> -				uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -					  "Found reference to entity %d already in chain.\n",
> -					  term->id);
> +				uvc_dbg(chain->dev, DESCR,
> +					"Found reference to entity %d already in chain\n",
> +					term->id);
>  				return -EINVAL;
>  			}
>  
> -			uvc_trace_cont(UVC_TRACE_PROBE, " %d", term->id);
> +			uvc_dbg_cont(PROBE, " %d", term->id);
>  
>  			list_add_tail(&term->chain, &chain->entities);
>  			uvc_scan_chain_forward(chain, term, entity);
>  		}
>  
> -		uvc_trace_cont(UVC_TRACE_PROBE, "\n");
> +		uvc_dbg_cont(PROBE, "\n");
>  
>  		id = 0;
>  		break;
> @@ -1820,8 +1819,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
>  
>  	entity = uvc_entity_by_id(chain->dev, id);
>  	if (entity == NULL) {
> -		uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -			  "Found reference to unknown entity %d.\n", id);
> +		uvc_dbg(chain->dev, DESCR,
> +			"Found reference to unknown entity %d\n", id);
>  		return -EINVAL;
>  	}
>  
> @@ -1834,7 +1833,7 @@ static int uvc_scan_chain(struct uvc_video_chain *chain,
>  {
>  	struct uvc_entity *entity, *prev;
>  
> -	uvc_trace(chain->dev, UVC_TRACE_PROBE, "Scanning UVC chain:");
> +	uvc_dbg(chain->dev, PROBE, "Scanning UVC chain:");
>  
>  	entity = term;
>  	prev = NULL;
> @@ -1842,9 +1841,9 @@ static int uvc_scan_chain(struct uvc_video_chain *chain,
>  	while (entity != NULL) {
>  		/* Entity must not be part of an existing chain */
>  		if (entity->chain.next || entity->chain.prev) {
> -			uvc_trace(chain->dev, UVC_TRACE_DESCR,
> -				  "Found reference to entity %d already in chain.\n",
> -				  entity->id);
> +			uvc_dbg(chain->dev, DESCR,
> +				"Found reference to entity %d already in chain\n",
> +				entity->id);
>  			return -EINVAL;
>  		}
>  
> @@ -1998,9 +1997,8 @@ static int uvc_scan_fallback(struct uvc_device *dev)
>  
>  	list_add_tail(&chain->list, &dev->chains);
>  
> -	uvc_trace(dev, UVC_TRACE_PROBE,
> -		  "Found a video chain by fallback heuristic (%s).\n",
> -		  uvc_print_chain(chain));
> +	uvc_dbg(dev, PROBE, "Found a video chain by fallback heuristic (%s)\n",
> +		uvc_print_chain(chain));
>  
>  	return 0;
>  
> @@ -2042,9 +2040,8 @@ static int uvc_scan_device(struct uvc_device *dev)
>  			continue;
>  		}
>  
> -		uvc_trace(dev, UVC_TRACE_PROBE,
> -			  "Found a valid video chain (%s).\n",
> -			  uvc_print_chain(chain));
> +		uvc_dbg(dev, PROBE, "Found a valid video chain (%s)\n",
> +			uvc_print_chain(chain));
>  
>  		list_add_tail(&chain->list, &dev->chains);
>  	}
> @@ -2344,12 +2341,11 @@ static int uvc_probe(struct usb_interface *intf,
>  		    ? dev->info->quirks : uvc_quirks_param;
>  
>  	if (id->idVendor && id->idProduct)
> -		uvc_trace(dev, UVC_TRACE_PROBE,
> -			  "Probing known UVC device %s (%04x:%04x)\n",
> -			  udev->devpath, id->idVendor, id->idProduct);
> +		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
> +			udev->devpath, id->idVendor, id->idProduct);
>  	else
> -		uvc_trace(dev, UVC_TRACE_PROBE,
> -			  "Probing generic UVC device %s\n", udev->devpath);
> +		uvc_dbg(dev, PROBE, "Probing generic UVC device %s\n",
> +			udev->devpath);
>  
>  	if (udev->product != NULL)
>  		strscpy(dev->name, udev->product, sizeof(dev->name));
> @@ -2393,14 +2389,13 @@ static int uvc_probe(struct usb_interface *intf,
>  
>  	/* Parse the Video Class control descriptor. */
>  	if (uvc_parse_control(dev) < 0) {
> -		uvc_trace(dev, UVC_TRACE_PROBE,
> -			  "Unable to parse UVC descriptors.\n");
> +		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>  		goto error;
>  	}
>  
>  	/* Parse the associated GPIOs. */
>  	if (uvc_gpio_parse(dev) < 0) {
> -		uvc_trace(dev, UVC_TRACE_PROBE, "Unable to parse UVC GPIOs\n");
> +		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
>  		goto error;
>  	}
>  
> @@ -2456,7 +2451,7 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  	}
>  
> -	uvc_trace(dev, UVC_TRACE_PROBE, "UVC device initialized.\n");
> +	uvc_dbg(dev, PROBE, "UVC device initialized\n");
>  	usb_enable_autosuspend(udev);
>  	return 0;
>  
> @@ -2488,7 +2483,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
>  	struct uvc_device *dev = usb_get_intfdata(intf);
>  	struct uvc_streaming *stream;
>  
> -	uvc_trace(dev, UVC_TRACE_SUSPEND, "Suspending interface %u\n",
> +	uvc_dbg(dev, SUSPEND, "Suspending interface %u\n",
>  		intf->cur_altsetting->desc.bInterfaceNumber);
>  
>  	/* Controls are cached on the fly so they don't need to be saved. */
> @@ -2506,8 +2501,8 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
>  			return uvc_video_suspend(stream);
>  	}
>  
> -	uvc_trace(dev, UVC_TRACE_SUSPEND,
> -		  "Suspend: video streaming USB interface mismatch.\n");
> +	uvc_dbg(dev, SUSPEND,
> +		"Suspend: video streaming USB interface mismatch\n");
>  	return -EINVAL;
>  }
>  
> @@ -2517,8 +2512,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  	struct uvc_streaming *stream;
>  	int ret = 0;
>  
> -	uvc_trace(dev, UVC_TRACE_SUSPEND, "Resuming interface %u\n",
> -		  intf->cur_altsetting->desc.bInterfaceNumber);
> +	uvc_dbg(dev, SUSPEND, "Resuming interface %u\n",
> +		intf->cur_altsetting->desc.bInterfaceNumber);
>  
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass ==
>  	    UVC_SC_VIDEOCONTROL) {
> @@ -2546,8 +2541,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  		}
>  	}
>  
> -	uvc_trace(dev, UVC_TRACE_SUSPEND,
> -		  "Resume: video streaming USB interface mismatch.\n");
> +	uvc_dbg(dev, SUSPEND,
> +		"Resume: video streaming USB interface mismatch\n");
>  	return -EINVAL;
>  }
>  
> @@ -2597,7 +2592,7 @@ module_param_named(nodrop, uvc_no_drop_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
>  module_param_named(quirks, uvc_quirks_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(quirks, "Forced device quirks");
> -module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(trace, uvc_dbg_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(trace, "Trace level bitmask");
>  module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
> index 445c4d39aeff..2578d6ee4829 100644
> --- a/drivers/media/usb/uvc/uvc_isight.c
> +++ b/drivers/media/usb/uvc/uvc_isight.c
> @@ -50,16 +50,15 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  
>  	if ((len >= 14 && memcmp(&data[2], hdr, 12) == 0) ||
>  	    (len >= 15 && memcmp(&data[3], hdr, 12) == 0)) {
> -		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -			  "iSight header found\n");
> +		uvc_dbg(stream->dev, FRAME, "iSight header found\n");
>  		is_header = 1;
>  	}
>  
>  	/* Synchronize to the input stream by waiting for a header packet. */
>  	if (buf->state != UVC_BUF_STATE_ACTIVE) {
>  		if (!is_header) {
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "Dropping packet (out of sync).\n");
> +			uvc_dbg(stream->dev, FRAME,
> +				"Dropping packet (out of sync)\n");
>  			return 0;
>  		}
>  
> @@ -87,8 +86,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  		buf->bytesused += nbytes;
>  
>  		if (len > maxlen || buf->bytesused == buf->length) {
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "Frame complete (overflow).\n");
> +			uvc_dbg(stream->dev, FRAME,
> +				"Frame complete (overflow)\n");
>  			buf->state = UVC_BUF_STATE_DONE;
>  		}
>  	}
> @@ -105,9 +104,9 @@ void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
>  
>  	for (i = 0; i < urb->number_of_packets; ++i) {
>  		if (urb->iso_frame_desc[i].status < 0) {
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "USB isochronous frame lost (%d).\n",
> -				  urb->iso_frame_desc[i].status);
> +			uvc_dbg(stream->dev, FRAME,
> +				"USB isochronous frame lost (%d)\n",
> +				urb->iso_frame_desc[i].status);
>  		}
>  
>  		/* Decode the payload packet.
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 2255daa3e240..21a907d32bb7 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -103,8 +103,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
> -		uvc_trace(uvc_queue_to_stream(queue)->dev, UVC_TRACE_CAPTURE,
> -			  "[E] Bytes used out of bounds.\n");
> +		uvc_dbg(uvc_queue_to_stream(queue)->dev, CAPTURE,
> +			"[E] Bytes used out of bounds\n");
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 69434273d2c5..753c8226db70 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -93,22 +93,21 @@ static void uvc_event_streaming(struct uvc_device *dev,
>  				struct uvc_streaming_status *status, int len)
>  {
>  	if (len < 3) {
> -		uvc_trace(dev, UVC_TRACE_STATUS,
> -			  "Invalid streaming status event received.\n");
> +		uvc_dbg(dev, STATUS,
> +			"Invalid streaming status event received\n");
>  		return;
>  	}
>  
>  	if (status->bEvent == 0) {
>  		if (len < 4)
>  			return;
> -		uvc_trace(dev, UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
> -			  status->bOriginator,
> -			  status->bValue[0] ? "pressed" : "released", len);
> +		uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> +			status->bOriginator,
> +			status->bValue[0] ? "pressed" : "released", len);
>  		uvc_input_report_key(dev, KEY_CAMERA, status->bValue[0]);
>  	} else {
> -		uvc_trace(dev, UVC_TRACE_STATUS,
> -			  "Stream %u error event %02x len %d.\n",
> -			  status->bOriginator, status->bEvent, len);
> +		uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
> +			status->bOriginator, status->bEvent, len);
>  	}
>  }
>  
> @@ -163,14 +162,13 @@ static bool uvc_event_control(struct urb *urb,
>  
>  	if (len < 6 || status->bEvent != 0 ||
>  	    status->bAttribute >= ARRAY_SIZE(attrs)) {
> -		uvc_trace(dev, UVC_TRACE_STATUS,
> -			  "Invalid control status event received.\n");
> +		uvc_dbg(dev, STATUS, "Invalid control status event received\n");
>  		return false;
>  	}
>  
> -	uvc_trace(dev, UVC_TRACE_STATUS, "Control %u/%u %s change len %d.\n",
> -		  status->bOriginator, status->bSelector,
> -		  attrs[status->bAttribute], len);
> +	uvc_dbg(dev, STATUS, "Control %u/%u %s change len %d\n",
> +		status->bOriginator, status->bSelector,
> +		attrs[status->bAttribute], len);
>  
>  	/* Find the control. */
>  	ctrl = uvc_event_find_ctrl(dev, status, &chain);
> @@ -237,9 +235,8 @@ static void uvc_status_complete(struct urb *urb)
>  		}
>  
>  		default:
> -			uvc_trace(dev, UVC_TRACE_STATUS,
> -				  "Unknown status event type %u.\n",
> -				  dev->status[0]);
> +			uvc_dbg(dev, STATUS, "Unknown status event type %u\n",
> +				dev->status[0]);
>  			break;
>  		}
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 3a2d17bc766b..2b8cbb4730e0 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -75,9 +75,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  		break;
>  
>  	default:
> -		uvc_trace(chain->dev, UVC_TRACE_CONTROL,
> -			  "Unsupported V4L2 control type %u.\n",
> -			  xmap->v4l2_type);
> +		uvc_dbg(chain->dev, CONTROL,
> +			"Unsupported V4L2 control type %u\n", xmap->v4l2_type);
>  		ret = -ENOTTY;
>  		goto free_map;
>  	}
> @@ -165,11 +164,10 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  		return -EINVAL;
>  
>  	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
> -	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -		  "Trying format 0x%08x (%c%c%c%c): %ux%u.\n",
> -		  fmt->fmt.pix.pixelformat,
> -		  fcc[0], fcc[1], fcc[2], fcc[3],
> -		  fmt->fmt.pix.width, fmt->fmt.pix.height);
> +	uvc_dbg(stream->dev, FORMAT, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
> +		fmt->fmt.pix.pixelformat,
> +		fcc[0], fcc[1], fcc[2], fcc[3],
> +		fmt->fmt.pix.width, fmt->fmt.pix.height);
>  
>  	/* Check if the hardware supports the requested format, use the default
>  	 * format otherwise.
> @@ -209,18 +207,17 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (frame == NULL) {
> -		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -			  "Unsupported size %ux%u.\n", fmt->fmt.pix.width,
> -			  fmt->fmt.pix.height);
> +		uvc_dbg(stream->dev, FORMAT, "Unsupported size %ux%u\n",
> +			fmt->fmt.pix.width, fmt->fmt.pix.height);
>  		return -EINVAL;
>  	}
>  
>  	/* Use the default frame interval. */
>  	interval = frame->dwDefaultFrameInterval;
> -	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -		  "Using default frame interval %u.%u us (%u.%u fps).\n",
> -		  interval / 10, interval % 10, 10000000 / interval,
> -		 (100000000 / interval) % 10);
> +	uvc_dbg(stream->dev, FORMAT,
> +		"Using default frame interval %u.%u us (%u.%u fps)\n",
> +		interval / 10, interval % 10, 10000000 / interval,
> +		(100000000 / interval) % 10);
>  
>  	/* Set the format index, frame index and frame interval. */
>  	memset(probe, 0, sizeof(*probe));
> @@ -262,9 +259,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (i == stream->nformats) {
> -		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -			  "Unknown bFormatIndex %u\n",
> -			  probe->bFormatIndex);
> +		uvc_dbg(stream->dev, FORMAT, "Unknown bFormatIndex %u\n",
> +			probe->bFormatIndex);
>  		return -EINVAL;
>  	}
>  
> @@ -276,9 +272,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	}
>  
>  	if (i == format->nframes) {
> -		uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -			  "Unknown bFrameIndex %u\n",
> -			  probe->bFrameIndex);
> +		uvc_dbg(stream->dev, FORMAT, "Unknown bFrameIndex %u\n",
> +			probe->bFrameIndex);
>  		return -EINVAL;
>  	}
>  
> @@ -422,9 +417,8 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  
>  	interval = uvc_fraction_to_interval(timeperframe.numerator,
>  		timeperframe.denominator);
> -	uvc_trace(stream->dev, UVC_TRACE_FORMAT,
> -		  "Setting frame interval to %u/%u (%u).\n",
> -		  timeperframe.numerator, timeperframe.denominator, interval);
> +	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
> +		timeperframe.numerator, timeperframe.denominator, interval);
>  
>  	mutex_lock(&stream->mutex);
>  
> @@ -553,7 +547,7 @@ static int uvc_v4l2_open(struct file *file)
>  	int ret = 0;
>  
>  	stream = video_drvdata(file);
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
> +	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
>  	ret = usb_autopm_get_interface(stream->dev->intf);
>  	if (ret < 0)
> @@ -595,7 +589,7 @@ static int uvc_v4l2_release(struct file *file)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
> +	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
>  	/* Only free resources if this is a privileged handle. */
>  	if (uvc_has_privileges(handle))
> @@ -1471,8 +1465,7 @@ static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS,
> -		  "uvc_v4l2_read: not implemented.\n");
> +	uvc_dbg(stream->dev, CALLS, "%s: not implemented\n", __func__);
>  	return -EINVAL;
>  }
>  
> @@ -1481,7 +1474,7 @@ static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
> +	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_mmap(&stream->queue, vma);
>  }
> @@ -1491,7 +1484,7 @@ static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
> +	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_poll(&stream->queue, file, wait);
>  }
> @@ -1504,7 +1497,7 @@ static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_streaming *stream = handle->stream;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CALLS, "%s\n", __func__);
> +	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
>  	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
>  }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 26251ed0c3fd..f2f565281e63 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (ret != 1)
>  		return ret < 0 ? ret : -EPIPE;
>  
> -	uvc_trace(dev, UVC_TRACE_CONTROL, "Control error %u\n", error);
> +	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
>  
>  	switch (error) {
>  	case 0:
> @@ -705,12 +705,12 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	sof = y;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CLOCK,
> -		  "%s: PTS %u y %llu.%06llu SOF %u.%06llu (x1 %u x2 %u y1 %u y2 %u SOF offset %u)\n",
> -		  stream->dev->name, buf->pts,
> -		  y >> 16, div_u64((y & 0xffff) * 1000000, 65536),
> -		  sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> -		  x1, x2, y1, y2, clock->sof_offset);
> +	uvc_dbg(stream->dev, CLOCK,
> +		"%s: PTS %u y %llu.%06llu SOF %u.%06llu (x1 %u x2 %u y1 %u y2 %u SOF offset %u)\n",
> +		stream->dev->name, buf->pts,
> +		y >> 16, div_u64((y & 0xffff) * 1000000, 65536),
> +		sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> +		x1, x2, y1, y2, clock->sof_offset);
>  
>  	/* Second step, SOF to host clock conversion. */
>  	x1 = (uvc_video_clock_host_sof(first) + 2048) << 16;
> @@ -740,13 +740,13 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	timestamp = ktime_to_ns(first->host_time) + y - y1;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_CLOCK,
> -		  "%s: SOF %u.%06llu y %llu ts %llu buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %u)\n",
> -		  stream->dev->name,
> -		  sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> -		  y, timestamp, vbuf->vb2_buf.timestamp,
> -		  x1, first->host_sof, first->dev_sof,
> -		  x2, last->host_sof, last->dev_sof, y1, y2);
> +	uvc_dbg(stream->dev, CLOCK,
> +		"%s: SOF %u.%06llu y %llu ts %llu buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %u)\n",
> +		stream->dev->name,
> +		sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> +		y, timestamp, vbuf->vb2_buf.timestamp,
> +		x1, first->host_sof, first->dev_sof,
> +		x2, last->host_sof, last->dev_sof, y1, y2);
>  
>  	/* Update the V4L2 buffer. */
>  	vbuf->vb2_buf.timestamp = timestamp;
> @@ -875,15 +875,15 @@ static void uvc_video_stats_update(struct uvc_streaming *stream)
>  {
>  	struct uvc_stats_frame *frame = &stream->stats.frame;
>  
> -	uvc_trace(stream->dev, UVC_TRACE_STATS,
> -		  "frame %u stats: %u/%u/%u packets, %u/%u/%u pts (%searly %sinitial), %u/%u scr, last pts/stc/sof %u/%u/%u\n",
> -		  stream->sequence, frame->first_data,
> -		  frame->nb_packets - frame->nb_empty, frame->nb_packets,
> -		  frame->nb_pts_diffs, frame->last_pts_diff, frame->nb_pts,
> -		  frame->has_early_pts ? "" : "!",
> -		  frame->has_initial_pts ? "" : "!",
> -		  frame->nb_scr_diffs, frame->nb_scr,
> -		  frame->pts, frame->scr_stc, frame->scr_sof);
> +	uvc_dbg(stream->dev, STATS,
> +		"frame %u stats: %u/%u/%u packets, %u/%u/%u pts (%searly %sinitial), %u/%u scr, last pts/stc/sof %u/%u/%u\n",
> +		stream->sequence, frame->first_data,
> +		frame->nb_packets - frame->nb_empty, frame->nb_packets,
> +		frame->nb_pts_diffs, frame->last_pts_diff, frame->nb_pts,
> +		frame->has_early_pts ? "" : "!",
> +		frame->has_initial_pts ? "" : "!",
> +		frame->nb_scr_diffs, frame->nb_scr,
> +		frame->pts, frame->scr_stc, frame->scr_sof);
>  
>  	stream->stats.stream.nb_frames++;
>  	stream->stats.stream.nb_packets += stream->stats.frame.nb_packets;
> @@ -1038,8 +1038,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  
>  	/* Mark the buffer as bad if the error bit is set. */
>  	if (data[1] & UVC_STREAM_ERR) {
> -		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -			  "Marking buffer as bad (error bit set).\n");
> +		uvc_dbg(stream->dev, FRAME,
> +			"Marking buffer as bad (error bit set)\n");
>  		buf->error = 1;
>  	}
>  
> @@ -1053,8 +1053,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	 */
>  	if (buf->state != UVC_BUF_STATE_ACTIVE) {
>  		if (fid == stream->last_fid) {
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "Dropping payload (out of sync).\n");
> +			uvc_dbg(stream->dev, FRAME,
> +				"Dropping payload (out of sync)\n");
>  			if ((stream->dev->quirks & UVC_QUIRK_STREAM_NO_FID) &&
>  			    (data[1] & UVC_STREAM_EOF))
>  				stream->last_fid ^= UVC_STREAM_FID;
> @@ -1085,8 +1085,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	 * previous payload had the EOF bit set.
>  	 */
>  	if (fid != stream->last_fid && buf->bytesused != 0) {
> -		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -			  "Frame complete (FID bit toggled).\n");
> +		uvc_dbg(stream->dev, FRAME,
> +			"Frame complete (FID bit toggled)\n");
>  		buf->state = UVC_BUF_STATE_READY;
>  		return -EAGAIN;
>  	}
> @@ -1147,8 +1147,8 @@ static void uvc_video_decode_data(struct uvc_urb *uvc_urb,
>  
>  	/* Complete the current frame if the buffer size was exceeded. */
>  	if (len > maxlen) {
> -		uvc_trace(uvc_urb->stream->dev, UVC_TRACE_FRAME,
> -			  "Frame complete (overflow).\n");
> +		uvc_dbg(uvc_urb->stream->dev, FRAME,
> +			"Frame complete (overflow)\n");
>  		buf->error = 1;
>  		buf->state = UVC_BUF_STATE_READY;
>  	}
> @@ -1161,11 +1161,9 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
>  {
>  	/* Mark the buffer as done if the EOF marker is set. */
>  	if (data[1] & UVC_STREAM_EOF && buf->bytesused != 0) {
> -		uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -			  "Frame complete (EOF found).\n");
> +		uvc_dbg(stream->dev, FRAME, "Frame complete (EOF found)\n");
>  		if (data[0] == len)
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "EOF in empty payload.\n");
> +			uvc_dbg(stream->dev, FRAME, "EOF in empty payload\n");
>  		buf->state = UVC_BUF_STATE_READY;
>  		if (stream->dev->quirks & UVC_QUIRK_STREAM_NO_FID)
>  			stream->last_fid ^= UVC_STREAM_FID;
> @@ -1281,13 +1279,13 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	memcpy(&meta->length, mem, length);
>  	meta_buf->bytesused += length + sizeof(meta->ns) + sizeof(meta->sof);
>  
> -	uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -		  "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
> -		  __func__, ktime_to_ns(time), meta->sof, meta->length,
> -		  meta->flags,
> -		  has_pts ? *(u32 *)meta->buf : 0,
> -		  has_scr ? *(u32 *)scr : 0,
> -		  has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
> +	uvc_dbg(stream->dev, FRAME,
> +		"%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
> +		__func__, ktime_to_ns(time), meta->sof, meta->length,
> +		meta->flags,
> +		has_pts ? *(u32 *)meta->buf : 0,
> +		has_scr ? *(u32 *)scr : 0,
> +		has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
>  }
>  
>  /* ------------------------------------------------------------------------
> @@ -1341,9 +1339,9 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
>  
>  	for (i = 0; i < urb->number_of_packets; ++i) {
>  		if (urb->iso_frame_desc[i].status < 0) {
> -			uvc_trace(stream->dev, UVC_TRACE_FRAME,
> -				  "USB isochronous frame lost (%d).\n",
> -				  urb->iso_frame_desc[i].status);
> +			uvc_dbg(stream->dev, FRAME,
> +				"USB isochronous frame lost (%d)\n",
> +				urb->iso_frame_desc[i].status);
>  			/* Mark the buffer as faulty. */
>  			if (buf != NULL)
>  				buf->error = 1;
> @@ -1631,16 +1629,16 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  		}
>  
>  		if (i == UVC_URBS) {
> -			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -				  "Allocated %u URB buffers of %ux%u bytes each.\n",
> -				  UVC_URBS, npackets, psize);
> +			uvc_dbg(stream->dev, VIDEO,
> +				"Allocated %u URB buffers of %ux%u bytes each\n",
> +				UVC_URBS, npackets, psize);
>  			return npackets;
>  		}
>  	}
>  
> -	uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -		  "Failed to allocate URB buffers (%u bytes per packet).\n",
> -		  psize);
> +	uvc_dbg(stream->dev, VIDEO,
> +		"Failed to allocate URB buffers (%u bytes per packet)\n",
> +		psize);
>  	return 0;
>  }
>  
> @@ -1839,13 +1837,13 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  		bandwidth = stream->ctrl.dwMaxPayloadTransferSize;
>  
>  		if (bandwidth == 0) {
> -			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -				  "Device requested null bandwidth, defaulting to lowest.\n");
> +			uvc_dbg(stream->dev, VIDEO,
> +				"Device requested null bandwidth, defaulting to lowest\n");
>  			bandwidth = 1;
>  		} else {
> -			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -				  "Device requested %u B/frame bandwidth.\n",
> -				  bandwidth);
> +			uvc_dbg(stream->dev, VIDEO,
> +				"Device requested %u B/frame bandwidth\n",
> +				bandwidth);
>  		}
>  
>  		for (i = 0; i < intf->num_altsetting; ++i) {
> @@ -1868,14 +1866,14 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  		}
>  
>  		if (best_ep == NULL) {
> -			uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -				  "No fast enough alt setting for requested bandwidth.\n");
> +			uvc_dbg(stream->dev, VIDEO,
> +				"No fast enough alt setting for requested bandwidth\n");
>  			return -EIO;
>  		}
>  
> -		uvc_trace(stream->dev, UVC_TRACE_VIDEO,
> -			  "Selecting alternate setting %u (%u B/frame bandwidth).\n",
> -			  altsetting, best_psize);
> +		uvc_dbg(stream->dev, VIDEO,
> +			"Selecting alternate setting %u (%u B/frame bandwidth)\n",
> +			altsetting, best_psize);
>  
>  		ret = usb_set_interface(stream->dev->udev, intfnum, altsetting);
>  		if (ret < 0)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c93295d6d6e9..3273d03aca9a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -728,18 +728,18 @@ struct uvc_driver {
>   * Debugging, printing and logging
>   */
>  
> -#define UVC_TRACE_PROBE		(1 << 0)
> -#define UVC_TRACE_DESCR		(1 << 1)
> -#define UVC_TRACE_CONTROL	(1 << 2)
> -#define UVC_TRACE_FORMAT	(1 << 3)
> -#define UVC_TRACE_CAPTURE	(1 << 4)
> -#define UVC_TRACE_CALLS		(1 << 5)
> -#define UVC_TRACE_FRAME		(1 << 7)
> -#define UVC_TRACE_SUSPEND	(1 << 8)
> -#define UVC_TRACE_STATUS	(1 << 9)
> -#define UVC_TRACE_VIDEO		(1 << 10)
> -#define UVC_TRACE_STATS		(1 << 11)
> -#define UVC_TRACE_CLOCK		(1 << 12)
> +#define UVC_DBG_PROBE		(1 << 0)
> +#define UVC_DBG_DESCR		(1 << 1)
> +#define UVC_DBG_CONTROL		(1 << 2)
> +#define UVC_DBG_FORMAT		(1 << 3)
> +#define UVC_DBG_CAPTURE		(1 << 4)
> +#define UVC_DBG_CALLS		(1 << 5)
> +#define UVC_DBG_FRAME		(1 << 7)
> +#define UVC_DBG_SUSPEND		(1 << 8)
> +#define UVC_DBG_STATUS		(1 << 9)
> +#define UVC_DBG_VIDEO		(1 << 10)
> +#define UVC_DBG_STATS		(1 << 11)
> +#define UVC_DBG_CLOCK		(1 << 12)
>  
>  #define UVC_WARN_MINMAX		0
>  #define UVC_WARN_PROBE_DEF	1
> @@ -747,20 +747,20 @@ struct uvc_driver {
>  
>  extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_no_drop_param;
> -extern unsigned int uvc_trace_param;
> +extern unsigned int uvc_dbg_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
>  
> -#define uvc_trace(_dev, flag, fmt, ...)					\
> +#define uvc_dbg(_dev, flag, fmt, ...)					\
>  do {									\
> -	if (uvc_trace_param & flag)					\
> +	if (uvc_dbg_param & UVC_DBG_##flag)				\
>  		dev_printk(KERN_DEBUG, &(_dev)->udev->dev, fmt,		\
>  			   ##__VA_ARGS__);				\
>  } while (0)
>  
> -#define uvc_trace_cont(flag, fmt, ...)					\
> +#define uvc_dbg_cont(flag, fmt, ...)					\
>  do {									\
> -	if (uvc_trace_param & flag)					\
> +	if (uvc_dbg_param & UVC_DBG_##flag)				\
>  		pr_cont(fmt, ##__VA_ARGS__);				\
>  } while (0)
>  

-- 
Regards,

Laurent Pinchart
