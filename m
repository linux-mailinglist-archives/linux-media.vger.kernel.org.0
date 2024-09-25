Return-Path: <linux-media+bounces-18564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E09866BA
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E3A5B22C0A
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18DC145A11;
	Wed, 25 Sep 2024 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aIxVLmb1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7580D1D5AD8;
	Wed, 25 Sep 2024 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727291748; cv=none; b=jsbwJrbkSnwTIPEy1stqAlnuxusYHqn9vqrzlySUKuNBI1eD0aFphSmtaNAcfoE1QWv9wK43BxyyFCXvr9pf9HxtkP7g5jEY7qtAn7EVCgO1bluWg99gRQVTQSzLD+dMuk4SUkyMe8/R148vuvdQVMsbx4Ko6afB6AQOrRAsHHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727291748; c=relaxed/simple;
	bh=v9TssKs1rKf+3Kk/QYsZ2zB/FYN433eNVwvGbGGwJvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvmyLrfg6UnFTl+GcIHbDBytFQbVE1vqijyM/KudYpRFlQIjhMXSuGkAEY6jr0Cl+8llviKWMUt3qrh1He4alT0l7Rawvakpj5ODiVNDDn8spJBd+PB7LvYq13VXtvtscvDsZZcFJIbzp+GxppA6Lkntz1hq2enNbRKwXdxOj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aIxVLmb1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D45FE7E2;
	Wed, 25 Sep 2024 21:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727291652;
	bh=v9TssKs1rKf+3Kk/QYsZ2zB/FYN433eNVwvGbGGwJvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIxVLmb1Kq+0aQXmZyTzzrw4Jp+eiIj6YRd1L+XcPHKdfcyUKFuDAIZXJmD+VjiXk
	 B7RCZecAIhUtZlBjCunuq3Q7aQ8Wj+vlgaboAy7dJ8zBfmZ6IclEnxAauhNejFvRwO
	 rHAa6Zml9Tu9+JbbtOlMXlvxoN8eZ2yn2RTwmhN0=
Date: Wed, 25 Sep 2024 22:15:37 +0300
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
Subject: Re: [PATCH v6 2/4] media: uvcvideo: Refactor the status irq API
Message-ID: <20240925191537.GB30399@pendragon.ideasonboard.com>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-2-7b7fdc3b21b3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614-guenter-mini-v6-2-7b7fdc3b21b3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Jun 14, 2024 at 12:41:28PM +0000, Ricardo Ribalda wrote:
> There are two different use-cases of uvc_status():

I'd add a blank line here, and remove the leading tabs from the next two
lines.

> 	- adding/removing a user when the camera is open/closed
> 	- stopping/starting when the camera is suspended/resumed
> 
> Make the API reflect these two use-cases and move all the refcounting
> and locking logic to the uvc_status.c file.

If my understanding is correct, this doesn't introduce any functional
change, and is not a dependency of further patches in the series. I
don't have a strong opinion on the refactoring itself, so I'm fine with
it, but I'd like a mention in the commit message that no functional
change is introduced.

> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 13 ++-------
>  drivers/media/usb/uvc/uvc_status.c | 55 ++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 22 +++++----------
>  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
>  4 files changed, 67 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 55132688e363..c8c0352af1e5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2135,7 +2135,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	INIT_LIST_HEAD(&dev->streams);
>  	kref_init(&dev->ref);
>  	atomic_set(&dev->nmappings, 0);
> -	mutex_init(&dev->lock);
>  
>  	dev->udev = usb_get_dev(udev);
>  	dev->intf = usb_get_intf(intf);
> @@ -2301,10 +2300,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
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
> @@ -2335,12 +2331,7 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
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
> index a78a88c710e2..375a95dd3011 100644
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
> +static int __uvc_status_start(struct uvc_device *dev, gfp_t flags)

Do we need a double underscore prefix here and for the stop() function ?

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
> +static void __uvc_status_stop(struct uvc_device *dev)
>  {
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  
> +	lockdep_assert_held(&dev->status_lock);
> +
>  	/*
>  	 * Prevent the asynchronous control handler from requeing the URB. The
>  	 * barrier is needed so the flush_status change is visible to other
> @@ -350,3 +356,48 @@ void uvc_status_stop(struct uvc_device *dev)
>  	 */
>  	smp_store_release(&dev->flush_status, false);
>  }
> +
> +int uvc_status_resume(struct uvc_device *dev)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&dev->status_lock);
> +	if (dev->status_users)
> +		ret = __uvc_status_start(dev, GFP_NOIO);
> +	mutex_unlock(&dev->status_lock);
> +
> +	return ret;

Now that we have scoped guards, this can be written as

	guard(mutex)(&dev->status_lock);

	if (!dev->status_users)
		return 0;

	return __uvc_status_start(dev, GFP_NOIO);

> +}
> +
> +void uvc_status_suspend(struct uvc_device *dev)
> +{
> +	mutex_lock(&dev->status_lock);
> +	if (dev->status_users)
> +		__uvc_status_stop(dev);
> +	mutex_unlock(&dev->status_lock);

	guard(mutex)(&dev->status_lock);

	if (dev->status_users)
		__uvc_status_stop(dev);

Same below.

> +}
> +
> +int uvc_status_get(struct uvc_device *dev)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&dev->status_lock);
> +	if (!dev->status_users)
> +		ret = __uvc_status_start(dev, GFP_KERNEL);
> +	if (!ret)
> +		dev->status_users++;
> +	mutex_unlock(&dev->status_lock);
> +
> +	return ret;
> +}
> +
> +void uvc_status_put(struct uvc_device *dev)
> +{
> +	mutex_lock(&dev->status_lock);
> +	if (dev->status_users == 1)
> +		__uvc_status_stop(dev);
> +	WARN_ON(!dev->status_users);

Is this needed, or could we keep the original code ?

	if (--dev->status_users == 0)
		__uvc_status_stop(dev);

All those comments are quite minor, the next version will have my R-b.

> +	if (dev->status_users)
> +		dev->status_users--;
> +	mutex_unlock(&dev->status_lock);
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
> index 6fb0a78b1b00..00b600eb058c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -555,8 +555,6 @@ struct uvc_device {
>  
>  	const struct uvc_device_info *info;
>  
> -	struct mutex lock;		/* Protects users */
> -	unsigned int users;
>  	atomic_t nmappings;
>  
>  	/* Video control interface */
> @@ -578,6 +576,8 @@ struct uvc_device {
>  	struct usb_host_endpoint *int_ep;
>  	struct urb *int_urb;
>  	struct uvc_status *status;
> +	struct mutex status_lock; /* Protects status_users */
> +	unsigned int status_users;
>  	bool flush_status;
>  
>  	struct input_dev *input;
> @@ -744,8 +744,10 @@ int uvc_register_video_device(struct uvc_device *dev,
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
>  extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;

-- 
Regards,

Laurent Pinchart

