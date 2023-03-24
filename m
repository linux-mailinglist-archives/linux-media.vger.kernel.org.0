Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9410F6C7926
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 08:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjCXHo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 03:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjCXHo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 03:44:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDCD1D928;
        Fri, 24 Mar 2023 00:44:25 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA265A49;
        Fri, 24 Mar 2023 08:44:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679643863;
        bh=2Tapk5XEOQVqQ5UEO4XSEevk9flH+97v0R3Cx7Crdfw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RqWzXHTeQpLEObA35yBDAMaErWpznI7fIhwe01EGNff+8dliGLy2wIpxz4nIRH+5j
         JRq0EaPVDnpsfqni3H9fol23cBDxo9IsBf0DABfOI7a8r8BPmI222aMPeupgJZrYbx
         QZvrsKFF29EkC0ZdQoHkOzFR8KglALVOisIur27E=
Message-ID: <562c5bf2-eeb0-b579-99b3-5a1a18b132b3@ideasonboard.com>
Date:   Fri, 24 Mar 2023 07:44:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] usb: gadget: uvc: use fourcc printk helper
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-1-e41f0c5d9d8e@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-1-e41f0c5d9d8e@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Michael

On 23/03/2023 11:41, Michael Tretter wrote:
> There is a format helper for printing fourcc codes. Use that one instead
> of manually formatting the pixelformat for printing.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/usb/gadget/function/uvc_v4l2.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 3f0a9795c0d4..13c7ba06f994 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -240,16 +240,13 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>   	struct uvc_video *video = &uvc->video;
>   	struct uvcg_format *uformat;
>   	struct uvcg_frame *uframe;
> -	u8 *fcc;
>   
>   	if (fmt->type != video->queue.queue.type)
>   		return -EINVAL;
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
>   	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
>   	if (!uformat)
>
