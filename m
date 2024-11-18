Return-Path: <linux-media+bounces-21546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2FF9D15BC
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8402867C9
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF41C1F07;
	Mon, 18 Nov 2024 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OGLxDaGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87B18B47E
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948464; cv=none; b=Gli2uqDRgaJRp+h0kep2eL/wAg6SuXm37hGqMJKkO0BC2AXJUSzGcfribzFBWx2Sv9XLHMN93wsGp0aq40GUayZSyODgQCQd2HjkbkgRTc0M7fc99+uIKw/Bl9nJFM0/HdsNyD4kaGK5gdyoLioM5P9olV3OQ2CNSuE7yJk3fIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948464; c=relaxed/simple;
	bh=yUSOBJAhZYGJEb91LOf9/F+cIxwsIob3hpdkxnytrHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8uvYB76oXp0flaFChNLQf9Ex36dn9VII2kUQj5fBVKHWZhilxALTJ8AYubdS0rq6bJjQVyD2Cda9dCjDpr/zIj3TdzhOCbLp3EaJgqnbsOSKv8fESalcxaDHAoMtLD/t3N5/3fjBYJqPlgwfucLI2tPL3eX+p4XiRxFR27vV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OGLxDaGB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ce65c8e13so35128375ad.1
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731948462; x=1732553262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0mm/PWPqZhhB2Aa+PXcFRhrWz88rzZr3H50J2VPWa+g=;
        b=OGLxDaGBskwDFV7u+9RQV22aHPqkI2g3XxuRDnenHjaPHmfiV722ApsAXVkJwX/siN
         BAw8wsJxDcLWoc6QuSfAwg9DKjo1deX7ZLtWSBe2ZUSXQBWjdPqb7dRUQGIG7yboxjFJ
         dLPYIsb8U0KHfvNaJtiMuOVojtSw9J0kgueKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731948462; x=1732553262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mm/PWPqZhhB2Aa+PXcFRhrWz88rzZr3H50J2VPWa+g=;
        b=Xfsaq2ZfY2L+QlilSybrSfq7gqD8b44ktBIB2OXa3475UTwfDOJfOaXsKfVT6YX5ki
         HcxTYpfYZPE0E+aasEtRqBJcPznP6YUPPcb3ur9KbI7P6oraIoKPFYimRa2Iu7YFAKCT
         BRmWtHBoF2BmEaJflcGzNvgTPVabgVuUCOApa42pKoWGhG0w0s6NX5fN9WAyqxYDp2BR
         0zSEHmJBN/wJAdiEM0Un6ET15a6wcTcEFSp37genw3W3DXAh8GlX9l6Sy+CMP5yMsJuR
         JP2ySEE5SNPaD6BQ66uU2yecH7eFiWusWxtFbeate/JPedFKvmUvtWjEVSmBMy6fmNSe
         xVng==
X-Forwarded-Encrypted: i=1; AJvYcCWDvbmeB57NInJceD6LzMJ+4ittufypTnUE/x8Z6aDs9DpcVjah5t/rHZGfPHUNpYoz18Su3xHAEAe9wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzImpa3ymd7cw+iPA2g2BwdZgz1doRplTUXc1k06xsXmCygVync
	ZoQSgPQ1M/onrhJ8Gex3dZ/+wKHqbjrtOVheorzPA4rzHay49fnfRTXw151w0jY4oXyul3YXYWw
	=
X-Google-Smtp-Source: AGHT+IGDQ3J4qa3ZQKUckDWre3XWUPmXvv9rjhmN4+1RHyaW2Vwktp+QFUZQEUq4VRWu5GiDq17SnA==
X-Received: by 2002:a17:903:11cd:b0:20c:ecd8:d0af with SMTP id d9443c01a7336-211d0d5eea4mr181710825ad.9.1731948461514;
        Mon, 18 Nov 2024 08:47:41 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f56defsm59112735ad.270.2024.11.18.08.47.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 08:47:39 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so3175408b3a.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 08:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWSo/7BjZfjwPeoH/gyAWXXR/AJ0hO+/PmHkYkVcHiXGQxsHchVtf2+L20hVi4UlMpvT9db8rmtOyUsQ==@vger.kernel.org
X-Received: by 2002:a05:6a00:18a2:b0:71e:60fc:ad11 with SMTP id
 d2e1a72fcca58-72476ccb9c5mr14401794b3a.16.1731948458095; Mon, 18 Nov 2024
 08:47:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <bd68178f-1de9-491f-8209-f67065d29283@redhat.com> <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com> <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
 <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
In-Reply-To: <d0dd293e-550b-4377-8a73-90bcfe8c2386@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Nov 2024 17:47:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
Message-ID: <CANiDSCvS1qEfS9oY=R05YhdRQJZmAjDCxVXxfVO4-=v4W1jTDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a evdev
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 18 Nov 2024 at 16:43, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> On 15-Nov-24 9:20 AM, Ricardo Ribalda wrote:
> > On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> Hello,
> >>
> >> On Thu, Nov 14, 2024 at 08:21:26PM +0100, Ricardo Ribalda wrote:
> >>> On Wed, 13 Nov 2024 at 18:57, Hans de Goede wrote:
> >>>> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> >>>>> Some notebooks have a button to disable the camera (not to be mistaken
> >>>>> with the mechanical cover). This is a standard GPIO linked to the
> >>>>> camera via the ACPI table.
> >>>>>
> >>>>> 4 years ago we added support for this button in UVC via the Privacy control.
> >>>>> This has three issues:
> >>>>> - If the camera has its own privacy control, it will be masked.
> >>>>> - We need to power-up the camera to read the privacy control gpio.
> >>>>> - Other drivers have not followed this approach and have used evdev.
> >>>>>
> >>>>> We tried to fix the power-up issues implementing "granular power
> >>>>> saving" but it has been more complicated than anticipated...
> >>>>>
> >>>>> This patchset implements the Privacy GPIO as a evdev.
> >>>>>
> >>>>> The first patch of this set is already in Laurent's tree... but I
> >>>>> include it to get some CI coverage.
> >>>>>
> >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>> ---
> >>>>> Changes in v3:
> >>>>> - CodeStyle (Thanks Sakari)
> >>>>> - Re-implement as input device
> >>>>
> >>>> Thank you for your enthusiasm for my suggestion to implement this
> >>>> as an input device.
> >>>
> >>> I wanted to give it a try... and it turned out to be quite simple to
> >>> implement. I thought it could be a good idea to share it, so we can
> >>> have something tangible to talk about ;).
> >>>
> >>>> As I mentioned in my reply in the v2 thread, the goal of my
> >>>> enumeration of various way camera privacy-controls are exposed to
> >>>> userspace today is to try and get everyone to agree on a single
> >>>> userspace API for this.
> >>>>
> >>>> Except for this v3 patch-set, which I take as an implied vote
> >>>> from you (Ricardo) for the evdev SW_CAMERA_LENS_COVER approach,
> >>>> we have not heard anything on this subject from Sakari or Laurent
> >>>> yet. So for now I would like to first focus on / circle back to
> >>>> the userspace API discussion and then once we have a plan for
> >>>> the userspace API we can implement that for uvcvideo.
> >>>>
> >>>> First lets look at the API question top down, iow what use-cases
> >>>> do we expect there to be for information about the camera-privacy
> >>>> switch state:
> >>>>
> >>>> a) Having an app which is using (trying to use) the camera show
> >>>> a notification to the user that the camera is turned-off by
> >>>> a privacy switch .
> >>>>
> >>>> Ricardo, AFAICT this is the main use-case for chrome-os, do I have
> >>>> this right ?
> >>>
> >>> b) is as important as a) for us.  If you do not give instant feedback
> >>> to the user when they change the status of the camera they might not
> >>> be able to find the button later on :)
> >>
> >> How do you handle cameras that suffer from
> >> UVC_QUIRK_PRIVACY_DURING_STREAM ?
> >
> > For those b) does not work.
>
> I already suspected as much, but it is good to have this
> confirmed.
>
> I'm afraid that from a userspace API pov cameras with a GPIO
> which only works when powered-on need to be treated the same as
> cameras which only have UVC_CT_PRIVACY_CONTROL IOW in this case
> keep exporting V4L2_CID_PRIVACY instead of switching to evdev
> with SW_CAMERA_LENS_COVER.
>
> Unfortunately this will make the GPIO handling code in the UVC
> driver somewhat more involved since now we have both uAPI-s for
> GPIOs depending on UVC_QUIRK_PRIVACY_DURING_STREAM.
>
> But I think that this makes sense, this way we end up offering
> 2 uAPIs depending on the hw capabilities:
>
> 1. evdev with SW_CAMERA_LENS_COVER which always reports a reliable
> state + events on the state changing without needing to power-up
> the camera.
>
> 2. V4L2_CID_PRIVACY for the case where the camera needs to be
> powered-on (/dev/video opened) and where the ctrl possibly needs
> to be polled.
>
> Assuming we can all agree on this split based on hw capabilities
> I think that we must document this somewhere in the media subsystem
> documentation. We can then also write down there that
> SW_CAMERA_LENS_COVER only applies to internal cameras.

I do not think that it is worth it to keep UVC_CT_PRIVACY_CONTROL for
the two devices that have connected the GPIO's pull up to the wrong
power rail.
Now that the GPIO can be used from userspace, I expect that those
errors will be found early in the design process and never reach
production stage.


If we use UVC_CT_PRIVACY_CONTROL for thes two devices:
- userspace will have to implement two different APIs
- the driver will have to duplicate the code.
- all that code will be very difficult to test: there are only 2
devices affected and it requires manual intervention to properly test
it.

I think that UVC_QUIRK_PRIVACY_DURING_STREAM is a good compromise and
the main user handles it properly.


>
> >>>> b) Showing on on-screen-display (OSD) with a camera /
> >>>> crossed-out-camera icon when the switch is toggled, similar to how
> >>>> muting speakers/mic show an OSD . Laptop vendor Windows add-on
> >>>> software does this and I know that some users have been asking
> >>>> for this.
> >>>>
> >>>> Then lets look at the question bottom-up which hardware interfaces
> >>>> do we have exposing this information:
> >>>>
> >>>> 1. Internal UVC camera with an input privacy GPIO resource in
> >>>> the ACPI fwnode for the UVC camera, with the GPIO reporting
> >>>> the privacy-switch state. Found on some chrome-books
> >>
> >> Ricardo, is this found only in ACPI-based (x86) chromebooks, or also in
> >> DT-based chromebooks ?
> >
> > I am only aware of ACPI models using this feature today. But there
> > might be DT devices in the future that will use this feature.
> > AFAIK the code should support ACPI and DT.
> >
> >>
> >> Can we assume that the UVC module will not be powered off (and therefore
> >> disappear from USB) when the privacy switch is toggled to disable the
> >> camera ?
> >
> > That is true today, but I cannot be sure that some vendor becomes
> > creative and wire things in a weird way. We usually catch this things
> > early in the process and solve them, but I cannot predict the future
> > (yet :P)
>
> FWIW note that dropping the UVC module of the bus is definitely
> a thing on Windows laptops, but there the camera on/off events
> are handled by the embedded-controller and reported through
> some vendor WMI/ACPI interface rather then being handled by
> the UVC driver.
>
> So not really relevant to the discussion wrt the UVC driver,
> but still good to keep in mind.
>
> >>>> 2. Laptop firmware (EC/ACPI/WMI) which reports privacy-switch
> >>>> state, without a clear 1:1 relation between the reported state and
> >>>> which camera it applies to. In this case sometimes the whole UVC
> >>>> camera module (if it is UVC) is simply dropped of the bus when
> >>>> the camera is disabled through the privacy switch, removing
> >>>> the entire /dev/video# node for the camera. Found on many windows
> >>>> laptops.
> >>>>
> >>>> 3. UVC cameras which report privacy-switch status through
> >>>> a UVC_CT_PRIVACY_CONTROL. Found on ... ?
> >>>
> >>> Some logitech cameras and also internal ones.
> >>>
> >>>> Note this will only work while the camera is streaming and
> >>>> even then may require polling of the ctrl because not all
> >>>> cameras reliably send UVC status messages when it changes.
> >>>> This renders this hardware interface as not usable
> >>
> >> In general I agree, but maybe the situation is better with the UVC
> >> cameras that implement UVC_CT_PRIVACY_CONTROL ?
> >>
> >> Note that, in theory, and as far as I understand, it should be possible
> >> to get the UVC_CT_PRIVACY_CONTROL events when the camera is not
> >> streaming, if the device implement remote wakeup. In practice that's
> >> hardly ever the case, among the ~450 sets of USB descriptors I've
> >> collected over time, only 8 report support for remote wakeup in the
> >> configuration descriptor's bmAttributes field, and I'm not even sure we
> >> could trust those devices to implement this feature correctly.
> >
> > I would bet that they simply copied the descriptor from another
> > project and did not test it.
> >
> >>
> >> Ricardo, do you know if the internal UVC cameras used in chromebooks
> >> that implement UVC_CT_PRIVACY_CONTROL support remote wakeup to notify
> >> changes in the privacy control when the camera is suspended ?
> >
> > Today we only rely on the gpio privacy.
> >
> > Some camera vendors even emulate the control:
> > Instead of having a gpio and a sensor, they look at the frame and if
> > it is very dark, they zero it out completely and set
> > UVC_CT_PRIVACY_CONTROL to 1.
>
> My 2 cents here are that given the wide variety of hardware that
> even if some hw reliably provides status interrupts for
> UVC_CT_PRIVACY_CONTROL we cannot rely on that and we certainly
> cannot rely on remote wakeup being present *and* reliabe.
>
> So I really think that for UVC_CT_PRIVACY_CONTROL we should
> stick with V4L2_CID_PRIVACY.
>
> >>>> Currently there are 2 ways this info is being communicated
> >>>> to userspace, hw-interfaces 1. + 3. are exposed as a v4l2
> >>>> privacy-ctrl where as hw-if 2. uses and input evdev device.
> >>>>
> >>>> The advantage of the v4l2 privacy-ctrl is that it makes it
> >>>> very clear which camera is controlled by the camera
> >>>> privacy-switch.
> >>>>
> >>>> The disadvantage is that it will not work for hw-if 2,
> >>>> because the ACPI / WMI drivers have no v4l2 device to report
> >>>> the control on. We could try to add some magic glue code,
> >>>> but even then with e.g. IPU6 cameras it would still be
> >>>> unclear which v4l2(sub)device we should put the control on
> >>>> and if a UVC camera is just dropped from the bus there is
> >>>> no /dev/video# device at all.
> >>
> >> Is there any ACPI- or WMI-provided information that could assist with
> >> associating a privacy GPIO with a camera ?
> >>
> >>>> Using an input device does not has this disadvantage and
> >>>> it has the advantage of not requiring to power-up the camera
> >>>> as currently happens with a v4l2 ctrl on a UVC camera.
> >>
> >> API-wise, and with the current uvcvideo implementation, I agree. We
> >> could of course also try to improve the uvcvideo driver to not power the
> >> device unless it is streaming (depending on whether or not the known
> >> drawbacks are considered acceptable).
> >>
> >> Devices in the 3rd category will still need to be powered up to report
> >> the status of the privacy control, as well as some devices in the 1st
> >> category (see patch 8/8 in this series that introduces
> >> UVC_QUIRK_PRIVACY_DURING_STREAM).
> >>
> >>>> But using an input device makes it harder to determine
> >>>> which camera the privacy-switch applies to.
> >>
> >> We could include the evdev in the MC graph. That will of course only be
> >> possible if the kernel knows about that association in the first place.
> >> At least the 1st category of devices would benefit from this.
>
> Yes I was thinking about adding a link to the MC graph for this too.
>
> Ricardo I notice that in this v3 series you still create a v4l2-subdev
> for the GPIO handling and then add an ancillary link for the GPIO subdev
> to the mc-graph. But I'm not sure how that is helpful. Userspace would
> still need to do parent matching, but then match the evdev parent to
> the subdev after getting the subdev from the mc. In that case it might
> as well look at the physical (USB-interface) parent of the MC/video
> node and do parent matching on that avoiding the need to go through
> the MC at all.
>
> I think using the MC could still be useful by adding a new type of
> ancillary link to the MC API which provides a file-path as info to
> userspace rather then a mc-link and then just directly provide
> the /dev/input/event# path through this new API?
>
> I guess that extending the MC API like this might be a bit of
> a discussion. But it would already make sense to have this for
> the existing input device for the snapshot button.

The driver creates a v4l2-subdevice for every entity, and the gpio
today is modeled as an entity.
The patchset just adds an ancillary link as Sakari suggested.
I am not against removing the  gpio entity all together if it is not needed.

Now that we are brainstorming here... what about adding a control that
contains the name of the input device (eventX)? Is that a horrible
idea?

>
> >>>> We can specify
> >>>> that SW_CAMERA_LENS_COVER only applies to device internal
> >>>> cameras, but then it is up to userspace to determine which
> >>>> cameras that are.
> >>>
> >>> I am working on wiring up this to userspace right now.. I will report
> >>> back if it cannot do it.
>
> Ricardo, great, thank you!
>
> >>>> Another problem with using an input device is that it will
> >>>> not work for "UVC cameras which report privacy-switch status
> >>>> through a UVC_CT_PRIVACY_CONTROL." since those need the camera
> >>>> on and even then need to be polled to get a reliable reading.
> >>>>
> >>>> Taking this all into account my proposal would be to go
> >>>> with an input device and document that SW_CAMERA_LENS_COVER
> >>>> only applies to device internal cameras.
> >>>>
> >>>> This should work well for both use-cases a) and b) described
> >>>> above and also be easy to support for both hw interfaces
> >>>> 1. and 2.
> >>>>
> >>>> My proposal for hw-if 3. (UVC_CT_PRIVACY_CONTROL) would be
> >>>> to keep reporting this as V4L2_CID_PRIVACY. This means it
> >>>> will not work out of the box for userspace which expects
> >>>> the input device method, but giving the limitations of
> >>>> this hw interface I think that requiring userspace to have
> >>>> to explicitly support this use-case (and e.g. poll the
> >>>> control) is a good thing rather then a bad thing.
> >>>>
> >>>> Still before moving forward with switching the hw-if 1.
> >>>> case to an input device as this patch-series does I would
> >>>> like to hear input from others.
> >>>>
> >>>> Sakari, Laurent, any comments ?
> >>
> >> Assuming the kernel could report the association between an evdev and
> >> camera, we would need to report which evdev SW_CAMERA_LENS_COVER
> >> originates from all the way from the evdev to the consumer of the event.
> >> How well is that supported in standard Linux system architectures ? If
> >> I'm not mistaken libinput will report the originating device, but how
> >> far up the stack is it propagated ? And which component would we expect
> >> to consume those events, should the camera evdev be managed by e.g.
> >> libcamera ?
>
> Good questions. Looking back at our 2 primary use-cases:
>
> a) Having an app which is using (trying to use) the camera show
> a notification to the user that the camera is turned-off by
> a privacy switch .
>
> b) Showing on on-screen-display (OSD) with a camera /
> crossed-out-camera icon when the switch is toggled, similar to how
> muting speakers/mic show an OSD . Laptop vendor Windows add-on
> software does this and I know that some users have been asking
> for this.
>
> I think we have everything to do b) in current compositors
> like gnome-shell. Using an evdev with SW_CAMERA_LENS_COVER
> would even be a lot easier for b) then the current
> V4L2_CID_PRIVACY API.
>
> a) though is a lot harder. We could open up access to
> the relevant /dev/input/event# node using a udev uaccess
> tag so that users who can access /dev/video# nodes also
> get raw access to that /dev/input/event# node and then
> libcamera could indeed provide this information that way.
> I think that is probably the best option.
>
> At least for the cases where the camera on/off switch
> does not simply make the camera completely disappear.
>
> That case is harder. atm that case is not handled at all
> though. So even just getting b) to work for that case
> would be nice / an improvement.
>
> Eventually if we give libcamera access to event#
> nodes which advertise SW_CAMERA_LENS_COVER (and no other
> privacy sensitive information) then libcamera could even
> separately offer some API for apps to just get that value
> if there is no camera to associate it with.
>
> Actually thinking more about it libcamera probably might
> be the right place for some sort of "no cameras found
> have you tried hitting your camera privacy-switch" API.
> That is some API to query if such a message should be
> shown to the user. But that is very much future work.

Are standard apps expected to use libcamera directly or they should
use pipewire?
Maybe a) Should be pipewire's task?

>
> Regards,
>
> Hans
>
>
>


--
Ricardo Ribalda

