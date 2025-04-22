Return-Path: <linux-media+bounces-30727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF225A97442
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C62017FE6B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F7296175;
	Tue, 22 Apr 2025 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m+XsoTYc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172FE54F81;
	Tue, 22 Apr 2025 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745345318; cv=none; b=MeL15wXkxankQRwXcNaoeE9FwlNbqwIi88EOQu4DZ7e5j0Hx71ignwebzuEJHafGcb2xpIiMqKyKPQa+3fiAqslOiEyNs1zpX7g1QCg2ZDcazSeBige/WaNF2T++HYGDTmcE2BK5qAHxhWuTuTaWw28C06l0ZqAPRppT2fyKp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745345318; c=relaxed/simple;
	bh=ND7rRtkgBwEAAvZr2Q6FJKV26qT+QN2b2cQSgUtG3nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLHIgxB4L3eBkRraibitaZI19JZ3UBVHHfKkDGYR4nWZg2LRlY6R/6qsF4UYJ7xZmIkjQRFjL3XJr9SiPBjwpfb0PAUXho7K3pTyxdatPOPQQbi8w/eilf86om1ndy+BwEasQwyLrIxUTUJKr7qkZ3pPvHfHazYCQvw8VFyc48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m+XsoTYc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548AA10D;
	Tue, 22 Apr 2025 20:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745345314;
	bh=ND7rRtkgBwEAAvZr2Q6FJKV26qT+QN2b2cQSgUtG3nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+XsoTYcWLtjaIqHp/Pp8jPSjooA3J1KNJtiAC3aYFbxeUHWjjKiZn+KIvsULK/Be
	 y0iDhhj3KFbOzaVB8dCjaZZ4XIMhgtYWcRu9E86ZerO7hKJ1s9gd61c7TqJCE5ldL3
	 Rk78llrOrv6mLR0laOyBGGLAqzKdVpNA1SJKeqAY=
Date: Tue, 22 Apr 2025 21:08:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Use dev_err_probe for
 devm_gpiod_get_optional
Message-ID: <20250422180832.GK17813@pendragon.ideasonboard.com>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-2-a1d312708eef@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-uvc-eprobedefer-v3-2-a1d312708eef@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 13, 2025 at 12:20:40PM +0000, Ricardo Ribalda wrote:
> Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
> with gpiod_to_irq()
> 
> That eventually calls device_set_deferred_probe_reason() which can be
> helpful for tracking down problems.
> 
> Now that all the error paths in uvc_gpio_parse have dev_err_probe, we
> can remove the error message in uvc_probe.
> 
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e966bdb9239f345fd157588ebdad2b3ebe45168d..d8e51c3db7575bebe7bb700b53b50ae02d355d8e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1297,8 +1297,13 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  
>  	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
>  					       GPIOD_IN);
> -	if (IS_ERR_OR_NULL(gpio_privacy))
> -		return PTR_ERR_OR_ZERO(gpio_privacy);
> +	if (!gpio_privacy)
> +		return 0;
> +
> +	if (IS_ERR(gpio_privacy))
> +		return dev_err_probe(&dev->intf->dev,
> +				     PTR_ERR(gpio_privacy),
> +				     "Can't get privacy GPIO\n");
>  
>  	irq = gpiod_to_irq(gpio_privacy);
>  	if (irq < 0)
> @@ -2240,10 +2245,8 @@ static int uvc_probe(struct usb_interface *intf,
>  
>  	/* Parse the associated GPIOs. */
>  	ret = uvc_gpio_parse(dev);
> -	if (ret < 0) {
> -		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
>  		 dev->uvc_version >> 8, dev->uvc_version & 0xff,

-- 
Regards,

Laurent Pinchart

