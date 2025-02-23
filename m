Return-Path: <linux-media+bounces-26691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F8A4104F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7850C3B8F6C
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 16:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6865D13B2A9;
	Sun, 23 Feb 2025 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FWBbLcyq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE868C11;
	Sun, 23 Feb 2025 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329770; cv=none; b=uLFgqEBsLmv8Q4B5XUBxA/1H2sK4IECeFwmuV/XH/42dSSU3IjWlFTf8ATC+Heb0Du8Jwqae09avaw72H3c4Rv+fz0TT3GZO76eE+5K9XJaV8KApVkb3sacFTbxTgf1BUlhboVu41QdAec0c0p9InI/dUZh8r7h3TgNemdprG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329770; c=relaxed/simple;
	bh=FA75n+VpqJkA0GeUzp3IUX+/lbRF3tts1VH+SPvvQJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSfgYXicTYYhROZb5PqBlNmNMbifF8pUowBsov7UVv/tTq/mwl/G60dZ6acQa4dkHG/t9Q7RW+ZZLYjYMEFBsirIGsw5fkMFpKX2A6W0OKBilHeD2euPgfPsJKClIQiM5P91ypg1WKQqkuzrYp2GMpSgSeGjNs/rI5WUC2WHGBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FWBbLcyq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CADD496;
	Sun, 23 Feb 2025 17:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740329678;
	bh=FA75n+VpqJkA0GeUzp3IUX+/lbRF3tts1VH+SPvvQJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWBbLcyqypBTFgTxjgaBpiDRYK5FOfpTUOUuLLpqoY2qslpzEJ3eIzAY4bgRiM28g
	 XPHfih3nDxCFMMlvjKqzSxTtVlcRQ/ftaMXGu04RDaQ+VyPl48G1ZgMQeULcD70H3x
	 vCUYF0lDq+e7tPeLtgK7vy70VeqI1jmiYrZpH51M=
Date: Sun, 23 Feb 2025 18:55:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 4/6] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Message-ID: <20250223165547.GE27463@pendragon.ideasonboard.com>
References: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
 <20250206-uvc-granpower-ng-v3-4-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206-uvc-granpower-ng-v3-4-32d0d7b0c5d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Feb 06, 2025 at 07:47:03PM +0000, Ricardo Ribalda wrote:
> Now we call uvc_status_get/put from the device open/close. This low
> level of granularity might leave the camera powered on in situations
> where it is not needed.
> 
> Increase the granularity by increasing and decreasing the Power
> Management counter per ioctl. There are two special cases where the
> power management outlives the ioctl: async controls and streamon. Handle
> those cases as well.
> 
> In a future patch, we will remove the uvc_status_get/put from open/close.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c | 26 +++++++++++++++++++++++---
>  2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4e58476d305e..97c1141a45b3 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>  
>  		if (ctrl->handle) {
>  			WARN_ON(!ctrl->handle->pending_async_ctrls);
> -			if (ctrl->handle->pending_async_ctrls)
> +			if (ctrl->handle->pending_async_ctrls) {
>  				ctrl->handle->pending_async_ctrls--;
> +				uvc_status_put(handle->chain->dev);

That's not the right API. uvc_status_* is about the status endpoint, not
power management in general.

> +			}
>  		}
>  
>  		ctrl->handle = new_handle;
>  		handle->pending_async_ctrls++;
> +		uvc_status_get(handle->chain->dev);
>  		return;
>  	}
>  
> @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>  	if (WARN_ON(!handle->pending_async_ctrls))
>  		return;
>  	handle->pending_async_ctrls--;
> +	uvc_status_put(handle->chain->dev);
>  }
>  
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> @@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>  	struct uvc_entity *entity;
> +	int i;
>  
>  	guard(mutex)(&handle->chain->ctrl_mutex);
>  
> @@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  		}
>  	}
>  
> -	WARN_ON(handle->pending_async_ctrls);
> +	if (!WARN_ON(handle->pending_async_ctrls))
> +		return;
> +
> +	for (i = 0; i < handle->pending_async_ctrls; i++)
> +		uvc_status_put(handle->stream->dev);
>  }
>  
>  /*
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5d4e967938af..63d1d06d3ff6 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -670,6 +670,9 @@ static int uvc_v4l2_release(struct file *file)
>  	if (uvc_has_privileges(handle))
>  		uvc_queue_release(&stream->queue);
>  
> +	if (handle->is_streaming)
> +		uvc_status_put(stream->dev);
> +
>  	/* Release the file handle. */
>  	uvc_dismiss_privileges(handle);
>  	v4l2_fh_del(&handle->vfh);
> @@ -832,8 +835,10 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  		return 0;
>  
>  	ret = uvc_queue_streamon(&stream->queue, type);
> -	if (!ret)
> +	if (!ret) {
>  		handle->is_streaming = true;
> +		uvc_status_get(stream->dev);
> +	}
>  
>  	return ret;
>  
> @@ -851,7 +856,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>  	guard(mutex)(&stream->mutex);
>  
>  	uvc_queue_streamoff(&stream->queue, type);
> -	handle->is_streaming = false;
> +	if (handle->is_streaming) {
> +		handle->is_streaming = false;
> +		uvc_status_put(stream->dev);
> +	}
>  
>  	return 0;
>  }
> @@ -1388,6 +1396,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  	void __user *up = compat_ptr(arg);
>  	long ret;
>  
> +	guard(uvc_status)(handle->stream->dev);
> +
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> @@ -1422,6 +1432,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  }
>  #endif
>  
> +static long uvc_v4l2_video_ioctl2(struct file *file,
> +				  unsigned int cmd, unsigned long arg)
> +{
> +	struct uvc_fh *handle = file->private_data;
> +
> +	guard(uvc_status)(handle->stream->dev);
> +
> +	return video_ioctl2(file, cmd, arg);
> +}
> +
>  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>  		    size_t count, loff_t *ppos)
>  {
> @@ -1507,7 +1527,7 @@ const struct v4l2_file_operations uvc_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= uvc_v4l2_open,
>  	.release	= uvc_v4l2_release,
> -	.unlocked_ioctl	= video_ioctl2,
> +	.unlocked_ioctl	= uvc_v4l2_video_ioctl2,
>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
>  #endif

-- 
Regards,

Laurent Pinchart

