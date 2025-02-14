Return-Path: <linux-media+bounces-26137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A078A3533C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF183ABDDE
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66B27540A;
	Fri, 14 Feb 2025 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OxtS/K32"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FC79F5;
	Fri, 14 Feb 2025 00:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739494179; cv=none; b=pCc8afiC81clc3Y1lZyHaGZ4Uddir7GbVGExDDgpfNT+VuwWbhlgC2yMgLys/m8HRA+IaHm65y6K6vnOL0BSjWatEnmaJugZSpvMsA1SdGh2jlJSOT37dtQU5uYDx1/wONpG6diUYckGA9rMHpOttP1fFwC86Up/HL9D3rzzJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739494179; c=relaxed/simple;
	bh=U4+XNX4hYSUGlhYUkMW0izKnhXIJOAgZL0fPG9cpjn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKIel3b+p1o157TDuYxZQx033pVE8eWHeQ0feuqA6Ug+sDCZZBJgnEpJ+PDOWkSh/o+TL89vBuKgtsiEIddm2xLVdWRFU5S8jes49HHkwtiIUi+yJ8dNxy0z39XAG+xnPO9UaMR0+0MW79Y6iOIZNXXdVanM5k3Jf2tZafreriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OxtS/K32; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C94D56B5;
	Fri, 14 Feb 2025 01:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739494098;
	bh=U4+XNX4hYSUGlhYUkMW0izKnhXIJOAgZL0fPG9cpjn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxtS/K329xVSKy1ohM4SFpic20vzG4vREG03BWvqfNSHz6b5vBszPsIwHJfi0A2vR
	 K2o4M/20ILlRyJRfu0beBBDltN8u6twHTjWAs5m8CayGmvk5Mt4aJCHPbMNwlfCOa0
	 IKV19j86ETrBcDKMY1QdCgOs4HIuH3D01HQ9UAUw=
Date: Fri, 14 Feb 2025 02:49:24 +0200
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
Subject: Re: [PATCH 7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable
 for struct device in rzg2l_cru_probe()
Message-ID: <20250214004924.GF8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-8-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-8-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso, Prabhakar,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:39PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use a temporary variable for the struct device pointers to avoid
> dereferencing.

Same comments as for 5/8.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 89be584a4988..70fed0ce45ea 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  
>  static int rzg2l_cru_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct rzg2l_cru_dev *cru;
>  	int irq, ret;
>  
> -	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
> +	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
>  	if (!cru)
>  		return -ENOMEM;
>  
> @@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  	if (IS_ERR(cru->base))
>  		return PTR_ERR(cru->base);
>  
> -	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
> +	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
>  	if (IS_ERR(cru->presetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
> +		return dev_err_probe(dev, PTR_ERR(cru->presetn),
>  				     "Failed to get cpg presetn\n");
>  
> -	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
> +	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
>  	if (IS_ERR(cru->aresetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
> +		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
>  				     "Failed to get cpg aresetn\n");
>  
> -	cru->vclk = devm_clk_get(&pdev->dev, "video");
> +	cru->vclk = devm_clk_get(dev, "video");
>  	if (IS_ERR(cru->vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
> +		return dev_err_probe(dev, PTR_ERR(cru->vclk),
>  				     "Failed to get video clock\n");
>  
> -	cru->dev = &pdev->dev;
> -	cru->info = of_device_get_match_data(&pdev->dev);
> +	cru->dev = dev;
> +	cru->info = of_device_get_match_data(dev);
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
> +	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
>  			       KBUILD_MODNAME, cru);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
>  
>  	platform_set_drvdata(pdev, cru);
>  
> @@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> -	pm_suspend_ignore_children(&pdev->dev, true);
> -	pm_runtime_enable(&pdev->dev);
> +	pm_suspend_ignore_children(dev, true);
> +	pm_runtime_enable(dev);
>  
>  	ret = rzg2l_cru_media_init(cru);
>  	if (ret)
> @@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  
>  error_dma_unregister:
>  	rzg2l_cru_dma_unregister(cru);
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart

