Return-Path: <linux-media+bounces-37456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2EB014E3
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4630D5A2A79
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E499D1F1317;
	Fri, 11 Jul 2025 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FGwVpbb/"
X-Original-To: linux-media@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16C1EEA54
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219729; cv=none; b=jbH/9CjlDWf+4R8FmAmMkYK3oGrwcfKMz3NW4XqoVx44oXYIkgUTkwcC6YdQByDHlBWcGysjtYWUkXJJij/jwbseI1U/YUiQLUCHFjmbhbC6QnfCZL2r/Wu2E5nW9VaYL6Z2GGWGs0nqTuNuqnmzae+8u5kY+wMQsLSLgupYqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219729; c=relaxed/simple;
	bh=B65gWMEDoko6xs6AHRgCBqX8jKOHRUVsrNSJZMdvhis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4n0jlUj2IMOGONxZ21C5/MFhnr97ZHuMYwWiDas5MOzn74CBKG96kFHYS9yl2PSkai93A3zUVlIayRKXwKmgoDkNaVmpXlMAWl/uBpGrwg/piCDaI7rCpd38qtrT/tupPw0f7TewGDSBkx40U5g46Gu414wX4IB/B+TY/iPfy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FGwVpbb/; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 11 Jul 2025 09:41:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752219715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bZ4nn5kbyuhFIk3EiFPmGSoXK58NwcAuCIASlGmYr+Y=;
	b=FGwVpbb/oYHgrEIV77E9ooFzBTIVQpU0TYIqs6AS0W8TpM46h1F0JbZ8T0JfTkeJWiGSmW
	z6xuo9JeNTHnaqfEDQZgfbyFAYeVnvm3K5oF89GFlWNJEzW96cC+QQFpyHtzUlQr3L1I9i
	fMsgmURb5gwP/BDUluCMC20ItTLw/mA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <f4owcdddwjar6lg5f2urpaynykks4yrttto7h7qfnodmqg22ll@xl45pbhuyhmx>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
 <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
 <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>
 <aG92TxxIRdRES5cs@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG92TxxIRdRES5cs@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Thu, Jul 10, 2025 at 08:14:07AM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Thu, Jul 10, 2025 at 08:50:24AM +0200, Richard Leitner wrote:
> > Hi Sakari,
> > 
> > thanks for the feedback :)
> > 
> > On Wed, Jul 09, 2025 at 09:12:57PM +0000, Sakari Ailus wrote:
> > > Hi Richard,
> > > 
> > > Thanks for the update.
> > > 
> > > On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> > > > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > > > feature of the sensor. This implements following modes:
> > > > 
> > > >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> > > >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> > > 
> > > I really think you should use a different control for this. The sensor can
> > > strobe the flash but it won't control its mode.
> > > 
> > > How about calling it V4L2_FLASH_STROBE_ENABLE?
> > 
> > I agree on that. But tbh V4L2_FLASH_STROBE_ENABLE somehow sounds wrong
> > to me. As the strobe output in the ov9282 case goes high for the strobe
> > duration, what do you think about calling it V4L2_FLASH_STROBE_PULSE?
> 
> That's how the hardware strobe is supposed to work, there's nothing unusual
> in that. How about V4L2_FLASH_HW_STROBE_ENABLE?

Ah. Sorry. I believe I completely misunderstood your previous point.
You're not referring to a new menu entry in V4L2_CID_FLASH_LED_MODE,
but rather proposing a completely new boolean control, correct?

As this would be separating the V4L2_CID's of "strobe signal source"
(aka sensor) and "strobe signal consumer" (aka flash device/LEDs), that
makes perfect sense to me now! :)

What are your thoughts on naming it V4L2_FLASH_HW_STROBE_SIGNAL?

The main reason behind removing the "ENABLE" suffix is that none of
the V4L2_CID_FLASH_* controls currently include "ENABLE" in their
names. Altough, for example, V4L2_CID_FLASH_CHARGE performs a
similar function (en-/disabling the charging of the capacitor).

On the other hand, adding "SIGNAL" to the control name, in my opinion,
makes it clearer that it only enables a signal and not some kind of
flash device or LED.

> 
> > Or should it be V4L2_FLASH_LED_MODE_STROBE_PULSE?
> > 
> > Regarding disabling the strobe output: Is sticking with V4L2_FLASH_LED_MODE_NONE
> > fine? Or do you prefer an additional V4L2_FLASH_(MODE_)STROBE_DISABLE
> > or something similar?
> 
> This isn't about the LED flash mode and we shouldn't suggest it is.

Thanks for the clarification. I guess I got your point now :)

regards;rl

> 
> -- 
> Regards,
> 
> Sakari Ailus

