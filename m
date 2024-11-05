Return-Path: <linux-media+bounces-20910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D957C9BCB40
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0830C1C22778
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833FA1D3593;
	Tue,  5 Nov 2024 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FS7idm6t"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27E1C07D9;
	Tue,  5 Nov 2024 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804779; cv=pass; b=R3o90gDgCJUMqLcsyBrU/w942tH1oeXacNw6qOqWPsA4Wzq30H1o/o25ljIl8PMWfSAUfFukxDUFQIYNsxFz1gvZpY7bmt1Khgy1CMbTdbsNpFaoyOHrT91iuaTk2uKdTLJ+UJBir0OfLipS42bjFstprrOQ9FkpEmAkkdF6vZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804779; c=relaxed/simple;
	bh=wcrxuKn8K9LtTFViPP2HasRjlgD1Og0k6FcpW/UAaQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/AzL3XKB5w2qIH4BmLrgZDorKcsnLbmVaUNk32J7DWNRZ24pcYlUnxQKh8s+YWAJeOagUBUMPdmbD9JwGWIW4ECImPCpAKFUXM3H9A2iOScbph+P82q14DKa9TMMk0EvJDaOs0LRG7Bs2C2BrSnTjG52ZCmosZc/L97p2viGMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FS7idm6t; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XjQW271vPzyQq;
	Tue,  5 Nov 2024 13:06:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1730804767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjMpp85SscGqJYAZ8QaDaUQXw9fxMbO7dHkprU919mU=;
	b=FS7idm6tET+pq9TX1kbag5vD/excqYpIWee9zjI1Xwt/K70uuZf8gfZSyEkgkyUBWF8FwE
	k2F5qiLmw90bB0tHY6BMw+HXIaA2SUCOtCaxG299HU2ed1NziGLbLDl0Xdnxw/REfoPzmu
	Jq/dr8ZZ6vrdWplDdytAd62bfrTxoWY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1730804767; a=rsa-sha256; cv=none;
	b=I3qEo84SgP8hYdy/JJlzqpUddpSRFv/sWHW41fLNsEGZ43KbOerkQdecGCyX4IS5aozQel
	yRDXGS05VESK0MB5PtJi+6CBId3DwUhdxY7JWu7i5KszA4leVRckIY/6XUHXGuUUq69Blf
	nObKwvkY/Y7IvdC/gObfLQajfrTouqA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1730804767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjMpp85SscGqJYAZ8QaDaUQXw9fxMbO7dHkprU919mU=;
	b=bTn4ycgM816GzJdlL4sujD/IsEgGytv4Zn9o8vTFD7Ktmp3E6h77XvTI3VMzbnzjd+TE/n
	PI6xNqX5QjZLlKywP13fazQU2hQfJJFRVhFk8U0pv8QI4ojzwgI4Rj+VNlbiHYGZXnhlMh
	YtPZq8EeEhURnIEk7stHd+xpUQMr8mw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A22ED634C93;
	Tue,  5 Nov 2024 13:06:05 +0200 (EET)
Date: Tue, 5 Nov 2024 11:06:05 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Message-ID: <Zyn8HXh6oO-LG7od@valkosipuli.retiisi.eu>
References: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>

Hi Ricardo,

Thanks for the update.

On Tue, Nov 05, 2024 at 10:53:59AM +0000, Ricardo Ribalda wrote:
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

You could simply assign !ret to it as it's called once from probe.

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

I'd call this "initialised".

>  		} gpio;
>  	};
>  
> 

-- 
Regards,

Sakari Ailus

