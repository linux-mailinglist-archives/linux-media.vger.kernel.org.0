Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BBB543B9F
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 20:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiFHSlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 14:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiFHSli (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 14:41:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6ED15735;
        Wed,  8 Jun 2022 11:41:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 069D46CF;
        Wed,  8 Jun 2022 20:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654713695;
        bh=Quvq/+VUWrTeqaEeXTg/GHPptPCG9G08+Df1UOZuV20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rk/I+P8L7SzlhE4Bx59HBrI+vTGDw4vLTcBJ8wq2LAJIFvk+m9pLj8ZYeONTHecnd
         /sFFQ1ivwSsNtPDYLrlcSim4DkjX9/LKgEYCdZgYHX2/5+/qdgzvEwpC2MYoi2QMI/
         f3YPm0yOzwp+ikT6sAhDQ9oAXSuyvEu/gBswfjkc=
Date:   Wed, 8 Jun 2022 21:41:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        kernel@pengutronix.de
Subject: Re: [RESEND v2 2/3] usb: gadget: uvc: increase worker prio to
 WQ_HIGHPRI
Message-ID: <YqDtWkUbp4LPBRxS@pendragon.ideasonboard.com>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
 <20220608110339.141036-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220608110339.141036-3-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Wed, Jun 08, 2022 at 01:03:38PM +0200, Michael Grzeschik wrote:
> Likewise to the uvcvideo hostside driver, this patch is changing the
> simple workqueue to an async_wq with higher priority. This ensures that
> the worker will not be scheduled away while the video stream is handled.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: - added destroy_workqueue in uvc_function_unbind
>           - reworded comment above allow_workqueue
> 
>  drivers/usb/gadget/function/f_uvc.c     | 4 ++++
>  drivers/usb/gadget/function/uvc.h       | 1 +
>  drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
>  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>  4 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index d3feeeb50841b8..dcc5f057810973 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -891,10 +891,14 @@ static void uvc_function_unbind(struct usb_configuration *c,
>  {
>  	struct usb_composite_dev *cdev = c->cdev;
>  	struct uvc_device *uvc = to_uvc(f);
> +	struct uvc_video *video = &uvc->video;
>  	long wait_ret = 1;
>  
>  	uvcg_info(f, "%s()\n", __func__);
>  
> +	if (video->async_wq)
> +		destroy_workqueue(video->async_wq);
> +
>  	/* If we know we're connected via v4l2, then there should be a cleanup
>  	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
>  	 * though the video device removal uevent. Allow some time for the
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 58e383afdd4406..1a31e6c6a5ffb8 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -88,6 +88,7 @@ struct uvc_video {
>  	struct usb_ep *ep;
>  
>  	struct work_struct pump;
> +	struct workqueue_struct *async_wq;
>  
>  	/* Frame parameters */
>  	u8 bpp;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index fd8f73bb726dd1..fddc392b8ab95d 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  		return ret;
>  
>  	if (uvc->state == UVC_STATE_STREAMING)
> -		schedule_work(&video->pump);
> +		queue_work(video->async_wq, &video->pump);
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index a9bb4553db847e..9a9101851bc1e8 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -277,7 +277,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  	spin_unlock_irqrestore(&video->req_lock, flags);
>  
>  	if (uvc->state == UVC_STATE_STREAMING)
> -		schedule_work(&video->pump);
> +		queue_work(video->async_wq, &video->pump);
>  }
>  
>  static int
> @@ -478,7 +478,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  
>  	video->req_int_count = 0;
>  
> -	schedule_work(&video->pump);
> +	queue_work(video->async_wq, &video->pump);
>  
>  	return ret;
>  }
> @@ -492,6 +492,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	spin_lock_init(&video->req_lock);
>  	INIT_WORK(&video->pump, uvcg_video_pump);
>  
> +	/* Allocate a work queue for asynchronous video pump handler. */
> +	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);

Let's call it "uvcgadget" (or "uvc gadget", "uvc-gadget", ...) as
"uvcvideo" refers to the host side driver.

I'm still a bit worried about WQ_UNBOUND and the risk of running work
items in parallel on different CPUs. uvcg_video_pump() looks mostly
safe, as it protects video->req_free with a spinlock, and the buffer
queue with another spinlock. The req_int_count increment at the end of
the loop would be unsafe though.

Could we get to the bottom of this and find out whether or not the work
items can be executed in parallel ?

> +	if (!video->async_wq)
> +		return -EINVAL;
> +
>  	video->uvc = uvc;
>  	video->fcc = V4L2_PIX_FMT_YUYV;
>  	video->bpp = 16;

-- 
Regards,

Laurent Pinchart
