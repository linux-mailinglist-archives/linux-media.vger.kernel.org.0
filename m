Return-Path: <linux-media+bounces-21455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70F9CDA5F
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 09:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D57A1B23A21
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 08:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7116A189F57;
	Fri, 15 Nov 2024 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7hGRk4O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DDE1714A5
	for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 08:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731658830; cv=none; b=V5rRKhglfIiNHLJVAFZaVALGpbXyG+AGtIPeZ6QgX4OeIKZo1NtnNSSvPPBJQdFBK55whqB2Zi5uzTEVu+TzQyK33f3yKX4S+nd9/K7tGjjguqR1PaDU9/Pr4mvq8cVVBdvRPjxVYC+mmDV+AsELcZiZhQWz+8BB+F2R9MWhhpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731658830; c=relaxed/simple;
	bh=4SC8mILf0rvseM0XKm9GQUrhHTyFowSjB/21Lh+cpwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acRwJgQpA28Kp2F25hh/x1wRVmafcld01Lc1ETg4t3PAf2UV7AexTwRT0y0LxhJn17PdSvrSNB0paVu84mHmUvnR7ssfQCRnFvKaha6y52DLcAyj+sF0SkJNb4PawAVaDQ9xN8PzAAVpB0oEGvY3H3nJGCB6SmrDPSDQ1gJTyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e7hGRk4O; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cceb8d8b4so9556965ad.1
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 00:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731658827; x=1732263627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2P/a4ZqNqp7Khoy4YB2dYMwhDmqq+pZoVbc6/H1m+eA=;
        b=e7hGRk4O0iFNVdOhMVGF12ic+d5REEFq2TC402xr4oXDBKhb7bepBD2TiQw43dejCg
         0NDy560tqUMvCV7DJOLLNSe4SAkZVoZlsF8c+EMFlo8zunHcObshgW3EB913zOgY08b5
         B7KQXu3vEGxYYAPxDQfUXT8tJSrKE47W1pBds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731658827; x=1732263627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P/a4ZqNqp7Khoy4YB2dYMwhDmqq+pZoVbc6/H1m+eA=;
        b=NIVuBRmoqtarpyqsfDlfx2gRVLNU00ft1VAqgYzKtitkcCdJa2XqvMoRNlJQbU9frO
         wczrs6+2gKL1XvBAhMSKg9MdfbaSK8BXXhdp88NJpTtEp9Ukf1u3itTbxT09jn1Ukzgo
         zjGcQ+hcXHsY9gqpz3UrTjWRVh0f7n0TbpI75sv8nMt1qoM46INrrQzY+5C8wxqIudAu
         lnQwdWhhbT2g29x7PMsrAbcBdpGrQiSWIe6jL8mw8eJITYBd64HqtX6WNs1AWCy4yt34
         zqfFBNHGobpq/scgoDnIOPR4YvTCTcPTB2ofXkgdcdtbpQ/ek+NjgLsd9BH+EfO/cllC
         mKmw==
X-Forwarded-Encrypted: i=1; AJvYcCWMUTrpZ615Dzjs95P7N4jH9ezQcOxKYU+79bdgCNkbldQGckcvvCnwg40IiagR0CzACJlUhRLa6FuY+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfkekxdiN4t5vrTGVd5jX/jFoqHkSLqfaBQIfutT4M8+S47fCZ
	66LsNEfxfu2GSm8e7DjTcYx9/dYL2GHTFRi7GxL814R9Zv22hug2dagijXtSSibHBb8GvFrLlW0
	=
X-Google-Smtp-Source: AGHT+IG7MIjRjEOYrT1H5bIKPRUIwC0DDUuMwfofPPpepH79uz22gyOUPU3ger6xNpGNY4O/qy2rbw==
X-Received: by 2002:a17:903:228d:b0:20b:a409:329 with SMTP id d9443c01a7336-211c0f0a592mr94574855ad.5.1731658827254;
        Fri, 15 Nov 2024 00:20:27 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm7454415ad.264.2024.11.15.00.20.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 00:20:26 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7246c8b89b4so1012830b3a.1
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 00:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg/4awLbhKbDxqPmaEsbtlzYINM0HBsTTexeV14cWKp+BA6lv5XBkgu12kPgb6mPgV7tkv8uB4FBbedw==@vger.kernel.org
X-Received: by 2002:a05:6a00:190c:b0:724:66cf:163f with SMTP id
 d2e1a72fcca58-72475f97125mr3282539b3a.3.1731658825744; Fri, 15 Nov 2024
 00:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
 <bd68178f-1de9-491f-8209-f67065d29283@redhat.com> <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
 <20241114230630.GE31681@pendragon.ideasonboard.com>
In-Reply-To: <20241114230630.GE31681@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 15 Nov 2024 09:20:13 +0100
X-Gmail-Original-Message-ID: <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
Message-ID: <CANiDSCt_bQ=E1fkpH1SAft1UXiHc2WYZgKDa8sr5fggrd7aiJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a evdev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Nov 14, 2024 at 08:21:26PM +0100, Ricardo Ribalda wrote:
> > On Wed, 13 Nov 2024 at 18:57, Hans de Goede wrote:
> > > On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> > > > Some notebooks have a button to disable the camera (not to be mistaken
> > > > with the mechanical cover). This is a standard GPIO linked to the
> > > > camera via the ACPI table.
> > > >
> > > > 4 years ago we added support for this button in UVC via the Privacy control.
> > > > This has three issues:
> > > > - If the camera has its own privacy control, it will be masked.
> > > > - We need to power-up the camera to read the privacy control gpio.
> > > > - Other drivers have not followed this approach and have used evdev.
> > > >
> > > > We tried to fix the power-up issues implementing "granular power
> > > > saving" but it has been more complicated than anticipated...
> > > >
> > > > This patchset implements the Privacy GPIO as a evdev.
> > > >
> > > > The first patch of this set is already in Laurent's tree... but I
> > > > include it to get some CI coverage.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Changes in v3:
> > > > - CodeStyle (Thanks Sakari)
> > > > - Re-implement as input device
> > >
> > > Thank you for your enthusiasm for my suggestion to implement this
> > > as an input device.
> >
> > I wanted to give it a try... and it turned out to be quite simple to
> > implement. I thought it could be a good idea to share it, so we can
> > have something tangible to talk about ;).
> >
> > > As I mentioned in my reply in the v2 thread, the goal of my
> > > enumeration of various way camera privacy-controls are exposed to
> > > userspace today is to try and get everyone to agree on a single
> > > userspace API for this.
> > >
> > > Except for this v3 patch-set, which I take as an implied vote
> > > from you (Ricardo) for the evdev SW_CAMERA_LENS_COVER approach,
> > > we have not heard anything on this subject from Sakari or Laurent
> > > yet. So for now I would like to first focus on / circle back to
> > > the userspace API discussion and then once we have a plan for
> > > the userspace API we can implement that for uvcvideo.
> > >
> > > First lets look at the API question top down, iow what use-cases
> > > do we expect there to be for information about the camera-privacy
> > > switch state:
> > >
> > > a) Having an app which is using (trying to use) the camera show
> > > a notification to the user that the camera is turned-off by
> > > a privacy switch .
> > >
> > > Ricardo, AFAICT this is the main use-case for chrome-os, do I have
> > > this right ?
> >
> > b) is as important as a) for us.  If you do not give instant feedback
> > to the user when they change the status of the camera they might not
> > be able to find the button later on :)
>
> How do you handle cameras that suffer from
> UVC_QUIRK_PRIVACY_DURING_STREAM ?

For those b) does not work.

>
> > > b) Showing on on-screen-display (OSD) with a camera /
> > > crossed-out-camera icon when the switch is toggled, similar to how
> > > muting speakers/mic show an OSD . Laptop vendor Windows add-on
> > > software does this and I know that some users have been asking
> > > for this.
> > >
> > > Then lets look at the question bottom-up which hardware interfaces
> > > do we have exposing this information:
> > >
> > > 1. Internal UVC camera with an input privacy GPIO resource in
> > > the ACPI fwnode for the UVC camera, with the GPIO reporting
> > > the privacy-switch state. Found on some chrome-books
>
> Ricardo, is this found only in ACPI-based (x86) chromebooks, or also in
> DT-based chromebooks ?

I am only aware of ACPI models using this feature today. But there
might be DT devices in the future that will use this feature.
AFAIK the code should support ACPI and DT.

>
> Can we assume that the UVC module will not be powered off (and therefore
> disappear from USB) when the privacy switch is toggled to disable the
> camera ?

That is true today, but I cannot be sure that some vendor becomes
creative and wire things in a weird way. We usually catch this things
early in the process and solve them, but I cannot predict the future
(yet :P)

>
> > > 2. Laptop firmware (EC/ACPI/WMI) which reports privacy-switch
> > > state, without a clear 1:1 relation between the reported state and
> > > which camera it applies to. In this case sometimes the whole UVC
> > > camera module (if it is UVC) is simply dropped of the bus when
> > > the camera is disabled through the privacy switch, removing
> > > the entire /dev/video# node for the camera. Found on many windows
> > > laptops.
> > >
> > > 3. UVC cameras which report privacy-switch status through
> > > a UVC_CT_PRIVACY_CONTROL. Found on ... ?
> >
> > Some logitech cameras and also internal ones.
> >
> > > Note this will only work while the camera is streaming and
> > > even then may require polling of the ctrl because not all
> > > cameras reliably send UVC status messages when it changes.
> > > This renders this hardware interface as not usable
>
> In general I agree, but maybe the situation is better with the UVC
> cameras that implement UVC_CT_PRIVACY_CONTROL ?
>
> Note that, in theory, and as far as I understand, it should be possible
> to get the UVC_CT_PRIVACY_CONTROL events when the camera is not
> streaming, if the device implement remote wakeup. In practice that's
> hardly ever the case, among the ~450 sets of USB descriptors I've
> collected over time, only 8 report support for remote wakeup in the
> configuration descriptor's bmAttributes field, and I'm not even sure we
> could trust those devices to implement this feature correctly.

I would bet that they simply copied the descriptor from another
project and did not test it.

>
> Ricardo, do you know if the internal UVC cameras used in chromebooks
> that implement UVC_CT_PRIVACY_CONTROL support remote wakeup to notify
> changes in the privacy control when the camera is suspended ?

Today we only rely on the gpio privacy.

Some camera vendors even emulate the control:
Instead of having a gpio and a sensor, they look at the frame and if
it is very dark, they zero it out completely and set
UVC_CT_PRIVACY_CONTROL to 1.

>
> > > Currently there are 2 ways this info is being communicated
> > > to userspace, hw-interfaces 1. + 3. are exposed as a v4l2
> > > privacy-ctrl where as hw-if 2. uses and input evdev device.
> > >
> > > The advantage of the v4l2 privacy-ctrl is that it makes it
> > > very clear which camera is controlled by the camera
> > > privacy-switch.
> > >
> > > The disadvantage is that it will not work for hw-if 2,
> > > because the ACPI / WMI drivers have no v4l2 device to report
> > > the control on. We could try to add some magic glue code,
> > > but even then with e.g. IPU6 cameras it would still be
> > > unclear which v4l2(sub)device we should put the control on
> > > and if a UVC camera is just dropped from the bus there is
> > > no /dev/video# device at all.
>
> Is there any ACPI- or WMI-provided information that could assist with
> associating a privacy GPIO with a camera ?
>
> > > Using an input device does not has this disadvantage and
> > > it has the advantage of not requiring to power-up the camera
> > > as currently happens with a v4l2 ctrl on a UVC camera.
>
> API-wise, and with the current uvcvideo implementation, I agree. We
> could of course also try to improve the uvcvideo driver to not power the
> device unless it is streaming (depending on whether or not the known
> drawbacks are considered acceptable).
>
> Devices in the 3rd category will still need to be powered up to report
> the status of the privacy control, as well as some devices in the 1st
> category (see patch 8/8 in this series that introduces
> UVC_QUIRK_PRIVACY_DURING_STREAM).
>
> > > But using an input device makes it harder to determine
> > > which camera the privacy-switch applies to.
>
> We could include the evdev in the MC graph. That will of course only be
> possible if the kernel knows about that association in the first place.
> At least the 1st category of devices would benefit from this.
>
> > > We can specify
> > > that SW_CAMERA_LENS_COVER only applies to device internal
> > > cameras, but then it is up to userspace to determine which
> > > cameras that are.
> >
> > I am working on wiring up this to userspace right now.. I will report
> > back if it cannot do it.
> >
> > > Another problem with using an input device is that it will
> > > not work for "UVC cameras which report privacy-switch status
> > > through a UVC_CT_PRIVACY_CONTROL." since those need the camera
> > > on and even then need to be polled to get a reliable reading.
> > >
> > > Taking this all into account my proposal would be to go
> > > with an input device and document that SW_CAMERA_LENS_COVER
> > > only applies to device internal cameras.
> > >
> > > This should work well for both use-cases a) and b) described
> > > above and also be easy to support for both hw interfaces
> > > 1. and 2.
> > >
> > > My proposal for hw-if 3. (UVC_CT_PRIVACY_CONTROL) would be
> > > to keep reporting this as V4L2_CID_PRIVACY. This means it
> > > will not work out of the box for userspace which expects
> > > the input device method, but giving the limitations of
> > > this hw interface I think that requiring userspace to have
> > > to explicitly support this use-case (and e.g. poll the
> > > control) is a good thing rather then a bad thing.
> > >
> > > Still before moving forward with switching the hw-if 1.
> > > case to an input device as this patch-series does I would
> > > like to hear input from others.
> > >
> > > Sakari, Laurent, any comments ?
>
> Assuming the kernel could report the association between an evdev and
> camera, we would need to report which evdev SW_CAMERA_LENS_COVER
> originates from all the way from the evdev to the consumer of the event.
> How well is that supported in standard Linux system architectures ? If
> I'm not mistaken libinput will report the originating device, but how
> far up the stack is it propagated ? And which component would we expect
> to consume those events, should the camera evdev be managed by e.g.
> libcamera ?
>
> > > > - Make the code depend on UVC_INPUT_EVDEV
> > > > - Link to v2: https://lore.kernel.org/r/20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org
> > > >
> > > > Changes in v2:
> > > > - Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
> > > > - Create uvc_gpio_cleanup and uvc_gpio_deinit
> > > > - Refactor quirk: do not disable irq
> > > > - Change define number for MEDIA_ENT_F_GPIO
> > > > - Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org
> > > >
> > > > ---
> > > > Ricardo Ribalda (8):
> > > >       media: uvcvideo: Fix crash during unbind if gpio unit is in use
> > > >       media: uvcvideo: Factor out gpio functions to its own file
> > > >       media: uvcvideo: Re-implement privacy GPIO as an input device
> > > >       Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
> > > >       media: uvcvideo: Create ancillary link for GPIO subdevice
> > > >       media: v4l2-core: Add new MEDIA_ENT_F_GPIO
> > > >       media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
> > > >       media: uvcvideo: Introduce UVC_QUIRK_PRIVACY_DURING_STREAM
> > > >
> > > >  .../userspace-api/media/mediactl/media-types.rst   |   4 +
> > > >  drivers/media/usb/uvc/Kconfig                      |   2 +-
> > > >  drivers/media/usb/uvc/Makefile                     |   3 +
> > > >  drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +-----
> > > >  drivers/media/usb/uvc/uvc_driver.c                 | 112 +---------------
> > > >  drivers/media/usb/uvc/uvc_entity.c                 |  21 ++-
> > > >  drivers/media/usb/uvc/uvc_gpio.c                   | 144 +++++++++++++++++++++
> > > >  drivers/media/usb/uvc/uvc_status.c                 |  13 +-
> > > >  drivers/media/usb/uvc/uvc_video.c                  |   4 +
> > > >  drivers/media/usb/uvc/uvcvideo.h                   |  31 +++--
> > > >  drivers/media/v4l2-core/v4l2-async.c               |   3 +-
> > > >  include/uapi/linux/media.h                         |   1 +
> > > >  12 files changed, 223 insertions(+), 155 deletions(-)
> > > > ---
> > > > base-commit: 1b3bb4d69f20be5931abc18a6dbc24ff687fa780
> > > > change-id: 20241030-uvc-subdev-89f4467a00b5
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

