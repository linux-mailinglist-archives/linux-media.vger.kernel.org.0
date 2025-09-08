Return-Path: <linux-media+bounces-42033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1FB4949D
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 18:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53713BC6C2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B1330F7E3;
	Mon,  8 Sep 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LRt0l8x9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED330B52F;
	Mon,  8 Sep 2025 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347184; cv=none; b=FGtaQmpSX3vIwNGo2olq5eeQyne62A5E2xxLeMLSbAE6A+D1nYjB8dkFclu7XFdPqnSJGnYa0ztvdIYrWY4QiiBti6TCXzoeHQX6zFLoql2P+r/dIAARzoV2+2rdU4S0820ZA6lgCWheyfDHrb/KM5UngE9aAe66sxQGPEImlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347184; c=relaxed/simple;
	bh=r02YzPn9oCu2BPwFuSV1S3iZU5SJcTfC+MvsDQOLGVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPbho0HpEShn7QhSE3Sq0DVpfTEYhmAbPURrp1We8Ob6gDyVsow8hc+oy+yM7mBKCv4TMaFD2VL+vQtJl8KhqiJeRYGVW7A7rk8ltShXRY/nBlHaYNgu0Dt7H/w7HJaxcEP9LDiVsdQfyctpYUVdCHh6u1A3U7wgsFyuEFx7d7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LRt0l8x9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-99-126-nat.elisa-mobile.fi [85.76.99.126])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C7BA3C71;
	Mon,  8 Sep 2025 17:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757347108;
	bh=r02YzPn9oCu2BPwFuSV1S3iZU5SJcTfC+MvsDQOLGVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRt0l8x94xL3hKcQ5lRBLPjdAWE8XwRaOAID5qUXzNmdyzPH9y6fXCoNBeKXWFpVW
	 6Pt7ENRNxEiTXDlFRpoMrWJSWDAddXa4T22g1WjdAdG/VsY29QV0o79udYybeFGxSe
	 DRHZASYYq19pUEzkIlprsNjEi9PkO8QNZQLgI2lk=
Date: Mon, 8 Sep 2025 17:59:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <20250908155917.GK26062@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
 <20250907194953.GA19568@pendragon.ideasonboard.com>
 <j337fpaqahmee3qutgtkavud6rbqyn4lpsj4yaha2xmvcvfhli@z67twdhybvqp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j337fpaqahmee3qutgtkavud6rbqyn4lpsj4yaha2xmvcvfhli@z67twdhybvqp>

On Mon, Sep 08, 2025 at 02:37:15PM +0200, Richard Leitner wrote:
> On Sun, Sep 07, 2025 at 09:49:53PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 05:05:09PM +0200, Richard Leitner wrote:
> > > Add the new strobe duration and hardware strobe signal control to v4l
> > > uAPI documentation. Additionally add labels for cross-referencing v4l
> > > controls.
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > @@ -57,6 +57,8 @@ Flash Control IDs
> > >  ``V4L2_CID_FLASH_CLASS (class)``
> > >      The FLASH class descriptor.
> > >  
> > > +.. _v4l2-cid-flash-led-mode:
> > > +
> > >  ``V4L2_CID_FLASH_LED_MODE (menu)``
> > >      Defines the mode of the flash LED, the high-power white LED attached
> > >      to the flash controller. Setting this control may not be possible in
> > > @@ -80,6 +82,8 @@ Flash Control IDs
> > >  
> > >  
> > >  
> > > +.. _v4l2-cid-flash-strobe-source:
> > > +
> > >  ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
> > >      Defines the source of the flash LED strobe.
> > >  
> > > @@ -186,3 +190,28 @@ Flash Control IDs
> > >      charged before strobing. LED flashes often require a cooldown period
> > >      after strobe during which another strobe will not be possible. This
> > >      is a read-only control.
> > > +
> > > +.. _v4l2-cid-flash-duration:
> > > +
> > > +``V4L2_CID_FLASH_DURATION (integer)``
> > > +    Duration of the flash strobe pulse generated by the strobe source,
> > > +    typically a camera sensor. This method of controlling flash LED strobe
> > > +    duration has three prerequisites: the strobe source's
> > > +    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
> > > +    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
> > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
> > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
> > > +    if possible.
> > 
> > As mentioned in the review of 01/10, I think this needs to be clarified.
> > Ideally we should add a new document in
> > Documentation/userspace-api/media/v4l/ to explain the flash API, but in
> > the meantime let's at lets improve the description of the duration
> > control. Here's a proposal.
> 
> Understood. Thank you for your proposal!
> 
> > ``V4L2_CID_FLASH_DURATION (integer)``
> >     Duration of the flash strobe pulse generated by the strobe source, when
> >     using external strobe. This control shall be implemented by the device
> >     generating the hardware flash strobe signal, typically a camera sensor,
> >     connected to a flash controller. It must not be implemented by the flash
> >     controller.
> > 
> >     This method of controlling flash LED strobe duration has three
> >     prerequisites: the strobe source's :ref:`hardware strobe signal
> >     <v4l2-cid-flash-hw-strobe-signal>` must be enabled, the flash controller's
> >     :ref:`flash LED mode <v4l2-cid-flash-led-mode>` must be set to
> >     ``V4L2_FLASH_LED_MODE_FLASH``, and its :ref:`strobe source
> >     <v4l2-cid-flash-strobe-source>` must be configured to
> >     ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> > 
> >     The unit should be microseconds (µs) if possible.
> > 
> > 
> > The second paragraph may be better replaced by expanding the
> > documentation of V4L2_FLASH_STROBE_SOURCE_EXTERNAL, it seems a better
> > place to document how external strobe works.
> 
> That's fine for me. I will adapt the V4L2_CID_FLASH_DURATION and
> V4L2_FLASH_STROBE_SOURCE_EXTERNAL documentation accordingly and send in
> v9.

Sakari, could you please check if you agree with the above ? Let's avoid
going back and forth with reviews (and I'll try my best to review the
next version quickly).

> > As for the unit, is microseconds really the best option ? I would expect
> > most sensors to express the strobe pulse width in unit of lines.
> 
> We had that discussion already somewhere during this series. Tbh for me
> microseconds seems fine. Most (professional) flashes are configured with
> s^-1, so that would also be an option, but as flash_timeout is
> configured in microseconds, i chose it for flash_duration too.
> 
> Nonetheless technically it shouldn't be a problem to express it as
> number of lines... Is there a reason to prefer this?

A few observations have confirmed my gut feeling that this is how
sensors typically express the pulse width. Expressing the value in its
hardware unit means we won't have rounding issues, and drivers will also
be simpler. We're missing data though, it would be nice to check a wider
variety of camera sensors.

> > I think we also need to decide how to handle camera sensors whose flash
> > strobe pulse width can't be controlled. For instance, the AR0144 can
> > output a flash signal, and its width is always equal to the exposure
> > time. The most straightforward solution seems to implement
> > V4L2_CID_FLASH_HW_STROBE_SIGNAL but not V4L2_CID_FLASH_DURATION in the
> > sensor driver. Could this cause issues in any use case ? Is there a
> > better solution ? I would like this to be documented.
> 
> Sounds good to me. In this case the V4L2_CID_FLASH_DURATION could be
> provided as a read-only property too. So userspace is explicitely aware
> of the acutal value and doesn't have to make assumptions.

The value would change depending on the exposure time. Given how control
change events are implemented that would be difficult to use from
userspace at best. I think not exposing the control would be as useful
as exposing a read-only value, and it would be simpler to implement in
kernel drivers.

> Should I add documentation on this topic to this patch?

That would be nice, thank you.

> > Finally, I think we also need to standardize the flash strobe offset.
> 
> I guess I somewhere mentioned this already: I have some patches for
> configuring the strobe offset of ov9282 and adding the corresponding
> v4l2 control. But to keep this series simple I'm planning to send them
> as soon as this one is "done".
> 
> IMHO the offset should then have the same unit as the flash_duration.

What's the unit for the OV9282 ? For AR0144, it's a 8-bit signed value
expressed in units of half a line.

> > > +
> > > +.. _v4l2-cid-flash-hw-strobe-signal:
> > > +
> > > +``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
> > 
> > Nitpicking a bit on the name, I would have called this
> > V4L2_CID_FLASH_STROBE_OUTPUT_ENABLE (or _OE).
> 
> I'm always open to name-nitpicking ;-)
> 
> V4L2_CID_FLASH_STROBE_OE sounds great to me... It's clear and even
> shorter than V4L2_CID_FLASH_HW_STROBE_SIGNAL.

Sakari, what's your opinion ?

> > > +    Enables the output of a hardware strobe signal from the strobe source,
> > > +    typically a camera sensor. To control a flash LED driver connected to this
> > > +    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
> > > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
> > > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
> > > +    supports it, the length of the strobe signal can be configured by
> > > +    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.
> > 
> > The V4L2_CID_FLASH_HW_STROBE_SIGNAL documentation needs to be clarified
> > in a similar way as V4L2_CID_FLASH_DURATION.
> 
> Sure. I will adapt this for v9.

-- 
Regards,

Laurent Pinchart

