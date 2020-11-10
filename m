Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780CC2AD16F
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 09:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbgKJIj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 03:39:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730116AbgKJIj4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 03:39:56 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD8E020731;
        Tue, 10 Nov 2020 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604997595;
        bh=PXiAAftzN6GduD3leXdMMam7ZG0s3JyEEMG4p6SdMvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G9nkPdrWtPrJduPcSdxHmqQpUnc0aHS598O0eKE8RN4F3wOqBYdHhwl40XikGeC6u
         d2KyuQ1Zz6/EZ+07G7F9QskpEHC3YJ6CDjP97u8EJxstu+OmWTlwd4APq0fdlhSX1d
         zgFGvmXo6zRmpFOjP9gbPmwF6STfNC3h6RcPUu4g=
Date:   Tue, 10 Nov 2020 09:40:51 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     thomas.haemmerle@wolfvision.net
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
Message-ID: <X6pSExWwSoHeSldW@kroah.com>
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 09:25:04AM +0100, thomas.haemmerle@wolfvision.net wrote:
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

What protects these two fields you are adding?

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

Are you sure you can't handle more than one connection?

If so, why is it an integer and not just a boolean?

And what prevents the value from changing right after you test it here?

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
> +
> +	return 0;
> +}
> +
> +static void uvc_v4l2_disable(struct uvc_device *uvc)
> +{
> +	if (--uvc->connections)
> +		return;
> +

What prevents "connections" from changing right after testing it here?

thanks,

greg k-h
