Return-Path: <linux-media+bounces-4358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CCD8408E4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 15:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22A41F22023
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 14:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4615B1FE;
	Mon, 29 Jan 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BVS5qHgB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E182E415
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706539567; cv=none; b=lwBtrBDppUE50hB0esw3EdJIZA5fgNBXZ8fEwxpOK4rUlstpewWiSZOfViNbVwJrPhIpVBAGNJ2SLjYmUoxZ+e5ymRlEVgj0BYsPpjKdjuu8GbRGiJUDs/SP2yit6nj+nJsLKPHMlQNWJpU1ZtAigthmqzlUsu6fwDp9uIktj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706539567; c=relaxed/simple;
	bh=bgX0pshF6l4RkE/TToAHVYnJsbMSherWu1vcQWBkWfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7kjZo1OSTPJ2UElri4j5taeTaAKKrrLATrOT+s1nzO/liXHz1WpKmoi3/53qYkhVtFj3f49eICx/nZ8fUaK04D/xDUJuvBO5mlr/r+oZxxTzQN3SwXlhdiVJIUH72wQ5HPI3cvKZLf65NrnrKxVlZ6RHmS3+4d+jK/EUemQyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BVS5qHgB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CCF313AC;
	Mon, 29 Jan 2024 15:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706539482;
	bh=bgX0pshF6l4RkE/TToAHVYnJsbMSherWu1vcQWBkWfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVS5qHgBZwLtrX1RwJqw5sy4RRK+P5V/D/FTtky2cG3gq+rRKcywo81EODKsftjXH
	 tp9wD1xvy+V2s6wnowNRDgSu9rrv7X3/JBbdq16sR+d2VLNSC03FMmjBisuXNOZXnA
	 fDvSSSUWwBIDJT7GbZKopa1iq8A+lqjsBdKw7gdk=
Date: Mon, 29 Jan 2024 15:45:56 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: Re: Weird default vblank value in ov5693
Message-ID: <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>

Hi Hans

+dave, laurent and sakari

On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
> Hi Jacopo,
>
> On 1/29/24 13:05, Jacopo Mondi wrote:
> > Hi Hans
> >
> > On Mon, Jan 29, 2024 at 11:30:33AM +0100, Hans de Goede wrote:
> >> Hi Dan,
> >>
> >> On 1/29/24 10:53, Dan Scally wrote:
> >>> Morning Hans
> >>>
> >>>
> >>> On 28/01/2024 20:58, Hans de Goede wrote:
> >>>> Hi All,
> >>>>
> >>>> While adding vblank ctrl support to the ov2680 driver I was looking
> >>>> at the vblank ctrl code in the ov5693 and I noticed something
> >>>> which I believe is weird / undesirable.
> >>>>
> >>>> When setting a new mode the ov5693 driver does not keep the current
> >>>> vts value (adjusting vblank to keep vts and thus the framerare and
> >>>> exposure unchanged).
> >>>>
> >>>> Instead it calculates a new vts value, resetting the framerate
> >>>> to 30 fps; or 60 fps for smaller resolutions and then sets
> >>>> vblank to the new (vts - new_mode->height) and adjusts
> >>>> the exposure control-range to fit within the new vts, potentially
> >>>> also changing the exposure value.
> >>>>
> >>>> This behavior of the ov5693 code means that switching resolution
> >>>> also changes the framerate and the exposure value which seems
> >>>> undesirable.
> >>>
> >>>
> >>> I think I did it that way because I was hitting problems when changing the framesize exceeded the current VTS and it seemed cleaner to just reset it to a known situation. Really though the only thing it would affect would be the framerate; that would have to reduce if the VTS increased but exposure could stay the same (though the maximum would change). So probably it ought to work like:
> >>>
> >>>
> >>> * if we change from a larger to a smaller framesize then we can just increase blanking to keep the same VTS and that should be fine
> >>>
> >>> * if we're going from a smaller to a larger framesize that fits within the currently configured VTS with minimum blanking, we can just reduce the blanking to keep the same VTS and that should be fine
> >>>
> >>> * if we're going from a smaller to a larger framesize that exceeds the currently configured VTS we drop blanking to a minimum so that the new framerate is as close to the old one as it can be
> >>>
> >>>
> >>> Does that sound like more reasonable behaviour? If so, shall I patch it?
> >>
> >> This sounds more or like what I had in mind (keep VTS unchanged if possible),
> >> so I have been looking more into this yesterday evening and
> >> implementing this is a bit tricky (*).
> >>
> >> Combining this with your last point of "that the new framerate is as
> >> close to the old one as it can be" I think I prefer a more KISS
> >> approach.
> >>
> >> IMHO the best thing (principle of least surprise) would be to
> >> on a set_fmt pad-op reset things to a default fps of say 30,
> >> as Jacopo's doc patches suggest. My reasons for suggesting
> >> this approach is:
> >>
> >> a) This is easier to implement and thus less likely to have bugs
> >> b) It leads to consistent behavior where as your suggested try to
> >> keep current vts approach leads to sometimes vts being kept, but
> >> other times when going from smaller to higher resolutions vts
> >> changing which will lead to hard to debug problems if userspace
> >> relies on vts being kept.
> >>
> >> For the ov5693 driver this would mean dropping __ov5693_calc_vts()
> >> replacing it with a DEFAULT_VTS define of:
> >>
> >> ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / 30, 2)
> >>
> >> (does vts need to be a multiple of 2? We don't enforce that
> >>  in the vblank control)
> >
> > Alternatively, we can reset blankings to their minimum. This is
> > 'predictable' but the end result (in example, possible higher fps)
> > might surprise applications. Please note the same reasoning applies
> > when using a vblank value that gives a known FPS as an application
> > running at 5fps might get 30fps after a set_fmt.
> >
> > The difference between the two approaches (min-blank vs.
> > known-fps-blank) is that sensors provide different FPS at different
> > resolutions, with full resolution modes sometime being limited to 5
> > fps or less, making difficult to define what the "standard fps" is for
> > all configurations.
>
> Good point about not all sensors being able to do 30 fps
> at their highest resolution.
>
> I'm not a fan of min-vblank as vblank default value since
> with low-height resolutions this will significantly limit
> the maximum exposure time.

True that. The same could be said for controls initialization though,
where I suspect every driver does a different thing and there's no
standard behaviour

>
> OTOH I do believe that we want a simple default for vblank which gets
> set on every set_mode call to keep things KISS.
>
> How about something like this: (based on your doc patch):
>
> """
> The vblank control default value is reset so that the sensor runs
> at 30 fps. Except when 30 fps cannot be achieved, in that case
> the vblank control default value is reset to the control's minimum.
>
> After adjusting the range, the vblank control's value must be set to its
> new default value for consistent behavior after applying a new frame size.
> """
>

Sorry but I'm not super excited about blessing 30fps as the
preferred or suggested setting in the documentation. For some use
cases 30fps might be extremely slow or extremely fast, if a sensor or
a mode cannot achieve this we then suggest the minimum... not sure
what's best. What's others opinion here ?

Maybe we're getting too concerned on this, as if an application sets a
new mode, it's likely setting new blankings and exposure as well..

> >> What about enum/get/set frame_interval vs set_mode vs
> >> vblank ctrl ?  Options:
> >>
> >> a) Sensor drivers MUST not implement enum/get/set frame_interval?
> >
> > Ideally they shouldn't, for RAW sensors at least.
> >
> > For YUV/RGB sensors instead the high-level parameters used by
> > frame_interval might be ok as some of those sensors might not even
> > allow you to control blankings explicitly.
> >
> > Whenever the hardware allows that, blankings should always be
> > preferred over frame_interval imho.
> >
> >> b) enum/get/set frame_interval only enum/get/set the default
> >>    frame_interval set by set_mode (e.g. fixed 30 fps).
> >>    Any vblank changes made after the set_mode are not reflected
> >>    by get_frame_interval and set_frame_interval only influences
> >>    the next set_mode call, not the current mode ? Or maybe
> >>    only allow set_frame_interval when not streaming and then
> >>    have it set vblank to match the interval like it would
> >>    have done when called before the last set_mode call ?
> >> c) enum/get/set frame_interval are a second way to control
> >>    hts (lets not go there just here for completeness sake)
> >>
> >> My own preference here would be to go with a) .
> >
> > Mine as well, but as said for YUV/RGB sensors it might not even be
> > possible to control blankings explicitly. In this case
> > set_frame_interval can be used but if the driver registers the vblank
> > control the newly computed blanking value (in response to a
> > set_frame_interval) should be reflected there ?
>
> IMHO if the driver registers the vblank control then it *must not*
> implement enum/get/set frame_interval . Trying to support both at
> the same time is just going to cause pain.

Well, a RO vblank wouldn't hurt :)

>
> Assuming a driver implementing vblank also implements hblank
> and pixelrate controls (we can make that mandatory I guess?)
> then there is no need for enum/get/set frame_interval, since
> userspace can then fully query / control the framerate
> through those controls + the frame size.
>

This I agree with!

> Regards,
>
> Hans
>
>

