Return-Path: <linux-media+bounces-30741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D1A977B1
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EED16B011
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DE32D9964;
	Tue, 22 Apr 2025 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TucAG4h6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47932BF3D6;
	Tue, 22 Apr 2025 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354280; cv=none; b=ODwA8HBIz1pL7DgQIC8p5UndK+V30bQcaVH/x2WbONpe6H3rNjwUfyFIb0pRneienAqJxJbVFEOAHNQX5AzU7Ham/ooKy4W6BvJRmnG6jujEqr5KDDpNIu5EhATvGvcUVy2GN/Ix424xyV9HstgB+dXYO7OND1IJEFSZRhgyqEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354280; c=relaxed/simple;
	bh=KWfGF05REUEw1tIqyyANSl6LSB5a2FrYHtC9nacIlhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqIeWH4f/Lv6BYScOO/BhEazZaImFDhDkmOrD4Vq0JgmVN/XZliXBZzdTAGOSEs+UBLCWK9NIQ1OY+ORL0Bu2jgfhVakcRbyoxQatqFJYzW65FeQvU42XW6wl//xCh+jmLDlkMwQcunxIR2OH5QBUeBczVYPfdooLreVIPKfsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TucAG4h6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2AD610D;
	Tue, 22 Apr 2025 22:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745354275;
	bh=KWfGF05REUEw1tIqyyANSl6LSB5a2FrYHtC9nacIlhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TucAG4h6omXkU+ZxeI+bKA2sRd74Gv4kOKWDu81kMLVz4ha46yz97rwyDvFlqxThJ
	 nUW771WZUDWbPzjYX8IZAvgmbf+TC5/ov8k7A6T9xBB0CpeCOQ8NQyyuciHVByNyYz
	 ORMtD3Eu0SdXS8fHbSTw5Zo0DYR82qCPIEPGIv1o=
Date: Tue, 22 Apr 2025 23:37:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v6 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Message-ID: <20250422203753.GM17813@pendragon.ideasonboard.com>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-3-35a2357ff348@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327-uvc-granpower-ng-v6-3-35a2357ff348@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 27, 2025 at 09:05:29PM +0000, Ricardo Ribalda wrote:
> Now we call uvc_pm_get/put from the device open/close. This low
> level of granularity might leave the camera powered on in situations
> where it is not needed.
> 
> Increase the granularity by increasing and decreasing the Power
> Management counter per ioctl. There are two special cases where the
> power management outlives the ioctl: async controls and streamon. Handle
> those cases as well.
> 
> In a future patch, we will remove the uvc_pm_get/put from open/close.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 37 +++++++++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvc_v4l2.c | 39 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index cbf19aa1d82374a08cf79b6a6787fa348b83523a..3fad289e41fd5a757f8dcf30a6238c694fc4250c 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1812,38 +1812,49 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> -static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> -				struct uvc_fh *new_handle)
> +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> +			       struct uvc_fh *new_handle)
>  {
>  	lockdep_assert_held(&handle->chain->ctrl_mutex);
>  
>  	if (new_handle) {
> +		int ret;
> +
>  		if (ctrl->handle)
>  			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
>  					     "UVC non compliance: Setting an async control with a pending operation.");
>  
>  		if (new_handle == ctrl->handle)
> -			return;
> +			return 0;
>  
>  		if (ctrl->handle) {
>  			WARN_ON(!ctrl->handle->pending_async_ctrls);
>  			if (ctrl->handle->pending_async_ctrls)
>  				ctrl->handle->pending_async_ctrls--;
> +			ctrl->handle = new_handle;
> +			handle->pending_async_ctrls++;

As commented previously, your usage of the handle variable is confusing.

			ctrl->handle->pending_async_ctrls++;

> +			return 0;
>  		}
>  
> +		ret = uvc_pm_get(handle->chain->dev);
> +		if (ret)
> +			return ret;
> +
>  		ctrl->handle = new_handle;
>  		handle->pending_async_ctrls++;

  		ctrl->handle->pending_async_ctrls++;

> -		return;
> +		return 0;
>  	}
>  
>  	/* Cannot clear the handle for a control not owned by us.*/
>  	if (WARN_ON(ctrl->handle != handle))
> -		return;
> +		return -EINVAL;
>  
>  	ctrl->handle = NULL;
>  	if (WARN_ON(!handle->pending_async_ctrls))
> -		return;
> +		return -EINVAL;
>  	handle->pending_async_ctrls--;
> +	uvc_pm_put(handle->chain->dev);
> +	return 0;
>  }
>  
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> @@ -2137,15 +2148,16 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> +		if (!rollback && handle && !ret &&
> +		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> +
>  		if (ret < 0) {
>  			if (err_ctrl)
>  				*err_ctrl = ctrl;
>  			return ret;
>  		}
>  
> -		if (!rollback && handle &&
> -		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
>  	return 0;
> @@ -3222,6 +3234,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>  	struct uvc_entity *entity;
> +	int i;
>  
>  	guard(mutex)(&handle->chain->ctrl_mutex);
>  
> @@ -3236,7 +3249,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
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
> index 1d5be045d04ecbf17e65e14b390e494a294b735f..8bccf7e17528b62f2594c0dad99405034532973d 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -697,6 +697,9 @@ static int uvc_v4l2_release(struct file *file)
>  	if (uvc_has_privileges(handle))
>  		uvc_queue_release(&stream->queue);
>  
> +	if (handle->is_streaming)
> +		uvc_pm_put(stream->dev);
> +
>  	/* Release the file handle. */
>  	uvc_dismiss_privileges(handle);
>  	v4l2_fh_del(&handle->vfh);
> @@ -862,6 +865,11 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  	if (ret)
>  		return ret;
>  
> +	ret = uvc_pm_get(stream->dev);

Shouldn't this be done before calling uvc_queue_streamon() ? There's
another PM reference being held by the ioctl handler, but if the code is
refactored later, it would be good to make sure we resume the device
before starting streaming.

> +	if (ret) {
> +		uvc_queue_streamoff(&stream->queue, type);
> +		return ret;
> +	}
>  	handle->is_streaming = true;
>  
>  	return 0;
> @@ -879,7 +887,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
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
> @@ -1378,9 +1389,11 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
>  #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
>  #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
>  
> +DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
>  static long uvc_v4l2_compat_ioctl32(struct file *file,
>  		     unsigned int cmd, unsigned long arg)
>  {
> +	struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
>  	struct uvc_fh *handle = file->private_data;
>  	union {
>  		struct uvc_xu_control_mapping xmap;
> @@ -1389,6 +1402,12 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  	void __user *up = compat_ptr(arg);
>  	long ret;
>  
> +	ret = uvc_pm_get(handle->stream->dev);
> +	if (ret)
> +		return ret;
> +
> +	uvc_device = handle->stream->dev;

Ouch... That's not nice very :-/

If you want to use the cleanup API, I think we could use guards with an
init function such as

struct uvc_device *__uvc_pm_get_init(struct uvc_device *dev, int *ret)
{
	*ret = uvc_pm_get(dev);
	return *ret ? NULL : dev;
}

You can use DEFINE_CLASS() instead of DEFINE_GUARD() to control the
arguments to the init function. Users of the guard could do

	int ret;

	guard(uvc_pm)(dev, &ret);
	if (ret)
		return ret;

	...

Another, simpler option would be to replace returns with breaks in
uvc_v4l2_compat_ioctl32(). I'm tempted to do that in this patch, and
switching to the cleanup API as a patch on top if desired.

> +
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> @@ -1423,6 +1442,22 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  }
>  #endif
>  
> +static long uvc_v4l2_unlocked_ioctl(struct file *file,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	struct uvc_fh *handle = file->private_data;
> +	int ret;
> +
> +	ret = uvc_pm_get(handle->stream->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = video_ioctl2(file, cmd, arg);
> +
> +	uvc_pm_put(handle->stream->dev);
> +	return ret;
> +}
> +
>  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>  		    size_t count, loff_t *ppos)
>  {
> @@ -1507,7 +1542,7 @@ const struct v4l2_file_operations uvc_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= uvc_v4l2_open,
>  	.release	= uvc_v4l2_release,
> -	.unlocked_ioctl	= video_ioctl2,
> +	.unlocked_ioctl	= uvc_v4l2_unlocked_ioctl,
>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
>  #endif

-- 
Regards,

Laurent Pinchart

