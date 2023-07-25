Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14962761501
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 13:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbjGYLYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 07:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234549AbjGYLYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 07:24:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BB211B;
        Tue, 25 Jul 2023 04:24:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59295558;
        Tue, 25 Jul 2023 13:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690284220;
        bh=K1vHyO+RlQbYoTs/r4CBYxR/YvYkBhFrxQUSgg5Z25c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=szMKCgZ9Ii/kky+Xdpvk0t9e+CJ8uoVK4sgtwbBKiYeW0G4IOxo2jLenqLd0iXO2N
         WujQClWyOagjTiUzh7qvxwpaMqxdMX8GXB3tlmEQ3kF/zBxo1H1EMBkcU/ZuTd9DRH
         p5tkazG0sFPAJapzm41FP2aSQJnoTMXYk7McvDM0=
Date:   Tue, 25 Jul 2023 14:24:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: uvc: limit isoc_sg to super speed
 gadgets
Message-ID: <20230725112446.GD31069@pendragon.ideasonboard.com>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20221125153450.344392-2-m.grzeschik@pengutronix.de>
 <be391e47-afe2-e7f6-93c8-7135b399598c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be391e47-afe2-e7f6-93c8-7135b399598c@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Mon, Jul 24, 2023 at 01:47:09PM +0100, Dan Scally wrote:
> On 25/11/2022 15:34, Michael Grzeschik wrote:
> > When calling uvc_video_encode_isoc_sg the function is preparing the sg payload
> > by setting the sglist pointers of the videobuffer for the request. The usb
> > gadget driver then is parsing the sg list and uses each sg entry to send in one
> > urb to the host. Because of the unrelated buffer of the uvc header that buffer
> > has to be send separately in an extra sg entry.
> >
> > When it comes to transfers with an limited payload (e.g. the maximum of 3kB for
> > high-speed) this extra payload handling is not justified. A simple memcpy of
> > the header and payload is usually faster and does not come with that extra
> > runtime overhead.
> 
> Sorry for the delay with this one. I don't suppose you benchmarked
> this at all? I'd be curious to see the effect.

That's a good question. Michael, do you have numbers ?

> > This patch is changing the uvc_video_encode_isoc_sg encode function only to be
> > used for super speed gadgets.
> >
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> > v1 -> v2: - left the sg assignment in uvc_buffer_sg under the test for use_sg
> >            - rephrased the commit message
> >
> >   drivers/usb/gadget/function/uvc_queue.c | 3 +--
> >   drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
> >   2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> > index 0aa3d7e1f3cc32..0abb1763faf1b6 100644
> > --- a/drivers/usb/gadget/function/uvc_queue.c
> > +++ b/drivers/usb/gadget/function/uvc_queue.c
> > @@ -87,9 +87,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
> >   	if (queue->use_sg) {
> >   		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
> >   		buf->sg = buf->sgt->sgl;
> > -	} else {
> > -		buf->mem = vb2_plane_vaddr(vb, 0);
> >   	}
> > +	buf->mem = vb2_plane_vaddr(vb, 0);
> >   	buf->length = vb2_plane_size(vb, 0);
> >   	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> >   		buf->bytesused = 0;
> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> > index dd1c6b2ca7c6f3..b6ea600b011185 100644
> > --- a/drivers/usb/gadget/function/uvc_video.c
> > +++ b/drivers/usb/gadget/function/uvc_video.c
> > @@ -459,6 +459,9 @@ static void uvcg_video_pump(struct work_struct *work)
> >    */
> >   int uvcg_video_enable(struct uvc_video *video, int enable)
> >   {
> > +	struct uvc_device *uvc = video->uvc;
> > +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
> > +	struct usb_gadget *gadget = cdev->gadget;
> >   	unsigned int i;
> >   	int ret;
> >   
> > @@ -490,9 +493,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
> >   	if (video->max_payload_size) {
> >   		video->encode = uvc_video_encode_bulk;
> >   		video->payload_size = 0;
> > -	} else
> > -		video->encode = video->queue.use_sg ?
> > +	} else {
> > +		video->encode = (video->queue.use_sg &&
> > +				 !(gadget->speed <= USB_SPEED_HIGH)) ?
> >   			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
> > +	}
> 
> I think it'd be better to just set video->queue.use_sg n uvcg_queue_init() by checking 
> cdev->gadget->speed as well as cdev->gadget->sg_supported; can we do that?

Agreed, otherwise use_sg will be a misnommer (it could be set to true
without actually using SG). Furthermore, we should not create a CPU
mapping of the buffer when using SG, as that's a waste of resources.

> >   
> >   	video->req_int_count = 0;
> >   

-- 
Regards,

Laurent Pinchart
