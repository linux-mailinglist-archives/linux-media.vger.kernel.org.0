Return-Path: <linux-media+bounces-40323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B820B2CF23
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D65E11BA81A1
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBCC35337B;
	Tue, 19 Aug 2025 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GpraPV1C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F09353371
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755641637; cv=none; b=Wos2rCDw9RqM30bmuWWHiS6yroyVFCUK0S43cjPaWvvSrs7X3Kogpe5+yMgL25qxed+TnFMzz3TQriZL7HWYDIpNAKPbJOedO6E7ZNcszg5xGAepggn6e1dNT45XLeGeXzIGaUW9CQolp+hapo2ZMZ8549Ry1FlHKGF3oV8H0FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755641637; c=relaxed/simple;
	bh=U8e3GIN2Wq6g2OC74/85xTX8IoAHpGjSRt9PXxnktrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQO180sY6G8DNB5bjxR/IOb2cOIqpcEF0zyQvOZk6wXrRhX9hJrydchG3nFd98lwDGoyoyHeHZWse6LNDNHvCgfZRndddINen9A1ZzhGTbg8fB1z4NE1/x1mZYIv0TBkT3DlkMijaEbZ67eah7vA9dO4XCJBaltBZyX1FTqIT7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GpraPV1C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 845C1166C;
	Wed, 20 Aug 2025 00:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755641573;
	bh=U8e3GIN2Wq6g2OC74/85xTX8IoAHpGjSRt9PXxnktrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpraPV1CylqmFX6GxjC3vWiSbiA/zHKyjNVNOHJBe4E4Oq7zykqh+V06lOJR+Zq5D
	 X42vxdzPagy8ImriU8f7BtAErb72XA7S/iSC/K1UAHQaoaeQgDBQm0iRCpDwJ8EaiC
	 Z4fJteibbeoZbDYMfNdxkSHYFIe4ragZmFY0+B/8=
Date: Wed, 20 Aug 2025 01:13:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: v4l2-common: Drop the workaround from
 v4l2_get_link_freq()
Message-ID: <20250819221329.GC25064@pendragon.ideasonboard.com>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
 <20250819094533.2335-3-sakari.ailus@linux.intel.com>
 <20250819163843.GB25064@pendragon.ideasonboard.com>
 <aKTR1rsDUDIZAU-l@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKTR1rsDUDIZAU-l@kekkonen.localdomain>

On Tue, Aug 19, 2025 at 10:34:46PM +0300, Sakari Ailus wrote:
> On Tue, Aug 19, 2025 at 07:38:43PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 19, 2025 at 12:45:32PM +0300, Sakari Ailus wrote:
> > > Remove the workaround that allowed calling v4l2_get_link_freq() on the
> > > control handler.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
> > >  include/media/v4l2-common.h           | 14 ++------------
> > >  2 files changed, 10 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index a5334aa35992..0574f5d685f8 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -512,8 +512,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> > >  
> > > -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > -			      unsigned int mul, unsigned int div)
> > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > +static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > +				   unsigned int mul, unsigned int div)
> > >  {
> > >  	struct v4l2_ctrl *ctrl;
> > >  	s64 freq;
> > > @@ -548,11 +549,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > >  
> > >  	return freq > 0 ? freq : -EINVAL;
> > >  }
> > > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > >  
> > > -#ifdef CONFIG_MEDIA_CONTROLLER
> > > -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > -			     unsigned int div)
> > > +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> > > +		       unsigned int div)
> > >  {
> > >  	struct v4l2_mbus_config mbus_config = {};
> > >  	struct v4l2_subdev *sd;
> > > @@ -571,10 +570,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > >  	 * Fall back to using the link frequency control if the media bus config
> > >  	 * doesn't provide a link frequency.
> > >  	 */
> > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > +	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > >  }
> > > -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > > -#endif /* CONFIG_MEDIA_CONTROLLER */
> > > +EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> > > +#endif
> > 
> > You can now merge the two functions into one.
> 
> I could do that but the end result would be somewhat less clear so I prefer
> keeping the two separate. I don't have a strong opinion though.

I think it would be clearer to keep everything in a single function, but
that's a slight preference. Up to you.

> > >  
> > >  /*
> > >   * Simplify a fraction using a simple continued fraction decomposition. The
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index 39dd0c78d70f..aedcfc81d12b 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -578,19 +578,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> > >   * * %-EINVAL: Invalid link frequency value
> > 
> > The function documentation needs an update, the pad argument's
> > description still mentions control handler. With that,
> 
> What happens with that?

With that I'll be fine with the patch :-)

> I'll fix this for v3.
> 
> > >   */
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > -#define v4l2_get_link_freq(pad, mul, div)				\
> > > -	_Generic(pad,							\
> > > -		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> > > -		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> > > -	(pad, mul, div)
> > > -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > -			     unsigned int div);
> > > -#else
> > > -#define v4l2_get_link_freq(handler, mul, div)		\
> > > -	__v4l2_get_link_freq_ctrl(handler, mul, div)
> > > +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> > > +		       unsigned int div);
> > >  #endif
> > > -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > > -			      unsigned int mul, unsigned int div);
> > >  
> > >  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
> > >  		unsigned int n_terms, unsigned int threshold);

-- 
Regards,

Laurent Pinchart

