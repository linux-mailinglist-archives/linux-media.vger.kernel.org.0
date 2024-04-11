Return-Path: <linux-media+bounces-9082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649668A0AC9
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 10:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93AD41C217DA
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 08:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAF013EFE6;
	Thu, 11 Apr 2024 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGKjwZgk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0262EAE5
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822546; cv=none; b=dqyClxzTs7I259Ld/5inpImXXHxRJfGvNa7bLD+g0HPESV6HvH+JIGzRRfM5dCdqDQLmEJ37YZwhnE2Me6s0l7UkFUPeUcRcyJHhMnsTEtgx8Rl0k3gBuuy3AdLwHl09tMY8vNDkBs9fIBGNfBJfb2NxWjKVjXY92rez7D4wwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822546; c=relaxed/simple;
	bh=G8g5lLi7A8F1g9VY56Itk8tiSJdvfIVrnv2KpqljGrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfCuF03LZMzwTxzvOSYvB7pl1DMnjHJIRNUrOAx+lmica+3eW6NlgjvyC2lu1/sep9ZOhz0lm/UKVtQv5DJlIGAttKpeP/oyrsnPQSIB8bhVnzFecaNrNPta22UwWixaazkelXFWWS27moVbKlMXraKlFFOp6KPafFu/kHnK9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGKjwZgk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712822544; x=1744358544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8g5lLi7A8F1g9VY56Itk8tiSJdvfIVrnv2KpqljGrM=;
  b=UGKjwZgkB/7MEiFtsfcZ4uk/NHZFwByraPaUl2cdf3JjQwnnyawcJLfV
   VBQOhyPSCloS4Ic9jL7722Ns+xsGx25ScXcV62QrWB16O8f5bMFKvVuQ1
   Kptj03JjOzDTpD6J82euh1Xqt9VD4vspO6KJBPjfVCeLB5mLHF3Nm4+jl
   vRHsEhblvHXZjQDFwSDY0LB/NCZnfHyKZx66ktH+PLFKnAZHg4fK+unvh
   7Z875B50J0WN4c0hz+e0eXXJ8/pwtVfBEkX3PVZcrgGgxs0ENflCYEkpH
   OKxTLX5Ecmvery7nCwPeogKWmENMhfkG/5PYMw+d/rnOQMcBm5k93YtBL
   g==;
X-CSE-ConnectionGUID: 1LW8FPFpTUyPxd+uQ6SovQ==
X-CSE-MsgGUID: Ev7VByPJS9iw09dg0tLHRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18779110"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18779110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:02:24 -0700
X-CSE-ConnectionGUID: h94lxEKxTYmrRSriR/0M2A==
X-CSE-MsgGUID: kQ79eFqaSWWYtax+VIEB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20802301"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:02:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3012E12035C;
	Thu, 11 Apr 2024 11:02:19 +0300 (EEST)
Date: Thu, 11 Apr 2024 08:02:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 10/38] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <ZheZC43_6N_ddmLw@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-11-sakari.ailus@linux.intel.com>
 <20240320003316.GO8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320003316.GO8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 02:33:16AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:48AM +0200, Sakari Ailus wrote:
> > Document S_ROUTING behaviour for different devices.
> > 
> > Generally in devices that produce streams the streams are static and some
> > can be enabled and disabled, whereas in devices that just transport them
> > or write them to memory, more configurability is allowed. Document this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 1808f40f63e3..08495cc6f4a6 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
> >  are independent of similar configurations on other streams. This is
> >  subject to change in the future.
> >  
> > +Device types and routing setup
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Different kinds of sub-devices have differing behaviour for route activation,
> > +depending on the hardware. In all cases, however, only routes that have the
> > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> > +
> > +Devices generating the streams may allow enabling and disabling some of the
> > +routes or the configuration is fixed. If the routes can be disabled, not
> > +declaring the routes (or declaring them without
> > +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> > +disable the routes while the sub-device driver retains the streams and their
> 
> No idea what you mean by "retains the streams and their configuration".

I'll add that this means format and selection configuration.

> 
> > +configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> > +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> > +flag unset.
> 
> I find this quite confusing. There's no explanation as to why the API
> behaves this way. I think you should rewrite this documentation, trying
> to evaluate it from the point of view of someone who doesn't know about
> the routing API.

I wonder if this would be easier for the user if such routes had a flag
that would tell they're always there. It could be called e.g. STATIC. Then
the user would be able to expect certain behaviour before disabling a link.

The purpose is really to avoid removing streams that the user would not
know how to re-create in order to make the device function again.

> 
> > +
> > +Devices transporting the streams almost always have more configurability with
> > +respect to routing. Typically any route between the sub-device's sink and source
> > +pads is possible, and multiple routes (usually up to certain limited number) may
> > +be active simultaneously. For such devices, no routes are created by the driver
> > +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > +called on the sub-device. Such newly created routes have the device's default
> > +configuration for format and selection rectangles.
> > +
> >  Configuring streams
> >  ^^^^^^^^^^^^^^^^^^^
> >  
> 

-- 
Regards,

Sakari Ailus

