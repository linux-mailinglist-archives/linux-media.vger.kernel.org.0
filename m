Return-Path: <linux-media+bounces-42856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D00B8E8DD
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 00:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C81A13BBC49
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 22:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70C62C21D8;
	Sun, 21 Sep 2025 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qoQmMfy9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0D2F37;
	Sun, 21 Sep 2025 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493697; cv=none; b=o+POKlgbieRsm5PZWr/dTM9MDICpmAAEw3wF6dGyKrpDJrzkF10o80kiS706Rfhv+aTgiiV3VwmYGY8bHEGlnu9RRh5XXQzV/JJw1mf0PKzP0FzWoxE63+ouTU65d/ipsDoTXYn2+ly2Dl2+9hhH3U9Nlw19RwH+e/AUYo7s2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493697; c=relaxed/simple;
	bh=l3Ivsn3JvGxkwHoogNhgmc6pBf/DmzRCG5UoUS6WbEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0gt8+AP6aUT2ztDFZO48+LPTsxmXU8M803W6t9oqbVpCpjxTPx1VcddLux7FOy1E/KOAo0ROMOWXOnZFm7hpF90tKZGbWZqm2Y74zO11f/Ky50utGydC5Y8qPQxuUpChEh8vWPmxpGijXykr4wOTnFWB0g7YZy+sX0Geym52f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qoQmMfy9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5BF410C4;
	Mon, 22 Sep 2025 00:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493612;
	bh=l3Ivsn3JvGxkwHoogNhgmc6pBf/DmzRCG5UoUS6WbEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoQmMfy9Wo8ZiZpmjKndpoV9optOLxQMacitUd9pcgEQtoB/DuFxrhMJGOirEIQns
	 ts6/8TX2HwqFL2jthkYUuUOkMX0Efj4XlyrjyqLUwNCR3oMMyACyQH93V6ZIVf1izc
	 0GKm3OPYkFbBSWqI5uOZ9Z1iYMrnRF6XpwgYBgV0=
Date: Mon, 22 Sep 2025 01:27:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] media: nxp: imx8-isi: Add ISI support for i.MX91
Message-ID: <20250921222743.GE10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Fri, Sep 05, 2025 at 02:56:02PM +0800, Guoniu Zhou wrote:
> The ISI module on i.MX91 implements only one channel and one parallel
> camera input. As no input source selection is required, gasket ops are
> unnecessary.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0155c75983f02f33f7f0669e73188222ebb5e816..c3d411ddf492eb27b372763ce5d344a90c6ec524 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -347,6 +347,17 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx91_data = {
> +	.model			= MXC_ISI_IMX91,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -547,6 +558,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
>  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
> +	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -160,6 +160,7 @@ enum model {
>  	MXC_ISI_IMX8QM,
>  	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
> +	MXC_ISI_IMX91,
>  	MXC_ISI_IMX93,
>  };

The model field is unused, should we drop it ? That's a candidate for a
separate patch, for this patch

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  

-- 
Regards,

Laurent Pinchart

