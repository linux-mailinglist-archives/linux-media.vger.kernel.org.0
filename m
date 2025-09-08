Return-Path: <linux-media+bounces-41969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06DB4880F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD3C164B36
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC1C2ECD06;
	Mon,  8 Sep 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aNfJftqS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A523209;
	Mon,  8 Sep 2025 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757322924; cv=none; b=GdDyqAotUWVd6DFGMuNJ0Q1epB7NTtU+TEnbMKONE3YmryeHgXPNgdOsZ514w5NRXRhGh9ye5HgvJS7BI7vg8j+mKYG32wHphv3FxrN1sNnq1gyuOf9NFfucHMaGyO19h6AFwkLi/PFkPGrI3IDldwaTmFw9TwI9VuTcSUCfP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757322924; c=relaxed/simple;
	bh=e8CPxvFomJIJaXShopfIU0MAGjyUxSFzLzON+jaziAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsOPfB+xvBxK8WdfT8r5uak/+KRnhcfKPVJ96zLIFwnuvM2161JaFmfNlSokWjlQkQed7HGRvgjEf6zYk+zUcO+JTscZ0uTUQM++cTCKxsbeMVAXWh0p6zPcgcqVydtDujHmJdh9u7qO6+eqiqm2h8etbh+Fnu+KUHbWpedulZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aNfJftqS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9C7716DC;
	Mon,  8 Sep 2025 11:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757322848;
	bh=e8CPxvFomJIJaXShopfIU0MAGjyUxSFzLzON+jaziAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNfJftqSQScE93jTRfOmv8AHeinBjvpuU4rr/JiKskPrRZUhsuZoSYxT6ynsSZ638
	 /mDswe6N59v5PJfEkmCf4SB4nSLmyQ6PVLG8KYGkMd3ZoOwEJ5OLVzSi6ExAN3qglG
	 w+q165ln6WMLE+a6oeQdIwruf9r1QXS8X53Mxavk=
Date: Mon, 8 Sep 2025 11:14:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Drop stream->mutex
Message-ID: <20250908091459.GA22977@pendragon.ideasonboard.com>
References: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
 <20250725-uvc-onelocksless-v2-1-953477834929@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725-uvc-onelocksless-v2-1-953477834929@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Jul 25, 2025 at 01:12:48PM +0000, Ricardo Ribalda wrote:
> Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
> helpers"), the IOCTLs are serialized. Due to this there is no more need
> to protect ctrl, cur_format or cur_frame from concurrent access.
> 
> Drop stream->mutex after thanking it for years of good service.
> 
> Use this opportunity to do fix some CodeStyle.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c   |  4 ----
>  drivers/media/usb/uvc/uvc_metadata.c | 10 +++------
>  drivers/media/usb/uvc/uvc_v4l2.c     | 41 +++++++-----------------------------
>  drivers/media/usb/uvc/uvcvideo.h     |  6 ------
>  4 files changed, 11 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
>  	if (stream->async_wq)
>  		destroy_workqueue(stream->async_wq);
>  
> -	mutex_destroy(&stream->mutex);
> -
>  	usb_put_intf(stream->intf);
>  
>  	kfree(stream->formats);
> @@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
>  	if (stream == NULL)
>  		return NULL;
>  
> -	mutex_init(&stream->mutex);
> -
>  	stream->dev = dev;
>  	stream->intf = usb_get_intf(intf);
>  	stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 229e08ff323eed9129d835b24ea2e8085bb713b8..649844e2ad60ed9e9951daec871f2000f48702a6 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -100,16 +100,12 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>  	 * Metadata buffers would still be perfectly parseable, but it's more
>  	 * consistent and cleaner to disallow that.
>  	 */
> -	mutex_lock(&stream->mutex);
> -
>  	if (vb2_is_busy(&stream->meta.queue.queue))
> -		ret = -EBUSY;
> -	else
> -		stream->meta.format = fmt->dataformat;
> +		return -EBUSY;
>  
> -	mutex_unlock(&stream->mutex);
> +	stream->meta.format = fmt->dataformat;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..fdc4520a7bb42af7cd5cb9c1fa49957c31e0041c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	 * developers test their webcams with the Linux driver as well as with
>  	 * the Windows driver).
>  	 */
> -	mutex_lock(&stream->mutex);
>  	if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
>  		probe->dwMaxVideoFrameSize =
>  			stream->ctrl.dwMaxVideoFrameSize;
>  
>  	/* Probe the device. */
>  	ret = uvc_probe_video(stream, probe);
> -	mutex_unlock(&stream->mutex);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
>  	struct uvc_streaming *stream = handle->stream;
>  	const struct uvc_format *format;
>  	const struct uvc_frame *frame;
> -	int ret = 0;
>  
>  	if (fmt->type != stream->type)
>  		return -EINVAL;
>  
> -	mutex_lock(&stream->mutex);
>  	format = stream->cur_format;
>  	frame = stream->cur_frame;
>  
> -	if (format == NULL || frame == NULL) {
> -		ret = -EINVAL;
> -		goto done;
> -	}
> +	if (!format || !frame)
> +		return -EINVAL;
>  
>  	fmt->fmt.pix.pixelformat = format->fcc;
>  	fmt->fmt.pix.width = frame->wWidth;
> @@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
>  	fmt->fmt.pix.xfer_func = format->xfer_func;
>  	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
>  
> -done:
> -	mutex_unlock(&stream->mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> @@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
>  	if (ret < 0)
>  		return ret;
>  
> -	mutex_lock(&stream->mutex);
> -	if (vb2_is_busy(&stream->queue.queue)) {
> -		ret = -EBUSY;
> -		goto done;
> -	}
> +	if (vb2_is_busy(&stream->queue.queue))
> +		return -EBUSY;
>  
>  	stream->ctrl = probe;
>  	stream->cur_format = format;
>  	stream->cur_frame = frame;
>  
> -done:
> -	mutex_unlock(&stream->mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static int uvc_ioctl_g_parm(struct file *file, void *fh,
> @@ -466,10 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
>  	if (parm->type != stream->type)
>  		return -EINVAL;
>  
> -	mutex_lock(&stream->mutex);
>  	numerator = stream->ctrl.dwFrameInterval;
> -	mutex_unlock(&stream->mutex);
> -
>  	denominator = 10000000;
>  	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
>  
> @@ -519,12 +503,8 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>  	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
>  		timeperframe.numerator, timeperframe.denominator, interval);
>  
> -	mutex_lock(&stream->mutex);
> -
> -	if (uvc_queue_streaming(&stream->queue)) {
> -		mutex_unlock(&stream->mutex);
> +	if (uvc_queue_streaming(&stream->queue))
>  		return -EBUSY;
> -	}
>  
>  	format = stream->cur_format;
>  	frame = stream->cur_frame;
> @@ -556,14 +536,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>  
>  	/* Probe the device with the new settings. */
>  	ret = uvc_probe_video(stream, &probe);
> -	if (ret < 0) {
> -		mutex_unlock(&stream->mutex);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	stream->ctrl = probe;
>  	stream->cur_frame = frame;
> -	mutex_unlock(&stream->mutex);
>  
>  	/* Return the actual frame period. */
>  	timeperframe.numerator = probe.dwFrameInterval;
> @@ -941,10 +918,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
>  
>  	sel->r.left = 0;
>  	sel->r.top = 0;
> -	mutex_lock(&stream->mutex);
>  	sel->r.width = stream->cur_frame->wWidth;
>  	sel->r.height = stream->cur_frame->wHeight;
> -	mutex_unlock(&stream->mutex);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -469,12 +469,6 @@ struct uvc_streaming {
>  	const struct uvc_format *cur_format;
>  	const struct uvc_frame *cur_frame;
>  
> -	/*
> -	 * Protect access to ctrl, cur_format, cur_frame and hardware video
> -	 * probe control.
> -	 */
> -	struct mutex mutex;
> -
>  	/* Buffers queue. */
>  	unsigned int frozen : 1;
>  	struct uvc_video_queue queue;

-- 
Regards,

Laurent Pinchart

