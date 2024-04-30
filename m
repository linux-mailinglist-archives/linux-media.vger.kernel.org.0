Return-Path: <linux-media+bounces-10403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 913308B6B94
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49941C21D83
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1A239877;
	Tue, 30 Apr 2024 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjQtfzdp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B092C184
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462049; cv=none; b=mLVrWBhYkQ4jFf7mOqbwfofkQAkKHIbg89U5cnvE81JLoWp3wu42bn+5QyKCbpymCpB3430WIA+PPf0CgGlWaZXN6WbHQv/rV088vjpcEQFTMW+Ze8Cy9ylj1digSjM7nhYMZZ03LgtHWSZdeNGvbMA7QG0t4HIRVs6qxOGyP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462049; c=relaxed/simple;
	bh=yeuviYibttI+JJtjB7e11Ik3i92RySBg27m7Q3/GDl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih/RGPahKfmvX4U4xL8no7P0QBYZkVm0AMTk0MoUxasheOxdHSTfN2VMON8MvLu+sj5coKPkxr02yLRuXfRhmPbgqta5teHy0AY5o33J8hO//fyIDU75C+AskRTlsUvErEL7meAgDEZkoE3gv3+oiXWqLQjQTcc4fw8RH8yFzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjQtfzdp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714462047; x=1745998047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeuviYibttI+JJtjB7e11Ik3i92RySBg27m7Q3/GDl0=;
  b=CjQtfzdpwRabLy9bBNxtR2kIwuf2QWPd/CUfaQIn6D9Jy8f9HHmKa67L
   TS41YtAHYTyE8//nRa66wDoa2yylvTI03u5XRzs0sqcpcQtnXyM0IjNfY
   oeTUYnAXLBT5G8qx1EmsHJTqpRtzpclIaaviHvcIXmCz5kK0iPflnmyWI
   CZjIY1QQ/JT2BI56BUfiKXxFcXBvXHfY64OPFmSd1JuyDYQm0o2JlwG2K
   n46MOT4CAUMibkrVidUjXYwYNadFbtpBiNJrnXmk9EQMhwLjDXgNoj33n
   ooXU6zqNoX0R4luaFtLQgu+1ZGP14/xY702BIfgSWT+j9MQD+NFewCtN7
   Q==;
X-CSE-ConnectionGUID: dt06MZmyTCOWi1tp2shQvg==
X-CSE-MsgGUID: uZn7UroOQLKzvHpft/uLWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10001671"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10001671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:27:26 -0700
X-CSE-ConnectionGUID: 9GM6OjILSeyph5jU40kDSg==
X-CSE-MsgGUID: qAsjqvLhR8SKQse+hZpaow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26445547"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:27:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D48DC11F830;
	Tue, 30 Apr 2024 10:27:22 +0300 (EEST)
Date: Tue, 30 Apr 2024 07:27:22 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 1/4] media: v4l: Support passing sub-device argument
 to v4l2_get_link_freq()
Message-ID: <ZjCdWg9jnA3XAo5d@kekkonen.localdomain>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-2-sakari.ailus@linux.intel.com>
 <n5gr2rsxbnot7vittbs4mbhsuzmtwqgwlrbzk4ug6yklqyfit5@ts5oyzcc5qpc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n5gr2rsxbnot7vittbs4mbhsuzmtwqgwlrbzk4ug6yklqyfit5@ts5oyzcc5qpc>

Hi Jacopo,

Thanks for the review.

On Tue, Apr 30, 2024 at 09:01:09AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Apr 29, 2024 at 10:08:49PM +0300, Sakari Ailus wrote:
> > v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> > to take struct v4l2_subdev argument in order to obtain the link frequency

This should have been media_pad actually. I'll update the text for v5 (same
in the subject).

> > using get_mbus_config() pad op. Prepare for this by allowing struct
> > v4l2_subdev as well.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Nice! I need exactly something like this to avoid pre-computing a lot
> a frequencies in a driver I'm working on.
> 
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 19 ++++++++++++++++---
> >  include/media/v4l2-common.h           | 14 +++++++++++---
> >  2 files changed, 27 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 4165c815faef..7f69b5a025fa 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -464,8 +464,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
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
> > @@ -500,7 +500,20 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> >
> >  	return freq > 0 ? freq : -EINVAL;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > +
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
> >
> >  /*
> >   * Simplify a fraction using a simple continued fraction decomposition. The
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 63ad36f04f72..d7115cd61a38 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  /**
> >   * v4l2_get_link_freq - Get link rate from transmitter
> >   *
> > - * @handler: The transmitter's control handler
> > + * @pad: The transmitter's media pad (or control handler for compatibility
> > + *	 reasons, don't use in new code)
> >   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
> >   *	 D-PHY, samples per clock on parallel. 0 otherwise.
> >   * @div: The divisor between pixel rate and link frequency. Number of data lanes
> > @@ -541,8 +542,15 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >   * * %-ENOENT: Link frequency or pixel rate control not found
> >   * * %-EINVAL: Invalid link frequency value
> >   */
> > -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> > -		       unsigned int div);
> > +#define v4l2_get_link_freq(pad, mul, div)				\
> > +	_Generic(pad,							\
> > +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > +	(pad, mul, div)
> 
> That's nice and elegant, but given that I count 10 drivers in mainline
> using this function, wouldn't it be better to make them use a pad and
> remove the ctrl_handler version completely to avoid it being used in
> future ?

It'd be nice to add a function that takes the CSI-2 configuration from the
endpoint as well, doing this manually in drivers is awkward and a lot of
extra code. I'm all for this but I'd do this separately, after which we can
remove the above macro.

Note that for the IVSC driver this is a bugfix.

> 
> > +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > +			     unsigned int div);
> > +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > +			      unsigned int mul, unsigned int div);
> >
> >  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> >  		unsigned int n_terms, unsigned int threshold);

-- 
Kind regards,

Sakari Ailus

