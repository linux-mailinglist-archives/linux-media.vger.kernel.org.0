Return-Path: <linux-media+bounces-9896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FE8AE1D1
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BEF3281FC7
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 10:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1A160877;
	Tue, 23 Apr 2024 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgu6EPjp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A476024B
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866903; cv=none; b=f1DDiUPqjuEEwmGtT9StkjCzTQ9S1t7GmEvsOk7gtDclIRFBuXvO9mEReKZUIW1nihAjjO5GwiLeEVYzwAG3NL63s755JuwkRQoTgEdvQrzB7fSXOi6eGWthKZV1l2GVPhdqWajkAKdGA7hzrIaazdg3E4sNnkjMy/iTC2TeWf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866903; c=relaxed/simple;
	bh=ZnNNfN5ppnfoxSlWi8uYBQJvLzWyg7qdFo6ht2OaQ3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXbZnO4uxIBXPRbL6ty1p0GH+Cok2N88H8tV11I2Ophb7VIasCLvcGQvIu3Bk4HQ1MbgVuzJ8PDvKG5HSXjjOMCxN+5b9BGlHVypuFX8JhDtmjvxolanAi7uWZ9d5Xt20jXgCSIHPBiv6d8/hJl5s01swpxdkDBLTKPDusByrRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgu6EPjp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713866901; x=1745402901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnNNfN5ppnfoxSlWi8uYBQJvLzWyg7qdFo6ht2OaQ3E=;
  b=Xgu6EPjpFWU008rw1FihprvCe2+rjOvl7IAji6Jh2KwjtI4HYa9mUf4h
   Ko7/aCS3WifxBSUy0+HUNItwMfKSppZYBljIlXCBQ9HfYZlj4bEcHm//X
   JemnPu4pU5z9ONmEnQI6q9HxSXo2vabHK4WWe3/t/hL1jhyeEG0FA/In1
   KbH7Ofz3Po3Q+MOfJABhPIPDagp/bLPc6384fscVMJXCb5ZfbHitcHoQA
   9udsfge65e7G+sUv383bzD1MwcyEJliHVyLBfVCtcc6rXCfbiXGUbnhgO
   ZV2M+utMjWiJVUOiaavIug0FdjCz6pP2Ognj+M1uLAX4w0J0h5klZtA0V
   g==;
X-CSE-ConnectionGUID: 6kmNUhoESFi6C7mfow6H0Q==
X-CSE-MsgGUID: fatlvg7JR3WbuRhD1IDrSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9550576"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9550576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:08:11 -0700
X-CSE-ConnectionGUID: A/k6HC+1RJWn/shF/ubCtg==
X-CSE-MsgGUID: bq6yfdKOR3qwYijl1Sk+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29119890"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:08:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C79A411FCCF;
	Tue, 23 Apr 2024 13:08:05 +0300 (EEST)
Date: Tue, 23 Apr 2024 10:08:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 11/46] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <ZieIhSomt1DcLKnZ@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-12-sakari.ailus@linux.intel.com>
 <20240419171720.GH6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419171720.GH6414@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Apr 19, 2024 at 08:17:20PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:32:44PM +0300, Sakari Ailus wrote:
> > Document S_ROUTING behaviour for different devices.
> > 
> > Generally in devices that produce streams the streams are static and some
> > can be enabled and disabled, whereas in devices that just transport them
> > or write them to memory, more configurability is allowed. Document this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index d30dcb9e2537..de8dfd4f11a5 100644
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
> 
> "... some of the routes, or have a fixed routing configuration."

Seems fine.

> 
> > +declaring the routes (or declaring them without
> > +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> > +disable the routes while the sub-device driver retains the streams and their
> > +format and selection configuration.
> 
> I still find the "retains their format and selection configuration"
> quite unclear :-S

Alternatively we could say that the routes are simply not active, without
referring to explicitly to formats and selections. I.e.:

If the routes can be disabled, not declaring the routes (or declaring them
without ``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in
``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.

> 
> > The ``VIDIOC_SUBDEV_S_ROUTING`` will still
> 
> s/will still/ioctl will still/

Both seem to exist, more common is without "ioctl":

$ git grep '[`<]VIDIOC_SUBDEV' -- Documentation/userspace-api/media/|wc -l
84
$ git grep -i "VIDIOC_SUBDEV.*ioctl" -- Documentation/userspace-api/media/|wc -l
34

> 
> > +return such routes back to the user in the routes array, with the
> > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag unset.
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

