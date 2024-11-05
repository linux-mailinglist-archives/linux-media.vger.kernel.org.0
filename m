Return-Path: <linux-media+bounces-20927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF799BCC4A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2863A283754
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ACF1D514F;
	Tue,  5 Nov 2024 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sU199bvU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F801420A8;
	Tue,  5 Nov 2024 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808206; cv=none; b=pVfFhjLXvHCJzfc+KrCo8d9sZujbYy9VeMAJHtX8JuOrzHRclGRSqAYIiYdk5Zj10KhWEXkQXYQbP6N2BFGIJIcYfskl4FpD+jIK8k/Jdj5LH2Vfo36etamlGY8/VgGC2LkJISvJuVGVYT3aF3X+DOtC38l4GbTF99bICj65Jto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808206; c=relaxed/simple;
	bh=f5aR0qCh3iZzX++JCXBR+GL1e5IVYzj03wmplizhTVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUee7koRer5UNaKj4pQ8MskLeG2M8pNhhTgJzDbpY3VcwkgyMuDodjv1K5egaxElOpYTtFLmO5k2jtoyZ9o5tJ5NM8SU5WvrdSwSNvHYn3HYCzoAzKL05Hgkf4rLD+KP2/5xkqtJVZBvEgCaQXqr85LkodhFtcUiIhtAi6j/qMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sU199bvU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D824AD;
	Tue,  5 Nov 2024 13:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730808195;
	bh=f5aR0qCh3iZzX++JCXBR+GL1e5IVYzj03wmplizhTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU199bvU6qrrJwzMHBcEoUuc4zXvxQGJv/Khs+aw0wgoxsE6xo3yFkeLm+oqK1dNK
	 lUqMvJz3jm7MT6V4B/9ZXPsOQA8ZC2LT/+6OKBIYzcidJHU5n9wphs49rZ85b/UknI
	 4ZI/sHt7/Dgp10bJaLBQRrAAqUMODJCEJpSWy/MQ=
Date: Tue, 5 Nov 2024 14:03:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Message-ID: <20241105120315.GP27775@pendragon.ideasonboard.com>
References: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Nov 05, 2024 at 10:53:59AM +0000, Ricardo Ribalda wrote:
> We used the wrong device for the device managed functions. We used the
> usb device, when we should be using the interface device.
> 
> If we unbind the driver from the usb interface, the cleanup functions
> are never called. In our case, the IRQ is never disabled.
> 
> If an IRQ is triggered, it will try to access memory sections that are
> already free, causing an OOPS.

The commit message should explain why you're switching away from
devm_request_threaded_irq().

> 
> Luckily this bug has small impact, as it is only affected by devices
> with gpio units and the user has to unbind the device, a disconnect will
> not trigger this error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
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
> index a96f6ca0889f..af6aec27083c 100644
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
> @@ -1329,15 +1329,28 @@ static int uvc_gpio_parse(struct uvc_device *dev)
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
> +	if (!ret)
> +		dev->gpio_unit->gpio.inited = true;

		unit->gpio.inited = true;

> +
> +	return ret;
> +}
> +
> +static void uvc_gpio_cleanup(struct uvc_device *dev)
> +{
> +	if (!dev->gpio_unit || !dev->gpio_unit->gpio.inited)
> +		return;
> +
> +	free_irq(dev->gpio_unit->gpio.irq, dev);
>  }
>  
>  /* ------------------------------------------------------------------------
> @@ -1880,6 +1893,7 @@ static void uvc_delete(struct kref *kref)
>  	struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
>  	struct list_head *p, *n;
>  
> +	uvc_gpio_cleanup(dev);

This belongs to uvc_unregister_video(), or you'll have a race between
the release of the GPIO happening after .disconnect() returns, and
uvc_gpio_event() calling gpiod_get_value_cansleep().

I understand the desire to get such a fix merged quickly, but taking
time to think about race conditions instead of speeding up to get a
patch out of the door would be better. The alternative where I have to
flag race conditions multiple times during review is slower, and is more
work for everybody.

>  	uvc_status_cleanup(dev);
>  	uvc_ctrl_cleanup_device(dev);
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..376cd670539b 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -234,6 +234,7 @@ struct uvc_entity {
>  			u8  *bmControls;
>  			struct gpio_desc *gpio_privacy;
>  			int irq;
> +			bool inited;

As Sakari, I also prefer "initialized". Another option to save a few
bytes of memory here is to set irq to -1 when request_threaded_irq()
fails and test that in uvc_gpio_cleanup().

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

