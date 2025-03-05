Return-Path: <linux-media+bounces-27553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21912A4F778
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687073AC00E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CB71E5B9E;
	Wed,  5 Mar 2025 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="StbLSnVR"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A377219CC2E
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741157397; cv=none; b=DprdouFTfesBqbOaRdBVbK8RHmw8kfgxbcG/xEUAQ5ctV/peskP3O8rhOXY+oR5fu3SB4ZoTynT9Akf80l5zVyB95InfW3VkxdKJ5HYZ3af4wkveBMsgofIleibSFAxxrQJQPEB1qAykAI3qFfiuxwMqShRBCn1bJu9g/5/mYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741157397; c=relaxed/simple;
	bh=4UV7QZVZwFPv3Fm0jyRU+cvccfeEyZxyE0mnjA1Ckd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDhn16L9kYJOdx1IX4FEzsd5OKuc9AZz8E5m3dFAqTGecUYgRsofrS0+65GIsZ8uIW+6tDOP6vxC0zYSC04S48PrhSyQamEuv7m5ErzpEVhaqH51U8+Hclx5DVKvevNZ4dfR24mCuo+dyWY1r5a36ljvtJ8HL0yy0cL7VNCWXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=StbLSnVR; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 5 Mar 2025 07:49:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741157393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3yJ3HXbtbrwSp8wZ1o1sZDbX+tC39VktPX7S71ja4Eg=;
	b=StbLSnVRJ3zF7qjkkCDFDCs0Dt014q72/lHKewofR/nN+BdhTxHeK3kf+SaLM1FnSxY027
	CrX5Mga8NaLEUN98R8LSCd9yodK7hibID2pjv8LK+sdT0Ir/rkmL0+on0uIK6Z749WedDN
	M71URIUZJezWcUq0mLScW+OjeODLf1Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add flash/strobe support for ov9282
Message-ID: <2jaan6jm5abml3pve5hdesc5pj6kzbw4qaa5xofpwphxvp37rx@hyqq5ccn3n2h>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
 <CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Mar 04, 2025 at 05:46:34PM +0000, Dave Stevenson wrote:
> Hi Richard
> 
> Thanks for the series.

Hi Dave,

thanks for your quick and detailled review!

> 
> On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
> >
> > This series adds basic flash/strobe support for ov9282 sensors using
> > their "hardware strobe output".
> >
> > Apart from en-/disabling the flash/strobe output, setting a timeout
> > (duration of activated strobe per frame) is implemented. The calculation
> > of this timeout is only interpolated from various measurements, as no
> > documentation was found.
> 
> The bigger picture question is whether using these flash controls is
> appropriate for controlling the strobe output on a sensor. That's a
> question for others (mainly Sakari and Laurent).

Thanks. So I'm looking forward to their response :-)

> V4L2_CID_FLASH_TIMEOUT feels wrong for setting the duration of the strobe pulse.
> Whilst the description in the docs [1] is a little brief, you then
> have the description of V4L2_FLASH_FAULT_TIMEOUT for
> V4L2_CID_FLASH_FAULT
> "The flash strobe was still on when the timeout set by the user ---
> V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> controllers may set this in all such conditions."
> which implies it is the hardware watchdog timeout to ensure the flash
> LEDs don't burn out, not configuring the duration of the flash pulse.
> Then again adp1653 adopts it as the flash duration.

I also thought of (and in fact did) implementing this using sensor
specific used CIDs, but then decided to go for FLASH_TIMEOUT.

If you think it's a better way to introduce either a completely new
"common control" or use another one I'm perfectly fine with that and
will try that for a v2.

> 
> Is there an expectation that V4L2_CID_FLASH_STROBE_SOURCE should also
> be implemented, even if it is fixed to
> V4L2_FLASH_STROBE_SOURCE_EXTERNAL?

I've already done this in my local tree, but was not sure if it "fits"
in this series...

So I guess I should include it in v2?

> 
> The one saving grace with this sensor is that it has a global shutter,
> so the strobe does correspond to the exposure period. With rolling
> shutter sensors, the flash duration is typically two frames to cover
> the exposure duration of all lines as the shutter rolls down.

Totally agree. Without global shutter configuring the flash duration
would not make that much sense.

Just to have mentioned it: I tested this quite heavily using an ov9281,
ran analysis on the resulting images and did lots of scope measurements
to make sure it really works as described.

regards;rl

> 
>   Dave
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> 
> > Further flash/strobe-related controls as well as a migration to v4l2-cci
> > helpers will likely be implemented in future series.
> >
> > All register addresses/values are based on the OV9281 datasheet v1.53
> > (january 2019). This series was tested using an ov9281 VisionComponents
> > camera module.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> > Richard Leitner (3):
> >       media: i2c: ov9282: add output enable register definitions
> >       media: i2c: ov9282: add led_mode v4l2 control
> >       media: i2c: ov9282: add strobe_timeout v4l2 control
> >
> >  drivers/media/i2c/ov9282.c | 89 ++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 86 insertions(+), 3 deletions(-)
> > ---
> > base-commit: f41427b3bdee7d9845b13a80c0d03882212f4b20
> > change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
> > prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
> > prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
> > prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
> > prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801
> >
> > Best regards,
> > --
> > Richard Leitner <richard.leitner@linux.dev>
> >
> >

