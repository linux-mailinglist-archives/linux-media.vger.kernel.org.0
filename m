Return-Path: <linux-media+bounces-42709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B76B83796
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 10:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F00157B9174
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 08:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412DB2F39C1;
	Thu, 18 Sep 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DJm2/iAA"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D402F362D
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182858; cv=none; b=nevni3Mb3Zoyx2kbEd/qtZJWcK/5vFmNVkmXbXFdi8++bHOZoF/PoSkozfdmR1w7nL7uLMmZHl7LWyOxXJTZTFuLfaznHTEPkIYxiHNPCaECwJRSUNitHpOGqXaBpT+JgOJFfILrUgqA7zATL0KACYuO/Idbq3PYqEN4jdP/Vq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182858; c=relaxed/simple;
	bh=ZvVpHdTNTV/0K+H0W+enDpYpx6lx17ifuLy+Q8llxv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NotYdJDUX8zwCuRsI+RS1L6TJwxicgOhvc2Yei7gWERtOJQJ6IxKTWN3idC7wsOTCZyI3/ktWJlRAuUzuPhhrlL9tcSEidCv9PadUXWvzg4hKyh5dOd12nPzPm6lbDDEPUmwtF8deW0ec0xQYc7Bp0LUG43hgxakkGUrXO7f5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DJm2/iAA; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 18 Sep 2025 10:07:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758182843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUP/NkK0GHWfDSKZIN7VTqRLLitY3IGCdy2T4BgeoiA=;
	b=DJm2/iAABEWV42oe58UHqXKT5511BKAwR/q799tzENa8Pdgrj40jlT6EhUdBdp9EDCwoaX
	XhjBhtk4gr8ErR566gBLkzsoaz6J3kE4oc6UVfUIfPe+N8de3q6HOYhJdkIlHUoneHmYcs
	T04/NAg1i+bVlyn6U19WDqXRZ9lHHws=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <ir2ye4y7bw3ot7nvp3wop2x5sf2etkuybtedrbfborqy2yuzmd@xjtow2puclbb>
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

Hi Sakari,
thanks for your feedback!

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
> > > > On Sun, Sep 07, 2025 at 09:49:53PM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Sep 01, 2025 at 05:05:09PM +0200, Richard Leitner wrote:
> > > > > > Add the new strobe duration and hardware strobe signal control to v4l
> > > > > > uAPI documentation. Additionally add labels for cross-referencing v4l
> > > > > > controls.
> > > > > > 
> > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > ---
> > > > > >  .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
> > > > > >  1 file changed, 29 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > > index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
> > > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > > @@ -57,6 +57,8 @@ Flash Control IDs
> > > > > >  ``V4L2_CID_FLASH_CLASS (class)``
> > > > > >      The FLASH class descriptor.
> > > > > >  
> > > > > > +.. _v4l2-cid-flash-led-mode:
> > > > > > +
> > > > > >  ``V4L2_CID_FLASH_LED_MODE (menu)``
> > > > > >      Defines the mode of the flash LED, the high-power white LED attached
> > > > > >      to the flash controller. Setting this control may not be possible in
> > > > > > @@ -80,6 +82,8 @@ Flash Control IDs
> > > > > >  
> > > > > >  
> > > > > >  
> > > > > > +.. _v4l2-cid-flash-strobe-source:
> > > > > > +
> > > > > >  ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
> > > > > >      Defines the source of the flash LED strobe.
> > > > > >  
> > > > > > @@ -186,3 +190,28 @@ Flash Control IDs
> > > > > >      charged before strobing. LED flashes often require a cooldown period
> > > > > >      after strobe during which another strobe will not be possible. This
> > > > > >      is a read-only control.
> > > > > > +
> > > > > > +.. _v4l2-cid-flash-duration:
> > > > > > +
> > > > > > +``V4L2_CID_FLASH_DURATION (integer)``
> > > > > > +    Duration of the flash strobe pulse generated by the strobe source,
> > > > > > +    typically a camera sensor. This method of controlling flash LED strobe
> > > > > > +    duration has three prerequisites: the strobe source's
> > > > > > +    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
> > > > > > +    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > > > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
> > > > > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
> > > > > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
> > > > > > +    if possible.
> > > > > 
> > > > > As mentioned in the review of 01/10, I think this needs to be clarified.
> > > > > Ideally we should add a new document in
> > > > > Documentation/userspace-api/media/v4l/ to explain the flash API, but in
> > > > > the meantime let's at lets improve the description of the duration
> > > > > control. Here's a proposal.
> > > > 
> > > > Understood. Thank you for your proposal!
> > > > 
> > > > > ``V4L2_CID_FLASH_DURATION (integer)``
> > > > >     Duration of the flash strobe pulse generated by the strobe source, when
> > > > >     using external strobe. This control shall be implemented by the device
> > > > >     generating the hardware flash strobe signal, typically a camera sensor,
> > > > >     connected to a flash controller. It must not be implemented by the flash
> > > > >     controller.
> > > > > 
> > > > >     This method of controlling flash LED strobe duration has three
> > > > >     prerequisites: the strobe source's :ref:`hardware strobe signal
> > > > >     <v4l2-cid-flash-hw-strobe-signal>` must be enabled, the flash controller's
> > > > >     :ref:`flash LED mode <v4l2-cid-flash-led-mode>` must be set to
> > > > >     ``V4L2_FLASH_LED_MODE_FLASH``, and its :ref:`strobe source
> > > > >     <v4l2-cid-flash-strobe-source>` must be configured to
> > > > >     ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> > > > > 
> > > > >     The unit should be microseconds (µs) if possible.
> > > > > 
> > > > > 
> > > > > The second paragraph may be better replaced by expanding the
> > > > > documentation of V4L2_FLASH_STROBE_SOURCE_EXTERNAL, it seems a better
> > > > > place to document how external strobe works.
> > > > 
> > > > That's fine for me. I will adapt the V4L2_CID_FLASH_DURATION and
> > > > V4L2_FLASH_STROBE_SOURCE_EXTERNAL documentation accordingly and send in
> > > > v9.
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

Is there any other place where this can/should be documented. As this
was suggested by Laurent: What's your opinion on this?

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

Laurent and I were discussing this a few mails ago in this thread.

He suggested to do not expose the control on fixed strobe length to keep
the drivers simpler as this information is/should be available somewhere
else. I.e. defined by the hardware.

I suggested to add a read-only flash duration control for fixed strobe
length devices. This makes drivers more complicated and may add some
rounding issues when the control is given in (micro) seconds.

As mentioned previously: I have no strong opinion on this. So how to
proceed here?

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

As mentioned previously I prefer (micro)seconds too for this control.
Yes, it results in more complicated drivers, but makes live for
userspace much easier IMHO.

> 
> > 
> > > 
> > > > > I think we also need to decide how to handle camera sensors whose flash
> > > > > strobe pulse width can't be controlled. For instance, the AR0144 can
> > > > > output a flash signal, and its width is always equal to the exposure
> > > > > time. The most straightforward solution seems to implement
> > > > > V4L2_CID_FLASH_HW_STROBE_SIGNAL but not V4L2_CID_FLASH_DURATION in the
> > > > > sensor driver. Could this cause issues in any use case ? Is there a
> > > > > better solution ? I would like this to be documented.
> > > > 
> > > > Sounds good to me. In this case the V4L2_CID_FLASH_DURATION could be
> > > > provided as a read-only property too. So userspace is explicitely aware
> > > > of the acutal value and doesn't have to make assumptions.
> > > 
> > > The value would change depending on the exposure time. Given how control
> > > change events are implemented that would be difficult to use from
> > > userspace at best. I think not exposing the control would be as useful
> > > as exposing a read-only value, and it would be simpler to implement in
> > > kernel drivers.
> > 
> > That's true. I guess keeping the drivers simple and moving this "logic"
> > to a possible client/userspace application (if needed) is fine with me.
> > 
> > As you may have seen above, I've tried to integrate this in the
> > documentation proposal already.
> > 
> > > 
> > > > Should I add documentation on this topic to this patch?
> > > 
> > > That would be nice, thank you.
> > > 
> > > > > Finally, I think we also need to standardize the flash strobe offset.
> > > > 
> > > > I guess I somewhere mentioned this already: I have some patches for
> > > > configuring the strobe offset of ov9282 and adding the corresponding
> > > > v4l2 control. But to keep this series simple I'm planning to send them
> > > > as soon as this one is "done".
> > > > 
> > > > IMHO the offset should then have the same unit as the flash_duration.
> > > 
> > > What's the unit for the OV9282 ? For AR0144, it's a 8-bit signed value
> > > expressed in units of half a line.
> > > 
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

Thanks. Fine with me!
So I'll change the name to V4L2_CID_FLASH_STROBE_OE in the next version.

> 
> > > 
> > > > > > +    Enables the output of a hardware strobe signal from the strobe source,
> > > > > > +    typically a camera sensor. To control a flash LED driver connected to this
> > > > > > +    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > > > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
> > > > > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
> > > > > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
> > > > > > +    supports it, the length of the strobe signal can be configured by
> > > > > > +    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.
> > > > > 
> > > > > The V4L2_CID_FLASH_HW_STROBE_SIGNAL documentation needs to be clarified
> > > > > in a similar way as V4L2_CID_FLASH_DURATION.
> > > > 
> > > > Sure. I will adapt this for v9.
> > > 
> > > -- 
> > > Regards,
> > > 
> > > Laurent Pinchart
> > 
> > thanks & regards;rl
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

regards;rl

