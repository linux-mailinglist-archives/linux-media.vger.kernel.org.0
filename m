Return-Path: <linux-media+bounces-37521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD577B020E9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E47F4A4324
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3072ED842;
	Fri, 11 Jul 2025 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jWT4zqrD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD52BE622;
	Fri, 11 Jul 2025 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249220; cv=none; b=Fib8zpcoFW7TvVpWTm6OS22ooYUStojX8AiBS9HoOBtgzLd6tUhUvv4nDNtysTTOEWy+kZdBUbHb4E5kmDIAl65U2iwKR2TRoCMRFOe/HXLoP1VcLF+prTsDq6aoOc+yT0QVs51rf5Vl6t4ibo/TxBUmM6EaTzyz6v7d7v45rKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249220; c=relaxed/simple;
	bh=nyiF00MPXx6ylE57yYw9nF6gq3H56h633Sk9ezskolo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSpl8OwXZ+8JZEGKBBvWzT3G1bhBUMl5Qk1yle2WBEBmlMk/tapsG4H0Q0R68knc0AJd1sOlXYksB3NJxFjEZ7HrCc4Ng2xP4kgKcuEB/RjciCv/hBylxnq4i05ZGUlama2LR2NFx0zW49jNttrk1irrpdefSccYQCzUXhFwVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jWT4zqrD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C465AD77;
	Fri, 11 Jul 2025 17:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752249186;
	bh=nyiF00MPXx6ylE57yYw9nF6gq3H56h633Sk9ezskolo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWT4zqrDqjkm382mcEBFz/3zq29J73El8VqC9uACLpBCKHdyuo4htaaDUITfcW0ym
	 fUWbynwYZvwdcFI/f96MwsJcwE0AGbsmtmpoB8jKlmzuN4apMqGeoU2HEnlT1b1mqT
	 xVOIDX39CCD7V2owyHWuArmoGgoW8YqscNFU5vpI=
Date: Fri, 11 Jul 2025 18:53:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 2/3] media: uvcvideo: Use vb2 ioctl and fop helpers
Message-ID: <20250711155304.GA28533@pendragon.ideasonboard.com>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-2-508a293eae81@chromium.org>
 <20250602183126.GI23515@pendragon.ideasonboard.com>
 <CANiDSCvX=18JEA90Z79mSuEQcXc-sufuBF2mbv0=SriVc+yXVw@mail.gmail.com>
 <20250603084926.GB3879@pendragon.ideasonboard.com>
 <CANiDSCt2dkYZYF2XG4xEYJX_--mHVAjnP4zBaXYnnj-zgF5Z1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt2dkYZYF2XG4xEYJX_--mHVAjnP4zBaXYnnj-zgF5Z1w@mail.gmail.com>

Hi Ricardo,

On Tue, Jun 03, 2025 at 12:07:09PM +0200, Ricardo Ribalda wrote:
> On Tue, 3 Jun 2025 at 10:49, Laurent Pinchart wrote:
> > On Mon, Jun 02, 2025 at 09:53:09PM +0200, Ricardo Ribalda wrote:
> > > On Mon, 2 Jun 2025 at 20:31, Laurent Pinchart wrote:
> > > > On Mon, Jun 02, 2025 at 12:59:03PM +0000, Ricardo Ribalda wrote:
> > > > > From: Hans Verkuil <hans@jjverkuil.nl>
> > > > >
> > > > > When uvc was written the vb2 ioctl and file operation helpers didn't exist.
> > > > >
> > > > > This patch switches uvc over to those helpers, which removes a lot of
> > > > > boilerplate code and simplifies VIDIOC_G/S_PRIORITY handling
> > > >
> > > > How does it simplify VIDIOC_[GS]_PRIORITY handling ? The only thing this
> > > > patch does related to priority is replace the per-chain priority
> > > > handling with a per-device (as in uvc_device) priority, as the default
> > > > is to use the prio state from v4l2_device. I think this is actually
> > > > incorrect, a UVC device can have multiple independent streaming
> > > > interfaces, so the priority ioctls should no operate on a device-wide
> > > > prio state. Am I missing something ?
> > >
> > > You are correct.
> > > The uvcvideo is the only driver that does not use the prio state from
> > > v4l2_device and it makes v4l2-core a bit more complicated.
> > >
> > > I have not seen a real use of  VIDIOC_[GS]_PRIORITY, so being a bit
> > > incorrect in favor of simplicity is probably a good trade-off.
> > > Anyway it is an easy change to split into a different patch, we can
> > > have the discussion about prio there.
> > >
> > > > > and allows us
> > > > > to drop the 'privileges' scheme, since that's now handled inside the vb2
> > > > > helpers.
> > > >
> > > > That part is correct. The driver implements a privilege-management
> > > > system similar to the vb2_queue_is_busy() checks in the vb2 ioctl
> > > > handlers, as the ioctl handlers didn't exist back then.
> > > >
> > > > Please reword the commit message to make this clearer. If the prio
> > > > change is also desired, it should be split in a separate patch.
> > > >
> > > > > This makes it possible for uvc to fix the v4l2-compliance streaming tests:
> > > > >  warn: v4l2-test-formats.cpp(1075): Could not set fmt2
> > > > >
> > > > > This patch introduces a change on behavior on the uvcdriver to be
> > > > > aligned with the rest of the subsystem. Now S_INPUT, S_PARM and
> > > > > S_FORMAT do no grant exclusive ownership of the device.
> > > >
> > > > There are other changes in behaviour worth noting, some small, some
> > > > quite substantial. Let's start with the small one: .vidioc_querybuf()
> > > > now succeeds when the queue is busy. It seems a check may be missing in
> > > > v4l2-compliance for this.
> > >
> > > Agree,
> > > After we land this we can add the check to v4l2-compliance.
> > >
> > > > The bigger change is related to locking. See below.
> > > >
> > > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > > > Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
> > > > > Signed-off-by: Hans Verkuil <hans@jjverkuil.nl>
> > > > > Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_driver.c   |  34 +----
> > > > >  drivers/media/usb/uvc/uvc_metadata.c |   8 +-
> > > > >  drivers/media/usb/uvc/uvc_queue.c    | 143 --------------------
> > > > >  drivers/media/usb/uvc/uvc_v4l2.c     | 251 +++--------------------------------
> > > > >  drivers/media/usb/uvc/uvcvideo.h     |  37 +-----
> > > > >  5 files changed, 30 insertions(+), 443 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > index da24a655ab68cc0957762f2b67387677c22224d1..4eeedab93b90939fc4c925012a18b7d018ade39f 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > @@ -1725,7 +1725,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
> > > > >       INIT_LIST_HEAD(&chain->entities);
> > > > >       mutex_init(&chain->ctrl_mutex);
> > > > >       chain->dev = dev;
> > > > > -     v4l2_prio_init(&chain->prio);
> > > > >
> > > > >       return chain;
> > > > >  }
> > > > > @@ -1958,31 +1957,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
> > > > >               if (!video_is_registered(&stream->vdev))
> > > > >                       continue;
> > > > >
> > > > > -             /*
> > > > > -              * For stream->vdev we follow the same logic as:
> > > > > -              * vb2_video_unregister_device().
> > > > > -              */
> > > > > -
> > > > > -             /* 1. Take a reference to vdev */
> > > > > -             get_device(&stream->vdev.dev);
> > > > > -
> > > > > -             /* 2. Ensure that no new ioctls can be called. */
> > > > > -             video_unregister_device(&stream->vdev);
> > > > > -
> > > > > -             /* 3. Wait for old ioctls to finish. */
> > > > > -             mutex_lock(&stream->mutex);
> > > > > -
> > > > > -             /* 4. Stop streaming. */
> > > > > -             uvc_queue_release(&stream->queue);
> > > > > -
> > > > > -             mutex_unlock(&stream->mutex);
> > > > > -
> > > > > -             put_device(&stream->vdev.dev);
> > > > > -
> > > > > -             /*
> > > > > -              * For stream->meta.vdev we can directly call:
> > > > > -              * vb2_video_unregister_device().
> > > > > -              */
> > > > > +             vb2_video_unregister_device(&stream->vdev);
> > > > >               vb2_video_unregister_device(&stream->meta.vdev);
> > > > >
> > > > >               /*
> > > > > @@ -2029,7 +2004,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> > > > >       vdev->fops = fops;
> > > > >       vdev->ioctl_ops = ioctl_ops;
> > > > >       vdev->release = uvc_release;
> > > > > -     vdev->prio = &stream->chain->prio;
> > > > > +     vdev->queue = &queue->queue;
> > > > > +     vdev->lock = &queue->mutex;
> > > >
> > > > This will cause the ioctl handlers to use queue->mutex for all ioctls
> > > > (both INFO_FL_QUEUE and !INFO_FL_QUEUE). Locking therefore gets more
> > > > coarse, that should be mentioned in the commit message.
> > > >
> > > > >       if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > > >               vdev->vfl_dir = VFL_DIR_TX;
> > > > >       else
> > > > > @@ -2399,8 +2375,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
> > > > >               if (stream->intf == intf) {
> > > > >                       ret = uvc_video_resume(stream, reset);
> > > > >                       if (ret < 0)
> > > > > -                             uvc_queue_streamoff(&stream->queue,
> > > > > -                                                 stream->queue.queue.type);
> > > > > +                             vb2_streamoff(&stream->queue.queue,
> > > > > +                                           stream->queue.queue.type);
> > > >
> > > > This doesn't take any lock anymore. Can that be a problem ?
> > >
> > > ack
> > > Probably better to keep the same lock pattern as before. I am adding
> > > mutex_lock/unlock
> > >
> > > > >                       return ret;
> > > > >               }
> > > > >       }
> > > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > index 82de7781f5b6b70c5ba16bcba9e0741231231904..d3aab22f91cea21aefc56409924dfa1451aec914 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > @@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
> > > > >        */
> > > > >       mutex_lock(&stream->mutex);
> > > >
> > > > Is this lock still needed ? More broadly speaking, what's the remaining
> > > > purpose of stream->mutex ? Or perhaps the other way around, shouldn't we
> > > > drop queue->mutex, and use stream->mutex everywhere instead ?
> > >
> > > Good question, this is the first thing that I tried, and there are
> > > plenty of nested locking that are wrong:
> > > lock(stream->mutex)
> > >   lock(stream->muex)
> > >
> > > It is probably fixable, but we can do that as a follow-up patch.
> >
> > The current locking scheme was designed with two locks, to separate
> > locking of the buffer-related ioctls from the other ioctls, the same way
> > that the V4L2 core has a video_device lock and a vb2_queue lock. We
> > could keep the same design and move to using separate video_device and
> > vb2_queue locks, but that's not what this patch does. I'm OK with
> > switching to a single lock as I can't provide compelling evidence that
> > two locks significantly improve performance (do they ever, or should
> > V4L2 drop that ?) with uvcvideo at the moment, but I'd like the locking
> > scheme to remain clean and understandable.
> 
> I agree with your goal of having a single lock. The question is how to
> reach that goal.
> 
> I think it is easier/better to do it in two steps:
> 1) Land this set, where the queue->mutex locks more ioctls than
> before, and we keep the stream->mutex
> 2) Remove one of the mutex.
> 
> My reasons are:
> - You, HdG, HansV  and I are familiar with the current change and have
> already reviewed it.
> - Completely refactoring the locking in the same patch will make the
> code more difficult to review.
> - There are other patchsets that conflict with this set.
> - HansV expressed that he wants this addressed with priority.
> - The patch fixes v4l2-compliance.
> - The patch simplifies the code.
> 
> I will look into the new locking the same way that I have been looking
> into other housekeeping changes in the uvc driver. But I do not
> believe that we should block the development for this.

I disagree this is best done on top, but I won't block the series for
this. I do however expect a new patch series to address the issue, I
feel quite uncomfortable leaving the code in its current state as it
gives me an impression of an unfinished job that leaves possible bugs
behind.

> > > > >
> > > > > -     if (uvc_queue_allocated(&stream->queue))
> > > > > +     if (vb2_is_busy(&stream->meta.queue.queue))
> > > > >               ret = -EBUSY;
> > > > >       else
> > > > >               stream->meta.format = fmt->dataformat;
> > > > > @@ -164,12 +164,6 @@ int uvc_meta_register(struct uvc_streaming *stream)
> > > > >
> > > > >       stream->meta.format = V4L2_META_FMT_UVC;
> > > > >
> > > > > -     /*
> > > > > -      * The video interface queue uses manual locking and thus does not set
> > > > > -      * the queue pointer. Set it manually here.
> > > > > -      */
> > > > > -     vdev->queue = &queue->queue;
> > > > > -
> > > > >       return uvc_register_video_device(dev, stream, vdev, queue,
> > > > >                                        V4L2_BUF_TYPE_META_CAPTURE,
> > > > >                                        &uvc_meta_fops, &uvc_meta_ioctl_ops);
> > > > > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > > > > index 2ee142621042167c2587b6a6fdd51c1a46d31c11..72c5494dee9f46ff61072e7d293bfaddda40e615 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_queue.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > > > > @@ -242,153 +242,10 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > -void uvc_queue_release(struct uvc_video_queue *queue)
> > > > > -{
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     vb2_queue_release(&queue->queue);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -}
> > > > > -
> > > > > -/* -----------------------------------------------------------------------------
> > > > > - * V4L2 queue operations
> > > > > - */
> > > > > -
> > > > > -int uvc_request_buffers(struct uvc_video_queue *queue,
> > > > > -                     struct v4l2_requestbuffers *rb)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_reqbufs(&queue->queue, rb);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret ? ret : rb->count;
> > > > > -}
> > > > > -
> > > > > -int uvc_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_querybuf(&queue->queue, buf);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_create_buffers(struct uvc_video_queue *queue,
> > > > > -                    struct v4l2_create_buffers *cb)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_create_bufs(&queue->queue, cb);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_queue_buffer(struct uvc_video_queue *queue,
> > > > > -                  struct media_device *mdev, struct v4l2_buffer *buf)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_qbuf(&queue->queue, mdev, buf);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_export_buffer(struct uvc_video_queue *queue,
> > > > > -                   struct v4l2_exportbuffer *exp)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_expbuf(&queue->queue, exp);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
> > > > > -                    int nonblocking)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_dqbuf(&queue->queue, buf, nonblocking);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_streamon(&queue->queue, type);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> > > > > -{
> > > > > -     int ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_streamoff(&queue->queue, type);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > > -int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
> > > > > -{
> > > > > -     return vb2_mmap(&queue->queue, vma);
> > > > > -}
> > > > > -
> > > > > -#ifndef CONFIG_MMU
> > > > > -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
> > > > > -             unsigned long pgoff)
> > > > > -{
> > > > > -     return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
> > > > > -}
> > > > > -#endif
> > > > > -
> > > > > -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
> > > > > -                         poll_table *wait)
> > > > > -{
> > > > > -     __poll_t ret;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     ret = vb2_poll(&queue->queue, file, wait);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return ret;
> > > > > -}
> > > > > -
> > > > >  /* -----------------------------------------------------------------------------
> > > > >   *
> > > > >   */
> > > > >
> > > > > -/*
> > > > > - * Check if buffers have been allocated.
> > > > > - */
> > > > > -int uvc_queue_allocated(struct uvc_video_queue *queue)
> > > > > -{
> > > > > -     int allocated;
> > > > > -
> > > > > -     mutex_lock(&queue->mutex);
> > > > > -     allocated = vb2_is_busy(&queue->queue);
> > > > > -     mutex_unlock(&queue->mutex);
> > > > > -
> > > > > -     return allocated;
> > > > > -}
> > > > > -
> > > > >  /*
> > > > >   * Cancel the video buffers queue.
> > > > >   *
> > > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..7a5ecbefa32c0a6b74c85d7f77a25b433598471e 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > > @@ -47,8 +47,6 @@ void uvc_pm_put(struct uvc_device *dev)
> > > > >       usb_autopm_put_interface(dev->intf);
> > > > >  }
> > > > >
> > > > > -static int uvc_acquire_privileges(struct uvc_fh *handle);
> > > > > -
> > > > >  static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
> > > > >                                     struct uvc_control_mapping *map,
> > > > >                                     const struct uvc_xu_control_mapping *xmap)
> > > > > @@ -436,10 +434,6 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > >       const struct uvc_frame *frame;
> > > > >       int ret;
> > > > >
> > > > > -     ret = uvc_acquire_privileges(handle);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > >       if (fmt->type != stream->type)
> > > > >               return -EINVAL;
> > > > >
> > > > > @@ -448,8 +442,7 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
> > > > >               return ret;
> > > > >
> > > > >       mutex_lock(&stream->mutex);
> > > > > -
> > > > > -     if (uvc_queue_allocated(&stream->queue)) {
> > > > > +     if (vb2_is_busy(&stream->queue.queue)) {
> > > > >               ret = -EBUSY;
> > > > >               goto done;
> > > > >       }
> > > > > @@ -513,10 +506,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > > >       unsigned int i;
> > > > >       int ret;
> > > > >
> > > > > -     ret = uvc_acquire_privileges(handle);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > >       if (parm->type != stream->type)
> > > > >               return -EINVAL;
> > > > >
> > > > > @@ -593,63 +582,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > -/* ------------------------------------------------------------------------
> > > > > - * Privilege management
> > > > > - */
> > > > > -
> > > > > -/*
> > > > > - * Privilege management is the multiple-open implementation basis. The current
> > > > > - * implementation is completely transparent for the end-user and doesn't
> > > > > - * require explicit use of the VIDIOC_G_PRIORITY and VIDIOC_S_PRIORITY ioctls.
> > > > > - * Those ioctls enable finer control on the device (by making possible for a
> > > > > - * user to request exclusive access to a device), but are not mature yet.
> > > > > - * Switching to the V4L2 priority mechanism might be considered in the future
> > > > > - * if this situation changes.
> > > > > - *
> > > > > - * Each open instance of a UVC device can either be in a privileged or
> > > > > - * unprivileged state. Only a single instance can be in a privileged state at
> > > > > - * a given time. Trying to perform an operation that requires privileges will
> > > > > - * automatically acquire the required privileges if possible, or return -EBUSY
> > > > > - * otherwise. Privileges are dismissed when closing the instance or when
> > > > > - * freeing the video buffers using VIDIOC_REQBUFS.
> > > > > - *
> > > > > - * Operations that require privileges are:
> > > > > - *
> > > > > - * - VIDIOC_S_INPUT
> > > > > - * - VIDIOC_S_PARM
> > > > > - * - VIDIOC_S_FMT
> > > > > - * - VIDIOC_CREATE_BUFS
> > > > > - * - VIDIOC_REQBUFS
> > > > > - */
> > > > > -static int uvc_acquire_privileges(struct uvc_fh *handle)
> > > > > -{
> > > > > -     /* Always succeed if the handle is already privileged. */
> > > > > -     if (handle->state == UVC_HANDLE_ACTIVE)
> > > > > -             return 0;
> > > > > -
> > > > > -     /* Check if the device already has a privileged handle. */
> > > > > -     if (atomic_inc_return(&handle->stream->active) != 1) {
> > > > > -             atomic_dec(&handle->stream->active);
> > > > > -             return -EBUSY;
> > > > > -     }
> > > > > -
> > > > > -     handle->state = UVC_HANDLE_ACTIVE;
> > > > > -     return 0;
> > > > > -}
> > > > > -
> > > > > -static void uvc_dismiss_privileges(struct uvc_fh *handle)
> > > > > -{
> > > > > -     if (handle->state == UVC_HANDLE_ACTIVE)
> > > > > -             atomic_dec(&handle->stream->active);
> > > > > -
> > > > > -     handle->state = UVC_HANDLE_PASSIVE;
> > > > > -}
> > > > > -
> > > > > -static int uvc_has_privileges(struct uvc_fh *handle)
> > > > > -{
> > > > > -     return handle->state == UVC_HANDLE_ACTIVE;
> > > > > -}
> > > > > -
> > > > >  /* ------------------------------------------------------------------------
> > > > >   * V4L2 file operations
> > > > >   */
> > > > > @@ -671,7 +603,6 @@ static int uvc_v4l2_open(struct file *file)
> > > > >       v4l2_fh_add(&handle->vfh);
> > > > >       handle->chain = stream->chain;
> > > > >       handle->stream = stream;
> > > > > -     handle->state = UVC_HANDLE_PASSIVE;
> > > > >       file->private_data = handle;
> > > > >
> > > > >       return 0;
> > > > > @@ -686,18 +617,11 @@ static int uvc_v4l2_release(struct file *file)
> > > > >
> > > > >       uvc_ctrl_cleanup_fh(handle);
> > > > >
> > > > > -     /* Only free resources if this is a privileged handle. */
> > > > > -     if (uvc_has_privileges(handle))
> > > > > -             uvc_queue_release(&stream->queue);
> > > > > -
> > > > >       if (handle->is_streaming)
> > > > >               uvc_pm_put(stream->dev);
> > > > >
> > > > >       /* Release the file handle. */
> > > > > -     uvc_dismiss_privileges(handle);
> > > > > -     v4l2_fh_del(&handle->vfh);
> > > > > -     v4l2_fh_exit(&handle->vfh);
> > > > > -     kfree(handle);
> > > > > +     vb2_fop_release(file);
> > > > >       file->private_data = NULL;
> > > >
> > > > You can drop setting private_data to NULL, it's done by
> > > > v4l2_fh_release() called by vb2_fop_release().
> > >
> > > ack
> > >
> > > > >
> > > > >       return 0;
> > > > > @@ -753,91 +677,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> > > > >       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> > > > >  }
> > > > >
> > > > > -static int uvc_ioctl_reqbufs(struct file *file, void *fh,
> > > > > -                          struct v4l2_requestbuffers *rb)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -     int ret;
> > > > > -
> > > > > -     ret = uvc_acquire_privileges(handle);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > > -     mutex_lock(&stream->mutex);
> > > > > -     ret = uvc_request_buffers(&stream->queue, rb);
> > > > > -     mutex_unlock(&stream->mutex);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > > -     if (ret == 0)
> > > > > -             uvc_dismiss_privileges(handle);
> > > > > -
> > > > > -     return 0;
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_querybuf(struct file *file, void *fh,
> > > > > -                           struct v4l2_buffer *buf)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     return uvc_query_buffer(&stream->queue, buf);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     return uvc_queue_buffer(&stream->queue,
> > > > > -                             stream->vdev.v4l2_dev->mdev, buf);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_expbuf(struct file *file, void *fh,
> > > > > -                         struct v4l2_exportbuffer *exp)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     return uvc_export_buffer(&stream->queue, exp);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     return uvc_dequeue_buffer(&stream->queue, buf,
> > > > > -                               file->f_flags & O_NONBLOCK);
> > > > > -}
> > > > > -
> > > > > -static int uvc_ioctl_create_bufs(struct file *file, void *fh,
> > > > > -                               struct v4l2_create_buffers *cb)
> > > > > -{
> > > > > -     struct uvc_fh *handle = fh;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -     int ret;
> > > > > -
> > > > > -     ret = uvc_acquire_privileges(handle);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > > -     return uvc_create_buffers(&stream->queue, cb);
> > > > > -}
> > > > > -
> > > > >  static int uvc_ioctl_streamon(struct file *file, void *fh,
> > > > >                             enum v4l2_buf_type type)
> > > > >  {
> > > > > @@ -845,11 +684,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> > > > >       struct uvc_streaming *stream = handle->stream;
> > > > >       int ret;
> > > > >
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     guard(mutex)(&stream->mutex);
> > > > > -
> > > > >       if (handle->is_streaming)
> > > > >               return 0;
> > > > >
> > > > > @@ -857,7 +691,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > -     ret = uvc_queue_streamon(&stream->queue, type);
> > > > > +     ret = vb2_ioctl_streamon(file, fh, type);
> > > > >       if (ret) {
> > > > >               uvc_pm_put(stream->dev);
> > > > >               return ret;
> > > > > @@ -873,13 +707,12 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> > > > >  {
> > > > >       struct uvc_fh *handle = fh;
> > > > >       struct uvc_streaming *stream = handle->stream;
> > > > > +     int ret;
> > > > >
> > > > > -     if (!uvc_has_privileges(handle))
> > > > > -             return -EBUSY;
> > > > > -
> > > > > -     guard(mutex)(&stream->mutex);
> > > > > +     ret = vb2_ioctl_streamoff(file, fh, type);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > >
> > > > > -     uvc_queue_streamoff(&stream->queue, type);
> > > > >       if (handle->is_streaming) {
> > > > >               handle->is_streaming = false;
> > > > >               uvc_pm_put(stream->dev);
> > > > > @@ -962,13 +795,13 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
> > > > >  static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
> > > > >  {
> > > > >       struct uvc_fh *handle = fh;
> > > > > +     struct uvc_streaming *stream = handle->stream;
> > > > >       struct uvc_video_chain *chain = handle->chain;
> > > > >       u8 *buf;
> > > > >       int ret;
> > > > >
> > > > > -     ret = uvc_acquire_privileges(handle);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > +     if (vb2_is_busy(&stream->queue.queue))
> > > > > +             return -EBUSY;
> > > > >
> > > > >       if (chain->selector == NULL ||
> > > > >           (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
> > > > > @@ -1471,50 +1304,6 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> > > > > -                 size_t count, loff_t *ppos)
> > > > > -{
> > > > > -     struct uvc_fh *handle = file->private_data;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     uvc_dbg(stream->dev, CALLS, "%s: not implemented\n", __func__);
> > > > > -     return -EINVAL;
> > > > > -}
> > > > > -
> > > > > -static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
> > > > > -{
> > > > > -     struct uvc_fh *handle = file->private_data;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > > > > -
> > > > > -     return uvc_queue_mmap(&stream->queue, vma);
> > > > > -}
> > > > > -
> > > > > -static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
> > > > > -{
> > > > > -     struct uvc_fh *handle = file->private_data;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > > > > -
> > > > > -     return uvc_queue_poll(&stream->queue, file, wait);
> > > > > -}
> > > > > -
> > > > > -#ifndef CONFIG_MMU
> > > > > -static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
> > > > > -             unsigned long addr, unsigned long len, unsigned long pgoff,
> > > > > -             unsigned long flags)
> > > > > -{
> > > > > -     struct uvc_fh *handle = file->private_data;
> > > > > -     struct uvc_streaming *stream = handle->stream;
> > > > > -
> > > > > -     uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > > > > -
> > > > > -     return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
> > > > > -}
> > > > > -#endif
> > > > > -
> > > > >  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> > > > >       .vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
> > > > >       .vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
> > > > > @@ -1527,12 +1316,13 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> > > > >       .vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
> > > > >       .vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
> > > > >       .vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
> > > > > -     .vidioc_reqbufs = uvc_ioctl_reqbufs,
> > > > > -     .vidioc_querybuf = uvc_ioctl_querybuf,
> > > > > -     .vidioc_qbuf = uvc_ioctl_qbuf,
> > > > > -     .vidioc_expbuf = uvc_ioctl_expbuf,
> > > > > -     .vidioc_dqbuf = uvc_ioctl_dqbuf,
> > > > > -     .vidioc_create_bufs = uvc_ioctl_create_bufs,
> > > > > +     .vidioc_reqbufs = vb2_ioctl_reqbufs,
> > > > > +     .vidioc_querybuf = vb2_ioctl_querybuf,
> > > > > +     .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > > > > +     .vidioc_qbuf = vb2_ioctl_qbuf,
> > > > > +     .vidioc_expbuf = vb2_ioctl_expbuf,
> > > > > +     .vidioc_dqbuf = vb2_ioctl_dqbuf,
> > > > > +     .vidioc_create_bufs = vb2_ioctl_create_bufs,
> > > > >       .vidioc_streamon = uvc_ioctl_streamon,
> > > > >       .vidioc_streamoff = uvc_ioctl_streamoff,
> > > > >       .vidioc_enum_input = uvc_ioctl_enum_input,
> > > > > @@ -1559,11 +1349,10 @@ const struct v4l2_file_operations uvc_fops = {
> > > > >  #ifdef CONFIG_COMPAT
> > > > >       .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> > > > >  #endif
> > > > > -     .read           = uvc_v4l2_read,
> > > > > -     .mmap           = uvc_v4l2_mmap,
> > > > > -     .poll           = uvc_v4l2_poll,
> > > > > +     .mmap           = vb2_fop_mmap,
> > > > > +     .poll           = vb2_fop_poll,
> > > > >  #ifndef CONFIG_MMU
> > > > > -     .get_unmapped_area = uvc_v4l2_get_unmapped_area,
> > > > > +     .get_unmapped_area = vb2_fop_get_unmapped_area,
> > > > >  #endif
> > > > >  };
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..3ddbf065a2cbae40ee48cb06f84ca8f0052990c4 100644
> > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > @@ -326,7 +326,10 @@ struct uvc_buffer {
> > > > >
> > > > >  struct uvc_video_queue {
> > > > >       struct vb2_queue queue;
> > > > > -     struct mutex mutex;                     /* Protects queue */
> > > > > +     struct mutex mutex;                     /*
> > > > > +                                              * Serializes vb2_queue and
> > > > > +                                              * fops
> > > > > +                                              */
> > > > >
> > > > >       unsigned int flags;
> > > > >       unsigned int buf_used;
> > > > > @@ -349,7 +352,6 @@ struct uvc_video_chain {
> > > > >                                                * uvc_fh.pending_async_ctrls
> > > > >                                                */
> > > > >
> > > > > -     struct v4l2_prio_state prio;            /* V4L2 priority state */
> > > > >       u32 caps;                               /* V4L2 chain-wide caps */
> > > > >       u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
> > > > >  };
> > > > > @@ -619,16 +621,10 @@ struct uvc_device {
> > > > >       struct uvc_entity *gpio_unit;
> > > > >  };
> > > > >
> > > > > -enum uvc_handle_state {
> > > > > -     UVC_HANDLE_PASSIVE      = 0,
> > > > > -     UVC_HANDLE_ACTIVE       = 1,
> > > > > -};
> > > > > -
> > > > >  struct uvc_fh {
> > > > >       struct v4l2_fh vfh;
> > > > >       struct uvc_video_chain *chain;
> > > > >       struct uvc_streaming *stream;
> > > > > -     enum uvc_handle_state state;
> > > > >       unsigned int pending_async_ctrls;
> > > > >       bool is_streaming;
> > > > >  };
> > > > > @@ -687,36 +683,11 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
> > > > >
> > > > >  /* Video buffers queue management. */
> > > > >  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > > > > -void uvc_queue_release(struct uvc_video_queue *queue);
> > > > > -int uvc_request_buffers(struct uvc_video_queue *queue,
> > > > > -                     struct v4l2_requestbuffers *rb);
> > > > > -int uvc_query_buffer(struct uvc_video_queue *queue,
> > > > > -                  struct v4l2_buffer *v4l2_buf);
> > > > > -int uvc_create_buffers(struct uvc_video_queue *queue,
> > > > > -                    struct v4l2_create_buffers *v4l2_cb);
> > > > > -int uvc_queue_buffer(struct uvc_video_queue *queue,
> > > > > -                  struct media_device *mdev,
> > > > > -                  struct v4l2_buffer *v4l2_buf);
> > > > > -int uvc_export_buffer(struct uvc_video_queue *queue,
> > > > > -                   struct v4l2_exportbuffer *exp);
> > > > > -int uvc_dequeue_buffer(struct uvc_video_queue *queue,
> > > > > -                    struct v4l2_buffer *v4l2_buf, int nonblocking);
> > > > > -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > > > > -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > > > >  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
> > > > >  struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
> > > > >                                        struct uvc_buffer *buf);
> > > > >  struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
> > > > >  void uvc_queue_buffer_release(struct uvc_buffer *buf);
> > > > > -int uvc_queue_mmap(struct uvc_video_queue *queue,
> > > > > -                struct vm_area_struct *vma);
> > > > > -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
> > > > > -                     poll_table *wait);
> > > > > -#ifndef CONFIG_MMU
> > > > > -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
> > > > > -                                       unsigned long pgoff);
> > > > > -#endif
> > > > > -int uvc_queue_allocated(struct uvc_video_queue *queue);
> > > > >  static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
> > > > >  {
> > > > >       return vb2_is_streaming(&queue->queue);

-- 
Regards,

Laurent Pinchart

