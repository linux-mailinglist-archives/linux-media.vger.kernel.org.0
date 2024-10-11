Return-Path: <linux-media+bounces-19421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529299A513
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 15:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64CF81C25405
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 13:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85E7219C86;
	Fri, 11 Oct 2024 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tmM2ieZC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C602194A4;
	Fri, 11 Oct 2024 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653456; cv=none; b=si2a3en+Z/DVygb7QoR0JFhuyMtwhG27o/LrS1u11pIeDcdwmQWy7zA+b/aHt7t/lGZ+tNz7GtB+g0x9kM2uGa70a/vFixLC3bPO9QjeOycYYbKt5xJNC3nb7k0JvJj8FU1wwjNCCldrDbH7ZbCxyJ3/ku80Z/i31XRWw0jPHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653456; c=relaxed/simple;
	bh=WX4yQMiZlACIymUMFw/9tLA0YSPfMay9XRpwftgT080=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2+2FDcHJPThvTn1a/l6+sNysin6sF+gPGpqFxtiJFP/wH19oXi+AQMhaRcRoiMovvX6BdlwcMHClyzYk5eYxUub8D89xpCgyCSivrC7JCW3blcR6i/qsNm8mRGKxWQNxjUzOR8m+fJc0NsR3qxVwOOrgUjveSnVthu6NYwfvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tmM2ieZC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.15])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA5FE220;
	Fri, 11 Oct 2024 15:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728653354;
	bh=WX4yQMiZlACIymUMFw/9tLA0YSPfMay9XRpwftgT080=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmM2ieZCXdmNLvd0eM0pVtItEpmGCvSIxGkX6DHnMvObgAvLD8wJnd5EHf4EW4JJj
	 y5aDQgyzKS818f9VA4JYgicGOuwUndqSC9fwRjyLy6q+hY/sLTtSugYSVCPgYXMCaq
	 5fGQ8l/5Dohnes6+boRxv9W5xXU7AFR2KIn+K4CY=
Date: Fri, 11 Oct 2024 16:30:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, jacopo@jmondi.org, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.d,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Message-ID: <20241011133047.GC9543@pendragon.ideasonboard.com>
References: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
 <20241011101711.704226-2-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011101711.704226-2-guoniu.zhou@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:17:12PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add ISI support for i.MX8ULP.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c      | 18 ++++++++++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h      |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c2013995049c..f5d076d7f50b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -279,6 +279,10 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
>  	{ .id = "apb" },
>  };
>  
> +static const struct clk_bulk_data mxc_imx8ulp_clks[] = {
> +	{ .id = "per" },

This doesn't match the DT bindings. Which one is wrong ?

> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
> @@ -307,6 +311,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> +	.model			= MXC_ISI_IMX8ULP,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0x0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8ulp_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8ulp_clks),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -528,6 +545,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 2810ebe9b5f7..9c7fe9e5f941 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
>  };
>  

-- 
Regards,

Laurent Pinchart

