Return-Path: <linux-media+bounces-20947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420629BD0FE
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0281F23976
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44F014A611;
	Tue,  5 Nov 2024 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qo6W4JQE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E568310F2;
	Tue,  5 Nov 2024 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730821784; cv=none; b=SWPrw7hiOCbfuJDIX6OQAppNfOClKPv0qahJH7FdB/UOT8EZHn0hSAVIgaDKKs3t5TVxvRUp0wRfHz8GWGbr6rhBuT66AI5qNh5GeqbPeGnijkRJJ4YtwJddxhIqTeAfFOFdvtSlYk6yYP7AZbwmU/KPnSJkBgPbmQcRfJiJzwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730821784; c=relaxed/simple;
	bh=8ktPItxGXSPigbsgRi2LI+yRpuEAvn/cPCXGt8rhZLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozzDSRAa8dygV/w9dWJAmauqodqxJZS44pN+G/mzILRrd4WuwIHRJvY9IOdvv2kpf49XFjmqpUXGwwIk8RpHelTrylfyTZB0hqI8YqzdcQGEms7AJM8IPRCtJMMom/CQPxKpovUUwZXkChcjM/V+YZ6Ie0EAkg5c5CyFXB0yulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qo6W4JQE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D03D874;
	Tue,  5 Nov 2024 16:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730821768;
	bh=8ktPItxGXSPigbsgRi2LI+yRpuEAvn/cPCXGt8rhZLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qo6W4JQELNerRb5rbXTXNrX4vRZakhEqy43X8uCInpiTDqd2hMv+BAwlJjrKnnpnS
	 N2k0Z2gRxL6nP1CTNA0Jvjzwbus0O5dzO/kIdhMsQJEOa/SsHlp65A4/pwKZwzjPm0
	 T68CglmgEt9VF4Kfe0glbgK9Et97VvFsXvnZcs5A=
Date: Tue, 5 Nov 2024 17:49:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: uvcvideo: Remove refcounted cleanup
Message-ID: <20241105154927.GA6317@pendragon.ideasonboard.com>
References: <20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org>
 <20241105144340.GQ27775@pendragon.ideasonboard.com>
 <CANiDSCvtaFxPvsJRQRo3RG54RZef2crs1Vk5TkA9XdoZNoqr5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvtaFxPvsJRQRo3RG54RZef2crs1Vk5TkA9XdoZNoqr5w@mail.gmail.com>

On Tue, Nov 05, 2024 at 04:36:38PM +0100, Ricardo Ribalda wrote:
> On Tue, 5 Nov 2024 at 15:43, Laurent Pinchart wrote:
> > On Tue, Nov 05, 2024 at 02:32:39PM +0000, Ricardo Ribalda wrote:
> > > After commit c9ec6f173636 ("media: uvcvideo: Stop stream during unregister")
> > > we have some guarantee that userspace will not be able to access any of
> > > our internal structures after disconnect().
> > >
> > > This means that we can do the cleanup at the end of disconnect and make
> > > the code more resilient to races.
> > >
> > > This change will also enable the use of devres functions in more parts
> > > of the code.
> >
> > That's the wrong direction, let's not go there, especially given that
> > this doesn't fix anything. Strong nack on my side, especially given how
> > many of your previous patches introduced race conditions. It's not
> 
> They have also fixed some race conditions... keep the discussion
> professional please.
> 
> I think this only proves that uvc code is quite complicated. It also
> lacks a lot of consistency with the rest of the drivers in media (and
> in the kernel in general)
> that is exactly what this patch tries to fix.
> 
> > broken, don't touch it. A better use of your time would be to fix the
> > unplug race issue at the subsystem level.
> 
> Now memory is allocated during uvc_probe(), but it is not freed until
> after disconnect() if userspace has a videodevice open.
> Luckily userspace now cannot interfere with the driver after
> disconnect(), so lets make use of that property to simplify the code.
> 
> As the commit message says, with this change we can start using devm_
> functions and we will have less chances to make mistakes
> Eg: no  more
> - this cleanout belongs to uvc_register_video_device vs uvc_delete
> - devm_ function fails because it is called too late
> 
> This patch fixes a class of bugs. I would really appreciate it if you
> can review it.
> I have moved it to its own patchset:
> https://patchwork.linuxtv.org/project/linux-media/patch/20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org/
> I am planning to send more patches on top of it making use of devres

I currently lack confidence in your patches when it comes to race
conditions and use-after-free. For the ones that fix bugs, or introduce
new features, I bite the bullet and review them. The most recent example
(https://lore.kernel.org/r/20241105-uvc-crashrmmod-v5-1-8623fa51a74f@chromium.org)
is a good example of why I lack that confidence. I will prioritize my
time to get important uvcvideo patches in as quickly as possible, not on
reviewing patches that do not address any issue and have a high risk of
introducing problems.

If you would like to get this kind of rework in, I recommend rebuilding
bridges first and creating trust. I would request you to drop this patch
in the meantime.

> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 24 +++++-------------------
> > >  drivers/media/usb/uvc/uvcvideo.h   |  1 -
> > >  2 files changed, 5 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index a96f6ca0889f..2735fccdf454 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1868,16 +1868,12 @@ static int uvc_scan_device(struct uvc_device *dev)
> > >  /*
> > >   * Delete the UVC device.
> > >   *
> > > - * Called by the kernel when the last reference to the uvc_device structure
> > > - * is released.
> > > - *
> > > - * As this function is called after or during disconnect(), all URBs have
> > > + * As this function is called during disconnect(), all URBs have
> > >   * already been cancelled by the USB core. There is no need to kill the
> > >   * interrupt URB manually.
> > >   */
> > > -static void uvc_delete(struct kref *kref)
> > > +static void uvc_delete(struct uvc_device *dev)
> > >  {
> > > -     struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
> > >       struct list_head *p, *n;
> > >
> > >       uvc_status_cleanup(dev);
> > > @@ -1919,14 +1915,6 @@ static void uvc_delete(struct kref *kref)
> > >       kfree(dev);
> > >  }
> > >
> > > -static void uvc_release(struct video_device *vdev)
> > > -{
> > > -     struct uvc_streaming *stream = video_get_drvdata(vdev);
> > > -     struct uvc_device *dev = stream->dev;
> > > -
> > > -     kref_put(&dev->ref, uvc_delete);
> > > -}
> > > -
> > >  /*
> > >   * Unregister the video devices.
> > >   */
> > > @@ -2009,7 +1997,7 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >       vdev->v4l2_dev = &dev->vdev;
> > >       vdev->fops = fops;
> > >       vdev->ioctl_ops = ioctl_ops;
> > > -     vdev->release = uvc_release;
> > > +     vdev->release = video_device_release_empty;
> > >       vdev->prio = &stream->chain->prio;
> > >       if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > >               vdev->vfl_dir = VFL_DIR_TX;
> > > @@ -2045,7 +2033,6 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >               return ret;
> > >       }
> > >
> > > -     kref_get(&dev->ref);
> > >       return 0;
> > >  }
> > >
> > > @@ -2160,7 +2147,6 @@ static int uvc_probe(struct usb_interface *intf,
> > >       INIT_LIST_HEAD(&dev->entities);
> > >       INIT_LIST_HEAD(&dev->chains);
> > >       INIT_LIST_HEAD(&dev->streams);
> > > -     kref_init(&dev->ref);
> > >       atomic_set(&dev->nmappings, 0);
> > >
> > >       dev->udev = usb_get_dev(udev);
> > > @@ -2300,7 +2286,7 @@ static int uvc_probe(struct usb_interface *intf,
> > >
> > >  error:
> > >       uvc_unregister_video(dev);
> > > -     kref_put(&dev->ref, uvc_delete);
> > > +     uvc_delete(dev);
> > >       return -ENODEV;
> > >  }
> > >
> > > @@ -2319,7 +2305,7 @@ static void uvc_disconnect(struct usb_interface *intf)
> > >               return;
> > >
> > >       uvc_unregister_video(dev);
> > > -     kref_put(&dev->ref, uvc_delete);
> > > +     uvc_delete(dev);
> > >  }
> > >
> > >  static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 07f9921d83f2..feb8de640a26 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -578,7 +578,6 @@ struct uvc_device {
> > >
> > >       /* Video Streaming interfaces */
> > >       struct list_head streams;
> > > -     struct kref ref;
> > >
> > >       /* Status Interrupt Endpoint */
> > >       struct usb_host_endpoint *int_ep;
> > >
> > > ---
> > > base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> > > change-id: 20241105-uvc-rmrefcount-010d98d496c5

-- 
Regards,

Laurent Pinchart

