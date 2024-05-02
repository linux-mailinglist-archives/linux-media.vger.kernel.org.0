Return-Path: <linux-media+bounces-10642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C28BA03E
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27DBFB23EBD
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A27B17333C;
	Thu,  2 May 2024 18:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HyLv59p9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159F16F90C;
	Thu,  2 May 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674199; cv=none; b=WRKwAEViOoqyca+3W4eu/IZVK6HoBsSD87Pgg9AZzhL0PE5qE+yeTHN2tZR7Kek5dpC+UZqQD5QnUeGU1/XlpSYC3+7O7TofB82U+WBFAlRSm/tHUy4QcubGUgxsV+vvs3A2B7mbZwPcKlnC9wIJ3asC0iornyzRS75J9aewylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674199; c=relaxed/simple;
	bh=UqnKdnKW1IMvFcK4jgRjsuh6eHg86N4kiwqUWDozBp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOVxWfRwp0/XZ5dCOaxcb8d9t3+ZR99BlWh6Ax810SWkC3KlO3G1LWhAm1Tjw6GEC7Oaj7+TEg4jU3oj8kDBAhWHAg+r/cQHTTBu0zf8es2z5dgaNDJ55DATwlYW/r6CJElZyzEYjzDQhG5DItA8RvxIlHfOVlKj/O5tyEv9QU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HyLv59p9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D31B63B;
	Thu,  2 May 2024 20:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714674138;
	bh=UqnKdnKW1IMvFcK4jgRjsuh6eHg86N4kiwqUWDozBp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyLv59p9nMZVrgyAViiyENTezsEaWzYkltajX1VyauWQZL3VC3LvyR+YR2WHvr1lU
	 GHAHvqNYEWY1DqWDrTov4u+TZ/zhEhSHantOyXWhyNsYXwub5DnsNUg4bVWXHVFEMk
	 mChL3Q3RprWrkCXOZO0GyueiOB/bRtT1BoZsvPjc=
Date: Thu, 2 May 2024 21:23:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 10/19] media: max9286: Use frame interval from subdev
 state
Message-ID: <20240502182309.GQ15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-11-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-11-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:46PM +0200, Jacopo Mondi wrote:
> Use the frame interval stored in the subdev state instead of storing
> a copy in the driver private structure.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 52 ++++++++-----------------------------
>  1 file changed, 11 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 575d8ac8efa1..ae1b73fde832 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -197,8 +197,6 @@ struct max9286_priv {
>  	struct v4l2_ctrl *pixelrate_ctrl;
>  	unsigned int pixelrate;
>  
> -	struct v4l2_fract interval;
> -
>  	unsigned int nsources;
>  	unsigned int source_mask;
>  	unsigned int route_mask;
> @@ -571,11 +569,14 @@ static void max9286_set_video_format(struct max9286_priv *priv,
>  		      MAX9286_INVVS | MAX9286_HVSRC_D14);
>  }
>  
> -static void max9286_set_fsync_period(struct max9286_priv *priv)
> +static void max9286_set_fsync_period(struct max9286_priv *priv,
> +				     struct v4l2_subdev_state *state)
>  {
> +	struct v4l2_fract *interval;
>  	u32 fsync;
>  
> -	if (!priv->interval.numerator || !priv->interval.denominator) {
> +	interval = v4l2_subdev_state_get_interval(state, MAX9286_SRC_PAD);
> +	if (!interval->numerator || !interval->denominator) {
>  		/*
>  		 * Special case, a null interval enables automatic FRAMESYNC
>  		 * mode. FRAMESYNC is taken from the slowest link.
> @@ -591,8 +592,8 @@ static void max9286_set_fsync_period(struct max9286_priv *priv)
>  	 * The FRAMESYNC generator is configured with a period expressed as a
>  	 * number of PCLK periods.
>  	 */
> -	fsync = div_u64((u64)priv->pixelrate * priv->interval.numerator,
> -			priv->interval.denominator);
> +	fsync = div_u64((u64)priv->pixelrate * interval->numerator,
> +			interval->denominator);
>  
>  	dev_dbg(&priv->client->dev, "fsync period %u (pclk %u)\n", fsync,
>  		priv->pixelrate);
> @@ -802,7 +803,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		format = v4l2_subdev_state_get_format(state, source_idx);
>  
>  		max9286_set_video_format(priv, format);
> -		max9286_set_fsync_period(priv);
> +		max9286_set_fsync_period(priv, state);
>  
>  		/*
>  		 * The frame sync between cameras is transmitted across the
> @@ -871,44 +872,14 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> -static int max9286_get_frame_interval(struct v4l2_subdev *sd,
> -				      struct v4l2_subdev_state *sd_state,
> -				      struct v4l2_subdev_frame_interval *interval)
> -{
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -
> -	/*
> -	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
> -	 * subdev active state API.
> -	 */
> -	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
> -	if (interval->pad != MAX9286_SRC_PAD)
> -		return -EINVAL;

You will now return a value for the sink pads. Is that fine ?

> -
> -	interval->interval = priv->interval;
> -
> -	return 0;
> -}
> -
>  static int max9286_set_frame_interval(struct v4l2_subdev *sd,
> -				      struct v4l2_subdev_state *sd_state,
> +				      struct v4l2_subdev_state *state,
>  				      struct v4l2_subdev_frame_interval *interval)
>  {
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -
> -	/*
> -	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
> -	 * subdev active state API.
> -	 */
> -	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
>  	if (interval->pad != MAX9286_SRC_PAD)
>  		return -EINVAL;
>  
> -	priv->interval = interval->interval;
> +	*v4l2_subdev_state_get_interval(state, interval->pad) = interval->interval;
>  
>  	return 0;
>  }
> @@ -966,7 +937,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
> -	.get_frame_interval = max9286_get_frame_interval,
> +	.get_frame_interval = v4l2_subdev_get_frame_interval,

In otder to do so, you need to initialize the interval in the
.init_state() operation.

>  	.set_frame_interval = max9286_set_frame_interval,
>  };
>  
> @@ -1148,7 +1119,6 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
>  
>  	max9286_set_video_format(priv, &max9286_default_format);
> -	max9286_set_fsync_period(priv);
>  
>  	cfg = max9286_read(priv, 0x1c);
>  	if (cfg < 0)

-- 
Regards,

Laurent Pinchart

