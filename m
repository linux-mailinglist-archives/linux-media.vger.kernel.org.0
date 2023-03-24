Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85CD6C7B22
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjCXJVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjCXJVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:21:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7988F5B90;
        Fri, 24 Mar 2023 02:21:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E308A49;
        Fri, 24 Mar 2023 10:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679649664;
        bh=zYwSuTya3aJ0reQ/qPz/6FN/ReXq9gzJanF4mYKnhUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mbciE5kxT1my+hsa8Nd/mO8FMxfktca2FHzgXzMNlAZtHyyDbkMVtU5hN3eJdwnvG
         kJes7CDap3svHb1lFJrkrzi+xkB5LYiCxCCmtTNMZL1O/KUYVkwWxR1J8aQZVa3xNv
         xdp19uOsZvVujIkSj361dngDxquQNIlWqw+xbobI=
Date:   Fri, 24 Mar 2023 11:21:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/8] usb: gadget: uvc: use fourcc printk helper
Message-ID: <20230324092111.GD18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-1-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-1-e41f0c5d9d8e@pengutronix.de>
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

On Thu, Mar 23, 2023 at 12:41:09PM +0100, Michael Tretter wrote:
> There is a format helper for printing fourcc codes. Use that one instead
> of manually formatting the pixelformat for printing.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_v4l2.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 3f0a9795c0d4..13c7ba06f994 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -240,16 +240,13 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	struct uvc_video *video = &uvc->video;
>  	struct uvcg_format *uformat;
>  	struct uvcg_frame *uframe;
> -	u8 *fcc;
>  
>  	if (fmt->type != video->queue.queue.type)
>  		return -EINVAL;
>  
> -	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
> -	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
> -		fmt->fmt.pix.pixelformat,
> -		fcc[0], fcc[1], fcc[2], fcc[3],
> -		fmt->fmt.pix.width, fmt->fmt.pix.height);
> +	uvcg_dbg(&uvc->func, "Trying format %p4cc: %ux%u\n",
> +		 &fmt->fmt.pix.pixelformat,
> +		 fmt->fmt.pix.width, fmt->fmt.pix.height);
>  
>  	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
>  	if (!uformat)

-- 
Regards,

Laurent Pinchart
