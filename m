Return-Path: <linux-media+bounces-26671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48FA40FA4
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C66B3B7278
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9BE7083A;
	Sun, 23 Feb 2025 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rbkWhbAh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260F2F5A;
	Sun, 23 Feb 2025 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740326754; cv=none; b=oEHufYdlyLKRZHQX3V8jYHl+Mo113bFwTXz1hYgzk61j50YiYmyOgrADfdoZHhA4DJssLTj6V2Ge2kApqv9ScV40hq9uShEn8pJq2jVCfXzS9lE2tJ+kc9KVWsOk5xVSXEM6F8lmdTCVHLrklY1vJioObiX9wwRkM7YIpTlwwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740326754; c=relaxed/simple;
	bh=noOQpBDX7pxxQQTJmwMwR6yAbD+J86E38UthTfV6NUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIcf2jkOUg5WLFhsiFSypciBSXigRe4KoY/P+TYcHoC2BqC11hzJaLibMadntjS699Iv/KWMVTPAN3iJBm3KHAyxTyvINpOYfXNxtKZR47yOKsjHzgGRi1XIDVvvY8w849FfPQ3aDklQN0BTfUl+I+sx93NqdoX+FUmsIX++hkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rbkWhbAh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50640496;
	Sun, 23 Feb 2025 17:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740326665;
	bh=noOQpBDX7pxxQQTJmwMwR6yAbD+J86E38UthTfV6NUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbkWhbAhDcYglJ2Q+7ehG6AqgkhTbK3spYr0i0GiXGknVkONXVKPxUrPPrinYlfnZ
	 kLCdyZFKoxZ5BD6VlGDaJOVPqJ444tA3W+55ZTiDxIYCWutZS/rqPQAXJRivo58KyU
	 9OCAI6/e8pAlU+/jLNFkWjXEplsRh/nnnLZ2DGyA=
Date: Sun, 23 Feb 2025 18:05:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 2/6] media: uvcvideo: Move
 usb_autopm_(get|put)_interface to status_get
Message-ID: <20250223160534.GC27463@pendragon.ideasonboard.com>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
 <20250206-uvc-granpower-ng-v3-2-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206-uvc-granpower-ng-v3-2-32d0d7b0c5d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Feb 06, 2025 at 07:47:01PM +0000, Ricardo Ribalda wrote:
> Right now PM operations are always called at the same locations as
> uvc_status_(get|put).
> 
> Combine them into uvc_status_(get|put). This simplifies the current
> code and future PM changes in the driver.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 38 +++++++++++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvc_v4l2.c   | 11 +----------
>  2 files changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index ee01dce4b783..caa673b0279d 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -382,7 +382,7 @@ void uvc_status_suspend(struct uvc_device *dev)
>  		uvc_status_stop(dev);
>  }
>  
> -int uvc_status_get(struct uvc_device *dev)
> +static int _uvc_status_get(struct uvc_device *dev)

s/_uvc_status_get/__uvc_status_get/

>  {
>  	int ret;
>  
> @@ -399,13 +399,41 @@ int uvc_status_get(struct uvc_device *dev)
>  	return 0;
>  }
>  
> -void uvc_status_put(struct uvc_device *dev)
> +int uvc_status_get(struct uvc_device *dev)
> +{
> +	int ret;
> +
> +	ret = usb_autopm_get_interface(dev->intf);
> +	if (ret)
> +		return ret;
> +
> +	ret = _uvc_status_get(dev);
> +
> +	if (ret)
> +		usb_autopm_put_interface(dev->intf);
> +
> +	return ret;
> +}
> +
> +static int _uvc_status_put(struct uvc_device *dev)

s/_uvc_status_put/__uvc_status_put/

But unless you need to call this function in subsequent patches in the
series, I would merge it with uvc_status_put(). I think the same could
be done for get() too.

>  {
>  	guard(mutex)(&dev->status_lock);
>  
>  	if (dev->status_users == 1)
>  		uvc_status_stop(dev);
> -	WARN_ON(!dev->status_users);
> -	if (dev->status_users)
> -		dev->status_users--;
> +
> +	if (WARN_ON(!dev->status_users))
> +		return -EIO;

That's a change in behaviour that should be at least explained in the
commit message.

> +
> +	dev->status_users--;
> +	return 0;
> +}
> +
> +void uvc_status_put(struct uvc_device *dev)
> +{
> +	int ret;
> +
> +	ret = _uvc_status_put(dev);
> +	if (!ret)
> +		usb_autopm_put_interface(dev->intf);
>  }
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 856eaa23e703..5d4e967938af 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -636,20 +636,13 @@ static int uvc_v4l2_open(struct file *file)
>  	stream = video_drvdata(file);
>  	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
> -	ret = usb_autopm_get_interface(stream->dev->intf);
> -	if (ret < 0)
> -		return ret;
> -
>  	/* Create the device handle. */
>  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> -	if (handle == NULL) {
> -		usb_autopm_put_interface(stream->dev->intf);
> +	if (!handle)
>  		return -ENOMEM;
> -	}
>  
>  	ret = uvc_status_get(stream->dev);
>  	if (ret) {
> -		usb_autopm_put_interface(stream->dev->intf);
>  		kfree(handle);
>  		return ret;
>  	}
> @@ -685,8 +678,6 @@ static int uvc_v4l2_release(struct file *file)
>  	file->private_data = NULL;
>  
>  	uvc_status_put(stream->dev);
> -
> -	usb_autopm_put_interface(stream->dev->intf);

This isn't right. The usb_autopm_get_interface() and
usb_autopm_put_interface() calls here are not mean to support UVC status
operation only. Sure, the patch doesn't introduce an issue as such, but
it bundles two things that are not related in a way that is confusing.

I expect that the code will improve in subsequent patches and the reason
will become clear, but at least the commit message here really needs to
explain why there's a temporary step backwards. Ideally the series
should be reorganized to avoid this.

>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

