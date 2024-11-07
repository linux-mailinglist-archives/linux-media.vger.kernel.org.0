Return-Path: <linux-media+bounces-21083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AA89C1142
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 22:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84D241F24DFE
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 21:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10722218933;
	Thu,  7 Nov 2024 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E8EmcCXB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3B215C75;
	Thu,  7 Nov 2024 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016130; cv=none; b=lTuc0CAtL+PBxlt8o2W4HT9gUdVMuvhxzVkJKETwhYTWUc2y9ESKcYhKjsg8IvK6Q3Bl1WuELpZt5DLjM416625vcgvbU1cZySqxt3cqmNm+jDItSU6plwkkpsfxg64q8xBcdUWGxYS69oowCgOHvujt4ZX4tHgcQebWb1Jpe4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016130; c=relaxed/simple;
	bh=PeQlXo2Ahx/xh5UvvNM1rbtLq5tpIaIE8VYhMvhm39Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua0jbqfbcXAqqvMZqg/49CocAKeBj3qafVs0i1+Y2idVdUOJfQ3UGCoxW+M4zGif6lIKkp8TyFkM44AmazsRoevqtVBw5gw3+A5yIID5auaeVvVD2adEPob8JQ/KbSrdiKphhAahdesJXOSiI/7t4lmUHqFgs1y8zf3HtDOmEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E8EmcCXB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4488222A;
	Thu,  7 Nov 2024 22:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731016117;
	bh=PeQlXo2Ahx/xh5UvvNM1rbtLq5tpIaIE8VYhMvhm39Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8EmcCXBPQLn2G8m3bndqJh2vq27Fal3Jcdai/2AjpmVWno6i5K2w3/N6VeEwOf6M
	 WQk108+cZS5u+DDvdCXijHMwhSNeAcVN8zYfYIezrks9WwCkx3/ZZ6u0g7jRvdDo/m
	 PdiMnGoa0t3pYs/9rSA4e7/Fqcgv3qw0HIAl6jt4=
Date: Thu, 7 Nov 2024 23:48:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Message-ID: <20241107214839.GG31474@pendragon.ideasonboard.com>
References: <20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 06, 2024 at 08:36:07PM +0000, Ricardo Ribalda wrote:
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
> clean functions may be called after the main structure is released by
> uvc_delete.
> 
> Luckily this bug has small impact, as it is only affected by devices
> with gpio units and the user has to unbind the device, a disconnect will
> not trigger this error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v6:
> - Rename cleanup as deinit
> - Move cleanup to the beginning of the uvc_unregister_video.
> - Fix commit message.
> - Link to v5: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v5-1-8623fa51a74f@chromium.org
> 
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
>  drivers/media/usb/uvc/uvc_driver.c | 28 +++++++++++++++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index a96f6ca0889f..cd13bf01265d 100644
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
> +static void uvc_gpio_deinit(struct uvc_device *dev)
> +{
> +	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
> +		return;
> +
> +	free_irq(dev->gpio_unit->gpio.irq, dev);
>  }
>  
>  /* ------------------------------------------------------------------------
> @@ -1934,6 +1946,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  {
>  	struct uvc_streaming *stream;
>  
> +	uvc_gpio_deinit(dev);
> +
>  	list_for_each_entry(stream, &dev->streams, list) {
>  		/* Nothing to do here, continue. */
>  		if (!video_is_registered(&stream->vdev))
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

