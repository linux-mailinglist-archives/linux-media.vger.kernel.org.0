Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCB236C483
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbhD0K6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0K6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:58:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6092BC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 03:57:58 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbLPg-0006kR-SG; Tue, 27 Apr 2021 12:57:56 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbLPf-0007ap-S3; Tue, 27 Apr 2021 12:57:55 +0200
Date:   Tue, 27 Apr 2021 12:57:55 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Marek Vasut <marex@denx.de>,
        kernel@pengutronix.de, Rui Miguel Silva <rmfrfs@gmail.com>,
        linux-imx@nxp.com, Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 23/23] media: imx: imx7_mipi_csis: Add i.MX8MM support
Message-ID: <20210427105755.khoqsuwyaisdd7ca@pengutronix.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-24-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413023014.28797-24-laurent.pinchart@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:43:19 up 146 days, 49 min, 46 users,  load average: 0.01, 0.04,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks a lot for this serie and for enabling the MX8MM device :)

Below are my two cents:

On 21-04-13 05:30, Laurent Pinchart wrote:
> The CSI-2 receiver in the i.MX8MM is a newer version of the one found in
> the i.MX7. Differences are minimal, support it in the imx7_mipi_csis
> driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 70 ++++++++++++++++------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 6e235c86e0aa..0444b784c1ec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> @@ -283,12 +284,23 @@ enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_PCLK,
>  	MIPI_CSIS_CLK_WRAP,
>  	MIPI_CSIS_CLK_PHY,
> +	MIPI_CSIS_CLK_AXI,
>  };
>  
>  static const char * const mipi_csis_clk_id[] = {
>  	"pclk",
>  	"wrap",
>  	"phy",
> +	"axi",
> +};
> +
> +enum mipi_csis_version {
> +	MIPI_CSIS_V3_3,
> +	MIPI_CSIS_V3_6_3,
> +};
> +
> +struct mipi_csis_info {
> +	enum mipi_csis_version version;
>  };

Since you are adding a struct here, I would..

>  struct csi_state {
> @@ -298,6 +310,7 @@ struct csi_state {
>  	struct clk_bulk_data *clks;
>  	struct reset_control *mrst;
>  	struct regulator *mipi_phy_regulator;
> +	const struct mipi_csis_info *info;
>  	u8 index;
>  
>  	struct v4l2_subdev sd;
> @@ -459,6 +472,9 @@ static void mipi_csis_sw_reset(struct csi_state *state)
>  
>  static int mipi_csis_phy_init(struct csi_state *state)
>  {
> +	if (state->info->version != MIPI_CSIS_V3_3)
> +		return 0;
> +
>  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
>  	if (IS_ERR(state->mipi_phy_regulator))
>  		return PTR_ERR(state->mipi_phy_regulator);
> @@ -469,11 +485,11 @@ static int mipi_csis_phy_init(struct csi_state *state)
>  
>  static void mipi_csis_phy_reset(struct csi_state *state)
>  {
> -	reset_control_assert(state->mrst);
> -
> -	msleep(20);
> -
> -	reset_control_deassert(state->mrst);
> +	if (state->info->version == MIPI_CSIS_V3_3) {
> +		reset_control_assert(state->mrst);
> +		msleep(20);
> +		reset_control_deassert(state->mrst);
> +	}
>  }

Add the phy handling as function callbacks to the struct. This avoids
the version checking and we are more flexible to extended adapt it for
further SoCs. According the current state this could be:

.dphy_parse()
.dphy_init()
.dphy_reset()
.dphy_on()
.dphy_off()

>  static void mipi_csis_system_enable(struct csi_state *state, int on)
> @@ -558,7 +574,8 @@ static void mipi_csis_set_params(struct csi_state *state)
>  	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
>  	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> -	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> +	if (state->info->version == MIPI_CSIS_V3_3)
> +		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
>  	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
>  
>  	__mipi_csis_set_format(state);
> @@ -610,7 +627,7 @@ static int mipi_csis_clk_get(struct csi_state *state)
>  	unsigned int i;
>  	int ret;
>  
> -	state->num_clks = ARRAY_SIZE(mipi_csis_clk_id);
> +	state->num_clks = state->info->version == MIPI_CSIS_V3_3 ? 3 : 4;

I would also add the num_clks to the struct.

Regards,
  Marco

>  	state->clks = devm_kcalloc(state->dev, state->num_clks,
>  				   sizeof(*state->clks), GFP_KERNEL);
>  
> @@ -1178,9 +1195,11 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
>  	mutex_lock(&state->lock);
>  	if (state->state & ST_POWERED) {
>  		mipi_csis_stop_stream(state);
> -		ret = regulator_disable(state->mipi_phy_regulator);
> -		if (ret)
> -			goto unlock;
> +		if (state->info->version == MIPI_CSIS_V3_3) {
> +			ret = regulator_disable(state->mipi_phy_regulator);
> +			if (ret)
> +				goto unlock;
> +		}
>  		mipi_csis_clk_disable(state);
>  		state->state &= ~ST_POWERED;
>  		if (!runtime)
> @@ -1204,9 +1223,11 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
>  		goto unlock;
>  
>  	if (!(state->state & ST_POWERED)) {
> -		ret = regulator_enable(state->mipi_phy_regulator);
> -		if (ret)
> -			goto unlock;
> +		if (state->info->version == MIPI_CSIS_V3_3) {
> +			ret = regulator_enable(state->mipi_phy_regulator);
> +			if (ret)
> +				goto unlock;
> +		}
>  
>  		state->state |= ST_POWERED;
>  		mipi_csis_clk_enable(state);
> @@ -1289,9 +1310,11 @@ static int mipi_csis_parse_dt(struct csi_state *state)
>  		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
>  
>  	/* Get MIPI PHY resets */
> -	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
> -	if (IS_ERR(state->mrst))
> -		return PTR_ERR(state->mrst);
> +	if (state->info->version == MIPI_CSIS_V3_3) {
> +		state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
> +		if (IS_ERR(state->mrst))
> +			return PTR_ERR(state->mrst);
> +	}
>  
>  	return 0;
>  }
> @@ -1311,6 +1334,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	spin_lock_init(&state->slock);
>  
>  	state->dev = dev;
> +	state->info = of_device_get_match_data(dev);
>  
>  	memcpy(state->events, mipi_csis_events, sizeof(state->events));
>  
> @@ -1419,7 +1443,17 @@ static int mipi_csis_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id mipi_csis_of_match[] = {
> -	{ .compatible = "fsl,imx7-mipi-csi2", },
> +	{
> +		.compatible = "fsl,imx7-mipi-csi2",
> +		.data = &(const struct mipi_csis_info){
> +			.version = MIPI_CSIS_V3_3,
> +		},
> +	}, {
> +		.compatible = "fsl,imx8mm-mipi-csi2",
> +		.data = &(const struct mipi_csis_info){
> +			.version = MIPI_CSIS_V3_6_3,
> +		},
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
> @@ -1436,6 +1470,6 @@ static struct platform_driver mipi_csis_driver = {
>  
>  module_platform_driver(mipi_csis_driver);
>  
> -MODULE_DESCRIPTION("i.MX7 MIPI CSI-2 Receiver driver");
> +MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:imx7-mipi-csi2");
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
