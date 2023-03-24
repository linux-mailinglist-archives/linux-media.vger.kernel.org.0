Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0170C6C7B70
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjCXJbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjCXJa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:30:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161CF23668;
        Fri, 24 Mar 2023 02:30:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 650413F1;
        Fri, 24 Mar 2023 10:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679650256;
        bh=zXYzPU/UODV9LePmfyEyshhcJt9A3t4VgjeQn7wx/UU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TS3AwnI5xqNtg+GP4U7Kl5h1Sx8m7VEbJ860YdqniECWACPfrSR1Th7Iq4TYn61Yx
         mQL0EquDCUMAwpi4ySixyBlZxI5QI5COwnOAgAp04afjNquU55aDROxs4fvgSqv2yZ
         cC34x3I9J5302XCgvnfdosMdVq16fOiBoLx4UFEg=
Date:   Fri, 24 Mar 2023 11:31:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 4/8] usb: gadget: uvc: move video format initialization
 to uvc_v4l2
Message-ID: <20230324093103.GF18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-4-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-4-e41f0c5d9d8e@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Mar 23, 2023 at 12:41:12PM +0100, Michael Tretter wrote:
> Move the setup of the initial video format to uvc_v4l2.c that handles
> all the format negotiation. This keeps all format setup and
> configuration code in uvc_v4l2.c and avoids scattering the format setup
> across multiple files.
> 
> Furthermore, it allows to setup the default format using the format
> configured in the configfs.

I'm afraid I don't see how that last sentence matches the patch.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/usb/gadget/function/f_uvc.c     |  2 ++
>  drivers/usb/gadget/function/uvc_v4l2.c  | 11 +++++++++++
>  drivers/usb/gadget/function/uvc_v4l2.h  |  3 +++
>  drivers/usb/gadget/function/uvc_video.c |  5 -----
>  4 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 5e919fb65833..a16c8f80a50a 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -434,6 +434,8 @@ uvc_register_video(struct uvc_device *uvc)
>  	struct usb_composite_dev *cdev = uvc->func.config->cdev;
>  	int ret;
>  
> +	uvc_init_default_format(uvc);
> +
>  	/* TODO reference counting. */
>  	memset(&uvc->vdev, 0, sizeof(uvc->vdev));
>  	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 4b8bf94e06fc..5620546eb43b 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -130,6 +130,17 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
>  	return uformat;
>  }
>  
> +void uvc_init_default_format(struct uvc_device *uvc)
> +{
> +	struct uvc_video *video = &uvc->video;
> +
> +	video->fcc = V4L2_PIX_FMT_YUYV;
> +	video->bpp = 16;
> +	video->width = 320;
> +	video->height = 240;
> +	video->imagesize = 320 * 240 * 2;
> +}
> +

Please place the function in a better location, not in the middle of
related helpers.

>  static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
>  					   struct uvcg_format *uformat,
>  					   u16 rw, u16 rh)
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.h b/drivers/usb/gadget/function/uvc_v4l2.h
> index 1576005b61fd..5c3a97de0776 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.h
> +++ b/drivers/usb/gadget/function/uvc_v4l2.h
> @@ -16,4 +16,7 @@
>  extern const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops;
>  extern const struct v4l2_file_operations uvc_v4l2_fops;
>  
> +struct uvc_device;
> +void uvc_init_default_format(struct uvc_device *uvc);
> +
>  #endif /* __UVC_V4L2_H__ */
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index dd1c6b2ca7c6..27ff9ef49e16 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -516,11 +516,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  		return -EINVAL;
>  
>  	video->uvc = uvc;
> -	video->fcc = V4L2_PIX_FMT_YUYV;
> -	video->bpp = 16;
> -	video->width = 320;
> -	video->height = 240;
> -	video->imagesize = 320 * 240 * 2;

Honestly I'm not sure I see any improvement with this change. The active
format stored in the uvc_video structure is initialized in the function
that initializes the uvc_video structure, and you're moving it to an
unrelated location. I don't like this.

>  
>  	/* Initialize the video buffers queue. */
>  	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,

-- 
Regards,

Laurent Pinchart
