Return-Path: <linux-media+bounces-37761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F111CB055ED
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B271AA643E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EE02D543A;
	Tue, 15 Jul 2025 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="urwCEAzC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E723C8C7;
	Tue, 15 Jul 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570639; cv=none; b=ngqWJ6X9YK566+tcokUhSQogdViqM0BhrVLzqnB2o8URvHWI7vgWq5sKg5FgZPBRRq23crctEaP08aoMETIWZFWRselDGzLc4XBu6oacYVPXXxLd4mueRUaV4UbBo9XT8GP1BSWY2zkV9/KrasL/3PUQfF53A+bnIkQuixsZ3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570639; c=relaxed/simple;
	bh=f7f2tSKk5eToGykBO3UTRjcamqQUtQK6x4PmUhRKRMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8u4wmuX04kvlcg/U2TkTU5dVXbqxAD3bWV7CKhN+7oV+KJwtpn+HgAA89uKSNWqgrPhDum3LV4t3vAAJfwRJFvj1BoOkZlP6cYX/Yxc1fsroWDDw3qx5fzrLCYqFTGYaMu4XLCznUw7Er1nIo4VhAIQPilnR2qMlaLVqPAPySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=urwCEAzC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2AA8A82A;
	Tue, 15 Jul 2025 11:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752570601;
	bh=f7f2tSKk5eToGykBO3UTRjcamqQUtQK6x4PmUhRKRMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urwCEAzCdPEN3KD51CmnldW641OB4aQ7JNdAeq9sAB166d6xaP4lGg6Xu55F8vM54
	 YsN1jjvy/shmJBjXgpEPqvp5twvQmZLuymr20h/qr1+3XCcQcgYGd8ngkifiKGAy9n
	 0p/aqkuLlgstzopiCkBCPMc/M5LwYMujfQi3q2Is=
Date: Tue, 15 Jul 2025 12:10:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 4/4] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
Message-ID: <20250715091032.GF20231@pendragon.ideasonboard.com>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711083413.1552423-5-sakari.ailus@linux.intel.com>

Hi Sakari, Tao,

Thank you for the patch.

On Fri, Jul 11, 2025 at 11:34:13AM +0300, Sakari Ailus wrote:
> From: Tao Q Tao <tao.q.tao@intel.com>
> 
> Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximum
> bytes per interval for the endpoint. Consequently this adds eUSB2
> isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
> where larger bpi values are possible.
> 
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Assuming usb_endpoint_max_isoc_bpi() works correctly :-),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I won't queue this patch for the time being as it depends on the rest of
the series. Please let me know if I should queue it at a later point, or
if you would like to merge it through the linux-usb tree. We would need
to make sure there's no conflict with other scheduled patches for that
kernel development cycle.

> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
>  drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
>  3 files changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..fde0bc95622c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  	unsigned int nformats = 0, nframes = 0, nintervals = 0;
>  	unsigned int size, i, n, p;
>  	u32 *interval;
> -	u16 psize;
> +	u32 psize;
>  	int ret = -EINVAL;
>  
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass
> @@ -772,7 +772,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  				streaming->header.bEndpointAddress);
>  		if (ep == NULL)
>  			continue;
> -		psize = uvc_endpoint_max_bpi(dev->udev, ep);
> +		psize = usb_endpoint_max_isoc_bpi(dev->udev, ep);
>  		if (psize > streaming->maxpsize)
>  			streaming->maxpsize = psize;
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..9f65cdbc1a1c 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1895,24 +1895,6 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>  		uvc_free_urb_buffers(stream);
>  }
>  
> -/*
> - * Compute the maximum number of bytes per interval for an endpoint.
> - */
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
> -{
> -	u16 psize;
> -
> -	switch (dev->speed) {
> -	case USB_SPEED_SUPER:
> -	case USB_SPEED_SUPER_PLUS:
> -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> -	default:
> -		psize = usb_endpoint_maxp(&ep->desc);
> -		psize *= usb_endpoint_maxp_mult(&ep->desc);
> -		return psize;
> -	}
> -}
> -
>  /*
>   * Initialize isochronous URBs and allocate transfer buffers. The packet size
>   * is given by the endpoint.
> @@ -1923,10 +1905,10 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>  	struct urb *urb;
>  	struct uvc_urb *uvc_urb;
>  	unsigned int npackets, i;
> -	u16 psize;
> +	u32 psize;
>  	u32 size;
>  
> -	psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +	psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
>  	size = stream->ctrl.dwMaxVideoFrameSize;
>  
>  	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
> @@ -2067,7 +2049,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  				continue;
>  
>  			/* Check if the bandwidth is high enough. */
> -			psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +			psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
>  			if (psize >= bandwidth && psize < best_psize) {
>  				altsetting = alts->desc.bAlternateSetting;
>  				best_psize = psize;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b9f8eb62ba1d..a77ba76e033a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -450,7 +450,7 @@ struct uvc_streaming {
>  
>  	struct usb_interface *intf;
>  	int intfnum;
> -	u16 maxpsize;
> +	u32 maxpsize;
>  
>  	struct uvc_streaming_header header;
>  	enum v4l2_buf_type type;
> @@ -818,8 +818,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>  					    u8 epaddr);
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
> -
>  /* Quirks support */
>  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
>  			     struct uvc_buffer *buf,

-- 
Regards,

Laurent Pinchart

