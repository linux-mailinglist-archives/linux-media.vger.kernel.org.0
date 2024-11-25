Return-Path: <linux-media+bounces-21988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4A9D866B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31AE5B2B755
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912601A0B07;
	Mon, 25 Nov 2024 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZiuiskIL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128621106;
	Mon, 25 Nov 2024 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732538996; cv=none; b=FbsrfVaQxrfkj3I/3p8HR8CcLTgB/Yh4q6xfsHKYMIVnjFNAkzgD10otCefhK+QbhLMZcLfO75t9wryev5v6c8z7bIfnGPdaZhzvCi7+IOIri+oCWiU3iJh1IZPRh0Uf8+laQxtleU3mzq+AuE+6BgyM6p3uEUzRaSxndNw1SEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732538996; c=relaxed/simple;
	bh=KqdUwYvXOSLApLa79kzMfq03gURscXfHaxVZKTwq25o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTUixd6qsnict/27xSh/RclZqC8a/lKAlTuh9rAJ3CtoHOSsspoLm5g43k+RUND5IuVT1eyEDTDyyAFD0/TCE4bdTwp5mcWe8W9Kyh+c+YFrWjdgvDnKaUZ3F8sxiX3Y5xV5w+VUWlmmQ6xAeREQBoJRf44m0lN4nv0QsGPNaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZiuiskIL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 285DCA2F;
	Mon, 25 Nov 2024 13:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732538970;
	bh=KqdUwYvXOSLApLa79kzMfq03gURscXfHaxVZKTwq25o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiuiskILJjtl8suAat9UQxTftS5eI7RPyYFu6n4jRWK18INeaXv3h2sG2vIzBaYOw
	 9C9TjsOEJRCTuFrsOTKRlK7VL3XtJKRjcDWNoGvK65KwAF1A3CivpqAc8GVEMRf9Ir
	 l2h6U8RrS+Fvoclm/Skvg/HtJJduDOnA4qsiRptE=
Date: Mon, 25 Nov 2024 14:49:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241125124942.GA32280@pendragon.ideasonboard.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>

On Mon, Nov 25, 2024 at 01:25:41PM +0100, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:
> 
> <snip>
> 
> >> I have been discussing UVC power-management with Laurent, also
> >> related to power-consumption issues caused by libcamera's pipeline
> >> handler holding open the /dev/video# node as long as the camera
> >> manager object exists.
> 
> <snip>
> 
> >> Here is what I have in mind for this:
> >>
> >> 1. Assume that the results of trying a specific fmt do not change over time.
> >>
> >> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
> >>    enum-frame-sizes -> enum-frame-rates tripplet results
> >>    (constrain what userspace requests to these)
> >>
> >> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
> >>    3 levels nested loop for this) on probe() and cache the results
> >>
> >> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
> >>    the requested fmt to one from our cached fmts
> >>
> >> 5. On stream-on do the actual power-on + set-fmt + verify that we get
> >>    what we expect based on the cache, and otherwise return -EIO.
> > 
> > Can we start powering up the device during try/set fmt and then
> > implement the format caching as an improvement?
> 
> Yes, actually looking at how complex this is when e.g. also taking
> controls into account I think that taking small steps is a good idea.
> 
> I have lately mostly been working on sensor drivers where delaying
> applying format settings + all controls to stream-on is normal.
> 
> So that is the mental model I'm applying to uvc here, but that might
> not be entirely applicable.
> 
> > Laurent mentioned that some cameras missbehave if a lot of controls
> > are set during probing. I hope that this approach does not trigger
> > those, and if it does it would be easier to revert if we do the work
> > in two steps.
> 
> Ack, taking small steps sounds like a good plan.
> 
> <snip>
> 
> >> This should also make camera enumeration faster for apps, since
> >> most apps / frameworks do the whole 3 levels nested loop for this
> >> on startup, for which atm we go out to the hw, which now instead
> >> will come from the fmts cache and thus will be much much faster,
> >> so this should lead to a noticeable speedup for apps accessing UVC
> >> cameras which would be another nice win.
> >>
> >> Downside is that the initial probe will take longer see we do
> >> all the tryfmt-s there now. But I think that taking a bit longer
> >> to probe while the machine is booting should not be an issue.
> > 
> > How do you pretend to handle the controls? Do you plan to power-up the
> > device during s_ctrl() or set them only during streamon()?
> > If we power-up the device during s_ctrl we need to take care of the
> > asynchronous controls (typically pan/tilt/zoom), The device must be
> > powered until the control finishes, and the device might never reply
> > control_done if the firmware is not properly implemented.

Talking about powering up is a bit misleading here. What this is about
is resuming the USB device. The device stays powered when it is
suspended, and the value of controls is retained unless the USB device
gets reset. The .resume() handler does not restore controls, the
.reset_resume() handler does.

Some UVC cameras have the USB_QUIRK_RESET_RESUME quirk set, but the
majority doesn't. Annoyingly there's a blanket entry for all Logitech
UVC devices in drivers/usb/core/quirks.c, which has led the uvcvideo
driver to grow a UVC_QUIRK_NO_RESET_RESUME quirk.

> > If we set the controls only during streamon, we will break some
> > usecases. There are some video conferencing equipment that do homing
> > during streamoff. That will be a serious API breakage.
> 
> How to handle controls is a good idea.
> 
> Based on my sensor experience my initial idea was to just cache them
> all. Basically make set_ctrl succeed but do not actually do anyhing
> when the camera is not already powered on and then on stream-on call
> __v4l2_ctrl_handler_setup() to get all current values applied.
> 
> But as you indicate that will likely not work well with async controls,

It's not all asynchronous controls, only the ones that have an impact on
the device that can be observed without streaming. Mechanical pan/tilt
is the main use case. We could handle those controls in a special way if
needed.

> although we already have this issue when using v4l2-ctl from the cmdline
> on such a control and that seems to work fine. Just because we allow
> the USB connection to sleep, does not mean that the camera cannot finish
> doing applying the async control.
> 
> But I can see how some cameras might not like this and having 2 different
> paths for different controls also is undesirable.
> 
> Combine that with what Laurent said about devices not liking it when
> you set too much controls in a short time and I do think we need to
> immediately apply ctrls.
> 
> I see 2 ways of doing that:
> 
> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
> and then on set_ctrl do a pm_runtime_get_sync() +
> pm_runtime_put_autosuspend() giving the camera 1 second to finish
> applying the async ctrl (which might not be enough for e.g homing) +
> also avoid doing suspend + resume all the time if multiple ctrls are send
> 
> 2. Instead of immediately powering on the camera on /dev/video# open
> track per fh if the camera has been powered on and then on the first
> set-ctrl, or the first other IOCTL like try/set-fmt which requires
> the camera to be powered on power it up and then keep it on until
> the fh is closed, since apps hitting these paths are likely to do
> more stuff which requires the camera to be powered on.

A mode of operation where a userspace action causes a state change and
the only way to change back to the previous state is to close the device
often leads to problems. I'd rather not do this unless we have to
completely rule out all other options.

> This should avoid apps (like udev rules) just doing a simple get-cap
> query of powering on the camera, while at the same time preserving
> the current behavior for apps which want to actually do something
> with the camera, so the chance of regressions should be small.
> 
> I guess the time between power-up and sending the first request to
> the camera will change slightly. But most apps which actually want
> to do stuff with the camera will likely already do so immediately
> after opening /dev/video# so the timing change should be negligible.
> 
> I guess 2. is pretty similar to your proposal to delay power-on
> to the first set/try-fmt, which I assume also already does
> something similar wrt controls ?
> 
> I think that 2. can work nicely and that would be nice to have,
> even though it does not fix the privacy-control + power-mgmt issue.

-- 
Regards,

Laurent Pinchart

