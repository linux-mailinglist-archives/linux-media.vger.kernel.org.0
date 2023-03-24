Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF236C7B43
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjCXJZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjCXJZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:25:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C3044B8;
        Fri, 24 Mar 2023 02:25:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E0CB33F;
        Fri, 24 Mar 2023 10:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679649951;
        bh=eU82NbdMywntiUO0S5zzJ9ITYk4hQrysmXeJYuI1k7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z8o6x3eGJvE6zocUli+aHqFxbXQDPg5wQxkGdH0ujkTTHiFQnOlO02+VNPZux+jwN
         iEeQYGk1kXjIuPfEaxaCdNiFwBir/erwh+lLpbR12ygYSmG8okdwQRIwZ1S++grV2Q
         G34Bo6c9fFUI4VvepFVgDran5rxAef/OLwP8TJtA=
Date:   Fri, 24 Mar 2023 11:25:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/8] usb: gadget: uvc: fix return code of REQBUFS
Message-ID: <20230324092557.GE18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-2-e41f0c5d9d8e@pengutronix.de>
 <ea3247b5-3e5b-8fea-bbfb-329065900774@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea3247b5-3e5b-8fea-bbfb-329065900774@ideasonboard.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 24, 2023 at 07:50:11AM +0000, Dan Scally wrote:
> Hi Michael
> 
> On 23/03/2023 11:41, Michael Tretter wrote:
> > On success, VIDIOC_REQBUFS should return 0, not the number of allocated
> > buffers. As uvcg_alloc_buffers() is directly called by regbufs, it has
> > to return the correct error codes.
> 
> s/regbufs/reqbufs
> 
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> 
> This probably wants a Fixes: tag?

Good idea. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> >   drivers/usb/gadget/function/uvc_queue.c | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> > index 0aa3d7e1f3cc..f14f75b93aaa 100644
> > --- a/drivers/usb/gadget/function/uvc_queue.c
> > +++ b/drivers/usb/gadget/function/uvc_queue.c
> > @@ -179,11 +179,7 @@ void uvcg_free_buffers(struct uvc_video_queue *queue)
> >   int uvcg_alloc_buffers(struct uvc_video_queue *queue,
> >   			      struct v4l2_requestbuffers *rb)
> >   {
> > -	int ret;
> > -
> > -	ret = vb2_reqbufs(&queue->queue, rb);
> > -
> > -	return ret ? ret : rb->count;
> > +	return vb2_reqbufs(&queue->queue, rb);
> >   }
> >   
> >   int uvcg_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)

-- 
Regards,

Laurent Pinchart
