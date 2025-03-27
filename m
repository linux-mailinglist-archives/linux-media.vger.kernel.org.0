Return-Path: <linux-media+bounces-28889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8FA73F5D
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13036173C81
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABF41D63D6;
	Thu, 27 Mar 2025 20:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o44mcIH/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF31C84CA;
	Thu, 27 Mar 2025 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743107726; cv=none; b=kHvICLr8ULikFMX2IBMVFZhnWbsSMq/eCChgtF0irOmxb8lraScW39LZAGPS7LGfwnaRRkll5KiNiBBfMY8fJSPCnnHcfTac4+rcQxn8y+0Q+KxX5z7mqaG5IJpRNl0PzPH6WNpsxfsUuWiDROeFCQKlisAnv3pB1V14Di6kTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743107726; c=relaxed/simple;
	bh=oXpKT4jJpLKNDLdSgu1uRFyYL3EMihV4EY2S2QT7arY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caATruhLxb1c7W9BwuxeZCPVuS3zKNfQl5++MFMMovAgoQwoAk0DPh48k7Sce2W0qw30/f/vzlTN4+P1+2vCe9U5VgH2owlS2kqaCdcOe8IMU9a6QRAeuduiloD0UG0oPIevfNbMcjr4kftocQlQ435i95BSRikJrUKUTow6/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o44mcIH/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74245F6;
	Thu, 27 Mar 2025 21:33:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743107614;
	bh=oXpKT4jJpLKNDLdSgu1uRFyYL3EMihV4EY2S2QT7arY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o44mcIH/PkqBwDieLfyJZ62DrMPgsWyIQQgZbTPdIovg+qBeZRHXdkajHaHirvwnm
	 yw9sdc4pFhr2kVjOsVI8NgZ9FeePUWx0w/FGmvf8f1EImd7a5xNk7paHzgoWcv/KoF
	 3ymTLdwsVphpGmf+u+o18Iwbs0wPhNjk9tw4ST/A=
Date: Thu, 27 Mar 2025 22:35:00 +0200
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
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
Message-ID: <20250327203500.GJ4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>

On Mon, Feb 10, 2025 at 03:59:26PM -0500, Frank Li wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Introduce `imx8mq_plat_data` along with enable/disable callback operations
> to facilitate support for new chips. No functional changes.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - none
> change from v1 to v2
> - remove internal review tags
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e824..b5eae56d92f49 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -62,6 +62,8 @@
>  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
>  #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
>  
> +struct csi_state;
> +
>  enum {
>  	ST_POWERED	= 1,
>  	ST_STREAMING	= 2,
> @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
>  
>  #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
>  
> -#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
> -#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
> -#define	GPR_CSI2_1_HSEL			BIT(10)
> -#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
> -#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
> +struct imx8mq_plat_data {
> +	const char *name;

The name is not used, drop it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


> +	int (*enable)(struct csi_state *state, u32 hs_settle);
> +	void (*disable)(struct csi_state *state);
> +};
>  
>  /*
>   * The send level configures the number of entries that must accumulate in
> @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
>  
>  struct csi_state {
>  	struct device *dev;
> +	const struct imx8mq_plat_data *pdata;
>  	void __iomem *regs;
>  	struct clk_bulk_data clks[CSI2_NUM_CLKS];
>  	struct reset_control *rst;
> @@ -137,6 +140,35 @@ struct csi2_pix_format {
>  	u8 width;
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * i.MX8MQ GPR
> + */
> +
> +#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
> +#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
> +#define	GPR_CSI2_1_HSEL			BIT(10)
> +#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
> +#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
> +
> +static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
> +{
> +	regmap_update_bits(state->phy_gpr,
> +			   state->phy_gpr_reg,
> +			   0x3fff,
> +			   GPR_CSI2_1_RX_ENABLE |
> +			   GPR_CSI2_1_VID_INTFC_ENB |
> +			   GPR_CSI2_1_HSEL |
> +			   GPR_CSI2_1_CONT_CLK_MODE |
> +			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
> +
> +	return 0;
> +}
> +
> +static const struct imx8mq_plat_data imx8mq_data = {
> +	.name = "i.MX8MQ",
> +	.enable = imx8mq_gpr_enable,
> +};
> +
>  static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
> @@ -364,14 +396,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
>  	if (ret)
>  		return ret;
>  
> -	regmap_update_bits(state->phy_gpr,
> -			   state->phy_gpr_reg,
> -			   0x3fff,
> -			   GPR_CSI2_1_RX_ENABLE |
> -			   GPR_CSI2_1_VID_INTFC_ENB |
> -			   GPR_CSI2_1_HSEL |
> -			   GPR_CSI2_1_CONT_CLK_MODE |
> -			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
> +	ret = state->pdata->enable(state, hs_settle);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }
> @@ -379,6 +406,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
>  static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
>  {
>  	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
> +
> +	if (state->pdata->disable)
> +		state->pdata->disable(state);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -869,6 +899,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
>  
>  	state->dev = dev;
>  
> +	state->pdata = of_device_get_match_data(dev);
> +
>  	ret = imx8mq_mipi_csi_parse_dt(state);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> @@ -946,7 +978,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
> -	{ .compatible = "fsl,imx8mq-mipi-csi2", },
> +	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
Regards,

Laurent Pinchart

