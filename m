Return-Path: <linux-media+bounces-22583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670CF9E364B
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 10:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35138166772
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30E51A01BE;
	Wed,  4 Dec 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snH+/Fv1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B82500C8;
	Wed,  4 Dec 2024 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303651; cv=none; b=fQlB/XdSIhoI4mRbGcNG6ij2K9f0iS7AF7OH1WiUIpk5w0m4LSRmKwCDwvTUaQkvaxqXHXWs+ek1xV6WoRn7C/LLEB38M3p1cYKtkIIVvitui6dsHDfvwHaPeb1B/qiahCHaL/es+oVcN91TNADBv7UEDpXVUSs2dW5xAwFG2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303651; c=relaxed/simple;
	bh=/adB5iuMoWjLcuR2we9Jx44u0zIGrBVQZ2uCcY1M/IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHiRon7qcCSGpkn4i4IisYwkLXfEZKMFTe+yYGv4i0igMtdXAf/NuC7Bb5Qc+GKBrmNXRc4BGns0ByhbFk6HoGrhNUs8RNl3C0fwp5bfLAXwxetgK1Fz7t3FQIWM76OvhgRoqiOMda6TScogplzg0rNakUmAT9FmPMjFdONpq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=snH+/Fv1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4902A4D4;
	Wed,  4 Dec 2024 10:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733303619;
	bh=/adB5iuMoWjLcuR2we9Jx44u0zIGrBVQZ2uCcY1M/IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snH+/Fv1M/Iy7gGdpOUflKH4tHvZiyhof2JvMiXq9tB4cX++aTUnm+AmkMp1Q+oG3
	 Q9qn6Av/oRtarG14fnacp9JQxXI4kh3EWI8Y1tvak1r4ZI6ocZyEnmpMGYcYorYfCk
	 hh/idFQqGDyp1kgRQbkt016w4GMbIUSiyOLNe0V8=
Date: Wed, 4 Dec 2024 11:13:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241204091356.GA10736@pendragon.ideasonboard.com>
References: <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com>
 <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
 <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
 <9b3e21b7-1b15-4c27-9df0-0b9f31858721@xs4all.nl>
 <20241203171818.GA30248@pendragon.ideasonboard.com>
 <70a3a985-4484-4016-a383-49d084970b80@xs4all.nl>
 <951be9c9-0739-4833-ac97-73fbe53405ed@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <951be9c9-0739-4833-ac97-73fbe53405ed@xs4all.nl>

On Wed, Dec 04, 2024 at 09:04:11AM +0100, Hans Verkuil wrote:
> On 04/12/2024 08:59, Hans Verkuil wrote:
> > On 03/12/2024 18:18, Laurent Pinchart wrote:
> >> On Mon, Dec 02, 2024 at 11:55:20AM +0100, Hans Verkuil wrote:
> >>> On 02/12/2024 11:26, Hans de Goede wrote:
> >>>> On 2-Dec-24 9:44 AM, Hans Verkuil wrote:
> >>>>> On 02/12/2024 09:11, Laurent Pinchart wrote:
> >>>>>> On Mon, Dec 02, 2024 at 09:05:07AM +0100, Hans Verkuil wrote:
> >>>>>>> On 02/12/2024 01:18, Laurent Pinchart wrote:
> >>>>>>>> On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> >>>>>>>>> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> >>>>>>>>>> On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> >>>>>>>>>>> Before we all go on a well deserved weekend, let me recap what we
> >>>>>>>>>>> know. If I did not get something correctly, let me know.
> >>>>>>>>>>>
> >>>>>>>>>>> 1) Well behaved devices do not allow to set or get an incomplete async
> >>>>>>>>>>> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> >>>>>>>>>>> 2) Both Laurent and Ricardo consider that there is a big chance that
> >>>>>>>>>>> some camera modules do not implement this properly. (ref: years of
> >>>>>>>>>>> crying over broken module firmware :) )
> >>>>>>>>>>>
> >>>>>>>>>>> 3) ctrl->handle is designed to point to the fh that originated the
> >>>>>>>>>>> control. So the logic can decide if the originator needs to be
> >>>>>>>>>>> notified or not. (ref: uvc_ctrl_send_event() )
> >>>>>>>>>>> 4) Right now we replace the originator in ctrl->handle for unfinished
> >>>>>>>>>>> async controls.  (ref:
> >>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> >>>>>>>>>>>
> >>>>>>>>>>> My interpretation is that:
> >>>>>>>>>>> A) We need to change 4). We shall not change the originator of
> >>>>>>>>>>> unfinished ctrl->handle.
> >>>>>>>>>>> B) Well behaved cameras do not need the patch "Do not set an async
> >>>>>>>>>>> control owned by another fh"
> >>>>>>>>>>> C) For badly behaved cameras, it is fine if we slightly break the
> >>>>>>>>>>> v4l2-compliance in corner cases, if we do not break any internal data
> >>>>>>>>>>> structure.
> >>>>>>>>>>
> >>>>>>>>>> The fact that some devices may not implement the documented behaviour
> >>>>>>>>>> correctly may not be a problem. Well-behaved devices will stall, which
> >>>>>>>>>> means we shouldn't query the device while as async update is in
> >>>>>>>>>> progress. Badly-behaved devices, whatever they do when queried, should
> >>>>>>>>>> not cause any issue if we don't query them.
> >>>>>>>>>
> >>>>>>>>> I thought we could detect the stall and return safely. Isn't that the case?
> >>>>>>>>
> >>>>>>>> We could, but if we know the device will stall anyway, is there a reason
> >>>>>>>> not to avoid issuing the request in the first place ?
> >>>>>>>>
> >>>>>>>>> Why we have not seen issues with this?
> >>>>>>>>
> >>>>>>>> I haven't tested a PTZ device for a very long time, and you would need
> >>>>>>>> to hit a small time window to see the issue.
> >>>>>>>>
> >>>>>>>>>> We should not send GET_CUR and SET_CUR requests to the device while an
> >>>>>>>>>> async update is in progress, and use cached values instead. When we
> >>>>>>>>>> receive the async update event, we should clear the cache. This will be
> >>>>>>>>>> the same for both well-behaved and badly-behaved devices, so we can
> >>>>>>>>>> expose the same behaviour towards userspace.
> >>>>>>>>>
> >>>>>>>>> seting ctrl->loaded = 0 when we get an event sounds like a good idea
> >>>>>>>>> and something we can implement right away.
> >>>>>>>>> If I have to resend the set I will add it to the end.
> >>>>>>>>>
> >>>>>>>>>> We possibly also need some kind of timeout mechanism to cope with the
> >>>>>>>>>> async update event not being delivered by the device.
> >>>>>>>>>
> >>>>>>>>> This is the part that worries me the most:
> >>>>>>>>> - timeouts make the code fragile
> >>>>>>>>> - What is a good value for timeout? 1 second, 30, 300? I do not think
> >>>>>>>>> that we can find a value.
> >>>>>>>>
> >>>>>>>> I've been thinking about the implementation of uvc_fh cleanup over the
> >>>>>>>> weekend, and having a timeout would have the nice advantage that we
> >>>>>>>> could reference-count uvc_fh instead of implementing a cleanup that
> >>>>>>>> walks over all controls when closing a file handle. I think it would
> >>>>>>>> make the code simpler, and possibly safer too.
> >>>>>>>>
> >>>>>>>>>> Regarding the userspace behaviour during an auto-update, we have
> >>>>>>>>>> multiple options:
> >>>>>>>>>>
> >>>>>>>>>> For control get,
> >>>>>>>>>>
> >>>>>>>>>> - We can return -EBUSY
> >>>>>>>>>> - We can return the old value from the cache
> >>>>>>>
> >>>>>>> This would match the control behavior best. Only when the operation is
> >>>>>>> done is the control updated and the control event sent.
> >>>>>>>
> >>>>>>> Some questions: is any of this documented for UVC? Because this is non-standard
> >>>>>>
> >>>>>> No this isn't documented.
> >>>>>>
> >>>>>>> behavior. Are there applications that rely on this? Should we perhaps add
> >>>>>>
> >>>>>> I don't know.
> >>>>>>
> >>>>>>> proper support for this to the control framework? E.g. add an ASYNC flag and
> >>>>>>> document this?
> >>>>>>
> >>>>>> We could, but this is such a specific use case that I don't think is
> >>>>>> worth adding complexity to the already complex control framework would
> >>>>>> be worth it. What we could do is perhaps adding a flag for the userspace
> >>>>>> API, but even there, I never like modelling an API with a single user.
> >>>>>
> >>>>> Well, it might be a single driver that uses this, but it is also the most
> >>>>> used driver by far. I think the only change is to add a flag for this and
> >>>>> describe how it should behave. And add v4l2-compliance tests for it.
> >>>>>
> >>>>> Otherwise no changes to the control framework are needed, I think.
> >>>>>
> >>>>> Controls with the ASYNC flag set would:
> >>>>>
> >>>>> - return the old value from the cache.
> >>>>> - document that setting a new value while the operation is in progress
> >>>>>   results in EBUSY. Document that if the new value is equal to the old value,
> >>>>>   then return 0 and do nothing (alternative is to just immediately send
> >>>>>   the control changed event, but that might require a control framework change).
> >>>>> - when the operation finishes, update the cache to the new value and
> >>>>>   send the control changed event.
> >>>>> - document that userspace should specify V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK
> >>>>>   when subscribing to the control if you calling fh wants to know when
> >>>>>   the operation finishes.
> >>>>> - document how timeouts should be handled: this is tricky, especially with
> >>>>>   bad hardware. I.e. if the hw doesn't send the event, does that mean that
> >>>>>   you are never able to set the control since it will stall?
> >>>>>   In the end this will just reflect how UVC handles this.
> >>>>
> >>>> I have been catching up on this thread (I have not read the v3 and v4
> >>>> threads yet).
> >>>>
> >>>> This all started with Ricardo noticing that ctrl->handle may get
> >>>> overwritten when another app sets the ctrl, causing the first app
> >>>> to set the ctrl to get a V4L2_EVENT for the ctrl (if subscribed)
> >>>> even though it set the ctrl itself.
> >>>>
> >>>> My observations so far:
> >>>>
> >>>> 1. This is only hit when another app changes the ctrl after the first app,
> >>>> in this case, if there is no stall issued by the hw for the second app's
> >>>> request, arguably the first app getting the event for the ctrl is correct
> >>>> since it was changed by the second app. IOW I think the current behavior
> >>>> is not only fine, but even desirable. Assuming we only override ctrl->handle
> >>>> after successfully sending the set-ctrl request to the hardware.
> >>
> >> I think you're right.
> >>
> >>>> 2. This adds a lot of complexity for not sending an event to the app
> >>>> which made the change. Hans V. suggested maybe adding some sort of flag
> >>>> for async ctrls to the userspace API. I wonder if we should not just
> >>>> get rid of this complexity and document that these controls will always
> >>>> generate events independent of V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK ?
> >>>> That would certainly simplify things, but it raises the questions if
> >>>> this will cause issues for existing applications.
> >>>
> >>> I'm not that keen on this. That's why a new flag can come in handy since
> >>> if present, then that indicates that it makes sense to specify
> >>> V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK when subscribing to the control events.
> >>>
> >>> This ensures that uvc follows the current v4l2 spec. It's also why I
> >>> prefer that g_ctrl will just return the old value until the new value
> >>> has been reached: that way the control event corresponds with the actual
> >>> updating of the control value.
> >>>
> >>> That said, it's just my opinion and I am OK with UVC doing things a bit
> >>> differently. Just be aware that I have no objection to adding an ASYNC flag,
> >>> given how widely UVC is used.
> >>
> >> My experience with the V4L2 control API is that we've overdesigned quite
> >> a few things, and in particular control events. The independent
> >> "capture" and "control panel" application model that V4L2 controls were
> >> designed for is not really a good fit for the 21st century anymore. The
> >> V4L2 API isn't rich enough to arbitrate between applications that are
> >> not designed to collaborate, and way too rich when applications do
> >> collaborate. The only two real use cases I found for control events are
> >> async set completion notification, and notification of automatic changes
> >> to other controls (and in particular changes to control limits) when a
> >> control is set. The second use case isn't even something that we support
> >> well today: to make it really usable, the change notification should be
> >> *synchronous* with the control set ioctl, returning the information from
> >> the same ioctl, not through asynchronous control events.
> > 
> > The main reason you think it is complicated is because the uvc driver does
> > not use the control framework, so it has to copy all the logic in the driver.
> > That's very painful. Ideally, uvc should use the control framework, but that
> > would require a complete overhaul of the uvc driver.
> > 
> > For all other drivers the complexity is zero since it is all in the framework.
> > 
> > Some of the Digital Video controls (HOTPLUG, EDID_PRESENT, RXSENSE,
> > POWER_PRESENT) are meant to be used with control events to inform the applications
> > when these things change. But you don't deal with HDMI video, so you never see
> > them in use. The control event mechanism is generic, i.e. available for all
> > controls. So the use in control panels is just one use-case and it is probably
> > just qv4l2 that implements it. But control events are great for anything that
> > happens asynchronously.
> > 
> > What is missing is support for asynchronous event like the zoom control that
> > takes time to finish the operation. Ideally I would prefer that it would operate
> > like the V4L2_CID_AUTO_FOCUS_* controls. But since the current mechanism is
> > already in use in UVC I am fine with the current uvc approach. I just think
> > this is something that should be signaled to userspace by a flag and that it
> > is properly documented.
> 
> Sorry for this second post, I just wanted to say that in my opinion it is OK if
> frameworks are complicated internally. That's the whole point of a framework: to
> put the complexity in one place and hide it from the users of the framework.
> 
> If a framework was simple, then you probably wouldn't have needed a framework in
> the first place. The problem with uvc is that you can't use the framework so all
> the complexity now enters the driver :-(

As I mentioned in a separate e-mail, I'm less concerned about the code
in the uvcvideo driver than in the control framework. I'm quite sure you
have the opposite opinion, and that's not too surprising. I'm quite
familiar with the uvcvideo internals, while you know the control
framework well :-)

We have lots of complexity in the control framework that comes from
complexity in the controls API. I'm less criticizing the implementation
of the control framework than the design of the API. History partly
explains some of the design decisions, and if we had to redo this today,
I'm sure the result would be very different. V4L3 will have a nicer
control API.

> > Regarding the second use case: it's perfectly doable, but it would require a
> > new ioctl. You would need really good arguments for doing that.
> > 
> >> TL;DR: If I can pick an option, let's make things simpler, not more
> >> complex.
> >>
> >>>> Note that if we simply return -EBUSY on set until acked by a status
> >>>> event we also avoid the issue of ctrl->handle getting overwritten,
> >>>> but that relies on reliable status events; or requires timeout handling.
> >>>>
> >>>> 3. I agree with Ricardo that a timeout based approach for cameras which
> >>>> to not properly send status events for async ctrls is going to be
> >>>> problematic. Things like pan/tilt homing can take multiple seconds which
> >>>> is really long to use as a timeout if we plan to return -EBUSY until
> >>>> the timeout triggers. I think it would be better to just rely on
> >>>> the hardware sending a stall, or it accepting and correctly handling
> >>>> a new CUR_SET command while the previous one is still being processed.
> >>>>
> >>>> I guess we can track if the hw does send status events when async ctrls
> >>>> complete and then do the -EBUSY thing without going out to the hw after
> >>>> the first time an async ctrl has been acked by a status event.
> >>>>
> >>>> And then combine that with the current behavior of overwriting ctrl->handle
> >>>> until the ctrl has been marked as having working status events. So:
> >>>>
> >>>> a) In case we do not know yet if a ctrl gets status-event acks; and
> >>>> on devices without reliable status events keep current behavior.
> >>>>
> >>>> b) As soon as we know a ctrl has reliable status events, switch to
> >>>> returning -EBUSY if a set is pending (as indicated by ctrl->handle
> >>>> being set).
> >>>>
> >>>> I don't like the fact that this changes the behavior after the first
> >>>> status event acking an async ctrl, but I don't really see another way.
> >>>>
> >>>>>>>>>> - We can return the new value fromt he cache
> >>>>>>>>>>
> >>>>>>>>>> Returning -EBUSY would be simpler to implement.
> >>>>>>>>>
> >>>>>>>>> Not only easy, I think it is the most correct,
> >>>>>>>>>
> >>>>>>>>>> I don't think the behaviour should depend on whether the control is read
> >>>>>>>>>> on the file handle that initiated the async operation or on a different
> >>>>>>>>>> file handle.
> >>>>>>>>>>
> >>>>>>>>>> For control set, I don't think we can do much else than returning
> >>>>>>>>>> -EBUSY, regardless of which file handle the control is set on.
> >>>>>>>>>
> >>>>>>>>> ACK.
> >>>>>>>>>
> >>>>>>>>>>> I will send a new version with my interpretation.
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks for a great discussion
> >>>>>>>>>
> >>>>>>>>> Looking with some perspective... I believe that we should look into
> >>>>>>>>> the "userspace behaviour for auto controls" in a different patchset.
> >>>>>>>>> It is slightly unrelated to this discussion.

-- 
Regards,

Laurent Pinchart

