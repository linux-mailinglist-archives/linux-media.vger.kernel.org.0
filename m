Return-Path: <linux-media+bounces-28885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F0A73F3A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D02087A6B19
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32241CAA98;
	Thu, 27 Mar 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PIzAMG7J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76C1B043F;
	Thu, 27 Mar 2025 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743106312; cv=none; b=CC3ksKTaD6/tx5G1WxPp8KOuLV+GPtj09YKf2Inky3Nn59976SQqSReu0fIqJ3wBXMyokq4rtSQ5QXDQFo7BMxg8tvynpDAO/hBW2gMNWPTlLy+K50FU8sPlZ6rAF8DX73Sumvh0JdFl2Bjfpv7kFuIbsLjmq6i4+ZdwcOAdGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743106312; c=relaxed/simple;
	bh=LmKNL4zB6Iz8Ceg/EZ9Ki+Bqelt5gOeg9dk/BVwMtr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRIzKlId6q0U2QTvG9+aOifkPvofG2SgEZ1QXP2EYGlwTlW2td1yzdNM4K18RNGNv35DY8aukkEJ4H4xySsUVbQhd9o/sfvpBpLkPjytd4LLqFKGZwLF+R2OZG//r0mbMVx991WqPMaTI7zaPyDlaf+gzGHBm5IWkBjBBKs2r50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PIzAMG7J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BC0F6;
	Thu, 27 Mar 2025 21:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743106198;
	bh=LmKNL4zB6Iz8Ceg/EZ9Ki+Bqelt5gOeg9dk/BVwMtr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIzAMG7JaaXrGdj2WRj3GziQY7hur0VwbrnmCods9opEDs5fe3YSJNZVk4bqx+5wO
	 c29A89plU0IDKIw+qUPypXAl7pMU56aT7QBmkc+0gJEpsaaw1tHMjVZkQCTgYIT+WR
	 lKskW++LtDibbeOP5LngZMQnLSoTMMP4D0wst2Dc=
Date: Thu, 27 Mar 2025 22:11:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 05/12] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Message-ID: <20250327201124.GI4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:24PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
> There are 8 ISI channels on i.MX8QM while there are only 5 channels on
> i.MX8QXP.

There's a discrepancy between this series and the reference manuals.
I've raised that issue in the review of the DT bindings, let's discuss
it there. I'll skip that part of this patch for now.

> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - none
> 
> change from v1 to v2
> - remove intenal review tags
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 1e79b1211b603..a3237d76f7aa5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
>  };
>  
> +static const struct clk_bulk_data mxc_imx8qm_clks[] = {
> +	{ .id = "per0" },
> +	{ .id = "per1" },
> +	{ .id = "per2" },
> +	{ .id = "per3" },
> +	{ .id = "per4" },
> +	{ .id = "per5" },
> +	{ .id = "per6" },
> +	{ .id = "per7" },
> +};
> +
> +static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
> +	{ .id = "per0" },
> +	{ .id = "per4" },
> +	{ .id = "per5" },
> +	{ .id = "per6" },
> +	{ .id = "per7" },
> +};
> +
>  static const struct clk_bulk_data mxc_imx8mn_clks[] = {
>  	{ .id = "axi" },
>  	{ .id = "apb" },
> @@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> +	.model			= MXC_ISI_IMX8QM,
> +	.num_ports		= 5,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v1,

Are you sure about this ? According to the reference manual, QXP seems
to match mxc_imx8_isi_ier_v2, and QM doesn't seem to match either v1 or
v2.

> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8qm_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
> +	.buf_active_reverse	= true,

I'll trust you on this value, I can't verify it.

> +	.has_36bit_dma		= false,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> +	.model			= MXC_ISI_IMX8QXP,
> +	.num_ports		= 5,
> +	.num_channels		= 5,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v1,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8qxp_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
> +	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 9c7fe9e5f941f..496cad3f9423d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,8 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX8QM,
> +	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
>  };

-- 
Regards,

Laurent Pinchart

