Return-Path: <linux-media+bounces-38670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664CB167B4
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 22:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF691AA7904
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 20:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42F92206B2;
	Wed, 30 Jul 2025 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/g7046s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906D173;
	Wed, 30 Jul 2025 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907996; cv=none; b=CrW3sxkZmtpcDsZjvdTVfQFAW4yjPqDf7q8aZEKcoco8b9+R8BzMnPpJpI9GP+MVFpuHveAIed+kX5iKovxzkMVE+TMudBGXF8QjqEpWW7+22EWdVRoKx963lga2i5bXZSp2x3u37hvUYvT1BUcAvjJ402zSlstOAVRCmQFE+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907996; c=relaxed/simple;
	bh=sCGfqOllVeDU2XNdp/ZZKubAJEHEg60+Ucsw9iZdHLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO2a3pIskc0lTIzGKeKRVsWuSPDK11wl0OXAsysX5or1bZjk/T3X5ug/Hfn0NlTKjrggrXuC9CJ/sQlxLOy51i+xz+dHjpLBc/UZZlc0q7RZSZ4lj9k+9FiLEpHa0/2xERkP2gsSt/ngLhcrwZh1FdWOc3JoQteerJ5VEX98ETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/g7046s; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753907995; x=1785443995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sCGfqOllVeDU2XNdp/ZZKubAJEHEg60+Ucsw9iZdHLA=;
  b=G/g7046s92orqEJnR5+ZxXhURQ1ChKd6m4SxT8Ye8rpz1mBwioCZXC6Y
   FeePwJfgajJDYDKAc5sjcDdW89U3gDex0LtxZg2w3mX4ZAv5t3st2OIAk
   rWmGn1qd/5s4XO0vfBfzVKOdYXv5CdLrJG6KxdlDjeVtj7BOTtvactGSO
   ah7TK9tDfe4HhTBoKEDEkOcDwebm2LwhqE6y9jSqwLERVQR/PGSfHKyWt
   y3ZJWyriMOjUn4FcaWg7Fyt8DsnxLriyToEgRbdxq9sl6bm5Z42WiDdLt
   apQIqdTHobvEFTAv8rNEX5XwqhAkSxwCQpNz9ILaiTjA/JpC/FlsnTRfh
   A==;
X-CSE-ConnectionGUID: W6nvQkP8QWKaj3cvKQsjHA==
X-CSE-MsgGUID: 2uQwGyoPSduNDUY9zDMEDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56312553"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56312553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:39:52 -0700
X-CSE-ConnectionGUID: HIFruFCOTTuG08zDwolCeQ==
X-CSE-MsgGUID: KUDqT5cDSjabvYX18DkYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163115445"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:39:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F90911FBA7;
	Wed, 30 Jul 2025 23:39:46 +0300 (EEST)
Date: Wed, 30 Jul 2025 20:39:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <aIqDEgrAoSkozxA3@kekkonen.localdomain>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
 <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
 <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>
 <aG92TxxIRdRES5cs@kekkonen.localdomain>
 <f4owcdddwjar6lg5f2urpaynykks4yrttto7h7qfnodmqg22ll@xl45pbhuyhmx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4owcdddwjar6lg5f2urpaynykks4yrttto7h7qfnodmqg22ll@xl45pbhuyhmx>

Hi Richard,

On Fri, Jul 11, 2025 at 09:41:52AM +0200, Richard Leitner wrote:
> Hi Sakari,
> 
> On Thu, Jul 10, 2025 at 08:14:07AM +0000, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > On Thu, Jul 10, 2025 at 08:50:24AM +0200, Richard Leitner wrote:
> > > Hi Sakari,
> > > 
> > > thanks for the feedback :)
> > > 
> > > On Wed, Jul 09, 2025 at 09:12:57PM +0000, Sakari Ailus wrote:
> > > > Hi Richard,
> > > > 
> > > > Thanks for the update.
> > > > 
> > > > On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> > > > > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > > > > feature of the sensor. This implements following modes:
> > > > > 
> > > > >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> > > > >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> > > > 
> > > > I really think you should use a different control for this. The sensor can
> > > > strobe the flash but it won't control its mode.
> > > > 
> > > > How about calling it V4L2_FLASH_STROBE_ENABLE?
> > > 
> > > I agree on that. But tbh V4L2_FLASH_STROBE_ENABLE somehow sounds wrong
> > > to me. As the strobe output in the ov9282 case goes high for the strobe
> > > duration, what do you think about calling it V4L2_FLASH_STROBE_PULSE?
> > 
> > That's how the hardware strobe is supposed to work, there's nothing unusual
> > in that. How about V4L2_FLASH_HW_STROBE_ENABLE?
> 
> Ah. Sorry. I believe I completely misunderstood your previous point.
> You're not referring to a new menu entry in V4L2_CID_FLASH_LED_MODE,
> but rather proposing a completely new boolean control, correct?

Correct.

> 
> As this would be separating the V4L2_CID's of "strobe signal source"
> (aka sensor) and "strobe signal consumer" (aka flash device/LEDs), that
> makes perfect sense to me now! :)
> 
> What are your thoughts on naming it V4L2_FLASH_HW_STROBE_SIGNAL?

Seems reasonable.

In order to use the control, the user space would need to know when to use
it, i.e. when the latching point would be in order to hit a particular
frame. If the strobe can start before the exposure (and presumably it needs
to), the latching point is before that point of time. I wonder if pixels
(as in the pixel array) would be reasonable unit for this as well.

Does the sensor datasheet shed any light on this? It might be good to add a
control for that as well.

> 
> The main reason behind removing the "ENABLE" suffix is that none of
> the V4L2_CID_FLASH_* controls currently include "ENABLE" in their
> names. Altough, for example, V4L2_CID_FLASH_CHARGE performs a
> similar function (en-/disabling the charging of the capacitor).
> 
> On the other hand, adding "SIGNAL" to the control name, in my opinion,
> makes it clearer that it only enables a signal and not some kind of
> flash device or LED.

-- 
Kind regards,

Sakari Ailus

