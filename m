Return-Path: <linux-media+bounces-22559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEC9E2C16
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5417028436C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 19:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A65E208962;
	Tue,  3 Dec 2024 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wknIyHi9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E2205ACE;
	Tue,  3 Dec 2024 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254389; cv=none; b=SvCkAGzC05G91YTZYti/nJoPxNjCIs2b0+pLcDFRBEkBh23lisUFeLmS/gJGkAOsGxB4+triWPlu9sgn+iXSbJ/dKM+2DHhcT8nY5b6woSLTERFddNjpir4ZEtKckQuNaokqAm0SiWeIiTjJ5ZCkrsDYW8lqip+0pc1w3JkgBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254389; c=relaxed/simple;
	bh=M59ILAKO+fH3cjzCg0jy7110ilm8c0AN6WM+WE0suqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou4a6CB0ZIF6RQ7805Auy5zJVpru8cEpV4XTzHt2T8LlLy9UwrTEwVQobUPkntUdJmE+H26rCWZ9hncgE8X0UArKeH51Ar0Cb9Bft1s57wS/u8juAZHfPEZtIxjMhucqxTXz4xIcshsWgKkf4pZUlVY8qQd0kMeJ0dR+EoORU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wknIyHi9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28E3C4CE;
	Tue,  3 Dec 2024 20:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733254356;
	bh=M59ILAKO+fH3cjzCg0jy7110ilm8c0AN6WM+WE0suqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wknIyHi90fgW4Z9ycNfiknKMEK68HN0agcsyAu6aMzXReLV0XuRM1hft1/VsalkSF
	 hSxDdWbWjBOj0NeB9yLaI+u8QOU8uJsdjIjVBYX+s6bQC30vFIdKDJEtvWMDrXiRvr
	 ZMXJuE38tgts5LBXuarguMCm9tsX4tto8UcWIxXY=
Date: Tue, 3 Dec 2024 21:32:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241203193251.GA4242@pendragon.ideasonboard.com>
References: <20241129220339.GD2652@pendragon.ideasonboard.com>
 <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com>
 <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
 <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
 <CANiDSCvmRrf1vT3g9Mzkc790RUo3GuQaFzu5+_G66b3_62RuXw@mail.gmail.com>
 <839446b3-1d16-4af8-997a-f2a37eb4711e@redhat.com>
 <CANiDSCszkv=YQPJOSE8EarXWPhZxkk-KR9enLScUOV_P0nzTCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCszkv=YQPJOSE8EarXWPhZxkk-KR9enLScUOV_P0nzTCg@mail.gmail.com>

On Mon, Dec 02, 2024 at 02:29:24PM +0100, Ricardo Ribalda wrote:
> On Mon, 2 Dec 2024 at 13:19, Hans de Goede wrote:
> > On 2-Dec-24 11:50 AM, Ricardo Ribalda wrote:
> > > On Mon, 2 Dec 2024 at 11:27, Hans de Goede wrote:
> > >> On 2-Dec-24 9:44 AM, Hans Verkuil wrote:
> > >>> On 02/12/2024 09:11, Laurent Pinchart wrote:
> > >>>> On Mon, Dec 02, 2024 at 09:05:07AM +0100, Hans Verkuil wrote:
> > >>>>> On 02/12/2024 01:18, Laurent Pinchart wrote:
> > >>>>>> On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> > >>>>>>> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> > >>>>>>>> On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> > >>>>>>>>> Before we all go on a well deserved weekend, let me recap what we
> > >>>>>>>>> know. If I did not get something correctly, let me know.
> > >>>>>>>>>
> > >>>>>>>>> 1) Well behaved devices do not allow to set or get an incomplete async
> > >>>>>>>>> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> > >>>>>>>>> 2) Both Laurent and Ricardo consider that there is a big chance that
> > >>>>>>>>> some camera modules do not implement this properly. (ref: years of
> > >>>>>>>>> crying over broken module firmware :) )
> > >>>>>>>>>
> > >>>>>>>>> 3) ctrl->handle is designed to point to the fh that originated the
> > >>>>>>>>> control. So the logic can decide if the originator needs to be
> > >>>>>>>>> notified or not. (ref: uvc_ctrl_send_event() )
> > >>>>>>>>> 4) Right now we replace the originator in ctrl->handle for unfinished
> > >>>>>>>>> async controls.  (ref:
> > >>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> > >>>>>>>>>
> > >>>>>>>>> My interpretation is that:
> > >>>>>>>>> A) We need to change 4). We shall not change the originator of
> > >>>>>>>>> unfinished ctrl->handle.
> > >>>>>>>>> B) Well behaved cameras do not need the patch "Do not set an async
> > >>>>>>>>> control owned by another fh"
> > >>>>>>>>> C) For badly behaved cameras, it is fine if we slightly break the
> > >>>>>>>>> v4l2-compliance in corner cases, if we do not break any internal data
> > >>>>>>>>> structure.
> > >>>>>>>>
> > >>>>>>>> The fact that some devices may not implement the documented behaviour
> > >>>>>>>> correctly may not be a problem. Well-behaved devices will stall, which
> > >>>>>>>> means we shouldn't query the device while as async update is in
> > >>>>>>>> progress. Badly-behaved devices, whatever they do when queried, should
> > >>>>>>>> not cause any issue if we don't query them.
> > >>>>>>>
> > >>>>>>> I thought we could detect the stall and return safely. Isn't that the case?
> > >>>>>>
> > >>>>>> We could, but if we know the device will stall anyway, is there a reason
> > >>>>>> not to avoid issuing the request in the first place ?
> > >>>>>>
> > >>>>>>> Why we have not seen issues with this?
> > >>>>>>
> > >>>>>> I haven't tested a PTZ device for a very long time, and you would need
> > >>>>>> to hit a small time window to see the issue.
> > >>>>>>
> > >>>>>>>> We should not send GET_CUR and SET_CUR requests to the device while an
> > >>>>>>>> async update is in progress, and use cached values instead. When we
> > >>>>>>>> receive the async update event, we should clear the cache. This will be
> > >>>>>>>> the same for both well-behaved and badly-behaved devices, so we can
> > >>>>>>>> expose the same behaviour towards userspace.
> > >>>>>>>
> > >>>>>>> seting ctrl->loaded = 0 when we get an event sounds like a good idea
> > >>>>>>> and something we can implement right away.
> > >>>>>>> If I have to resend the set I will add it to the end.
> > >>>>>>>
> > >>>>>>>> We possibly also need some kind of timeout mechanism to cope with the
> > >>>>>>>> async update event not being delivered by the device.
> > >>>>>>>
> > >>>>>>> This is the part that worries me the most:
> > >>>>>>> - timeouts make the code fragile
> > >>>>>>> - What is a good value for timeout? 1 second, 30, 300? I do not think
> > >>>>>>> that we can find a value.
> > >>>>>>
> > >>>>>> I've been thinking about the implementation of uvc_fh cleanup over the
> > >>>>>> weekend, and having a timeout would have the nice advantage that we
> > >>>>>> could reference-count uvc_fh instead of implementing a cleanup that
> > >>>>>> walks over all controls when closing a file handle. I think it would
> > >>>>>> make the code simpler, and possibly safer too.
> > >>>>>>
> > >>>>>>>> Regarding the userspace behaviour during an auto-update, we have
> > >>>>>>>> multiple options:
> > >>>>>>>>
> > >>>>>>>> For control get,
> > >>>>>>>>
> > >>>>>>>> - We can return -EBUSY
> > >>>>>>>> - We can return the old value from the cache
> > >>>>>
> > >>>>> This would match the control behavior best. Only when the operation is
> > >>>>> done is the control updated and the control event sent.
> > >>>>>
> > >>>>> Some questions: is any of this documented for UVC? Because this is non-standard
> > >>>>
> > >>>> No this isn't documented.
> > >>>>
> > >>>>> behavior. Are there applications that rely on this? Should we perhaps add
> > >>>>
> > >>>> I don't know.
> > >>>>
> > >>>>> proper support for this to the control framework? E.g. add an ASYNC flag and
> > >>>>> document this?
> > >>>>
> > >>>> We could, but this is such a specific use case that I don't think is
> > >>>> worth adding complexity to the already complex control framework would
> > >>>> be worth it. What we could do is perhaps adding a flag for the userspace
> > >>>> API, but even there, I never like modelling an API with a single user.
> > >>>
> > >>> Well, it might be a single driver that uses this, but it is also the most
> > >>> used driver by far. I think the only change is to add a flag for this and
> > >>> describe how it should behave. And add v4l2-compliance tests for it.
> > >>>
> > >>> Otherwise no changes to the control framework are needed, I think.
> > >>>
> > >>> Controls with the ASYNC flag set would:
> > >>>
> > >>> - return the old value from the cache.
> > >>> - document that setting a new value while the operation is in progress
> > >>>   results in EBUSY. Document that if the new value is equal to the old value,
> > >>>   then return 0 and do nothing (alternative is to just immediately send
> > >>>   the control changed event, but that might require a control framework change).
> > >>> - when the operation finishes, update the cache to the new value and
> > >>>   send the control changed event.
> > >>> - document that userspace should specify V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK
> > >>>   when subscribing to the control if you calling fh wants to know when
> > >>>   the operation finishes.
> > >>> - document how timeouts should be handled: this is tricky, especially with
> > >>>   bad hardware. I.e. if the hw doesn't send the event, does that mean that
> > >>>   you are never able to set the control since it will stall?
> > >>>   In the end this will just reflect how UVC handles this.
> > >>
> > >> I have been catching up on this thread (I have not read the v3 and v4
> > >> threads yet).
> > >>
> > >> This all started with Ricardo noticing that ctrl->handle may get
> > >> overwritten when another app sets the ctrl, causing the first app
> > >> to set the ctrl to get a V4L2_EVENT for the ctrl (if subscribed)
> > >> even though it set the ctrl itself.
> > >>
> > >> My observations so far:
> > >>
> > >> 1. This is only hit when another app changes the ctrl after the first app,
> > >> in this case, if there is no stall issued by the hw for the second app's
> > >> request, arguably the first app getting the event for the ctrl is correct
> > >
> > > In other words, for non compliant cameras the current behaviour is
> > > correct. For compliant cameras it is broken.
> > >
> > >> since it was changed by the second app. IOW I think the current behavior
> > >> is not only fine, but even desirable. Assuming we only override ctrl->handle
> > >> after successfully sending the set-ctrl request to the hardware.
> > >
> > > We are overriding ctrl->handle unconditionally, even if set-ctrl stalls.
> >
> > Right I was just looking at that. Since we hold chain->ctrl_mutex
> > from the start of uvc_ioctl_s_try_ext_ctrls() until we finish
> > uvc_ctrl_commit() we can delay setting ctrl->handle until
> > a successful commit.
> >
> > Actually looking at this I think I've found another bug, uvc_ctrl_set()
> > always sets ctrl->handle also in the VIDIOC_TRY_EXT_CTRLS case in
> > which case we never send the SET_CUR command to the camera.
>
> ack
> 
> > And the handle is not part of the data backed up / restored by
> > a rollback.
> >
> > Moving the storing of the handle to a successful commit fixes
> > both the overriding of the handle in the stall case as well
> > as the bogus setting of the handle on VIDIOC_TRY_EXT_CTRLS.
> >
> > So my suggestion would be not touching ctrl->handle from
> > ctrl_set() instead store the handle in a new ctrl->new_handle
> > variable there and copy the new_handle values to handle for affected
> > controls after a successful commit (before releasing the lock).
> 
> We do not need to do that. Instead, we can move the set to
> uvc_ctrl_commit_entity().
> 
> I have a patchset ready with this change.

I find it fascinating that we're spending so much time discussing this
to implement the control events API, which is both complex and not very
useful in its current form :-) If I could, I'd drop all control events
except for async controls, and wouldn't support not setting
V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK for those. But that's a digression.

> > This will also successfully replace the handle for buggy
> > devices which do not report a stall but instead accept the
> > second SET_CUR. This replacement of handle is the correct thing
> > todo in this case since after the second SET_CUR is accepted
> > there is a change of the ctrl happening from the pov of the
> > issuer of the first SET_CUR.
> >
> > >> 2. This adds a lot of complexity for not sending an event to the app
> > >> which made the change. Hans V. suggested maybe adding some sort of flag
> > >> for async ctrls to the userspace API. I wonder if we should not just
> > >> get rid of this complexity and document that these controls will always
> > >> generate events independent of V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK ?
> > >> That would certainly simplify things, but it raises the questions if
> > >> this will cause issues for existing applications.
> > >
> > > To be honest, I am more concerned about the dangling pointers than the event.
> >
> > Ack.
> >
> > > Updating the doc to say that  ASYC controls always generate events
> > > sounds good to me. But until we reach an agreement on the specifics
> > > I'd rather land this fix and then we can take time to design an API
> > > that works for compliant and non compliant hardware.
> >
> > I agree that we should focus on fixing the dangling pointer problem
> > and your v4 series is heading in the right direction there.
> >
> > I'm not sure if we should take your v4 series as is though, see above.
> >
> > At a minimum I think the issue with setting ctrl->handle in
> > the VIDIOC_TRY_EXT_CTRLS case needs to be fixed.

We have three clear issues that are not related to changing behaviour of
the async controls (aside from side effects of the fixes):

- Not setting ctrl->handle when trying controls
- Not setting ctrl->handle when setting a control fails
- Fixing the dangling pointer bug

The first two issues can probably be fixed with a single patch, and the
third issue with a second patch. I don't mind much about the order,
whatever makes development easier should be fine. We should backport
both patches in any case.

> > >> Note that if we simply return -EBUSY on set until acked by a status
> > >> event we also avoid the issue of ctrl->handle getting overwritten,
> > >> but that relies on reliable status events; or requires timeout handling.
> > >>
> > >> 3. I agree with Ricardo that a timeout based approach for cameras which
> > >> to not properly send status events for async ctrls is going to be
> > >> problematic. Things like pan/tilt homing can take multiple seconds which
> > >> is really long to use as a timeout if we plan to return -EBUSY until
> > >> the timeout triggers. I think it would be better to just rely on
> > >> the hardware sending a stall, or it accepting and correctly handling
> > >> a new CUR_SET command while the previous one is still being processed.
> > >>
> > >> I guess we can track if the hw does send status events when async ctrls
> > >> complete and then do the -EBUSY thing without going out to the hw after
> > >> the first time an async ctrl has been acked by a status event.

That sounds quite complex, and wouldn't guard against the status event
being occasionally lost. I'm more concerned about devices that only
occasionally mess up sending the status event, not devices that never
send it.

> > >>
> > >> And then combine that with the current behavior of overwriting ctrl->handle
> > >> until the ctrl has been marked as having working status events. So:
> > >>
> > >> a) In case we do not know yet if a ctrl gets status-event acks; and
> > >> on devices without reliable status events keep current behavior.
> > >>
> > >> b) As soon as we know a ctrl has reliable status events, switch to
> > >> returning -EBUSY if a set is pending (as indicated by ctrl->handle
> > >> being set).
> > >>
> > >> I don't like the fact that this changes the behavior after the first
> > >> status event acking an async ctrl, but I don't really see another way.
> > >
> > > If I understood you correctly, you are proposing the following quirk:
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index f0e8a436a306..1a554afeaa2f 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1132,6 +1132,9 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > >                 return -EACCES;
> > >
> > > +       if (ctrl->handle && ctrl->async_event_works)
> > > +               return -EBUSY;
> > > +
> > >         ret = __uvc_ctrl_load_cur(chain, ctrl);
> > >         if (ret < 0)
> > >                 return ret;
> > > @@ -1672,6 +1675,8 @@ bool uvc_ctrl_status_event_async(struct urb> *urb, struct uvc_video_chain *chain,
> > >         /* Flush the control cache, the data might have changed. */
> > >         ctrl->loaded = 0;
> > >
> > > +       ctrl->async_event_works = true;
> > > +
> > >         if (list_empty(&ctrl->info.mappings))
> > >                 return false;
> > >
> > > @@ -1982,6 +1987,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> > >                 return -EACCES;
> > >
> > > +       if (ctrl->handle && ctrl->async_event_works)
> > > +               return -EBUSY;
> > > +
> >
> > Yes this is what I'm proposing, except that this check should be
> > skipped in the VIDIOC_TRY_EXT_CTRLS case. I think we need to add
> > a "bool try" parameter to uvc_ctrl_set() and not look at / set
> > [new_]handle when this is set.
> 
> SGTM. Let's add this improvement later.

Let's handle behavioural changes, optimizations, and handling of broken
devices on top of the fixes, it's getting complex enough as-is.

> > >         /* Clamp out of range values. */
> > >         switch (mapping->v4l2_type) {
> > >         case V4L2_CTRL_TYPE_INTEGER:
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index e0e4f099a210..0ef7c594eecb 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -154,6 +154,7 @@ struct uvc_control {
> > >                                  * File handle that initially changed the
> > >                                  * async control.
> > >                                  */
> > > +       bool async_event_works;
> > >  };
> > >
> > > The benefit is that we can predict a device returning STALL without
> > > having to actually do the set/get operation.
> > >
> > > We can add it as a follow-up patch.
> >
> > Another benefit would be correctly returning -EBUSY when trying to get
> > the ctrl. I agree this could be done as a follow-up.

-- 
Regards,

Laurent Pinchart

