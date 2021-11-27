Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F353D45FF85
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 16:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhK0PJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239692AbhK0PGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 10:06:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5965C061748;
        Sat, 27 Nov 2021 07:02:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92B02C5;
        Sat, 27 Nov 2021 16:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638025376;
        bh=t0tAKZUszw4MISToLf/tXlt+E1BGvCz4jPTFldHqgP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RB0T3ql2XCXkkw70nW1/0Y4K+8g3gv1MhEN0DwElAM5IrUW7G0xmShbiotHVdDfmm
         q0oJnpItVQSSxjtkuYgWbZ36HlxbjRAttQAlLWKy6upPIgCRFf7erxkJGopR+wh75Y
         bg1lP9/vIyl2e9xN1WyLE5GJ/2zT5Rcw9XNs+eqQ=
Date:   Sat, 27 Nov 2021 17:02:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
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
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
Message-ID: <YaJIiYzZYtMCedqe@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
 <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
 <CAHCN7xLwYcS55N7SNT4k3NqF=Lgdjfe92nJHSVMKkhCuSAPaYw@mail.gmail.com>
 <CAMty3ZDCCRXLvHaoW=8gqq+3B0j4uQvAk72YjXKr=cxuf7GAkg@mail.gmail.com>
 <CAHCN7xLrg-7CALY9Gre3OLfwAUed3veF1oZpvLvyE+aw7is_TQ@mail.gmail.com>
 <YaArb/4QH3IyPFYe@pendragon.ideasonboard.com>
 <CAHCN7xLFYykeSzF_1Lrcx=fG2T3Ac2b6kTf6yi8jYYSukk9NjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLFYykeSzF_1Lrcx=fG2T3Ac2b6kTf6yi8jYYSukk9NjQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sat, Nov 27, 2021 at 07:50:48AM -0600, Adam Ford wrote:
> On Thu, Nov 25, 2021 at 6:34 PM Laurent Pinchart wrote:
> > On Thu, Nov 25, 2021 at 09:18:24AM -0600, Adam Ford wrote:
> > > On Wed, Nov 24, 2021 at 11:42 PM Jagan Teki wrote:
> > > > On Tue, Nov 23, 2021 at 7:29 PM Adam Ford wrote:
> > > > > On Sun, Nov 21, 2021 at 4:25 PM Laurent Pinchart wrote:
> > > > > > On Sat, Nov 06, 2021 at 10:54:23AM -0500, Adam Ford wrote:
> > > > > > > Most of the blk-ctrl reset bits are found in one register, however
> > > > > > > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > > > > > > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > > > > > > out of reset or the MIPI_CSI hangs.
> > > > > > >
> > > > > > > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > > > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > > > > ---
> > > > > > >
> > > > > > > V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
> > > > > > >      Rename the new register to mipi_phy_rst_mask
> > > > > > >      Encapsulate the edits to this register with an if-statement
> > > > > > >
> > > > > > >  drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
> > > > > > >  1 file changed, 18 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > > > > index 519b3651d1d9..581eb4bc7f7d 100644
> > > > > > > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > > > > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > > > > > @@ -17,6 +17,7 @@
> > > > > > >
> > > > > > >  #define BLK_SFT_RSTN 0x0
> > > > > > >  #define BLK_CLK_EN   0x4
> > > > > > > +#define BLK_MIPI_RESET_DIV   0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> > > > > > >
> > > > > > >  struct imx8m_blk_ctrl_domain;
> > > > > > >
> > > > > > > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> > > > > > >       const char *gpc_name;
> > > > > > >       u32 rst_mask;
> > > > > > >       u32 clk_mask;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > > > > > > +      * which is used to control the reset for the MIPI Phy.
> > > > > > > +      * Since it's only present in certain circumstances,
> > > > > > > +      * an if-statement should be used before setting and clearing this
> > > > > > > +      * register.
> > > > > > > +      */
> > > > > > > +     u32 mipi_phy_rst_mask;
> > > > > > >  };
> > > > > > >
> > > > > > >  #define DOMAIN_MAX_CLKS 3
> > > > > > > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > > > > >
> > > > > > >       /* put devices into reset */
> > > > > > >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > > > > +     if (data->mipi_phy_rst_mask)
> > > > > > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > > > > >
> > > > > > >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > > > > > >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > > > > > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > > > > >
> > > > > > >       /* release reset */
> > > > > > >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > > > > +     if (data->mipi_phy_rst_mask)
> > > > > > > +             regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > > > > >
> > > > > > >       /* disable upstream clocks */
> > > > > > >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > > > > > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > > > > > >       struct imx8m_blk_ctrl *bc = domain->bc;
> > > > > > >
> > > > > > >       /* put devices into reset and disable clocks */
> > > > > > > +     if (data->mipi_phy_rst_mask)
> > > > > > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > > > > > +
> > > > > >
> > > > > > Is it the best option to enable/disable both the master and slave MIPI
> > > > > > DPHY, regardless of whether they're used or not ? Or would it be better
> > > > > > to implement a reset controller to expose the two resets independently,
> > > > > > and acquire them from the corresponding display and camera drivers ?
> > > > >
> > > > > In some early attempts to implement the blk-ctrl driver, there was an
> > > > > attempt to enable a reset controller, but it caused some hanging and
> > > > > issues with suspend-resume due to chicken-egg issues where some items
> > > > > were coming up in the wrong order.  I think the decision was made to
> > > > > make the resets part of the power domain so it's very clear that the
> > > > > order of operations.  Lucas might be able to elaborate more on this.
> > > >
> > > > I think supporting via phy driver make sense to me since this resent
> > > > is DPHY specific and nothing related to blk-ctrl.
> > >
> > > I would disagree that isn't not blk-ctrl.  The blk-ctrl controls the
> > > reset lines for the CSI and enables clocks.  The additional register
> > > does the same thing to the MIPI CSI and DSI.  The imx7-mipi-csis
> > > driver configures the dphy already, but this reset bit is not part of
> > > its IP block.  It seems weird to me that a phy driver would reference
> > > a phy driver.
> > >
> > > > > If bits 16 and 17 can act independently and bit 16 only impacts the
> > > > > CSI  and doesn't require bit 17, it seems reasonable to me to have the
> > > > > power-domain part of  the CSI, since this would only be enabled when
> > > > > the CSI is active.  The power domain is idled when the CSI is idled
> > > > > which would effectively place the phy in and out of reset only
> > > > > depending on the state of the CSI.  I am guessing this reset bit
> > > > > should be assigned to DISPBLK_PD_MIPI_CSI and not
> > > > > DISPBLK_PD_CSI_BRIDGE, but I can run some more tests.
> > > > >
> > > > > AFAIK, there is no phy driver for the CSI like there is the DSI, so
> > > > > adding that would require additional work to the CSI driver to work
> > > > > around this quirk.  We don't have an acceptable DSI driver yet, so I'd
> > > > > like to push a V3 with just the corresponding bit enabled for MIPI_CSI
> > > > > after some testing.  FWICT, NXP set both bits 16 and 17 in their ATF
> > > > > gpc code, and it never gets cleared, so I think having the bit set and
> > > > > cleared on demand is an improvement.
> > > >
> > > > How about using the previous one that Marek sent. Add it via CSI
> > > > pipeline and i think it would directly.
> > >
> > > That driver specifically addresses the DSI phy and bringing it out of
> > > reset is just one small part of what that driver does.  I don't think
> > > adding CSI functionality to it would be appropriate for that driver as
> > > they are separate IP blocks.
> > >
> > > If people don't want the blk-ctl to control this bit, I would advocate
> > > we should do a separate reset controller to be referenced byt the
> > > mipi-csis driver, but that was proposed before and declined.  Since
> > > blt-ctrl already is pulling seemingly unrelated IP blocks by
> > > controlling their clocks and resets.  The fact that NXP included it in
> > > their ATF power-domain controller tells me they considered it related
> > > to power domains and/or resets and not an explicit phy driver.
> >
> > I think it's a bit more complicated than that, unfortunately. The
> > BLK_CTRL is a mix of miscellaneous configuration bits thrown together.
> > It contains enable/disable bits for clocks and resets, but also D-PHY
> > configuration parameters (GPR_MIPI_[MS]_DPDN_SWAP_{CLK,DAT} in
> > GPR_MIPI_RESET_DIV, and all the fields of the GPR_MIPI_M_PLL* and
> > GPR_MIPI_[BMS]_DPHYCTL* registers). The latter should be controlled by
> > PHY drivers, but we may be able to control get away with hardcoded
> > values (possibly even hardware reset default values).
> 
> From my testing, the default values  in this register block appeared
> sufficient to run the OV5640 camera I have.
>
> > For the resets and clocks, reset and clock controllers could have been
> > nice. I'm not sure if controlling them through a power domain could
> 
> That was attempted by Lucas and others, but there were a bunch of
> issues with hanging due to order of operations and the interactions
> between the bus clock from the blk-ctrl and the GPC power domains.
> 
> > count as a bit of an abuse, as the power domain doesn't control power
> > rails, but looking at the imx8m-blk-ctrl driver the on/off sequences
> > required by the clocks and resets would be difficult to handle if clocks
> > and resets were exposed separately. I'd say that in the worst case it's
> > probably an acceptable hack.
> 
> So if I post a revision with only bit-16 and leaving bit 17 for the
> DSI Phy driver, do you have any objections? (see my comment below)

How about this ?

@@ -480,6 +497,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
 		.gpc_name = "mipi-dsi",
 		.rst_mask = BIT(5),
 		.clk_mask = BIT(8) | BIT(9),
+		.mipi_phy_rst_mask = BIT(17),
 	},
 	[IMX8MM_DISPBLK_PD_MIPI_CSI] = {
 		.name = "dispblk-mipi-csi",
@@ -488,6 +506,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
 		.gpc_name = "mipi-csi",
 		.rst_mask = BIT(3) | BIT(4),
 		.clk_mask = BIT(10) | BIT(11),
+		.mipi_phy_rst_mask = BIT(16),
 	},
 };

> > For the D-PHY resets, exposing them through a reset controller would
> > also be (in my opinion) the most pedantic approach, bus as we have power
> > domains for the CSI and DSI controllers, controlling the corresponding
> > D-PHY resets from there is in no case worse that what we have already.
> >
> > The only part that bothers me is the control of the master D-PHY, used
> > for MIPI DSI, from the MIPI CSI power domain. I've received feedback
> > from NXP today that those two GPR reset signals are connected directly
> > to the corresponding D-PHY, without any special combinatorial logic
> > in-between. I think it would be worth a try to control bit 16 from the
> > MIPI CSI power domain and bit 17 from the MIPI DSI power domain,
> > especially given that bit 17 didn't make any difference in my camera
> > tests on the i.MX8MM (I couldn't test display as my board doesn't use
> > the DSI output). If we then run into any issue, we can try to figure it
> > out.
> 
> I went back to test this as well.  With only bit 16 being used, it
> appeared to work too, so it seems like it's likely safe to leave bit
> 17 alone for this.
> 
> > > > https://www.spinics.net/lists/devicetree/msg381691.html

-- 
Regards,

Laurent Pinchart
