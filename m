Return-Path: <linux-media+bounces-28871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF586A73D4E
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 18:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA63189BFF6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7772219A72;
	Thu, 27 Mar 2025 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rUivEjTP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4E1FF613;
	Thu, 27 Mar 2025 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743097972; cv=none; b=FQzw2YnFbOw+j9D+T/SVGivgtTa+3qts9pav/z2hCK5tBN7mB4XR8YFxQBwOyxX3ci3gHHQE6WtVL54kJwm2pqwwTvGfG2oWJUYZXZkcG1YPla0iUVWHCxdHCs3Ij+D3D2sZsKjhjwyc/UE8eRdFJxTYapD4AyeLXSvMGbSKej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743097972; c=relaxed/simple;
	bh=B4trpXe8O5u/J5Gdxudk+E4c7X8Ndwx0c+sAuF0EeW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqVy3olvLuFpom/yUBgjoKhxitJdRUWFiBUMZvBVa3Lh1x9qFcK1VPVpUh1AwHBQJSphrfZS63E6Gh7PzV5wiqS6NgdOPr+7d9/B1HrXSpMc2IEcuCvFT0pmNxNNfpOXzxUtrtRD5zzpGcCWqhTiBCTwaRaRp3qUGVH9ANmLODQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rUivEjTP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00327446;
	Thu, 27 Mar 2025 18:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743097860;
	bh=B4trpXe8O5u/J5Gdxudk+E4c7X8Ndwx0c+sAuF0EeW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUivEjTP7nGtGkL4dTD6kiAIiXieGi012rId2g15CaG167WZxKKti6AmzYIUycvIy
	 0HXbHPptbJSU2Ro43LViHiP0uOQlwOOPFfBgZZ7cR7uGv2cocHqXC0klE+rXfFh4do
	 sDCLlYt8AUSeW58LDAWULCoNqG+00Cc8w82mJOC0=
Date: Thu, 27 Mar 2025 19:52:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Message-ID: <20250327175225.GA11416@pendragon.ideasonboard.com>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 03, 2025 at 07:13:40PM +0000, Ricardo Ribalda wrote:
> Now we call uvc_pm_get/put from the device open/close. This low
> level of granularity might leave the camera powered on in situations
> where it is not needed.
> 
> Increase the granularity by increasing and decreasing the Power

You're decreasing the granularity, not increasing it.

> Management counter per ioctl. There are two special cases where the
> power management outlives the ioctl: async controls and streamon. Handle
> those cases as well.
> 
> In a future patch, we will remove the uvc_pm_get/put from open/close.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h |  1 +
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4e58476d305e..47188c7f96c7 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>  
>  		if (ctrl->handle) {
>  			WARN_ON(!ctrl->handle->pending_async_ctrls);
> -			if (ctrl->handle->pending_async_ctrls)
> +			if (ctrl->handle->pending_async_ctrls) {
>  				ctrl->handle->pending_async_ctrls--;
> +				uvc_pm_put(handle->chain->dev);

Shouldn't this be

				uvc_pm_put(ctrl->handle->chain->dev);

? In practice it won't make a difference as dev will be the same for
both, but it seems clearer.

> +			}
>  		}
>  
>  		ctrl->handle = new_handle;
>  		handle->pending_async_ctrls++;
> +		uvc_pm_get(handle->chain->dev);

Similarly, we should use ctrl->handle here too (including for the
pending_async_ctrls++).

>  		return;
>  	}
>  
> @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
>  	if (WARN_ON(!handle->pending_async_ctrls))
>  		return;
>  	handle->pending_async_ctrls--;
> +	uvc_pm_put(handle->chain->dev);
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
> +		uvc_pm_put(handle->stream->dev);
>  }
>  
>  /*
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index de1e105f7263..1c9ac72be58a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
>  	if (uvc_has_privileges(handle))
>  		uvc_queue_release(&stream->queue);
>  
> +	if (handle->is_streaming)
> +		uvc_pm_put(stream->dev);
> +
>  	/* Release the file handle. */
>  	uvc_dismiss_privileges(handle);
>  	v4l2_fh_del(&handle->vfh);
> @@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  		return ret;
>  
>  	handle->is_streaming = true;
> +	uvc_pm_get(stream->dev);
>  
>  	return 0;
>  }
> @@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>  	guard(mutex)(&stream->mutex);
>  
>  	uvc_queue_streamoff(&stream->queue, type);
> -	handle->is_streaming = false;
> +	if (handle->is_streaming) {
> +		handle->is_streaming = false;
> +		uvc_pm_put(stream->dev);
> +	}
>  
>  	return 0;
>  }
> @@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  	void __user *up = compat_ptr(arg);
>  	long ret;
>  
> +	guard(uvc_pm)(handle->stream->dev);
> +
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> @@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  }
>  #endif
>  
> +static long uvc_v4l2_video_ioctl2(struct file *file,
> +				  unsigned int cmd, unsigned long arg)
> +{
> +	struct uvc_fh *handle = file->private_data;
> +
> +	guard(uvc_pm)(handle->stream->dev);
> +
> +	return video_ioctl2(file, cmd, arg);
> +}
> +
>  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>  		    size_t count, loff_t *ppos)
>  {
> @@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= uvc_v4l2_open,
>  	.release	= uvc_v4l2_release,
> -	.unlocked_ioctl	= video_ioctl2,
> +	.unlocked_ioctl	= uvc_v4l2_video_ioctl2,

I'd have named this uvc_v4l2_unlocked_ioctl.

>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
>  #endif
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index fbe3649c7cd6..eb8e374fa4c5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
>  /* PM */
>  int uvc_pm_get(struct uvc_device *dev);
>  void uvc_pm_put(struct uvc_device *dev);
> +DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
>  
>  /* Controls */
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;

-- 
Regards,

Laurent Pinchart

