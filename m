Return-Path: <linux-media+bounces-24403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23587A05C6D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4AD1661D6
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506B81F941E;
	Wed,  8 Jan 2025 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUo/i0ka"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E114A82
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342095; cv=none; b=gs6UUNH9nJzoH7osbDvTc+SJGGUFHiSu1v3UNiix/Tu1lYJbWiBQv8PYReJXCAzIhgo7fnpvRyQx+Qq6SYzTNbV8r2e61yXbL929uxMMQQXvBozQQWm1SWJzSsi7P20Ee0n03FJbPmsxCvxjBUyHn3552bHhdTWBjgLy1DpF4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342095; c=relaxed/simple;
	bh=WR/m8QwC6GdoM45BeTzfaaZGeFRzSW0hAaBnGX/9xsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLmaFeRi6UVXiqQlZZToRewAeiirZqlj9McuyoUIzA1Nz440QZwvi/rhOMp6dB/K3NeiIlwHeZM6N0wDxef3DZC361Dv2EkX33HEtjMFiZX1UjIqnbMQWYrh4Wk3O3arCtA4qn83T5r6mKh80n7gvAwigKBH0PKxywe9ZpljC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUo/i0ka; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736342093; x=1767878093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WR/m8QwC6GdoM45BeTzfaaZGeFRzSW0hAaBnGX/9xsU=;
  b=QUo/i0kaBBHjCPnub51wY0eiIuLsTgq5R07zhlZxKJoTYyyqIVTD330o
   iZ9qjFm4D1au/2lDudVSJQkeFQUdB5XzKAMEmm5JuJfhWhdyyeBoa+Xsc
   B8rGbteZhVjb+inRiR1EWtVojXEB4ZdUeJmemMQG0x9Mgpqu68HuDtwIo
   sKfNMHC/200hsrtZCVrwC4t1G1AdyWPWnlyjTGU4MPI85+KqrZbeEbFa3
   1DGs4qCSGPX45sKFvltx/GlhMRye5vZCQc+ro000E8prIU1V+Tahv3ThC
   SblV+AxhAfcs6q03XNO90OziISFwHMgSq2Fp0VpkuGAC0lSybT6ZrG6/a
   A==;
X-CSE-ConnectionGUID: TTJkn6mOR0iR6zi3qO5sFQ==
X-CSE-MsgGUID: gJ7lKzq8RRCfv5Ed2UdzlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36727575"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36727575"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:14:52 -0800
X-CSE-ConnectionGUID: ohYH4ZMLRUSfNSFEf4A2jw==
X-CSE-MsgGUID: +r6v54zJQ0y5IlgGCi8/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="107969067"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:14:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1B0DC11F8DF;
	Wed,  8 Jan 2025 15:14:48 +0200 (EET)
Date: Wed, 8 Jan 2025 13:14:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: Re: [PATCH v8 1/9] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <Z356SAl99JG2aqv-@kekkonen.localdomain>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
 <20241217215445.901459-2-sakari.ailus@linux.intel.com>
 <17c10edf-40b2-491a-873d-65b285d92e09@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c10edf-40b2-491a-873d-65b285d92e09@ideasonboard.com>

Moi,

On Fri, Dec 20, 2024 at 03:09:05PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/12/2024 23:54, Sakari Ailus wrote:
> > v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> > to take struct media_pad argument in order to obtain the link frequency
> > using get_mbus_config() pad op. Prepare for this by allowing struct
> > media_pad as well.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
> >   include/media/v4l2-common.h           | 19 ++++++++++++++++---
> >   2 files changed, 34 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 0a2f4f0d0a07..9fe74c7e064f 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -466,8 +466,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >   }
> >   EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div)
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div)
> >   {
> >   	struct v4l2_ctrl *ctrl;
> >   	s64 freq;
> > @@ -502,7 +502,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> >   	return freq > 0 ? freq : -EINVAL;
> >   }
> > -EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div)
> > +{
> > +	struct v4l2_subdev *sd;
> > +
> > +	sd = media_entity_to_v4l2_subdev(pad->entity);
> > +	if (!sd)
> > +		return -ENODEV;
> > +
> > +	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +}
> > +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +#endif /* CONFIG_MEDIA_CONTROLLER */
> >   /*
> >    * Simplify a fraction using a simple continued fraction decomposition. The
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 63ad36f04f72..fda903bb3674 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   /**
> >    * v4l2_get_link_freq - Get link rate from transmitter
> >    *
> > - * @handler: The transmitter's control handler
> > + * @pad: The transmitter's media pad (or control handler for non-MC users or
> > + *	 compatibility reasons, don't use in new code)
> >    * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
> >    *	 D-PHY, samples per clock on parallel. 0 otherwise.
> >    * @div: The divisor between pixel rate and link frequency. Number of data lanes
> > @@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >    * * %-ENOENT: Link frequency or pixel rate control not found
> >    * * %-EINVAL: Invalid link frequency value
> >    */
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div);
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +#define v4l2_get_link_freq(pad, mul, div)				\
> > +	_Generic(pad,							\
> > +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > +	(pad, mul, div)
> 
> I can't decide if I love or hate _Generic =).

I really like it. It enables certain things that didn't use to be possible
in C, and really helps in transitions like this. We also have
container_of_const() etc. for added constness checking.

> 
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div);
> > +#else
> > +#define v4l2_get_link_freq(handler, mul, div)		\
> > +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> > +#endif
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div);
> >   void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> >   		unsigned int n_terms, unsigned int threshold);
> 
> This makes sense in the transition period. But I wonder, should we later
> have:
> 
> v4l2_get_link_freq(struct v4l2_subdev *sd, unsigned int pad, ...) like all
> the subdev ops? Perhaps not... Subdev ops take subdev as the first argument
> as, well, they're subdev ops.
> 
> It did look to me that in many drivers we already have the source subdev and
> pad stored somewhere, and getting the media_pad to call v4l2_get_link_freq()
> is an extra step.

I could add a couple of macros to cover that need. ;-) But to be fair,
drivers should instead store the media pad of the sensor or even better,
not store it at all but use media_entity_remote_pad_unique() to obtain it
at runtime.

-- 
Terveisin,

Sakari Ailus

