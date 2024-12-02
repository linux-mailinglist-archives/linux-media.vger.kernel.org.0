Return-Path: <linux-media+bounces-22421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E59DFF53
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44C316268F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00231FCF7C;
	Mon,  2 Dec 2024 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KJP8BwSe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A51FC0E5
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136646; cv=none; b=ojHsvK1Fw4iK3cFs3FxoOQPHBmH4uII9UC1h0ZV5D2kJJDo+oJ9KW4cujD2LoqgWSuiUp0iabt4iylP9nJgQmuaG712mZyGdl0ZqMiRQHzYV2y4EsUiUkeejOmxPyYQKleBgp/G6hQMIP3DfZW3LIjoTnEY3Nk05mumKOuhRHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136646; c=relaxed/simple;
	bh=7mSSpTfjXw0WTqbcYYDDgYuwpe+Ko1vI9orpjcoySFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jayUE2Szk01uv1AMsxtJCrdrJJySKrC9ZSP5LWpwitqGH+zu34ey5fkXNGV+AUTXViJ+jP+1/jaDhVETF4+Nrws2HqMOgAfwrBwiTboZcOADLONOFZ2pXPhQLiibFp2p6FdrhX3JZ+NEVyCKtITRmvMYm9xPwjAa1pUOtLsV0sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KJP8BwSe; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a777fd574bso15381815ab.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733136643; x=1733741443; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R7USl1I3Yy2AUr2mP0yZVqymybZ2gfmBsyZL4ssKFGs=;
        b=KJP8BwSexMjz3/P84KtStxjBSUw9/RI67XYocVnIzxAMoI1cjo0tug7tcsL1gJuW1q
         N3hGQYtzulT3yfLAfiMelFU1wTJgbLHeNkCj+I55xY25xe0kpFlkx2GBdEnH6nzIgMWZ
         HbI7RBs0zejnZeDfzjMdQkpqJrboIV1C1yD6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136643; x=1733741443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7USl1I3Yy2AUr2mP0yZVqymybZ2gfmBsyZL4ssKFGs=;
        b=tRRk6yFtui31PMbdY6KruvluX9r554pQfzmsxCoEqTM4xcxG9T4QRy2/T7K7nSc0z0
         yGcWT0zIvgn/QuHzK5pw/e1/zdxa/o5BKyPGzVhTy7O26epX0YHpttg7ej+WC/qr8DJO
         CdHwNosP8lnwSu5xiDib3ygekEfwSBdjgv+acdKCOcYqElkEZVU3UEXzxsRrVCqp8hte
         qcQ+cBvVPqUTSMH3ZHIthwO28rZWTRSwDDiEUX8cioDlPOad/JyffEKQVo7i4Z/faYGz
         C32kFC5uXHlFNxNgCKp2buM6HYfJzpthf1sPDNgTuWs/RMaDpPBP2GDMfQNmsm387di0
         zMkA==
X-Forwarded-Encrypted: i=1; AJvYcCUaokB+TEOBG7mA95NTsCsfu4vKI+oLy4CFq6ZbH5lC5f+VGK/oFuhTmvcUAVve6wnJCJARYpicVKnO/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHqIxcLUyLB80xxVCN5hsBKDh8jGc1TUfTgQc1Q7IJ65qPGZ4g
	W+6Y6lEypgBnwjAGv2VajCLQhCP6Y7w7LlCgFzOqiOUF+Bf99YRbekVWtmSemdE7Pt4EJ2hR1nw
	=
X-Gm-Gg: ASbGncvOjTGJV09wRkeq5kTCcGsEDTItCwTtMKXu6hzPjIZz4mOyBOk77+fhAo1NolC
	qJ7/r+9wzzpC4vKVpy30td5aUJJpXsFyTXwoJmJ1A1gEt8tBc7qXP01oTCFDz56b1qg2+hn0bmZ
	9NXqcuRNWJp3dtaXQ3DWIYeQ3n96RMRdLXzWVnBMe8/JLh7wbGHbEYxMWOLEPZ41gWRGr3lH716
	raICy2HwfweeQ8Nr9FW/OkWdFMMSbv8AQ/jl9Yurodxn8P6Ff9DI80c7OTMS9dK8yzH92v+TE7Q
	SG4BdptMd3yy
X-Google-Smtp-Source: AGHT+IHVtmtnhDk6l8XyHv9d3jrtZEyROHUGwJJDJGTgKNxtnts6XmJwYXEzpx+4tdZJ8cxSZjnfxg==
X-Received: by 2002:a05:6e02:3a8a:b0:3a7:dee4:c423 with SMTP id e9e14a558f8ab-3a7dee4c65fmr125528645ab.9.1733136642834;
        Mon, 02 Dec 2024 02:50:42 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c39f4d7sm6509607a12.69.2024.12.02.02.50.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 02:50:41 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2805625a91.2
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 02:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeR74x+8y2IGDX3Ys5tJsvhXJmkYNtt5onAGoUyNgIKXC2TNDd8h8COEWiqgM2IGWEpL2QOPeZRojx+w==@vger.kernel.org
X-Received: by 2002:a17:90b:510d:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2ee9b2c4e6cmr9894391a91.30.1733136640207; Mon, 02 Dec 2024
 02:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com> <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl> <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
 <20241129220339.GD2652@pendragon.ideasonboard.com> <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com> <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com> <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
 <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
In-Reply-To: <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 11:50:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCvmRrf1vT3g9Mzkc790RUo3GuQaFzu5+_G66b3_62RuXw@mail.gmail.com>
Message-ID: <CANiDSCvmRrf1vT3g9Mzkc790RUo3GuQaFzu5+_G66b3_62RuXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 11:27, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2-Dec-24 9:44 AM, Hans Verkuil wrote:
> > On 02/12/2024 09:11, Laurent Pinchart wrote:
> >> On Mon, Dec 02, 2024 at 09:05:07AM +0100, Hans Verkuil wrote:
> >>> On 02/12/2024 01:18, Laurent Pinchart wrote:
> >>>> On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> >>>>> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> >>>>>> On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> >>>>>>> Before we all go on a well deserved weekend, let me recap what we
> >>>>>>> know. If I did not get something correctly, let me know.
> >>>>>>>
> >>>>>>> 1) Well behaved devices do not allow to set or get an incomplete async
> >>>>>>> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> >>>>>>> 2) Both Laurent and Ricardo consider that there is a big chance that
> >>>>>>> some camera modules do not implement this properly. (ref: years of
> >>>>>>> crying over broken module firmware :) )
> >>>>>>>
> >>>>>>> 3) ctrl->handle is designed to point to the fh that originated the
> >>>>>>> control. So the logic can decide if the originator needs to be
> >>>>>>> notified or not. (ref: uvc_ctrl_send_event() )
> >>>>>>> 4) Right now we replace the originator in ctrl->handle for unfinished
> >>>>>>> async controls.  (ref:
> >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> >>>>>>>
> >>>>>>> My interpretation is that:
> >>>>>>> A) We need to change 4). We shall not change the originator of
> >>>>>>> unfinished ctrl->handle.
> >>>>>>> B) Well behaved cameras do not need the patch "Do not set an async
> >>>>>>> control owned by another fh"
> >>>>>>> C) For badly behaved cameras, it is fine if we slightly break the
> >>>>>>> v4l2-compliance in corner cases, if we do not break any internal data
> >>>>>>> structure.
> >>>>>>
> >>>>>> The fact that some devices may not implement the documented behaviour
> >>>>>> correctly may not be a problem. Well-behaved devices will stall, which
> >>>>>> means we shouldn't query the device while as async update is in
> >>>>>> progress. Badly-behaved devices, whatever they do when queried, should
> >>>>>> not cause any issue if we don't query them.
> >>>>>
> >>>>> I thought we could detect the stall and return safely. Isn't that the case?
> >>>>
> >>>> We could, but if we know the device will stall anyway, is there a reason
> >>>> not to avoid issuing the request in the first place ?
> >>>>
> >>>>> Why we have not seen issues with this?
> >>>>
> >>>> I haven't tested a PTZ device for a very long time, and you would need
> >>>> to hit a small time window to see the issue.
> >>>>
> >>>>>> We should not send GET_CUR and SET_CUR requests to the device while an
> >>>>>> async update is in progress, and use cached values instead. When we
> >>>>>> receive the async update event, we should clear the cache. This will be
> >>>>>> the same for both well-behaved and badly-behaved devices, so we can
> >>>>>> expose the same behaviour towards userspace.
> >>>>>
> >>>>> seting ctrl->loaded = 0 when we get an event sounds like a good idea
> >>>>> and something we can implement right away.
> >>>>> If I have to resend the set I will add it to the end.
> >>>>>
> >>>>>> We possibly also need some kind of timeout mechanism to cope with the
> >>>>>> async update event not being delivered by the device.
> >>>>>
> >>>>> This is the part that worries me the most:
> >>>>> - timeouts make the code fragile
> >>>>> - What is a good value for timeout? 1 second, 30, 300? I do not think
> >>>>> that we can find a value.
> >>>>
> >>>> I've been thinking about the implementation of uvc_fh cleanup over the
> >>>> weekend, and having a timeout would have the nice advantage that we
> >>>> could reference-count uvc_fh instead of implementing a cleanup that
> >>>> walks over all controls when closing a file handle. I think it would
> >>>> make the code simpler, and possibly safer too.
> >>>>
> >>>>>> Regarding the userspace behaviour during an auto-update, we have
> >>>>>> multiple options:
> >>>>>>
> >>>>>> For control get,
> >>>>>>
> >>>>>> - We can return -EBUSY
> >>>>>> - We can return the old value from the cache
> >>>
> >>> This would match the control behavior best. Only when the operation is
> >>> done is the control updated and the control event sent.
> >>>
> >>> Some questions: is any of this documented for UVC? Because this is non-standard
> >>
> >> No this isn't documented.
> >>
> >>> behavior. Are there applications that rely on this? Should we perhaps add
> >>
> >> I don't know.
> >>
> >>> proper support for this to the control framework? E.g. add an ASYNC flag and
> >>> document this?
> >>
> >> We could, but this is such a specific use case that I don't think is
> >> worth adding complexity to the already complex control framework would
> >> be worth it. What we could do is perhaps adding a flag for the userspace
> >> API, but even there, I never like modelling an API with a single user.
> >
> > Well, it might be a single driver that uses this, but it is also the most
> > used driver by far. I think the only change is to add a flag for this and
> > describe how it should behave. And add v4l2-compliance tests for it.
> >
> > Otherwise no changes to the control framework are needed, I think.
> >
> > Controls with the ASYNC flag set would:
> >
> > - return the old value from the cache.
> > - document that setting a new value while the operation is in progress
> >   results in EBUSY. Document that if the new value is equal to the old value,
> >   then return 0 and do nothing (alternative is to just immediately send
> >   the control changed event, but that might require a control framework change).
> > - when the operation finishes, update the cache to the new value and
> >   send the control changed event.
> > - document that userspace should specify V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK
> >   when subscribing to the control if you calling fh wants to know when
> >   the operation finishes.
> > - document how timeouts should be handled: this is tricky, especially with
> >   bad hardware. I.e. if the hw doesn't send the event, does that mean that
> >   you are never able to set the control since it will stall?
> >   In the end this will just reflect how UVC handles this.
>
> I have been catching up on this thread (I have not read the v3 and v4
> threads yet).
>
> This all started with Ricardo noticing that ctrl->handle may get
> overwritten when another app sets the ctrl, causing the first app
> to set the ctrl to get a V4L2_EVENT for the ctrl (if subscribed)
> even though it set the ctrl itself.
>
> My observations so far:
>
> 1. This is only hit when another app changes the ctrl after the first app,
> in this case, if there is no stall issued by the hw for the second app's
> request, arguably the first app getting the event for the ctrl is correct

In other words, for non compliant cameras the current behaviour is
correct. For compliant cameras it is broken.

> since it was changed by the second app. IOW I think the current behavior
> is not only fine, but even desirable. Assuming we only override ctrl->handle
> after successfully sending the set-ctrl request to the hardware.

We are overriding ctrl->handle unconditionally, even if set-ctrl stalls.


>
> 2. This adds a lot of complexity for not sending an event to the app
> which made the change. Hans V. suggested maybe adding some sort of flag
> for async ctrls to the userspace API. I wonder if we should not just
> get rid of this complexity and document that these controls will always
> generate events independent of V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK ?
> That would certainly simplify things, but it raises the questions if
> this will cause issues for existing applications.

To be honest, I am more concerned about the dangling pointers than the event.

Updating the doc to say that  ASYC controls always generate events
sounds good to me. But until we reach an agreement on the specifics
I'd rather land this fix and then we can take time to design an API
that works for compliant and non compliant hardware.

>
> Note that if we simply return -EBUSY on set until acked by a status
> event we also avoid the issue of ctrl->handle getting overwritten,
> but that relies on reliable status events; or requires timeout handling.
>
> 3. I agree with Ricardo that a timeout based approach for cameras which
> to not properly send status events for async ctrls is going to be
> problematic. Things like pan/tilt homing can take multiple seconds which
> is really long to use as a timeout if we plan to return -EBUSY until
> the timeout triggers. I think it would be better to just rely on
> the hardware sending a stall, or it accepting and correctly handling
> a new CUR_SET command while the previous one is still being processed.
>
> I guess we can track if the hw does send status events when async ctrls
> complete and then do the -EBUSY thing without going out to the hw after
> the first time an async ctrl has been acked by a status event.
>
> And then combine that with the current behavior of overwriting ctrl->handle
> until the ctrl has been marked as having working status events. So:
>
> a) In case we do not know yet if a ctrl gets status-event acks; and
> on devices without reliable status events keep current behavior.
>
> b) As soon as we know a ctrl has reliable status events, switch to
> returning -EBUSY if a set is pending (as indicated by ctrl->handle
> being set).
>
> I don't like the fact that this changes the behavior after the first
> status event acking an async ctrl, but I don't really see another way.

If I understood you correctly, you are proposing the following quirk:

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f0e8a436a306..1a554afeaa2f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1132,6 +1132,9 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
        if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
                return -EACCES;

+       if (ctrl->handle && ctrl->async_event_works)
+               return -EBUSY;
+
        ret = __uvc_ctrl_load_cur(chain, ctrl);
        if (ret < 0)
                return ret;
@@ -1672,6 +1675,8 @@ bool uvc_ctrl_status_event_async(struct urb
*urb, struct uvc_video_chain *chain,
        /* Flush the control cache, the data might have changed. */
        ctrl->loaded = 0;

+       ctrl->async_event_works = true;
+
        if (list_empty(&ctrl->info.mappings))
                return false;

@@ -1982,6 +1987,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
        if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
                return -EACCES;

+       if (ctrl->handle && ctrl->async_event_works)
+               return -EBUSY;
+
        /* Clamp out of range values. */
        switch (mapping->v4l2_type) {
        case V4L2_CTRL_TYPE_INTEGER:
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index e0e4f099a210..0ef7c594eecb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -154,6 +154,7 @@ struct uvc_control {
                                 * File handle that initially changed the
                                 * async control.
                                 */
+       bool async_event_works;
 };

The benefit is that we can predict a device returning STALL without
having to actually do the set/get operation.

We can add it as a follow-up patch.


>
> Regards,
>
> Hans
>
>
>
>
> >>
> >>>>>> - We can return the new value fromt he cache
> >>>>>>
> >>>>>> Returning -EBUSY would be simpler to implement.
> >>>>>
> >>>>> Not only easy, I think it is the most correct,
> >>>>>
> >>>>>> I don't think the behaviour should depend on whether the control is read
> >>>>>> on the file handle that initiated the async operation or on a different
> >>>>>> file handle.
> >>>>>>
> >>>>>> For control set, I don't think we can do much else than returning
> >>>>>> -EBUSY, regardless of which file handle the control is set on.
> >>>>>
> >>>>> ACK.
> >>>>>
> >>>>>>> I will send a new version with my interpretation.
> >>>>>>>
> >>>>>>> Thanks for a great discussion
> >>>>>
> >>>>> Looking with some perspective... I believe that we should look into
> >>>>> the "userspace behaviour for auto controls" in a different patchset.
> >>>>> It is slightly unrelated to this discussion.
> >>
> >
> >
>


-- 
Ricardo Ribalda

