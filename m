Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF5B4586EE
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 00:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhKUXRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 18:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhKUXQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 18:16:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704CBC061574;
        Sun, 21 Nov 2021 15:13:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74DADA1B;
        Mon, 22 Nov 2021 00:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637536431;
        bh=Tu+RjwacW2BJKA36e6xcjc2MGwUQqcz0mqJfhJupGNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v8fA8I8HCchrMhuJyQquZ27s13KMTuzXBVF79WrtvLGkZvWf2w78R0JDssLabiroN
         ExtgwcaY7aMsn2GHHPaUFwHGq2xvDasKRo+nQRDO3L4v2f5ehf8DFif4aBvkpxWoUJ
         cp8rl0NGxcgJsceJXq/5L6eZBwU2BzNOzqJr9Agk=
Date:   Mon, 22 Nov 2021 01:13:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
Message-ID: <YZrSmESJnVuzRxDa@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
 <CAMty3ZDi+FMLBooi2jt=dPKVC8PhaBWLgtjoe3m=GHCNiqDqQw@mail.gmail.com>
 <CAJ+vNU3sCk2r2TX0=-N76wWxWNna7qnYnruxVxPTGD8L6yVtug@mail.gmail.com>
 <CAHCN7xLKDgPNT2pwW6r9nRN_L4k0zUhwN9FZw6t=Sf_yOKDo=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLKDgPNT2pwW6r9nRN_L4k0zUhwN9FZw6t=Sf_yOKDo=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sat, Nov 20, 2021 at 12:33:25PM -0600, Adam Ford wrote:
> On Fri, Nov 19, 2021 at 5:51 PM Tim Harvey wrote:
> > On Thu, Nov 11, 2021 at 10:55 PM Jagan Teki wrote:
> > > On Sat, Nov 6, 2021 at 9:24 PM Adam Ford wrote:
> > > >
> > > > Most of the blk-ctrl reset bits are found in one register, however
> > > > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > > > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > > > out of reset or the MIPI_CSI hangs.
> > > >
> > > > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >
> > > > V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
> > > >      Rename the new register to mipi_phy_rst_mask
> > > >      Encapsulate the edits to this register with an if-statement
> > >
> > > This is DPHY reset mask, not sure we can handle this via blk-ctrl.
> > > Marek has similar patch to support this [1]. we need to phandle the
> > > phy in host node in order to work this.
> > >
> > > However this current patch change seems directly handling dphy reset
> > > which indeed fine me as well.
> > >
> > > >
> > > >  drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
> > > >  1 file changed, 18 insertions(+)
> > > >
> > > > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > index 519b3651d1d9..581eb4bc7f7d 100644
> > > > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > @@ -17,6 +17,7 @@
> > > >
> > > >  #define BLK_SFT_RSTN   0x0
> > > >  #define BLK_CLK_EN     0x4
> > > > +#define BLK_MIPI_RESET_DIV     0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> > > >
> > > >  struct imx8m_blk_ctrl_domain;
> > > >
> > > > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> > > >         const char *gpc_name;
> > > >         u32 rst_mask;
> > > >         u32 clk_mask;
> > > > +
> > > > +       /*
> > > > +        * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > > > +        * which is used to control the reset for the MIPI Phy.
> > > > +        * Since it's only present in certain circumstances,
> > > > +        * an if-statement should be used before setting and clearing this
> > > > +        * register.
> > > > +        */
> > > > +       u32 mipi_phy_rst_mask;
> > >
> > > May be dphy_rst_mask (above comment may not be required, as it
> > > understand directly with commit message).
> > >
> > > >  };
> > > >
> > > >  #define DOMAIN_MAX_CLKS 3
> > > > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > >
> > > >         /* put devices into reset */
> > > >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > +       if (data->mipi_phy_rst_mask)
> > > > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > >
> > > >         /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > > >         ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > >
> > > >         /* release reset */
> > > >         regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > +       if (data->mipi_phy_rst_mask)
> > > > +               regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > >
> > > >         /* disable upstream clocks */
> > > >         clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > > >         struct imx8m_blk_ctrl *bc = domain->bc;
> > > >
> > > >         /* put devices into reset and disable clocks */
> > > > +       if (data->mipi_phy_rst_mask)
> > > > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > > +
> > > >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > >         regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> > > >
> > > > @@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> > > >                 .gpc_name = "mipi-csi",
> > > >                 .rst_mask = BIT(3) | BIT(4),
> > > >                 .clk_mask = BIT(10) | BIT(11),
> > > > +               .mipi_phy_rst_mask = BIT(16) | BIT(17),
> > >
> > > DPHY has BIT(17) for Master reset and BIT(16) for Slave reset. I think
> > > we just need master reset to enable. I've tested only BIT(17) on
> > > mipi-dsi gpc and it is working.
> > >
> >
> > Jagan,
> >
> > In my testing I had to use BIT(16) | BIT(17) in order to capture via CSI.
> 
> Lucas,
> 
> Based on this, should I redo the patch but without clearing bits 16
> and 17?  It seems like both DSI and CSI need at least bit 17, and CSI
> appears to need both.  If we clear them, we risk stomping on one
> peripheral or another.  If we need both, in theory, we could drop the
> need for a DPHY driver on the DSI side.

I've tested camera on the i.MX8MM with an NXP BSP v5.4-based kernel.
Register BLK_MIPI_RESET_DIV is set to 0x00030000 by default. The camera
still works if I clear bit 17, and doesn't if I clear bit 16.

-- 
Regards,

Laurent Pinchart
