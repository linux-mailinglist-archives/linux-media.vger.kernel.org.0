Return-Path: <linux-media+bounces-47345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63798C6CC0A
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 663964F15A3
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07321304BC6;
	Wed, 19 Nov 2025 04:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oslRwvT2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9C1E98EF;
	Wed, 19 Nov 2025 04:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526827; cv=none; b=EkSPtjRaE77Wxul2ww+HB3nXQ7Ad2aka/y50jv8OXRWkE/BK2F2uThIjWEVAQXgM9Xql73QoXb/fYX491LIX56PjfmZpnn8wbZgY4LdCrSxuQCjufoIBsKBoRAoCZ/OClZU/Q5KVpzOHvhrVwqR0XeDZ5E5qHLA2015KL9fc/6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526827; c=relaxed/simple;
	bh=4fPDjJVL7dFOo7C+XLuMfEt3zJtEYIYH9XWQsl5NyhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhufzgEQeOjRr+Zi62Xmu+9KNlHtoYeXTO0gMjmoihKpIw531NHUbXQxdck8qBOWbN6MLxd3NLcQit9Pl9wwCIQc6IqJNLIjpLWiwgxbq7KYg9pIkc5TK+c8N6afLQjxJ2IcDMRjgGS4fT/BwdDP/bzo7krRozWdWI+X6/+i63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oslRwvT2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8C398B5;
	Wed, 19 Nov 2025 05:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526700;
	bh=4fPDjJVL7dFOo7C+XLuMfEt3zJtEYIYH9XWQsl5NyhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oslRwvT21wy6hF/i4PJZupRViRTl6v/3BpnMs2LzlQmv6i0lvDlKJh7FL5Uv+JPcU
	 JDH5sO1OMryPAYFJ6OJSGUu0W6UflXVrNQMcSspF084Pcys5IF21Vb5rIBpxvXOVL9
	 dPnqOIThaA4QAaC0MfKkS+DR7oW20cUA9PyoCR9I=
Date: Wed, 19 Nov 2025 13:33:07 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: nxp: use dev_err_probe() to simplify code
Message-ID: <20251119043307.GH17526@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-2-6cd42872db79@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-cam_cleanup-v1-2-6cd42872db79@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Nov 17, 2025 at 01:58:12PM -0500, Frank Li wrote:
> Use dev_err_probe() to simplify code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++----
>  drivers/media/platform/nxp/imx7-media-csi.c   | 13 ++++---------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 28 ++++++++++++---------------
>  3 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	/* Now that the hardware is initialized, request the interrupt. */
>  	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
>  			       dev_name(dev), csis);
> -	if (ret) {
> -		dev_err(dev, "Interrupt request failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
>  
>  	/* Initialize and register the subdev. */
>  	ret = mipi_csis_subdev_init(csis);
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..82109e6884a4d931a84ef02e2bde41d0d7248511 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2218,11 +2218,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	/* Acquire resources and install interrupt handler. */
>  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
> -	if (IS_ERR(csi->mclk)) {
> -		ret = PTR_ERR(csi->mclk);
> -		dev_err(dev, "Failed to get mclk: %d", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(csi->mclk))
> +		return dev_err_probe(dev, PTR_ERR(csi->mclk), "Failed to get mclk\n");

		return dev_err_probe(dev, PTR_ERR(csi->mclk),
				     "Failed to get mclk\n");

>  
>  	csi->irq = platform_get_irq(pdev, 0);
>  	if (csi->irq < 0)
> @@ -2236,10 +2233,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
>  			       (void *)csi);
> -	if (ret < 0) {
> -		dev_err(dev, "Request CSI IRQ failed.\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
>  
>  	/* Initialize all the media device infrastructure. */
>  	ret = imx7_csi_media_init(csi);
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 0851f4a9ae52d3096f454da643cfdc5017e000b1..75709161fb26a61239b94430365849e022fdc14f 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  	int ret = 0;
>  
>  	state->rst = devm_reset_control_array_get_exclusive(dev);
> -	if (IS_ERR(state->rst)) {
> -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> -		return PTR_ERR(state->rst);
> -	}
> +	if (IS_ERR(state->rst))
> +		return dev_err_probe(dev, PTR_ERR(state->rst),
> +				     "Failed to get reset: %pe\n", state->rst);

		return dev_err_probe(dev, PTR_ERR(state->rst),
				     "Failed to get reset\n");

as dev_err_probe() prints the error already.

>  
>  	if (state->pdata->use_reg_csr) {
>  		const struct regmap_config regmap_config = {
> @@ -977,24 +976,21 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  
>  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
> -	if (ret) {
> -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "no fsl,mipi-phy-gpr property found: %d\n", ret);

		return dev_err_probe(dev, ret,
				     "no fsl,mipi-phy-gpr property found\n");

or possibly

		return dev_err_probe(dev, ret, "no %s property found\n",
				     "fsl,mipi-phy-gpr");

to enable string de-duplication (assuming it's worth it).

>  
>  	ph = *out_val;
>  
>  	node = of_find_node_by_phandle(ph);
> -	if (!node) {
> -		dev_err(dev, "Error finding node by phandle\n");
> -		return -ENODEV;
> -	}
> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV, "Error finding node by phandle\n");

Line wrap here too.

> +
>  	state->phy_gpr = syscon_node_to_regmap(node);
>  	of_node_put(node);
> -	if (IS_ERR(state->phy_gpr)) {
> -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> -		return PTR_ERR(state->phy_gpr);
> -	}
> +	if (IS_ERR(state->phy_gpr))
> +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +				     "failed to get gpr regmap: %pe\n", state->phy_gpr);

		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
				     "failed to get gpr regmap\n");

I think you can also drop the error message upon
imx8mq_mipi_csi_parse_dt() failure in imx8mq_mipi_csi_probe().

With those changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	state->phy_gpr_reg = out_val[1];
>  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);

-- 
Regards,

Laurent Pinchart

