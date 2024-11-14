Return-Path: <linux-media+bounces-21432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7FA9C9255
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD471F22AFC
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD9A19D8BE;
	Thu, 14 Nov 2024 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gyhQPkjb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83E173336
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612105; cv=none; b=io60PyQgKFsmiKd6mnhiOXx2RuHR5mQ7K/V925xtKCaVP8bLSXKEu35z07fSxJM+Gl7ibO5sjo3sAHwbpFT7Is3LRWq3x4IIgp6xxRF8D0RkV44RKQg6L0vpHYcQ5ln5ZXFzWR5uJ4YgXRDHD3rYrMo0iiezT/EgNqQMyJzZSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612105; c=relaxed/simple;
	bh=Kz2CoKac5RIK5zqQkcVxg/OrSDhQq5pmW8hKofWMCyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/BaW5Romcn18yYu0aPa68WBJw0qz3tH7pt4krF74UXjZA+1oUDQHanP7c0UHQi8i4T6lB/LM2fTgtQ3gQIpMb5RGegCdGWlIH0FbBIj65xoNHAlELHWEDKrZ3qs4aHkdTTT43RXFj/4tcRUxDop2PedyLCtyHCN0JMDZ+nofoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gyhQPkjb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72475e29578so81449b3a.3
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731612103; x=1732216903; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odn4ivrjcs80WB1pz4wOMV3nOHpG1wZPYgFFp65VWS4=;
        b=gyhQPkjbvQwsxpWFjmvI0waCalw8v+F0AIOn8RfycB6Pi7HVsN8xmjAmqAhYdcH47a
         tXnF6b/368uDm0sNqqYOlOViWW8yy7K59w/eAYGl8kw/xLCbBhJTqC1f13JdLbGBJiPz
         O8JECmu7lWryiKEmuPExPXpsqsr3k4Vxfjkmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612103; x=1732216903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odn4ivrjcs80WB1pz4wOMV3nOHpG1wZPYgFFp65VWS4=;
        b=gdAVTNluuLwKC4HcjSAz2hPLnBcRH+gRWVnUn+udR4MXTbr/gydnsXOoXNh6u/L8Hu
         11xfEQOpg9JUEv1bRibhc+FwdMWOVLsQfE6DcGomL3totf1RN5SaG913sGggtegjRe9x
         vFWGsJ7lQbUADWdV7Xt8pt68CYZszi+89Y9sDCGYbevaHcvBjTEQxKAHcuwVhsvWzBgY
         F6GLebQpalco3YBT3RXno2Sswe/II0MxQS3WMajkUUcUmu3k7r4xUiijTn8lrrye9FOt
         408Eey3ZJHnaASObdbEqNcxojS8FfYRhhPZUY3ioUBbut0Gs5xAmiO5/lXr7RHNMzr0N
         DCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCURmg7gvXpTIdFu1eZ5AeFtNXE7r9Ip0sQL7NjzDbGrPTO/f371eOUZJZAS6orvBYcxSM55YCs1JU5k8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDATEDqby2z3mU8VuBvw61wxgyYkMv2mjXU0uS13WgPclllHn
	VKrFtuwrAujLfkVW6mAnwsGfHypsJNLJMgBGkneofZtdKZ726ov8ht+XCZVc10RQTRqAZdmANP0
	=
X-Google-Smtp-Source: AGHT+IE970GoC9/HjIYSO9hJn2N80tyGZwyono0bM0i1JwvvI+A0JbLZLtbskx5gNK3mWo9t1wJ9nA==
X-Received: by 2002:a17:90a:fc4e:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2ea1559c7e1mr41111a91.37.1731612103044;
        Thu, 14 Nov 2024 11:21:43 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06fbc909sm1548674a91.53.2024.11.14.11.21.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:21:40 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7240fa50694so829605b3a.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:21:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBsPx60Y7Wo7BzOobTe5fGpgTNczYH5esqgh1wnhCLkSUh/L4HnGiZRQKmv1Rq5Ws+P06uKSuw+uYV0Q==@vger.kernel.org
X-Received: by 2002:a05:6a00:22c8:b0:71e:4930:162c with SMTP id
 d2e1a72fcca58-72476b872c4mr39834b3a.6.1731612099659; Thu, 14 Nov 2024
 11:21:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org> <bd68178f-1de9-491f-8209-f67065d29283@redhat.com>
In-Reply-To: <bd68178f-1de9-491f-8209-f67065d29283@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 20:21:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
Message-ID: <CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a evdev
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Thanks for the great summary.

On Wed, 13 Nov 2024 at 18:57, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> > Some notebooks have a button to disable the camera (not to be mistaken
> > with the mechanical cover). This is a standard GPIO linked to the
> > camera via the ACPI table.
> >
> > 4 years ago we added support for this button in UVC via the Privacy control.
> > This has three issues:
> > - If the camera has its own privacy control, it will be masked.
> > - We need to power-up the camera to read the privacy control gpio.
> > - Other drivers have not followed this approach and have used evdev.
> >
> > We tried to fix the power-up issues implementing "granular power
> > saving" but it has been more complicated than anticipated...
> >
> > This patchset implements the Privacy GPIO as a evdev.
> >
> > The first patch of this set is already in Laurent's tree... but I
> > include it to get some CI coverage.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v3:
> > - CodeStyle (Thanks Sakari)
> > - Re-implement as input device
>
> Thank you for your enthusiasm for my suggestion to implement this
> as an input device.

I wanted to give it a try... and it turned out to be quite simple to
implement. I thought it could be a good idea to share it, so we can
have something tangible to talk about ;).

>
> As I mentioned in my reply in the v2 thread, the goal of my
> enumeration of various way camera privacy-controls are exposed to
> userspace today is to try and get everyone to agree on a single
> userspace API for this.
>
> Except for this v3 patch-set, which I take as an implied vote
> from you (Ricardo) for the evdev SW_CAMERA_LENS_COVER approach,
> we have not heard anything on this subject from Sakari or Laurent
> yet. So for now I would like to first focus on / circle back to
> the userspace API discussion and then once we have a plan for
> the userspace API we can implement that for uvcvideo.
>
> First lets look at the API question top down, iow what use-cases
> do we expect there to be for information about the camera-privacy
> switch state:
>
> a) Having an app which is using (trying to use) the camera show
> a notification to the user that the camera is turned-off by
> a privacy switch .
>
> Ricardo, AFAICT this is the main use-case for chrome-os, do I have
> this right ?

b) is as important as a) for us.  If you do not give instant feedback
to the user when they change the status of the camera they might not
be able to find the button later on :)


>
> b) Showing on on-screen-display (OSD) with a camera /
> crossed-out-camera icon when the switch is toggled, similar to how
> muting speakers/mic show an OSD . Laptop vendor Windows add-on
> software does this and I know that some users have been asking
> for this.
>
> Then lets look at the question bottom-up which hardware interfaces
> do we have exposing this information:
>
> 1. Internal UVC camera with an input privacy GPIO resource in
> the ACPI fwnode for the UVC camera, with the GPIO reporting
> the privacy-switch state. Found on some chrome-books
>
> 2. Laptop firmware (EC/ACPI/WMI) which reports privacy-switch
> state, without a clear 1:1 relation between the reported state and
> which camera it applies to. In this case sometimes the whole UVC
> camera module (if it is UVC) is simply dropped of the bus when
> the camera is disabled through the privacy switch, removing
> the entire /dev/video# node for the camera. Found on many windows
> laptops.
>
> 3. UVC cameras which report privacy-switch status through
> a UVC_CT_PRIVACY_CONTROL. Found on ... ?
Some logitech cameras and also internal ones.

>
> Note this will only work while the camera is streaming and
> even then may require polling of the ctrl because not all
> cameras reliably send UVC status messages when it changes.
> This renders this hardware interface as not usable
>
>
> Currently there are 2 ways this info is being communicated
> to userspace, hw-interfaces 1. + 3. are exposed as a v4l2
> privacy-ctrl where as hw-if 2. uses and input evdev device.
>
> The advantage of the v4l2 privacy-ctrl is that it makes it
> very clear which camera is controlled by the camera
> privacy-switch.
>
> The disadvantage is that it will not work for hw-if 2,
> because the ACPI / WMI drivers have no v4l2 device to report
> the control on. We could try to add some magic glue code,
> but even then with e.g. IPU6 cameras it would still be
> unclear which v4l2(sub)device we should put the control on
> and if a UVC camera is just dropped from the bus there is
> no /dev/video# device at all.
>
> Using an input device does not has this disadvantage and
> it has the advantage of not requiring to power-up the camera
> as currently happens with a v4l2 ctrl on a UVC camera.
>
> But using an input device makes it harder to determine
> which camera the privacy-switch applies to. We can specify
> that SW_CAMERA_LENS_COVER only applies to device internal
> cameras, but then it is up to userspace to determine which
> cameras that are.

I am working on wiring up this to userspace right now.. I will report
back if it cannot do it.

>
> Another problem with using an input device is that it will
> not work for "UVC cameras which report privacy-switch status
> through a UVC_CT_PRIVACY_CONTROL." since those need the camera
> on and even then need to be polled to get a reliable reading.
>
> Taking this all into account my proposal would be to go
> with an input device and document that SW_CAMERA_LENS_COVER
> only applies to device internal cameras.
>
> This should work well for both use-cases a) and b) described
> above and also be easy to support for both hw interfaces
> 1. and 2.
>
> My proposal for hw-if 3. (UVC_CT_PRIVACY_CONTROL) would be
> to keep reporting this as V4L2_CID_PRIVACY. This means it
> will not work out of the box for userspace which expects
> the input device method, but giving the limitations of
> this hw interface I think that requiring userspace to have
> to explicitly support this use-case (and e.g. poll the
> control) is a good thing rather then a bad thing.
>
> Still before moving forward with switching the hw-if 1.
> case to an input device as this patch-series does I would
> like to hear input from others.
>
> Sakari, Laurent, any comments ?
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> > - Make the code depend on UVC_INPUT_EVDEV
> > - Link to v2: https://lore.kernel.org/r/20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org
> >
> > Changes in v2:
> > - Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
> > - Create uvc_gpio_cleanup and uvc_gpio_deinit
> > - Refactor quirk: do not disable irq
> > - Change define number for MEDIA_ENT_F_GPIO
> > - Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org
> >
> > ---
> > Ricardo Ribalda (8):
> >       media: uvcvideo: Fix crash during unbind if gpio unit is in use
> >       media: uvcvideo: Factor out gpio functions to its own file
> >       media: uvcvideo: Re-implement privacy GPIO as an input device
> >       Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
> >       media: uvcvideo: Create ancillary link for GPIO subdevice
> >       media: v4l2-core: Add new MEDIA_ENT_F_GPIO
> >       media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
> >       media: uvcvideo: Introduce UVC_QUIRK_PRIVACY_DURING_STREAM
> >
> >  .../userspace-api/media/mediactl/media-types.rst   |   4 +
> >  drivers/media/usb/uvc/Kconfig                      |   2 +-
> >  drivers/media/usb/uvc/Makefile                     |   3 +
> >  drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +-----
> >  drivers/media/usb/uvc/uvc_driver.c                 | 112 +---------------
> >  drivers/media/usb/uvc/uvc_entity.c                 |  21 ++-
> >  drivers/media/usb/uvc/uvc_gpio.c                   | 144 +++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_status.c                 |  13 +-
> >  drivers/media/usb/uvc/uvc_video.c                  |   4 +
> >  drivers/media/usb/uvc/uvcvideo.h                   |  31 +++--
> >  drivers/media/v4l2-core/v4l2-async.c               |   3 +-
> >  include/uapi/linux/media.h                         |   1 +
> >  12 files changed, 223 insertions(+), 155 deletions(-)
> > ---
> > base-commit: 1b3bb4d69f20be5931abc18a6dbc24ff687fa780
> > change-id: 20241030-uvc-subdev-89f4467a00b5
> >
> > Best regards,
>


-- 
Ricardo Ribalda

