Return-Path: <linux-media+bounces-33256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6DAC2252
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EAFE1BC50B5
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECCE2356B2;
	Fri, 23 May 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KWH490rE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDAA2036ED;
	Fri, 23 May 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001880; cv=none; b=obBCcaqY0NCx/VthtJB3Lti9+lqDt0YboqQh2t8qD6aQ4PHreFPYPtgRDLAGnM+H3gnvPGXfVojUsHK+XWzKPb6xCm8aNzZ0WtErIIumhQNxVJjY1zUv/ANOny649oZbG3JhndJ+E+yOMK4gk44Z6tYwk5RoLLL5PWBqIjzX+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001880; c=relaxed/simple;
	bh=KUciZpVHXkEANVkxmh/SLhERPr0kKkkkuizcZDLh1OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSm1T+38nQSNw4oh01Z+iMKsMsHFmmEL3l/lbYeiDkUmOUCJxTK8kaT5KyEgN4FUceigQnW277jYKzRuYxdL6qdh0hXbEyX96XnB9Lhb85AycT9rD7CfgH6pgjPgdttvFHG7u5QCfZqdqUGODoJHFCG8E6t8GiaLHvcl16oSO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KWH490rE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6782F4A4;
	Fri, 23 May 2025 14:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748001854;
	bh=KUciZpVHXkEANVkxmh/SLhERPr0kKkkkuizcZDLh1OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWH490rEsxTFMwCvm9b+3blEsuePTcPO/YjZpGITfQspRER8doOV65JjHLtS1U9JN
	 QNSP3iIMgJojMjLGxKWIdPyCZeL7+w3VTFWo7HIJtEUNvq9Q8a8Jhf7U1gO3xzU37h
	 2Yt6qdrdOpLAu2N+WSvMIAtKc22icVm9B2eMM0P8=
Date: Fri, 23 May 2025 14:04:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
Message-ID: <20250523120430.GF12514@pendragon.ideasonboard.com>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
 <20250523085341.GA7516@pendragon.ideasonboard.com>
 <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>

On Fri, May 23, 2025 at 12:58:31PM +0200, Ricardo Ribalda wrote:
> On Fri, 23 May 2025 at 10:53, Laurent Pinchart wrote:
> > On Fri, May 09, 2025 at 06:24:13PM +0000, Ricardo Ribalda wrote:
> > > Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
> > > clearing the handle. The only common code between the two cases is the
> > > lockdep_assert_held.
> > >
> > > The code looks cleaner if we split these two usecases in two functions.
> >
> > It does indeed. Thanks for pushing for this :-)
> >
> > > We also take this opportunity to use pending_async_ctrls from ctrl where
> > > possible.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
> > >  1 file changed, 35 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> > >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> > >  }
> > >
> > > -static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > > -                            struct uvc_fh *new_handle)
> > > +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> > >  {
> > > -     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > > -
> > > -     if (new_handle) {
> > > -             int ret;
> > > +     int ret;
> > >
> > > -             if (ctrl->handle)
> > > -                     dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > > -                                          "UVC non compliance: Setting an async control with a pending operation.");
> > > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > >
> > > -             if (new_handle == ctrl->handle)
> > > -                     return 0;
> > > +     if (ctrl->handle) {
> > > +             dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > > +                                  "UVC non compliance: Setting an async control with a pending operation.");
> > >
> > > -             if (ctrl->handle) {
> > > -                     WARN_ON(!ctrl->handle->pending_async_ctrls);
> > > -                     if (ctrl->handle->pending_async_ctrls)
> > > -                             ctrl->handle->pending_async_ctrls--;
> > > -                     ctrl->handle = new_handle;
> > > -                     handle->pending_async_ctrls++;
> > > +             if (ctrl->handle == handle)
> > >                       return 0;
> > > -             }
> > > -
> > > -             ret = uvc_pm_get(handle->chain->dev);
> > > -             if (ret)
> > > -                     return ret;
> > >
> > > -             ctrl->handle = new_handle;
> > > -             handle->pending_async_ctrls++;
> > > +             WARN_ON(!ctrl->handle->pending_async_ctrls);
> > > +             if (ctrl->handle->pending_async_ctrls)
> > > +                     ctrl->handle->pending_async_ctrls--;
> > > +             ctrl->handle = handle;
> > > +             ctrl->handle->pending_async_ctrls++;
> > >               return 0;
> > >       }
> > >
> > > +     ret = uvc_pm_get(handle->chain->dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ctrl->handle = handle;
> > > +     ctrl->handle->pending_async_ctrls++;
> > > +     return 0;
> > > +}
> > > +
> > > +static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
> > > +                              struct uvc_control *ctrl)
> > > +{
> > > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > > +
> > >       /* Cannot clear the handle for a control not owned by us.*/
> >
> > While at it, I'll add a space before */ when applying.
> >
> > >       if (WARN_ON(ctrl->handle != handle))
> > >               return -EINVAL;
> >
> > But actually, as the caller guarantees that handle == ctrl->handle in
> > both call sites (renaming the function makes this clear), can we drop
> > the handle argument to this function ?
> >
> > If that's fine with you, I'd like to also change the
> > uvc_ctrl_set_handle() function to pass the ctrl argument first.
> 
> SGTM, let me know if you have time to do this or if you prefer that I do it.

I'll send a new version of this patch.

> > > -     ctrl->handle = NULL;
> > > -     if (WARN_ON(!handle->pending_async_ctrls))
> > > +     if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
> > > +             ctrl->handle = NULL;
> > >               return -EINVAL;
> > > -     handle->pending_async_ctrls--;
> > > +     }
> > > +
> > > +     ctrl->handle->pending_async_ctrls--;
> > >       uvc_pm_put(handle->chain->dev);
> >
> > This will need to become
> >
> >         uvc_pm_put(ctrl->handle->chain->dev);
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > +     ctrl->handle = NULL;
> > >       return 0;
> > >  }
> > >
> > > @@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > >
> > >       handle = ctrl->handle;
> > >       if (handle)
> > > -             uvc_ctrl_set_handle(handle, ctrl, NULL);
> > > +             uvc_ctrl_clear_handle(handle, ctrl);
> > >
> > >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> > >               s32 value;
> > > @@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >
> > >               if (!rollback && handle && !ret &&
> > >                   ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > -                     ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> > > +                     ret = uvc_ctrl_set_handle(handle, ctrl);
> > >
> > >               if (ret < 0 && !rollback) {
> > >                       if (err_ctrl)
> > > @@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > >                       if (entity->controls[i].handle != handle)
> > >                               continue;
> > > -                     uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> > > +                     uvc_ctrl_clear_handle(handle, &entity->controls[i]);
> > >               }
> > >       }
> > >

-- 
Regards,

Laurent Pinchart

