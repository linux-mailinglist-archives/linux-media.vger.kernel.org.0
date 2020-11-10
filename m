Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78B22AD3D3
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 11:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgKJKbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 05:31:51 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44779 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726690AbgKJKbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 05:31:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQwCkl89cNanzcQwFk5Qw2; Tue, 10 Nov 2020 11:31:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605004308; bh=sSUZeBbALipBVaAcCxxvxF92gzHg1s0qI8782LffVyw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r5dPlNsY6mZo891vK/ccSQsEJK/hyKbIH9c8V+0MAAJmXvuCuJcBuJrvFw7nJ4nM/
         xT7BlXeu2gpLnnlbhheZLhB/+B2Ae5XtJVpQ9OrhJVNOdZjZNW/Z5FUbf/UcBFGR+d
         dO4F0qlSdJEFQxsmsDUa5L+Y+AEUIZe6n/7U07LiTkiSvjkA/QKsN129ryfRRkkHCe
         muGrXMdpuJznHNQXW8zr7vpedfO4Z0iljm4ouATil+lvqMg7knpf+ShuMTeVPEl9U+
         lSu04F5kHwAPf3EdciZA3MzS8jg3pYPBC6+9JSwgP45NO4BKSE+sVlIfi/Xqv+5kZV
         6jW80gMLNU1FQ==
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     thomas.haemmerle@wolfvision.net, gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
Date:   Tue, 10 Nov 2020 11:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAWwltG6ZRf8zb9NVmxM+GJc07KHQ0legS+bi2bENofERX9Ov++J4NgpnTW4kTWoq2PVSMqvkjvqR8LFb5woK3qSDRlhh2qO+zdhcIZKfzrh4yGT/Y/P
 FR9tmNzMa/vnUnzoKVqZGtsqwqyIhm4+0fopz8/JLiM3coXofsooegHBwOfZXHov4cDTFAFwZ/XTQBNF3G/J6i31/WksFu86aGm8jFGOLnU6V40jS30jQde3
 j4v+vrPu5Ivu8yKG7I5HrwMYOo3+BB3P/XT3DywAm156Vna6/D3fp74ISrmdD0xDZf4OmQNIpaoxLFKQdvJ4OFMZdZ+xaUuE2IEBS4z5VbTnJmclORtdPWN1
 olfhpIuELTEw286DPWj5AWj5mX2qFU5/pzpuK6tVp6YOhS0A6IG8nSVfZ24eMLzVoFst8hmD+Otk3nChVGxdhVHJT4P6vw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
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
> equals 0) and the video is disabled in `uvc_v4l2_release`, although
> another process potentially is streaming.
> 
> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
> keep track of the number of subscribers (limited to 1) because there we
> can guarantee for a userspace program utilizing UVC.
> Extend the `struct uvc_file_handle` with member `bool connected` to tag 
> it for a deactivation of the function.
> 
> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for another process actually using the
> device for UVC streaming.
> 
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> ---
> v2:
>  - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>    locked in v4l2-core) introduced in v1
>  - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>    connected
> 
>  drivers/usb/gadget/function/uvc.h      |  2 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 73da4f9a8d4c..0d0bcbffc8fd 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -117,6 +117,7 @@ struct uvc_device {
>  	enum uvc_state state;
>  	struct usb_function func;
>  	struct uvc_video video;
> +	unsigned int connections;
>  
>  	/* Descriptors */
>  	struct {
> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>  struct uvc_file_handle {
>  	struct v4l2_fh vfh;
>  	struct uvc_video *device;
> +	bool connected;
>  };
>  
>  #define to_uvc_file_handle(handle) \
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 67922b1355e6..aee4888e17b1 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -228,17 +228,57 @@ static int
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
> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
> +		return -EBUSY;
> +
> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (sub->type == UVC_EVENT_SETUP) {
> +		uvc->connections++;
> +		handle->connected = true;
> +		uvc_function_connect(uvc);
> +	}

This makes no sense. Why would subscribing to a SETUP event
mean that you are 'connected'?

It should be possible to open a V4L2 device node any number of times,
and any filehandle can subscribe to any event, but typically once
userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
then that filehandle is marked as the owner of the device and other
open filehandles are no longer allowed to allocate buffers or stream video.

See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.

Unfortunately this UVC gadget driver is rather old and is not using
these helper functions.

Running 'v4l2-compliance' will likely fail on a lot of tests for this
driver.

This driver probably could use some TLC.

Regards,

	Hans

> +
> +	return 0;
> +}
> +
> +static void uvc_v4l2_disable(struct uvc_device *uvc)
> +{
> +	if (--uvc->connections)
> +		return;
> +
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
> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
> +		uvc_v4l2_disable(uvc);
> +		handle->connected = false;
> +	}
> +
> +	return 0;
>  }
>  
>  static long
> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>  	handle->device = &uvc->video;
>  	file->private_data = &handle->vfh;
>  
> -	uvc_function_connect(uvc);
>  	return 0;
>  }
>  
> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
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
> +	if (handle->connected)
> +		uvc_v4l2_disable(uvc);
> +	mutex_unlock(&uvc->video.mutex);
>  
>  	file->private_data = NULL;
>  	v4l2_fh_del(&handle->vfh);
> 

