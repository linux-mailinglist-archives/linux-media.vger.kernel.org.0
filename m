Return-Path: <linux-media+bounces-21016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A19449BEDA9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 14:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D0E1F255E9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 13:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584801EF0A2;
	Wed,  6 Nov 2024 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qCeuANwa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24451E0083;
	Wed,  6 Nov 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898532; cv=none; b=n+OPLWcScZTGXcFWei0T6CifHJnQVWS0Ym/HlZEV/47Y7syAOhNjnPqh2oio/BAJKAbSM/v2haIH/U3kNVz3tfqZvtXseby4NrX6pfSIzK20NOztLRYKE0enFsBN3Soqd1N+S56AoQCAYU2+TTYzEwCaXutXkWnY+b2Wqte881c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898532; c=relaxed/simple;
	bh=b8aHgEWJzINaqZBnJuW3NmZJUdEXAQrzBUjcp7kQqH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgAv2M1YqzCI5K5l4ETQ2uQ5HWlL7vgTqxbk9Rdj5Pc490/A1bwNXDhEuPENdBWn4SoeLYlYgfcBhnS/qYdujEr75OMn638uq0tn572iAA5TiihvTH1EM2PHoL3LQy82KeaT95nnX4FApidawv81jKXC/wfRmdc2ZsHgW7LqM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qCeuANwa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEFE2475;
	Wed,  6 Nov 2024 14:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730898521;
	bh=b8aHgEWJzINaqZBnJuW3NmZJUdEXAQrzBUjcp7kQqH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCeuANwasKM/FpxdTLmK2KuRiajn7zIJU7tRVCCSjYkZ+8t6UJq8xLyTZEmLw0Qzs
	 ERDCr3S1wWoXSFfqoPIS8hyKXZ+OaMoQzfKlw3hei5mpLMvEbl5O8+pWzn9dYaoTf5
	 O3ebamKlnc326DrflnXNlBMjbmUDLN2RxjlNMXlg=
Date: Wed, 6 Nov 2024 15:08:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v5] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Message-ID: <20241106130843.GF9369@pendragon.ideasonboard.com>
References: <20241105-uvc-crashrmmod-v5-1-8623fa51a74f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-uvc-crashrmmod-v5-1-8623fa51a74f@chromium.org>

On Tue, Nov 05, 2024 at 02:21:38PM +0000, Ricardo Ribalda wrote:
> We used the wrong device for the device managed functions. We used the
> usb device, when we should be using the interface device.
> 
> If we unbind the driver from the usb interface, the cleanup functions
> are never called. In our case, the IRQ is never disabled.
> 
> If an IRQ is triggered, it will try to access memory sections that are
> already free, causing an OOPS.
> 
> We cannot use the function devm_request_threaded_irq here. The devm_*
> clean functions are called after the main structure is released by
> uvc_delete.

That may or may not be true, depending on whether or not userspace holds
on to resources.

> Luckily this bug has small impact, as it is only affected by devices
> with gpio units and the user has to unbind the device, a disconnect will
> not trigger this error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5:
> - Revert non refcount, that belongs to a different set
> - Move cleanup to a different function
> - Link to v4: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org
> 
> Changes in v4: Thanks Laurent.
> - Remove refcounted cleaup to support devres.
> - Link to v3: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v3-1-c0959c8906d3@chromium.org
> 
> Changes in v3: Thanks Sakari.
> - Rename variable to initialized.
> - Other CodeStyle.
> - Link to v2: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org
> 
> Changes in v2: Thanks to Laurent.
> - The main structure is not allocated with devres so there is a small
>   period of time where we can get an irq with the structure free. Do not
>   use devres for the IRQ.
> - Link to v1: https://lore.kernel.org/r/20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index a96f6ca0889f..aa937f07b6b5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1295,14 +1295,14 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  	struct gpio_desc *gpio_privacy;
>  	int irq;
>  
> -	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
> +	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
>  					       GPIOD_IN);
>  	if (IS_ERR_OR_NULL(gpio_privacy))
>  		return PTR_ERR_OR_ZERO(gpio_privacy);
>  
>  	irq = gpiod_to_irq(gpio_privacy);
>  	if (irq < 0)
> -		return dev_err_probe(&dev->udev->dev, irq,
> +		return dev_err_probe(&dev->intf->dev, irq,
>  				     "No IRQ for privacy GPIO\n");
>  
>  	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> @@ -1329,15 +1329,27 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  static int uvc_gpio_init_irq(struct uvc_device *dev)
>  {
>  	struct uvc_entity *unit = dev->gpio_unit;
> +	int ret;
>  
>  	if (!unit || unit->gpio.irq < 0)
>  		return 0;
>  
> -	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
> -					 uvc_gpio_irq,
> -					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> -					 IRQF_TRIGGER_RISING,
> -					 "uvc_privacy_gpio", dev);
> +	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
> +				   IRQF_TRIGGER_RISING,
> +				   "uvc_privacy_gpio", dev);
> +
> +	unit->gpio.initialized = !ret;
> +
> +	return ret;
> +}
> +
> +static void uvc_gpio_cleanup(struct uvc_device *dev)
> +{
> +	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> +		return;
> +
> +	free_irq(dev->gpio_unit->gpio.irq, dev);
>  }
>  
>  /* ------------------------------------------------------------------------
> @@ -1982,6 +1994,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  	if (media_devnode_is_registered(dev->mdev.devnode))
>  		media_device_unregister(&dev->mdev);
>  #endif
> +	uvc_gpio_cleanup(dev);

Have you checked in details that doing this at the *end* of
uvc_unregister_video(), after lots of resources get unregistered, will
not cause any issue if the IRQ occurs somewhere in the middle of this
function ? It would seem much safer to free the IRQ at the *beginning*
of the function, the same way that drivers should generally stop
hardware activity first, and only then release resources that may be
needed when handling hardware activity.

>  }
>  
>  int uvc_register_video_device(struct uvc_device *dev,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..965a789ed03e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -234,6 +234,7 @@ struct uvc_entity {
>  			u8  *bmControls;
>  			struct gpio_desc *gpio_privacy;
>  			int irq;
> +			bool initialized;
>  		} gpio;
>  	};
>  
> 
> ---
> base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> change-id: 20241031-uvc-crashrmmod-666de3fc9141

-- 
Regards,

Laurent Pinchart

