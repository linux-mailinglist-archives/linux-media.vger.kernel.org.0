Return-Path: <linux-media+bounces-40317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F25B2CD08
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 21:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8AF728311
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 19:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0345B32C335;
	Tue, 19 Aug 2025 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxkWCNQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C61248F77
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632094; cv=none; b=jolO5qtSC/tCxMrl6VSrK4+3U7ufpBiuWquQTEvgdLBOI9P8Ye0/ClouN1QJRlBXKeyK0Dv795cKDiJGqwLunkz1ONIGXfGErZ3VgDOP65HqnwMesghFejrKamtda2S5wgdyHpyyyQxdSYXm/XhLnUg3TK4qWv899F2TkMTdD7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632094; c=relaxed/simple;
	bh=JgIIbB8i9SrmJ8ectsOPcCQ1KlVBnhnBYMUKtGFk72M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAaBUlkpVsCXKhMCX94poOI1zcN/nEHUnVkkEIzmW8CAZ4F7G+a6L/7fnQw3qY+pSCIBWQII+nhoXhiCrL8rz4A0w4NzJ1k0Or2PtyHioOoJCuLCyvSr6by1xbBF8HZi6FF09DRkREBo+qJIajStLVbNmdL4LQg7wtenbKNYrIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxkWCNQ8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755632093; x=1787168093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JgIIbB8i9SrmJ8ectsOPcCQ1KlVBnhnBYMUKtGFk72M=;
  b=RxkWCNQ8r1q23xYgM2U1CIdKq+5Dl3h7h302Pyn8FafSYJNHC9ZeOpBB
   BcuhWh5qbg4Zy/ybdU5MeopjZuBxcGHhtWOaA2SdoybiwojgXK+vS4pz0
   PwmYxT1dLn10QGPEWx2bc3HfBkuPwQtq4vbLHB4f9FYIKN21Sd2cDVF8u
   C1fE0uXYQBtqFl67uCCRqy7kzovQzVOhdwGlLCUY9H0FJyRTnwHgkRSPw
   DAaP9zU+JGc8a3JL2Sr+5gzCs1ofpS2n+wUWEqAn4Zpoavs4EJQYaiXBm
   CQBaAOiAcPe5gRLNAekguumw/6zwAtua9PhFPEtDqnVqgF/8qMZdSzFNX
   Q==;
X-CSE-ConnectionGUID: EkTwRWwBT+OCcTw/Ia/idg==
X-CSE-MsgGUID: 487Tk0HmTwurLw5UBo57mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75341477"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="75341477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:34:52 -0700
X-CSE-ConnectionGUID: 3rt/yZU6Q4OzHyHeWDe5kw==
X-CSE-MsgGUID: OxgueF14REK1MB3OYSZwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198932941"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.235])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:34:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B4C79121F96;
	Tue, 19 Aug 2025 22:34:46 +0300 (EEST)
Date: Tue, 19 Aug 2025 22:34:46 +0300
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
Message-ID: <aKTR1rsDUDIZAU-l@kekkonen.localdomain>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
 <20250819094533.2335-3-sakari.ailus@linux.intel.com>
 <20250819163843.GB25064@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819163843.GB25064@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Tue, Aug 19, 2025 at 07:38:43PM +0300, Laurent Pinchart wrote:
> On Tue, Aug 19, 2025 at 12:45:32PM +0300, Sakari Ailus wrote:
> > Remove the workaround that allowed calling v4l2_get_link_freq() on the
> > control handler.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
> >  include/media/v4l2-common.h           | 14 ++------------
> >  2 files changed, 10 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index a5334aa35992..0574f5d685f8 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -512,8 +512,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> >  
> > -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > -			      unsigned int mul, unsigned int div)
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +				   unsigned int mul, unsigned int div)
> >  {
> >  	struct v4l2_ctrl *ctrl;
> >  	s64 freq;
> > @@ -548,11 +549,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> >  
> >  	return freq > 0 ? freq : -EINVAL;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> >  
> > -#ifdef CONFIG_MEDIA_CONTROLLER
> > -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > -			     unsigned int div)
> > +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> > +		       unsigned int div)
> >  {
> >  	struct v4l2_mbus_config mbus_config = {};
> >  	struct v4l2_subdev *sd;
> > @@ -571,10 +570,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  	 * Fall back to using the link frequency control if the media bus config
> >  	 * doesn't provide a link frequency.
> >  	 */
> > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > -#endif /* CONFIG_MEDIA_CONTROLLER */
> > +EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > +#endif
> 
> You can now merge the two functions into one.

I could do that but the end result would be somewhat less clear so I prefer
keeping the two separate. I don't have a strong opinion though.

> 
> >  
> >  /*
> >   * Simplify a fraction using a simple continued fraction decomposition. The
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 39dd0c78d70f..aedcfc81d12b 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -578,19 +578,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   * * %-EINVAL: Invalid link frequency value
> 
> The function documentation needs an update, the pad argument's
> description still mentions control handler. With that,

What happens with that?

I'll fix this for v3.

> 
> >   */
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> > -#define v4l2_get_link_freq(pad, mul, div)				\
> > -	_Generic(pad,							\
> > -		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > -		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > -	(pad, mul, div)
> > -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > -			     unsigned int div);
> > -#else
> > -#define v4l2_get_link_freq(handler, mul, div)		\
> > -	__v4l2_get_link_freq_ctrl(handler, mul, div)
> > +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> > +		       unsigned int div);
> >  #endif
> > -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > -			      unsigned int mul, unsigned int div);
> >  
> >  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> >  		unsigned int n_terms, unsigned int threshold);
> 

-- 
Kind regards,

Sakari Ailus

