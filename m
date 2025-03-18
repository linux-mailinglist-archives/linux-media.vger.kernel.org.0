Return-Path: <linux-media+bounces-28419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D61A6751A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1237C1893092
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C246520CCFB;
	Tue, 18 Mar 2025 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoXOBXwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F417A311;
	Tue, 18 Mar 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304489; cv=none; b=co2bJzsmFNzXYTUdHRYbZkppAFvDBTbru9Sifm1GHYkuo1nSza4DUKpzEne4Vzeww/LlW+NlnwMwV+eD8DYVj1LpvCP/HeTgvD6LIKOxqZxzlfCnrINUB1P6ltJu3lQDrXDlLiTDLI2OrnuRxhG5PvYYUioLJyylASMeF7no/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304489; c=relaxed/simple;
	bh=XIFQgKXLvgcn11mpSEh8HygsxPKLUzk5wzTI0vGCpj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxa960/jhpjpbHAOZ7ipjXS8wN8fHFueEpAhSvHXGrn2Pk1hmmAEXlNLLrXYWi/3bmfu/HKzeFpCtrv7bRY0zN0Ysz1d/W/HAbn/XdTzpr81+d4ABJHBe26kyVS5YV33F84FhawBvdR94tfVKScMdYD3XrLraoXGj9fWX85vuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoXOBXwZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742304488; x=1773840488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XIFQgKXLvgcn11mpSEh8HygsxPKLUzk5wzTI0vGCpj0=;
  b=KoXOBXwZvBR5cdic/RJjGUzuPsGQGlajSY+ktNXoLYaaIIlcYbjMxw9K
   w4hK+A9HFzzm3zJ9IJpJpd3FGx1m49Zmd3RILW5mOMn26Abaq1J/kY5d+
   ltTBKnEIuvErTV3aWNNOU2puuashqv26zeKweyRZsVVxlLOpHHeFNFSUr
   YCSTvBNalsG3oM7/ofl2HY+cYM6v3om13xVMsisjKJZ6iJiKASHdCyLnG
   7Eqx9DZBB01ho/i3vFcB0sYzCxwMr7/vsec71bnjlK5zJJQCCCmFq0GxQ
   I4abQU6Yp9qWpLZlJewt2yMwKLCDIRFaQWpORDuZKomtM015NL4q8ODGC
   w==;
X-CSE-ConnectionGUID: bZ5XA+thQJSrj/jvS54P2Q==
X-CSE-MsgGUID: Z4SzYWYNRKy2ikulIWylIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43460093"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="43460093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:28:07 -0700
X-CSE-ConnectionGUID: /FznNnb4Tve6hnL8E3lqIQ==
X-CSE-MsgGUID: HGQqv6VLQz+AyRL+jqpLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="153245820"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:28:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EF65611F74E;
	Tue, 18 Mar 2025 15:28:01 +0200 (EET)
Date: Tue, 18 Mar 2025 13:28:01 +0000
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
Message-ID: <Z9l04b5ZGy877j32@kekkonen.localdomain>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
 <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
 <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>

Hi Richard,

On Fri, Mar 14, 2025 at 05:08:16PM +0100, Richard Leitner wrote:
> Hi Sakari,
> 
> On Fri, Mar 14, 2025 at 01:34:07PM +0000, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> > > On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> [...]
> > > > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > > > control, as the timeout defines a limit after which the flash is
> > > > > "forcefully" turned off again.
> > > > > 
> > > > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > > > of the flash/strobe pulse
> > > > 
> > > > What's the actual difference between the two? To me they appear the same,
> > > > just expressed in a different way.
> > > 
> > > According to FLASH_TIMEOUT documentation:
> > > 
> > > 	Hardware timeout for flash. The flash strobe is stopped after this
> > > 	period of time has passed from the start of the strobe. [1]
> > > 
> > > This is a little bit unspecific, but as also discussed with Dave [2]
> > > according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> > > be targeted at providing a "real timeout" control, not settings the
> > > desired duration:
> > > 
> > > 	The flash strobe was still on when the timeout set by the user
> > > 	--- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> > > 	controllers may set this in all such conditions. [1]
> > > 
> > > If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> > > use-case. But tbh I think FLASH_DURATION would be more specific.
> > > 
> > > As this still seems unclear: Should the documentation be
> > > changed/rewritten if we stick with the FLASH_DURATION approach?
> > > 
> > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> > > [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/
> > 
> > Right, I think I can see what you're after.
> > 
> > How does the sensor determine when to start the strobe, i.e. on which frame
> > and which part of the exposure of that frame?
> 
> In general I think it's not part of V4L2_CID_FLASH_DURATION to take any
> assumptions on that, as that's sensor/flash specific IMHO.
> 
> In case of the ov9282 sensor driver (which is also part of this series)
> the strobe is started synchronously with the exposure on each frame
> start.
> Being even more specific on the ov9292, the sensor also offers the
> possibility to shift that strobe start in in either direction using a
> register. Implementing this "flash shift" (as it's called in the sensors
> datasheet) is currently under test on my side. I will likely send a
> series for that in the coming weeks.

Ok, so you get a single frame exposed with a flash when you start
streaming, is that correct?

> 
> > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> > > > >  include/uapi/linux/v4l2-controls.h        | 1 +
> > > > >  2 files changed, 2 insertions(+)
> [...]
> > 

-- 
Regards,

Sakari Ailus

