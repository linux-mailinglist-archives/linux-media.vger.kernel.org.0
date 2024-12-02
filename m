Return-Path: <linux-media+bounces-22407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 154069DFC12
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA254281CBC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3801F9F52;
	Mon,  2 Dec 2024 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="epHYRemz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43151F943F;
	Mon,  2 Dec 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128728; cv=none; b=KQ1kigTUfRBQ9Karv1XtKHunQ6sdADLgNHI5jtk+u8DEutG/NsUmzj1Rlz558KHpH24weSsDcHLb3u2xU65Q+wkRyvYo76F9EUljDaP5m61b3iuLe3o/sAA1FxVOqxlSwD0si2xP9tOJhUqb0R38Dd8Ppy3Tr+TXpr/Cd3a9sIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128728; c=relaxed/simple;
	bh=exnzvOOzv9zTqHKHJbD28IhJgvuw44iIDxMzsn69HaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mk3QT6yrC56Fhk+GBSvGx+dYiJx5R7RC5cKLm9ONimAJnZVIzToucgFUAmeoSMXsrfY6QanyMva6OGwFy4z+ByB+eghHcH9g06v+9MZocWtfif/rsn/9NRr6JaAQsuiU9TXxe1Mj6W+HZLwKxP+3bUOamU4W2pIMVPBM/yA3rLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=epHYRemz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 801D0514;
	Mon,  2 Dec 2024 09:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733128697;
	bh=exnzvOOzv9zTqHKHJbD28IhJgvuw44iIDxMzsn69HaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epHYRemzfOh+bh1297w8d5dgPjHQFxof7wDG8fEXpQUqmMTF5nWo8nYruQh7nWq0B
	 fPrY+wOWXu7hF6cQp78JXMIWtHBRyk/Gqg/EJsgCQ40zrDwW4ohQph2F9pIltLtFMN
	 5QfQD30BSqNAk5BnHmzIAs+fqXZPPcBHOF+U2qSY=
Date: Mon, 2 Dec 2024 10:38:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241202083833.GC16635@pendragon.ideasonboard.com>
References: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com>
 <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
 <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
 <20241129220339.GD2652@pendragon.ideasonboard.com>
 <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <CANiDSCuf=YN0=Q+ariHRPUAhacd=s5SFRHsySXWDowaiJxMa3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuf=YN0=Q+ariHRPUAhacd=s5SFRHsySXWDowaiJxMa3A@mail.gmail.com>

On Mon, Dec 02, 2024 at 08:28:48AM +0100, Ricardo Ribalda wrote:
> On Mon, 2 Dec 2024 at 01:19, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> > > On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> > > > On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> > > > > Before we all go on a well deserved weekend, let me recap what we
> > > > > know. If I did not get something correctly, let me know.
> > > > >
> > > > > 1) Well behaved devices do not allow to set or get an incomplete async
> > > > > control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> > > > > 2) Both Laurent and Ricardo consider that there is a big chance that
> > > > > some camera modules do not implement this properly. (ref: years of
> > > > > crying over broken module firmware :) )
> > > > >
> > > > > 3) ctrl->handle is designed to point to the fh that originated the
> > > > > control. So the logic can decide if the originator needs to be
> > > > > notified or not. (ref: uvc_ctrl_send_event() )
> > > > > 4) Right now we replace the originator in ctrl->handle for unfinished
> > > > > async controls.  (ref:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> > > > >
> > > > > My interpretation is that:
> > > > > A) We need to change 4). We shall not change the originator of
> > > > > unfinished ctrl->handle.
> > > > > B) Well behaved cameras do not need the patch "Do not set an async
> > > > > control owned by another fh"
> > > > > C) For badly behaved cameras, it is fine if we slightly break the
> > > > > v4l2-compliance in corner cases, if we do not break any internal data
> > > > > structure.
> > > >
> > > > The fact that some devices may not implement the documented behaviour
> > > > correctly may not be a problem. Well-behaved devices will stall, which
> > > > means we shouldn't query the device while as async update is in
> > > > progress. Badly-behaved devices, whatever they do when queried, should
> > > > not cause any issue if we don't query them.
> > >
> > > I thought we could detect the stall and return safely. Isn't that the case?
> >
> > We could, but if we know the device will stall anyway, is there a reason
> > not to avoid issuing the request in the first place ?
> 
> Because there are always going to be devices that do not send the
> event when the control has finished.
> 
> It is impossible to know the state of the device: Is the zoom still
> moving or the device is not compliant?

Another type of broken behaviour would be devices that don't correctly
handle UVC_GET and UVC_CUR requests while an async update is in
progress. If you issue those requests, those devices will break. Are
they more or less important than devices that don't send an event ?

All of those are partly theoretical problems. I'd rather keep it simple
for now until we get feedback about broken devices.

> > > Why we have not seen issues with this?
> >
> > I haven't tested a PTZ device for a very long time, and you would need
> > to hit a small time window to see the issue.
> 
> Not that small, some devices take up to 10 seconds to go from the
> smallest zoom to the biggest zoom.
> I'd say that v4l2-ctl has a very big chance to hit any error.
> 
> BTW, homing can take an even longer time.
> 
> > > > We should not send GET_CUR and SET_CUR requests to the device while an
> > > > async update is in progress, and use cached values instead. When we
> > > > receive the async update event, we should clear the cache. This will be
> > > > the same for both well-behaved and badly-behaved devices, so we can
> > > > expose the same behaviour towards userspace.
> > >
> > > seting ctrl->loaded = 0 when we get an event sounds like a good idea
> > > and something we can implement right away.
> > > If I have to resend the set I will add it to the end.
> > >
> > > > We possibly also need some kind of timeout mechanism to cope with the
> > > > async update event not being delivered by the device.
> > >
> > > This is the part that worries me the most:
> > > - timeouts make the code fragile
> > > - What is a good value for timeout? 1 second, 30, 300? I do not think
> > > that we can find a value.
> >
> > I've been thinking about the implementation of uvc_fh cleanup over the
> > weekend, and having a timeout would have the nice advantage that we
> > could reference-count uvc_fh instead of implementing a cleanup that
> > walks over all controls when closing a file handle. I think it would
> > make the code simpler, and possibly safer too.
> 
> The problem with a timeout is:
> - We do not know what is the right value for the timeout.
> - We need to have one timeout per control, or implement a timeout
> dispatcher mechanism, and that is racy by nature
> - It will require introducing a new locking mechanism to avoid races
> between the timeout handler and the event completion

Timeouts don't come for free, that's for sure.

> - It introduces a new lifetime in the driver... I'd argue that it is
> best to have less, not more.

That I disagree with, my experience with V4L2 (as well as with DRM, or
actually the kernel in general) is that we would be in a much better
place today if object lifetimes were handled with reference counting
more widely.

> I do not see many benefits....

The main benefit is simplifying the close() implementation and
complexity, as well as lowering lock contention (whether the latter
brings a real advantage in practice, I haven't checked)..

> What we can introduce on top of my set is something like this (just
> pseudocode, do not scream at me :P)  That code can prevent stalls and
> will work with misbehaving hardware.... (But I still do not know a
> good value for timeout) and solve some of the issues that I mention.
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f0e8a436a306..a55bd4b3ac07 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1132,6 +1132,9 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
> 
> +       if (ctrl->handle && ( NOW - ctrl->async_start_time ) < TIMEOUT)
> +               return -EBUSY;
> +
>         ret = __uvc_ctrl_load_cur(chain, ctrl);
>         if (ret < 0)
>                 return ret;
> @@ -1591,6 +1594,7 @@ static int uvc_ctrl_get_handle(struct uvc_fh
> *handle, struct uvc_control *ctrl)
>                 return -EBUSY;
> 
>         ctrl->handle = handle;
> +       ctrl->async_start_time = NOW;
>         handle->pending_async_ctrls++;
>         return 0;
>  }
> @@ -1982,6 +1986,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>                 return -EACCES;
> 
> +       if (ctrl->handle && ( NOW - ctrl->async_start_time ) < TIMEOUT)
> +               return -EBUSY;

If I understand you correctly, this is meant to prevent accessing the
device for an initial TIMEOUT period, based on the knowledge it will
very likely STALL. After the TIMEOUT, if the async set is still not
complete, SET_CUR will be issued, and a STALL will likely occur.

If we device to standardize on -EBUSY while the async set is in
progress, we need to do so before and after the timeout.
uvc_query_ctrl() will return -EBUSY in case of a STALL if the device
reports the "Not ready" error. This is what I expect a device to report
in this case. Of course the UVC specification, in section 2.4.4,
documents that the device will update the request error code control,
but doesn't tell which value should be used :-S I suppose we'll handle
broken devices if the need arise.

> +
>         /* Clamp out of range values. */
>         switch (mapping->v4l2_type) {
>         case V4L2_CTRL_TYPE_INTEGER:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index e0e4f099a210..5c82fae94dff 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -154,6 +154,8 @@ struct uvc_control {
>                                  * File handle that initially changed the
>                                  * async control.
>                                  */
> +
> +       TIME async_start_time;
>  };
> 
> 
> In any case. Can we solve this in incremental steps? I think the
> current patch seems simple and correct. We can introduce the timeout
> later.

The main reason for a timeout was to replace walking over all controls
at close() time with reference counting of uvc_fh, which is an
alternative approach to the current patch. Given that picking a good
timeout value is difficult, and that the current implementation already
skips the walk in the most common case when no async set is pending, I
suppose we could start with that.

> > > > Regarding the userspace behaviour during an auto-update, we have
> > > > multiple options:
> > > >
> > > > For control get,
> > > >
> > > > - We can return -EBUSY
> > > > - We can return the old value from the cache
> > > > - We can return the new value fromt he cache
> > > >
> > > > Returning -EBUSY would be simpler to implement.
> > >
> > > Not only easy, I think it is the most correct,
> > >
> > > > I don't think the behaviour should depend on whether the control is read
> > > > on the file handle that initiated the async operation or on a different
> > > > file handle.
> > > >
> > > > For control set, I don't think we can do much else than returning
> > > > -EBUSY, regardless of which file handle the control is set on.
> > >
> > > ACK.
> > >
> > > > > I will send a new version with my interpretation.
> > > > >
> > > > > Thanks for a great discussion
> > >
> > > Looking with some perspective... I believe that we should look into
> > > the "userspace behaviour for auto controls" in a different patchset.
> > > It is slightly unrelated to this discussion.

-- 
Regards,

Laurent Pinchart

