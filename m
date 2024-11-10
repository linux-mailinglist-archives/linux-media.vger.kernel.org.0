Return-Path: <linux-media+bounces-21222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 601119C320B
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 13:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18BAC28138D
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E86156C6F;
	Sun, 10 Nov 2024 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWHTKrBG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB33142E7C;
	Sun, 10 Nov 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731242774; cv=none; b=ah05ZRFxcq/IqTMMQmFWB/S+SuFD4K8tPan5ptG0ExyBdkouAlNV9q+dEaqazlbXYDv3DVJXE7htdzU1bqP8d4a8ImOZs9rPmW3Ctosc4RmoIXEU6mr8ActhrNNiz29TAQH0Ea6WpWtITZZL+wI0WLcb7F0VUSDoRHOF7qSWG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731242774; c=relaxed/simple;
	bh=23ZDJFeaXS6jGuLvJ2heQGhSwoinBl6a8qsHR7bzOck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NT9ReYRikzywkbyZtIkKi10wxa5sOF/gY5yqFTxxY3euElciitDVt7XdoQiIzhnp/M24ZyNpbqnorBe/mL3XM8svrq0lAlalRYNIQ4h+exZ4dZI6/iAIv9ZdBD9xjggWcKZCcXoFjzeR+/CEFRvQYIywSPoGXTmvyKHEUCAb1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWHTKrBG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E80EC4CECD;
	Sun, 10 Nov 2024 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731242774;
	bh=23ZDJFeaXS6jGuLvJ2heQGhSwoinBl6a8qsHR7bzOck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fWHTKrBGXczC0nyl3oo20hwlbCnZH+iyIkXmMOj0L4kurplh6aQTWWIxmsz1cKS3R
	 jr6H0ulFD1Xo0dRpxSo87c1xk+oF3Y/XcN/2a3rgwkoLzdxaCF1D3QE5Q+3JraYOK7
	 girDOmImSvE6KrqyhltjluZrojbfIpkinoJANTUjPKIR0z3dDXeg32gs7IK9XorrXi
	 h5PzX6OLz4Z3RX1sqsf+DcrhcKd0J6cfh7n2fYftPZyugb2rDxbJFrT3cvZ50Llhd/
	 52qDqFPKlpC88GODcH6UI1V8ujynVOoEf7YKVIt92acevh/7N+1rEafHFre4YHhuXF
	 H07DPvXOqVXYA==
Date: Sun, 10 Nov 2024 13:46:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Yunke Cao
 <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241110134608.6e82f851@foz.lan>
In-Reply-To: <CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
	<5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
	<CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
	<20241110110257.5160a7d1@foz.lan>
	<CANiDSCvYo8=x_QAeg0_S=_H=R1EgM9xLUy4DXURcuEadYcQjQQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 10 Nov 2024 11:32:16 +0100
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> Hi Mauro
> 
> On Sun, 10 Nov 2024 at 11:03, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Sat, 9 Nov 2024 17:29:54 +0100
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >  
> > > >
> > > > I think that should sort the issue, assuming that 1. above holds true.
> > > >
> > > > One downside is that this stops UVC button presses from working when
> > > > not streaming. But userspace will typically only open the /dev/video#
> > > > node if it plans to stream anyways so there should not be much of
> > > > a difference wrt button press behavior.  
> > >
> > > I do not personally use the button, but it is currently implemented as
> > > a standard HID device.  
> >
> > IMO, controlling the privacy via evdev is the best approach then. There's
> > no need for a RW control neither at subdev or at device level. It could
> > make sense a Read only to allow apps to read, but still it shall be up to
> > the Kernel to protect the stream if the button is pressed.
> >  
> > > Making it only work during streamon() might be
> > > a bit weird.
> > > I am afraid that if there is a button we should keep the current behaviour.  
> >
> > Privacy matters only when streaming. IMO the Kernel check for it needs to
> > be done at DQBUF time and at read() calls, as one can enable/disable the
> > camera while doing videoconf calls. I do that a lot with app "soft" buttons,
> > and on devices that physically support cutting the video.
> >
> > I don't trust myself privacy soft buttons, specially when handled in userspace,
> > so what I have are webcam covers (and a small stick glued at a laptop camera
> > that has a too small sensor for a webcam cover). I only remove the cover/stick
> > when I want to participate on videoconf with video enabled with the builtin
> > camera.
> >
> > Regards  
> 
> I think we are mixing up concepts here.
> 
> On one side we have the uvc button. You can see one here
> https://www.sellpy.dk/item/2Yk1ZULbki?utm_source=google&utm_medium=cpc&utm_campaign=17610409619&gad_source=1&gclid=Cj0KCQiA0MG5BhD1ARIsAEcZtwR9-09ZtTIVNbVknrZCtCd7ezVM8YFw1yQXfs81FWhofg9eW-iBrsIaAopVEALw_wcB
> That button is not represented as a hid device. We do not know how the
> user will use this button. They could even use it to start an app when
> pressed.

Old cameras have a <snapshot> button. Maybe that's the case of the device
you're pointing, as it looks some non-uvc Logitech cameras I have myself.

> On the other side we have  the privacy gpio. The chassis has a switch
> that is connected to the camera and to the SOC. You can see one here:
> https://support.hp.com/ie-en/document/ish_3960099-3335046-16 .We link
> the camera with a gpio via the acpi table. When the user flips the
> button, the camera produces black frames and the SOC gets an IRQ. 

OK, so the hardware warrants black frames. Sounds a more secure
implementation.

> The IRQ is used to display a message like "Camera off" and the value of
> the GPIO can be checked when an app is running to tell the user:
> "Camera not available, flip the privacy button if you want to use it."

So, it is not really a privacy gpio/control. It is instead a privacy
notification control.

I would better name it to clearly indicate what it is about.

> Userspace cannot change the value of the gpio. It is read-only,
> userspace cannot override the privacy switch. The privacy gpio is
> represented with a control in /dev/videoX This patchset wants to move
> it to /dev/v4l2-subdevX

Well, if it is really a gpio pin, kernel (and eventually userspace) can force
it to pullup (or pulldown) state, forcing one of the states. If, instead is 
an output-only pin, kernel/userspace can't control it at all.

> To make things more complicated. Recently some cameras are starting to
> have their own privacy control without the need of an external gpio.
> This is also represented as a control in /dev/videoX.

IMO, both privacy notification events shall be reported the same way,
no matter if they use GPIO, an input pin or something else.

> Now that we have these 3 concepts in place:
> 
> Today a uvc camera is powered up when /dev/videoX is open(), not when
> it is streaming.

Ideally, the part of the hardware responsible for streaming shall be
powered on only while streaming. I agree with Hans de Goede: better
have this fixed before the privacy notification patches.

> This means that if we want to get an event for the
> privacy gpio we have to powerup the camera, which results in power
> consumption. This can be fixed by moving the control to a subdevice
> (technically the gpio is not part of the camera, so it makes sense).

Ok, but as you said, not all cameras implement it as a separate gpio.

> If we only powerup the camera during streamon we will break the uvc
> button, and the async controls.

Why? IMO, it shall use regmap in a way that the register settings
will be sent to the device only when the camera control hardware is
powered up. On a complex device, there are likely at least two power
up hardware: the camera control logic and the streaming logic.

Not sure if both are visible via UVC spec, though.

Thanks,
Mauro

