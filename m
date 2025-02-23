Return-Path: <linux-media+bounces-26665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF971A40F4C
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 15:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9653B3E1F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834EA209F52;
	Sun, 23 Feb 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LKlyMevr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2C1DB548;
	Sun, 23 Feb 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740321404; cv=none; b=dU/OC44E2gosOuWKxbD1jsox2kGgM3+Uu+cZaFDzvCS2ntIDJyszf373Wl7AWsTylwWNDfL3K8rh4bfvu7j/DIvRhu3zRjs6meZe/iZr+MX0MZboDjYDq/1ZEGc1ghBdGjSJPxI9mEyfgvsArOFnbw/k8HWFUO7/00aSqmrKxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740321404; c=relaxed/simple;
	bh=2KgC6MCkhEmpH6nWjdCdSB0RNj3vB2gXxjeLT9L1Qrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHDFxwF+oUyDWMZWxVAJEOQkYPj0YyZ6e4tZvn8FU59sv/Fm/cLLW4i7BYsJkNk0DBJirxSMq7VlivAW/l9DjTNybVsYcwk3KMTcfOsH+zRCto8b0FO8sgrAikghro5876489ldRRlyJ52iH6AJTYd6kWMjwP7URwgZi67W8vqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LKlyMevr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E27A7496;
	Sun, 23 Feb 2025 15:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740321308;
	bh=2KgC6MCkhEmpH6nWjdCdSB0RNj3vB2gXxjeLT9L1Qrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKlyMevr/vwdDIMzahaxunZdjm20vY6ZsDLplhgn55UbpAQ6PS8QmrL8x1W2LkEad
	 EayCHb2Geo4pQ3TGDpP+wH5OHfvQYFkV3qpFLgvA9fpkZJm5LZhM06HtzIWRAdpq1z
	 IkIiZN7pPxz1ckKcjmBpMErn5Ru6Re6TGOTFLi38=
Date: Sun, 23 Feb 2025 16:36:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix deferred probing error
Message-ID: <20250223143617.GA27463@pendragon.ideasonboard.com>
References: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Jan 29, 2025 at 12:39:46PM +0000, Ricardo Ribalda wrote:
> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> have not yet been probed. This return code should be propagated to the
> caller of uvc_probe() to ensure that probing is retried when the required
> GPIOs become available.
> 
> Currently, this error code is incorrectly converted to -ENODEV,
> causing some internal cameras to be ignored.
> 
> This commit fixes this issue by propagating the -EPROBE_DEFER error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index a10d4f4d9f95..73a7f23b616c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2253,9 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
>  	}
>  
>  	/* Parse the associated GPIOs. */
> -	if (uvc_gpio_parse(dev) < 0) {
> +	ret = uvc_gpio_parse(dev);
> +	if (ret < 0) {
>  		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> -		goto error;
> +		goto error_retcode;
>  	}
>  
>  	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> @@ -2328,9 +2329,11 @@ static int uvc_probe(struct usb_interface *intf,
>  	return 0;
>  
>  error:
> +	ret = -ENODEV;
> +error_retcode:

This isn't very nice. Could we instead also propagate error codes from
other locations in the uvc_probe() function ? If you want to minimize
changes, you can initialize ret to -ENODEV, and turn the (ret < 0) check
for uvc_gpio_parse() to a (ret) check.

>  	uvc_unregister_video(dev);
>  	kref_put(&dev->ref, uvc_delete);
> -	return -ENODEV;
> +	return ret;
>  }
>  
>  static void uvc_disconnect(struct usb_interface *intf)
> 
> ---
> base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
> change-id: 20250129-uvc-eprobedefer-b5ebb4db63cc

-- 
Regards,

Laurent Pinchart

