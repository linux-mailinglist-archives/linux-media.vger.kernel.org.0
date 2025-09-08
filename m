Return-Path: <linux-media+bounces-41997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD046B48DC3
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79400440CE3
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBCA301462;
	Mon,  8 Sep 2025 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cefdwZkr"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A792301039
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335053; cv=none; b=WyuS4lg7nDe5KWYvH6IF5+15Cy4A8v7HRjsCiyhR2xv3yNH5mAvWmBzKwi+/9oafCL1StmkedtkxykIbJfXGbAEBdkkU/T5LnmAur5d9qFAFMPLmbS0hOvxWP8NTrmwn033wu+YDo0FJ8pX7qM7xThSDTp98DGw6ku5JQfQyjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335053; c=relaxed/simple;
	bh=rr16ShcJXMlxybAJcbjY4cSD41F8eLvBBCAkzI4VNgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCH6yygdC4JB4ZFGYNfSMjr67X2058PPOC9rbG3EYGKZ1Yy3q7iACYMtDcwIbiXbNAYYnBWRGF/zSsBrJJY9caPHcV4e/JqG1d9GgF0bK1hBIrn/rQH9Z1rM9R4Ffn0N/iYmERP3LP78KDCiSdWdIkZPB/wgOTTX/JESAhPjTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cefdwZkr; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 8 Sep 2025 14:37:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757335039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzZpJBOiRSfgUsT92sm7Jv2CJf70g7bcWVTofFZmSXc=;
	b=cefdwZkrDXdCZCgOn4WL082oHpeoK+dOs/QPn80LmYYa4dGqpSgro7Lh0JUekgav4QpNV8
	YWVCtBP+5jVgpc4jOMA0OTxmCIF8RnGx0Omh8Iu3j/xmEHHJNIqGPjBkuZC56Yz2UeJfNn
	UrjcZZwn3YyS38yYAwE/ICYB0T2t/Bg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <j337fpaqahmee3qutgtkavud6rbqyn4lpsj4yaha2xmvcvfhli@z67twdhybvqp>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
 <20250907194953.GA19568@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250907194953.GA19568@pendragon.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

thanks for reviewing this!

On Sun, Sep 07, 2025 at 09:49:53PM +0200, Laurent Pinchart wrote:
> Hi Richard,
> 
> Thank you for the patch.
> 
> On Mon, Sep 01, 2025 at 05:05:09PM +0200, Richard Leitner wrote:
> > Add the new strobe duration and hardware strobe signal control to v4l
> > uAPI documentation. Additionally add labels for cross-referencing v4l
> > controls.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > @@ -57,6 +57,8 @@ Flash Control IDs
> >  ``V4L2_CID_FLASH_CLASS (class)``
> >      The FLASH class descriptor.
> >  
> > +.. _v4l2-cid-flash-led-mode:
> > +
> >  ``V4L2_CID_FLASH_LED_MODE (menu)``
> >      Defines the mode of the flash LED, the high-power white LED attached
> >      to the flash controller. Setting this control may not be possible in
> > @@ -80,6 +82,8 @@ Flash Control IDs
> >  
> >  
> >  
> > +.. _v4l2-cid-flash-strobe-source:
> > +
> >  ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
> >      Defines the source of the flash LED strobe.
> >  
> > @@ -186,3 +190,28 @@ Flash Control IDs
> >      charged before strobing. LED flashes often require a cooldown period
> >      after strobe during which another strobe will not be possible. This
> >      is a read-only control.
> > +
> > +.. _v4l2-cid-flash-duration:
> > +
> > +``V4L2_CID_FLASH_DURATION (integer)``
> > +    Duration of the flash strobe pulse generated by the strobe source,
> > +    typically a camera sensor. This method of controlling flash LED strobe
> > +    duration has three prerequisites: the strobe source's
> > +    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
> > +    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
> > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
> > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
> > +    if possible.
> 
> As mentioned in the review of 01/10, I think this needs to be clarified.
> Ideally we should add a new document in
> Documentation/userspace-api/media/v4l/ to explain the flash API, but in
> the meantime let's at lets improve the description of the duration
> control. Here's a proposal.

Understood. Thank you for your proposal!

> 
> ``V4L2_CID_FLASH_DURATION (integer)``
>     Duration of the flash strobe pulse generated by the strobe source, when
>     using external strobe. This control shall be implemented by the device
>     generating the hardware flash strobe signal, typically a camera sensor,
>     connected to a flash controller. It must not be implemented by the flash
>     controller.
> 
>     This method of controlling flash LED strobe duration has three
>     prerequisites: the strobe source's :ref:`hardware strobe signal
>     <v4l2-cid-flash-hw-strobe-signal>` must be enabled, the flash controller's
>     :ref:`flash LED mode <v4l2-cid-flash-led-mode>` must be set to
>     ``V4L2_FLASH_LED_MODE_FLASH``, and its :ref:`strobe source
>     <v4l2-cid-flash-strobe-source>` must be configured to
>     ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> 
>     The unit should be microseconds (µs) if possible.
> 
> 
> The second paragraph may be better replaced by expanding the
> documentation of V4L2_FLASH_STROBE_SOURCE_EXTERNAL, it seems a better
> place to document how external strobe works.

That's fine for me. I will adapt the V4L2_CID_FLASH_DURATION and
V4L2_FLASH_STROBE_SOURCE_EXTERNAL documentation accordingly and send in
v9.

> 
> As for the unit, is microseconds really the best option ? I would expect
> most sensors to express the strobe pulse width in unit of lines.

We had that discussion already somewhere during this series. Tbh for me
microseconds seems fine. Most (professional) flashes are configured with
s^-1, so that would also be an option, but as flash_timeout is
configured in microseconds, i chose it for flash_duration too.

Nonetheless technically it shouldn't be a problem to express it as
number of lines... Is there a reason to prefer this?

> 
> I think we also need to decide how to handle camera sensors whose flash
> strobe pulse width can't be controlled. For instance, the AR0144 can
> output a flash signal, and its width is always equal to the exposure
> time. The most straightforward solution seems to implement
> V4L2_CID_FLASH_HW_STROBE_SIGNAL but not V4L2_CID_FLASH_DURATION in the
> sensor driver. Could this cause issues in any use case ? Is there a
> better solution ? I would like this to be documented.

Sounds good to me. In this case the V4L2_CID_FLASH_DURATION could be
provided as a read-only property too. So userspace is explicitely aware
of the acutal value and doesn't have to make assumptions.

Should I add documentation on this topic to this patch?

> 
> Finally, I think we also need to standardize the flash strobe offset.

I guess I somewhere mentioned this already: I have some patches for
configuring the strobe offset of ov9282 and adding the corresponding
v4l2 control. But to keep this series simple I'm planning to send them
as soon as this one is "done".

IMHO the offset should then have the same unit as the flash_duration.

> 
> > +
> > +.. _v4l2-cid-flash-hw-strobe-signal:
> > +
> > +``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
> 
> Nitpicking a bit on the name, I would have called this
> V4L2_CID_FLASH_STROBE_OUTPUT_ENABLE (or _OE).

I'm always open to name-nitpicking ;-)

V4L2_CID_FLASH_STROBE_OE sounds great to me... It's clear and even
shorter than V4L2_CID_FLASH_HW_STROBE_SIGNAL.

> 
> > +    Enables the output of a hardware strobe signal from the strobe source,
> > +    typically a camera sensor. To control a flash LED driver connected to this
> > +    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> > +    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
> > +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
> > +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
> > +    supports it, the length of the strobe signal can be configured by
> > +    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.
> 
> The V4L2_CID_FLASH_HW_STROBE_SIGNAL documentation needs to be clarified
> in a similar way as V4L2_CID_FLASH_DURATION.

Sure. I will adapt this for v9.

> 
> -- 
> Regards,
> 
> Laurent Pinchart

thanks again for your great review!

regards;rl

