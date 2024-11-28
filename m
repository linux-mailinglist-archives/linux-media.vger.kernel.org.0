Return-Path: <linux-media+bounces-22258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F229DBD11
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4336CB21DDD
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784C11C460C;
	Thu, 28 Nov 2024 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1b1CFBL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2335E1C3043;
	Thu, 28 Nov 2024 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827104; cv=none; b=GQK26HCIX/aydIuuLDeouLBUs1wZgS5HP/sF9tzAudsnmF0AfK2/1Ge5gw2z6p6MGaOy3ief32Z1Jd9EZhgGxy5UXNPfVUTMO5AVtVrswSlIeL4O9wmdvjo+gOFk9yKCXnMZmhRYybPU9xMON7fTP2FG3IKu7JqTiNTDWJGbtYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827104; c=relaxed/simple;
	bh=XYNdnQsuOuENwVuFCQPH8d/EawCzR1g6/sMu75B/Kkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlMBczmR0D7bzWhJW+z6ur5IUIDXh8QDv5lAyYJDczhYg4Uq+n/KfWEnMcPYVsn0+eHnIxoshm5jXWeTuZVr6oamjrkS7PhdvQFrYwjx2GaeeDz9/ysppm5thxGYUrbhpRphwNZd2L+oMyTjdL7Vxcyde4FkpARZiw/0XyQ/Y7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L1b1CFBL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25BD859D;
	Thu, 28 Nov 2024 21:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732827077;
	bh=XYNdnQsuOuENwVuFCQPH8d/EawCzR1g6/sMu75B/Kkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1b1CFBLVQPZy6/NOYjesoREw1wx4pl/GxX/VOVfaKs8uPCSVhfTQvtC+L5+LKvvK
	 3ZKhG961L6+7ljnOt1INPdPsHiG4HwwikiGtplnOLfVtqmg4CkYDPvor4wQEZDSpxO
	 iW91L1o+5gEzG9Jty/PZvE40g1BuynFK8ALm6LP8=
Date: Thu, 28 Nov 2024 22:51:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Remove dangling pointers
Message-ID: <20241128205130.GC25731@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org>
 <20241127093506.GE31095@pendragon.ideasonboard.com>
 <CANiDSCtAxfnKbfEBedaDMvMJX49axeENp=gYPF65pKtgt5_XcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtAxfnKbfEBedaDMvMJX49axeENp=gYPF65pKtgt5_XcQ@mail.gmail.com>

On Wed, Nov 27, 2024 at 11:23:48AM +0100, Ricardo Ribalda wrote:
> On Wed, 27 Nov 2024 at 10:35, Laurent Pinchart wrote:
> > On Wed, Nov 27, 2024 at 07:46:11AM +0000, Ricardo Ribalda wrote:
> > > When an async control is written, we copy a pointer to the file handle
> > > that started the operation. That pointer will be used when the device is
> > > done. Which could be anytime in the future.
> > >
> > > If the user closes that file descriptor, its structure will be freed,
> > > and there will be one dangling pointer per pending async control, that
> > > the driver will try to use.
> > >
> > > Clean all the dangling pointers during release().
> > >
> > > To avoid adding a performance penalty in the most common case (no async
> > > operation). A counter has been introduced with some logic to make sure
> > > that it is properly handled.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
> > >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> > >  drivers/media/usb/uvc/uvcvideo.h |  3 +++
> > >  3 files changed, 43 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 5d3a28edf7f0..51a53ad25e9c 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > >       mutex_lock(&chain->ctrl_mutex);
> > >
> > >       handle = ctrl->handle;
> > > -     ctrl->handle = NULL;
> > > +     if (handle) {
> > > +             ctrl->handle = NULL;
> > > +             WARN_ON(!handle->pending_async_ctrls);
> > > +             if (handle->pending_async_ctrls)
> > > +                     handle->pending_async_ctrls--;
> > > +     }
> >
> > There's at least one other location where ctrl->handle is reset to NULL.
> 
> That assignment is not needed. I added a patch to remove it in the next version.
> 
> > >
> > >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> > >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > > @@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >       mapping->set(mapping, value,
> > >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > >
> > > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > > +             if (!ctrl->handle)
> > > +                     handle->pending_async_ctrls++;
> > >               ctrl->handle = handle;
> >
> > Is this protected by ctrl_mutex ?
> 
> yes, uvc_ctrl_set is only called by uvc_ioctl_s_try_ext_ctrls that
> calls uvc_ctrl_begin

You're right. I think I figured out after writing this part of the
review, and forgot to delete it. Sorry.

> I will send another patch to add an annotation to the function to make
> it explicit.
> 
> > Please be careful about locking and race conditions, taking the time to
> > double check will help getting your patches merged faster.
> >
> > > +     }
> > >
> > >       ctrl->dirty = 1;
> > >       ctrl->modified = 1;
> > > @@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > >       return 0;
> > >  }
> > >
> > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > +{
> > > +     struct uvc_entity *entity;
> > > +
> > > +     guard(mutex)(&handle->chain->ctrl_mutex);
> > > +
> > > +     if (!handle->pending_async_ctrls)
> > > +             return;
> > > +
> > > +     list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > > +             int i;
> >
> > unsigned int
> >
> > I wonder if these days you could event write
> >
> >                 for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> >
> > > +
> > > +             for (i = 0; i < entity->ncontrols; ++i) {
> > > +                     struct uvc_control *ctrl = &entity->controls[i];
> > > +
> > > +                     if (!ctrl->handle || ctrl->handle != handle)
> >
> > Given that handle can't be null, you can write
> >
> >                         if (ctrl->handle != handle)
> >
> > > +                             continue;
> > > +
> > > +                     ctrl->handle = NULL;
> > > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > > +                             continue;
> >
> > Is this needed ? If we find more controls for this handle than
> > pending_async_ctrls, decrementing it below 0 will case the WARN_ON() at
> > the end of this function to trigger, isn't that enough ?
> 
> I want to know if the warning is triggered because I have too many
> pending_async_ctrls or too little.

You could also print the value of pending_async_ctrls at the end, it
would give you that information, and tell you how many you're missing.
Not a big deal, and I don't expect that warning to be triggered.

> > > +                     handle->pending_async_ctrls--;
> > > +             }
> > > +     }
> > > +
> > > +     WARN_ON(handle->pending_async_ctrls);
> > > +}
> > > +
> > >  /*
> > >   * Cleanup device controls.
> > >   */
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index 97c5407f6603..b425306a3b8c 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> > >
> > >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > >
> > > +     uvc_ctrl_cleanup_fh(handle);
> > > +
> > >       /* Only free resources if this is a privileged handle. */
> > >       if (uvc_has_privileges(handle))
> > >               uvc_queue_release(&stream->queue);
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 07f9921d83f2..2f8a9c48e32a 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -612,6 +612,7 @@ struct uvc_fh {
> > >       struct uvc_video_chain *chain;
> > >       struct uvc_streaming *stream;
> > >       enum uvc_handle_state state;
> > > +     unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
> >
> > The kernel does it the other way around, it lists in the documentation
> > of the lock what data it protects.
> >
> > >  };
> > >
> > >  struct uvc_driver {
> > > @@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> > >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> > >                     struct uvc_xu_control_query *xqry);
> > >
> > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > > +
> > >  /* Utility functions */
> > >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > >                                           u8 epaddr);

-- 
Regards,

Laurent Pinchart

