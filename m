Return-Path: <linux-media+bounces-41052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED50B34A98
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 20:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3282F7A4C29
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 18:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABCD27BF95;
	Mon, 25 Aug 2025 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bqRKpXuD"
X-Original-To: linux-media@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80C19D8BC
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756147577; cv=none; b=hhVrO7kuWpCTyvEsjGKahJDgfG3zwyQdWQ2VZwpAse5tFLlNKjMlpShkFE4FNcCaYWxCi1Yv0rmkMndAoJEUSoSip76yVmypAKj4pn0aBnGWyQq8YrYV2rGlBajGUfYrjI0VAt2/p3BT3ZkVkkbzWcgIh6lTkge1HlKKpuzX6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756147577; c=relaxed/simple;
	bh=3BS/96f0ebK3Hu1zLb3MqycBcFacfOpKXhYpxp+doJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHc2mNCKvrrFUogrjXCktn1sM1Q6CLNVUypOX1BQJ6EpXqGk0jgZCyWC4VQmFdb9gKzXpn3pnPm2UGj/gIWMP6PhJlUHD4TAO7P3jg6lcLY5C1xoD+MlIP3L4e//UDVRKyLscBcoxBcgluWeAPjDAPjlOkWh7JEamnSN6HP+EIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bqRKpXuD; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 25 Aug 2025 20:45:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756147558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBiD15fwW3bdnTDyQUQJ0/8GZmmM/bu4C9xfB0fLiJ4=;
	b=bqRKpXuDYyoMapznLaA/Qzl3JZb9p7sJDq89o9eYztCe7YagaoPTDK79JPssWwDf2f3ieu
	Hx6sQSOqe7hL/EOTb1a2E/pD65j2GyyXf5G7jYGp8k6ZCSMgh0ZtwxsesmD9EatdKdITMm
	CcFKUUgU8mkUbchUzN/t22HFlyh2myY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 03/11] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <f5cqviccuubd2yh7biubvhcaab3pthlxlmopyjijjetrymglo3@yp4gd6khyhvn>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
 <20250716-ov9282-flash-strobe-v6-3-934f12aeff33@linux.dev>
 <aKv3uUXf87im8ajX@kekkonen.localdomain>
 <aKv5LyZHoO1F3pMp@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKv5LyZHoO1F3pMp@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Mon, Aug 25, 2025 at 08:48:31AM +0300, Sakari Ailus wrote:
> On Mon, Aug 25, 2025 at 08:42:19AM +0300, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > Thanks for the update (and for the ping!).
> > 
> > On Wed, Jul 16, 2025 at 11:06:53AM +0200, Richard Leitner wrote:
> > > Add the new strobe_duration control to v4l uAPI documentation.
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > > @@ -186,3 +186,8 @@ Flash Control IDs
> > >      charged before strobing. LED flashes often require a cooldown period
> > >      after strobe during which another strobe will not be possible. This
> > >      is a read-only control.
> > > +
> > > +``V4L2_CID_FLASH_DURATION (integer)``
> > > +    Duration the flash should be on when the flash LED is in flash mode
> > > +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
> > > +    if possible.
> > > 
> > 
> > I think we should add this is related to the hardware strobe.
> > 
> > How about:
> > 
> > ``V4L2_CID_FLASH_DURATION (integer)``
> > 
> >     Duration of the flash strobe from the strobe source, typically a camera
> >     sensor. Controlling the flash LED strobe length this way requires that the
> >     flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>` is set
> >     to ``V4L2_FLASH_LED_MODE_FLASH`` and :ref:`strobe source
> >     <v4l2-cid-strobe-source>` is set to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
> >     The unit should be microseconds (µs) if possible.
> 
> Also adding a reference to V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> 
> ``V4L2_CID_FLASH_DURATION (integer)``
>     Duration of the flash strobe from the strobe source, typically a camera
>     sensor. Controlling the flash LED strobe length this way requires that the
>     strobe source's :ref:`V4L2_CID_FLASH_HW_STROBE_SIGNAL
>     <v4l2-cid-flash-hw-strobe>` is enabled and flash LED driver's :ref:`flash
>     LED mode <v4l2-cid-flash-led-mode>` is set to ``V4L2_FLASH_LED_MODE_FLASH``
>     and :ref:`strobe source <v4l2-cid-strobe-source>` is set to
>     ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
>     if possible.
> 
> Similarly, the documentation for V4L2_CID_FLASH_HW_STROBE_SIGNAL should be
> amended with a reference, but the label needs to exist first. I think you
> could merge the two documentation patches to make this easier.

Thanks for the review. Extending the documentation as you suggested
defintely makes sense. Thank you also for your suggestion. That makes things
even easier.

I will send a v7 end of this week. If anything else pops up or causes
questions on this series please feel free to give feedback :)
I have my fingers crossed for v7 to be the last ;-)

Thanks again for your great feedback!

regards;rl

> 
> -- 
> Sakari Ailus

