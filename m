Return-Path: <linux-media+bounces-10968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B88BDBFB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 09:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34BDCB20D98
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 07:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD2D78C96;
	Tue,  7 May 2024 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sHUGyQxr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020F78C8A;
	Tue,  7 May 2024 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065247; cv=none; b=QfpBcYkHHZNfcjej0vc7iny41HN/ZDZ8Py1xTqZUHTjwPuYKvEC6eWdAMwDYOk+YucfrIW7+qvuzpBHRA7tvUbcwrclQPtXeE255oudLzQvR4U9QvkfqkenrDTFwWH3viFADqkGqwESEV6JosC7jUfMadmodLlwuEiEBDxxv1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065247; c=relaxed/simple;
	bh=XaN3hETb2jl2cA4B5izXN4/lT0Xw9mOoyhCtWYUfVuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nauQbthrhgrzw9z9QN1P/wOAROMKVAzu3O/5xXxdbPCR7uy0ewru6srD9+S3JOO7I+lKcrsK4vjzIqdhDRBvNs/jnyCAIVHKZ6g14OUF0B2pEhvnEsxAtzvOJllL3C2GZ5wvYWZI9NcL9rPAbUEFm1CswI+Y6SgWB6dvfShz9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sHUGyQxr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE2C73D5;
	Tue,  7 May 2024 09:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715065242;
	bh=XaN3hETb2jl2cA4B5izXN4/lT0Xw9mOoyhCtWYUfVuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHUGyQxrL8ObaF6WAqEayyMtABEIzFh/4W7CfmM8MXL/KYTLdhWXZF9p/qSsRZFOu
	 D27yurDSRmjhBK+ogKKrrRylgIek0cqZh64z1sLaEC9p1FOuYC8BAdn1w7nhH/4+iG
	 iI64vXC0yYmWldtOAaSejSI6Q+XnuoTpAtYBvL2I=
Date: Tue, 7 May 2024 10:00:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/2] media: v4l2-subdev: Provide const-aware subdev
 state accessors
Message-ID: <20240507070035.GA27500@pendragon.ideasonboard.com>
References: <20240507060323.26950-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240507060323.26950-2-laurent.pinchart+renesas@ideasonboard.com>
 <1114679f-841e-4dca-92f8-3f4e4735bfac@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1114679f-841e-4dca-92f8-3f4e4735bfac@ideasonboard.com>

On Tue, May 07, 2024 at 09:46:08AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 07/05/2024 09:03, Laurent Pinchart wrote:
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
> > Changes since v1:
> > 
> > - Wrap the accessors with _Generic() using a single macro instead of
> >    adding a _Generic() statement in each of them.
> > ---
> >   include/media/v4l2-subdev.h | 40 +++++++++++++++++++++++++------------
> >   1 file changed, 27 insertions(+), 13 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e30c463d90e5..c8cfa1eaa82f 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> >   #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> >   	__v4l2_subdev_state_get_ ## NAME ## ARG
> >   
> > +/*
> > + * A macro to constify the return value of the state accessors when the state
> > + * parameter is const.
> > + */
> > +#define __v4l2_subdev_state_constify_call(state, value)			\
> > +	_Generic(state,							\
> > +		const typeof(*(state)) *: (const typeof(value))value,	\
> 
> Why is the first typeof not typeof(state)?

Wouldn't that be "const const struct v4l2_subdev_state *" when the state
is const ?

> > +		default: value						\
> > +	)
> 
> For non-const state this expands to:
> 
> _Generic(state,
> 	const struct v4l2_subdev_state *: (const struct valuetype *)value,
> 	default: value
> )
> 
> And for const state:
> 
> _Generic(state,
> 	const const struct v4l2_subdev_state *: (const struct valuetype *)value,
> 	default: value
> )

Indeed it would :-)

> 
> Afaics, that works as the double-const is just considered a single-const, but the
> macro looks like as if you use typeof(state) thinking that it would always produce
> the non-const base type. Also, the macro would not work if the default case was
> "typeof(*(state)) *".

Indeed.

> Is there a reason to use the typeof()? As the result of typeof depends on the state
> type, the macro also changes depending on the state type, which I feel is an extra,
> unnecessary, complication in an already not-so-clear system.
> 
> Why not just use "struct v4l2_subdev_state" directly? Or if typeof() is used, maybe
> explain in a comment that the "double-constifying" is intended, and it happens to
> work because we have the default case (instead of explicit non-const case).

Using the explicit type works for me.

> >   /**
> >    * v4l2_subdev_state_get_format() - Get pointer to a stream format
> >    * @state: subdevice state
> > @@ -1340,16 +1350,17 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> >    */
> >   /*
> >    * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
> >    * macro below is to come up with the name of the function or macro to call,
> >    * using the last two arguments (_stream and _pad). The selected function or
> >    * macro is then called using the arguments specified by the caller. A similar
> >    * arrangement is used for v4l2_subdev_state_crop() and
> >    * v4l2_subdev_state_compose() below.
> >    */
> > -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_format(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >   #define __v4l2_subdev_state_get_format_pad(state, pad)	\
> >   	__v4l2_subdev_state_get_format(state, pad, 0)
> >   struct v4l2_mbus_framefmt *
> > @@ -1368,9 +1379,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> >    * For stream-unaware drivers the crop rectangle for the corresponding pad is
> >    * returned. If the pad does not exist, NULL is returned.
> >    */
> > -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >   #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> >   	__v4l2_subdev_state_get_crop(state, pad, 0)
> >   struct v4l2_rect *
> > @@ -1389,9 +1401,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >    * For stream-unaware drivers the compose rectangle for the corresponding pad is
> >    * returned. If the pad does not exist, NULL is returned.
> >    */
> > -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >   #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> >   	__v4l2_subdev_state_get_compose(state, pad, 0)
> >   struct v4l2_rect *
> > @@ -1410,9 +1423,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> >    * For stream-unaware drivers the frame interval for the corresponding pad is
> >    * returned. If the pad does not exist, NULL is returned.
> >    */
> > -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
> > +	__v4l2_subdev_state_constify_call(state,				\
> > +		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
> >   #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
> >   	__v4l2_subdev_state_get_interval(state, pad, 0)
> >   struct v4l2_fract *

-- 
Regards,

Laurent Pinchart

