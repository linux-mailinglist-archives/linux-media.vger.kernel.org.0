Return-Path: <linux-media+bounces-20816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB39BC0AA
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 23:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E0C282E96
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 22:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927131FDF80;
	Mon,  4 Nov 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S6YNLvIL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1814B94F;
	Mon,  4 Nov 2024 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730758498; cv=none; b=ENaPCkCL0EmgfI6biuJ+ah7Q8CoyV/mISToaitho+hdMhLFFyLhZX4OuuRitGq38YAmurKl3pSR5v0tA8VP41qkNevs5l+N6MSwHtHFA2RctYF68zmfyAtHjT5MhhNjpnoaviDqstCq6QU9EicZUyJVBzhdMIVHVRCUvyaLg56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730758498; c=relaxed/simple;
	bh=8gNlAg/eMJYboTxrfuf5i9OgCOeeHHti/glrou6bBwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj4qI3ZPNOJKZODNwe8HK9T18B2YqKvHMyWCAaH0zGGuZ6sQTqbs8VdC9jzLH4GTLiMUCVv+LXysrq8NQsaEyu2PIXaljHgxJNsw9hkPwnuH4GSGEwUNf+ONM9okuDiZS1MydlQzlicRUM9q9/Heu2+VzX84We8Rx3oROKaOnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S6YNLvIL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4512526;
	Mon,  4 Nov 2024 23:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730758487;
	bh=8gNlAg/eMJYboTxrfuf5i9OgCOeeHHti/glrou6bBwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6YNLvILfM8oY7VUpVMohLg6BVmDZA7cP1QxIDYySgOat6peEF8HrfEhs/pQM0p4L
	 TQZaubJ/d0g110R/0KzJ65J7gQjecuyRB2a4LVj0Zk6Z5zMW/mr+/J0oB3shtNjwUp
	 UIWdvqEhgj7WpPoJ+KiWuchgBFcdBB1rhooZ7mE0=
Date: Tue, 5 Nov 2024 00:14:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix crash during unbind if gpio unit is
 in use
Message-ID: <20241104221448.GB19140@pendragon.ideasonboard.com>
References: <20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 31, 2024 at 01:59:08PM +0000, Ricardo Ribalda wrote:
> We used the wrong device for the device managed functions. We used the
> usb device, when we should be using the interface device.
> 
> If we unbind the driver from the usb interface, the cleanup functions
> are never called. In our case, the IRQ is never disabled.
> 
> If an IRQ is triggered, it will try to access memory sections that are
> already free, causing an OOPS.
> 
> Luckily this bug has small impact, as it is only affected by devices
> with gpio units and the user has to unbind the device, a disconnect will
> not trigger this error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index a96f6ca0889f..1100d3ed342e 100644
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

Not strictly needed, but it doesn't hurt.

>  				     "No IRQ for privacy GPIO\n");
>  
>  	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> @@ -1333,7 +1333,7 @@ static int uvc_gpio_init_irq(struct uvc_device *dev)
>  	if (!unit || unit->gpio.irq < 0)
>  		return 0;
>  
> -	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
> +	return devm_request_threaded_irq(&dev->intf->dev, unit->gpio.irq, NULL,

We still have an issue here. The IRQ can be triggered in the small time
window between the point where the driver frees memory and the time the
IRQ is disabled by devm after .remove() returns. Managing the IRQ
manually would be a simple fix, there could be other options.

>  					 uvc_gpio_irq,
>  					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
>  					 IRQF_TRIGGER_RISING,
> 
> ---
> base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> change-id: 20241031-uvc-crashrmmod-666de3fc9141

-- 
Regards,

Laurent Pinchart

