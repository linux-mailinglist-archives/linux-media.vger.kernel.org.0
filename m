Return-Path: <linux-media+bounces-26670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0204A40F99
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1F13A4D43
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 15:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DD842AAF;
	Sun, 23 Feb 2025 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HoT5oSl7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6817D2;
	Sun, 23 Feb 2025 15:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740325597; cv=none; b=pdZSaxxj+chiJRfC6dUQaY/COj8durBZ0vSUEN19LYGilZUXsDdf4a1+ockfS9Cjxat8fx8XQGkPlj+X4ZFkvzI3ysJmjZVRrH1OXBHsiqbrc0S5c69Q5zq5ahU6Vo7WOp6C5s+7P+ZQJW6NCs0uE5ZeUJtgaBxQLODDbtIvcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740325597; c=relaxed/simple;
	bh=XBHaJozJe19Ofq8z+znyq0y1bg7oHV7bsZ5RaX/NEv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kli8Qyhpvxplt4LExDuRLeUqmyUGxgJhLhigWvmEbNxvIFFnsTpHpNwJpm529rXC3hY4vDvW4wiEbjAM49M0tzku2p4Gzek7rTWXmDyEGtVS5qelTyWPOyGD12tyA+qnuSjum7NDfDxVF59kqi4ARrmbhkD9OSOR8op6mGQgTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HoT5oSl7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D929D4DC;
	Sun, 23 Feb 2025 16:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740325508;
	bh=XBHaJozJe19Ofq8z+znyq0y1bg7oHV7bsZ5RaX/NEv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HoT5oSl71mfaPgy6gFBV+8/jFn5dJPUHB75LW/AVc47H8DWrhy2VuuBaA+hDBOwFx
	 JDkejo9y8hBuEiuln2yaJc1Q9Q8Se20XXyGCL6C36IlejRrqD7bgYvcwCIT9o32vCh
	 P1TMl2SFRAsqUgRAlqLSZeGlSLtDv1rchyeKMJAE=
Date: Sun, 23 Feb 2025 17:46:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 1/6] media: uvcvideo: Keep streaming state in the file
 handle
Message-ID: <20250223154617.GB27463@pendragon.ideasonboard.com>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
 <20250206-uvc-granpower-ng-v3-1-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206-uvc-granpower-ng-v3-1-32d0d7b0c5d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Feb 06, 2025 at 07:47:00PM +0000, Ricardo Ribalda wrote:
> Add a variable in the file handle state to figure out if a camera is in
> the streaming state or not.

s/\n/ / (and reflow) or s/$/\n/ depending on what you meant.

> This variable will be used in the future for power management policies.
> 
> Now that we are at it, make use of guards to simplify the code.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 15 +++++++++++----
>  drivers/media/usb/uvc/uvcvideo.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 93c6cdb23881..856eaa23e703 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -835,11 +835,17 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  	if (!uvc_has_privileges(handle))
>  		return -EBUSY;
>  
> -	mutex_lock(&stream->mutex);
> +	guard(mutex)(&stream->mutex);
> +
> +	if (handle->is_streaming)
> +		return 0;
> +
>  	ret = uvc_queue_streamon(&stream->queue, type);
> -	mutex_unlock(&stream->mutex);
> +	if (!ret)
> +		handle->is_streaming = true;
>  
>  	return ret;

Now that you use a mutex guard, you can write

	if (ret)
		return ret;

	handle->is_streaming = true;
	return 0;

apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  }
>  
>  static int uvc_ioctl_streamoff(struct file *file, void *fh,
> @@ -851,9 +857,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>  	if (!uvc_has_privileges(handle))
>  		return -EBUSY;
>  
> -	mutex_lock(&stream->mutex);
> +	guard(mutex)(&stream->mutex);
> +
>  	uvc_queue_streamoff(&stream->queue, type);
> -	mutex_unlock(&stream->mutex);
> +	handle->is_streaming = false;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..bc87e1f2c669 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -618,6 +618,7 @@ struct uvc_fh {
>  	struct uvc_streaming *stream;
>  	enum uvc_handle_state state;
>  	unsigned int pending_async_ctrls;
> +	bool is_streaming;
>  };
>  
>  struct uvc_driver {

-- 
Regards,

Laurent Pinchart

