Return-Path: <linux-media+bounces-30726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45388A9743B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5FD63A6904
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142729617D;
	Tue, 22 Apr 2025 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QG37vFLt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005C202F8F;
	Tue, 22 Apr 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745345197; cv=none; b=nyaIER0mGKzEKBdh5N2Y8a1vPV0W8lU3X0BxsGM4+3/sUA0gKkoJocHPxtYdS1xahuearyOUUHNs8eS4Z6JgOciDC42zT9RvSNAhnBcYDseDUxutwUWR6ASHKPsAWj39h8h2wSPFBI3XGUJGtELjxtzhEAWBLC3HUWbs8KdJ+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745345197; c=relaxed/simple;
	bh=JAD4LDHfjpVBO1LLTNYRcEr1yhhTOIdrI6hph/3+aM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpJKLQDv66BJrbbW3DmdCqXJt/wxM2JMqAEt4ZjqD8woDOuLe3mhrxWdDO1LTxXzfDPBhx5GQoFrPXR7aDBinNPy+NPvCvXBllyQFr8s8aWIOiIBB4UCqS6lYWBRA8rOaMDgkUpdlet8XAFaz13I1w5+rDfSovT5i1DuESf56+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QG37vFLt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A300C10D;
	Tue, 22 Apr 2025 20:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745345192;
	bh=JAD4LDHfjpVBO1LLTNYRcEr1yhhTOIdrI6hph/3+aM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QG37vFLtVv33vcsE1x4u+puep9kgAI5eKo6/D0q4tFZzOo4tykbxQHwCk6zu4hMVY
	 TFFz06uFxPEmmr+gWJ+3qviiI2TzHnvhzVPcg9Xe2e5UQtUh4FxvJutyyX2kHDX4We
	 73tIePF7ObPMb4tuntW5isAx+5JAPlaRObi9uBHo=
Date: Tue, 22 Apr 2025 21:06:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
Message-ID: <20250422180630.GJ17813@pendragon.ideasonboard.com>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
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
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
>  #endif
>  
>  	/* Parse the Video Class control descriptor. */
> -	if (uvc_parse_control(dev) < 0) {
> +	ret = uvc_parse_control(dev);
> +	if (ret < 0) {
> +		ret = -ENODEV;

Why do you set ret to -ENODEV here...

>  		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>  		goto error;
>  	}
>  
>  	/* Parse the associated GPIOs. */
> -	if (uvc_gpio_parse(dev) < 0) {
> +	ret = uvc_gpio_parse(dev);
> +	if (ret < 0) {
>  		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
>  		goto error;
>  	}
> @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
>  	}
>  
>  	/* Register the V4L2 device. */
> -	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> +	ret = v4l2_device_register(&intf->dev, &dev->vdev);
> +	if (ret < 0)

... but not here ? The code below is also not very consistant.

>  		goto error;
>  
>  	/* Scan the device for video chains. */
> -	if (uvc_scan_device(dev) < 0)
> +	if (uvc_scan_device(dev) < 0) {
> +		ret = -ENODEV;
>  		goto error;
> +	}
>  
>  	/* Initialize controls. */
> -	if (uvc_ctrl_init_device(dev) < 0)
> +	if (uvc_ctrl_init_device(dev) < 0) {
> +		ret = -ENODEV;
>  		goto error;
> +	}
>  
>  	/* Register video device nodes. */
> -	if (uvc_register_chains(dev) < 0)
> +	if (uvc_register_chains(dev) < 0) {
> +		ret = -ENODEV;
>  		goto error;
> +	}
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	/* Register the media device node */
> -	if (media_device_register(&dev->mdev) < 0)
> +	ret = media_device_register(&dev->mdev);
> +	if (ret < 0)
>  		goto error;
>  #endif
>  	/* Save our data pointer in the interface data. */
> @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
>  error:
>  	uvc_unregister_video(dev);
>  	kref_put(&dev->ref, uvc_delete);
> -	return -ENODEV;
> +	return ret;
>  }
>  
>  static void uvc_disconnect(struct usb_interface *intf)

-- 
Regards,

Laurent Pinchart

