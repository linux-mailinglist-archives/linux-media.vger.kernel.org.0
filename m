Return-Path: <linux-media+bounces-40853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA732B335DC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACA93189A771
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC70274B54;
	Mon, 25 Aug 2025 05:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJzrX0k0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486B17BD6;
	Mon, 25 Aug 2025 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100545; cv=none; b=JYfXWa0NU4GHndm2b3NUy9rO+00FofeZGsD8LFxVs5rI2PrkhwCIGVYiuaE/blbdoqwkq3uP3eRZL42InZ+iS0x9D7+eXch87RkLcXrb41QZA4o+OGMElNqQzghIpnciavm/aUz0yeFTc/CV3KmHy9xwEmJ5ohSksbc80MVn3iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100545; c=relaxed/simple;
	bh=SgDSAaeJE19D2xt9hQTX5rzEHMR4pavP+mq1cxRKkLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOlk/pkfVgSykty3xWWX5qrdG1WU2YYoADIe8j9AQsBC0E94vgyXFjdWFu0oH/1bbKLiNAL4pfgeIbl1rrWEhhl4r76/m8YoMEOxxG2GPrKhHPEEec/Xrc/QgsC87MGrwJ1emfrf5OtjNtj0krlLOy0zEi5RiJALow/P9D9VAUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJzrX0k0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756100544; x=1787636544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SgDSAaeJE19D2xt9hQTX5rzEHMR4pavP+mq1cxRKkLk=;
  b=IJzrX0k0RSWvjMuOktTbG8zrE/GDUdu19ZRIBqVpWgQRe+yqKCFFYT89
   aeYdIAZJEiAXL0ZTWf6I82BURg+1m74OfH0atkbrLpsOU6Iuf0gt4/EZW
   t+J0hqrkstK30raUg/2Snii8mqG1nBT7wRF+v+Ol0S4r4v0q9PP7nek0e
   zdlMrcDde1LTjCbJvlwiFGU1VzKishxTJl4gcoHr9TPLGzuCjKsQMR67N
   jDv5IXwrh2HuGSYjQsaylTW/bCICue+Nxj7C3cC3RXDcNW+UdNfaxwfYE
   oPPrbRdAqgym/e+xkmixaBktTgl8bEPYQ1THBC0x8DXYkJpcseytjkqo0
   A==;
X-CSE-ConnectionGUID: MAZlovxKQAaOfXUglYWScw==
X-CSE-MsgGUID: ZrXj/kePTUug32fiWXzB5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58404144"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58404144"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:42:23 -0700
X-CSE-ConnectionGUID: ZZE9PtKJRhCAYzli/SpFFA==
X-CSE-MsgGUID: OVussu/bRgKsBweq0vqLew==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:42:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EBAA412023C;
	Mon, 25 Aug 2025 08:42:17 +0300 (EEST)
Date: Mon, 25 Aug 2025 08:42:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 03/11] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <aKv3uUXf87im8ajX@kekkonen.localdomain>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
 <20250716-ov9282-flash-strobe-v6-3-934f12aeff33@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716-ov9282-flash-strobe-v6-3-934f12aeff33@linux.dev>

Hi Richard,

Thanks for the update (and for the ping!).

On Wed, Jul 16, 2025 at 11:06:53AM +0200, Richard Leitner wrote:
> Add the new strobe_duration control to v4l uAPI documentation.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> @@ -186,3 +186,8 @@ Flash Control IDs
>      charged before strobing. LED flashes often require a cooldown period
>      after strobe during which another strobe will not be possible. This
>      is a read-only control.
> +
> +``V4L2_CID_FLASH_DURATION (integer)``
> +    Duration the flash should be on when the flash LED is in flash mode
> +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
> +    if possible.
> 

I think we should add this is related to the hardware strobe.

How about:

``V4L2_CID_FLASH_DURATION (integer)``

    Duration of the flash strobe from the strobe source, typically a camera
    sensor. Controlling the flash LED strobe length this way requires that the
    flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>` is set
    to ``V4L2_FLASH_LED_MODE_FLASH`` and :ref:`strobe source
    <v4l2-cid-strobe-source>` is set to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
    The unit should be microseconds (µs) if possible.

This requires of course the appropriate labels.

I also wonder whether we should use 0,1 µs or even ns for the unit.

-- 
Kind regards,

Sakari Ailus

