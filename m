Return-Path: <linux-media+bounces-815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996707F47D8
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC711F2202A
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B5F5578A;
	Wed, 22 Nov 2023 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pKeOAKQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEDE197;
	Wed, 22 Nov 2023 05:33:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21726276;
	Wed, 22 Nov 2023 14:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700659973;
	bh=ovNRFCOwfiedgo/BxjM6ABJ6tIltn5tkgyoVDp1O/vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKeOAKQZCqI9EPX5E6sIkR1baYbxjtlCecJ7izSg2dK9xA9w8qXyoaBdtUN3KP4UC
	 il2klRfQnZOL0sNGdJorB2DLCGXAnhJcqtdTlyxOQWEi6y+o1dVT14fXuQ4VHzpn46
	 QwqPh4q3j5X1xrg3ImeanqvUsq1vaHgURP+PRUmw=
Date: Wed, 22 Nov 2023 15:33:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: Do not use usb_* functions after
 .disconnect
Message-ID: <20231122133330.GE3909@pendragon.ideasonboard.com>
References: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
 <20231122-guenter-mini-v5-3-15d8cd8ed74f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122-guenter-mini-v5-3-15d8cd8ed74f@chromium.org>

On Wed, Nov 22, 2023 at 11:45:49AM +0000, Ricardo Ribalda wrote:
> usb drivers should not call to any I/O function after the
> .disconnect() callback has been triggered.
> https://www.kernel.org/doc/html/latest/driver-api/usb/callbacks.html#the-disconnect-callback
> 
> If an application is receiving frames form a camera and the device is
> disconnected: the device will call close() after the usb .disconnect()
> callback has been called. The streamoff path will call usb_set_interface
> or usb_clear_halt, which is not allowed.
> 
> This patch only solves the calls to close() *after* .disconnect() is
> being called.
> 
> Trace:
> [ 1065.389723] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> [ 1065.390160] drivers/media/usb/uvc/uvc_driver.c:2264 uvc_disconnect exit
> [ 1065.433956] drivers/media/usb/uvc/uvc_v4l2.c:659 uvc_v4l2_release enter
> [ 1065.433973] drivers/media/usb/uvc/uvc_video.c:2274 uvc_video_stop_streaming enter
> [ 1065.434560] drivers/media/usb/uvc/uvc_video.c:2285 uvc_video_stop_streaming exit
> [ 1065.435154] drivers/media/usb/uvc/uvc_v4l2.c:680 uvc_v4l2_release exit
> [ 1065.435188] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  2 ++
>  drivers/media/usb/uvc/uvc_video.c  | 45 ++++++++++++++++++++++++--------------
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  3 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index d5dbf2644272..d78640d422f4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2266,6 +2266,8 @@ static void uvc_disconnect(struct usb_interface *intf)
>  		return;
>  
>  	uvc_unregister_video(dev);
> +	/* Barrier needed to pair with uvc_video_stop_streaming(). */
> +	smp_store_release(&dev->disconnected, true);

I can't think this would be such a hot path that we really need barriers
in the driver.

>  	kref_put(&dev->ref, uvc_delete);
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 28dde08ec6c5..f5ef375088de 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -2243,28 +2243,39 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
>  	return ret;
>  }
>  
> -void uvc_video_stop_streaming(struct uvc_streaming *stream)
> +static void uvc_video_halt(struct uvc_streaming *stream)
>  {
> -	uvc_video_stop_transfer(stream, 1);
> +	unsigned int epnum;
> +	unsigned int pipe;
> +	unsigned int dir;
>  
>  	if (stream->intf->num_altsetting > 1) {
>  		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> -	} else {
> -		/*
> -		 * UVC doesn't specify how to inform a bulk-based device
> -		 * when the video stream is stopped. Windows sends a
> -		 * CLEAR_FEATURE(HALT) request to the video streaming
> -		 * bulk endpoint, mimic the same behaviour.
> -		 */
> -		unsigned int epnum = stream->header.bEndpointAddress
> -				   & USB_ENDPOINT_NUMBER_MASK;
> -		unsigned int dir = stream->header.bEndpointAddress
> -				 & USB_ENDPOINT_DIR_MASK;
> -		unsigned int pipe;
> -
> -		pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> -		usb_clear_halt(stream->dev->udev, pipe);
> +		return;
>  	}
>  
> +	/*
> +	 * UVC doesn't specify how to inform a bulk-based device
> +	 * when the video stream is stopped. Windows sends a
> +	 * CLEAR_FEATURE(HALT) request to the video streaming
> +	 * bulk endpoint, mimic the same behaviour.
> +	 */
> +	epnum = stream->header.bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
> +	dir = stream->header.bEndpointAddress & USB_ENDPOINT_DIR_MASK;
> +	pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
> +	usb_clear_halt(stream->dev->udev, pipe);
> +}
> +
> +void uvc_video_stop_streaming(struct uvc_streaming *stream)
> +{
> +	uvc_video_stop_transfer(stream, 1);
> +
> +	/*
> +	 * Barrier needed to pair with uvc_disconnect().
> +	 * We cannot call usb_* functions on a disconnected USB device.
> +	 */
> +	if (!smp_load_acquire(&stream->dev->disconnected))
> +		uvc_video_halt(stream);
> +
>  	uvc_video_clock_cleanup(stream);
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ba8f8c1f2c83..5b1a3643de05 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -559,6 +559,8 @@ struct uvc_device {
>  	unsigned int users;
>  	atomic_t nmappings;
>  
> +	bool disconnected;
> +
>  	/* Video control interface */
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_device mdev;
> 

-- 
Regards,

Laurent Pinchart

