Return-Path: <linux-media+bounces-4408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92097842449
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 13:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19511C267F4
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7888679EA;
	Tue, 30 Jan 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL52TyIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5767E60
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616030; cv=none; b=gS9yxQveOBS1z3FRwS2Zv3VhBPvFziE5cEMP4/Nl+kLh6KIg3YdwUW71egrpN10b8b/GRvoTdlb37b04w9hphTKKMyv0xx6Yy6xLvzaAyKRj7+hhZNm1RIq62uTpLq6zCEV3pqGzIFv/rLRMTn7m556GY5HgJSofO+STl7JN+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616030; c=relaxed/simple;
	bh=TUeot2suwSfcDWq0YFNKyu7WMIMufYdNYL3UbbvlEnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/bj6dwQ35UWodqfGAwNktSqQiz33I6uTyvKpicUA++q5o1wSzK3HC+VA7c0Moiu2ouBoQwqBZSy5LPZgjeAVk6pKc8/BpoZR+rULJ18IHpN+KhzCp5yr69mMgvBnMVl1i0VhH6YPZ6af/gX7rOVaLyPuYTT0ldShhJt8QPYQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL52TyIU; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706616028; x=1738152028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TUeot2suwSfcDWq0YFNKyu7WMIMufYdNYL3UbbvlEnM=;
  b=OL52TyIUonF/0ZJd/XTMVmE5nURBVQRnRJ+6Vwdh/ghf4KOFN+aBmtOu
   xgi4Mru+6tQXNMN+i5YhqEDBdouD07au3Mxh6LcifLE4gcA6JBuUabv2A
   19e+8bz6TwYPOOk2ldlGhbP5iJ1pRopidJNex95F73mDiL/JPEfcbgi3R
   PlnKDZnR3z5P7uNR7Zx94yKWOYAgPTr3qAmYys1MtD+jlzz8rfbLBjN3y
   0vhewcHbe1vBURQry7Hoz0GgNhEKS/mytCBVsNnSKnWpV344gVP8f9nIb
   MFo3h69vXH7XTpbPPvXcM6/rkPYMqeWaaI7OIKNPuJH6cJHgYjSz8CEWo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402886800"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="402886800"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="878415682"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="878415682"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:00:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9E6C311F8D2;
	Tue, 30 Jan 2024 14:00:23 +0200 (EET)
Date: Tue, 30 Jan 2024 12:00:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Weird default vblank value in ov5693
Message-ID: <Zbjk19khasCsScz-@kekkonen.localdomain>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
 <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
 <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>
 <ZbfxId264Ect_wpb@kekkonen.localdomain>
 <348016db-d2ee-4bc3-b1f6-faf545f3c805@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <348016db-d2ee-4bc3-b1f6-faf545f3c805@redhat.com>

Hi Hans,

On Tue, Jan 30, 2024 at 11:29:20AM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 1/29/24 19:40, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Jan 29, 2024 at 06:18:08PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 1/29/24 15:45, Jacopo Mondi wrote:
> >>> Hi Hans
> >>>
> >>> +dave, laurent and sakari
> >>>
> >>> On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
> >>>> Hi Jacopo,
> >>>>
> >>>> On 1/29/24 13:05, Jacopo Mondi wrote:
> >>>>> Hi Hans
> >>>>>
> >>
> >> <snip (getting too long)>
> >>
> >>>> OTOH I do believe that we want a simple default for vblank which gets
> >>>> set on every set_mode call to keep things KISS.
> >>>>
> >>>> How about something like this: (based on your doc patch):
> >>>>
> >>>> """
> >>>> The vblank control default value is reset so that the sensor runs
> >>>> at 30 fps. Except when 30 fps cannot be achieved, in that case
> >>>> the vblank control default value is reset to the control's minimum.
> >>>>
> >>>> After adjusting the range, the vblank control's value must be set to its
> >>>> new default value for consistent behavior after applying a new frame size.
> >>>> """
> >>>>
> >>>
> >>> Sorry but I'm not super excited about blessing 30fps as the
> >>> preferred or suggested setting in the documentation. For some use
> >>> cases 30fps might be extremely slow or extremely fast, if a sensor or
> >>> a mode cannot achieve this we then suggest the minimum... not sure
> >>> what's best. What's others opinion here ?
> >>
> >> I'm fine with loosing the 30 fps language. I was actually
> >> already thinking about dropping specifying 30 fps myself.
> >>
> >> In the pending documentation patch you write:
> >>
> >> "The value used to initialize the vertical and horizontal blanking controls
> >> should be selected in order to realize, in association with the driver default
> >> format and default pixel rate, a reasonable frame rate output, usually one of
> >> the standard 15, 30 or 60 frame per second."
> >>
> >> How about:
> >>
> >> "When a new frame size is applied on the subdevice, sensor drivers are required
> >> to update the limits of their blankings controls.
> >>
> >> ... part about calling __v4l2_ctrl_modify_range()...
> >>
> >> The control's default value is adjusted to achieve a reasonable framerate
> >> again and the control's value is set to the new default for consistent
> >> behavior after applying a new frame size."
> >>
> >> ?
> >>
> >> This basically blesses the existing ov5693 driver's behavior :)
> > 
> > What would be the purpose of this? Presumably the user space will set the
> > vblank value based on its needs in any case, before starting streaming.
> 
> As I mentioned currently libcamera's sensor class sets vblank to its
> default value at initialization time and some pipelines simply leave
> it there so having a somewhat sane default is important to not have
> a very high fps / have low max exposure for modes with a low height.
> 
> > It would require changing many that currently don't have this. Changing
> > this could also adversely affect some user space software but presumably is
> > unlikely to break it.
> 
> This is mostly to have clear guidelines for when adding vblank support
> to existing drivers without vblank support.
> 
> Existing drivers often have a fixed vts value independend of the mode /
> amount of cropping so that they always run at a fixed fps.
> 
> Ideally we would not change the behavior of these drivers when adding
> vblank control. Having these drivers pick a default vblank value
> (when adjusting the range) so that the old fixed vts is again achieved
> and then resetting vblank to that default value ensures that the behavior
> of the driver does not change for userspace which does not touch vblank.

Agreed. The text should also say that, then, so new drivers wouldn't need
to bother. The complexity of adding that is trivial only on entirely
register list based drivers which we prefer to get rid of anyway,
eventually.

> 
> Where as for userspace implementations which already set vblank to
> their own value the default does not matter.
> 
> >>> Maybe we're getting too concerned on this, as if an application sets a
> >>> new mode, it's likely setting new blankings and exposure as well..
> >>
> >> ATM libcamera sets vblank to whatever default the sensor driver
> >> advertises and not all pipelines change it after that, so IMHO we
> >> need to have a somewhat sane default (and we probably want
> >> libcamera pipelines to do a bit better, esp. with increasing
> >> vblank to allow higher exposure in low light conditions).
> > 
> > It should be easy to calculate the right value, given the necessary
> > information. This is related to the needs of improving the sensor APIs for
> > register list based drivers.
> 
> IMHO it is important to where possible not change the behavior
> of register list based drivers when adding improvements like
> vblank control. As I said above these often use a fixed vts
> for modes, the idea is to set a default vblank value so that
> the vts does not change compared to before the introduction
> of the vblank control.

I agree. There are probably less than 20 such drivers, mostly old
OmniVision sensor drivers.

> 
> This is just about the default value after a set_mode pad-op
> call. Vblank aware userspace will likely override that anyway.

-- 
Regards,

Sakari Ailus

