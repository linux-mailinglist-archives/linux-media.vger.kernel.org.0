Return-Path: <linux-media+bounces-10815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55C8BC3FD
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5611C2118D
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC57A7D412;
	Sun,  5 May 2024 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SpdjN6x3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348E7D3F6;
	Sun,  5 May 2024 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714944982; cv=none; b=EKnmsNTlJs3NQBAucz8ihSsJuxcmPtCqOsIaFs7/z6btp4ChmEKSoHxUTYkA4ctcH9fglHFBAzAWoLeag8rV6veWKoNSt99RUADa+pMSk4cj0HV66oBV6ZidixGJpTV96l2H7ax2futzns5UGMkcdRQCF4EGaxlavBUvII49k4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714944982; c=relaxed/simple;
	bh=n+fbx0xEh95FyyX62DEFKgM/w3gieBRWOS7KmtATyX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzvyRzpPhzfGD1IAWgJR4Vvn0Pa9Zebz1luOfLLvmeKauU2p8kv0U5rQkijWdjtSnBdsa3n/BnEFpiD79a88Y4CYyYDyb6c7Une1SJfEEmQby7Ecw/dSVJd/OSuKPh8KjQMwWYg+PalguxSXXaAgxzxCfWQYiD+lgLnKxKqjlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SpdjN6x3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D595A63B;
	Sun,  5 May 2024 23:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714944978;
	bh=n+fbx0xEh95FyyX62DEFKgM/w3gieBRWOS7KmtATyX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpdjN6x34NeqFWugylGrBFjRBKAY0N3Aayc94uTGdG/pneKqiP4W62/1NMAiJZaV5
	 G8KpV+BXYDY/JWVZf8q5uq7wjmewi7DBNnB523XDvtr/BtMBJiDsk/jgzWX8uDs/x8
	 sjimRbU776Vxcum4vekIY/b1jpjdmXaKUwaChlIw=
Date: Mon, 6 May 2024 00:36:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/11] media: max9286: Use frame interval from subdev
 state
Message-ID: <20240505213611.GI23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-12-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-12-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:26PM +0200, Jacopo Mondi wrote:
> Use the frame interval stored in the subdev state instead of storing
> a copy in the driver private structure.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 52 +++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index cc7ee35560fc..4ddbc247395f 100644
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

const

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
> @@ -801,7 +802,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		format = v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD);
>  
>  		max9286_set_video_format(priv, format);
> -		max9286_set_fsync_period(priv);
> +		max9286_set_fsync_period(priv, state);
>  
>  		/*
>  		 * The frame sync between cameras is transmitted across the
> @@ -874,19 +875,11 @@ static int max9286_get_frame_interval(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
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
> -	interval->interval = priv->interval;
> +	interval->interval = *v4l2_subdev_state_get_interval(sd_state,
> +							     interval->pad);
>  
>  	return 0;
>  }
> @@ -895,19 +888,11 @@ static int max9286_set_frame_interval(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
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
> +	*v4l2_subdev_state_get_interval(sd_state,
> +					interval->pad) = interval->interval;
>  
>  	return 0;
>  }
> @@ -993,12 +978,24 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
>  static int max9286_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *state)
>  {
> +	struct v4l2_fract *interval;
> +
>  	for (unsigned int i = 0; i < MAX9286_N_SINKS; i++)
>  		*v4l2_subdev_state_get_format(state, i) = max9286_default_format;
>  
>  	*v4l2_subdev_state_get_format(state,
>  				      MAX9286_SRC_PAD) = max9286_default_format;
>  
> +	/*
> +	 * Special case: a null interval enables automatic FRAMESYNC mode.
> +	 *
> +	 * FRAMESYNC is taken from the slowest link. See register 0x01
> +	 * configuration.
> +	 */
> +	interval = v4l2_subdev_state_get_interval(state, MAX9286_SRC_PAD);
> +	interval->numerator = 0;
> +	interval->denominator = 0;
> +
>  	return 0;
>  }
>  
> @@ -1145,7 +1142,6 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
>  
>  	max9286_set_video_format(priv, &max9286_default_format);
> -	max9286_set_fsync_period(priv);

The commit message should indicate why this line can be dropped.

>  
>  	cfg = max9286_read(priv, 0x1c);
>  	if (cfg < 0)

-- 
Regards,

Laurent Pinchart

