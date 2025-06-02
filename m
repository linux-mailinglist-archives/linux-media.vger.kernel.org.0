Return-Path: <linux-media+bounces-33886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10BACABBA
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2B217AE29
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5927E1E5B79;
	Mon,  2 Jun 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HJewmf6K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC41E2607;
	Mon,  2 Jun 2025 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857440; cv=none; b=Zlw5sgaLrS8bKGNsxFWAmu92di8DOu0eRlt+8welraxeAbXReqtg8CYzgYFTAN0fvFARyRLZqKnN6FyWZWKRHqElvsJorm8ifaTQb1u/bdi1QXw9qVkR+j4JrgzkSnA1Voge3hu+wFZlxRfpWKMIOPvZRH/3ebHQ9Mv5k+jx8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857440; c=relaxed/simple;
	bh=rzI1iDaRxHfvs7zucFEd0fYBAfVY1oWMsuD5kwfgK6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3ySdBK70LVWvIHts9ogC7bS5zkEm753FoU1yPx9G9pCHocqZ+ScbjwMtqGBYjkEQPVXUmJzO5LT3u4so4CMrSf1lhwcTYT/nqaHf/Z1kYpZEIdPKKgEPhYNqPt67NM3H3+FxNlR3u5Cd1Ay17rXeAtYNf1KER1GTHbFDOH80NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HJewmf6K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 570A3379;
	Mon,  2 Jun 2025 11:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857436;
	bh=rzI1iDaRxHfvs7zucFEd0fYBAfVY1oWMsuD5kwfgK6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJewmf6Kb+w6JqUciYjqTeJpVwIh91hOq8nR7IC1CrAcc+G8e9MyAhmlqMKMyHG+1
	 3+7+oB3irQHejjQPC3xHHIXe+kYmq8s0dgz30wvwcLmpmLG0Q1Ur91unqvYwkI5WNP
	 igj+EX3gqK8XspR67vC2m5hK6UXuNrmAYclVFFUU=
Date: Mon, 2 Jun 2025 12:43:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 06/15] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Message-ID: <20250602094349.GG3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-6-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-6-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:35PM +0300, Tomi Valkeinen wrote:
> Instead of taking the bpp and the number of lanes as parameters to
> rcsi2_calc_mbps(), change the function to get those parameters inside
> the function. This centralizes the code a bit and makes it easier to add
> streams support.

This comes at the cost of calling rcsi2_get_active_lanes() multiple
times. I will assume for now that subsequent patches will show that the
benefits outweight the cost.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 45 ++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 8aca35096408..90973f3cba38 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -998,13 +998,18 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> +			   struct v4l2_subdev_state *state)
>  {
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_mbus_framefmt *fmt;
>  	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
> +	unsigned int lanes;
> +	unsigned int bpp;
>  	s64 freq;
>  	u64 mbps;
> +	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1012,6 +1017,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  	source = priv->remote;
>  	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> +	ret = rcsi2_get_active_lanes(priv, &lanes);
> +	if (ret)
> +		return ret;
> +
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format)
> +		return -EINVAL;
> +
> +	bpp = format->bpp;
> +
>  	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>  	if (freq < 0) {
>  		int ret = (int)freq;
> @@ -1092,7 +1111,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	phycnt = PHYCNT_ENABLECLK;
>  	phycnt |= (1 << lanes) - 1;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, state);
>  	if (mbps < 0)
>  		return mbps;
>  
> @@ -1300,23 +1319,15 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
>  static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int msps;
>  	int ret;
>  
> -	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> -
>  	ret = rcsi2_get_active_lanes(priv, &lanes);
>  	if (ret)
>  		return ret;
>  
> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	msps = rcsi2_calc_mbps(priv, state);
>  	if (msps < 0)
>  		return msps;
>  
> @@ -1494,23 +1505,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
>  static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int mbps;
>  	int ret;
>  
> -	/* Calculate parameters */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> -
>  	ret = rcsi2_get_active_lanes(priv, &lanes);
>  	if (ret)
>  		return ret;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, state);
>  	if (mbps < 0)
>  		return mbps;
>  

-- 
Regards,

Laurent Pinchart

