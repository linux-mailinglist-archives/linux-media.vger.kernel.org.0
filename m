Return-Path: <linux-media+bounces-20943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816159BCFA2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4631128327F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423561D9A4B;
	Tue,  5 Nov 2024 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c8Ok97f6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF038DD6;
	Tue,  5 Nov 2024 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817833; cv=none; b=PlVZ0fIq8v3aHD+61rTthAhXy6rv4JKuwFVlvnmsq6Lb1dLVQnT3U+tpELw83oUs2l54MngmKB4Aek4wl7MoA+4yR0CgKC1gmqSr+jS+RyYWwPF/jU9AejKbDSmpIR1HRCw9XaDTdcviv3C+lDbO80iJ0O50amNS3YmGP7HI478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817833; c=relaxed/simple;
	bh=zPE3bJtYJZQtW3P2khG40Rcgy/ZmLsD9ce02Res2Md4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1cHgm8Te0VAdN1+E4OyW7fqEEhlLy4Z740sUxbklrawTch+jegmcjlEaVla68EcD95YK8D29P0rbM+q6T08zGh7TjlfelEOcL1cvJTvGtw5hbsGW5+0ifx/4f0vZbsiXFUKJkmcQsozz17K7HphUOEWqgpfBMlGiHQ417OdXfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c8Ok97f6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5235D4AD;
	Tue,  5 Nov 2024 15:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730817821;
	bh=zPE3bJtYJZQtW3P2khG40Rcgy/ZmLsD9ce02Res2Md4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8Ok97f6NyeD2bsLaWOabFe9kEE6qhqBUPU3u3P8kwh9RfhLc9GGPAMntnAgP5cPu
	 IxwUzK6HNymvdUBsh09xUbXGKkOhNVZvMTzape4mzC5RJ4GVd0lh/ZYPonpnMELMjs
	 zk7YDQBxXtPYMTnlTDkr8khMPQwUJcpiIc/MIvDc=
Date: Tue, 5 Nov 2024 16:43:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove refcounted cleanup
Message-ID: <20241105144340.GQ27775@pendragon.ideasonboard.com>
References: <20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org>

On Tue, Nov 05, 2024 at 02:32:39PM +0000, Ricardo Ribalda wrote:
> After commit c9ec6f173636 ("media: uvcvideo: Stop stream during unregister")
> we have some guarantee that userspace will not be able to access any of
> our internal structures after disconnect().
> 
> This means that we can do the cleanup at the end of disconnect and make
> the code more resilient to races.
> 
> This change will also enable the use of devres functions in more parts
> of the code.

That's the wrong direction, let's not go there, especially given that
this doesn't fix anything. Strong nack on my side, especially given how
many of your previous patches introduced race conditions. It's not
broken, don't touch it. A better use of your time would be to fix the
unplug race issue at the subsystem level.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 24 +++++-------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 -
>  2 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index a96f6ca0889f..2735fccdf454 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1868,16 +1868,12 @@ static int uvc_scan_device(struct uvc_device *dev)
>  /*
>   * Delete the UVC device.
>   *
> - * Called by the kernel when the last reference to the uvc_device structure
> - * is released.
> - *
> - * As this function is called after or during disconnect(), all URBs have
> + * As this function is called during disconnect(), all URBs have
>   * already been cancelled by the USB core. There is no need to kill the
>   * interrupt URB manually.
>   */
> -static void uvc_delete(struct kref *kref)
> +static void uvc_delete(struct uvc_device *dev)
>  {
> -	struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
>  	struct list_head *p, *n;
>  
>  	uvc_status_cleanup(dev);
> @@ -1919,14 +1915,6 @@ static void uvc_delete(struct kref *kref)
>  	kfree(dev);
>  }
>  
> -static void uvc_release(struct video_device *vdev)
> -{
> -	struct uvc_streaming *stream = video_get_drvdata(vdev);
> -	struct uvc_device *dev = stream->dev;
> -
> -	kref_put(&dev->ref, uvc_delete);
> -}
> -
>  /*
>   * Unregister the video devices.
>   */
> @@ -2009,7 +1997,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	vdev->v4l2_dev = &dev->vdev;
>  	vdev->fops = fops;
>  	vdev->ioctl_ops = ioctl_ops;
> -	vdev->release = uvc_release;
> +	vdev->release = video_device_release_empty;
>  	vdev->prio = &stream->chain->prio;
>  	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>  		vdev->vfl_dir = VFL_DIR_TX;
> @@ -2045,7 +2033,6 @@ int uvc_register_video_device(struct uvc_device *dev,
>  		return ret;
>  	}
>  
> -	kref_get(&dev->ref);
>  	return 0;
>  }
>  
> @@ -2160,7 +2147,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	INIT_LIST_HEAD(&dev->entities);
>  	INIT_LIST_HEAD(&dev->chains);
>  	INIT_LIST_HEAD(&dev->streams);
> -	kref_init(&dev->ref);
>  	atomic_set(&dev->nmappings, 0);
>  
>  	dev->udev = usb_get_dev(udev);
> @@ -2300,7 +2286,7 @@ static int uvc_probe(struct usb_interface *intf,
>  
>  error:
>  	uvc_unregister_video(dev);
> -	kref_put(&dev->ref, uvc_delete);
> +	uvc_delete(dev);
>  	return -ENODEV;
>  }
>  
> @@ -2319,7 +2305,7 @@ static void uvc_disconnect(struct usb_interface *intf)
>  		return;
>  
>  	uvc_unregister_video(dev);
> -	kref_put(&dev->ref, uvc_delete);
> +	uvc_delete(dev);
>  }
>  
>  static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..feb8de640a26 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -578,7 +578,6 @@ struct uvc_device {
>  
>  	/* Video Streaming interfaces */
>  	struct list_head streams;
> -	struct kref ref;
>  
>  	/* Status Interrupt Endpoint */
>  	struct usb_host_endpoint *int_ep;
> 
> ---
> base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> change-id: 20241105-uvc-rmrefcount-010d98d496c5

-- 
Regards,

Laurent Pinchart

