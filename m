Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF076446490
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 15:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhKEOEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 10:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbhKEOEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 10:04:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31320C061714
        for <linux-media@vger.kernel.org>; Fri,  5 Nov 2021 07:01:55 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1mizmw-00037w-FE; Fri, 05 Nov 2021 15:01:50 +0100
Message-ID: <4e2feba40ea3f93560e63a9b6af21c78188f02fe.camel@pengutronix.de>
Subject: Re: [PATCH 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 05 Nov 2021 15:01:47 +0100
In-Reply-To: <20211105134228.731331-1-aford173@gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
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

Hi Adam,

Am Freitag, dem 05.11.2021 um 08:42 -0500 schrieb Adam Ford:
> Most of the blk-ctrl reset bits are found in one register, however
> there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> out of reset or the MIPI_CSI hangs.
> 
I'm undecided yet if I like this solution, as register 0x8 has
different content on different instances of the blk-ctrl, so naming it
mipi_rst_mask is confusing for others.

My initial thought was that we should habe a MIPI PHY driver
controlling all the registers in the disp-blk-ctrl, other than SFT_RSTN
and CLK_EN, however I see how the reset handling for the PHY would then
be inconsistent with how we handle all the other devices in the disp-
blk domain. But then the HW guys seemed to think along the same lines,
as they placed the PHY resets into the PHY registers, instead of the
SFT_RSTN, which had more than enough spare bits to carry those
resets...

> Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/soc/imx/imx8m-blk-ctrl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> index 519b3651d1d9..5506bd075c35 100644
> --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> @@ -17,6 +17,7 @@
>  
>  #define BLK_SFT_RSTN	0x0
>  #define BLK_CLK_EN	0x4
> +#define BLK_MIPI_RESET_DIV	0x8
>  
>  struct imx8m_blk_ctrl_domain;
>  
> @@ -36,6 +37,7 @@ struct imx8m_blk_ctrl_domain_data {
>  	const char *gpc_name;
>  	u32 rst_mask;
>  	u32 clk_mask;
> +	u32 mipi_rst_mask;
>  };
>  
>  #define DOMAIN_MAX_CLKS 3
> @@ -78,6 +80,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  
>  	/* put devices into reset */
>  	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> +	regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
>  
>  	/* enable upstream and blk-ctrl clocks to allow reset to propagate */
>  	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> @@ -99,6 +102,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>  
>  	/* release reset */
>  	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> +	regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
>  
>  	/* disable upstream clocks */
>  	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> @@ -122,6 +126,7 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
>  	/* put devices into reset and disable clocks */
>  	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
>  	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +	regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);

For consistency the reset assertion should be put before the clock
disable.

Regards,
Lucas

>  
>  	/* power down upstream GPC domain */
>  	pm_runtime_put(domain->power_dev);
> @@ -488,6 +493,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
>  		.gpc_name = "mipi-csi",
>  		.rst_mask = BIT(3) | BIT(4),
>  		.clk_mask = BIT(10) | BIT(11),
> +		.mipi_rst_mask = BIT(16) | BIT(17),
>  	},
>  };
>  


