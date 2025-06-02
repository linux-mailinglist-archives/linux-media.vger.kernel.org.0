Return-Path: <linux-media+bounces-33887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5882BACABC0
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 155523BD16A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F201E5B91;
	Mon,  2 Jun 2025 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DcjnIsob"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84021E8329;
	Mon,  2 Jun 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857449; cv=none; b=BsrSTP+0Hlm6dj4q1ArPEZ37TF3HFHCzQOo3H+QLPYT7cGyepqcoUnXHzBTsKjdEFlFGtw+UKMEgIy+cG2SUHxmPQ3yd7GaLQLrV8QU6Gd5pmMlzHKgOTQQUyZcExPXMY0Yp/YQ17KI6vkInV8pZBCQDVzl5XKB5sx/BGMuP1Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857449; c=relaxed/simple;
	bh=49+1TR13KdzWapDSH1/EuhZvMmXY3jAq4GTyHHQuSF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAC7uAgfJgkhPQ/jtY89gQ15lqpcOyoyn6XTf8ppF0oXvNJfE3qp2b2WSjpNC20J3P+qhroD5E5wcM0egMLxlP0KbMD9378pfetiV1sQiKga2eBuA/i32DuDH5IMhSWMJ1dSnamU+oBoBF3rUWduYsrVoGbhZw5lu8xLNtQzR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DcjnIsob; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBC4C80;
	Mon,  2 Jun 2025 11:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857445;
	bh=49+1TR13KdzWapDSH1/EuhZvMmXY3jAq4GTyHHQuSF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcjnIsobCWWcz1LsQEmB6moUR4yG2qLdb5BXoR1v76N7DApkFvTf93jfAFSnSrCcg
	 J9f+MeKrN5wdzPP/Q2FiSGFqzksk/JLwRxdu7Jvz9leMAh2kNTnJq7hvrzF9e8wicX
	 xjnBgZOpTmqkp+YLLU0Y1Vu7RCrNNlqkQc4JkrXg=
Date: Mon, 2 Jun 2025 12:43:57 +0300
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
Subject: Re: [PATCH v3 07/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Message-ID: <20250602094357.GH3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:36PM +0300, Tomi Valkeinen wrote:
> With modern drivers supporting link-freq, we don't need to do any
> calculations based on the bpp and number of lanes when figuring out the
> link frequency. However, the code currently always runs code to get the
> bpp and number of lanes.
> 
> Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
> when querying the link-freq is not supported by the upstream subdevice.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 90973f3cba38..e0a0fd96459b 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1001,15 +1001,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  			   struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	struct v4l2_mbus_framefmt *fmt;
>  	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
> -	unsigned int lanes;
> -	unsigned int bpp;
>  	s64 freq;
>  	u64 mbps;
> -	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1017,28 +1012,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	source = priv->remote;
>  	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> -	ret = rcsi2_get_active_lanes(priv, &lanes);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * First try to get the real link freq. If that fails, try the heuristic
> +	 * method with bpp and lanes (but that only works for one route).
> +	 */
> +	freq = v4l2_get_link_freq(remote_pad, 0, 0);
> +	if (freq < 0) {
> +		const struct rcar_csi2_format *format;
> +		struct v4l2_mbus_framefmt *fmt;

This can be const.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		unsigned int lanes;
> +		unsigned int bpp;
> +		int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	if (!fmt)
> -		return -EINVAL;
> +		ret = rcsi2_get_active_lanes(priv, &lanes);
> +		if (ret)
> +			return ret;
>  
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		if (!fmt)
> +			return -EINVAL;
>  
> -	bpp = format->bpp;
> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
>  
> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> -	if (freq < 0) {
> -		int ret = (int)freq;
> +		bpp = format->bpp;
>  
> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> -			source->name, ret);
> +		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> +		if (freq < 0) {
> +			int ret = (int)freq;
>  
> -		return ret;
> +			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> +				source->name, ret);
> +
> +			return ret;
> +		}
>  	}
>  
>  	mbps = div_u64(freq * 2, MEGA);

-- 
Regards,

Laurent Pinchart

