Return-Path: <linux-media+bounces-18642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA79875C9
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 16:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652F01F2224B
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 14:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F291913BC0E;
	Thu, 26 Sep 2024 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bx/ex1jO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85267A13A;
	Thu, 26 Sep 2024 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361586; cv=none; b=nmF127ceQDp8YSzCCgKweWxwANcVErxU24jVNTFg+xVI8QNm48tXADKr8cdybCd6fAQ7pOFBi4YhmI6/geY5HSRDNBFJ2+yurOA6+ceGFNB4uxihF9kuct3SNNNF3+MoQs7gAJBFo/vv1jMGqErP04z7uI4yC32lvL1yI+D+JFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361586; c=relaxed/simple;
	bh=bkYkLOAw713fILsyCYM13JpHUst94SgvFIH1CgWWuX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIqmh348mfjDDj3iRQfiE6WFJKYyCR1bqGdE3diH+w880a3BEk+oQKnIFrFVfo+wg5wMmvDaYiYM+lU3EF2ohd77ghMr699DDiboZ+5Xmz9Jlmlh4JHuqSkVj4qzgcMiAA3CKRT79leg5SMrUGUhK3ydrZWVecRF+HvHJvQJHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bx/ex1jO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D26E8D4;
	Thu, 26 Sep 2024 16:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727361494;
	bh=bkYkLOAw713fILsyCYM13JpHUst94SgvFIH1CgWWuX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx/ex1jO75gq7J+rLJjqdQRCH9ckfvbYx8N5WMpQgL3sktG3/iSnSI2dkvsgKQUiu
	 T53GrRN5/4CRW2L8c/zQYot8DDorM0DxP0jfd8WUhDAWQTqiwCZPcrkPtV95ODpQV2
	 cXm4FAuZNPty9ccktaOmpzpNIzBrFWKg/bpF1h2Y=
Date: Thu, 26 Sep 2024 17:39:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v7 1/3] media: uvcvideo: Refactor the status irq API
Message-ID: <20240926143940.GI21788@pendragon.ideasonboard.com>
References: <20240926-guenter-mini-v7-0-690441953d4a@chromium.org>
 <20240926-guenter-mini-v7-1-690441953d4a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240926-guenter-mini-v7-1-690441953d4a@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Sep 26, 2024 at 05:49:57AM +0000, Ricardo Ribalda wrote:
> There are two different use-cases of uvc_status():
> 
> - adding/removing a user when the camera is open/closed
> - stopping/starting when the camera is suspended/resumed
> 
> Make the API reflect these two use-cases and move all the refcounting
> and locking logic to the uvc_status.c file.
> 
> No functional change is expected from this patch.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 13 ++--------
>  drivers/media/usb/uvc/uvc_status.c | 53 ++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 22 +++++-----------
>  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
>  4 files changed, 65 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..31e8942f1ef8 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2116,7 +2116,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	INIT_LIST_HEAD(&dev->streams);
>  	kref_init(&dev->ref);
>  	atomic_set(&dev->nmappings, 0);
> -	mutex_init(&dev->lock);
>  
>  	dev->udev = usb_get_dev(udev);
>  	dev->intf = usb_get_intf(intf);
> @@ -2288,10 +2287,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
>  	/* Controls are cached on the fly so they don't need to be saved. */
>  	if (intf->cur_altsetting->desc.bInterfaceSubClass ==
>  	    UVC_SC_VIDEOCONTROL) {
> -		mutex_lock(&dev->lock);
> -		if (dev->users)
> -			uvc_status_stop(dev);
> -		mutex_unlock(&dev->lock);
> +		uvc_status_suspend(dev);
>  		return 0;
>  	}
>  
> @@ -2322,12 +2318,7 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  				return ret;
>  		}
>  
> -		mutex_lock(&dev->lock);
> -		if (dev->users)
> -			ret = uvc_status_start(dev, GFP_NOIO);
> -		mutex_unlock(&dev->lock);
> -
> -		return ret;
> +		return uvc_status_resume(dev);
>  	}
>  
>  	list_for_each_entry(stream, &dev->streams, list) {
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index a78a88c710e2..e438ae5af2e8 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -257,6 +257,8 @@ int uvc_status_init(struct uvc_device *dev)
>  	unsigned int pipe;
>  	int interval;
>  
> +	mutex_init(&dev->status_lock);
> +
>  	if (ep == NULL)
>  		return 0;
>  
> @@ -302,18 +304,22 @@ void uvc_status_cleanup(struct uvc_device *dev)
>  	kfree(dev->status);
>  }
>  
> -int uvc_status_start(struct uvc_device *dev, gfp_t flags)
> +static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>  {
> +	lockdep_assert_held(&dev->status_lock);
> +
>  	if (dev->int_urb == NULL)
>  		return 0;
>  
>  	return usb_submit_urb(dev->int_urb, flags);
>  }
>  
> -void uvc_status_stop(struct uvc_device *dev)
> +static void uvc_status_stop(struct uvc_device *dev)
>  {
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  
> +	lockdep_assert_held(&dev->status_lock);
> +
>  	/*
>  	 * Prevent the asynchronous control handler from requeing the URB. The
>  	 * barrier is needed so the flush_status change is visible to other
> @@ -350,3 +356,46 @@ void uvc_status_stop(struct uvc_device *dev)
>  	 */
>  	smp_store_release(&dev->flush_status, false);
>  }
> +
> +int uvc_status_resume(struct uvc_device *dev)
> +{
> +	guard(mutex)(&dev->status_lock);
> +
> +	if (dev->status_users)
> +		return  uvc_status_start(dev, GFP_NOIO);

Double space afer return. I'll fix when applying.

> +
> +	return 0;
> +}
> +
> +void uvc_status_suspend(struct uvc_device *dev)
> +{
> +	guard(mutex)(&dev->status_lock);
> +
> +	if (dev->status_users)
> +		uvc_status_stop(dev);
> +}
> +
> +int uvc_status_get(struct uvc_device *dev)
> +{
> +	int ret = 0;
> +
> +	guard(mutex)(&dev->status_lock);
> +
> +	if (!dev->status_users)
> +		ret = uvc_status_start(dev, GFP_KERNEL);
> +	if (!ret)
> +		dev->status_users++;

Thanks for the scoped guard, we can write

	if (!dev->status_users) {
		int ret = uvc_status_start(dev, GFP_KERNEL);
		if (ret)
			return ret;
	}

	dev->status_users++;

	return 0;

which I think is nicer to read. If that's fine with you I'll do this
locally, not need to a new version.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return ret;
> +}
> +
> +void uvc_status_put(struct uvc_device *dev)
> +{
> +	guard(mutex)(&dev->status_lock);
> +
> +	if (dev->status_users == 1)
> +		uvc_status_stop(dev);
> +	WARN_ON(!dev->status_users);
> +	if (dev->status_users)
> +		dev->status_users--;
> +}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4988f03640a..97c5407f6603 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -628,20 +628,13 @@ static int uvc_v4l2_open(struct file *file)
>  		return -ENOMEM;
>  	}
>  
> -	mutex_lock(&stream->dev->lock);
> -	if (stream->dev->users == 0) {
> -		ret = uvc_status_start(stream->dev, GFP_KERNEL);
> -		if (ret < 0) {
> -			mutex_unlock(&stream->dev->lock);
> -			usb_autopm_put_interface(stream->dev->intf);
> -			kfree(handle);
> -			return ret;
> -		}
> +	ret = uvc_status_get(stream->dev);
> +	if (ret) {
> +		usb_autopm_put_interface(stream->dev->intf);
> +		kfree(handle);
> +		return ret;
>  	}
>  
> -	stream->dev->users++;
> -	mutex_unlock(&stream->dev->lock);
> -
>  	v4l2_fh_init(&handle->vfh, &stream->vdev);
>  	v4l2_fh_add(&handle->vfh);
>  	handle->chain = stream->chain;
> @@ -670,10 +663,7 @@ static int uvc_v4l2_release(struct file *file)
>  	kfree(handle);
>  	file->private_data = NULL;
>  
> -	mutex_lock(&stream->dev->lock);
> -	if (--stream->dev->users == 0)
> -		uvc_status_stop(stream->dev);
> -	mutex_unlock(&stream->dev->lock);
> +	uvc_status_put(stream->dev);
>  
>  	usb_autopm_put_interface(stream->dev->intf);
>  	return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b7d24a853ce4..07f9921d83f2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -563,8 +563,6 @@ struct uvc_device {
>  
>  	const struct uvc_device_info *info;
>  
> -	struct mutex lock;		/* Protects users */
> -	unsigned int users;
>  	atomic_t nmappings;
>  
>  	/* Video control interface */
> @@ -586,6 +584,8 @@ struct uvc_device {
>  	struct usb_host_endpoint *int_ep;
>  	struct urb *int_urb;
>  	struct uvc_status *status;
> +	struct mutex status_lock; /* Protects status_users */
> +	unsigned int status_users;
>  	bool flush_status;
>  
>  	struct input_dev *input;
> @@ -752,8 +752,10 @@ int uvc_register_video_device(struct uvc_device *dev,
>  int uvc_status_init(struct uvc_device *dev);
>  void uvc_status_unregister(struct uvc_device *dev);
>  void uvc_status_cleanup(struct uvc_device *dev);
> -int uvc_status_start(struct uvc_device *dev, gfp_t flags);
> -void uvc_status_stop(struct uvc_device *dev);
> +int uvc_status_resume(struct uvc_device *dev);
> +void uvc_status_suspend(struct uvc_device *dev);
> +int uvc_status_get(struct uvc_device *dev);
> +void uvc_status_put(struct uvc_device *dev);
>  
>  /* Controls */
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;

-- 
Regards,

Laurent Pinchart

