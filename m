Return-Path: <linux-media+bounces-22108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555399D9C47
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16ECB282B19
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F82B1DACB4;
	Tue, 26 Nov 2024 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rCHFkhE8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7D1D63FD;
	Tue, 26 Nov 2024 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641529; cv=none; b=fs1ooljml3IRr8w8IJGZA4Ll38GrGBs1synaN16PqgysfAjjJxJN/38oxNwf4dD+Gn26COmoGKSXTrzSTHitUKMylnLNmk12YxNizMv3Kn/14qcX8NurYO8RpJIt8bTtRvFvBzQtQO6AfaemqNgUgIKy/NxU8pUdNf2Fc25e3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641529; c=relaxed/simple;
	bh=A13X/r8EK4owMjansXWgMglbM7vFAFT46TCkQl2KNvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsdYHOYBeqYMSt5HB1hDxj9Vrua2Hu2ajNpBKKtBPyXtsieryyoAJd9iSJKwkbHBM8N8qEFsPXMPgteuKYSL2HiYW6k0b3O3v4a3gOka9gujieuU+CFrrdW7dJ7rlmKEn+9h+VXERMK2SGUU8Acfys9lVPQ5fDIFZ2N5N4LMQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rCHFkhE8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 843BF526;
	Tue, 26 Nov 2024 18:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732641503;
	bh=A13X/r8EK4owMjansXWgMglbM7vFAFT46TCkQl2KNvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCHFkhE8zOHxmjQkNDlSGkdkt+Hn7rxBxk+QHXVZDdUI972ES9JgFb5Oi086QeWaL
	 Z1N6jlPOajJJPt81cTtBz9pzADJ5SzuygAgfR47tChCI6qy9avIb7Q1AyyW9RZyHHl
	 jD34lFw6DUb1NZdgCx6EA92bfsCBKsSefX5PraNY=
Date: Tue, 26 Nov 2024 19:18:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241126171836.GA23391@pendragon.ideasonboard.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
 <CANiDSCtvLB=tWb7ZCFCw9gn26R2xHnOf=yTLj+M_4AuQKYvgOQ@mail.gmail.com>
 <9779fcb0-e28d-4651-b04c-ca492e30c452@redhat.com>
 <CANiDSCsY_uCRyO2NAmxob12=DSa3h+CXg_MaMWLrjMFz1_Ru-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsY_uCRyO2NAmxob12=DSa3h+CXg_MaMWLrjMFz1_Ru-g@mail.gmail.com>

On Tue, Nov 26, 2024 at 05:22:20PM +0100, Ricardo Ribalda wrote:
> On Mon, 25 Nov 2024 at 15:02, Hans de Goede wrote:
> > On 25-Nov-24 2:39 PM, Ricardo Ribalda wrote:
> > > On Mon, 25 Nov 2024 at 13:25, Hans de Goede wrote:
> > >> On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:
> > >>
> > >> <snip>
> > >>
> > >>>> I have been discussing UVC power-management with Laurent, also
> > >>>> related to power-consumption issues caused by libcamera's pipeline
> > >>>> handler holding open the /dev/video# node as long as the camera
> > >>>> manager object exists.
> > >>
> > >> <snip>
> > >>
> > >>>> Here is what I have in mind for this:
> > >>>>
> > >>>> 1. Assume that the results of trying a specific fmt do not change over time.
> > >>>>
> > >>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
> > >>>>    enum-frame-sizes -> enum-frame-rates tripplet results
> > >>>>    (constrain what userspace requests to these)
> > >>>>
> > >>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
> > >>>>    3 levels nested loop for this) on probe() and cache the results
> > >>>>
> > >>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
> > >>>>    the requested fmt to one from our cached fmts
> > >>>>
> > >>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
> > >>>>    what we expect based on the cache, and otherwise return -EIO.
> > >>>
> > >>> Can we start powering up the device during try/set fmt and then
> > >>> implement the format caching as an improvement?
> > >>
> > >> Yes, actually looking at how complex this is when e.g. also taking
> > >> controls into account I think that taking small steps is a good idea.
> > >>
> > >> I have lately mostly been working on sensor drivers where delaying
> > >> applying format settings + all controls to stream-on is normal.
> > >>
> > >> So that is the mental model I'm applying to uvc here, but that might
> > >> not be entirely applicable.
> > >>
> > >>> Laurent mentioned that some cameras missbehave if a lot of controls
> > >>> are set during probing. I hope that this approach does not trigger
> > >>> those, and if it does it would be easier to revert if we do the work
> > >>> in two steps.
> > >>
> > >> Ack, taking small steps sounds like a good plan.
> > >>
> > >> <snip>
> > >>
> > >>>> This should also make camera enumeration faster for apps, since
> > >>>> most apps / frameworks do the whole 3 levels nested loop for this
> > >>>> on startup, for which atm we go out to the hw, which now instead
> > >>>> will come from the fmts cache and thus will be much much faster,
> > >>>> so this should lead to a noticeable speedup for apps accessing UVC
> > >>>> cameras which would be another nice win.
> > >>>>
> > >>>> Downside is that the initial probe will take longer see we do
> > >>>> all the tryfmt-s there now. But I think that taking a bit longer
> > >>>> to probe while the machine is booting should not be an issue.
> > >>>
> > >>> How do you pretend to handle the controls? Do you plan to power-up the
> > >>> device during s_ctrl() or set them only during streamon()?
> > >>> If we power-up the device during s_ctrl we need to take care of the
> > >>> asynchronous controls (typically pan/tilt/zoom), The device must be
> > >>> powered until the control finishes, and the device might never reply
> > >>> control_done if the firmware is not properly implemented.
> > >>> If we set the controls only during streamon, we will break some
> > >>> usecases. There are some video conferencing equipment that do homing
> > >>> during streamoff. That will be a serious API breakage.
> > >>
> > >> How to handle controls is a good idea.
> > >>
> > >> Based on my sensor experience my initial idea was to just cache them
> > >> all. Basically make set_ctrl succeed but do not actually do anyhing
> > >> when the camera is not already powered on and then on stream-on call
> > >> __v4l2_ctrl_handler_setup() to get all current values applied.
> > >>
> > >> But as you indicate that will likely not work well with async controls,
> > >> although we already have this issue when using v4l2-ctl from the cmdline
> > >> on such a control and that seems to work fine.
> > >
> > > -----
> > >> Just because we allow
> > >> the USB connection to sleep, does not mean that the camera cannot finish
> > >> doing applying the async control.
> > >>
> > > Not sure what you mean with this sentence. Could you explain it
> > > differently? Sorry
> > >
> > >> But I can see how some cameras might not like this and having 2 different
> > >> paths for different controls also is undesirable.
> > >>
> > >> Combine that with what Laurent said about devices not liking it when
> > >> you set too much controls in a short time and I do think we need to
> > >> immediately apply ctrls.
> > >>
> > >> I see 2 ways of doing that:
> > >>
> > >> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
> > >> and then on set_ctrl do a pm_runtime_get_sync() +
> > >> pm_runtime_put_autosuspend() giving the camera 1 second to finish
> > >> applying the async ctrl (which might not be enough for e.g homing) +
> > >> also avoid doing suspend + resume all the time if multiple ctrls are send
> > >
> > > What about 1.5:
> > >
> > > during s_ctrl():
> > > usb_autopm_get_interface()
> > > if the control is UVC_CTRL_FLAG_ASYNCHRONOUS.
> > >        usb_autopm_get_interface()
> > > set the actual control in the hardware
> > > usb_autopm_put_interface()
> > >
> > > during uvc_ctrl_status_event():
> > >    usb_autopm_put_interface()
> >
> > How do we match this to the usb_autopm_get_interface()
> > call ? At a minimum we would need some counter to
> > track pending (not acked through status interrupt urb)
> > async control requests and only do the put() if that
> > counter >= 1 (and then decrease the counter).
> >
> > We don't want to do unbalanced puts here in case of
> > buggy cameras sending unexpected / too many
> > ctrl status events.

We would need a counter indeed, which is a big red flag of bad
engineering. It will be fragile at best.

> > > during close():
> > >    send all the missing usb_autopm_put_interface()
> >
> > Except for my one remark this is an interesting
> > proposal.
> 
> I have just upload a patchset implementing this. I tried
> v4l2-compliance and using the camera app.
> 
> I think it looks promissing
> 
> Shall we move the discussion there?
> 
> https://lore.kernel.org/linux-media/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org/T/#t

You're sending too many patch series too quickly, even before we can
come to an agreement on any item being discussed. Experimenting is
helpful, but if we keep moving the discussion from one series to the
next, that won't work. Let's keep it here, and focus on one problem at a
time, or the end result will be slower merging of the patches.

> > Maybe also do a dev_warn() if there are missing
> > usb_autopm_put_interface() calls pending on close() ?
> >
> > > This way:
> > > - we do not have an artificial delay that might not work for all the use cases
> > > - cameras with noncompliant async controls will have the same PM
> > > behaviour as now  (will be powered on until close() )
> > >
> > > We do the same with the rest of the actions that require hardware access, like:
> > > https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
> > >
> > > This way:
> > > - Apps that do not need to access the hardware, do not wake it up, and
> > > we do not break usecases.
> > >
> > > Next steps will be:
> > >  - cache the formats
> > >  - move the actual set_ctrl to streamon... but if we can do that I
> > > would argue than we can move completely to the control framework.
> >
> > Right I had forgotten that the UVC driver does not use the control
> > framework. I think moving to that would be a prerequisite for moving
> > the set_ctrl to stream_on.

-- 
Regards,

Laurent Pinchart

