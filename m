Return-Path: <linux-media+bounces-9941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5618AE842
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 15:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35F0E1F244B3
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FD5136658;
	Tue, 23 Apr 2024 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUTKenxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BC135A7D
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713879215; cv=none; b=Nei/81nnrXSu24AivY7+hYJCQMtOJkHXEsWBRL5glsHO0ixCg7akkeu+sLrqCAJiFVRVZAve78d0u6Gcm+mWNv3p58GXNqMdW0NXbZnn7HOJbIoyeQBV+RamE13FhX6pJtff1EOnKUP+O/vB1Q0z/mcW9jbtBtMJetUxPiR5NYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713879215; c=relaxed/simple;
	bh=UnPzgNriKcaSv+1Kq1xP/eMVU/7qT5k0P+RoyztvsGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXoEna5qzvNDLby27LcBqhxos72ES9yPv1IUt+toPtOtE//WJXIzCqTT7fvs+HuVzbv1xGvdhcVSDQahPnUoVnH9vm/1vvo+IEul0NFxBObAGQP3f3fkz/pKSjBtOt5b7ct6TuEuNGytNL5Tk1XXCXrU9dRCPiRMTO2LTbsYFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUTKenxg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713879214; x=1745415214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UnPzgNriKcaSv+1Kq1xP/eMVU/7qT5k0P+RoyztvsGA=;
  b=XUTKenxgUICTUuAPCWQ+pN6THluSKwDo2qDXj38X9iOzMA4+G9TrAoDW
   6qSVqVwPVyybaEUvCuz3yzB2B1iNXNZRwLoP95kqF3rg1APbx4fqnJDdj
   kBXNEvcZ6+cgMPFjoW0GhDEvjwbjvf5bAYWA7In31Y+l0SbTM2SH9pKXS
   JFZFB9h3hlJTsuFNsU309U5yKluVGooLCd3M2lj/vTOxflqdoBItPKuEn
   sbKTlhVV9a/kPwNWqOSWx89WXN2viTMybYCSOrA2YoPzScEcBDB2WthYo
   6BB+J5Xz6/tjDP9TbEe9KcbuFyqyXtyX3w0a95ESwRVd9T7ldyxdzTdLD
   Q==;
X-CSE-ConnectionGUID: 0uJXG6Z+QEi/mLpqrYmh+w==
X-CSE-MsgGUID: 17q9djv2Tcirkbkf0d0NHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13247455"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13247455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 06:33:32 -0700
X-CSE-ConnectionGUID: EjknLmO/RZ+IK2O2CWrs6A==
X-CSE-MsgGUID: 9fsFM4GgShSpN3MfmhAtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24408902"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 06:33:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A069611FCCF;
	Tue, 23 Apr 2024 16:33:26 +0300 (EEST)
Date: Tue, 23 Apr 2024 13:33:26 +0000
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
Message-ID: <Zie4pprnvXKmzZR-@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-12-sakari.ailus@linux.intel.com>
 <20240419171720.GH6414@pendragon.ideasonboard.com>
 <ZieIhSomt1DcLKnZ@kekkonen.localdomain>
 <20240423125944.GF20623@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423125944.GF20623@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 23, 2024 at 03:59:44PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Apr 23, 2024 at 10:08:05AM +0000, Sakari Ailus wrote:
> > On Fri, Apr 19, 2024 at 08:17:20PM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 16, 2024 at 10:32:44PM +0300, Sakari Ailus wrote:
> > > > Document S_ROUTING behaviour for different devices.
> > > > 
> > > > Generally in devices that produce streams the streams are static and some
> > > > can be enabled and disabled, whereas in devices that just transport them
> > > > or write them to memory, more configurability is allowed. Document this.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
> > > >  1 file changed, 24 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index d30dcb9e2537..de8dfd4f11a5 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
> > > >  are independent of similar configurations on other streams. This is
> > > >  subject to change in the future.
> > > >  
> > > > +Device types and routing setup
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +Different kinds of sub-devices have differing behaviour for route activation,
> > > > +depending on the hardware. In all cases, however, only routes that have the
> > > > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> > > > +
> > > > +Devices generating the streams may allow enabling and disabling some of the
> > > > +routes or the configuration is fixed. If the routes can be disabled, not
> > > 
> > > "... some of the routes, or have a fixed routing configuration."
> > 
> > Seems fine.
> > 
> > > > +declaring the routes (or declaring them without
> > > > +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> > > > +disable the routes while the sub-device driver retains the streams and their
> > > > +format and selection configuration.
> > > 
> > > I still find the "retains their format and selection configuration"
> > > quite unclear :-S
> > 
> > Alternatively we could say that the routes are simply not active, without
> > referring to explicitly to formats and selections. I.e.:
> > 
> > If the routes can be disabled, not declaring the routes (or declaring them
> > without ``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in
> > ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
> 
> I'm fine with that.
> 
> > > > The ``VIDIOC_SUBDEV_S_ROUTING`` will still
> > > 
> > > s/will still/ioctl will still/
> > 
> > Both seem to exist, more common is without "ioctl":
> > 
> > $ git grep '[`<]VIDIOC_SUBDEV' -- Documentation/userspace-api/media/|wc -l
> > 84
> > $ git grep -i "VIDIOC_SUBDEV.*ioctl" -- Documentation/userspace-api/media/|wc -l
> > 34
> 
> You'll often find "ioctl" at the beginning of the next line :-) If you
> would like to avoid it, you should drop "The" at the beginning of the
> sentence.

Sounds good.

> 
> > > > +return such routes back to the user in the routes array, with the
> > > > +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag unset.
> > > > +
> > > > +Devices transporting the streams almost always have more configurability with
> > > > +respect to routing. Typically any route between the sub-device's sink and source
> > > > +pads is possible, and multiple routes (usually up to certain limited number) may
> > > > +be active simultaneously. For such devices, no routes are created by the driver
> > > > +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > > > +called on the sub-device. Such newly created routes have the device's default
> > > > +configuration for format and selection rectangles.
> > > > +
> > > >  Configuring streams
> > > >  ^^^^^^^^^^^^^^^^^^^
> > > >  
> 

-- 
Regards,

Sakari Ailus

