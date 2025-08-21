Return-Path: <linux-media+bounces-40555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49DB2F5CE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749A21CC645F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0AF2F0C43;
	Thu, 21 Aug 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOpXbvE6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663B13A265
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755774109; cv=none; b=M5wu6/jqhcIc62Q8gtlGNuMGlgLYMCFHgvCrErWgZ/HBUEpncWUecFpM8JtUE7wu03JthbyH8seB6zlHoYJNk2uFHjxPvuGcEuDRUfQ+55E9NwHrLq0vSfFfgT9jw84a7SG/n5TZwUdyP4Z7bT6ztTDOTZVT95Bm5mcTsVTiJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755774109; c=relaxed/simple;
	bh=9mXm5qVkOBVcG6N+khFP326bcjBrYajXA39TGMUx1Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtI+OgoioNybDGJaiirquq50eroQNwK7bGyQNVwyBacv+cWCEB8/WejD+QNMCGfUgZ00irFTMiMh9chNA+3GRcEQxUb89UnKu7bdrOy2iSLSSN1DkMYojghpO6cl1WOgB6em9QK/pKej3UWoRF1W5wXM3YFx0/uXk0rp0b7XvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOpXbvE6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755774108; x=1787310108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9mXm5qVkOBVcG6N+khFP326bcjBrYajXA39TGMUx1Q8=;
  b=fOpXbvE6aIFdvpFS7vN8N3GqNlAVrHufBpQrnCwFGVb22m5b99K1sdPX
   bONyqoJGl+1KVXp5XtgC/+a+d9H8bcx7IF932zSw5HagvYhGlbtNm1Kzt
   gdYYtX8YpSd20Ohq6G+MdhyDMxLKPH29r4sAd2kISDPLQDJlrdAjgoCPy
   dL1QUKj9XHM0KOewD3GlypdJSqEjwTC61KXTmgmWHdvmkh+I9z5V0kS6v
   FYHSsqo1Z9jP4XXfpwcYrMgotdM3Gc8P+0ND2BqZGYw+2GFCMdG7OcMFU
   86HhkVrMdMH4jghEI40CElsxad39EdsPGWPknFLQJJX827xSRFzwuL9wZ
   w==;
X-CSE-ConnectionGUID: IGb8nhO/R+euhxz8k8NuyA==
X-CSE-MsgGUID: q7bc5NL4TGK+L4IlAb5l+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58128980"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58128980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 04:01:47 -0700
X-CSE-ConnectionGUID: wR5TnjbjQmK4pr5LjMRwIg==
X-CSE-MsgGUID: MP7f3CsbSlO3sLYq1mlyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="205565003"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 04:01:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E23E511FC36;
	Thu, 21 Aug 2025 14:01:40 +0300 (EEST)
Date: Thu, 21 Aug 2025 14:01:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: v4l2-common: Drop the workaround from
 v4l2_get_link_freq()
Message-ID: <aKb8lP7ZvnJmvvMR@kekkonen.localdomain>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
 <20250819094533.2335-3-sakari.ailus@linux.intel.com>
 <20250819163843.GB25064@pendragon.ideasonboard.com>
 <aKTR1rsDUDIZAU-l@kekkonen.localdomain>
 <20250819221329.GC25064@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819221329.GC25064@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Aug 20, 2025 at 01:13:29AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 19, 2025 at 10:34:46PM +0300, Sakari Ailus wrote:
> > On Tue, Aug 19, 2025 at 07:38:43PM +0300, Laurent Pinchart wrote:
> > > On Tue, Aug 19, 2025 at 12:45:32PM +0300, Sakari Ailus wrote:
> > > > Remove the workaround that allowed calling v4l2_get_link_freq() on the
> > > > control handler.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
> > > >  include/media/v4l2-common.h           | 14 ++------------
> > > >  2 files changed, 10 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > index a5334aa35992..0574f5d685f8 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > @@ -512,8 +512,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> > > >  
> > > > -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > > -			      unsigned int mul, unsigned int div)
> > > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > > +static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > > +				   unsigned int mul, unsigned int div)
> > > >  {
> > > >  	struct v4l2_ctrl *ctrl;
> > > >  	s64 freq;
> > > > @@ -548,11 +549,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > >  
> > > >  	return freq > 0 ? freq : -EINVAL;
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > > >  
> > > > -#ifdef CONFIG_MEDIA_CONTROLLER
> > > > -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > > -			     unsigned int div)
> > > > +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> > > > +		       unsigned int div)
> > > >  {
> > > >  	struct v4l2_mbus_config mbus_config = {};
> > > >  	struct v4l2_subdev *sd;
> > > > @@ -571,10 +570,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > >  	 * Fall back to using the link frequency control if the media bus config
> > > >  	 * doesn't provide a link frequency.
> > > >  	 */
> > > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > > +	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > > > -#endif /* CONFIG_MEDIA_CONTROLLER */
> > > > +EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > > > +#endif
> > > 
> > > You can now merge the two functions into one.
> > 
> > I could do that but the end result would be somewhat less clear so I prefer
> > keeping the two separate. I don't have a strong opinion though.
> 
> I think it would be clearer to keep everything in a single function, but
> that's a slight preference. Up to you.

Ack. I keep it as-is for now.

> 
> > > >  
> > > >  /*
> > > >   * Simplify a fraction using a simple continued fraction decomposition. The
> > > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > > index 39dd0c78d70f..aedcfc81d12b 100644
> > > > --- a/include/media/v4l2-common.h
> > > > +++ b/include/media/v4l2-common.h
> > > > @@ -578,19 +578,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> > > >   * * %-EINVAL: Invalid link frequency value
> > > 
> > > The function documentation needs an update, the pad argument's
> > > description still mentions control handler. With that,
> > 
> > What happens with that?
> 
> With that I'll be fine with the patch :-)

\o/

-- 
Regards,

Sakari Ailus

