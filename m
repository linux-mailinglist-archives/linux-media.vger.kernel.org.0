Return-Path: <linux-media+bounces-29180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F978A785C8
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FAD17A4E0D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1606D2E339A;
	Wed,  2 Apr 2025 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cvwrq8R6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB44400;
	Wed,  2 Apr 2025 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554703; cv=none; b=HUegZT6omINM/ahRzdEF2A24HGZIER3i9MpOjXbdCWwDojQ1Agy8ez+yuO7FN4wtNTJaUhicYJKPRP9HuFjSq/+zjIZrswEZDw1ReVHkG3XrbVn1rfrZrCtrVVP2Q5VUT41jUls2LVOQMNQYXPb/8Iv0hAfg6vxec5HEcaW3HzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554703; c=relaxed/simple;
	bh=L/BUGGCytmfR7n0xZh+Shj87mBNqqnDd2ahAPcoDihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRjxYJVckGKAY4N1PkOY8ugL+rj1XAubxVtlgFhMVQj5wtTQWTqIC9W99GsO89vpNOrpdaBeq8cZMHPLuAXXV16R/pChCSkCvMMnO+OZCQiG7u9C6mJ6hCJtgDYQcgP2ECps3NgWK9vO7Ex6uonophTElfGdDia5Fy5Ky5ajJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cvwrq8R6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 422C06A2;
	Wed,  2 Apr 2025 02:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743554587;
	bh=L/BUGGCytmfR7n0xZh+Shj87mBNqqnDd2ahAPcoDihw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvwrq8R6FTdKXcWZKAKWlMzArf3Q9gxsoBkkt4kn4XNC9tAlj/hL3penkKh5ok1nK
	 2fLRPMKKBaEeMoQkA2bYd1xNCrTVcuG57IzCfe2B9E3Ssl4QPAw0OuEi1q9sWWQiHy
	 5L5mXygfnhZjbSwQhlo0oYgsz9mUVmHSGKxfR3QE=
Date: Wed, 2 Apr 2025 03:44:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/17] media: rzg2l-cru: csi2: Skip system clock for
 RZ/V2H(P) SoC
Message-ID: <20250402004436.GD4845@pendragon.ideasonboard.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-10-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328173032.423322-10-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Mar 28, 2025 at 06:29:45PM +0100, Tommaso Merciai wrote:
> The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
> interface. To accommodate this, introduce a `has_system_clk` bool flag
> in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
> conditionally request the clock only when needed.
> 
> This patch is in preparation for adding support for RZ/V2H(P) SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes since v2:
>  - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
>    case where system clock is not required as suggested by LPinchart.
>  - Fixed commit body and msg
> 
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 4aa5d58dde5bd..e4781105eadc0 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -127,6 +127,7 @@ struct rzg2l_csi2 {
>  struct rzg2l_csi2_info {
>  	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
>  	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
> +	bool has_system_clk;
>  };
>  
>  struct rzg2l_csi2_timings {
> @@ -364,6 +365,7 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
>  static const struct rzg2l_csi2_info rzg2l_csi2_info = {
>  	.dphy_enable = rzg2l_csi2_dphy_enable,
>  	.dphy_disable = rzg2l_csi2_dphy_disable,
> +	.has_system_clk = true,
>  };
>  
>  static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> @@ -801,10 +803,12 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
>  				     "Failed to get cpg presetn\n");
>  
> -	csi2->sysclk = devm_clk_get(dev, "system");
> -	if (IS_ERR(csi2->sysclk))
> -		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
> -				     "Failed to get system clk\n");
> +	if (csi2->info->has_system_clk) {
> +		csi2->sysclk = devm_clk_get(dev, "system");
> +		if (IS_ERR(csi2->sysclk))
> +			return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
> +					     "Failed to get system clk\n");
> +	}
>  
>  	csi2->vclk = devm_clk_get(dev, "video");
>  	if (IS_ERR(csi2->vclk))

-- 
Regards,

Laurent Pinchart

