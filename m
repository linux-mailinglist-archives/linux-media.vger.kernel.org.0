Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ED257B3E8
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 11:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbiGTJbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 05:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiGTJbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 05:31:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446315B798
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 02:31:51 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1oE63V-0005sE-2N; Wed, 20 Jul 2022 11:31:45 +0200
Message-ID: <bb64343ba89cc6534691eed7a9dbba920ba62099.camel@pengutronix.de>
Subject: Re: [RESEND v2 2/3] usb: gadget: uvc: increase worker prio to
 WQ_HIGHPRI
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Date:   Wed, 20 Jul 2022 11:31:44 +0200
In-Reply-To: <20220719225247.GB24858@pengutronix.de>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
         <20220608110339.141036-3-m.grzeschik@pengutronix.de>
         <YqDtWkUbp4LPBRxS@pendragon.ideasonboard.com>
         <20220719225247.GB24858@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 20.07.2022 um 00:52 +0200 schrieb Michael Grzeschik:
> On Wed, Jun 08, 2022 at 09:41:30PM +0300, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jun 08, 2022 at 01:03:38PM +0200, Michael Grzeschik wrote:
> > > Likewise to the uvcvideo hostside driver, this patch is changing the
> > > simple workqueue to an async_wq with higher priority. This ensures that
> > > the worker will not be scheduled away while the video stream is handled.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > 
> > > ---
> > > v1 -> v2: - added destroy_workqueue in uvc_function_unbind
> > >           - reworded comment above allow_workqueue
> > > 
> > >  drivers/usb/gadget/function/f_uvc.c     | 4 ++++
> > >  drivers/usb/gadget/function/uvc.h       | 1 +
> > >  drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
> > >  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
> > >  4 files changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> > > index d3feeeb50841b8..dcc5f057810973 100644
> > > --- a/drivers/usb/gadget/function/f_uvc.c
> > > +++ b/drivers/usb/gadget/function/f_uvc.c
> > > @@ -891,10 +891,14 @@ static void uvc_function_unbind(struct usb_configuration *c,
> > >  {
> > >  	struct usb_composite_dev *cdev = c->cdev;
> > >  	struct uvc_device *uvc = to_uvc(f);
> > > +	struct uvc_video *video = &uvc->video;
> > >  	long wait_ret = 1;
> > > 
> > >  	uvcg_info(f, "%s()\n", __func__);
> > > 
> > > +	if (video->async_wq)
> > > +		destroy_workqueue(video->async_wq);
> > > +
> > >  	/* If we know we're connected via v4l2, then there should be a cleanup
> > >  	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
> > >  	 * though the video device removal uevent. Allow some time for the
> > > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > > index 58e383afdd4406..1a31e6c6a5ffb8 100644
> > > --- a/drivers/usb/gadget/function/uvc.h
> > > +++ b/drivers/usb/gadget/function/uvc.h
> > > @@ -88,6 +88,7 @@ struct uvc_video {
> > >  	struct usb_ep *ep;
> > > 
> > >  	struct work_struct pump;
> > > +	struct workqueue_struct *async_wq;
> > > 
> > >  	/* Frame parameters */
> > >  	u8 bpp;
> > > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > > index fd8f73bb726dd1..fddc392b8ab95d 100644
> > > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > > @@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
> > >  		return ret;
> > > 
> > >  	if (uvc->state == UVC_STATE_STREAMING)
> > > -		schedule_work(&video->pump);
> > > +		queue_work(video->async_wq, &video->pump);
> > > 
> > >  	return ret;
> > >  }
> > > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> > > index a9bb4553db847e..9a9101851bc1e8 100644
> > > --- a/drivers/usb/gadget/function/uvc_video.c
> > > +++ b/drivers/usb/gadget/function/uvc_video.c
> > > @@ -277,7 +277,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
> > >  	spin_unlock_irqrestore(&video->req_lock, flags);
> > > 
> > >  	if (uvc->state == UVC_STATE_STREAMING)
> > > -		schedule_work(&video->pump);
> > > +		queue_work(video->async_wq, &video->pump);
> > >  }
> > > 
> > >  static int
> > > @@ -478,7 +478,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
> > > 
> > >  	video->req_int_count = 0;
> > > 
> > > -	schedule_work(&video->pump);
> > > +	queue_work(video->async_wq, &video->pump);
> > > 
> > >  	return ret;
> > >  }
> > > @@ -492,6 +492,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
> > >  	spin_lock_init(&video->req_lock);
> > >  	INIT_WORK(&video->pump, uvcg_video_pump);
> > > 
> > > +	/* Allocate a work queue for asynchronous video pump handler. */
> > > +	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);
> > 
> > Let's call it "uvcgadget" (or "uvc gadget", "uvc-gadget", ...) as
> > "uvcvideo" refers to the host side driver.
> > 
> > I'm still a bit worried about WQ_UNBOUND and the risk of running work
> > items in parallel on different CPUs. uvcg_video_pump() looks mostly
> > safe, as it protects video->req_free with a spinlock, and the buffer
> > queue with another spinlock. The req_int_count increment at the end of
> > the loop would be unsafe though.
> 
> I looked into this again. But am still a bit unsure.
> 
> Why exactly would req_int_count be unsafe?
> 
> I thought WQ_UNBOUND is just making sure, that the workqueue could be
> scheduled on any CPU, independent of the calling CPU waking the WQ. The
> function uvcg_video_pump would than be called. But would it then be
> called in parallel on two CPU at once? I doubt that. So how should
> touching req_int_count on the bottom of the function be unsafe?
> 
> If WQ_UNBOUND would mean, that it would be run on more than one CPU
> at once, this should clearly be documented.

All workqueues (including the system_wq, that is used by schedule_work)
can execute multiple workitems at the same time. The max_active
parameter provided to alloc_workqueue() is what regulates concurrency,
WQ_UNBOUND has nothing to do with this, expect that it provides a
different maximum of the possible concurrency.

If the code works fine as-is, then this change should make no
difference. Without looking into the details, I think the singlethread
assumption here is satisfied by the video pump being a single work
item, so if it is already queued it will not be queued again, so there
is nothing to execute in parallel.

Regards,
Lucas

