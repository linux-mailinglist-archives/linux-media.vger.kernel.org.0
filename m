Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB6761E56D
	for <lists+linux-media@lfdr.de>; Sun,  6 Nov 2022 20:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiKFTCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 14:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiKFTCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 14:02:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF39FCEF;
        Sun,  6 Nov 2022 11:02:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC40B55A;
        Sun,  6 Nov 2022 20:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667761331;
        bh=9jNNY0kZG32GFSzV/yaiP+bRjGQWb6Q3XprqSSUCtxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnA80NOyGIGUNfLPIVkRJhoWu1VUt7vT77Vq24hG9mC6L7nEhDV6aV0vpzuLRa8vY
         Klsx+ZLrZuW8G0zkEE4bVRLpeZjEd8Qp2M5Hf2d3eWvmJprP+x3V5TJhBOr0qNuTT9
         44PL9tDt0hY2O+bZNle82AXnUSpzgXZYAT5A68Hg=
Date:   Sun, 6 Nov 2022 21:01:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: Re: [PATCH RESEND 2/2] usb: gadget: uvc: limit isoc_sg to super
 speed gadgets
Message-ID: <Y2gEoawCs8L0Kxce@pendragon.ideasonboard.com>
References: <20221026184212.366897-1-m.grzeschik@pengutronix.de>
 <20221026184212.366897-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221026184212.366897-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Wed, Oct 26, 2022 at 08:42:12PM +0200, Michael Grzeschik wrote:
> The overhead of preparing sg data is high for transfers with limited
> payload. When transferring isoc over high-speed usb the maximum payload

What exactly is causing a high overhead, and how big is it ?

> is rather small which is a good argument no to use sg. This patch is
> changing the uvc_video_encode_isoc_sg encode function only to be used
> for super speed gadgets.
> 
> Cc: stable <stable@kernel.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> Since the last time the patch was send, I saw some issues regarding
> the use of the vaddr. I thought there was a fix needed in this code.
> 
> But the problem was to be found in the videobuf2-dma-sg vmap/vunmap
> implementation. So this patch stays unchanged and is save to be applied,
> if the corresponding videobuf2-dma-sg patch is applied before it.
> 
>  drivers/usb/gadget/function/uvc_queue.c | 9 +++------
>  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index ec500ee499eed1..31c50ba1774f0d 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -84,12 +84,9 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  		return -ENODEV;
>  
>  	buf->state = UVC_BUF_STATE_QUEUED;
> -	if (queue->use_sg) {
> -		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
> -		buf->sg = buf->sgt->sgl;
> -	} else {
> -		buf->mem = vb2_plane_vaddr(vb, 0);
> -	}
> +	buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
> +	buf->sg = buf->sgt->sgl;

vb2_dma_sg_plane_desc() is defined as

static inline struct sg_table *vb2_dma_sg_plane_desc(
		struct vb2_buffer *vb, unsigned int plane_no)
{
	return (struct sg_table *)vb2_plane_cookie(vb, plane_no);
}

and vb2_plane_cookie() as

void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no)
{
	if (plane_no >= vb->num_planes || !vb->planes[plane_no].mem_priv)
		return NULL;

	return call_ptr_memop(cookie, vb, vb->planes[plane_no].mem_priv);
}

If the queue isn't using scatter-gather (use_sg == false), the cookie
operation will not be defined, and buf->sgt will be NULL. Dereferencing
it will thus segfault.

> +	buf->mem = vb2_plane_vaddr(vb, 0);
>  	buf->length = vb2_plane_size(vb, 0);
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		buf->bytesused = 0;
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index bb037fcc90e69e..5081eb3bc5484c 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -448,6 +448,9 @@ static void uvcg_video_pump(struct work_struct *work)
>   */
>  int uvcg_video_enable(struct uvc_video *video, int enable)
>  {
> +	struct uvc_device *uvc = video->uvc;
> +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
> +	struct usb_gadget *gadget = cdev->gadget;
>  	unsigned int i;
>  	int ret;
>  
> @@ -479,9 +482,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  	if (video->max_payload_size) {
>  		video->encode = uvc_video_encode_bulk;
>  		video->payload_size = 0;
> -	} else
> -		video->encode = video->queue.use_sg ?
> +	} else {
> +		video->encode = (video->queue.use_sg &&
> +				 !(gadget->speed <= USB_SPEED_HIGH)) ?
>  			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
> +	}
>  
>  	video->req_int_count = 0;
>  

-- 
Regards,

Laurent Pinchart
