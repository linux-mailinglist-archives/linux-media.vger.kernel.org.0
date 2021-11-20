Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D41C458008
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 19:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237916AbhKTSgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 13:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhKTSgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 13:36:41 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374A7C061574;
        Sat, 20 Nov 2021 10:33:38 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x6so45439870edr.5;
        Sat, 20 Nov 2021 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jFZ4o+xf/LyMWFNk1PRGjOV+ffHfRJMbmovqXNaCMQw=;
        b=PbWuB8IiJ2LNhYT72il+D//eKFAl4K5yZ1WEZiu72Weci92QxS1muuPCDq5psqJD7R
         RT+vpwgSRMtfW8vZOtUEqdAm3aeGGFyaYEFtuYbLlJ1E8Nib8yQaIKUyW6WelHRZHgja
         He0rfGwJuQJ3byM4VzQ7Ls/FVrjSM41GsDra4t55yUndCDl33ABYMBJUzlFJniDih4ZT
         iipG67bXvpbexjFiXnJ25RYPGDm3vOXMzD2QLSrIGs0yeNi/5LVkEL3kyGEi3+NQtBYv
         kk3JAXQK7g1j5SqKR8zKjrWp1/hAG6epSghX/2PuZzaCW4wnuFhO61a2TyUDcSuIJWO5
         vR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFZ4o+xf/LyMWFNk1PRGjOV+ffHfRJMbmovqXNaCMQw=;
        b=aR3SatMJJiJO5h64ACB8kJekGHsiMPai1tclWQC4ZLOM+GJv5ycI7WFBegGCQ4lDgg
         I6QMYT4MY/U/wkXVf1UkUpWBM1aw2PGosZTF9I7ia0q+nbeHJQjnFPJ0vKmw/XCnR3jw
         dRvwR4cm7okBje8eaDZp9CR8kHLNtNZvIiYYwYBM0at6/UHHooePYfUZhj7tUt7BtG4N
         zBkWphqs58vK122cq3LXcJgtFVVkClhII2LARcPe4vGXyHCXLZ1Pi1kEt0WkodZ81DIY
         n/aGgVFrhVd9ptaWRsW9yhihFebne6WM9Kt3I/FwG+Y29nnjw98FdwMrePI38hxvce/B
         wonQ==
X-Gm-Message-State: AOAM531OPEeiJ6vbbzlqsBcKR3brrZMhZ5tne5D84ZjYIsXYzuNFuSlI
        WWgyscgXWknn0H0xUi6wO8QlaVqy5doHGF4sH5d7urNkbVE=
X-Google-Smtp-Source: ABdhPJyeABwO6cYwFpCMDtEceUmbBNOZg6h9yuYu8Gv7cXzWiq2JgJcqI/LNCpdPKIA0GzLT/Kk46dq8bwNrp+aPbuU=
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr41113121edd.165.1637433216432;
 Sat, 20 Nov 2021 10:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <CAMty3ZDi+FMLBooi2jt=dPKVC8PhaBWLgtjoe3m=GHCNiqDqQw@mail.gmail.com>
 <CAJ+vNU3sCk2r2TX0=-N76wWxWNna7qnYnruxVxPTGD8L6yVtug@mail.gmail.com>
In-Reply-To: <CAJ+vNU3sCk2r2TX0=-N76wWxWNna7qnYnruxVxPTGD8L6yVtug@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 20 Nov 2021 12:33:25 -0600
Message-ID: <CAHCN7xLKDgPNT2pwW6r9nRN_L4k0zUhwN9FZw6t=Sf_yOKDo=w@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
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
        Lucas Stach <l.stach@pengutronix.de>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 19, 2021 at 5:51 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Thu, Nov 11, 2021 at 10:55 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Sat, Nov 6, 2021 at 9:24 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > Most of the blk-ctrl reset bits are found in one register, however
> > > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > > out of reset or the MIPI_CSI hangs.
> > >
> > > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >
> > > V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
> > >      Rename the new register to mipi_phy_rst_mask
> > >      Encapsulate the edits to this register with an if-statement
> >
> > This is DPHY reset mask, not sure we can handle this via blk-ctrl.
> > Marek has similar patch to support this [1]. we need to phandle the
> > phy in host node in order to work this.
> >
> > However this current patch change seems directly handling dphy reset
> > which indeed fine me as well.
> >
> > >
> > >  drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > index 519b3651d1d9..581eb4bc7f7d 100644
> > > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > > @@ -17,6 +17,7 @@
> > >
> > >  #define BLK_SFT_RSTN   0x0
> > >  #define BLK_CLK_EN     0x4
> > > +#define BLK_MIPI_RESET_DIV     0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> > >
> > >  struct imx8m_blk_ctrl_domain;
> > >
> > > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> > >         const char *gpc_name;
> > >         u32 rst_mask;
> > >         u32 clk_mask;
> > > +
> > > +       /*
> > > +        * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > > +        * which is used to control the reset for the MIPI Phy.
> > > +        * Since it's only present in certain circumstances,
> > > +        * an if-statement should be used before setting and clearing this
> > > +        * register.
> > > +        */
> > > +       u32 mipi_phy_rst_mask;
> >
> > May be dphy_rst_mask (above comment may not be required, as it
> > understand directly with commit message).
> >
> > >  };
> > >
> > >  #define DOMAIN_MAX_CLKS 3
> > > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > >
> > >         /* put devices into reset */
> > >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +       if (data->mipi_phy_rst_mask)
> > > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > >
> > >         /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > >         ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > >
> > >         /* release reset */
> > >         regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +       if (data->mipi_phy_rst_mask)
> > > +               regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > >
> > >         /* disable upstream clocks */
> > >         clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > >         struct imx8m_blk_ctrl *bc = domain->bc;
> > >
> > >         /* put devices into reset and disable clocks */
> > > +       if (data->mipi_phy_rst_mask)
> > > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > +
> > >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > >         regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> > >
> > > @@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> > >                 .gpc_name = "mipi-csi",
> > >                 .rst_mask = BIT(3) | BIT(4),
> > >                 .clk_mask = BIT(10) | BIT(11),
> > > +               .mipi_phy_rst_mask = BIT(16) | BIT(17),
> >
> > DPHY has BIT(17) for Master reset and BIT(16) for Slave reset. I think
> > we just need master reset to enable. I've tested only BIT(17) on
> > mipi-dsi gpc and it is working.
> >
>
> Jagan,
>
> In my testing I had to use BIT(16) | BIT(17) in order to capture via CSI.

Lucas,

Based on this, should I redo the patch but without clearing bits 16
and 17?  It seems like both DSI and CSI need at least bit 17, and CSI
appears to need both.  If we clear them, we risk stomping on one
peripheral or another.  If we need both, in theory, we could drop the
need for a DPHY driver on the DSI side.

adam
>
> Best regards,
>
> Tim
