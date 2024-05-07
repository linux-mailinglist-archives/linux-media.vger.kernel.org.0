Return-Path: <linux-media+bounces-10964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C438BDB0E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856511F22BE6
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 06:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1581A6E602;
	Tue,  7 May 2024 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DDmOJhpR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729D6BFD5;
	Tue,  7 May 2024 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061875; cv=none; b=T6PEtJIuyKoX4ZkGobxXeZGGogWkyMcUo6yLGKcHZhDr0QZqDYhifWihmtH0QfJiMgVg/y/sRf4+yvE2gz0Uvr2YgODcfzRB6vr+SXE42TBxHvfP4G0ZpcK1ErDqulPuOKIOjVMFi1F0SQ843uEwWRyKnkXbRY2eK19fQbjE6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061875; c=relaxed/simple;
	bh=RAPmK72phmkriSbjoQmb+/8N9Rmmk6IR6aCJ9mNc7W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKnnIATgLYAfudvWuZFlkbp4t75VD614tXcuLdnzZBK/DaQNamHhniuislmRRzXVFbwVLx/iztONdVvKPW243aT1gCxc0TadoEksUMXfnnCFE7iyc34JrexSkftviEET17T4rtiEMbCxcg8yIQHqUbnzGYqUz1+DpeCHT3uWCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DDmOJhpR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24F523D5;
	Tue,  7 May 2024 08:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715061870;
	bh=RAPmK72phmkriSbjoQmb+/8N9Rmmk6IR6aCJ9mNc7W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDmOJhpR0xyBItft6dgXe+lt/5pkKB+cpas5CWwK3kY+hhK/Hx9Mv1yHrgc2kDuCx
	 FW3CRlteozWHOEGBm2BhYa/3dfQaxbb6B9NFJQT/u2e+mpwmPQrEXDnPy/bDE39161
	 j/P33BtiJc28ghI/iwjM59qJ/oxY7Rc1fgK8Dx8E=
Date: Tue, 7 May 2024 09:04:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] media: v4l2-subdev: Provide const-aware subdev state
 accessors
Message-ID: <20240507060424.GE26689@pendragon.ideasonboard.com>
References: <20240506175255.24394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240506175255.24394-2-laurent.pinchart+renesas@ideasonboard.com>
 <ZjlRTuivOz2JUpcc@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjlRTuivOz2JUpcc@valkosipuli.retiisi.eu>

On Mon, May 06, 2024 at 09:53:18PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the patch.
> 
> On Mon, May 06, 2024 at 08:52:54PM +0300, Laurent Pinchart wrote:
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
> > Bike-shedding about names and the 4 leading underscores is allowed (and
> > expected).
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 24 +++++-----
> >  include/media/v4l2-subdev.h           | 66 ++++++++++++++++++---------
> >  2 files changed, 57 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 83c6d1e36871..af1fbc28c8f0 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1616,8 +1616,8 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> >  
> >  struct v4l2_mbus_framefmt *
> > -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > -			       unsigned int pad, u32 stream)
> > +____v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > +				 unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1647,11 +1647,11 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> > +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_format);
> >  
> >  struct v4l2_rect *
> > -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream)
> > +____v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > +			       u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1681,11 +1681,11 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> > +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_crop);
> >  
> >  struct v4l2_rect *
> > -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > -				unsigned int pad, u32 stream)
> > +____v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > +				  unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1715,11 +1715,11 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> > +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_compose);
> >  
> >  struct v4l2_fract *
> > -__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> > -				 unsigned int pad, u32 stream)
> > +____v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> > +				   unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1751,7 +1751,7 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
> > +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_interval);
> >  
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e30c463d90e5..ba722ab501c1 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1340,21 +1340,27 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
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
> >   */
> > -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > +#define v4l2_subdev_state_get_format(state, pad, ...)				\
> > +	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)		\
> >  		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> > +#define __v4l2_subdev_state_get_format_pad(state, pad)				\
> >  	__v4l2_subdev_state_get_format(state, pad, 0)
> > +#define __v4l2_subdev_state_get_format(state, pad, stream)			\
> > +	_Generic(state,								\
> > +		const struct v4l2_subdev_state *: ((const struct v4l2_mbus_framefmt *)	\
> > +			____v4l2_subdev_state_get_format((struct v4l2_subdev_state *)state, pad, stream)), \
> > +		default: ____v4l2_subdev_state_get_format((struct v4l2_subdev_state *)state, pad, stream) \
> > +	)
> >  struct v4l2_mbus_framefmt *
> > -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > -			       unsigned int pad, u32 stream);
> > +____v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > +				 unsigned int pad, u32 stream);
> >  
> >  /**
> >   * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> > @@ -1368,14 +1374,20 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> >   * For stream-unaware drivers the crop rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
> > +	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)		\
> >  		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> > +#define __v4l2_subdev_state_get_crop_pad(state, pad)				\
> >  	__v4l2_subdev_state_get_crop(state, pad, 0)
> > +#define __v4l2_subdev_state_get_crop(state, pad, stream)			\
> > +	_Generic(state,								\
> > +		const struct v4l2_subdev_state *: ((const struct v4l2_rect *)		\
> > +			____v4l2_subdev_state_get_crop((struct v4l2_subdev_state *)state, pad, stream)), \
> > +		default: ____v4l2_subdev_state_get_crop((struct v4l2_subdev_state *)state, pad, stream) \
> > +	)
> >  struct v4l2_rect *
> > -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream);
> > +____v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > +			       u32 stream);
> >  
> >  /**
> >   * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> > @@ -1389,14 +1401,20 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >   * For stream-unaware drivers the compose rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
> > +	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)		\
> >  		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> > +#define __v4l2_subdev_state_get_compose_pad(state, pad)				\
> >  	__v4l2_subdev_state_get_compose(state, pad, 0)
> > +#define __v4l2_subdev_state_get_compose(state, pad, stream)			\
> > +	_Generic(state,								\
> > +		const struct v4l2_subdev_state *: ((const struct v4l2_rect *)		\
> > +			____v4l2_subdev_state_get_compose((struct v4l2_subdev_state *)state, pad, stream)), \
> > +		default: ____v4l2_subdev_state_get_compose((struct v4l2_subdev_state *)state, pad, stream) \
> > +	)
> >  struct v4l2_rect *
> > -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > -				unsigned int pad, u32 stream);
> > +____v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > +				  unsigned int pad, u32 stream);
> >  
> >  /**
> >   * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
> > @@ -1410,14 +1428,20 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> >   * For stream-unaware drivers the frame interval for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
> > +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)		\
> >  		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_interval_pad(state, pad)	\
> > +#define __v4l2_subdev_state_get_interval_pad(state, pad)			\
> >  	__v4l2_subdev_state_get_interval(state, pad, 0)
> > +#define __v4l2_subdev_state_get_interval(state, pad, stream)			\
> > +	_Generic(state,								\
> > +		const struct v4l2_subdev_state *: ((const struct v4l2_frac *)		\
> > +			____v4l2_subdev_state_get_interval((struct v4l2_subdev_state *)state, pad, stream)), \
> > +		default: ____v4l2_subdev_state_get_interval((struct v4l2_subdev_state *)state, pad, stream) \
> 
> Is the cast necessary in the latter case? It would seem like we lose most
> of the type safety checks as a result.

It is, and I was surprised by it. The reason is that all branches of the
_Generic statement must compile, even the ones that are not selected.
When the macro is called with a const state, the first branch is taken,
but the second branch must compile too. Without the cast, the compiler
complains that the state argument passed to
____v4l2_subdev_state_get_interval() is const.

> Could this be implemented using a similar arrangement than the gen_call
> macro above, so that we wouldn't have three very similar sets of macros
> here?

I've sent a v2 that does that.

> > +	)
> >  struct v4l2_fract *
> > -__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> > -				 unsigned int pad, u32 stream);
> > +____v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> > +				   unsigned int pad, u32 stream);
> >  
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  

-- 
Regards,

Laurent Pinchart

