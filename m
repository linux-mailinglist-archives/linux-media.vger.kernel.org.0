Return-Path: <linux-media+bounces-30661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B5FA95823
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 23:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654DE18941EA
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E945219A68;
	Mon, 21 Apr 2025 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YsJXTjO7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F01D63D3;
	Mon, 21 Apr 2025 21:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271694; cv=none; b=HpurmeLCfugvOjnBkIDJgYSM/Duv1dVK+YvINygTtWQU3Ks1vsRkYgN+XUMWSG0dV2/lr8prDC6CegJL/t1nYNScO2hcj28bIbqwihWGczqTl2xYyWO1GKj1BIIGUGA/zvmEQqMZtyzaJeISP8cVn6vgIJjM2Jpv/cUTmtnMhSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271694; c=relaxed/simple;
	bh=ngbOkPt44/5lw29YiWRn3ahAnnvgeNx9uKhvIob9OW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuBSxEb47w0757Ys36FeVXy/in95wtqf5aQ9Rodnq75G+F6m1AxaunO76CaqPz+29C+JuBNxfYPoQd3zJgSgtFfANWQVVM15nzkw6tc05VbxfzXT989G6WLIBKYrqXLynwcaTiCN5i+fFVEvhBn0qbia8g3nzKQtT87x5jZz3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YsJXTjO7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 439426D6;
	Mon, 21 Apr 2025 23:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745271563;
	bh=ngbOkPt44/5lw29YiWRn3ahAnnvgeNx9uKhvIob9OW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsJXTjO7jyrXG2ntRWEgm8DS3eQK5PNbbQSQvl0CioGBsYAARezH/bJNWZJOHxF+k
	 0a1zIMuFlBxzlodxTclryAlgbzhP+0vxh0F8H6Dl3HnDGnPCP93x8XhzP6eG6dqyU1
	 kwukkO79y5qAhhS7kLZptWvySWOX5qZpgrvZaGUw=
Date: Tue, 22 Apr 2025 00:41:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 10/13] media: imx8mq-mipi-csi2: Add support for
 i.MX8QXP
Message-ID: <20250421214128.GR17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-10-ef695f1b47c4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-10-ef695f1b47c4@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:08PM -0400, Frank Li wrote:
> Add support for i.MX8QXP, which has a dedicated control and status register
> (CSR) space. Enable obtaining the second register space and initializing
> PHY and link settings accordingly.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v3 to v4
> - remove reset_delay
> - sort register field defination
> - fix error messag in dev_err_probe
> - fix comments
> - use true for 1
> - regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
> in imx8qxp_gpr_disable()
> - use regmap_write to clean register at imx8qxp_gpr_enable()
> - remove reduntant CSI2SS_PLM_CTRL_POLARITY
> - rename register DATA_TYPE to DATA_TYPE_DISABLE_BF
> 
> change from v2 to v3
> - use dedicate csr reg to control phy and link settings.
> 
> Change from v1 to v2
> - change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
> phy drivers
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 111 ++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 59ec7107b4508..c6eb6dd0d9e5a 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021 Purism SPC
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
> @@ -88,6 +89,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
>  struct imx8mq_plat_data {
>  	int (*enable)(struct csi_state *state, u32 hs_settle);
>  	void (*disable)(struct csi_state *state);
> +	bool use_reg_csr;
>  };
>  
>  /*
> @@ -167,6 +169,95 @@ static const struct imx8mq_plat_data imx8mq_data = {
>  	.enable = imx8mq_gpr_enable,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * i.MX8QXP
> + */
> +
> +#define CSI2SS_PL_CLK_INTERVAL_US		100
> +#define CSI2SS_PL_CLK_TIMEOUT_US		100000
> +
> +#define CSI2SS_PLM_CTRL				0x0
> +#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
> +#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
> +#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
> +#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
> +#define CSI2SS_PLM_CTRL_POLARITY_HIGH		BIT(12)
> +#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
> +
> +#define CSI2SS_PHY_CTRL				0x4
> +#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
> +#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
> +#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
> +#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
> +#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
> +#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
> +#define CSI2SS_PHY_CTRL_PD			BIT(22)
> +
> +#define CSI2SS_DATA_TYPE_DISABLE_BF		0x38
> +#define CSI2SS_DATA_TYPE_DISABLE_BF_MASK	GENMASK(23, 0)
> +
> +#define CSI2SS_CTRL_CLK_RESET			0x44
> +#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
> +
> +static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
> +{
> +	int ret;
> +	u32 val;
> +
> +	/* Clear format */
> +	regmap_clear_bits(state->phy_gpr,
> +			  CSI2SS_DATA_TYPE_DISABLE_BF, CSI2SS_DATA_TYPE_DISABLE_BF_MASK);

	regmap_clear_bits(state->phy_gpr, CSI2SS_DATA_TYPE_DISABLE_BF,
			  CSI2SS_DATA_TYPE_DISABLE_BF_MASK);

> +
> +	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);

This write to CSI2SS_PHY_CTRL is overridden by the next line. Is it
needed ?

> +
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL,
> +		     FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle) |
> +		     CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
> +		     CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
> +		     CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
> +
> +	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
> +				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
> +				       CSI2SS_PL_CLK_INTERVAL_US,
> +				       CSI2SS_PL_CLK_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(state->dev, "Timeout waiting for Pixel-Link clock");

Missing \n at end of string.

> +		return ret;
> +	}
> +
> +	/* Enable Pixel link Master */
> +	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
> +			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
> +
> +	/* PHY Enable */
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
> +			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY_HIGH);
> +
> +	/* Release Reset */
> +	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
> +
> +	return ret;
> +}
> +
> +static void imx8qxp_gpr_disable(struct csi_state *state)
> +{
> +	/* Disable Pixel Link */
> +	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +
> +	/* Disable PHY */
> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
> +
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);

	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET,
			  CSI2SS_CTRL_CLK_RESET_EN);

With those small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +};
> +
> +static const struct imx8mq_plat_data imx8qxp_data = {
> +	.enable = imx8qxp_gpr_enable,
> +	.disable = imx8qxp_gpr_disable,
> +	.use_reg_csr = true,
> +};
> +
>  static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
> @@ -865,6 +956,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>  		return PTR_ERR(state->rst);
>  	}
>  
> +	if (state->pdata->use_reg_csr) {
> +		const struct regmap_config regmap_config = {
> +			.reg_bits = 32,
> +			.val_bits = 32,
> +			.reg_stride = 4,
> +		};
> +		void __iomem *base;
> +
> +		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
> +		if (IS_ERR(base))
> +			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +
> +		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
> +		if (IS_ERR(state->phy_gpr))
> +			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +					     "Failed to init CSI MMIO regmap\n");
> +		return 0;
> +	}
> +
>  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
>  	if (ret) {
> @@ -984,6 +1094,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
> +	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
Regards,

Laurent Pinchart

