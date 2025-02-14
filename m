Return-Path: <linux-media+bounces-26135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE115A35331
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 844D47A14FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539B8C2EF;
	Fri, 14 Feb 2025 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N31zAUT1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD3376F1;
	Fri, 14 Feb 2025 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739494065; cv=none; b=hTnITv6SCx2yUsVUUKoxDhpeaRDueIjrgKTdEAUlUR/Axw6Xy6vkHE0SCzvEL3K8xws1Qa4Nkq+LFmBNU5taXhq0o0H5A9bEMcNJQcei0QQJciJikRDH5A5v0jMyN7vox9ACViaWDPhoAh0j43CeHYLkCEj+ieZB8SAMLPoblfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739494065; c=relaxed/simple;
	bh=jV2OgockIS22bc1/QTx6TvziCGvVdfSHkDIYwh0FkQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKobzF+qUT8snsVX5tPNIV0CTucfwp4mW3sRmQ4ZWt5EPxrRfb2J2RlO+znnnFbfOWi3IHnp3wQYtjTREr2yFh4pmn2J7WaE0sEyGpxm8vMHgNczr5XHdKI3BPb7z10c6NNDhWO52leBD9VPGHmH609khqCnCCr/BI/5Cb/uvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N31zAUT1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD476B5;
	Fri, 14 Feb 2025 01:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739493983;
	bh=jV2OgockIS22bc1/QTx6TvziCGvVdfSHkDIYwh0FkQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N31zAUT1V3mbe/FZggXQpJDGysupZ19TuNspvw0RBSRLbsGuznfSNP0kdj4lt4lXV
	 kW1Cdd0ttqCvqyLuTjtqmyQEQ0MMg5I6+XOVEpGMdq/fkH821/0riVa4XUlIZaUfxQ
	 4o2RjjDrAi9EKhL9eLHHlOSaG0RHWLOgi79OGeco=
Date: Fri, 14 Feb 2025 02:47:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for
 struct device in rzg2l_csi2_probe()
Message-ID: <20250214004729.GD8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso, Prabhakar,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:37PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use a temporary variable for the struct device pointers to avoid

s/temporary/local/ (in the subject message too).

> dereferencing.

The only advantage of this is shortened lines. That's a coding style
preference, and I'm fine with this patch, but the commit message should
mention this, not "avoid dereferencing".

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 881e910dce02..948f1917b830 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
>  
>  static int rzg2l_csi2_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct rzg2l_csi2 *csi2;
>  	int ret;
>  
> -	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
>  	if (!csi2)
>  		return -ENOMEM;
>  
> @@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base))
>  		return PTR_ERR(csi2->base);
>  
> -	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
> +	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
>  	if (IS_ERR(csi2->cmn_rstb))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
> +		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
>  				     "Failed to get cpg cmn-rstb\n");
>  
> -	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
> +	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
>  	if (IS_ERR(csi2->presetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
> +		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
>  				     "Failed to get cpg presetn\n");
>  
> -	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
> +	csi2->sysclk = devm_clk_get(dev, "system");
>  	if (IS_ERR(csi2->sysclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
>  				     "Failed to get system clk\n");
>  
> -	csi2->vclk = devm_clk_get(&pdev->dev, "video");
> +	csi2->vclk = devm_clk_get(dev, "video");
>  	if (IS_ERR(csi2->vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
>  				     "Failed to get video clock\n");
>  	csi2->vclk_rate = clk_get_rate(csi2->vclk);
>  
> -	csi2->dev = &pdev->dev;
> +	csi2->dev = dev;
>  
>  	platform_set_drvdata(pdev, csi2);
>  
> @@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_enable(dev);
>  
>  	ret = rzg2l_validate_csi2_lanes(csi2);
>  	if (ret)
>  		goto error_pm;
>  
> -	csi2->subdev.dev = &pdev->dev;
> +	csi2->subdev.dev = dev;
>  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
>  	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
> -	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
> +	v4l2_set_subdevdata(&csi2->subdev, dev);
>  	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
> -		 "csi-%s", dev_name(&pdev->dev));
> +		 "csi-%s", dev_name(dev));
>  	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
>  	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> @@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	media_entity_cleanup(&csi2->subdev.entity);
>  error_pm:
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>  
>  	return ret;
>  }
> 

-- 
Regards,

Laurent Pinchart

