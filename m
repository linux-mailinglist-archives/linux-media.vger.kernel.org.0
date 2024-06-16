Return-Path: <linux-media+bounces-13356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5990A0E3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A3B28242D
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0AB74C02;
	Sun, 16 Jun 2024 23:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M/N68SY2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838F73518;
	Sun, 16 Jun 2024 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718582349; cv=none; b=ekiu8gAInwLOw4/UJc8bVGBOLBcgvj2LA/sUgHEepQ/XdYeAW3W5mqJftYaG642rrFXqg12vHUyA6o0BD5Zb0lASoj812GeOLwqVXXhHPjAM0M2Fm6NhzqjioVHEOnG2QeSMwTObuiO2nOozmdSDmBUxgTXhfd/1A5SY8wz+VPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718582349; c=relaxed/simple;
	bh=XodPUOVCnlbFqNzI/rvCLEmWw9+URsbmPl3l0FaFvhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAdBW58tVHdpLEf43GKc7MQxL+EcDA69Qy8WbWfJYzFYxV5K6fzsYT+NxLKtIBTDWWFvNNJaYxONdGa9eNL85KRepmpJqzNRkdq85WL3MhRgkSAuF9TLuO9QGW9g7jsqldQK8fxA8ulv1X4X0z95qO7c3TwWNBXfHYUeBlroDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M/N68SY2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7039AE4;
	Mon, 17 Jun 2024 01:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718582329;
	bh=XodPUOVCnlbFqNzI/rvCLEmWw9+URsbmPl3l0FaFvhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/N68SY2bdYbrZZelMxrR4pANSBIbNw+txTDAOnu86N1vI7hLL5rYxVCMDWN6hkWX
	 7EJSj6gECtX6BGDHxYlyhSLgz4UaNT2O2FMewc63ovJhfpAYgj6l1/OGXubINA6N9V
	 b0Kz9PxQucwVzxHOF71wUgwXrV8i1Mi1a9sZSGi4=
Date: Mon, 17 Jun 2024 02:58:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Max Staudt <mstaudt@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
Message-ID: <20240616235844.GO4782@pendragon.ideasonboard.com>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
 <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>

Hi Tomasz,

On Thu, Jun 06, 2024 at 06:57:50PM +0900, Tomasz Figa wrote:
> On Wed, Mar 27, 2024 at 5:24 PM Ricardo Ribalda wrote:
> >
> > uvc_unregister_video() can be called asynchronously from
> > uvc_disconnect(). If the device is still streaming when that happens, a
> > plethora of race conditions can happen.
> >
> > Make sure that the device has stopped streaming before exiting this
> > function.
> >
> > If the user still holds handles to the driver's file descriptors, any
> > ioctl will return -ENODEV from the v4l2 core.
> >
> > This change make uvc more consistent with the rest of the v4l2 drivers
> > using the vb2_fop_* and vb2_ioctl_* helpers.
> >
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> 
> First of all, thanks for the patch. I have a question about the
> problem being fixed here.
> 
> Could you point out a specific race condition example that could
> happen without this change?
> From what I see in __video_do_ioctl((), no ioctls would be executed
> anymore after the video node is unregistered.
> Since the device is not present either, what asynchronous code paths
> could be still triggered?

I believe the issue is that some ioctls can be in progress while the
device is unregistered. I'll let Ricardo confirm.

I've tried to explain multiple times before that this should be handled
in the V4L2 core, ideally with fixes in the cdev core too, as this issue
affects all cdev drivers. I've pointed to related patches that have been
posted for the cdev core. They need to be wrapped in V4L2 functions to
make them easier to use for drivers. If we don't want to depend on those
cdev changes, we can implement the "wrappers" with fixes limited to
V4L2 until the cdev changes get merged (assuming someone would resurect
them).

> [1] https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ioctl.c#L3023
> 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index bbd90123a4e76..17fc945c8deb6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device *dev)
> >                 if (!video_is_registered(&stream->vdev))
> >                         continue;
> >
> > +               /*
> > +                * Serialize other access to the stream.
> > +                */
> > +               mutex_lock(&stream->mutex);
> > +               uvc_queue_streamoff(&stream->queue, stream->type);
> >                 video_unregister_device(&stream->vdev);
> >                 video_unregister_device(&stream->meta.vdev);
> > +               mutex_unlock(&stream->mutex);
> > +
> > +               /*
> > +                * Now the vdev is not streaming and all the ioctls will
> > +                * return -ENODEV
> > +                */
> >
> >                 uvc_debugfs_cleanup_stream(stream);
> >         }

-- 
Regards,

Laurent Pinchart

