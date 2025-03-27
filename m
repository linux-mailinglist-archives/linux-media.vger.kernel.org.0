Return-Path: <linux-media+bounces-28890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319DA73F61
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2523B4F43
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34F61D63FD;
	Thu, 27 Mar 2025 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h97UIUa4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE51C84CA;
	Thu, 27 Mar 2025 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743107905; cv=none; b=FOKIVRM1ErRCMzs/86o1BXBr9qFrGz3TgJXJ1ifVeC1MRkVZkD6tfPEMn9VZvYHEdVYIQKHNKSh/71lNR07m92gyOpLw3TfBpv1RtZpchKh946rsuISn5AudJAg4XSzBmA83bhTST/wfSGjgd81gyC5MOcN0iGFNPXMj9el87dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743107905; c=relaxed/simple;
	bh=f6qiU0TTN8DbNGhESYoBoKB9gEQkrw2fmpHiaRdsTr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oe+bGOicjCwX9KhalD54U7UnSHoVkSNF/HbGxYEesxjYRZ6sZRCk8zRVT0wOplIvmrCViA/+ZcrEP5Kk7alk8yQniK2c0F+MH8hw9S+FBroacHmA91cPHbY9vJZUXdOaejR4i+c449wEVr4ZJflnNGOCcfBygUzW479lhK1Tv/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h97UIUa4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C2CAF6;
	Thu, 27 Mar 2025 21:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743107793;
	bh=f6qiU0TTN8DbNGhESYoBoKB9gEQkrw2fmpHiaRdsTr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h97UIUa4pWMGm0/XORSAZlozBPK0I6cjCAyI0IdDFucSxUb6z+w0eAG+/CTgRlZgO
	 rB88L8JUO5iI/x2PnU9vsK7EVyCIkFsnkWsFIkHgFmJe0jBNAGya3G3ttWzwrjwUqj
	 GvLBBMGO7xAe998sv6S7jxsAELJXYsgrmkLC4xKk=
Date: Thu, 27 Mar 2025 22:37:59 +0200
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
Subject: Re: [PATCH v3 08/12] media: imx8mq-mipi-csi2: Add support for
 i.MX8QXP
Message-ID: <20250327203759.GB22295@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-8-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-8-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:27PM -0500, Frank Li wrote:
> Add support for i.MX8QXP, which has a dedicated control and status register
> (csr) space. Enable obtaining the second register space and initializing

s/csr/CSR/

> PHY and link settings accordingly.
> 
> Add reset delay for i.MX8QXP. It needs a delay after toggle reset.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - use dedicate csr reg to control phy and link settings.
> 
> Change from v1 to v2
> - change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
> phy drivers
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 119 ++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index b5eae56d92f49..788dabe5a0870 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -89,6 +89,8 @@ struct imx8mq_plat_data {
>  	const char *name;
>  	int (*enable)(struct csi_state *state, u32 hs_settle);
>  	void (*disable)(struct csi_state *state);
> +	bool use_reg_csr: 1;

Drop :1.

> +	int reset_delay;

	unsigned int reset_delay_us;

as it can't be negative, and to have more clarity on the unit.

>  };
>  
>  /*
> @@ -169,6 +171,101 @@ static const struct imx8mq_plat_data imx8mq_data = {
>  	.enable = imx8mq_gpr_enable,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * i.MX8QXP
> + */
> +
> +#define CSI2SS_PL_CLK_INTERVAL_US		10000
> +#define CSI2SS_PL_CLK_TIMEOUT_US		100000
> +
> +#define CSI2SS_PLM_CTRL				0x0
> +#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
> +#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
> +#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
> +#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
> +#define CSI2SS_PLM_CTRL_POLARITY_MASK		BIT(12)

#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)

or POLARITY_HIGH if you prefer.

> +#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)

Sort the bits in numerical order, the middle ones are swapped.

> +
> +#define CSI2SS_PHY_CTRL				0x4
> +#define CSI2SS_PHY_CTRL_PD			BIT(22)
> +#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
> +#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)

PLM ? Bit 12 is documented as reserved in PHY_CTRL. Is this a bad copy &
paste ?

> +#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
> +#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
> +#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
> +#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
> +#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
> +
> +#define CSI2SS_DATA_TYPE			0x38

According to the reference manual, the register is called
DATA_TYPE_DISABLE_BF.

> +#define CSI2SS_DATA_TYPE_MASK			GENMASK(23, 0)
> +
> +#define CSI2SS_CTRL_CLK_RESET			0x44
> +#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
> +
> +static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
> +{
> +	int ret;
> +	u32 val;
> +
> +	/* clear format */

s/clear/Clear/

Same where applicable elsewhere.

> +	regmap_clear_bits(state->phy_gpr, CSI2SS_DATA_TYPE, CSI2SS_DATA_TYPE_MASK);
> +
> +	/* clear polarity */
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
> +			  CSI2SS_PLM_CTRL_VSYNC_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_HSYNC_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_VALID_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_POLARITY_MASK);

Given that you write the full register to 0 in imx8qxp_gpr_disable(), I
think you can use regmap_write() here.

> +
> +	regmap_update_bits(state->phy_gpr, CSI2SS_PHY_CTRL, CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK,
> +			   FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle));

You need to include linux/bitfield.h for this. It can probably use
regmap_write() too, combining it with the next line.

> +
> +	regmap_set_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
> +			CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
> +			CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
> +			CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
> +
> +	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
> +				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
> +				       CSI2SS_PL_CLK_INTERVAL_US,
> +				       CSI2SS_PL_CLK_TIMEOUT_US);

How many iterations does this typically require ?

> +
> +	if (ret) {
> +		dev_err(state->dev, "Timeout waiting for Pixel-Link clock");
> +		return ret;
> +	}
> +
> +	/* Enable Pixel link Master*/

s/Master/Master /

> +	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
> +			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
> +
> +	/* PHY Enable */
> +	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
> +			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY);
> +
> +	/* Release Reset */
> +	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);

No need to clear this bit in imx8qxp_gpr_disable() ?

> +
> +	return ret;
> +}
> +
> +static void imx8qxp_gpr_disable(struct csi_state *state)
> +{
> +	/* Disable Pixel Link */
> +	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +
> +	/* Disable  PHY */

s/  / /

> +	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
> +};
> +
> +static const struct imx8mq_plat_data imx8qxp_data = {
> +	.name = "i.MX8QXP",
> +	.enable = imx8qxp_gpr_enable,
> +	.disable = imx8qxp_gpr_disable,
> +	.use_reg_csr = 1,

s/1/true/

> +	.reset_delay = 10000,

Is this documented somewhere ?

> +};
> +
>  static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
> @@ -273,6 +370,8 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  		return ret;
>  	}
>  
> +	fsleep(state->pdata->reset_delay);
> +
>  	return 0;
>  }
>  
> @@ -860,6 +959,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
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
> +			return dev_err_probe(dev, IS_ERR(base), "missed csr register\n");

s/missed csr/Missing CSR/

> +
> +		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
> +		if (IS_ERR(state->phy_gpr))
> +			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +					     "Fail to init mmio regmap\n");

"Failed to init CSI MMIO regmap\n"

> +		return 0;
> +	}
> +
>  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
>  	if (ret) {
> @@ -979,6 +1097,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
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

