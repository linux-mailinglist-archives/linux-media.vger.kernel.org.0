Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C024586B9
	for <lists+linux-media@lfdr.de>; Sun, 21 Nov 2021 23:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhKUW3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 17:29:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54666 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhKUW27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 17:28:59 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A37779DD;
        Sun, 21 Nov 2021 23:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637533552;
        bh=3S3BUEseepww2zbQRKL7q3fHR2f4bW4j9xVbpko112E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Li3XxTNKXfBTEyWJmoaZv7cFFqklLDMXefoenwMpV8mJi4v6voOBOylkxiMmeHEdY
         ZZ4AiuA5YqG4AaXpBW4leZsRE7SvnEASMoOevu0RW3VSEJDuyy617eFA7hqYl2sSIp
         q/0A4qQcjvGfGQknwMzk4cGEHpD+dY+83HybhDVI=
Date:   Mon, 22 Nov 2021 00:25:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, tharvey@gateworks.com,
        frieder.schrempf@kontron.de, linux-media@vger.kernel.org,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
Message-ID: <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sat, Nov 06, 2021 at 10:54:23AM -0500, Adam Ford wrote:
> Most of the blk-ctrl reset bits are found in one register, however
> there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> out of reset or the MIPI_CSI hangs.
> 
> Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> 
> V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
>      Rename the new register to mipi_phy_rst_mask
>      Encapsulate the edits to this register with an if-statement
> 
>  drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> index 519b3651d1d9..581eb4bc7f7d 100644
> --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> @@ -17,6 +17,7 @@
>  
>  #define BLK_SFT_RSTN	0x0
>  #define BLK_CLK_EN	0x4
> +#define BLK_MIPI_RESET_DIV	0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
>  
>  struct imx8m_blk_ctrl_domain;
>  
> @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
>  	const char *gpc_name;
>  	u32 rst_mask;
>  	u32 clk_mask;
> +
> +	/*
> +	 * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> +	 * which is used to control the reset for the MIPI Phy.
> +	 * Since it's only present in certain circumstances,
> +	 * an if-statement should be used before setting and clearing this
> +	 * register.
> +	 */
> +	u32 mipi_phy_rst_mask;
>  };
>  
>  #define DOMAIN_MAX_CLKS 3
> @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  
>  	/* put devices into reset */
>  	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> +	if (data->mipi_phy_rst_mask)
> +		regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
>  
>  	/* enable upstream and blk-ctrl clocks to allow reset to propagate */
>  	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  
>  	/* release reset */
>  	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> +	if (data->mipi_phy_rst_mask)
> +		regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
>  
>  	/* disable upstream clocks */
>  	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
>  	struct imx8m_blk_ctrl *bc = domain->bc;
>  
>  	/* put devices into reset and disable clocks */
> +	if (data->mipi_phy_rst_mask)
> +		regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> +

Is it the best option to enable/disable both the master and slave MIPI
DPHY, regardless of whether they're used or not ? Or would it be better
to implement a reset controller to expose the two resets independently,
and acquire them from the corresponding display and camera drivers ?

>  	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
>  	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>  
> @@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
>  		.gpc_name = "mipi-csi",
>  		.rst_mask = BIT(3) | BIT(4),
>  		.clk_mask = BIT(10) | BIT(11),
> +		.mipi_phy_rst_mask = BIT(16) | BIT(17),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
