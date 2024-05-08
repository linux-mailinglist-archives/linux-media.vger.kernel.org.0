Return-Path: <linux-media+bounces-11172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF558C0601
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA413284492
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F5B13175B;
	Wed,  8 May 2024 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uy3aoBW9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2D130A58;
	Wed,  8 May 2024 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202179; cv=none; b=K/hJoDh0kL1VW3lr7p5YEJKy9WydoFsCvOxU6cvFIoRQJsymHGPGH4cdbP7tvRLWlzbA81i5YqODIgCIlWzUK9Nd66JeyCfzNGI/e6nny2Dx+jy4zx2GD8ihVw2QDsBxW7ZRRlj7vRFw0/CTp9TOyFE2SgUL8ieR2GCn584jHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202179; c=relaxed/simple;
	bh=7rRTIapHt6sGqrwX4oB+GqHFUHj6eUfnAVCac5/PhDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p096r9u9W14+JXbfbK7pzHl5rehpCVZWlSEu1AXQvtSd/+G+wm+ZsmAdyzdb2GsxIBPSi3M2D5zuCzcD9mTTUYDKnvdvx3zSmjRz4HDfOvXJyXQBSYA/de+UGXAzJEDFNdjc3dPo0eXHW2IH3DKQp1FIWB12/8B/AU63/UMnZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uy3aoBW9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C3E716D4;
	Wed,  8 May 2024 23:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715202171;
	bh=7rRTIapHt6sGqrwX4oB+GqHFUHj6eUfnAVCac5/PhDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uy3aoBW91sH8N54AwJDqdsYGSM+Ed4zvBTC1xtihs6TC36RqQgEX05xqD69sw1Nnk
	 RUaVPOb/iHZQ48EcYHFTly7KWs2nWBvDmZvJJpThb+hDbXJXztdWzVYAYO8uWJ54iY
	 BVW9ALL3OVq/jqq5rHBncIHdS2817aXG4qa1Smzo=
Date: Thu, 9 May 2024 00:02:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Provide const-aware subdev
 state accessors
Message-ID: <20240508210245.GA13978@pendragon.ideasonboard.com>
References: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>
 <ZjvIGDaAAGK0WJo1@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjvIGDaAAGK0WJo1@valkosipuli.retiisi.eu>

On Wed, May 08, 2024 at 06:44:40PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the update.
> 
> This is starting to look very nice. A few comments below...

Thanks :-)

> On Tue, May 07, 2024 at 07:19:06PM +0300, Laurent Pinchart wrote:
> > It would be useful to mark instances of v4l2_subdev_state structures as
> > const when code needs to access them read-only. This isn't currently
> > possible, as the v4l2_subdev_state_get_*() accessor functions take a
> > non-const pointer to the state.
> > 
> > Use _Generic() to provide two different versions of the accessors, for
> > const and non-const states respectively. The former returns a const
> > pointer to the requested format, rectangle or interval, implementing
> > const-correctness. The latter returns a non-const pointer, preserving
> > the current behaviour for drivers.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Specify types explicitly in _Generic() expression
> > - Fix cast of value to const pointer
> > 
> > Changes since v1:
> > 
> > - Wrap the accessors with _Generic() using a single macro instead of
> >   adding a _Generic() statement in each of them.
> > ---
> >  include/media/v4l2-subdev.h | 40 +++++++++++++++++++++++++------------
> >  1 file changed, 27 insertions(+), 13 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e30c463d90e5..cd3e9e2ebe4d 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> >  #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> >  	__v4l2_subdev_state_get_ ## NAME ## ARG
> >  
> > +/*
> > + * A macro to constify the return value of the state accessors when the state
> > + * parameter is const.
> > + */
> > +#define __v4l2_subdev_state_constify_call(state, value)				\
> 
> This function just changes the return value constness. How about calling it
> e.g. __v4l2_subdev_state_constify_ret instead?

Fine with me.

> Either way,
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> > +	_Generic(state,								\
> > +		const struct v4l2_subdev_state *: (const typeof(*(value)) *)(value), \
> > +		struct v4l2_subdev_state *: (value)				\
> > +	)
> > +
> >  /**
> >   * v4l2_subdev_state_get_format() - Get pointer to a stream format
> >   * @state: subdevice state
> > @@ -1340,16 +1350,17 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> >   */
> >  /*
> >   * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
> >   * macro below is to come up with the name of the function or macro to call,
> >   * using the last two arguments (_stream and _pad). The selected function or
> >   * macro is then called using the arguments specified by the caller. A similar
> >   * arrangement is used for v4l2_subdev_state_crop() and
> >   * v4l2_subdev_state_compose() below.
> 
> These function names are missing _get after the prefix.
> 
> Could you also add the interval function here, too?
> 
> The would fit well for a separate patch.

I'll drop the change above and will fix the whole paragraph in a
separate patch.

> >   */
> > -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_format(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >  #define __v4l2_subdev_state_get_format_pad(state, pad)	\
> >  	__v4l2_subdev_state_get_format(state, pad, 0)
> >  struct v4l2_mbus_framefmt *
> > @@ -1368,9 +1379,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> >   * For stream-unaware drivers the crop rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >  #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> >  	__v4l2_subdev_state_get_crop(state, pad, 0)
> >  struct v4l2_rect *
> > @@ -1389,9 +1401,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >   * For stream-unaware drivers the compose rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >  #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> >  	__v4l2_subdev_state_get_compose(state, pad, 0)
> >  struct v4l2_rect *
> > @@ -1410,9 +1423,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> >   * For stream-unaware drivers the frame interval for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >  #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
> >  	__v4l2_subdev_state_get_interval(state, pad, 0)
> >  struct v4l2_fract *

-- 
Regards,

Laurent Pinchart

