Return-Path: <linux-media+bounces-26708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D298A410BE
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8D918934B3
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B566C15CD46;
	Sun, 23 Feb 2025 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oanWJ6gB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F28494;
	Sun, 23 Feb 2025 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334694; cv=none; b=a4e9lf8R/Yq0jYFNxA+tGbQnQakOAdW1Kta6Cd/zwN7C03ustwwb8O2mquXzbtP8LxiF4YPDgsIH+0FftkhFymXHz/gS+ag8XwuzItqf/KtyqShISlc/JgAsHvoYmtrTY/S15LfuraP4pNSltLsgJixE6AiohdxCBJLrhvPlVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334694; c=relaxed/simple;
	bh=LdBXXAMswiZ3UFvXxG0cqd4NnWH3SIGCqF7/HI+QdeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD027SdMvZO9h1Q+qDBUfpar7VTAmY0R/1un0Hteqx1LoKjWWS2OCXxgRieDpz2c5GgcB82eyjmNOTronLkrwoQKOciseV1CxpE7PX2f+Jjg7k8YuFDR6V0dg3rx/p+KTM41b+B7+kYLuJrfI7G2nqW8FBhagGJfcgPSpt7vYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oanWJ6gB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E146496;
	Sun, 23 Feb 2025 19:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334604;
	bh=LdBXXAMswiZ3UFvXxG0cqd4NnWH3SIGCqF7/HI+QdeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oanWJ6gBkSzFtTe2ymKxEKlT72WG7yuZqKJMlEfHOQdjQKiTluIKs4/wWg9P2kRVH
	 Lmex3ebgaqSNYSf9+lRWzRLGroTmRjbX7ZkYFHp+TSG2Uz+FcuY3Xg8wtwJhDIKL7t
	 oE1vCT+CXyX3PTrywKeplBJJJwDPF6OxNyGZyVuc=
Date: Sun, 23 Feb 2025 20:17:54 +0200
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
Subject: Re: [PATCH v2 08/18] media: rzg2l-cru: csi2: Introduce SoC-specific
 D-PHY handling
Message-ID: <20250223181754.GC8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-9-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-9-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:22PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
> differs from the existing RZ/G2L implementation, introduce a new
> rzg2l_csi2_info structure. This structure provides function pointers for
> SoC-specific D-PHY enable and disable operations.
> 
> Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
> calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
> Update the device match table to store the appropriate function pointers
> for each compatible SoC.
> 
> This change prepares the driver for future extensions without affecting
> the current functionality for RZ/G2L.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 4ccf7c5ea58b..3a4e720ba732 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -107,6 +107,7 @@ struct rzg2l_csi2 {
>  	void __iomem *base;
>  	struct reset_control *presetn;
>  	struct reset_control *cmn_rstb;
> +	const struct rzg2l_csi2_info *info;
>  	struct clk *sysclk;
>  	struct clk *vclk;
>  	unsigned long vclk_rate;
> @@ -123,6 +124,11 @@ struct rzg2l_csi2 {
>  	bool dphy_enabled;
>  };
>  
> +struct rzg2l_csi2_info {
> +	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
> +	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
> +};

Unless you'll need to add non-function fields later, I'd name the
structure rzg2l_csi2_phy_ops.

> +
>  struct rzg2l_csi2_timings {
>  	u32 t_init;
>  	u32 tclk_miss;
> @@ -360,9 +366,9 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
>  	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
>  
>  	if (on)
> -		return rzg2l_csi2_dphy_enable(csi2);
> +		return csi2->info->dphy_enable(csi2);
>  
> -	return rzg2l_csi2_dphy_disable(csi2);
> +	return csi2->info->dphy_disable(csi2);
>  }
>  
>  static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> @@ -772,6 +778,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (!csi2)
>  		return -ENOMEM;
>  
> +	csi2->info = of_device_get_match_data(dev);
> +	if (!csi2->info)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
> +
>  	csi2->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(csi2->base))
>  		return PTR_ERR(csi2->base);
> @@ -890,8 +900,16 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
>  		       rzg2l_csi2_pm_runtime_resume, NULL)
>  };
>  
> +static const struct rzg2l_csi2_info rzg2l_csi2_info = {
> +	.dphy_enable = rzg2l_csi2_dphy_enable,
> +	.dphy_disable = rzg2l_csi2_dphy_disable,
> +};

I'd recommend moving this just below the definition of the
rzg2l_csi2_dphy_enable() function.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
>  static const struct of_device_id rzg2l_csi2_of_table[] = {
> -	{ .compatible = "renesas,rzg2l-csi2", },
> +	{
> +		.compatible = "renesas,rzg2l-csi2",
> +		.data = &rzg2l_csi2_info,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);

-- 
Regards,

Laurent Pinchart

