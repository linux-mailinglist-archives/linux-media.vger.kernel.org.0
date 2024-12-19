Return-Path: <linux-media+bounces-23749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D179F714D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599D816B04A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C599474;
	Thu, 19 Dec 2024 00:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GeHhHAVi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF186AA1;
	Thu, 19 Dec 2024 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734567558; cv=none; b=kGe1i5X3IjLpwQQ3R3Y/XKg6CZl5AXymnXLsAdsxVgYC4cxb9vLMcuaBHj9c/1GC2GwNvJZ24OODHd0IODbC/LYOCd6v1/JElJFwCla9hfBuiL5ZFMp9zJ7D4PyNw8iZ24gYoi6tlC+4Z8k/dMO+mSwD6oDAMm7etLmt48qyGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734567558; c=relaxed/simple;
	bh=OMEFyjwe5L9JV4nQjqDvVoi0MU7JJ0oKE/seHS7R5Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcRGSrfUZdE5dBiiIkZA6BcApOVqk8xlAK7fY5N2UL2l3ePZM/SrzsBADzfFsHq3ZbvCN0wmj0LZPBc6Qms79ZqrcU/AGivhvj/CYHpBYidQQgWAUTQRs8C7Gjkzw5/cfq/6Sxan8nT1vK76WYsePHJPTY91HLCiiQGimiI26r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GeHhHAVi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BEFD163;
	Thu, 19 Dec 2024 01:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734567515;
	bh=OMEFyjwe5L9JV4nQjqDvVoi0MU7JJ0oKE/seHS7R5Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeHhHAViu0e6N4ogrwJJgGiJgjXTzSHqJkbE7L51EHBT+mottwTyFucSY2Z8yDMvf
	 QxX4l+k+MQKHruopYNCkrLk21Fvhqk2JmDY0l6M7to4gheSOAfjWNIeBFGXsOpaUNX
	 89EM3H2mgauU00jWrNz2+5dOHAHp+v5zpfdfvLNU=
Date: Thu, 19 Dec 2024 02:19:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 3/5] media: uvcvideo: Remove dangling pointers
Message-ID: <20241219001909.GI5518@pendragon.ideasonboard.com>
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <20241203-uvc-fix-async-v6-3-26c867231118@chromium.org>
 <CANiDSCsaoTOs0j3CFrX7=XK6eww8M-ShEMci5XkuAuhep6gdYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsaoTOs0j3CFrX7=XK6eww8M-ShEMci5XkuAuhep6gdYw@mail.gmail.com>

On Wed, Dec 04, 2024 at 01:10:14AM +0100, Ricardo Ribalda wrote:
> On Tue, 3 Dec 2024 at 22:20, Ricardo Ribalda wrote:
> >
> > When an async control is written, we copy a pointer to the file handle
> > that started the operation. That pointer will be used when the device is
> > done. Which could be anytime in the future.
> >
> > If the user closes that file descriptor, its structure will be freed,
> > and there will be one dangling pointer per pending async control, that
> > the driver will try to use.
> >
> > Clean all the dangling pointers during release().
> >
> > To avoid adding a performance penalty in the most common case (no async
> > operation), a counter has been introduced with some logic to make sure
> > that it is properly handled.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 58 ++++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
> >  3 files changed, 66 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 42b0a0cdc51c..def502195528 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1579,6 +1579,40 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > +static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > +                               struct uvc_fh *new_handle)
> > +{
> > +       lockdep_assert_held(&handle->chain->ctrl_mutex);
> > +
> > +       if (new_handle) {
> > +               if (ctrl->handle)
> > +                       dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > +                                            "UVC non compliance: Setting an async control with a pending operation.");
> > +
> > +               if (new_handle == ctrl->handle)
> > +                       return;
> > +
> > +               if (ctrl->handle) {
> > +                       WARN_ON(!ctrl->handle->pending_async_ctrls);
> > +                       if (ctrl->handle->pending_async_ctrls)
> > +                               ctrl->handle->pending_async_ctrls--;
> > +               }
> > +
> > +               ctrl->handle = new_handle;
> > +               handle->pending_async_ctrls++;
> > +               return;
> > +       }
> > +
> > +       /* Cannot clear the handle for a control not owned by us.*/
> > +       if (WARN_ON(ctrl->handle != handle))
> > +               return;
> > +
> > +       ctrl->handle = NULL;
> > +       if (WARN_ON(!handle->pending_async_ctrls))
> > +               return;
> > +       handle->pending_async_ctrls--;
> > +}
> 
> Laurent,
> 
> 
> If I have to redo the patch... would you be open to have two functions:
> uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> uvc_ctrl_clear_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> 
> instead of this one? It might be me, but it looks uglier than before.

I'd be OK with that naming. Hans has merged the series already though,
and I don't expect you'd like to delay upstreaming :-) We can always
clean things up on top, but I'd rather not address this unless you need
to rework this specific part of the driver, as there are more important
changes to upstream and additional syntaxic beautification patches would
just slow things down at this point.

> If you like this code just disregard this message.
> 
> Regards!
> 
> 
> > +
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >                            struct uvc_control *ctrl, const u8 *data)
> >  {
> > @@ -1589,7 +1623,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >         mutex_lock(&chain->ctrl_mutex);
> >
> >         handle = ctrl->handle;
> > -       ctrl->handle = NULL;
> > +       if (handle)
> > +               uvc_ctrl_set_handle(handle, ctrl, NULL);
> >
> >         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >                 s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -1863,7 +1898,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >                 if (!rollback && handle &&
> >                     ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -                       ctrl->handle = handle;
> > +                       uvc_ctrl_set_handle(handle, ctrl, handle);
> >         }
> >
> >         return 0;
> > @@ -2772,6 +2807,25 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >         return 0;
> >  }
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > +{
> > +       struct uvc_entity *entity;
> > +
> > +       guard(mutex)(&handle->chain->ctrl_mutex);
> > +
> > +       if (!handle->pending_async_ctrls)
> > +               return;
> > +
> > +       list_for_each_entry(entity, &handle->chain->dev->entities, list)
> > +               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +                       if (entity->controls[i].handle != handle)
> > +                               continue;
> > +                       uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> > +               }

Missing outer curly braces. I'll update that, no need for a new version.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +
> > +       WARN_ON(handle->pending_async_ctrls);
> > +}
> > +
> >  /*
> >   * Cleanup device controls.
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 97c5407f6603..b425306a3b8c 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> >
> >         uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> >
> > +       uvc_ctrl_cleanup_fh(handle);
> > +
> >         /* Only free resources if this is a privileged handle. */
> >         if (uvc_has_privileges(handle))
> >                 uvc_queue_release(&stream->queue);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07f9921d83f2..92ecdd188587 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -337,7 +337,11 @@ struct uvc_video_chain {
> >         struct uvc_entity *processing;          /* Processing unit */
> >         struct uvc_entity *selector;            /* Selector unit */
> >
> > -       struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > +       struct mutex ctrl_mutex;                /*
> > +                                                * Protects ctrl.info,
> > +                                                * ctrl.handle and
> > +                                                * uvc_fh.pending_async_ctrls
> > +                                                */
> >
> >         struct v4l2_prio_state prio;            /* V4L2 priority state */
> >         u32 caps;                               /* V4L2 chain-wide caps */
> > @@ -612,6 +616,7 @@ struct uvc_fh {
> >         struct uvc_video_chain *chain;
> >         struct uvc_streaming *stream;
> >         enum uvc_handle_state state;
> > +       unsigned int pending_async_ctrls;
> >  };
> >
> >  struct uvc_driver {
> > @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                       struct uvc_xu_control_query *xqry);
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                             u8 epaddr);
> >

-- 
Regards,

Laurent Pinchart

