Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913512F7AF9
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 13:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388475AbhAOM4f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 07:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388130AbhAOM4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 07:56:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AA7C0613C1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 04:55:54 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l0Odn-0006V4-7Z; Fri, 15 Jan 2021 13:55:47 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l0Odm-0005MN-4F; Fri, 15 Jan 2021 13:55:46 +0100
Date:   Fri, 15 Jan 2021 13:55:46 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Thomas Haemmerle <thomas.haemmerle@wolfvision.net>,
        laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        balbi@kernel.org, hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: uvc: fix multiple opens
Message-ID: <20210115125546.GC30739@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>,
        laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        balbi@kernel.org, hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org
References: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
 <20201201192730.5633-1-thomas.haemmerle@wolfvision.net>
 <20201207085310.GD1553@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207085310.GD1553@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:52:44 up 44 days,  1:19, 92 users,  load average: 0.20, 0.19,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Dec 2020 09:53:10 +0100, Michael Tretter wrote:
> On Tue, 01 Dec 2020 20:27:30 +0100, Thomas Haemmerle wrote:
> > Currently, the UVC function is activated when open on the corresponding
> > v4l2 device is called.
> > On another open the activation of the function fails since the
> > deactivation counter in `usb_function_activate` equals 0. However the
> > error is not returned to userspace since the open of the v4l2 device is
> > successful.
> > 
> > On a close the function is deactivated (since deactivation counter still
> > equals 0) and the video is disabled in `uvc_v4l2_release`, although the
> > UVC application potentially is streaming.
> > 
> > Move activation of UVC function to subscription on UVC_EVENT_SETUP
> > because there we can guarantee for a userspace application utilizing
> > UVC.
> > Block subscription on UVC_EVENT_SETUP while another application already
> > is subscribed to it, indicated by `bool func_connected` in
> > `struct uvc_device`.
> > Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> > to tag it as the handle used by the userspace UVC application.
> > 
> > With this a process is able to check capabilities of the v4l2 device
> > without deactivating the function for the actual UVC application.
> > 
> > Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> 
> While I agree that this driver overall could really use some love, this patch
> at least fixes the driver for user space applications that scan for v4l2
> devices.
> 
> Reviewed-By: Michael Tretter <m.tretter@pengutronix.de>

Ping.

Is there anything missing for getting this patch merged?

Michael

> 
> > ---
> > v4:
> >   - remove unnecessary inner parentheses
> >   - keep and use the local video variable in `uvc_v4l2_release()`
> > 
> > v3:
> >   - replace `unsigned int connections` with `bool func_connected`
> >   - rename `bool connected` to `bool is_uvc_app_handle`
> > 
> > v2:
> >   - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
> >     locked in v4l2-core) introduced in v1
> >   - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
> >     connected
> > 
> >  drivers/usb/gadget/function/uvc.h      |  2 ++
> >  drivers/usb/gadget/function/uvc_v4l2.c | 49 ++++++++++++++++++++++----
> >  2 files changed, 44 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > index 23ee25383c1f..893aaa70f81a 100644
> > --- a/drivers/usb/gadget/function/uvc.h
> > +++ b/drivers/usb/gadget/function/uvc.h
> > @@ -117,6 +117,7 @@ struct uvc_device {
> >  	enum uvc_state state;
> >  	struct usb_function func;
> >  	struct uvc_video video;
> > +	bool func_connected;
> >  
> >  	/* Descriptors */
> >  	struct {
> > @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
> >  struct uvc_file_handle {
> >  	struct v4l2_fh vfh;
> >  	struct uvc_video *device;
> > +	bool is_uvc_app_handle;
> >  };
> >  
> >  #define to_uvc_file_handle(handle) \
> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > index 4ca89eab6159..197c26f7aec6 100644
> > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > @@ -227,17 +227,55 @@ static int
> >  uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
> >  			 const struct v4l2_event_subscription *sub)
> >  {
> > +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> > +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> > +	int ret;
> > +
> >  	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
> >  		return -EINVAL;
> >  
> > -	return v4l2_event_subscribe(fh, sub, 2, NULL);
> > +	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
> > +		return -EBUSY;
> > +
> > +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (sub->type == UVC_EVENT_SETUP) {
> > +		uvc->func_connected = true;
> > +		handle->is_uvc_app_handle = true;
> > +		uvc_function_connect(uvc);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void uvc_v4l2_disable(struct uvc_device *uvc)
> > +{
> > +	uvc->func_connected = false;
> > +	uvc_function_disconnect(uvc);
> > +	uvcg_video_enable(&uvc->video, 0);
> > +	uvcg_free_buffers(&uvc->video.queue);
> >  }
> >  
> >  static int
> >  uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
> >  			   const struct v4l2_event_subscription *sub)
> >  {
> > -	return v4l2_event_unsubscribe(fh, sub);
> > +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> > +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> > +	int ret;
> > +
> > +	ret = v4l2_event_unsubscribe(fh, sub);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
> > +		uvc_v4l2_disable(uvc);
> > +		handle->is_uvc_app_handle = false;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static long
> > @@ -292,7 +330,6 @@ uvc_v4l2_open(struct file *file)
> >  	handle->device = &uvc->video;
> >  	file->private_data = &handle->vfh;
> >  
> > -	uvc_function_connect(uvc);
> >  	return 0;
> >  }
> >  
> > @@ -304,11 +341,9 @@ uvc_v4l2_release(struct file *file)
> >  	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
> >  	struct uvc_video *video = handle->device;
> >  
> > -	uvc_function_disconnect(uvc);
> > -
> >  	mutex_lock(&video->mutex);
> > -	uvcg_video_enable(video, 0);
> > -	uvcg_free_buffers(&video->queue);
> > +	if (handle->is_uvc_app_handle)
> > +		uvc_v4l2_disable(uvc);
> >  	mutex_unlock(&video->mutex);
> >  
> >  	file->private_data = NULL;
> > -- 
> > 2.25.1
> > 
> > 
> 
