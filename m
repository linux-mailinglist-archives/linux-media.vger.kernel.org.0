Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A2A381B51
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 00:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbhEOWMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 18:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbhEOWL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 18:11:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18D7C061573
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 15:10:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA5E3102;
        Sun, 16 May 2021 00:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621116643;
        bh=UF/Tryk5P2rzKOZX52jd7ifNzHVZwEe4vvTwAJ+hFGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lT+vJWALDnZDlzAJwqqXECuZjmBcGaKV6aNzWfTGRByVRhBXR0pWc/Z6BwsMubcFo
         MXEii/fK1HIGjCGHRom1auD2JqVaWQY+k3OvtkkI4aGHpgItt+gKufnG79kxplp3YA
         kv+n37R6lsfUWdbiCC3x/z8Ifp4wcJM7XQfqT2pQ=
Date:   Sun, 16 May 2021 01:10:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Marek Vasut <marex@denx.de>,
        kernel@pengutronix.de, Rui Miguel Silva <rmfrfs@gmail.com>,
        linux-imx@nxp.com, Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 23/23] media: imx: imx7_mipi_csis: Add i.MX8MM support
Message-ID: <YKBG2UkOCeOLliD1@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-24-laurent.pinchart@ideasonboard.com>
 <20210427105755.khoqsuwyaisdd7ca@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427105755.khoqsuwyaisdd7ca@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Tue, Apr 27, 2021 at 12:57:55PM +0200, Marco Felsch wrote:
> Hi Laurent,
> 
> thanks a lot for this serie and for enabling the MX8MM device :)

You're welcome :-)

> Below are my two cents:
> 
> On 21-04-13 05:30, Laurent Pinchart wrote:
> > The CSI-2 receiver in the i.MX8MM is a newer version of the one found in
> > the i.MX7. Differences are minimal, support it in the imx7_mipi_csis
> > driver.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 70 ++++++++++++++++------
> >  1 file changed, 52 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index 6e235c86e0aa..0444b784c1ec 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > @@ -283,12 +284,23 @@ enum mipi_csis_clk {
> >  	MIPI_CSIS_CLK_PCLK,
> >  	MIPI_CSIS_CLK_WRAP,
> >  	MIPI_CSIS_CLK_PHY,
> > +	MIPI_CSIS_CLK_AXI,
> >  };
> >  
> >  static const char * const mipi_csis_clk_id[] = {
> >  	"pclk",
> >  	"wrap",
> >  	"phy",
> > +	"axi",
> > +};
> > +
> > +enum mipi_csis_version {
> > +	MIPI_CSIS_V3_3,
> > +	MIPI_CSIS_V3_6_3,
> > +};
> > +
> > +struct mipi_csis_info {
> > +	enum mipi_csis_version version;
> >  };
> 
> Since you are adding a struct here, I would..
> 
> >  struct csi_state {
> > @@ -298,6 +310,7 @@ struct csi_state {
> >  	struct clk_bulk_data *clks;
> >  	struct reset_control *mrst;
> >  	struct regulator *mipi_phy_regulator;
> > +	const struct mipi_csis_info *info;
> >  	u8 index;
> >  
> >  	struct v4l2_subdev sd;
> > @@ -459,6 +472,9 @@ static void mipi_csis_sw_reset(struct csi_state *state)
> >  
> >  static int mipi_csis_phy_init(struct csi_state *state)
> >  {
> > +	if (state->info->version != MIPI_CSIS_V3_3)
> > +		return 0;
> > +
> >  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
> >  	if (IS_ERR(state->mipi_phy_regulator))
> >  		return PTR_ERR(state->mipi_phy_regulator);
> > @@ -469,11 +485,11 @@ static int mipi_csis_phy_init(struct csi_state *state)
> >  
> >  static void mipi_csis_phy_reset(struct csi_state *state)
> >  {
> > -	reset_control_assert(state->mrst);
> > -
> > -	msleep(20);
> > -
> > -	reset_control_deassert(state->mrst);
> > +	if (state->info->version == MIPI_CSIS_V3_3) {
> > +		reset_control_assert(state->mrst);
> > +		msleep(20);
> > +		reset_control_deassert(state->mrst);
> > +	}
> >  }
> 
> Add the phy handling as function callbacks to the struct. This avoids
> the version checking and we are more flexible to extended adapt it for
> further SoCs. According the current state this could be:
> 
> .dphy_parse()
> .dphy_init()
> .dphy_reset()
> .dphy_on()
> .dphy_off()

I think it's good to move the related code to specific function, I'll
rework the code in that direction. I'm not entirely sure we should use
function pointers though, as it's hard to predict what future hardware
will need. I'm tempted to only move PHY-related code to dedicated
functions for now, and postpone the move to function pointers later.

> >  static void mipi_csis_system_enable(struct csi_state *state, int on)
> > @@ -558,7 +574,8 @@ static void mipi_csis_set_params(struct csi_state *state)
> >  	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
> >  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> >  	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> > -	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> > +	if (state->info->version == MIPI_CSIS_V3_3)
> > +		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> >  	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
> >  
> >  	__mipi_csis_set_format(state);
> > @@ -610,7 +627,7 @@ static int mipi_csis_clk_get(struct csi_state *state)
> >  	unsigned int i;
> >  	int ret;
> >  
> > -	state->num_clks = ARRAY_SIZE(mipi_csis_clk_id);
> > +	state->num_clks = state->info->version == MIPI_CSIS_V3_3 ? 3 : 4;
> 
> I would also add the num_clks to the struct.

Good idea, I'll do that.

> >  	state->clks = devm_kcalloc(state->dev, state->num_clks,
> >  				   sizeof(*state->clks), GFP_KERNEL);
> >  
> > @@ -1178,9 +1195,11 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
> >  	mutex_lock(&state->lock);
> >  	if (state->state & ST_POWERED) {
> >  		mipi_csis_stop_stream(state);
> > -		ret = regulator_disable(state->mipi_phy_regulator);
> > -		if (ret)
> > -			goto unlock;
> > +		if (state->info->version == MIPI_CSIS_V3_3) {
> > +			ret = regulator_disable(state->mipi_phy_regulator);
> > +			if (ret)
> > +				goto unlock;
> > +		}
> >  		mipi_csis_clk_disable(state);
> >  		state->state &= ~ST_POWERED;
> >  		if (!runtime)
> > @@ -1204,9 +1223,11 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
> >  		goto unlock;
> >  
> >  	if (!(state->state & ST_POWERED)) {
> > -		ret = regulator_enable(state->mipi_phy_regulator);
> > -		if (ret)
> > -			goto unlock;
> > +		if (state->info->version == MIPI_CSIS_V3_3) {
> > +			ret = regulator_enable(state->mipi_phy_regulator);
> > +			if (ret)
> > +				goto unlock;
> > +		}
> >  
> >  		state->state |= ST_POWERED;
> >  		mipi_csis_clk_enable(state);
> > @@ -1289,9 +1310,11 @@ static int mipi_csis_parse_dt(struct csi_state *state)
> >  		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
> >  
> >  	/* Get MIPI PHY resets */
> > -	state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
> > -	if (IS_ERR(state->mrst))
> > -		return PTR_ERR(state->mrst);
> > +	if (state->info->version == MIPI_CSIS_V3_3) {
> > +		state->mrst = devm_reset_control_get_exclusive(state->dev, NULL);
> > +		if (IS_ERR(state->mrst))
> > +			return PTR_ERR(state->mrst);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1311,6 +1334,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >  	spin_lock_init(&state->slock);
> >  
> >  	state->dev = dev;
> > +	state->info = of_device_get_match_data(dev);
> >  
> >  	memcpy(state->events, mipi_csis_events, sizeof(state->events));
> >  
> > @@ -1419,7 +1443,17 @@ static int mipi_csis_remove(struct platform_device *pdev)
> >  }
> >  
> >  static const struct of_device_id mipi_csis_of_match[] = {
> > -	{ .compatible = "fsl,imx7-mipi-csi2", },
> > +	{
> > +		.compatible = "fsl,imx7-mipi-csi2",
> > +		.data = &(const struct mipi_csis_info){
> > +			.version = MIPI_CSIS_V3_3,
> > +		},
> > +	}, {
> > +		.compatible = "fsl,imx8mm-mipi-csi2",
> > +		.data = &(const struct mipi_csis_info){
> > +			.version = MIPI_CSIS_V3_6_3,
> > +		},
> > +	},
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
> > @@ -1436,6 +1470,6 @@ static struct platform_driver mipi_csis_driver = {
> >  
> >  module_platform_driver(mipi_csis_driver);
> >  
> > -MODULE_DESCRIPTION("i.MX7 MIPI CSI-2 Receiver driver");
> > +MODULE_DESCRIPTION("i.MX7 & i.MX8 MIPI CSI-2 receiver driver");
> >  MODULE_LICENSE("GPL v2");
> >  MODULE_ALIAS("platform:imx7-mipi-csi2");

-- 
Regards,

Laurent Pinchart
