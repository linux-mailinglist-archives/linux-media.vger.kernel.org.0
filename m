Return-Path: <linux-media+bounces-10932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824238BD733
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 387BC28560F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D4315F413;
	Mon,  6 May 2024 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="cIWDZWUF"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66A15F323;
	Mon,  6 May 2024 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032443; cv=pass; b=ba04QkUEcpaN0/kI9Xr1etunG2ILBd3kgVMeTmjO8WXsIwCUOCgioIHBObgZ5KyWgvtK15qOi3X00B26z2JbPQtd94M0+Gp+YrMXMPFROkXWaxjBo4EoUEKEPUx6rROWQA1z12lIz92rHuJXGCMeivS4+a0s+y6Bc1rHIhan1K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032443; c=relaxed/simple;
	bh=kvYjL2fbWXlFedeubfTUMXk6pBc9mrY9y4N7n5q3LiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1utFzb7F7er92K9aOq6OFeoadjarlE2mfdCUvW5I5Xxnul3mpVUtlvBMQvckEYLcWH65N520cbtYPs58jf50V6eyw/WU4x5n98ewWqjiTrnoXZIXb0QzWLtmevP9oB6G6U5y16FQPjMiFOwBNGbUuHCi256WUo933QhHSMd11w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=cIWDZWUF; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VYFXt2hVwz49Q40;
	Tue,  7 May 2024 00:53:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1715032431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4a715wTl66STY2c8GUrlROd2W9Mkx2o+9vZuugba41I=;
	b=cIWDZWUFcoNZcCsqf1pvUl+LslG2d4sSuP8qzHf0Ud9lPQjmbuFKFBgxHdh1Ge6j0uL6hu
	8uO4ZZ7NT8DZVmqVnVpJ/FjpqBQCkNGuBNjP3mY2EvC2tIXUWaSZfXgaNsangaH5QeGm5n
	+8qvT+pQaQ5o9DFG8h57Lo3FuHtILIkjsL2a1ERUAWE6/vU7GhWcgtAzCzVy472WfQ5j7A
	aLqRDjUSzhIYjIyXZLNUu7ORVW6jjh9RCafBi0rytOq8E4885qdkGAUIGu8SifHVxavvyX
	mFBOMGQq3+GU5gD0o9ZlxmygnC4doX5426cgAYjyWu0EVgrfb2ki6h1+7XrGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1715032431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4a715wTl66STY2c8GUrlROd2W9Mkx2o+9vZuugba41I=;
	b=EccMcL668KdDJZfkqISLQQUJfL25fUWDLY5Wd2C5r0F7rNouQPE44pVMg7Y2ny1a4URMa6
	NAJbywgmUMn9ljtX843Rj4ZS6dUFI8QBzX/mjC0R9hwaLTunuZR7rwvvzoy8RZqKi9BD6b
	Q/rdukk1ECbsH/gGugnMJa9iSbseXh9V3VE4FuNsVbM1dL/ETIfMchig+Z9c4jrBR4VJ7x
	fQWhyy2B1gjORlAJiiWyDA5CrBiWTXQp121qjrUpI67SJZKxQrBp/ZWdxQIFarME3HtD1U
	8pes04infogmRlFNjzs07TnfhHlEtD+5MRCPXyjyc9nZG1WCyK0LZmnaQwPhBw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1715032431; a=rsa-sha256;
	cv=none;
	b=MniEThQ3FlTM6Nhy/mUHdWGrGrsgnMcP5RsGh6P4TiQLnhEnaksMjgmAnsRYhvTRFHy1vQ
	o3jZfjA3iei8NEvIqkYJvzv4pBd5I/vfZWK+KWLDOvMmsaOoAjxWQwqxHT7Rzj5++kVUng
	2mROfT3q+TDVBI74rE23gNSaSJl5npsGj8OQKgkvD/xujanJ1bOK90iAAmfprRx3d5IXxW
	k92ck1kc7msqEr/ooPEMi4Vo6jOOMVuWRiQ+C4WietxDm2rJ2lzoaWIIVt2t9wbxf9SQT2
	vBTAgl6Q0nrutJLshRqPVsXhGX+oYOYEJz3kUlz7PlF4jzyOvz86pBmHCZ6JLQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 20193634CA1;
	Tue,  7 May 2024 00:53:19 +0300 (EEST)
Date: Mon, 6 May 2024 21:53:18 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] media: v4l2-subdev: Provide const-aware subdev state
 accessors
Message-ID: <ZjlRTuivOz2JUpcc@valkosipuli.retiisi.eu>
References: <20240506175255.24394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240506175255.24394-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506175255.24394-2-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for the patch.

On Mon, May 06, 2024 at 08:52:54PM +0300, Laurent Pinchart wrote:
> It would be useful to mark instances of v4l2_subdev_state structures as
> const when code needs to access them read-only. This isn't currently
> possible, as the v4l2_subdev_state_get_*() accessor functions take a
> non-const pointer to the state.
> 
> Use _Generic() to provide two different versions of the accessors, for
> const and non-const states respectively. The former returns a const
> pointer to the requested format, rectangle or interval, implementing
> const-correctness. The latter returns a non-const pointer, preserving
> the current behaviour for drivers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Bike-shedding about names and the 4 leading underscores is allowed (and
> expected).
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 24 +++++-----
>  include/media/v4l2-subdev.h           | 66 ++++++++++++++++++---------
>  2 files changed, 57 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 83c6d1e36871..af1fbc28c8f0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1616,8 +1616,8 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>  
>  struct v4l2_mbus_framefmt *
> -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> -			       unsigned int pad, u32 stream)
> +____v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +				 unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1647,11 +1647,11 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_format);
>  
>  struct v4l2_rect *
> -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream)
> +____v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			       u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1681,11 +1681,11 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_crop);
>  
>  struct v4l2_rect *
> -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> -				unsigned int pad, u32 stream)
> +____v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				  unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1715,11 +1715,11 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_compose);
>  
>  struct v4l2_fract *
> -__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> -				 unsigned int pad, u32 stream)
> +____v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> +				   unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1751,7 +1751,7 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
> +EXPORT_SYMBOL_GPL(____v4l2_subdev_state_get_interval);
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e30c463d90e5..ba722ab501c1 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1340,21 +1340,27 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>   */
>  /*
>   * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
>   * macro below is to come up with the name of the function or macro to call,
>   * using the last two arguments (_stream and _pad). The selected function or
>   * macro is then called using the arguments specified by the caller. A similar
>   * arrangement is used for v4l2_subdev_state_crop() and
>   * v4l2_subdev_state_compose() below.
>   */
> -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> +#define v4l2_subdev_state_get_format(state, pad, ...)				\
> +	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)		\
>  		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> +#define __v4l2_subdev_state_get_format_pad(state, pad)				\
>  	__v4l2_subdev_state_get_format(state, pad, 0)
> +#define __v4l2_subdev_state_get_format(state, pad, stream)			\
> +	_Generic(state,								\
> +		const struct v4l2_subdev_state *: ((const struct v4l2_mbus_framefmt *)	\
> +			____v4l2_subdev_state_get_format((struct v4l2_subdev_state *)state, pad, stream)), \
> +		default: ____v4l2_subdev_state_get_format((struct v4l2_subdev_state *)state, pad, stream) \
> +	)
>  struct v4l2_mbus_framefmt *
> -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> -			       unsigned int pad, u32 stream);
> +____v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +				 unsigned int pad, u32 stream);
>  
>  /**
>   * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> @@ -1368,14 +1374,20 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>   * For stream-unaware drivers the crop rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
> +	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)		\
>  		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> +#define __v4l2_subdev_state_get_crop_pad(state, pad)				\
>  	__v4l2_subdev_state_get_crop(state, pad, 0)
> +#define __v4l2_subdev_state_get_crop(state, pad, stream)			\
> +	_Generic(state,								\
> +		const struct v4l2_subdev_state *: ((const struct v4l2_rect *)		\
> +			____v4l2_subdev_state_get_crop((struct v4l2_subdev_state *)state, pad, stream)), \
> +		default: ____v4l2_subdev_state_get_crop((struct v4l2_subdev_state *)state, pad, stream) \
> +	)
>  struct v4l2_rect *
> -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream);
> +____v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			       u32 stream);
>  
>  /**
>   * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> @@ -1389,14 +1401,20 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>   * For stream-unaware drivers the compose rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
> +	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)		\
>  		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> +#define __v4l2_subdev_state_get_compose_pad(state, pad)				\
>  	__v4l2_subdev_state_get_compose(state, pad, 0)
> +#define __v4l2_subdev_state_get_compose(state, pad, stream)			\
> +	_Generic(state,								\
> +		const struct v4l2_subdev_state *: ((const struct v4l2_rect *)		\
> +			____v4l2_subdev_state_get_compose((struct v4l2_subdev_state *)state, pad, stream)), \
> +		default: ____v4l2_subdev_state_get_compose((struct v4l2_subdev_state *)state, pad, stream) \
> +	)
>  struct v4l2_rect *
> -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> -				unsigned int pad, u32 stream);
> +____v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				  unsigned int pad, u32 stream);
>  
>  /**
>   * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
> @@ -1410,14 +1428,20 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>   * For stream-unaware drivers the frame interval for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
> +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)		\
>  		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_interval_pad(state, pad)	\
> +#define __v4l2_subdev_state_get_interval_pad(state, pad)			\
>  	__v4l2_subdev_state_get_interval(state, pad, 0)
> +#define __v4l2_subdev_state_get_interval(state, pad, stream)			\
> +	_Generic(state,								\
> +		const struct v4l2_subdev_state *: ((const struct v4l2_frac *)		\
> +			____v4l2_subdev_state_get_interval((struct v4l2_subdev_state *)state, pad, stream)), \
> +		default: ____v4l2_subdev_state_get_interval((struct v4l2_subdev_state *)state, pad, stream) \

Is the cast necessary in the latter case? It would seem like we lose most
of the type safety checks as a result.

Could this be implemented using a similar arrangement than the gen_call
macro above, so that we wouldn't have three very similar sets of macros
here?

> +	)
>  struct v4l2_fract *
> -__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> -				 unsigned int pad, u32 stream);
> +____v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> +				   unsigned int pad, u32 stream);
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  

-- 
Kind regards,

Sakari Ailus

