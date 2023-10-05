Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6278C7BA511
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 18:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241059AbjJEQNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 12:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240983AbjJEQMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 12:12:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767AE86AC;
        Thu,  5 Oct 2023 01:17:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C2AA57E;
        Thu,  5 Oct 2023 10:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696493721;
        bh=JCbSyjyhMKQuqISnzlfjMnXI+rKLP69iM7FKg2G6358=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RT/3WqNuQbT9N8Y+FbFAmfb3lEqddMvX5OTSd0QZD7kvRoaulQOF/9A6dVCpfDocU
         0ygx9VlhbDu093b2Olwz40CuO/JKi67drQgtE3oMIm6CCD8h7ajfpKtjGQplnYitP3
         J6kpEbPoNl+bg+oE/M8iOi74RLmK4kzBsje6/b6Q=
Date:   Thu, 5 Oct 2023 11:17:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <20231005081716.GA13853@pendragon.ideasonboard.com>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> Since the uvc-video gadget driver is using the v4l2 interface,
> the streamon and streamoff can be triggered at any times. To ensure
> that the pump worker will be closed as soon the userspace is
> calling streamoff we synchronize the state of the gadget ensuring
> the pump worker to bail out.

I'm sorry but I really dislike this. Not only does the patch fail to
ensure real synchronization, as the uvcg_video_pump() function still
runs asynchronously, it messes up the usage of the state field that now
tracks the state both from a host point of view (which it was doing so
far, updating the state based on callbacks from the UDC), and from a
gadget userspace point of view. This lacks clarity and is confusing.
Furthermore, the commit message doesn't even explain what issue is being
fixed here.

Greg, I think this series has been merged too soon :-(

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 -> v2: Fixed the missing uvc variable in uvcg_video_enable
> 
>  drivers/usb/gadget/function/uvc_video.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 91af3b1ef0d412..4b68a3a9815d73 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -384,13 +384,14 @@ static void uvcg_video_pump(struct work_struct *work)
>  	struct uvc_video_queue *queue = &video->queue;
>  	/* video->max_payload_size is only set when using bulk transfer */
>  	bool is_bulk = video->max_payload_size;
> +	struct uvc_device *uvc = video->uvc;
>  	struct usb_request *req = NULL;
>  	struct uvc_buffer *buf;
>  	unsigned long flags;
>  	bool buf_done;
>  	int ret;
>  
> -	while (video->ep->enabled) {
> +	while (video->ep->enabled && uvc->state == UVC_STATE_STREAMING) {
>  		/*
>  		 * Retrieve the first available USB request, protected by the
>  		 * request lock.
> @@ -488,6 +489,7 @@ static void uvcg_video_pump(struct work_struct *work)
>   */
>  int uvcg_video_enable(struct uvc_video *video, int enable)
>  {
> +	struct uvc_device *uvc = video->uvc;
>  	unsigned int i;
>  	int ret;
>  
> @@ -498,6 +500,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  	}
>  
>  	if (!enable) {
> +		uvc->state = UVC_STATE_CONNECTED;
> +
>  		cancel_work_sync(&video->pump);
>  		uvcg_queue_cancel(&video->queue, 0);
>  
> @@ -523,6 +527,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  		video->encode = video->queue.use_sg ?
>  			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
>  
> +	uvc->state = UVC_STATE_STREAMING;
> +

You're now setting the state to UVC_STATE_STREAMING both here and in
uvc_v4l2_streamon(). That's confusing.

>  	video->req_int_count = 0;
>  
>  	queue_work(video->async_wq, &video->pump);

-- 
Regards,

Laurent Pinchart
