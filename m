Return-Path: <linux-media+bounces-30729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE2A97454
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294CF440E6F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F26B296D1B;
	Tue, 22 Apr 2025 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q/PbcjOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE5A59;
	Tue, 22 Apr 2025 18:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745345854; cv=none; b=Bq3XWcTwzHQgF1Ji0mriQyTNad/Ngd/MFA5+symmR3dR2D7Zl4JD7O/GL5ZGD1IgSURE9vJ4IUqn01gIIihZZR+1/KK6bwmfGxbmO6egyG4N63gLXNV29mHuAS7cko6uS58fYL3RscuADlIkELHIp/YMz6Vvh1KEFBzot7VjKaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745345854; c=relaxed/simple;
	bh=kyBwC65MDGKGT24Y46o1tixxQySi43knJiBHQyEzgm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5y/tuJE8ktqZS3n/vJf29c1jpIhqcF7ZChBYjzJ2Gmhx45C0Re29UB+4eAHJY6F3uk72X5aFq+Wb1Km/EqFoZVIlU0/cGYa+kD6cLpFE+0enzsEtpIJ5nupG0TlNnzgyRbj5sWKdJUnYv70jDcdIrh9gAdsgB1dZ5Vo0N9FElo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q/PbcjOJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DE8210D;
	Tue, 22 Apr 2025 20:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745345849;
	bh=kyBwC65MDGKGT24Y46o1tixxQySi43knJiBHQyEzgm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/PbcjOJGoOGa0cKxyEUObgr5hlY/4YoRg9JWTrPedaBZC8M5DpyxqOVA+F4KELKZ
	 EDSXuXWJSCoUUuItj+Qxo2GTwKSRFweLqQLaFLl7x6LCk1KweIeJ1hmuX4RKBWTYbE
	 vz6R1LhFyezg/jX077kikClUuuR37anHYv1qF4ug=
Date: Tue, 22 Apr 2025 21:17:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v6 2/5] media: uvcvideo: Create uvc_pm_(get|put) functions
Message-ID: <20250422181727.GL17813@pendragon.ideasonboard.com>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-2-35a2357ff348@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327-uvc-granpower-ng-v6-2-35a2357ff348@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 27, 2025 at 09:05:28PM +0000, Ricardo Ribalda wrote:
> Most of the times that we have to call uvc_status_(get|put) we need to
> call the usb_autopm_ functions.
> 
> Create a new pair of functions that automate this for us. This
> simplifies the current code and future PM changes in the driver.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 36 ++++++++++++++++++++++++------------
>  drivers/media/usb/uvc/uvcvideo.h |  4 ++++
>  2 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 22886b47d81c2cfd0a744f34a50d296d606e54e8..1d5be045d04ecbf17e65e14b390e494a294b735f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -26,6 +26,27 @@
>  
>  #include "uvcvideo.h"
>  
> +int uvc_pm_get(struct uvc_device *dev)
> +{
> +	int ret;
> +
> +	ret = usb_autopm_get_interface(dev->intf);
> +	if (ret)
> +		return ret;
> +
> +	ret = uvc_status_get(dev);
> +	if (ret)
> +		usb_autopm_put_interface(dev->intf);
> +
> +	return ret;
> +}
> +
> +void uvc_pm_put(struct uvc_device *dev)
> +{
> +	uvc_status_put(dev);
> +	usb_autopm_put_interface(dev->intf);
> +}
> +
>  static int uvc_acquire_privileges(struct uvc_fh *handle);
>  
>  static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
> @@ -642,20 +663,13 @@ static int uvc_v4l2_open(struct file *file)
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
> -	ret = uvc_status_get(stream->dev);
> +	ret = uvc_pm_get(stream->dev);
>  	if (ret) {
> -		usb_autopm_put_interface(stream->dev->intf);
>  		kfree(handle);
>  		return ret;
>  	}
> @@ -690,9 +704,7 @@ static int uvc_v4l2_release(struct file *file)
>  	kfree(handle);
>  	file->private_data = NULL;
>  
> -	uvc_status_put(stream->dev);
> -
> -	usb_autopm_put_interface(stream->dev->intf);
> +	uvc_pm_put(stream->dev);
>  	return 0;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5ceb01e7831a83507550e1d3313e63da7494b2e4..b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -768,6 +768,10 @@ void uvc_status_suspend(struct uvc_device *dev);
>  int uvc_status_get(struct uvc_device *dev);
>  void uvc_status_put(struct uvc_device *dev);
>  
> +/* PM */
> +int uvc_pm_get(struct uvc_device *dev);
> +void uvc_pm_put(struct uvc_device *dev);
> +
>  /* Controls */
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>  

-- 
Regards,

Laurent Pinchart

