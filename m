Return-Path: <linux-media+bounces-18565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6A9866C2
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326CE282258
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6DE13D52C;
	Wed, 25 Sep 2024 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DRpQW4zV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856421D5AD8;
	Wed, 25 Sep 2024 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292062; cv=none; b=ZrzEi9JLLz6CDuPK4iZ0/XGzVRU2Fx4+vNvDb67+/SCdsR+qXVm5KZJBh9sQfoAwMpYA/mgW92pD0omO/jtJDgJ99ndPZctAMGTGiedQ2VJOjGXLm7kBR62mv0AQ+aJ6obQ7zWog8KJG3krwMBdGt2d2NOcqFga0oLCMoa+JpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292062; c=relaxed/simple;
	bh=SnYI4Nr+JP2KkPKg0YogWiWYjI2/yv3P9fBl0A6eS60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4jm78O3xI/1dIa52U3iGj7Vp3eQmkI82jJVIto0d8zXrW+SDqIYho2wTyZtDy1uY53GSdczBwL4F7ophaV8ragRZRUsTotzlBHZtTjMWixgVLOusdWFn58CvjkeDL/WV/yPRS4lnwtew2vWj8hz1WKnELguu43tZhhUgQDV7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DRpQW4zV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA9D27E2;
	Wed, 25 Sep 2024 21:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727291971;
	bh=SnYI4Nr+JP2KkPKg0YogWiWYjI2/yv3P9fBl0A6eS60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRpQW4zVnt30EfwpOFINpBPWM4mY1/xpwYBrO2r344cFgF5NhMxYvrdf0QW0OFlEL
	 V2nvR5JLBf6N6GI83Ej0oICg7ro4AA48CxQtP1ilkmlwRcHrIsL2eXPELdmyYnH71C
	 nIilzkZb3T3kHUYHIfaFU+nAxOuJgxyAPc3VxnLs=
Date: Wed, 25 Sep 2024 22:20:56 +0300
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
Subject: Re: [PATCH v6 3/4] media: uvcvideo: Avoid race condition during
 unregister
Message-ID: <20240925192056.GC30399@pendragon.ideasonboard.com>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-3-7b7fdc3b21b3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614-guenter-mini-v6-3-7b7fdc3b21b3@chromium.org>

Hi Ricardo,

Thank you for the patch.

I'd write "during status unregister" in the subject line.

On Fri, Jun 14, 2024 at 12:41:29PM +0000, Ricardo Ribalda wrote:
> The control events are handled asynchronously by the driver. Once the
> control event are handled, the urb is re-submitted.
> 
> If we simply kill the urb, there is a chance that a control event is
> waiting to be processed, which will re-submit the urb after the device is
> disconnected.
> 
> uvc_status_suspend() flushes the async controls and stops the urb in a
> correct manner.

"Fix this by calling uvc_status_suspend(), which flushes the async
controls and kills the URB in a race-free manner."

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 375a95dd3011..8fd8250110e2 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -294,7 +294,7 @@ int uvc_status_init(struct uvc_device *dev)
>  
>  void uvc_status_unregister(struct uvc_device *dev)
>  {
> -	usb_kill_urb(dev->int_urb);
> +	uvc_status_suspend(dev);
>  	uvc_input_unregister(dev);
>  }
>  

-- 
Regards,

Laurent Pinchart

