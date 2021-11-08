Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11691447C5F
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 09:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbhKHI7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 03:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238200AbhKHI7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 03:59:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DCFC061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 00:56:48 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1mk0SK-0003eP-Uo; Mon, 08 Nov 2021 09:56:45 +0100
Message-ID: <a77d867eb42649d63356a62309e93ca78394f82f.camel@pengutronix.de>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 08 Nov 2021 09:56:40 +0100
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
References: <20211106155427.753197-1-aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Samstag, dem 06.11.2021 um 10:54 -0500 schrieb Adam Ford:
> Most of the blk-ctrl reset bits are found in one register, however
> there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> out of reset or the MIPI_CSI hangs.
> 
> Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

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


