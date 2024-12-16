Return-Path: <linux-media+bounces-23457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAE9F2C10
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133501888E76
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB381FFC61;
	Mon, 16 Dec 2024 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8xLag8T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258801FFC41
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338290; cv=none; b=BbZ78uAOjsfl7eUTKncWXJOtukn7eT+aogkCBGK9VcBMTbRhOjolT0aqP+gmGwoxluV25mS4sWnnZE0z0aiLKXVHsGxMQKgrxwtGNf4W79TkY4c7es1rE5eyJ6XP0THIppJF0CdQ2Qf0UJqR2x1O0ub1JYO1bdtEg1nZ4WPLqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338290; c=relaxed/simple;
	bh=i6sr9V7DJu7Sh64g4qfRTKuVtRdIjjL10qeE/IxNg1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H20O4W5nxU+IuSH7r9VSZ5zTArWJhdxAvedBvBY1tkLdbR4hKtat9ii270EY5GUqrj+JkftMaO0fu1zbtx18PPIQFQUTg8ciXz+0AjRZ/00mC789NUHo6kpr4QUsCxZbyNxD19975VajQjwdQS8Ifxrz0tfGfBtE3gNJN3S5xXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8xLag8T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734338289; x=1765874289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6sr9V7DJu7Sh64g4qfRTKuVtRdIjjL10qeE/IxNg1k=;
  b=S8xLag8TnkzhD+STp70dcb9UYbsfAd0L4+Y/O9XvSzXQCk5M2ezCkw2+
   KWSndFi2mcN3Uqhi8bVqpfD9qz7C1/84bpv+ywR6ogawwxus4isjkaftg
   Y0NmBZ6N6ypXZ8FWpzc6KQQp2cTBVRc4x9h5Sm7KakptBRq6krNjv56wJ
   Re6rR2TSkOKQ/iEC3K8ENS2JX4CqxW9svWsAPlp0t2qgOKas/y/mtsyYW
   8N+Gtim5TIAjKiW9yyiUjIMHRE4mI/GfHucJZykOemCXAfLhe41CKYQpF
   yPnUpbhPATPNCoPTjvXxjy6d44UHv1c+pzGoNZT/UdmpOb6h1KwYWsqt1
   g==;
X-CSE-ConnectionGUID: a83iTKBDTg2ZIF7RdGZCzw==
X-CSE-MsgGUID: efLor0IqTZC5EgnwjlIaIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46122237"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46122237"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:38:08 -0800
X-CSE-ConnectionGUID: bgRju02gSeCwOXGvsLd7Xg==
X-CSE-MsgGUID: T3appf1NQMO0mJo0pVIRIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97180421"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:38:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1148911F9F7;
	Mon, 16 Dec 2024 10:38:04 +0200 (EET)
Date: Mon, 16 Dec 2024 08:38:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 1/5] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <Z1_m7Po01KAy8otg@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-2-sakari.ailus@linux.intel.com>
 <20241215164523.GF9975@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215164523.GF9975@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Dec 15, 2024 at 06:45:23PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Dec 10, 2024 at 09:59:02AM +0200, Sakari Ailus wrote:
> > v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> > to take struct media_pad argument in order to obtain the link frequency
> > using get_mbus_config() pad op. Prepare for this by allowing struct
> > media_pad as well.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
> >  include/media/v4l2-common.h           | 19 ++++++++++++++++---
> >  2 files changed, 34 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 0a2f4f0d0a07..9fe74c7e064f 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -466,8 +466,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> >  
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div)
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div)
> >  {
> >  	struct v4l2_ctrl *ctrl;
> >  	s64 freq;
> > @@ -502,7 +502,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> >  
> >  	return freq > 0 ? freq : -EINVAL;
> >  }
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
> >  
> >  /*
> >   * Simplify a fraction using a simple continued fraction decomposition. The
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 63ad36f04f72..fda903bb3674 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  /**
> >   * v4l2_get_link_freq - Get link rate from transmitter
> >   *
> > - * @handler: The transmitter's control handler
> > + * @pad: The transmitter's media pad (or control handler for non-MC users or
> > + *	 compatibility reasons, don't use in new code)
> >   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
> >   *	 D-PHY, samples per clock on parallel. 0 otherwise.
> >   * @div: The divisor between pixel rate and link frequency. Number of data lanes
> > @@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   * * %-ENOENT: Link frequency or pixel rate control not found
> >   * * %-EINVAL: Invalid link frequency value
> >   */
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div);
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +#define v4l2_get_link_freq(pad, mul, div)				\
> > +	_Generic(pad,							\
> > +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > +	(pad, mul, div)
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div);
> > +#else
> > +#define v4l2_get_link_freq(handler, mul, div)		\
> > +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> > +#endif
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div);
> 
> Let's avoid this complexity by patching callers. I'm OK with this patch
> as a temporary measure, but the series should end with a patch that
> removes the ability to pass a control handler.

I intend to do that. However new drivers are being merged and the set has
been around since the spring and it fixes an issue in the IVSC driver (not
being able to convey the link frequency).

Therefore I prefer to get this merged now and then convert the rest of the
users.

> 
> >  
> >  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> >  		unsigned int n_terms, unsigned int threshold);
> 

-- 
Regards,

Sakari Ailus

