Return-Path: <linux-media+bounces-38417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66656B10F2C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 17:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8A01CC5F74
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 15:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3E2EA491;
	Thu, 24 Jul 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fu11raA6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E22D193C;
	Thu, 24 Jul 2025 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372269; cv=none; b=mDe1jva652r4gnRTLDHJZSljmxyv10/XbwtXplRRPk4SZjMpJ/LPAA69KJ2GOXTpGHO4rlGB+cAz0JYosqcRWioPEDxyaKdjvyAHx81CQwgxRJ47AoLNqlTmzZ5gNPd5LyDfJby9Hv2rxCgLsg7nGWAAhMEDMfa9waE27mKc9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372269; c=relaxed/simple;
	bh=DmwXao2MHnWUKgXoHeUaQdO3WFQeDOtuM0avIl9e1GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siEj2A46thWUh5Ix5Kz1zAo0feYQj5yVZFAeqB3dyzKW6pHH81zQ7+1TYBxzSbwns8T3NGWKXg7Q/dNx62mjjHpn/jWb0WmWJjo2D70EW87/V6lMPcumcsoR5DNrxkJ3CY478cHdfMS11LkLhKwk4FuxlL5dI6/v/FlVHKy6fZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fu11raA6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4DB2EC79;
	Thu, 24 Jul 2025 17:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753372226;
	bh=DmwXao2MHnWUKgXoHeUaQdO3WFQeDOtuM0avIl9e1GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fu11raA6eEW+LAQ82hcm54n5yqMxfBE+BMkb1ssbteVi8/uwY/enlENPHZtNN2kBR
	 RT3G+/gB8audu39EFVrgB0a02bzky0a2P/m4GwEmP8omKR0c4tnHFZlAzoctM1h9U0
	 TBPte06bWg7Xx+qh0LMNESlOVnbByKHDSA42qVKo=
Date: Thu, 24 Jul 2025 18:51:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH] media: uvcvideo: Drop stream->mutex
Message-ID: <20250724155101.GA17890@pendragon.ideasonboard.com>
References: <20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org>
 <20250724120840.GL11202@pendragon.ideasonboard.com>
 <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvvAX27u4_qnKxbSqWVWybsZFV-367eSv8ig85-cCeDTw@mail.gmail.com>

(CC'ing Hans Verkuil)

On Thu, Jul 24, 2025 at 05:41:06PM +0200, Ricardo Ribalda wrote:
> On Thu, 24 Jul 2025 at 14:08, Laurent Pinchart wrote:
> > On Thu, Jul 17, 2025 at 07:56:45AM +0000, Ricardo Ribalda wrote:
> > > Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
> > > helpers"), the IOCTLs are serialized. Due to this there is no more need
> > > to protect ctrl, cur_format or cur_frame from concurrent access.
> > >
> > > Drop stream->mutex after thanking it for years of good service.
> > >
> > > Use this opportunity to do fix some CodeStyle.
> >
> > Is that about the following change only:
> >
> > -       if (format == NULL || frame == NULL) {
> > +       if (!format || !frame)
> >
> > or is there something else I missed ?
> 
> I believe that's it.
> 
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c   |  4 ----
> > >  drivers/media/usb/uvc/uvc_metadata.c |  8 ++------
> > >  drivers/media/usb/uvc/uvc_v4l2.c     | 39 ++++++++----------------------------
> > >  drivers/media/usb/uvc/uvcvideo.h     |  6 ------
> > >  4 files changed, 10 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
> > >       if (stream->async_wq)
> > >               destroy_workqueue(stream->async_wq);
> > >
> > > -     mutex_destroy(&stream->mutex);
> > > -
> > >       usb_put_intf(stream->intf);
> > >
> > >       kfree(stream->formats);
> > > @@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
> > >       if (stream == NULL)
> > >               return NULL;
> > >
> > > -     mutex_init(&stream->mutex);
> > > -
> > >       stream->dev = dev;
> > >       stream->intf = usb_get_intf(intf);
> > >       stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
> > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > index 229e08ff323eed9129d835b24ea2e8085bb713b8..d1d4fade634bd3f8b12bbaa75388db42aecc25ea 100644
> > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > @@ -100,14 +100,10 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
> > >        * Metadata buffers would still be perfectly parseable, but it's more
> > >        * consistent and cleaner to disallow that.
> > >        */
> > > -     mutex_lock(&stream->mutex);
> > > -
> > >       if (vb2_is_busy(&stream->meta.queue.queue))
> > > -             ret = -EBUSY;
> > > -     else
> > > -             stream->meta.format = fmt->dataformat;
> > > +             return -EBUSY;
> > >
> > > -     mutex_unlock(&stream->mutex);
> > > +     stream->meta.format = fmt->dataformat;
> > >
> > >       return ret;
> >
> >         return 0;
> >
> > >  }
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..d7be4d59f0c73b983aa01321f4acc8f8bf6e83ef 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> > >        * developers test their webcams with the Linux driver as well as with
> > >        * the Windows driver).
> > >        */
> > > -     mutex_lock(&stream->mutex);
> > >       if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
> > >               probe->dwMaxVideoFrameSize =
> > >                       stream->ctrl.dwMaxVideoFrameSize;
> > >
> > >       /* Probe the device. */
> > >       ret = uvc_probe_video(stream, probe);
> > > -     mutex_unlock(&stream->mutex);
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > @@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > >       struct uvc_streaming *stream = handle->stream;
> > >       const struct uvc_format *format;
> > >       const struct uvc_frame *frame;
> > > -     int ret = 0;
> > >
> > >       if (fmt->type != stream->type)
> > >               return -EINVAL;
> > >
> > > -     mutex_lock(&stream->mutex);
> > >       format = stream->cur_format;
> > >       frame = stream->cur_frame;
> > >
> > > -     if (format == NULL || frame == NULL) {
> > > -             ret = -EINVAL;
> > > -             goto done;
> > > -     }
> > > +     if (!format || !frame)
> > > +             return -EINVAL;
> > >
> > >       fmt->fmt.pix.pixelformat = format->fcc;
> > >       fmt->fmt.pix.width = frame->wWidth;
> > > @@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
> > >       fmt->fmt.pix.xfer_func = format->xfer_func;
> > >       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> > >
> > > -done:
> > > -     mutex_unlock(&stream->mutex);
> > > -     return ret;
> > > +     return 0;
> > >  }
> > >
> > >  static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > @@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > -     mutex_lock(&stream->mutex);
> > > -     if (vb2_is_busy(&stream->queue.queue)) {
> > > -             ret = -EBUSY;
> > > -             goto done;
> > > -     }
> > > +     if (vb2_is_busy(&stream->queue.queue))
> > > +             return -EBUSY;
> > >
> > >       stream->ctrl = probe;
> > >       stream->cur_format = format;
> > >       stream->cur_frame = frame;
> > >
> > > -done:
> > > -     mutex_unlock(&stream->mutex);
> > > -     return ret;
> > > +     return 0;
> > >  }
> > >
> > >  static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > > @@ -466,9 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
> > >       if (parm->type != stream->type)
> > >               return -EINVAL;
> > >
> > > -     mutex_lock(&stream->mutex);
> > >       numerator = stream->ctrl.dwFrameInterval;
> > > -     mutex_unlock(&stream->mutex);
> > >
> >
> > You can drop the blank line here.
> >
> > >       denominator = 10000000;
> > >       v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
> > > @@ -519,12 +504,9 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > >       uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
> > >               timeperframe.numerator, timeperframe.denominator, interval);
> > >
> > > -     mutex_lock(&stream->mutex);
> > >
> >
> > Double blank line.
> >
> > > -     if (uvc_queue_streaming(&stream->queue)) {
> > > -             mutex_unlock(&stream->mutex);
> > > +     if (uvc_queue_streaming(&stream->queue))
> > >               return -EBUSY;
> > > -     }
> > >
> > >       format = stream->cur_format;
> > >       frame = stream->cur_frame;
> > > @@ -556,14 +538,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > >
> > >       /* Probe the device with the new settings. */
> > >       ret = uvc_probe_video(stream, &probe);
> > > -     if (ret < 0) {
> > > -             mutex_unlock(&stream->mutex);
> > > +     if (ret < 0)
> > >               return ret;
> > > -     }
> > >
> > >       stream->ctrl = probe;
> > >       stream->cur_frame = frame;
> > > -     mutex_unlock(&stream->mutex);
> > >
> > >       /* Return the actual frame period. */
> > >       timeperframe.numerator = probe.dwFrameInterval;
> > > @@ -941,10 +920,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > >
> > >       sel->r.left = 0;
> > >       sel->r.top = 0;
> > > -     mutex_lock(&stream->mutex);
> > >       sel->r.width = stream->cur_frame->wWidth;
> > >       sel->r.height = stream->cur_frame->wHeight;
> > > -     mutex_unlock(&stream->mutex);
> > >
> > >       return 0;
> > >  }
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -469,12 +469,6 @@ struct uvc_streaming {
> > >       const struct uvc_format *cur_format;
> > >       const struct uvc_frame *cur_frame;
> > >
> > > -     /*
> > > -      * Protect access to ctrl, cur_format, cur_frame and hardware video
> > > -      * probe control.
> > > -      */
> > > -     struct mutex mutex;
> > > -
> >
> > Could you please instead keep this mutex and drop uvc_video_queue.mutex
> > ? The rationale is that the same lock is now used to protect the queue
> > operations and to serialize the ioctls. It's therefore a higher-level
> > lock, which should be stored in the higher-level object, not in the
> > queue.
> >
> > You can then also drop the lock assignment in uvc_queue.c that reads
> >
> >         queue->queue.lock = &queue->mutex;
> >
> > as videobuf2 and the V4L2 core will use the video device lock when no
> > queue lock is set. The comment at the top of uvc_queue.c may need to be
> > updated.
> 
> Are we sure that it is exactly the same?
> 
> There are places in videobuf2-core.c where we do not use video device lock.
> 
> Eg:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-core.c#n2056
> 
> I'd rather keep the assignment to be in the safe side.

There are lots of places where the vdev lock is used is the queue has no
lock. Hans, was is an oversight not to do it in __vb2_wait_for_done_vb()
? If we don't want to support not setting the queue lock that's OK, but
we should then drop code that uses vdev->lock instead.

We can keep the assignment for the time being to be safe until that
issue gets resolved, but I'd still like to use the stream mutex instead
of the queue mutex.

> > >       /* Buffers queue. */
> > >       unsigned int frozen : 1;
> > >       struct uvc_video_queue queue;
> > >
> > > ---
> > > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > > change-id: 20250716-uvc-onelocksless-b66658e01f89

-- 
Regards,

Laurent Pinchart

