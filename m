Return-Path: <linux-media+bounces-22275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95479DBD82
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3362821DA
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D81C1C4635;
	Thu, 28 Nov 2024 22:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kZrKO78U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A688B1C2439;
	Thu, 28 Nov 2024 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832901; cv=none; b=HX3Urbv58gGj3vZQRBQOoY/j1J+ouLpxAOLdA3Ae8R5QQzToZ1O1uTJ1WAXhsZPmBnPCLwZP9jEScSQLJM4Kblqr3m0O3NmpSJsFgyuMim3AiLSYALTM9T4+0qIoJNKpS8YFRG3orzylo+GDUsj6NnhHoKG9HymOMUJzIzpLt5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832901; c=relaxed/simple;
	bh=PuRA/oKcYO/DaboUdRBHzaDmIdxsINe42WiTaGHCyPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaobSJx+QHiAZcKJTAbKStGIGZF0LxRV3eO2BDMACDEFoav2PXdJ/ARCqfALchXL+Y6bWj2vTISgtwVAKIT2dmKtLXUaBAh0LpGdlcb9pu9Kbi8B75iRYMbkGgllvjf1WfOU5it91GpeBTzX/mLBUW5YtQyLdYDs8u81I8KcZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kZrKO78U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88E7F526;
	Thu, 28 Nov 2024 23:27:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732832873;
	bh=PuRA/oKcYO/DaboUdRBHzaDmIdxsINe42WiTaGHCyPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZrKO78UEj4pufWAhiGdv3IysU4Pw8iykfTtTKGj+b89rxg88S0joZhxfXyoJMNdL
	 HazIcUHjB9VWxaGvikj5cC+CSEMl0GEnG3BSx076e22mHjqgR/+j+d+U1+TNLp2Ycn
	 /abMxqs8wcLNGEPvc6/jo0aFF8yqUUAMP6URXLmA=
Date: Fri, 29 Nov 2024 00:28:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: uvcvideo: Remove dangling pointers
Message-ID: <20241128222807.GG25731@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-1-510aab9570dd@chromium.org>
 <20241128221649.GE25731@pendragon.ideasonboard.com>
 <CANiDSCuEPPoLjukjoO_BVVsRL22kebUnCxo3eTKJqMRg6J0fSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuEPPoLjukjoO_BVVsRL22kebUnCxo3eTKJqMRg6J0fSw@mail.gmail.com>

On Thu, Nov 28, 2024 at 11:25:25PM +0100, Ricardo Ribalda wrote:
> On Thu, 28 Nov 2024 at 23:17, Laurent Pinchart wrote:
> > On Wed, Nov 27, 2024 at 12:14:49PM +0000, Ricardo Ribalda wrote:
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
> >
> > s/). A/), a/
> >
> > > that it is properly handled.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 38 ++++++++++++++++++++++++++++++++++++--
> > >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> > >  drivers/media/usb/uvc/uvcvideo.h |  8 +++++++-
> > >  3 files changed, 45 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 4fe26e82e3d1..b6af4ff92cbd 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >
> > How about adding
> 
> SGTM.
> 
> >
> > static void uvc_ctrl_set_handle(struct uvc_control *ctrl, uvc_fh *handle)
> > {
> >         if (handle) {
> >                 if (!ctrl->handle)
> >                         handle->pending_async_ctrls++;
> >                 ctrl->handle = handle;
> >         } else if (ctrl->handle) {
> >                 ctrl->handle = NULL;
> >                 if (!WARN_ON(!handle->pending_async_ctrls))
>
> Unless you think otherwise. I will make this:
> 
> WARN_ON(!handle->pending_async_ctrls);
> if (handle->pending_async_ctrls)
>    handle->pending_async_ctrls--;

I'm fine with that, I went back and forth between the two.

> The double negation is difficult to read. I am pretty sure the
> compiler will do its magic and merge the two checks.
>
> >                         handle->pending_async_ctrls--;
> >         }
> > }
> >
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
> > This would become
> >
> >         handle = ctrl->handle;
> >         uvc_ctrl_set_handle(ctrl, NULL);
> >
> > >
> > >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> > >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > > @@ -2046,8 +2051,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >       mapping->set(mapping, value,
> > >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > >
> > > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > > +             if (!ctrl->handle)
> > > +                     handle->pending_async_ctrls++;
> > >               ctrl->handle = handle;
> > > +     }
> >
> > Here
> >
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> >                 uvc_ctrl_set_handle(ctrl, handle);
> >
> > >
> > >       ctrl->dirty = 1;
> > >       ctrl->modified = 1;
> > > @@ -2770,6 +2778,32 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> > > +             for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > > +                     struct uvc_control *ctrl = &entity->controls[i];
> > > +
> > > +                     if (ctrl->handle != handle)
> > > +                             continue;
> > > +
> > > +                     ctrl->handle = NULL;
> > > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > > +                             continue;
> > > +                     handle->pending_async_ctrls--;
> >
> > And here
> >
> >                         uvc_ctrl_set_handle(ctrl, NULL);
> >
> > It seems less error-prone to centralize the logic. I'd add a
> > lockdep_assert() in uvc_ctrl_set_handle(), but there's no easy access to
> > the chain there.
> >
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
> > > index 07f9921d83f2..c68659b70221 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -337,7 +337,10 @@ struct uvc_video_chain {
> > >       struct uvc_entity *processing;          /* Processing unit */
> > >       struct uvc_entity *selector;            /* Selector unit */
> > >
> > > -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > > +     struct mutex ctrl_mutex;                /*
> > > +                                              * Protects ctrl.info and
> > > +                                              * uvc_fh.pending_async_ctrls
> > > +                                              */
> > >
> > >       struct v4l2_prio_state prio;            /* V4L2 priority state */
> > >       u32 caps;                               /* V4L2 chain-wide caps */
> > > @@ -612,6 +615,7 @@ struct uvc_fh {
> > >       struct uvc_video_chain *chain;
> > >       struct uvc_streaming *stream;
> > >       enum uvc_handle_state state;
> > > +     unsigned int pending_async_ctrls;
> > >  };
> > >
> > >  struct uvc_driver {
> > > @@ -797,6 +801,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
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

