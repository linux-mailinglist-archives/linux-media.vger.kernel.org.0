Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3F0543B12
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 20:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiFHSHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 14:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiFHSHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 14:07:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FE81086;
        Wed,  8 Jun 2022 11:07:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC9DC6CF;
        Wed,  8 Jun 2022 20:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654711620;
        bh=nUjnjrO0ubqFgAn3jpQL3Pi8YkDysyi/iXCXRvd6MEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzXjU/VAhX8EVixIuWzR07jvzlWtci2CqZOO/XuosXKQR0ZjqwsT8/ZWVLd5pmoHT
         dCDa5NHRumy+y6VIIiq/KlIaCMAiQQhR0cAHGq/2I+gaAVr56ZRVQnIU3M2nMEcSQ1
         N2kOZY7iq80QaiEzquFv1NJf4AYNkclREF+mN9SY=
Date:   Wed, 8 Jun 2022 21:06:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Dan Vacura <w36195@motorola.com>
Subject: Re: [RESEND v2 1/3] usb: gadget: uvc: calculate the number of
 request depending on framesize
Message-ID: <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
 <20220608110339.141036-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220608110339.141036-2-m.grzeschik@pengutronix.de>
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

On Wed, Jun 08, 2022 at 01:03:37PM +0200, Michael Grzeschik wrote:
> The current limitation of possible number of requests being handled is
> dependent on the gadget speed. It makes more sense to depend on the
> typical frame size when calculating the number of requests. This patch
> is changing this and is using the previous limits as boundaries for
> reasonable minimum and maximum number of requests.
> 
> For a 1080p jpeg encoded video stream with a maximum imagesize of
> e.g. 800kB with a maxburst of 8 and an multiplier of 1 the resulting
> number of requests is calculated to 49.
> 
>         800768         1
> nreqs = ------ * -------------- ~= 49
>           2      (1024 * 8 * 1)
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Tested-by: Dan Vacura <w36195@motorola.com>
> 
> ---
> v1 -> v2: - using clamp instead of min/max
>           - added calculation example to description
> 	  - commented the additional division by two in the code
> 
>  drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index d25edc3d2174e1..eb9bd9d32cd056 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -44,7 +44,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> -	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
> +	unsigned int req_size;
> +	unsigned int nreq;
>  
>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>  		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
> @@ -53,10 +54,16 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = video->imagesize;
>  
> -	if (cdev->gadget->speed < USB_SPEED_SUPER)
> -		video->uvc_num_requests = 4;
> -	else
> -		video->uvc_num_requests = 64;
> +	req_size = video->ep->maxpacket
> +		 * max_t(unsigned int, video->ep->maxburst, 1)
> +		 * (video->ep->mult);

No need for parentheses.

> +
> +	/* We divide by two, to increase the chance to run
> +	 * into fewer requests for smaller framesizes.
> +	 */

Could you please change the comment style to the more standard

	/*
	 * We divide by two, to increase the chance to run into fewer requests
	 * for smaller framesizes.
	 */

(with the text reflowed to 80 columns) ?

I'm however now sure where the division by 2 come from.

Furthermore, as far as I understand, the reason why the number of
requests was increased for superspeed devices (by you ;-)) was to avoid
underruns at higher speeds and keep the queue full. This is less of a
concern at lower speeds. Is there any drawback in increasing it
regardless of the speed ? Increased latency comes to mind, but is it a
problem in practice ?

> +	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
> +	nreq = clamp(nreq, 4U, 64U);
> +	video->uvc_num_requests = nreq;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
