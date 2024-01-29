Return-Path: <linux-media+bounces-4341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF01840495
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6188E1C21F26
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174015FB97;
	Mon, 29 Jan 2024 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ubH16eDY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169525C8FD
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529968; cv=none; b=ba7icHkWe6Mvt4SG/loJvEVZKlBGTI9qP3AmseSD4uDmba/oIV6pTA866+9glIsgoBAOhjDyj/fkppps80/XQ8Wib+09RgnE+sUhKZFovSNLRVQyBg9vfGK6mDe8Zogc7jZZqoQ2JK2yVe3RoXifI2Mmq3ai1BlaR+24DU6Pazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529968; c=relaxed/simple;
	bh=XgO29gWp1POTKaG6i6JhoQJaNWpT1hbaQTPibKqdtGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSupAS/rNqeOJ6+n/yV0n36WTwvHpB4NfPC6irES+DSYxj1CGbBKQWjFz0G/dnkrxwwz7RlC0qMPFcULlSu3aR20Cq8dIbG9xgOtw0zI2qJ745Z64ovkOw7zNU+mNwWWs0JUeBpkq1O5SoMYuOHw8LpDiG83odI4sOHlHK7Ebl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ubH16eDY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A981A13AC;
	Mon, 29 Jan 2024 13:04:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706529885;
	bh=XgO29gWp1POTKaG6i6JhoQJaNWpT1hbaQTPibKqdtGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubH16eDY8i5W0BKZ+bDIKdOOCMdlttvFn83pJDHIEUEKYlyKATJQ0J2UBb36vqq4R
	 pNMs5vxfSKr9FgXGiUPreZDgFq9mkRLbqJok4PJCbIs6EURKL/WEjPdb0MBtLtTFlB
	 kS4Xki+8CNRIMJ8C8MRTSX+Pc6mKaQljkGvn/Xvg=
Date: Mon, 29 Jan 2024 13:05:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: Re: Weird default vblank value in ov5693
Message-ID: <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>

Hi Hans

On Mon, Jan 29, 2024 at 11:30:33AM +0100, Hans de Goede wrote:
> Hi Dan,
>
> On 1/29/24 10:53, Dan Scally wrote:
> > Morning Hans
> >
> >
> > On 28/01/2024 20:58, Hans de Goede wrote:
> >> Hi All,
> >>
> >> While adding vblank ctrl support to the ov2680 driver I was looking
> >> at the vblank ctrl code in the ov5693 and I noticed something
> >> which I believe is weird / undesirable.
> >>
> >> When setting a new mode the ov5693 driver does not keep the current
> >> vts value (adjusting vblank to keep vts and thus the framerare and
> >> exposure unchanged).
> >>
> >> Instead it calculates a new vts value, resetting the framerate
> >> to 30 fps; or 60 fps for smaller resolutions and then sets
> >> vblank to the new (vts - new_mode->height) and adjusts
> >> the exposure control-range to fit within the new vts, potentially
> >> also changing the exposure value.
> >>
> >> This behavior of the ov5693 code means that switching resolution
> >> also changes the framerate and the exposure value which seems
> >> undesirable.
> >
> >
> > I think I did it that way because I was hitting problems when changing the framesize exceeded the current VTS and it seemed cleaner to just reset it to a known situation. Really though the only thing it would affect would be the framerate; that would have to reduce if the VTS increased but exposure could stay the same (though the maximum would change). So probably it ought to work like:
> >
> >
> > * if we change from a larger to a smaller framesize then we can just increase blanking to keep the same VTS and that should be fine
> >
> > * if we're going from a smaller to a larger framesize that fits within the currently configured VTS with minimum blanking, we can just reduce the blanking to keep the same VTS and that should be fine
> >
> > * if we're going from a smaller to a larger framesize that exceeds the currently configured VTS we drop blanking to a minimum so that the new framerate is as close to the old one as it can be
> >
> >
> > Does that sound like more reasonable behaviour? If so, shall I patch it?
>
> This sounds more or like what I had in mind (keep VTS unchanged if possible),
> so I have been looking more into this yesterday evening and
> implementing this is a bit tricky (*).
>
> Combining this with your last point of "that the new framerate is as
> close to the old one as it can be" I think I prefer a more KISS
> approach.
>
> IMHO the best thing (principle of least surprise) would be to
> on a set_fmt pad-op reset things to a default fps of say 30,
> as Jacopo's doc patches suggest. My reasons for suggesting
> this approach is:
>
> a) This is easier to implement and thus less likely to have bugs
> b) It leads to consistent behavior where as your suggested try to
> keep current vts approach leads to sometimes vts being kept, but
> other times when going from smaller to higher resolutions vts
> changing which will lead to hard to debug problems if userspace
> relies on vts being kept.
>
> For the ov5693 driver this would mean dropping __ov5693_calc_vts()
> replacing it with a DEFAULT_VTS define of:
>
> ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / 30, 2)
>
> (does vts need to be a multiple of 2? We don't enforce that
>  in the vblank control)

Alternatively, we can reset blankings to their minimum. This is
'predictable' but the end result (in example, possible higher fps)
might surprise applications. Please note the same reasoning applies
when using a vblank value that gives a known FPS as an application
running at 5fps might get 30fps after a set_fmt.

The difference between the two approaches (min-blank vs.
known-fps-blank) is that sensors provide different FPS at different
resolutions, with full resolution modes sometime being limited to 5
fps or less, making difficult to define what the "standard fps" is for
all configurations.

>
> Regards,
>
> Hans
>
>
> p.s.
>
> What about enum/get/set frame_interval vs set_mode vs
> vblank ctrl ?  Options:
>
> a) Sensor drivers MUST not implement enum/get/set frame_interval?

Ideally they shouldn't, for RAW sensors at least.

For YUV/RGB sensors instead the high-level parameters used by
frame_interval might be ok as some of those sensors might not even
allow you to control blankings explicitly.

Whenever the hardware allows that, blankings should always be
preferred over frame_interval imho.

> b) enum/get/set frame_interval only enum/get/set the default
>    frame_interval set by set_mode (e.g. fixed 30 fps).
>    Any vblank changes made after the set_mode are not reflected
>    by get_frame_interval and set_frame_interval only influences
>    the next set_mode call, not the current mode ? Or maybe
>    only allow set_frame_interval when not streaming and then
>    have it set vblank to match the interval like it would
>    have done when called before the last set_mode call ?
> c) enum/get/set frame_interval are a second way to control
>    hts (lets not go there just here for completeness sake)
>
> My own preference here would be to go with a) .

Mine as well, but as said for YUV/RGB sensors it might not even be
possible to control blankings explicitly. In this case
set_frame_interval can be used but if the driver registers the vblank
control the newly computed blanking value (in response to a
set_frame_interval) should be reflected there ?

>
>
> *) As Jacopo's doc patches mention the vblank range needs to be
> updated when changing the mode. Which means calling
> __v4l2_ctrl_modify_range() now this will clamp vblank to the new
> range, potentially changing it leading to a __v4l2_ctrl_s_ctrl()
> call under the hood.
>
> We need to do this __v4l2_ctrl_modify_range() before actually
> calling __v4l2_ctrl_s_ctrl() to set the new vblank value
> (the new value calculated to keep vts the same). Otherwise
> the new value may be out of range and we must not directly
> poke the v4l2-ctrl internals to set a new in range value before
> calling __v4l2_ctrl_modify_range(). So this lead to multiple
> control-change events being emitted to userspace. But this
> is unavoidable even with more KISS approaches.
>
> Also when vts changes we also need to ensure that the exposure
> range is corrected. Theoretically it is possible for vblank
> to stay unchanged (e.g. changed from minimum vblank to minimum
> vblank) so we cannot rely on s_ctrl to update the exposure range.
>
> Note updating the exposure range twice is not a big deal since
> __v4l2_ctrl_modify_range() checks if things actually change
> and otherwise it is a no-op.
>
>
>
>
>
>
> >
> >
> > Thanks
> >
> > Dan
> >
> >>
> >> The vblank and hblank control values changes on setting a mode
> >> is unavoidable but the framerate and exposure value changing
> >> at the same time seems undesirable.
> >>
> >> Note that this also halves the max supported exposure value
> >> when going to a lower-res mode even when userspace never
> >> touches the vblank control.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>
> >
>

