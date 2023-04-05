Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84516D737A
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 06:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236925AbjDEEni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 00:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbjDEEnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 00:43:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8697640C8;
        Tue,  4 Apr 2023 21:43:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64F355B8;
        Wed,  5 Apr 2023 06:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680669810;
        bh=1/zgwbk0HHZpH2fLrao2DhUrM/SdpsYEtdJ59e3tKI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuMoTS3RFqWamEJ0gYxWKt6QXUSJ9rZbv2JRGzQXS1QwopeB8KkanXIWFap6V3z8t
         m7eZGPRly//rRJfkxSc5b2hWSeFHAk8kd8AYftrdcSzxogXPJyWGY07foZ73OjYPlm
         m/2ja25j5ASGTZuUU8OUcSLgKgWed6RE6REFsqcY=
Date:   Wed, 5 Apr 2023 07:43:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [RFC] usb: gadget: uvc: sane shutdown on soft streamoff
Message-ID: <20230405044337.GQ9915@pendragon.ideasonboard.com>
References: <20230402200122.2919202-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230402200122.2919202-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

(CC'ing Dan)

Thank you for the patch.

On Sun, Apr 02, 2023 at 10:01:22PM +0200, Michael Grzeschik wrote:
> Pending requests in the gadget hardware get dequeued and returned with
> ECONNRESET when the available endpoint is not available anymore. This
> can be caused by an unplugged cable or the decision to shutdown the
> stream, e.g. by switching the alt setting.
> 
> In both cases the returned completion handler is marking the gadget
> with UVC_QUEUE_DISCONNECTED by calling uvcg_queue_cancel.
> 
> Since in userspace applications there might be two threads, one for the
> bufferqueueing and one to handle the uvc events. It is likely that the
> bufferqueueing thread did not receive the UVC_EVENT_STREAMOFF coming
> from the alt_setting change early enough and still tries to queue a
> buffer into the already disconnected marked device.

Does this require two threads in userspace, or can it also happen in a
single-threaded application ? It seems like a typical race condition
between a userspace ioctl and a kernel-generated event.

> This leads buf_prepare to return ENODEV, which usually makes the
> userspace application quit.
> 
> To fix the soft-shutdown case this patch is marking the alt setting
> change before disabling the endpoint. This way the still completing
> requests on the disabled endpoint can call uvcg_queue_cancel without
> marking the device disconnected.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> Hi Laurent!
> 
> We are running into this issue in gstreamer when the host is stopping
> the stream. In fact I am unsure if this is not also an issue when the
> real unplug will appear.

Isn't this something that should be fixed in userspace (possibly in
addition to a kernel change to make userspace's life easier) ? Userspace
should be able to gracefully handle the device getting stopped. What
GStreamer element are you using, and is it an issue with the GStreamer
element, or with the application ?

> Since the v4l2 device is available all the time, and the streamoff
> callback is cleaning up all the pending buffers in uvc_video_enable(0),
> also the ones that got queued in this short time window of:
> 
>  alt_setting(0) -> userspace event handling -> streamoff ioctl
> 
> Would it not be also possible to just drop the whole
> UVC_QUEUE_DISCONNECTED mechanism?

Do you mean accepting the buffers queued by userspace, even if the
driver knows (or can know) they will never be sent out ?

>  drivers/usb/gadget/function/f_uvc.c     | 3 ++-
>  drivers/usb/gadget/function/uvc_video.c | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 5e919fb6583301..01ab8c07d85be9 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -337,6 +337,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>  		if (uvc->state != UVC_STATE_STREAMING)
>  			return 0;
>  
> +		uvc->state = UVC_STATE_CONNECTED;
> +
>  		if (uvc->video.ep)
>  			usb_ep_disable(uvc->video.ep);
>  
> @@ -344,7 +346,6 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>  		v4l2_event.type = UVC_EVENT_STREAMOFF;
>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>  
> -		uvc->state = UVC_STATE_CONNECTED;
>  		return 0;
>  
>  	case 1:
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index dd1c6b2ca7c6f3..2f36fef3824f8e 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -265,9 +265,10 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  		queue->flags |= UVC_QUEUE_DROP_INCOMPLETE;
>  		break;
>  
> -	case -ESHUTDOWN:	/* disconnect from host. */
> +	case -ESHUTDOWN:	/* disconnect from host or streamoff pending */
>  		uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
> -		uvcg_queue_cancel(queue, 1);
> +		uvcg_queue_cancel(queue,
> +				  uvc->state != UVC_STATE_STREAMING ? 0 : 1);
>  		break;
>  
>  	default:

-- 
Regards,

Laurent Pinchart
