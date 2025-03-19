Return-Path: <linux-media+bounces-28468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB0A6890F
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D5D16C0DA
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 10:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A48250C02;
	Wed, 19 Mar 2025 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht8Mz8Me"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C01F4CBE;
	Wed, 19 Mar 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378796; cv=none; b=UlqxHM8Rn5tRImDt/FDIrPKqsjgSV9OAIlibT0KMRqeMd66conZjtefdm6VH853GzF+Qy2FX9lze2KDvsU39Q6KzLyUGFfiYk0+aPL0/K47kyZ1BAxRgyF0jNqWuK2vqoNzeUZ5WaXwswTaK48xgCQA9ACyXRJ2pe13BKHQ+nxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378796; c=relaxed/simple;
	bh=VvnMAMdElVsV84qK7nk/rzEBOkxk8b/tZ6mV1btfb+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXQ7yUguZ7vfZRSx8cEDLB/Yjqe9NShnBJ4jWdMpMBn4uWDw3AHtO2l3xpZX6Feu2RWZd4mRNx3E/bw6GWbQVs7ADVGSurHGly/klh7nlXCZV+thNv6X40NkNp4kvVotqhs2j0Pd+QrRFqqyrcEfipHQa806CNAW3UW+B7bl4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ht8Mz8Me; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742378794; x=1773914794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VvnMAMdElVsV84qK7nk/rzEBOkxk8b/tZ6mV1btfb+o=;
  b=Ht8Mz8Mehk5Xf/1f5WgT3+CX2/4EFRa2r6A/KmAEuTX+mq03unO+bc5/
   MqflburBz0ESD25crjtyJprRwIO2apjv+BwZE3gmHpc/j4mLQ8iPVkhCp
   rmUekQHYPRUwwOJXxCPeFqsjsIOzaXLSOW3loRLc7q78gdq84TL8K4dVy
   cPrvCj60X41a+oKiCd4iIVUMjzhuec/5S6suHwB1+XZMZoze0dPVhhcs8
   4cxykkUxD8dQhHcqKycJqeM2Lj6+cewJmN8sBSBI5XYsLqz6Sxc3/XQv1
   7CXhMtzbh6mjT+nhkREe5/BZz0kuDBnrV/LJ4nq1yawySeZ0LfnEZ5dx8
   g==;
X-CSE-ConnectionGUID: 5myWvYcWSsGMqUJZ5byT6g==
X-CSE-MsgGUID: ilwy8K6qT0OoAHESsQWV1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43423190"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43423190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:06:33 -0700
X-CSE-ConnectionGUID: y4ALrZRHQ9O2FzMJBs7NxQ==
X-CSE-MsgGUID: OqDXhKSsQmuc5LogzfgwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122285433"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:06:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1965811F99F;
	Wed, 19 Mar 2025 12:06:28 +0200 (EET)
Date: Wed, 19 Mar 2025 10:06:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <Z9qXJE8M_BW1VIKR@kekkonen.localdomain>
References: <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
 <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
 <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
 <Z9l04b5ZGy877j32@kekkonen.localdomain>
 <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>
 <Z9l9-tEwHRtXnz1a@kekkonen.localdomain>
 <s76b7q2cvcuk32n3jpsijyrhxhtstk6fewb5drkxdeopvt5grj@p4mcqltiza36>
 <Z9mNKG07sJcbnk3Z@kekkonen.localdomain>
 <CAPY8ntDzA+j97XB4VUfBtSH0RgpVKSdKxS1o5LnmoNDE1h=eyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDzA+j97XB4VUfBtSH0RgpVKSdKxS1o5LnmoNDE1h=eyw@mail.gmail.com>

Hi Dave,

On Tue, Mar 18, 2025 at 04:39:05PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Tue, 18 Mar 2025 at 15:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Richard,
> >
> > On Tue, Mar 18, 2025 at 03:46:18PM +0100, Richard Leitner wrote:
> > > On Tue, Mar 18, 2025 at 02:06:50PM +0000, Sakari Ailus wrote:
> > > > Hi Richard,
> > > >
> > > > On Tue, Mar 18, 2025 at 02:42:53PM +0100, Richard Leitner wrote:
> > > > > On Tue, Mar 18, 2025 at 01:28:01PM +0000, Sakari Ailus wrote:
> > > > > > Hi Richard,
> > > > > >
> > > > > > On Fri, Mar 14, 2025 at 05:08:16PM +0100, Richard Leitner wrote:
> > > > > > > Hi Sakari,
> > > > > > >
> > > > > > > On Fri, Mar 14, 2025 at 01:34:07PM +0000, Sakari Ailus wrote:
> > > > > > > > Hi Richard,
> > > > > > > >
> > > > > > > > On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> > > > > > > > > On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> > > > > > > [...]
> > > > > > > > > > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > > > > > > > > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > > > > > > > > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > > > > > > > > > control, as the timeout defines a limit after which the flash is
> > > > > > > > > > > "forcefully" turned off again.
> > > > > > > > > > >
> > > > > > > > > > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > > > > > > > > > of the flash/strobe pulse
> > > > > > > > > >
> > > > > > > > > > What's the actual difference between the two? To me they appear the same,
> > > > > > > > > > just expressed in a different way.
> > > > > > > > >
> > > > > > > > > According to FLASH_TIMEOUT documentation:
> > > > > > > > >
> > > > > > > > >   Hardware timeout for flash. The flash strobe is stopped after this
> > > > > > > > >   period of time has passed from the start of the strobe. [1]
> > > > > > > > >
> > > > > > > > > This is a little bit unspecific, but as also discussed with Dave [2]
> > > > > > > > > according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> > > > > > > > > be targeted at providing a "real timeout" control, not settings the
> > > > > > > > > desired duration:
> > > > > > > > >
> > > > > > > > >   The flash strobe was still on when the timeout set by the user
> > > > > > > > >   --- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> > > > > > > > >   controllers may set this in all such conditions. [1]
> > > > > > > > >
> > > > > > > > > If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> > > > > > > > > use-case. But tbh I think FLASH_DURATION would be more specific.
> > > > > > > > >
> > > > > > > > > As this still seems unclear: Should the documentation be
> > > > > > > > > changed/rewritten if we stick with the FLASH_DURATION approach?
> > > > > > > > >
> > > > > > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> > > > > > > > > [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/
> > > > > > > >
> > > > > > > > Right, I think I can see what you're after.
> > > > > > > >
> > > > > > > > How does the sensor determine when to start the strobe, i.e. on which frame
> > > > > > > > and which part of the exposure of that frame?
> > > > > > >
> > > > > > > In general I think it's not part of V4L2_CID_FLASH_DURATION to take any
> > > > > > > assumptions on that, as that's sensor/flash specific IMHO.
> > > > > > >
> > > > > > > In case of the ov9282 sensor driver (which is also part of this series)
> > > > > > > the strobe is started synchronously with the exposure on each frame
> > > > > > > start.
> > > > > > > Being even more specific on the ov9292, the sensor also offers the
> > > > > > > possibility to shift that strobe start in in either direction using a
> > > > > > > register. Implementing this "flash shift" (as it's called in the sensors
> > > > > > > datasheet) is currently under test on my side. I will likely send a
> > > > > > > series for that in the coming weeks.
> > > > > >
> > > > > > Ok, so you get a single frame exposed with a flash when you start
> > > > > > streaming, is that correct?
> > > > >
> > > > > Correct. The flash is switched on for the configured duration at every
> > > > > frame exposure (the sensor has a global shutter) as long as the camera is
> > > > > streaming.
> > > > >
> > > > > Maybe to following visualization of configured flash and exposure times help:
> > > > >
> > > > >              _________        _________        _________
> > > > > exposure: __|         |______|         |______|         |__
> > > > >
> > > > >              __               __               __
> > > > > flash:    __|  |_____________|  |_____________|  |_________
> > > > >             ^^^^
> > > > >       strobe_duration
> > > >
> > > > That diagram would work for global shutter but not for the much, much more
> > > > common rolling shutter operation. Does the driver use the sensor in rolling
> > > > shutter mode? This isn't very common with LED flashes.
> > >
> > > The ov9282 driver uses the sensor in global shutter mode.
> > >
> > > I totally agree with your statement. This pattern is only useful for
> > > global shutter operation.
> >
> > I think (nearly?) all supported sensors use a rolling shutter.
> 
> You've got at least two other global shutter sensors supported in
> mainline - Omnivision ov7251 and Sony imx296.
> Patches have been posted for OnSemi ar0144 (Laurent) and ar0234
> (Dongcheng), which are also both global shutter sensors.
> 
> So yes they are in the minority, but not that uncommon.

Thanks for the list. I briefly discussed this with Laurent and I agree with
him this information would probably be best kept with userspace (libcamera)
without trying to enumerate it from the kernel (albeit CCS might be an
exception, but that's an entirely different discussion then). Only changing
the global/rolling configuration would require a control.

-- 
Regards,

Sakari Ailus

