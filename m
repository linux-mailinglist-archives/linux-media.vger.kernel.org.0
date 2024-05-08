Return-Path: <linux-media+bounces-11168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCEC8C048E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 20:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6736FB25129
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 18:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E3812E1E3;
	Wed,  8 May 2024 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="tmfe9z6c"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85A82D93;
	Wed,  8 May 2024 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715193893; cv=pass; b=hA2yBaGS00k4ITRDtu8IsVbqo7a6Wp+NHGKDAUKsGMAd6nSE/t0KhpmsJeThi8hhu8Rbz4X3OXx2aL4ZrH+sjaIDjYBK3v0x+64kLHC1yktsZEmirKV6FzHlfXLEGTvkyML0X5wO1wsk5DtbptHbG9u5ietOBvk59JMl3Uc6qSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715193893; c=relaxed/simple;
	bh=KsqtxOcDOyWemmSNVY6hOzACYyyfI4VFePIxK6NrOHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0cJggYoqorw3B2dvnPI1YZxMW4jdqpv4B7OAsZGua5SArvuLCrvGb263nKb0ux3NJGdU3iYjKjEYOowforBkuO98DaRWSIttv5NTSBOKot0KpiyhTvgsmDOXK7ojcknSGkibIoxpDAShN0FYqLIR2YFvc0i/Py8cA7/29+ofEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=tmfe9z6c; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VZPFj17xVz49Q47;
	Wed,  8 May 2024 21:44:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1715193882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRQ6ktTcY6IyP0yNGoqX7mYAD8bbo36PpZGLoGu3HvM=;
	b=tmfe9z6c4wm6VpM9pQyT+EvTjHr/EtPqf05l+ezD6R1rNv3t+SGDy0sNsnvYypqwoN4Nq5
	wGXfdV6fiJKA9wCciwf9xJY6qKZDck4zddP89orRREQ5f0YKa6Wf8CyNxHcP3mt/6mg70L
	xAreWFWKwQ+/oHJI9fGudmKgJB3sb5Y3Lbh8tFz8MI3/lZD2Yb39nXb0CGMvpfnH/XDR/S
	O9NSgeYfTzjWqv0/Szh90MZW7JpwT9J+kjMAhaBfbVq/CDvHhrokLxvFna+kWQHtrGCOcU
	gqalG5ngxOFZxZ168TRA93qxn6IO0/vk7js5l7KsgNjm1w/fA1hgSJDi+VdkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1715193882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRQ6ktTcY6IyP0yNGoqX7mYAD8bbo36PpZGLoGu3HvM=;
	b=dvFsYt1EDeKGJjdDbSKWj0b7j2bz7JO93Rf5UaNix1ls1Xurxp3LGggXYYvipubEqc0KPm
	lSWjmxNoMdPV8KE0dFbw+emrXDPh10w7VtJwYOOmgjaxoSdULpiQAByyJuIZb8Xm3b8Q6b
	JxqPzdQ+eEwkE5EjT1ljXUk64fNpkJl/Ji3vd7gcCbERS3AMnJpmtIbaYalPY6EWLu/jcY
	GiPg38YfqAKb38vydxwX/DbxY/ybAHXrXmE5GxnJkOl9+BX5O5Yn4CXLQRXuvnoEfGhY6Q
	IGxV3vYpPHxwf0cbgRKYkFl4DWnl5P7pz2n8Ng/IFR5FG86E4DqYiM24AUlZIg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1715193882; a=rsa-sha256;
	cv=none;
	b=upbfWpYaDry47wMomZZACGg2z6O+QXRqaHikfcC7pZX9XUoZJ27SV4afme64Cc1lj0Ly9M
	X+DagOVTV3h93+Bgi1lRdlLzHjgjmVGxXT+imKL+twI0cyjOnlPmFOVsRd/yyH31UBcSGO
	SkNOvW4Uod2vsh2MKU8eXHAicRm5Q8na00Amq2C4S4SGVcXy7RO5MbV+0tUZnUdMTBWTd+
	jY2o51Trqg68fuXQyoDeKzibC0eFF+V+KhIHdJdCTC10G9CS9D2ylIdj6pY40eFxJuIAjz
	3KPCHC9J3unISMzlUEyJmskhQN05VL+cLcjAZNakwYZ33LFYnxKSICMBhkkpbQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8FABC634C94;
	Wed,  8 May 2024 21:44:40 +0300 (EEST)
Date: Wed, 8 May 2024 18:44:40 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Provide const-aware subdev
 state accessors
Message-ID: <ZjvIGDaAAGK0WJo1@valkosipuli.retiisi.eu>
References: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for the update.

This is starting to look very nice. A few comments below...

On Tue, May 07, 2024 at 07:19:06PM +0300, Laurent Pinchart wrote:
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
> Changes since v2:
> 
> - Specify types explicitly in _Generic() expression
> - Fix cast of value to const pointer
> 
> Changes since v1:
> 
> - Wrap the accessors with _Generic() using a single macro instead of
>   adding a _Generic() statement in each of them.
> ---
>  include/media/v4l2-subdev.h | 40 +++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e30c463d90e5..cd3e9e2ebe4d 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>  #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
>  	__v4l2_subdev_state_get_ ## NAME ## ARG
>  
> +/*
> + * A macro to constify the return value of the state accessors when the state
> + * parameter is const.
> + */
> +#define __v4l2_subdev_state_constify_call(state, value)				\

This function just changes the return value constness. How about calling it
e.g. __v4l2_subdev_state_constify_ret instead?

Either way,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +	_Generic(state,								\
> +		const struct v4l2_subdev_state *: (const typeof(*(value)) *)(value), \
> +		struct v4l2_subdev_state *: (value)				\
> +	)
> +
>  /**
>   * v4l2_subdev_state_get_format() - Get pointer to a stream format
>   * @state: subdevice state
> @@ -1340,16 +1350,17 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
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

These function names are missing _get after the prefix.

Could you also add the interval function here, too?

The would fit well for a separate patch.

>   */
> -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> +#define v4l2_subdev_state_get_format(state, pad, ...)				\
> +	__v4l2_subdev_state_constify_call(state,				\
> +		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>  #define __v4l2_subdev_state_get_format_pad(state, pad)	\
>  	__v4l2_subdev_state_get_format(state, pad, 0)
>  struct v4l2_mbus_framefmt *
> @@ -1368,9 +1379,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>   * For stream-unaware drivers the crop rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
> +	__v4l2_subdev_state_constify_call(state,				\
> +		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>  #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
>  	__v4l2_subdev_state_get_crop(state, pad, 0)
>  struct v4l2_rect *
> @@ -1389,9 +1401,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>   * For stream-unaware drivers the compose rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
> +	__v4l2_subdev_state_constify_call(state,				\
> +		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>  #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
>  	__v4l2_subdev_state_get_compose(state, pad, 0)
>  struct v4l2_rect *
> @@ -1410,9 +1423,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>   * For stream-unaware drivers the frame interval for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
> +	__v4l2_subdev_state_constify_call(state,				\
> +		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>  #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
>  	__v4l2_subdev_state_get_interval(state, pad, 0)
>  struct v4l2_fract *

-- 
Kind regards,

Sakari Ailus

