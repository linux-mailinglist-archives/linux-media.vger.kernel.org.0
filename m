Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5176C7B87
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjCXJfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjCXJft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:35:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AC213515;
        Fri, 24 Mar 2023 02:35:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C534CA49;
        Fri, 24 Mar 2023 10:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679650545;
        bh=No/DO1GsaTRkETyIPQl/9du9l/hUExXsGUorSh15rRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=beiLIsghgx23PtLimmTefPOAhoWUatWIFBF+t5wfAivHcBUbZOoyldVxUYdYs9qg+
         zYmxQBryG0YyAqs1T4QG/0/ECMbqs6SvXVRvFSU+nahjIOBhrIf3JuukLJ2FV5T5qI
         exJpYnXNjrcA3Vd8lak+9PqGW7s53iG45/8Yj2cY=
Date:   Fri, 24 Mar 2023 11:35:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 6/8] usb: gadget: uvc: try harder to find a valid format
Message-ID: <20230324093551.GI18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-6-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-6-e41f0c5d9d8e@pengutronix.de>
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

On Thu, Mar 23, 2023 at 12:41:14PM +0100, Michael Tretter wrote:
> The TRY_FMT call should try to avoid returning EINVAL. If the requested
> pixelformat is not supported by the driver, the driver should fall back
> to it's own default and only then fail the request.

It should actually never fail.

You may recall that I didn't like the TRY_FMT implementation, and I
still stand by the arguments I provided by then. If you want to handle
this properly, revert the commits that added format handling to the
driver.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_v4l2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 3f728f451ed5..c5983bb0a8d1 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -317,11 +317,15 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  		 fmt->fmt.pix.width, fmt->fmt.pix.height);
>  
>  	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
> +	if (!uformat)
> +		uformat = get_default_format(uvc);
>  	if (!uformat)
>  		return -EINVAL;
>  
>  	uframe = find_closest_frame_by_size(uvc, uformat,
>  				fmt->fmt.pix.width, fmt->fmt.pix.height);
> +	if (!uframe)
> +		uframe = get_default_frame(uvc, uformat);
>  	if (!uframe)
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart
