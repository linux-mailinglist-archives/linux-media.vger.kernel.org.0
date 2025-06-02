Return-Path: <linux-media+bounces-33931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7BBACB12F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1273B863D
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86097224256;
	Mon,  2 Jun 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fFumch0n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3E2C324D;
	Mon,  2 Jun 2025 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873026; cv=none; b=Sm8ReNzmddVMAb8g7lXdFdw0L3XzaLlCqTCqaLHhLiaotwGS18Fxi1KyH6GorwVIJV9n3GS6izqjHlR0+9De3k9uq4sUvcRPwWzRQ29JJnS1/cRNGd3//h1dGVtrmAEXGFhpbeAU9h3VjzfDzWLRIEktUUFgnJ3cQrcR1ZS0ZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873026; c=relaxed/simple;
	bh=b9nNn1ev6SAyx3B5wbNrYPZbZwaMytwqSzGjwZ2HvqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG+odd3CDAXEtGgIb5lDVhZcYns7KlbvzbzHa8GCGatecNMzkxO5Xr5Cx+9EotP2Y+tt5/VsZb663XVr4TyGAoJdvMLaKHu3KKlVu6zkU2xvPj6KJgEnXfhXlVVoBrq6mLPdtgaRlsC7zOJJWz4pic+8OCr9LcAgicJfIy4PP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fFumch0n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B32379;
	Mon,  2 Jun 2025 16:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748873021;
	bh=b9nNn1ev6SAyx3B5wbNrYPZbZwaMytwqSzGjwZ2HvqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFumch0nweuTJnUb+hETViXzaiV1f273dnizHkNDKJyNmfWU4u4V3l8Mb0vPssbBI
	 ZDCeRHLXjEdkn0BaBQhKb8FH4v9CNFEXzPqnnvhyhLt7xWTekHc3ON6dAVg1PR1+mT
	 GK0BDR8rCFeLrE8LgcJf8GLkBiCVuoxgWl7PBQn0=
Date: Mon, 2 Jun 2025 17:03:34 +0300
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
Subject: Re: [PATCH v3 05/15] media: rcar-csi2: Move rcar2_calc_mbps()
Message-ID: <20250602140334.GF11750@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-5-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-5-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:34PM +0300, Tomi Valkeinen wrote:
> Move the function so that it can call rcsi2_get_active_lanes() in the
> following patch.

I would add "No functional change intended." or something similar.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 66 +++++++++++++++---------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 698eb0e60f32..8aca35096408 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -951,39 +951,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> -{
> -	struct media_pad *remote_pad;
> -	struct v4l2_subdev *source;
> -	s64 freq;
> -	u64 mbps;
> -
> -	if (!priv->remote)
> -		return -ENODEV;
> -
> -	source = priv->remote;
> -	remote_pad = &source->entity.pads[priv->remote_pad];
> -
> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> -	if (freq < 0) {
> -		int ret = (int)freq;
> -
> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> -			source->name, ret);
> -
> -		return ret;
> -	}
> -
> -	mbps = div_u64(freq * 2, MEGA);
> -
> -	/* Adjust for C-PHY, divide by 2.8. */
> -	if (priv->cphy)
> -		mbps = div_u64(mbps * 5, 14);
> -
> -	return mbps;
> -}
> -
>  static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  				  unsigned int *lanes)
>  {
> @@ -1031,6 +998,39 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> +			   unsigned int lanes)
> +{
> +	struct media_pad *remote_pad;
> +	struct v4l2_subdev *source;
> +	s64 freq;
> +	u64 mbps;
> +
> +	if (!priv->remote)
> +		return -ENODEV;
> +
> +	source = priv->remote;
> +	remote_pad = &source->entity.pads[priv->remote_pad];
> +
> +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> +	if (freq < 0) {
> +		int ret = (int)freq;
> +
> +		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> +			source->name, ret);
> +
> +		return ret;
> +	}
> +
> +	mbps = div_u64(freq * 2, MEGA);
> +
> +	/* Adjust for C-PHY, divide by 2.8. */
> +	if (priv->cphy)
> +		mbps = div_u64(mbps * 5, 14);
> +
> +	return mbps;
> +}
> +
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {

-- 
Regards,

Laurent Pinchart

