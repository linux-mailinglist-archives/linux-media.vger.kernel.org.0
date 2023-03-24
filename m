Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057C16C7B7D
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjCXJdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXJdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:33:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589B8CDED;
        Fri, 24 Mar 2023 02:33:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0C4A49;
        Fri, 24 Mar 2023 10:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679650420;
        bh=qFrZZiUKY+bN9LQwNGU3znQwbxsGGHRwqnuTryVGD78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqFgSqiaBKxAFBE4nIUAheacUWQcLzNIPPoPXOD7yVQm0GMmdYWvQOrLDwryrKeu3
         UwKpsOnyL4LIVC1a+fLnooLPknc/KRAemvhI1mmouxepsgBFw6pTK3oSVDzdjuRwP/
         i0X5nyAwNz4BCwUhdmaxLutcZGBuK3Xrhz12cyIg=
Date:   Fri, 24 Mar 2023 11:33:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 7/8] usb: gadget: uvc: add colorspace handling
Message-ID: <20230324093346.GH18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-7-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-7-e41f0c5d9d8e@pengutronix.de>
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

On Thu, Mar 23, 2023 at 12:41:15PM +0100, Michael Tretter wrote:
> Store the values of the configured color space in the driver. This
> allows the user space to set the color space and re-read the set values
> later.
> 
> UVC allows to announce the colorspace in the USB descriptors. The values
> of the descriptors are not evaluated by the driver, yet. Thus, the
> default is always the default specified by UVC and not the configured
> default.

As with format handling and frame interval handling, I don't like this.
It's useless code that userspace won't exercise.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc.h      |  4 ++++
>  drivers/usb/gadget/function/uvc_v4l2.c | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 100475b1363e..6b4ab3e07173 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -96,6 +96,10 @@ struct uvc_video {
>  	unsigned int width;
>  	unsigned int height;
>  	unsigned int imagesize;
> +	enum v4l2_colorspace colorspace;
> +	enum v4l2_ycbcr_encoding ycbcr_enc;
> +	enum v4l2_quantization quantization;
> +	enum v4l2_xfer_func xfer_func;
>  	struct mutex mutex;	/* protects frame parameters */
>  
>  	unsigned int uvc_num_requests;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index c5983bb0a8d1..673532ff0faa 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -180,6 +180,11 @@ void uvc_init_default_format(struct uvc_device *uvc)
>  		video->height = 240;
>  		video->imagesize = 320 * 240 * 2;
>  
> +		video->colorspace = V4L2_COLORSPACE_SRGB;
> +		video->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		video->xfer_func = V4L2_XFER_FUNC_SRGB;
> +		video->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +
>  		return;
>  	}
>  
> @@ -196,6 +201,14 @@ void uvc_init_default_format(struct uvc_device *uvc)
>  	video->width = uframe->frame.w_width;
>  	video->height = uframe->frame.w_height;
>  	video->imagesize = uvc_get_frame_size(uformat, uframe);
> +
> +	if (uformat->type == UVCG_UNCOMPRESSED)
> +		video->colorspace = V4L2_COLORSPACE_SRGB;
> +	else
> +		video->colorspace = V4L2_COLORSPACE_JPEG;
> +	video->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	video->xfer_func = V4L2_XFER_FUNC_SRGB;
> +	video->ycbcr_enc = V4L2_YCBCR_ENC_601;
>  }
>  
>  static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
> @@ -294,7 +307,12 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	fmt->fmt.pix.field = V4L2_FIELD_NONE;
>  	fmt->fmt.pix.bytesperline = video->bpp * video->width / 8;
>  	fmt->fmt.pix.sizeimage = video->imagesize;
> -	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	fmt->fmt.pix.colorspace = video->colorspace;
> +	fmt->fmt.pix.ycbcr_enc = video->ycbcr_enc;
> +	fmt->fmt.pix.quantization = video->quantization;
> +	fmt->fmt.pix.xfer_func = video->xfer_func;
> +
>  	fmt->fmt.pix.priv = 0;
>  
>  	return 0;
> @@ -335,7 +353,12 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
>  	fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
>  	fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
> -	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	fmt->fmt.pix.colorspace = video->colorspace;
> +	fmt->fmt.pix.ycbcr_enc = video->ycbcr_enc;
> +	fmt->fmt.pix.quantization = video->quantization;
> +	fmt->fmt.pix.xfer_func = video->xfer_func;
> +
>  	fmt->fmt.pix.priv = 0;
>  
>  	return 0;
> @@ -359,6 +382,11 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	video->height = fmt->fmt.pix.height;
>  	video->imagesize = fmt->fmt.pix.sizeimage;
>  
> +	video->colorspace = fmt->fmt.pix.colorspace;
> +	video->ycbcr_enc = fmt->fmt.pix.ycbcr_enc;
> +	video->quantization = fmt->fmt.pix.quantization;
> +	video->xfer_func = fmt->fmt.pix.xfer_func;
> +
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart
