Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB4C421AE1
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 01:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhJDXzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 19:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJDXzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 19:55:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FB8C061745;
        Mon,  4 Oct 2021 16:53:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8785125B;
        Tue,  5 Oct 2021 01:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633391635;
        bh=8bYjdV2YZpFll6rhoYC6RtgvvGcTbNSzWfFKX1bB/i0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i3x89jkGzjFkKe6UKDUgmFTYdfAK0lffGiWLmcAWIQ3bST1kEd4qNJTjCIjYQ5YUF
         Qzv44Z8hBp2DsVpXVkWz3DKsfvxRJbJ/cjCFV50j/9HpJsA8HuHVqLxvaWa8Fc/6bI
         pSZfxt9UId8zwl2tmap53cJO2ac2dy+M6/vKOLpM=
Date:   Tue, 5 Oct 2021 02:53:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [RESEND PATCH v4] usb: gadget: uvc: fix multiple opens
Message-ID: <YVuUDOf+BDTxe/IR@pendragon.ideasonboard.com>
References: <87pn261h4c.fsf@kernel.org>
 <20211003201355.24081-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211003201355.24081-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for resending this.

On Sun, Oct 03, 2021 at 10:13:55PM +0200, Michael Grzeschik wrote:
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
> because there we can guarantee for a userspace application utilizing
> UVC.
> Block subscription on UVC_EVENT_SETUP while another application already
> is subscribed to it, indicated by `bool func_connected` in
> `struct uvc_device`.
> Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> to tag it as the handle used by the userspace UVC application.

Reflowing the paragraph would be nice (this could be done when applying
the patch, or not at all).

> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for the actual UVC application.
> 
> Reviewed-By: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Felipe, please let me know if you want me to take this in my tree and
issue a pull request, otherwise I'll assume you'll pick it up.

> ---
> v4:
>   - remove unnecessary inner parentheses
>   - keep and use the local video variable in `uvc_v4l2_release()`
> 
> v3:
>   - replace `unsigned int connections` with `bool func_connected`
>   - rename `bool connected` to `bool is_uvc_app_handle`
> 
> v2:
>   - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>   locked in v4l2-core) introduced in v1
> - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>   connected
> ---
>  drivers/usb/gadget/function/uvc.h      |  2 ++
>  drivers/usb/gadget/function/uvc_v4l2.c | 49 ++++++++++++++++++++++----
>  2 files changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 255a61bd6a6a8..9d5f17b551bbd 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -126,6 +126,7 @@ struct uvc_device {
>  	enum uvc_state state;
>  	struct usb_function func;
>  	struct uvc_video video;
> +	bool func_connected;
>  
>  	/* Descriptors */
>  	struct {
> @@ -156,6 +157,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>  struct uvc_file_handle {
>  	struct v4l2_fh vfh;
>  	struct uvc_video *device;
> +	bool is_uvc_app_handle;
>  };
>  
>  #define to_uvc_file_handle(handle) \
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 4ca89eab61590..197c26f7aec63 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -227,17 +227,55 @@ static int
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
> +	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
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
> +	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
> +		uvc_v4l2_disable(uvc);
> +		handle->is_uvc_app_handle = false;
> +	}
> +
> +	return 0;
>  }
>  
>  static long
> @@ -292,7 +330,6 @@ uvc_v4l2_open(struct file *file)
>  	handle->device = &uvc->video;
>  	file->private_data = &handle->vfh;
>  
> -	uvc_function_connect(uvc);
>  	return 0;
>  }
>  
> @@ -304,11 +341,9 @@ uvc_v4l2_release(struct file *file)
>  	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>  	struct uvc_video *video = handle->device;
>  
> -	uvc_function_disconnect(uvc);
> -
>  	mutex_lock(&video->mutex);
> -	uvcg_video_enable(video, 0);
> -	uvcg_free_buffers(&video->queue);
> +	if (handle->is_uvc_app_handle)
> +		uvc_v4l2_disable(uvc);
>  	mutex_unlock(&video->mutex);
>  
>  	file->private_data = NULL;

-- 
Regards,

Laurent Pinchart
