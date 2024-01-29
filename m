Return-Path: <linux-media+bounces-4369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70884129B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 19:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9EAF283F93
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 18:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE02D76059;
	Mon, 29 Jan 2024 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzYMNt7o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001576058
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706553641; cv=none; b=TuEXljRzjiXF5E+m0B5pIFXoFTRSUQtbv5UpLcSwhMn4kPyH/8NOgzniFlNz7N/s3SuFztqECxHj3lyZRBeG8TOS1fVtJ+JflYNTPJD7Gf7B6qnz48+s23h2wC9MJZKQCLqfE3SyCq1iXfuZxRdrgHx2Zrzm1RlzyvS5aZyBcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706553641; c=relaxed/simple;
	bh=JNMl2OESTJp5bDewYoXMrzRKigZqser8zTS15uBvEYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANg1WAwOAOac7edudvKajb6K/HLMqUMrAARbNE9zP2OOFXF3BvIWsNhhabNtCbG6KpVhvVINABr2x7nWvO/L4rczjIXakSNTlVPTq0VPxFcToyFcoiNZnXQpQNcXgbFY7Cg+tHcY3mNIaq/yaexWnx2rKRfb+3bNHn1a8+LYzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzYMNt7o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706553639; x=1738089639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNMl2OESTJp5bDewYoXMrzRKigZqser8zTS15uBvEYM=;
  b=SzYMNt7oOhRVBBFiabzicwW5pLtmxAPaKJnWmcE9d9DTx3ttKtYG2p9X
   5K+wV9kzjmfK5t/AKItqKjdwM8v/SMoTleQ3ti8/cmikAwgQW/yKY2HTz
   3YvGNAV1/8ZXcTmXd7F7rpYRs+rSXy7QBIdgkqP4kDsUPqLP5/NxzurQ3
   GAxl8Z7O/DKNl4balJK9x9wvNsCOIgHHuKExMrlZlYgtHH2K+YlZbM2+E
   ZDx9BWOroszsKFB21ZmqPYK6V8c3r5k0YOUlvriBqUbbJObhMbOq8ry0z
   XO/UYiGr3vxK5oP8vcncPPwIMQCJ270UxHWbO72FtxLwED6KNtjFl+pCB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9792843"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9792843"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="1119008349"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="1119008349"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:40:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A11E211FAD4;
	Mon, 29 Jan 2024 20:40:33 +0200 (EET)
Date: Mon, 29 Jan 2024 18:40:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Weird default vblank value in ov5693
Message-ID: <ZbfxId264Ect_wpb@kekkonen.localdomain>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
 <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
 <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>

Hi Hans,

On Mon, Jan 29, 2024 at 06:18:08PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/29/24 15:45, Jacopo Mondi wrote:
> > Hi Hans
> > 
> > +dave, laurent and sakari
> > 
> > On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
> >> Hi Jacopo,
> >>
> >> On 1/29/24 13:05, Jacopo Mondi wrote:
> >>> Hi Hans
> >>>
> 
> <snip (getting too long)>
> 
> >> OTOH I do believe that we want a simple default for vblank which gets
> >> set on every set_mode call to keep things KISS.
> >>
> >> How about something like this: (based on your doc patch):
> >>
> >> """
> >> The vblank control default value is reset so that the sensor runs
> >> at 30 fps. Except when 30 fps cannot be achieved, in that case
> >> the vblank control default value is reset to the control's minimum.
> >>
> >> After adjusting the range, the vblank control's value must be set to its
> >> new default value for consistent behavior after applying a new frame size.
> >> """
> >>
> > 
> > Sorry but I'm not super excited about blessing 30fps as the
> > preferred or suggested setting in the documentation. For some use
> > cases 30fps might be extremely slow or extremely fast, if a sensor or
> > a mode cannot achieve this we then suggest the minimum... not sure
> > what's best. What's others opinion here ?
> 
> I'm fine with loosing the 30 fps language. I was actually
> already thinking about dropping specifying 30 fps myself.
> 
> In the pending documentation patch you write:
> 
> "The value used to initialize the vertical and horizontal blanking controls
> should be selected in order to realize, in association with the driver default
> format and default pixel rate, a reasonable frame rate output, usually one of
> the standard 15, 30 or 60 frame per second."
> 
> How about:
> 
> "When a new frame size is applied on the subdevice, sensor drivers are required
> to update the limits of their blankings controls.
> 
> ... part about calling __v4l2_ctrl_modify_range()...
> 
> The control's default value is adjusted to achieve a reasonable framerate
> again and the control's value is set to the new default for consistent
> behavior after applying a new frame size."
> 
> ?
> 
> This basically blesses the existing ov5693 driver's behavior :)

What would be the purpose of this? Presumably the user space will set the
vblank value based on its needs in any case, before starting streaming.

It would require changing many that currently don't have this. Changing
this could also adversely affect some user space software but presumably is
unlikely to break it.

> 
> > Maybe we're getting too concerned on this, as if an application sets a
> > new mode, it's likely setting new blankings and exposure as well..
> 
> ATM libcamera sets vblank to whatever default the sensor driver
> advertises and not all pipelines change it after that, so IMHO we
> need to have a somewhat sane default (and we probably want
> libcamera pipelines to do a bit better, esp. with increasing
> vblank to allow higher exposure in low light conditions).

It should be easy to calculate the right value, given the necessary
information. This is related to the needs of improving the sensor APIs for
register list based drivers.

> 
> 
> > 
> >>>> What about enum/get/set frame_interval vs set_mode vs
> >>>> vblank ctrl ?  Options:
> >>>>
> >>>> a) Sensor drivers MUST not implement enum/get/set frame_interval?
> >>>
> >>> Ideally they shouldn't, for RAW sensors at least.
> >>>
> >>> For YUV/RGB sensors instead the high-level parameters used by
> >>> frame_interval might be ok as some of those sensors might not even
> >>> allow you to control blankings explicitly.
> >>>
> >>> Whenever the hardware allows that, blankings should always be
> >>> preferred over frame_interval imho.
> >>>
> >>>> b) enum/get/set frame_interval only enum/get/set the default
> >>>>    frame_interval set by set_mode (e.g. fixed 30 fps).
> >>>>    Any vblank changes made after the set_mode are not reflected
> >>>>    by get_frame_interval and set_frame_interval only influences
> >>>>    the next set_mode call, not the current mode ? Or maybe
> >>>>    only allow set_frame_interval when not streaming and then
> >>>>    have it set vblank to match the interval like it would
> >>>>    have done when called before the last set_mode call ?
> >>>> c) enum/get/set frame_interval are a second way to control
> >>>>    hts (lets not go there just here for completeness sake)
> >>>>
> >>>> My own preference here would be to go with a) .
> >>>
> >>> Mine as well, but as said for YUV/RGB sensors it might not even be
> >>> possible to control blankings explicitly. In this case
> >>> set_frame_interval can be used but if the driver registers the vblank
> >>> control the newly computed blanking value (in response to a
> >>> set_frame_interval) should be reflected there ?
> >>
> >> IMHO if the driver registers the vblank control then it *must not*
> >> implement enum/get/set frame_interval . Trying to support both at
> >> the same time is just going to cause pain.
> > 
> > Well, a RO vblank wouldn't hurt :)
> 
> Yes and I guess that for sensors where we cannot explicitly
> control vblank we would need a RO vblank to satisfy libcamera's
> sensor requirements.

Vertical blanking is virtually always controllable, horizontal blanking not
nearly as often.

-- 
Regards,

Sakari Ailus

