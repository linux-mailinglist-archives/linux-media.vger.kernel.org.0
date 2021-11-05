Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A91446507
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 15:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhKEOjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 10:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbhKEOjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 10:39:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B399DC061714
        for <linux-media@vger.kernel.org>; Fri,  5 Nov 2021 07:36:25 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1mj0KL-0006vT-7z; Fri, 05 Nov 2021 15:36:21 +0100
Message-ID: <c4987e92ad23c92f71c0220b1f2f45d360341b0e.camel@pengutronix.de>
Subject: Re: [PATCH 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>
Cc:     arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 05 Nov 2021 15:36:19 +0100
In-Reply-To: <CAHCN7xLJeR5V+AGR0GQ55Hf72xO-RJ06UJ8SpzeeqSQ7LHHpGw@mail.gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
         <4e2feba40ea3f93560e63a9b6af21c78188f02fe.camel@pengutronix.de>
         <CAHCN7xLJeR5V+AGR0GQ55Hf72xO-RJ06UJ8SpzeeqSQ7LHHpGw@mail.gmail.com>
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

Am Freitag, dem 05.11.2021 um 09:21 -0500 schrieb Adam Ford:
> On Fri, Nov 5, 2021 at 9:01 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > 
> > Hi Adam,
> > 
> > Am Freitag, dem 05.11.2021 um 08:42 -0500 schrieb Adam Ford:
> > > Most of the blk-ctrl reset bits are found in one register, however
> > > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > > out of reset or the MIPI_CSI hangs.
> > > 
> > I'm undecided yet if I like this solution, as register 0x8 has
> > different content on different instances of the blk-ctrl, so naming it
> > mipi_rst_mask is confusing for others.
> 
>  Both Mini and Nano use it, so I could add a comment that this
> register only applies to Mini and Nano.  For all others, it would be
> empty and do nothing anyway.  If you have a name you'd prefer, I can
> do that.
> 
Register 0x8 in the vpu-blk-ctrl also has a very different meaning. :)

I don't really have a better suggestion for the name. Maybe just keep
it or mipi_phy_rst_mask or something, but a comment would certainly be
welcome.

> > 
> > My initial thought was that we should habe a MIPI PHY driver
> > controlling all the registers in the disp-blk-ctrl, other than SFT_RSTN
> > and CLK_EN, however I see how the reset handling for the PHY would then
> > be inconsistent with how we handle all the other devices in the disp-
> > blk domain. But then the HW guys seemed to think along the same lines,
> > as they placed the PHY resets into the PHY registers, instead of the
> > SFT_RSTN, which had more than enough spare bits to carry those
> > resets...
> 
> The NXP ATF code sets these bits in the GPC code with the other power
> domain stuff, so it seems like they intended it to be used as a power
> domain thing and not MIPI PHY driver.

Yea, maybe the HW guys just misplaced those resets and it certainly
makes sense to handle the reset from the power-domain. While the MIPI
PHY has no direct connection to a SoC bus and should thus be unable to
corrupt SoC state it seems like a good idea to bring it into a clean
state after powering up the domain.

> 
> > 
> > > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  drivers/soc/imx/imx8m-blk-ctrl.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > index 519b3651d1d9..5506bd075c35 100644
> > > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > @@ -17,6 +17,7 @@
> > > 
> > >  #define BLK_SFT_RSTN 0x0
> > >  #define BLK_CLK_EN   0x4
> > > +#define BLK_MIPI_RESET_DIV   0x8
> > > 
> > >  struct imx8m_blk_ctrl_domain;
> > > 
> > > @@ -36,6 +37,7 @@ struct imx8m_blk_ctrl_domain_data {
> > >       const char *gpc_name;
> > >       u32 rst_mask;
> > >       u32 clk_mask;
> > > +     u32 mipi_rst_mask;
> > >  };
> > > 
> > >  #define DOMAIN_MAX_CLKS 3
> > > @@ -78,6 +80,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > 
> > >       /* put devices into reset */
> > >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +     regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);

Please guard all of those in a if (data->mipi_rst_mask). Regmap doesn't
check if the mask is 0, so we can avoid some MMIO accesses with this
condition and at the same time make it clear in the code that this
additional reset doesn't apply to most of the blk-ctrl instances.

> > > 
> > >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > @@ -99,6 +102,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > 
> > >       /* release reset */
> > >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +     regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
> > > 
> > >       /* disable upstream clocks */
> > >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > @@ -122,6 +126,7 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > >       /* put devices into reset and disable clocks */
> > >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > >       regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> > > +     regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
> > 
> > For consistency the reset assertion should be put before the clock
> > disable.
> 
> I can do that.  How do you want me to proceed?
> > > 
I agree that we should do this in the blk-ctrl driver.

Regards,
Lucas

> > >       /* power down upstream GPC domain */
> > >       pm_runtime_put(domain->power_dev);
> > > @@ -488,6 +493,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> > >               .gpc_name = "mipi-csi",
> > >               .rst_mask = BIT(3) | BIT(4),
> > >               .clk_mask = BIT(10) | BIT(11),
> > > +             .mipi_rst_mask = BIT(16) | BIT(17),
> > >       },
> > >  };
> > > 
> > 
> > 


