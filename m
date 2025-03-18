Return-Path: <linux-media+bounces-28423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C7A675E5
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 15:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0304F173AFA
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E446920DD6E;
	Tue, 18 Mar 2025 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2Pyec+P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE214A8B;
	Tue, 18 Mar 2025 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306819; cv=none; b=GMfn2Evq8wBCuVl10pN9bA85TCmxeykDHnPIRtYBx4SFk7T6aEFyFZj8wjndaxpJtMGaGOlZ87F2G3y4zD7D6OpCtSmOLI1tqE6q0bqPKB4AJRW2aaztYzM5lYyZfoUVYrlLxbW4Xc3KVgl4k2BJpkz1uGw52gNoH+zIPu64wAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306819; c=relaxed/simple;
	bh=Lf0efU44eJlOm7NUczv0IMiAS0QUAkL4/crF/TdPjIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSMQtmJQi7QEYEaKR04oxhokb7k2VmnB/PBmWXea6pcPVpcN1DBIEwvOrkJ465Szf8jmzNJAe92QXJTWMlA7scPCuUvPrcaW/zb1j69FH1jCqqJrANvXCQaI5ynDBXUC+j/eQwV2NQg3hQFE84UDwhW0p0qnBXvK5yUYDh8gq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2Pyec+P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742306818; x=1773842818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lf0efU44eJlOm7NUczv0IMiAS0QUAkL4/crF/TdPjIY=;
  b=c2Pyec+PY/bRLu+y1R8oeeGiaV0uXPqH+jvdf/T5L1b5d/WtmL5kqszE
   F7iLsKTGuFJYT0/KrhESbgdLl1v+uiviFto/SweGsQF5SCqD6EncwYJzW
   3wMb9lEkuCprpfEL6LBeiqP7k8gIBsi7ab1h+OuYjh1q92l07IcyMiHei
   +tLq+OE6Fz7UO4ahG1/NR3RWPk3t/M3Io0B58NsXtAcEdCd0R1pD9B6jM
   HL7V9K2fz0Liu8TI4wVCsoF7Ppn7dxpR1ISSGyEwsJ+ZwrMeRhehs/zh5
   3GL91NA5w9uAr5PKaXJZdB0sf36GxKlgxb+oJBMM7tc9FjcjYGe5Y64sE
   g==;
X-CSE-ConnectionGUID: J8fbP7j5QmaXPAsj4o9SQA==
X-CSE-MsgGUID: DRhzksSMQUKxMLYjkqiD5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53661088"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="53661088"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP; 18 Mar 2025 07:06:56 -0700
X-CSE-ConnectionGUID: paYMCNYhS620bM3qjhKGAg==
X-CSE-MsgGUID: LHecwTdCQVe0kKB/P4y2fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="153258227"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 07:06:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E51DF11F9BD;
	Tue, 18 Mar 2025 16:06:50 +0200 (EET)
Date: Tue, 18 Mar 2025 14:06:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <Z9l9-tEwHRtXnz1a@kekkonen.localdomain>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
 <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
 <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
 <Z9l04b5ZGy877j32@kekkonen.localdomain>
 <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>

Hi Richard,

On Tue, Mar 18, 2025 at 02:42:53PM +0100, Richard Leitner wrote:
> On Tue, Mar 18, 2025 at 01:28:01PM +0000, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > On Fri, Mar 14, 2025 at 05:08:16PM +0100, Richard Leitner wrote:
> > > Hi Sakari,
> > > 
> > > On Fri, Mar 14, 2025 at 01:34:07PM +0000, Sakari Ailus wrote:
> > > > Hi Richard,
> > > > 
> > > > On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> > > > > On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> > > [...]
> > > > > > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > > > > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > > > > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > > > > > control, as the timeout defines a limit after which the flash is
> > > > > > > "forcefully" turned off again.
> > > > > > > 
> > > > > > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > > > > > of the flash/strobe pulse
> > > > > > 
> > > > > > What's the actual difference between the two? To me they appear the same,
> > > > > > just expressed in a different way.
> > > > > 
> > > > > According to FLASH_TIMEOUT documentation:
> > > > > 
> > > > > 	Hardware timeout for flash. The flash strobe is stopped after this
> > > > > 	period of time has passed from the start of the strobe. [1]
> > > > > 
> > > > > This is a little bit unspecific, but as also discussed with Dave [2]
> > > > > according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> > > > > be targeted at providing a "real timeout" control, not settings the
> > > > > desired duration:
> > > > > 
> > > > > 	The flash strobe was still on when the timeout set by the user
> > > > > 	--- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> > > > > 	controllers may set this in all such conditions. [1]
> > > > > 
> > > > > If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> > > > > use-case. But tbh I think FLASH_DURATION would be more specific.
> > > > > 
> > > > > As this still seems unclear: Should the documentation be
> > > > > changed/rewritten if we stick with the FLASH_DURATION approach?
> > > > > 
> > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> > > > > [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/
> > > > 
> > > > Right, I think I can see what you're after.
> > > > 
> > > > How does the sensor determine when to start the strobe, i.e. on which frame
> > > > and which part of the exposure of that frame?
> > > 
> > > In general I think it's not part of V4L2_CID_FLASH_DURATION to take any
> > > assumptions on that, as that's sensor/flash specific IMHO.
> > > 
> > > In case of the ov9282 sensor driver (which is also part of this series)
> > > the strobe is started synchronously with the exposure on each frame
> > > start.
> > > Being even more specific on the ov9292, the sensor also offers the
> > > possibility to shift that strobe start in in either direction using a
> > > register. Implementing this "flash shift" (as it's called in the sensors
> > > datasheet) is currently under test on my side. I will likely send a
> > > series for that in the coming weeks.
> > 
> > Ok, so you get a single frame exposed with a flash when you start
> > streaming, is that correct?
> 
> Correct. The flash is switched on for the configured duration at every
> frame exposure (the sensor has a global shutter) as long as the camera is
> streaming.
> 
> Maybe to following visualization of configured flash and exposure times help:
> 
>              _________        _________        _________
> exposure: __|         |______|         |______|         |__
> 
>              __               __               __
> flash:    __|  |_____________|  |_____________|  |_________
>             ^^^^
>       strobe_duration

That diagram would work for global shutter but not for the much, much more
common rolling shutter operation. Does the driver use the sensor in rolling
shutter mode? This isn't very common with LED flashes.

-- 
Regards,

Sakari Ailus

