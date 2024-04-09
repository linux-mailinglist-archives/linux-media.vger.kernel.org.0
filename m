Return-Path: <linux-media+bounces-8907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADEF89D9FE
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF5C1F21D72
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F77112F36D;
	Tue,  9 Apr 2024 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0Ql4poq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3D58287F
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668885; cv=none; b=u5wjUh0yWgtzXTJ95wwRxFM8CB9p5hGLZv0GT8Io6BdP97uueLFAkb3A0l2zQBHyHwNrGNtIUb6jeachW6WkdS/hqc+1oQVmGsNJ+Os9dSuMxV6RHwc8xWLECDKVyMyjIz5OyVz2ejeFStYmdh8AqFC4yvydl/jUMGvx1kOjfCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668885; c=relaxed/simple;
	bh=ToplDtg4PkPUc0nzrfvNlW/I/rNmUehSQdiCvO3KuFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lmr9dKnnwmhA5oiwWfjR3HjB/0TXEIAJ6hVJp34J9sYcDSm93I9hCZWjBegosnX2ZImm2YoDm/IvK3M6CH306wWWscJ4CUwHI8QUOPWB1rAf6fSOt+wfl7VDJ6oS+oJUVyMRz/tXfBGdR6UctA3IBS4eJyxiWKrDDEl0UYdsAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0Ql4poq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712668883; x=1744204883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToplDtg4PkPUc0nzrfvNlW/I/rNmUehSQdiCvO3KuFw=;
  b=X0Ql4poqlkfTGBEmLbY55a8pugJr5fk0tMN2CDLVSWKFCFVa1YlNaE6n
   /rb+XAf1sbeOu5CEMRME7J1vGM6jPKDCcuNlNn6/txoS9WJ8c8YF1IDKj
   2S7H4FQh4gZzbyoiYBTDyEhxaxJb2wHRIxo3Egq2LmQc+a7//Jcrvx6LL
   HGnotmJmJ5DBGusGC7HfeS7MZR08iGcJuibJbixGPOnAeFzITDeCieTqO
   rZ0UPSIlA2hIfSljYXrxzW0MWJC9EAwmrJ2RdHEuK3B1PZUFnRbLQ++Ny
   A2cD6P7LKG81kwYhx5ibPVEpBzw7NEVw46AtTsrJwKuPVXiCurhjO+PUs
   w==;
X-CSE-ConnectionGUID: 2r/mzKaRRzeRyDRRsjAeqA==
X-CSE-MsgGUID: DAkV3MVEQd+JcuV4V0u66w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8136965"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8136965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 06:21:21 -0700
X-CSE-ConnectionGUID: Vf8847/kTsqSZCGzmbNEfw==
X-CSE-MsgGUID: eILwEUD/S22W6FwzUD2J4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="57683873"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 06:21:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 60E8A120433;
	Tue,  9 Apr 2024 16:21:16 +0300 (EEST)
Date: Tue, 9 Apr 2024 13:21:16 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 36/38] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
 sub-device routing flag
Message-ID: <ZhVAzBX6udgWZQcs@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-37-sakari.ailus@linux.intel.com>
 <9265171e-b4a7-468e-83b4-51af5e8823dc@ideasonboard.com>
 <ZfFYJTkwld-WIh5Y@kekkonen.localdomain>
 <20240321170308.GK9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321170308.GK9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 07:03:08PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Mar 13, 2024 at 07:39:17AM +0000, Sakari Ailus wrote:
> > On Wed, Mar 13, 2024 at 09:34:13AM +0200, Tomi Valkeinen wrote:
> > > On 13/03/2024 09:25, Sakari Ailus wrote:
> > > > Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
> > > > Such routes cannot be changed and they're always active.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >   Documentation/userspace-api/media/v4l/dev-subdev.rst         | 3 ++-
> > > >   .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
> > > >   include/uapi/linux/v4l2-subdev.h                             | 5 +++++
> > > >   3 files changed, 12 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index 08495cc6f4a6..2f2423f676cf 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -572,7 +572,8 @@ internal pad always has a single stream only (0).
> > > >   Routes from an internal source pad to an external source pad are typically not
> > > >   modifiable but they can be activated and deactivated using the
> > > >   :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > > -on driver capabilities.
> > > > +on driver capabilities. This capatibility is indicated by the
> > > > +:ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag.
> 
> That's not very clear, it sounds like V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> indicates that the route can be enabled/disabled. I'd rewrite this.

I'll use instead:

The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag
indicates that the ``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not
be unset.

> 
> > > >   Interaction between routes, streams, formats and selections
> > > >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > index 08b8d17cef3f..cd7735f9104e 100644
> > > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > @@ -139,6 +139,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > > >       * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > >         - 0x0001
> > > >         - The route is enabled. Set by applications.
> > > > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > > > +      - 0x0002
> > > > +      - The route is immutable. Set by the driver. The
> > > > +	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> > > > +	changed.
> 
> May not be changed and will always be set ?

How about "may not be unset"?

> 
> > > >   Return Value
> > > >   ============
> > > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > > index ca543982460c..7e501cb45e4e 100644
> > > > --- a/include/uapi/linux/v4l2-subdev.h
> > > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > > @@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
> > > >    * on a video node.
> > > >    */
> > > >   #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
> > > > +/*
> > > > + * Is the route immutable. The ACTIVE flag of an immutable route may not be
> > > > + * changed.
> > > > + */
> > > > +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> > > >   /**
> > > >    * struct v4l2_subdev_route - A route inside a subdev
> > > 
> > > Is the route fully immutable? The sink/source stream ID cannot be changed
> > > (or any new fields we might come up with in the future)?
> > 
> > I think the new fields should be considered separately when they're added.
> > This also applies to the stream IDs, I'll add this to the documentation.
> > 
> > The naming of the flag is aligned with MC link flag with a similar purpose.
> > 
> > > Hmm, or would a route with different stream IDs be a, well, different
> > > route...
> > > 
> > > The docs here only talk about the ACTIVE flag. Would
> > > V4L2_SUBDEV_ROUTE_FL_ALWAYS_ACTIVE be a better name, to be more explicit on
> > > the meaning?
> > 
> > I prefer immutable. I wonder what Laurent and Hans think.
> 
> I'm fine with either. IMMUTABLE is shorter, if that makes a difference.
> 

-- 
Kind regards,

Sakari Ailus

