Return-Path: <linux-media+bounces-42695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA2B80B91
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD6416C543
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926C93362B6;
	Wed, 17 Sep 2025 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVEYuTLn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29532129F;
	Wed, 17 Sep 2025 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123837; cv=none; b=AgXQ7uPMI7YUxaHtjkwleOm5F7rbxE2byiiub1mE0lxIzBWC/qcAwZIp9CLp/9yT6f2dX8f/xDnUdYWTvNGArr8sDc3rqCXl5j2YUfjXyXe/czRGty/eQ8+qjqBoKDj1txW7+ZmZvAKDonM9XkYcmXR0jffb3hB4XIx92zxnHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123837; c=relaxed/simple;
	bh=M7bmsCJOctouLMHagcFSejZI7FxeTupipz2eFgc7ACg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok1u4A3ArdoXGAHRbUOQglaLiu6HyPBVXy46jQ8VJ+iHHBGw7DkmGuSfZ881SqAz+BoSwiE61loyJHEofbDSeAH2OOMHWQQ3Cb6YWEb7SaXZzu5CnjLIuzQp7cdgZf8BllA3hRAzsk+xvWIKsDmegmQHzAKreIxy9O+fYIZhd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVEYuTLn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758123836; x=1789659836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M7bmsCJOctouLMHagcFSejZI7FxeTupipz2eFgc7ACg=;
  b=bVEYuTLnL1WvhLCTCV+8iN6IKp4kM1LfBWsFoyyo8cXa+EAAB0KbPjEb
   WtomC+py29WQBu+ffhWZ11CoyaownZ4JqDgubM6cxmj0d167ZDXg5CxER
   LHUleDnz1rPjNn3CGDrX4+q5Ln8Y292hZNDZbDJwDamc1CEIWeURdD+jj
   AKs1mKbIjiycXaq1ZzOwvOpEWVzs8e4GLgCt4ardySYAw8+IVgUsNi18j
   mJtECa/e2+Re//hAwZIfuLmYmo9AiqygNZ+9U8Jg2KG28xgp0xFZcZONu
   r8XmJCTcef8HgNmQ5Y6ey+HjzJAPwV2VO16lFBRxNSUNZsPGoCqjLLgV7
   A==;
X-CSE-ConnectionGUID: 5VOX7tGYQl6+gZdkxjPgwA==
X-CSE-MsgGUID: VTL1abs8RWSFpbf9LBqAyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="70685734"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="70685734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 08:43:55 -0700
X-CSE-ConnectionGUID: pbI9dMX5RNucmu4Zq5EiKQ==
X-CSE-MsgGUID: sTvATFxVQ02Wzn7Nz8Emxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="206208885"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 08:43:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B105711FC22;
	Wed, 17 Sep 2025 18:43:49 +0300 (EEST)
Date: Wed, 17 Sep 2025 18:43:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <aMrXNXexGBXCxbKd@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
 <20250907194953.GA19568@pendragon.ideasonboard.com>
 <j337fpaqahmee3qutgtkavud6rbqyn4lpsj4yaha2xmvcvfhli@z67twdhybvqp>
 <20250908155917.GK26062@pendragon.ideasonboard.com>
 <mk77d6dn2qn6wrlgyu4sxpwufe7eupi4xcvx7yblo7bki4b5h6@brircux3j6ct>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mk77d6dn2qn6wrlgyu4sxpwufe7eupi4xcvx7yblo7bki4b5h6@brircux3j6ct>

Hi Richard,

On Tue, Sep 09, 2025 at 12:29:55PM +0200, Richard Leitner wrote:
> Hi Laurent,
> 
> thanks for your great (and quick) feedback!
> 
> On Mon, Sep 08, 2025 at 05:59:17PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 08, 2025 at 02:37:15PM +0200, Richard Leitner wrote:
> > > On Sun, Sep 07, 2025 at 09:49:53PM +0200, Laurent Pinchart wrote:
> > > > On Mon, Sep 01, 2025 at 05:05:09PM +0200, Richard Leitner wrote:
> > > > > Add the new strobe duration and hardware strobe signal control to v4l
> > > > > uAPI documentation. Additionally add labels for cross-referencing v4l
> > > > > controls.
> > > > > 
> > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
> > > > >  1 file changed, 29 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > > > @@ -57,6 +57,8 @@ Flash Control IDs
> > > > >  ``V4L2_CID_FLASH_CLASS (class)``
> > > > >      The FLASH class descriptor.
> > > > >  
> > > > > +.. _v4l2-cid-flash-led-mode:
> > > > > +
> > > > >  ``V4L2_CID_FLASH_LED_MODE (menu)``
> > > > >      Defines the mode of the flash LED, the high-power white LED attached
> > > > >      to the flash controller. Setting this control may not be possible in
> > > > > @@ -80,6 +82,8 @@ Flash Control IDs
> > > > >  
> > > > >  
> > > > >  
> > > > > +.. _v4l2-cid-flash-strobe-source:
> > > > > +
> > > > >  ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
> > > > >      Defines the source of the flash LED strobe.
> > > > >  
> > > > > @@ -186,3 +190,28 @@ Flash Control IDs
> > > > >      charged before strobing. LED flashes often require a cooldown period
> > > > >      after strobe during which another strobe will not be possible. This
> > > > >      is a read-only control.
> > > > > +
> > > > > +.. _v4l2-cid-flash-duration:
> > > > > +
> > > > > +``V4L2_CID_FLASH_DURATION (integer)``
> > > > > +    Duration of the flash strobe pulse generated by the strobe source,
> > > > > +    typically a camera sensor. This method of controlling flash LED strobe
> > > > > +    duration has three prerequisites: the strobe source's
> > > > > +    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
> > > > > +    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
> > > > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
> > > > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
> > > > > +    if possible.
> > > > 
> > > > As mentioned in the review of 01/10, I think this needs to be clarified.
> > > > Ideally we should add a new document in
> > > > Documentation/userspace-api/media/v4l/ to explain the flash API, but in
> > > > the meantime let's at lets improve the description of the duration
> > > > control. Here's a proposal.
> > > 
> > > Understood. Thank you for your proposal!
> > > 
> > > > ``V4L2_CID_FLASH_DURATION (integer)``
> > > >     Duration of the flash strobe pulse generated by the strobe source, when
> > > >     using external strobe. This control shall be implemented by the device
> > > >     generating the hardware flash strobe signal, typically a camera sensor,
> > > >     connected to a flash controller. It must not be implemented by the flash
> > > >     controller.
> > > > 
> > > >     This method of controlling flash LED strobe duration has three
> > > >     prerequisites: the strobe source's :ref:`hardware strobe signal
> > > >     <v4l2-cid-flash-hw-strobe-signal>` must be enabled, the flash controller's
> > > >     :ref:`flash LED mode <v4l2-cid-flash-led-mode>` must be set to
> > > >     ``V4L2_FLASH_LED_MODE_FLASH``, and its :ref:`strobe source
> > > >     <v4l2-cid-flash-strobe-source>` must be configured to
> > > >     ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> > > > 
> > > >     The unit should be microseconds (µs) if possible.
> > > > 
> > > > 
> > > > The second paragraph may be better replaced by expanding the
> > > > documentation of V4L2_FLASH_STROBE_SOURCE_EXTERNAL, it seems a better
> > > > place to document how external strobe works.
> > > 
> > > That's fine for me. I will adapt the V4L2_CID_FLASH_DURATION and
> > > V4L2_FLASH_STROBE_SOURCE_EXTERNAL documentation accordingly and send in
> > > v9.
> > 
> > Sakari, could you please check if you agree with the above ? Let's avoid
> > going back and forth with reviews (and I'll try my best to review the
> > next version quickly).
> 
> My current proposal:
> 
>     * - ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``
>       - The flash strobe is triggered by an external source. Typically
>         this is a sensor, which makes it possible to synchronise the
>         flash strobe start to exposure start.
>         This method of controlling flash LED strobe has two additional
>         prerequisites: the strobe source's :ref:`flash strobe output
>         <v4l2-cid-flash-strobe-oe>` must be enabled (if available)
>         and the flash controller's :ref:`flash LED mode
>         <v4l2-cid-flash-led-mode>` must be set to
>         ``V4L2_FLASH_LED_MODE_FLASH``. Additionally the :ref:`flash duration
> 	<v4l2-cid-flash-duration>` may be adjusted by the strobe source.
> 
> 
> ``V4L2_CID_FLASH_DURATION (integer)``
>     Duration of the flash strobe pulse generated by the strobe source, when
>     using external strobe. This control shall be implemented by the device
>     generating the hardware flash strobe signal, typically a camera sensor,
>     connected to a flash controller. It must not be implemented by the flash
>     controller. Typically the flash strobe pulse needs to be activated by

I'd drop the sentence on flash controller as this is UAPI documentation.

>     enabling the strobe source's :ref:`flash strobe output
>     <v4l2-cid-flash-strobe-oe>`.
> 
>     The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
>     must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
>     mode of operation.
> 
>     The unit should be number of lines if possible.
> 
> 
> ``V4L2_CID_FLASH_STROBE_OE (boolean)``
>     Enables the output of a hardware strobe signal from the strobe source,
>     when using external strobe. This control shall be implemented by the device

I'd remove the comma.

>     generating the hardware flash strobe signal, typically a camera sensor,
>     connected to a flash controller.
> 
>     Provided the signal generating device driver supports it, the length of the
>     strobe signal can be configured by adjusting its
>     :ref:`flash duration <v4l2-cid-flash-duration>`. In case the device has a
>     fixed strobe length, the flash duration control must not be implemented.

I don't see why the duration control wouldn't be implemented in this case:
it's still relevant for the user space to know how long the duration is.
I'd simply drop this sentence.

> 
>     The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
>     must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
>     mode of operation.
> 
> > 
> > > > As for the unit, is microseconds really the best option ? I would expect
> > > > most sensors to express the strobe pulse width in unit of lines.
> > > 
> > > We had that discussion already somewhere during this series. Tbh for me
> > > microseconds seems fine. Most (professional) flashes are configured with
> > > s^-1, so that would also be an option, but as flash_timeout is
> > > configured in microseconds, i chose it for flash_duration too.
> > > 
> > > Nonetheless technically it shouldn't be a problem to express it as
> > > number of lines... Is there a reason to prefer this?
> > 
> > A few observations have confirmed my gut feeling that this is how
> > sensors typically express the pulse width. Expressing the value in its
> > hardware unit means we won't have rounding issues, and drivers will also
> > be simpler. We're missing data though, it would be nice to check a wider
> > variety of camera sensors.
> 
> I have done some more measurements and calculation on this for ov9281.
> It seems you are (somehow?) right. The strobe_frame_span (aka strobe
> duration) register value seems to represent the duration of the strobe in
> number of lines plus a constant and variable offset based on the hblank
> value. Other settings (e.g. vblank, exposure, ...) have no influence on
> the duration.
> 
> After about 50 measurements using different strobe_frame_span and hblank
> values and 1280x800 as resolution I came up with the following formulas:
> 
>    line_factor = active_width + hblank * 1,04 + 56
> 
>    t_strobe = strobe_frame_span * line_factor / pixel_rate
> 
> Which matches all tested cased nicely...
> 
> Nonetheless I'm still unsure on what unit to use for flash duration...
> 
> The exposure time for ov9282 is set as "number of row periods, where the
> low 4 bits are fraction bits" in the registers. The v4l2 control should
> on the other hand accept 100 µs units as value.
> 
> From a user perspective it would make sense to me to configure exposure
> time, flash duration and flash/strobe offset using the same base units.
> On the other hand we may have rounding issues and formulas based on
> assumptions or reverse-engineering when implementing this for a
> sensor...
> 
> What's your opinion on this, Sakari, Laurent, Dave?

I checked what CCS defines exposure time as a function of the external
clock frequency:

	exposure time = tFlash_strobe_width_ctrl / ext_clk_freq *
			flash_strobe_adjustment

The added accuracy is relevant for xenon (admittedly rare these days, but
depends on the device) flash but probably not so for LEDs.

So I'm fine with keeping this as-is and perhaps adding CCS specific private
controls separately.

> 
> > 
> > > > I think we also need to decide how to handle camera sensors whose flash
> > > > strobe pulse width can't be controlled. For instance, the AR0144 can
> > > > output a flash signal, and its width is always equal to the exposure
> > > > time. The most straightforward solution seems to implement
> > > > V4L2_CID_FLASH_HW_STROBE_SIGNAL but not V4L2_CID_FLASH_DURATION in the
> > > > sensor driver. Could this cause issues in any use case ? Is there a
> > > > better solution ? I would like this to be documented.
> > > 
> > > Sounds good to me. In this case the V4L2_CID_FLASH_DURATION could be
> > > provided as a read-only property too. So userspace is explicitely aware
> > > of the acutal value and doesn't have to make assumptions.
> > 
> > The value would change depending on the exposure time. Given how control
> > change events are implemented that would be difficult to use from
> > userspace at best. I think not exposing the control would be as useful
> > as exposing a read-only value, and it would be simpler to implement in
> > kernel drivers.
> 
> That's true. I guess keeping the drivers simple and moving this "logic"
> to a possible client/userspace application (if needed) is fine with me.
> 
> As you may have seen above, I've tried to integrate this in the
> documentation proposal already.
> 
> > 
> > > Should I add documentation on this topic to this patch?
> > 
> > That would be nice, thank you.
> > 
> > > > Finally, I think we also need to standardize the flash strobe offset.
> > > 
> > > I guess I somewhere mentioned this already: I have some patches for
> > > configuring the strobe offset of ov9282 and adding the corresponding
> > > v4l2 control. But to keep this series simple I'm planning to send them
> > > as soon as this one is "done".
> > > 
> > > IMHO the offset should then have the same unit as the flash_duration.
> > 
> > What's the unit for the OV9282 ? For AR0144, it's a 8-bit signed value
> > expressed in units of half a line.
> > 
> > > > > +
> > > > > +.. _v4l2-cid-flash-hw-strobe-signal:
> > > > > +
> > > > > +``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
> > > > 
> > > > Nitpicking a bit on the name, I would have called this
> > > > V4L2_CID_FLASH_STROBE_OUTPUT_ENABLE (or _OE).
> > > 
> > > I'm always open to name-nitpicking ;-)
> > > 
> > > V4L2_CID_FLASH_STROBE_OE sounds great to me... It's clear and even
> > > shorter than V4L2_CID_FLASH_HW_STROBE_SIGNAL.
> > 
> > Sakari, what's your opinion ?

I slightly prefer the former, too.

> > 
> > > > > +    Enables the output of a hardware strobe signal from the strobe source,
> > > > > +    typically a camera sensor. To control a flash LED driver connected to this
> > > > > +    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
> > > > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
> > > > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
> > > > > +    supports it, the length of the strobe signal can be configured by
> > > > > +    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.
> > > > 
> > > > The V4L2_CID_FLASH_HW_STROBE_SIGNAL documentation needs to be clarified
> > > > in a similar way as V4L2_CID_FLASH_DURATION.
> > > 
> > > Sure. I will adapt this for v9.
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> thanks & regards;rl

-- 
Kind regards,

Sakari Ailus

