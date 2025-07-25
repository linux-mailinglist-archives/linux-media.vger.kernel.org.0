Return-Path: <linux-media+bounces-38458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DCB11D73
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D45AE1C3D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7232E62BF;
	Fri, 25 Jul 2025 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kd5kCC5P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D42114;
	Fri, 25 Jul 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753442716; cv=none; b=bgdySAoXwP3SVfrtrsPeaAitQ7jaE9goU7Iw9CbPqeuMcbQifrRKWnUe8BdF5Sj7ikyhPYLFQAN4NTz5Df9L5vDEANWzNzOPj/kyY2d3aew3Pke1f80txh4FzbY4zfxWgcvQTO7pEpitBXKBdY3wOso7kVd1ccd7n4ykZPQI/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753442716; c=relaxed/simple;
	bh=xK8VrbF+4LF2Q85upYmd+Dntemjwt+k0q3JOPp/Lgrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN0xAqHRRxo1wWs9vcrXJownq0y5dxAfxuHnwtOteybTZKP00T41SOXFaNLxHSAEWzjasOd7mqxwaPtyzQEtM1k0GOA8eH0gul4Au6EiiDX3jP3/3pawKH0CfKazsmrN2jswb0zyJ2Z+YazPsFDLImfQRTKRI1gOgpeLov9dLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kd5kCC5P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AE9C2C64;
	Fri, 25 Jul 2025 13:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753442673;
	bh=xK8VrbF+4LF2Q85upYmd+Dntemjwt+k0q3JOPp/Lgrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kd5kCC5P/JdBCUc9qQoziKztUKIE1ZR+k6k/NBPlkH89MW0ee1ZVrNsZLV+szLkzz
	 iG4qJzTxp+UI5lJvB5x3wmN4nOKR+sfA0mOUupsT2MqnV17NYOl8R5G6e6+XFRME42
	 ib0XG/KArWOKuBuvXBpr1B+Myo6wmV19sJ3JivjY=
Date: Fri, 25 Jul 2025 14:25:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Use intf instead of udev for printks
Message-ID: <20250725112508.GB11202@pendragon.ideasonboard.com>
References: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
 <20250725-uvc-nousbdev-v1-1-28f5a1fdf544@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725-uvc-nousbdev-v1-1-28f5a1fdf544@chromium.org>

Hi Ricardo,

On Fri, Jul 25, 2025 at 11:01:29AM +0000, Ricardo Ribalda wrote:
> The UVC driver is a usb_interface driver. Use the correct device for
> printks to avoid confusions with other interface drivers associated to
> the same usb device.

Good idea.

> With this change:
> uvcvideo 3-6:1.0: Found UVC 1.10 device USB2.0 WebCam (1234:abcd)
> 
> Without this change:
> usb 3-6: Found UVC 1.10 device USB2.0 WebCam (1234:abcd)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 10 +++++-----
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++----------
>  drivers/media/usb/uvc/uvc_entity.c |  4 ++--
>  drivers/media/usb/uvc/uvc_status.c |  4 ++--
>  drivers/media/usb/uvc/uvc_video.c  |  6 +++---
>  drivers/media/usb/uvc/uvcvideo.h   |  4 ++--
>  6 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index efe609d7087752cb2ef516eef0fce12acd13e747..669caec2a3c448b8b2b7e03cd2a03a840aba3e92 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1619,7 +1619,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		}
>  
>  		if (ret == -EIO) {
> -			dev_warn_ratelimited(&chain->dev->udev->dev,
> +			dev_warn_ratelimited(&chain->dev->intf->dev,
>  					     "UVC non compliance: Error %d querying master control %x (%s)\n",
>  					     ret, master_map->id,
>  					     uvc_map_get_name(master_map));
> @@ -1643,7 +1643,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  
>  	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
>  	if (ret && !mapping->disabled) {
> -		dev_warn(&chain->dev->udev->dev,
> +		dev_warn(&chain->dev->intf->dev,
>  			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
>  			 mapping->id, uvc_map_get_name(mapping), ret);
>  		mapping->disabled = true;
> @@ -1858,7 +1858,7 @@ static int uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
>  	lockdep_assert_held(&handle->chain->ctrl_mutex);
>  
>  	if (ctrl->handle) {
> -		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> +		dev_warn_ratelimited(&handle->stream->dev->intf->dev,
>  				     "UVC non compliance: Setting an async control with a pending operation.");
>  
>  		if (ctrl->handle == handle)
> @@ -1956,7 +1956,7 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  	w->urb->interval = dev->int_ep->desc.bInterval;
>  	ret = usb_submit_urb(w->urb, GFP_KERNEL);
>  	if (ret < 0)
> -		dev_err(&dev->udev->dev,
> +		dev_err(&dev->intf->dev,
>  			"Failed to resubmit status URB (%d).\n", ret);
>  }
>  
> @@ -2895,7 +2895,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			if (!ctrl->initialized || !ctrl->modified ||
>  			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
>  				continue;
> -			dev_dbg(&dev->udev->dev,
> +			dev_dbg(&dev->intf->dev,
>  				"restoring control %pUl/%u/%u\n",
>  				ctrl->info.entity, ctrl->info.index,
>  				ctrl->info.selector);
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 775bede0d93d9b3e5391914aa395326d3de6a3b1..d09d1286da0f61d5953125df23ed92555585e8f2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1868,7 +1868,7 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		uvc_scan_fallback(dev);
>  
>  	if (list_empty(&dev->chains)) {
> -		dev_info(&dev->udev->dev, "No valid video chain found.\n");
> +		dev_info(&dev->intf->dev, "No valid video chain found.\n");
>  		return -ENODEV;
>  	}
>  
> @@ -2092,7 +2092,7 @@ static int uvc_register_terms(struct uvc_device *dev,
>  
>  		stream = uvc_stream_by_id(dev, term->id);
>  		if (stream == NULL) {
> -			dev_info(&dev->udev->dev,
> +			dev_info(&dev->intf->dev,
>  				 "No streaming interface found for terminal %u.",
>  				 term->id);
>  			continue;
> @@ -2128,7 +2128,7 @@ static int uvc_register_chains(struct uvc_device *dev)
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  		ret = uvc_mc_register_entities(chain);
>  		if (ret < 0)
> -			dev_info(&dev->udev->dev,
> +			dev_info(&dev->intf->dev,
>  				 "Failed to register entities (%d).\n", ret);
>  #endif
>  	}
> @@ -2229,23 +2229,23 @@ static int uvc_probe(struct usb_interface *intf,
>  	if (ret < 0)
>  		goto error;
>  
> -	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> +	dev_info(&dev->intf->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
>  		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
>  		 udev->product ? udev->product : "<unnamed>",
>  		 le16_to_cpu(udev->descriptor.idVendor),
>  		 le16_to_cpu(udev->descriptor.idProduct));
>  
>  	if (dev->quirks != dev->info->quirks) {
> -		dev_info(&dev->udev->dev,
> +		dev_info(&dev->intf->dev,
>  			 "Forcing device quirks to 0x%x by module parameter for testing purpose.\n",
>  			 dev->quirks);
> -		dev_info(&dev->udev->dev,
> +		dev_info(&dev->intf->dev,
>  			 "Please report required quirks to the linux-media mailing list.\n");
>  	}
>  
>  	if (dev->info->uvc_version) {
>  		dev->uvc_version = dev->info->uvc_version;
> -		dev_info(&dev->udev->dev, "Forcing UVC version to %u.%02x\n",
> +		dev_info(&dev->intf->dev, "Forcing UVC version to %u.%02x\n",
>  			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
>  	}
>  
> @@ -2281,21 +2281,21 @@ static int uvc_probe(struct usb_interface *intf,
>  	/* Initialize the interrupt URB. */
>  	ret = uvc_status_init(dev);
>  	if (ret < 0) {
> -		dev_info(&dev->udev->dev,
> +		dev_info(&dev->intf->dev,
>  			 "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
>  			 ret);
>  	}
>  
>  	ret = uvc_gpio_init_irq(dev);
>  	if (ret < 0) {
> -		dev_err(&dev->udev->dev,
> +		dev_err(&dev->intf->dev,
>  			"Unable to request privacy GPIO IRQ (%d)\n", ret);
>  		goto error;
>  	}
>  
>  	ret = uvc_meta_init(dev);
>  	if (ret < 0) {
> -		dev_err(&dev->udev->dev,
> +		dev_err(&dev->intf->dev,
>  			"Error initializing the metadata formats (%d)\n", ret);
>  		goto error;
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..3823ac9c8045b3ad8530372fd38983aaafbd775d 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -140,7 +140,7 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>  	list_for_each_entry(entity, &chain->entities, chain) {
>  		ret = uvc_mc_init_entity(chain, entity);
>  		if (ret < 0) {
> -			dev_info(&chain->dev->udev->dev,
> +			dev_info(&chain->dev->intf->dev,
>  				 "Failed to initialize entity for entity %u\n",
>  				 entity->id);
>  			return ret;
> @@ -150,7 +150,7 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>  	list_for_each_entry(entity, &chain->entities, chain) {
>  		ret = uvc_mc_create_links(chain, entity);
>  		if (ret < 0) {
> -			dev_info(&chain->dev->udev->dev,
> +			dev_info(&chain->dev->intf->dev,
>  				 "Failed to create links for entity %u\n",
>  				 entity->id);
>  			return ret;
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index ee01dce4b7834b05aab95379191c305cf8cec7f7..d3a3c4125c1fb6c8a5f2ee20bf4f0a9227fe2e46 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -215,7 +215,7 @@ static void uvc_status_complete(struct urb *urb)
>  		return;
>  
>  	default:
> -		dev_warn(&dev->udev->dev,
> +		dev_warn(&dev->intf->dev,
>  			 "Non-zero status (%d) in status completion handler.\n",
>  			 urb->status);
>  		return;
> @@ -247,7 +247,7 @@ static void uvc_status_complete(struct urb *urb)
>  	urb->interval = dev->int_ep->desc.bInterval;
>  	ret = usb_submit_urb(urb, GFP_ATOMIC);
>  	if (ret < 0)
> -		dev_err(&dev->udev->dev,
> +		dev_err(&dev->intf->dev,
>  			"Failed to resubmit status URB (%d).\n", ret);
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..f044666947a8c59e5bc6b444bb4e01f54df33c80 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -95,14 +95,14 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	 */
>  	if (ret > 0 && query != UVC_GET_INFO) {
>  		memset(data + ret, 0, size - ret);
> -		dev_warn_once(&dev->udev->dev,
> +		dev_warn_once(&dev->intf->dev,
>  			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
>  			      uvc_query_name(query), cs, unit, ret, size);
>  		return 0;
>  	}
>  
>  	if (ret != -EPIPE) {
> -		dev_err(&dev->udev->dev,
> +		dev_err(&dev->intf->dev,
>  			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>  			uvc_query_name(query), cs, unit, ret, size);
>  		return ret < 0 ? ret : -EPIPE;
> @@ -119,7 +119,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	*(u8 *)data = tmp;
>  
>  	if (ret != 1) {
> -		dev_err_ratelimited(&dev->udev->dev,
> +		dev_err_ratelimited(&dev->intf->dev,
>  				    "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
>  				    uvc_query_name(query), cs, unit, ret);
>  		return ret < 0 ? ret : -EPIPE;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 757254fc4fe930ae61c9d0425f04d4cd074a617e..8507de9ae633c9374b6427c890401a6a09ccb819 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -667,7 +667,7 @@ extern unsigned int uvc_hw_timestamps_param;
>  #define uvc_dbg(_dev, flag, fmt, ...)					\
>  do {									\
>  	if (uvc_dbg_param & UVC_DBG_##flag)				\
> -		dev_printk(KERN_DEBUG, &(_dev)->udev->dev, fmt,		\
> +		dev_printk(KERN_DEBUG, &(_dev)->intf->dev, fmt,		\
>  			   ##__VA_ARGS__);				\
>  } while (0)
>  
> @@ -680,7 +680,7 @@ do {									\
>  #define uvc_warn_once(_dev, warn, fmt, ...)				\
>  do {									\
>  	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
> -		dev_info(&(_dev)->udev->dev, fmt, ##__VA_ARGS__);	\
> +		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
>  } while (0)
>  
>  /* --------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

