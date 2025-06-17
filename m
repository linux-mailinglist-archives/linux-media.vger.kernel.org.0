Return-Path: <linux-media+bounces-35089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF6ADCEF2
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6293A5EA3
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480C62E88A7;
	Tue, 17 Jun 2025 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AKthm1gs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046FA2E2EF4;
	Tue, 17 Jun 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169181; cv=none; b=amIfwVQBt2js+SezU4Y6zsyPZn+tX082Di/xY4jvJmQmoXqcj6QlKkgmlnVJPzCffRsmJZKXmPUB/MHNMy6j3LSKTV2hX6zSNwqlZHM7gwaalvDbl1XXfw1vuoOu7b0XBKTOb+cm/BJfdLKRhTdtBEeekRsxvETLjOH/b8oVAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169181; c=relaxed/simple;
	bh=ujEVgJp17HsXe/xyAX0/dp1pdcA2vygvIovjmYs64xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8ynnJ1Hf2Lujn95rC2Cfz3yxGe41Mrnq5ndLUsAhPNDHhV6dYwM1rSdkpuwxVqX6GWoJNyJxRovy/U2wix5uPxvYzVqFcz2fYCstmsZkoSsombV0oSQ4c8Iu0hmCM07blL5QtIDcsXaSEvQR1i6Igp+I8w1Iow9FqWFjlauvx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AKthm1gs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15DE37E1;
	Tue, 17 Jun 2025 16:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750169166;
	bh=ujEVgJp17HsXe/xyAX0/dp1pdcA2vygvIovjmYs64xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKthm1gsy+QYt3KxC54bKBFKCQT04uhOdX1ltu29G+NhLXV92t554CL+46clAlTUX
	 d5gChZn/8MuARCgpyQPEhChYZGYNypFGJWASeRn8jyVGcrwQP+/1qP3xFosSQ0d/i5
	 5cK514uMEsDInIJyAmFuvfIeFODF0OP3CiAnWeiw=
Date: Tue, 17 Jun 2025 17:06:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
Message-ID: <20250617140602.GD10006@pendragon.ideasonboard.com>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-5-250286570ee7@chromium.org>
 <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
 <20250617100730.GA10006@pendragon.ideasonboard.com>
 <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>

On Tue, Jun 17, 2025 at 01:09:38PM +0200, Ricardo Ribalda wrote:
> On Tue, 17 Jun 2025 at 12:07, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Mon, Jun 16, 2025 at 08:30:08PM +0200, Ricardo Ribalda wrote:
> > > On Mon, 16 Jun 2025 at 17:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > Currently, a UVC device can have multiple chains, and each chain maintains
> > > > its own priority state. While this behavior is technically correct for UVC,
> > > > uvcvideo is the *only* V4L2 driver that does not utilize the priority state
> > > > defined within `v4l2_device`.
> > > >
> > > > This patch modifies uvcvideo to use the `v4l2_device` priority state. While
> > > > this might not be strictly "correct" for uvcvideo's multi-chain design, it
> > > > aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
> > > > behavior and enabling code cleanup in v4l2-core. Also, multi-chain
> > > > devices are extremely rare, they are typically implemented as two
> > > > independent usb devices.
> > >
> > > As the cover letter says, this last patch 5/5 is a RFC. We can decide
> > > if it is worth to keep it or not.
> > >
> > > The pros is that we can do some cleanup in the core,
> >
> > What cleanups would that be ?
> >
> > > the cons is that it might break kAPI.
> >
> > Multi-chain devices are essentially multiple video devices inside a
> > single USB function. They are exposed as completely separate devices to
> > userspace, having the priority ioctls on one chain impact the other
> > chain wouldn't make much sense to me. I think we should drop this patch.
> 
> Ack, let's drop it.
> 
> PS: Do you know about a multi chain device that is commercially
> available? I would love to buy one for testing.
> Also do you know any "output" device that I can buy?

The only output device I've worked with was a custom camera developed by
a customer that had a "UVC to VGA" output path. It was a loooooong time
ago, I don't have a device to test UVC output anymore.

> > > I checked in the debian sourcecode and I could only find a user of
> > > PRIORITY for dvb and was optional.
> >
> > We could discuss deprecating the priority ioctls overall if we think
> > they're not useful (and used) by userspace. I was however considering
> > using them in libcamera though, to prevent other applications from
> > modifying the camera configuration behind the library's back.
> 
> For the record:
> From: https://codesearch.debian.net/search?q=VIDIOC_S_PRIORITY
> If I am not wrong, this is the only relevant usecase:
> https://sources.debian.org/src/zvbi/0.2.44-1/daemon/proxyd.c/?hl=1523#L1523
> 
> O_EXCL does not work for you?

I haven't tried it, but tt's defined as

    O_EXCL Ensure that this call creates the file: if this flag is
	   specified in conjunction with O_CREAT, and pathname already
	   exists, then open() fails with the error EEXIST.

	   When these two flags are specified, symbolic links are not
	   followed: if pathname is a symbolic link, then open() fails
	   regardless of where the symbolic link points.

	   In general, the behavior of O_EXCL is undefined if it is used
	   without O_CREAT.  There is one exception: on Linux 2.6 and
	   later, O_EXCL can be used without O_CREAT  if  pathname
	   refers to a block device.  If the block device is in use by
	   the system (e.g., mounted), open() fails with the error
	   EBUSY.

so I don't expect it would work.

It's not a big deal, libcamera doesn't get exclusive access to video
devices today and the world doesn't collapse (at least not because of
this specific issue). And we don't have priority support on subdevs, so
we couldn't solve the whole problem anyway.

> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 2 --
> > > >  drivers/media/usb/uvc/uvcvideo.h   | 1 -
> > > >  2 files changed, 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
> > > >         INIT_LIST_HEAD(&chain->entities);
> > > >         mutex_init(&chain->ctrl_mutex);
> > > >         chain->dev = dev;
> > > > -       v4l2_prio_init(&chain->prio);
> > > >
> > > >         return chain;
> > > >  }
> > > > @@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
> > > >         vdev->fops = fops;
> > > >         vdev->ioctl_ops = ioctl_ops;
> > > >         vdev->release = uvc_release;
> > > > -       vdev->prio = &stream->chain->prio;
> > > >         vdev->queue = &queue->queue;
> > > >         vdev->lock = &queue->mutex;
> > > >         if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -354,7 +354,6 @@ struct uvc_video_chain {
> > > >                                                  * uvc_fh.pending_async_ctrls
> > > >                                                  */
> > > >
> > > > -       struct v4l2_prio_state prio;            /* V4L2 priority state */
> > > >         u32 caps;                               /* V4L2 chain-wide caps */
> > > >         u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
> > > >  };

-- 
Regards,

Laurent Pinchart

