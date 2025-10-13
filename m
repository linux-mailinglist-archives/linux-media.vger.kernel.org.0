Return-Path: <linux-media+bounces-44261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE5BD267C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CAD434A2FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6751A2FE56E;
	Mon, 13 Oct 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LHagZOwr"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F902FE057
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349475; cv=none; b=T5mZoJ2zMVwWLyPfoPj0TvSskS5Fv6/pC2cmDIBDkGCwQxtsv1+pbpIrhFoT+tMFLGiBMbhyGTmnf1GuzNsBwiHImYvaHmZBBVI+5DMJbbvQvn3xZQcyq4jivlOL+VhsGW15766HqyZeRgStHOKSAp/v7woSjqbebzvkPQ6vv/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349475; c=relaxed/simple;
	bh=GxVge5YadJIXqdPim93qf3cwj0gb4zO796LaqkTqFEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srusKOPTEmuRgFCnwof9qUqdX9ROtK6ANgoEXZVjAa6Y2oeXcrlRGAaIeOvO2JPb3/OxeyWsWZY5BF+i1N7UPBUzDxMyjG2kOrvylMs3Ct7nRqH9rZ5COUF4P2glgIsMMKf5ReXhqzRVNodL31QgayyoRa/buQ+g2qOpPLgtn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LHagZOwr; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 13 Oct 2025 11:57:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760349461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSmpMH1aE4nwqB2UyHhINNdT7+hQ04/94y1DLbpsqeM=;
	b=LHagZOwrN9xYStngQPWRMvjoGApKVXBAxGSKdhDbLPIWDEROX3GErJP0nwoCiEP1slwiDO
	fl9b02aHGlHrOU69sTzDVY0VMs1QlkYGTg0yl9lSabFbHIZA2rKgaXVbrAeyXKYVR81cft
	c1dzKe57RcWpcBom9mWi+es3YixkODQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <bhlm2hxkq5xojqokbhpk3ho6z7k37tzf7tw6zzm3223vi2wqbx@x3d5gq3yvups>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
 <20250907194953.GA19568@pendragon.ideasonboard.com>
 <j337fpaqahmee3qutgtkavud6rbqyn4lpsj4yaha2xmvcvfhli@z67twdhybvqp>
 <20250908155917.GK26062@pendragon.ideasonboard.com>
 <mk77d6dn2qn6wrlgyu4sxpwufe7eupi4xcvx7yblo7bki4b5h6@brircux3j6ct>
 <aMrXNXexGBXCxbKd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMrXNXexGBXCxbKd@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari, Hi Laurent,

On Wed, Sep 17, 2025 at 06:43:49PM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Sep 09, 2025 at 12:29:55PM +0200, Richard Leitner wrote:
> > Hi Laurent,
> > 
> > thanks for your great (and quick) feedback!
> > 
> > On Mon, Sep 08, 2025 at 05:59:17PM +0200, Laurent Pinchart wrote:
> > > On Mon, Sep 08, 2025 at 02:37:15PM +0200, Richard Leitner wrote:

[snip]

> > > 
> > > Sakari, could you please check if you agree with the above ? Let's avoid
> > > going back and forth with reviews (and I'll try my best to review the
> > > next version quickly).
> > 
> > My current proposal:
> > 
> >     * - ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``
> >       - The flash strobe is triggered by an external source. Typically
> >         this is a sensor, which makes it possible to synchronise the
> >         flash strobe start to exposure start.
> >         This method of controlling flash LED strobe has two additional
> >         prerequisites: the strobe source's :ref:`flash strobe output
> >         <v4l2-cid-flash-strobe-oe>` must be enabled (if available)
> >         and the flash controller's :ref:`flash LED mode
> >         <v4l2-cid-flash-led-mode>` must be set to
> >         ``V4L2_FLASH_LED_MODE_FLASH``. Additionally the :ref:`flash duration
> > 	<v4l2-cid-flash-duration>` may be adjusted by the strobe source.
> > 
> > 
> > ``V4L2_CID_FLASH_DURATION (integer)``
> >     Duration of the flash strobe pulse generated by the strobe source, when
> >     using external strobe. This control shall be implemented by the device
> >     generating the hardware flash strobe signal, typically a camera sensor,
> >     connected to a flash controller. It must not be implemented by the flash
> >     controller. Typically the flash strobe pulse needs to be activated by
> 
> I'd drop the sentence on flash controller as this is UAPI documentation.

That sentence was "requested" by Laurent. What's your opinion on this?
It would be great to have a wording for v8 that's fine for both of you ;-)

> 
> >     enabling the strobe source's :ref:`flash strobe output
> >     <v4l2-cid-flash-strobe-oe>`.
> > 
> >     The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
> >     must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
> >     mode of operation.
> > 
> >     The unit should be number of lines if possible.
> > 
> > 
> > ``V4L2_CID_FLASH_STROBE_OE (boolean)``
> >     Enables the output of a hardware strobe signal from the strobe source,
> >     when using external strobe. This control shall be implemented by the device
> 
> I'd remove the comma.
> 
> >     generating the hardware flash strobe signal, typically a camera sensor,
> >     connected to a flash controller.
> > 
> >     Provided the signal generating device driver supports it, the length of the
> >     strobe signal can be configured by adjusting its
> >     :ref:`flash duration <v4l2-cid-flash-duration>`. In case the device has a
> >     fixed strobe length, the flash duration control must not be implemented.
> 
> I don't see why the duration control wouldn't be implemented in this case:
> it's still relevant for the user space to know how long the duration is.
> I'd simply drop this sentence.

What's your opinion on this Laurent?

I'm currently preparing v8 and just want to make sure this aligns with
both of you?

> 
> > 
> >     The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
> >     must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
> >     mode of operation.
> > 
> > > 
> > > > > As for the unit, is microseconds really the best option ? I would expect
> > > > > most sensors to express the strobe pulse width in unit of lines.
> > > > 
> > > > We had that discussion already somewhere during this series. Tbh for me
> > > > microseconds seems fine. Most (professional) flashes are configured with
> > > > s^-1, so that would also be an option, but as flash_timeout is
> > > > configured in microseconds, i chose it for flash_duration too.
> > > > 
> > > > Nonetheless technically it shouldn't be a problem to express it as
> > > > number of lines... Is there a reason to prefer this?
> > > 
> > > A few observations have confirmed my gut feeling that this is how
> > > sensors typically express the pulse width. Expressing the value in its
> > > hardware unit means we won't have rounding issues, and drivers will also
> > > be simpler. We're missing data though, it would be nice to check a wider
> > > variety of camera sensors.
> > 
> > I have done some more measurements and calculation on this for ov9281.
> > It seems you are (somehow?) right. The strobe_frame_span (aka strobe
> > duration) register value seems to represent the duration of the strobe in
> > number of lines plus a constant and variable offset based on the hblank
> > value. Other settings (e.g. vblank, exposure, ...) have no influence on
> > the duration.
> > 
> > After about 50 measurements using different strobe_frame_span and hblank
> > values and 1280x800 as resolution I came up with the following formulas:
> > 
> >    line_factor = active_width + hblank * 1,04 + 56
> > 
> >    t_strobe = strobe_frame_span * line_factor / pixel_rate
> > 
> > Which matches all tested cased nicely...
> > 
> > Nonetheless I'm still unsure on what unit to use for flash duration...
> > 
> > The exposure time for ov9282 is set as "number of row periods, where the
> > low 4 bits are fraction bits" in the registers. The v4l2 control should
> > on the other hand accept 100 µs units as value.
> > 
> > From a user perspective it would make sense to me to configure exposure
> > time, flash duration and flash/strobe offset using the same base units.
> > On the other hand we may have rounding issues and formulas based on
> > assumptions or reverse-engineering when implementing this for a
> > sensor...
> > 
> > What's your opinion on this, Sakari, Laurent, Dave?
> 
> I checked what CCS defines exposure time as a function of the external
> clock frequency:
> 
> 	exposure time = tFlash_strobe_width_ctrl / ext_clk_freq *
> 			flash_strobe_adjustment
> 
> The added accuracy is relevant for xenon (admittedly rare these days, but
> depends on the device) flash but probably not so for LEDs.
> 
> So I'm fine with keeping this as-is and perhaps adding CCS specific private
> controls separately.

Thanks for the feedback. That's fine with me :-)

[snip]

> > > > > > +
> > > > > > +.. _v4l2-cid-flash-hw-strobe-signal:
> > > > > > +
> > > > > > +``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
> > > > > 
> > > > > Nitpicking a bit on the name, I would have called this
> > > > > V4L2_CID_FLASH_STROBE_OUTPUT_ENABLE (or _OE).
> > > > 
> > > > I'm always open to name-nitpicking ;-)
> > > > 
> > > > V4L2_CID_FLASH_STROBE_OE sounds great to me... It's clear and even
> > > > shorter than V4L2_CID_FLASH_HW_STROBE_SIGNAL.
> > > 
> > > Sakari, what's your opinion ?
> 
> I slightly prefer the former, too.

Fine. I'll go for V4L2_CID_FLASH_STROBE_OE.

[snip]

regards; rl

