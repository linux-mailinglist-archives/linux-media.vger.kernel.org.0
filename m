Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2902B49E1
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbgKPPtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 10:49:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730024AbgKPPtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 10:49:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6485CA1B;
        Mon, 16 Nov 2020 16:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605541743;
        bh=JjNB8jyzbiWrC+mvpSDXY1p6yTQUym9LKDULTNVaku0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f54wHIm6k4JdG7ikG+f14bxr2nVi60ACfqoo7nkxRxMCrQi/KVvgRrPQ/NjzPHccX
         SdtbRkm5vBHFsxNwcNPzyM3rdudwkUeTXdOKXoCG+7U+quEIYLEZlbEwGpDHKGiYdc
         E0g+JOW/KQcpfdUN9EtD2v0+nH2yM90BYXWLTCVQ=
Date:   Mon, 16 Nov 2020 17:48:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     thomas.haemmerle@wolfvision.net
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org, hverkuil@xs4all.nl,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: uvc: fix multiple opens
Message-ID: <20201116154858.GP6540@pendragon.ideasonboard.com>
References: <X6pmMFYmzO088p4g@kroah.com>
 <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

Thank you for the patch, and sorry for the late review. I was mostly
absent last week.

On Tue, Nov 10, 2020 at 03:30:15PM +0100, thomas.haemmerle@wolfvision.net wrote:
> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> 
> Currently, the UVC function is activated when open on the corresponding
> v4l2 device is called.
> On another open the activation of the function fails since the
> deactivation counter in `usb_function_activate` equals 0. However the
> error is not returned to userspace since the open of the v4l2 device is
> successful.
> 
> On a close the function is deactivated (since deactivation counter still
> equals 0) and the video is disabled in `uvc_v4l2_release`, although the
> UVC application potentially is streaming.
> 
> Move activation of UVC function to subscription on UVC_EVENT_SETUP
> because there we can guarantee for a userspace application utilizing UVC.
> Block subscription on UVC_EVENT_SETUP while another application already
> is subscribed to it, indicated by `bool func_connected` in
> `struct uvc_device`.
> Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> to tag it as the handle used by the userspace UVC application.
> 
> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for the actual UVC application.
> 
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> ---
> v3:
>  - replace `unsigned int connections` with `bool func_connected`
>  - rename `bool connected` to `bool is_uvc_app_handle`
> 
> v2:
>  - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>    locked in v4l2-core) introduced in v1
>  - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>    connected
> 
>  drivers/usb/gadget/function/uvc.h      |  2 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 54 +++++++++++++++++++++-----
>  2 files changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 73da4f9a8d4c..d6d0fd2dffa0 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -117,6 +117,7 @@ struct uvc_device {
>  	enum uvc_state state;
>  	struct usb_function func;
>  	struct uvc_video video;
> +	bool func_connected;
>  
>  	/* Descriptors */
>  	struct {
> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>  struct uvc_file_handle {
>  	struct v4l2_fh vfh;
>  	struct uvc_video *device;
> +	bool is_uvc_app_handle;
>  };
>  
>  #define to_uvc_file_handle(handle) \
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 67922b1355e6..3c0b7a969107 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -228,17 +228,55 @@ static int
>  uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>  			 const struct v4l2_event_subscription *sub)
>  {
> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> +	int ret;
> +
>  	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>  		return -EINVAL;
>  
> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
> +	if ((sub->type == UVC_EVENT_SETUP) && uvc->func_connected)

No need for the inner parentheses.

> +		return -EBUSY;
> +
> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (sub->type == UVC_EVENT_SETUP) {
> +		uvc->func_connected = true;
> +		handle->is_uvc_app_handle = true;
> +		uvc_function_connect(uvc);
> +	}
> +
> +	return 0;
> +}
> +
> +static void uvc_v4l2_disable(struct uvc_device *uvc)
> +{
> +	uvc->func_connected = false;
> +	uvc_function_disconnect(uvc);
> +	uvcg_video_enable(&uvc->video, 0);
> +	uvcg_free_buffers(&uvc->video.queue);
>  }
>  
>  static int
>  uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>  			   const struct v4l2_event_subscription *sub)
>  {
> -	return v4l2_event_unsubscribe(fh, sub);
> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> +	int ret;
> +
> +	ret = v4l2_event_unsubscribe(fh, sub);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((sub->type == UVC_EVENT_SETUP) && handle->is_uvc_app_handle) {

No need for the inner parentheses.

> +		uvc_v4l2_disable(uvc);
> +		handle->is_uvc_app_handle = false;

Calling uvc_v4l2_disable() here means that we'll stop everything when
unsubscribing from the event, which sounds like it could cause issues as
that behaviour is not expected. Wouldn't it be enough to only handle
this in uvc_v4l2_release() ?

> +	}
> +
> +	return 0;
>  }
>  
>  static long
> @@ -293,7 +331,6 @@ uvc_v4l2_open(struct file *file)
>  	handle->device = &uvc->video;
>  	file->private_data = &handle->vfh;
>  
> -	uvc_function_connect(uvc);
>  	return 0;
>  }
>  
> @@ -303,14 +340,11 @@ uvc_v4l2_release(struct file *file)
>  	struct video_device *vdev = video_devdata(file);
>  	struct uvc_device *uvc = video_get_drvdata(vdev);
>  	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
> -	struct uvc_video *video = handle->device;
> -
> -	uvc_function_disconnect(uvc);
>  
> -	mutex_lock(&video->mutex);
> -	uvcg_video_enable(video, 0);
> -	uvcg_free_buffers(&video->queue);
> -	mutex_unlock(&video->mutex);
> +	mutex_lock(&uvc->video.mutex);

Could you please keep keep the local video variable, and use
&video->mutex here ? The driver has a single video device at the moment,
but could be extended in the future with support for multiple video
devices in a single UVC device (lots of changes would be needed though).

> +	if (handle->is_uvc_app_handle)
> +		uvc_v4l2_disable(uvc);
> +	mutex_unlock(&uvc->video.mutex);

Note that this lock isn't the same as the lock taken by
__video_do_ioctl(), which alls uvc_v4l2_subscribe_event() and
uvc_v4l2_unsubscribe_event(). I think Hans got confused in his review,
it appears that there's nothing protecting concurrent access to
is_uvc_app_handle and func_connected in v3. I think you need to take the
driver-specific lock in uvc_v4l2_subscribe_event() and
uvc_v4l2_unsubscribe_event().

>  
>  	file->private_data = NULL;
>  	v4l2_fh_del(&handle->vfh);

-- 
Regards,

Laurent Pinchart
