Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EE945DD37
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356016AbhKYPYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbhKYPWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:22:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2861C06179C;
        Thu, 25 Nov 2021 07:18:37 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r11so27018506edd.9;
        Thu, 25 Nov 2021 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1xr0dJj7uqeb5C+Hg2DQB8dv6zi5yHSnunEXhTvGiX8=;
        b=pUsSZLBVCVdSPnTayCU62AadL4O5dkTndVJQhRwYosarpiSVh1n0IyD91VdUTwACXG
         fUii6bn9kBb6KFZ4zJ6tlxmnor8T59iDLZmTEVFDMlRuUk/HWGv3vpHRkfU4FQW0+nSm
         TCjaYl2Y2ZjzaUOn8aBuUJD/KJ90pLVtbVDzrk3Kkv8ofKmQWgeQ36rcgpnSXOnBB8+G
         fn78a2PB2aX9nqh35J0yFhr5hYJduaYoV9zwMliFcjXmUe2X3DrAm01eJt3fwKni8T1F
         tD0RRICagbhSrh7WOclOaCsTLh2vJNGRgZmRV4s/ngv1nhRCHXf4b870jBEzl17JpUE9
         Q/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1xr0dJj7uqeb5C+Hg2DQB8dv6zi5yHSnunEXhTvGiX8=;
        b=IEMizpVcpmRvp/7+cJJaqkZf7pFzEckZzaZ86lpoeDTCmqnHGhJQ5oso51ZN4ZPTu2
         Dc+g631+MjxHsTIdUd498p0HoFsuGCeZtpEVeOMOG0ZGvuG8IbsRw/vxDs5z/K9DSNl3
         go2sM0yDXal0VQuKuy7i8RDqSMKM6k47WFNgUJpRhiFK1jTyAr0SXGwrBSt6tT8Nupyl
         MJnOX4EhqX4Ze26FOvbn6eJdTyJFokioXpvm7rj/x4YL3QuUp6vcuy14jpviQ1GU1pY/
         V/3DG4oFRdvoD4LicgutAqZUpHUcB3e6d9Rk3DmrShinTl2SDikc4PYDPp/U/S9bW1iP
         2Gbg==
X-Gm-Message-State: AOAM530Pe7L2sE0+2F3Yzmwlorp+N77rAIwkjN3qjnBp8zPqldxkkw/B
        e6e80kh0W4IMUMoCqeMqVsgARMf/o29CZWLT4Ac=
X-Google-Smtp-Source: ABdhPJzXSR7WPQpbtY11tiK82bRbpa5B2Ft4LojeTmHAmk/c/+qZchj7etfnP4C9pRT5DjY47q1nBfRRWNgNI410ES8=
X-Received: by 2002:a05:6402:2751:: with SMTP id z17mr38138223edd.296.1637853515965;
 Thu, 25 Nov 2021 07:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
 <CAHCN7xLwYcS55N7SNT4k3NqF=Lgdjfe92nJHSVMKkhCuSAPaYw@mail.gmail.com> <CAMty3ZDCCRXLvHaoW=8gqq+3B0j4uQvAk72YjXKr=cxuf7GAkg@mail.gmail.com>
In-Reply-To: <CAMty3ZDCCRXLvHaoW=8gqq+3B0j4uQvAk72YjXKr=cxuf7GAkg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 25 Nov 2021 09:18:24 -0600
Message-ID: <CAHCN7xLrg-7CALY9Gre3OLfwAUed3veF1oZpvLvyE+aw7is_TQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 11:42 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Tue, Nov 23, 2021 at 7:29 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Sun, Nov 21, 2021 at 4:25 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Adam,
> > >
> > > On Sat, Nov 06, 2021 at 10:54:23AM -0500, Adam Ford wrote:
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
> > > >  #define BLK_SFT_RSTN 0x0
> > > >  #define BLK_CLK_EN   0x4
> > > > +#define BLK_MIPI_RESET_DIV   0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> > > >
> > > >  struct imx8m_blk_ctrl_domain;
> > > >
> > > > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> > > >       const char *gpc_name;
> > > >       u32 rst_mask;
> > > >       u32 clk_mask;
> > > > +
> > > > +     /*
> > > > +      * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > > > +      * which is used to control the reset for the MIPI Phy.
> > > > +      * Since it's only present in certain circumstances,
> > > > +      * an if-statement should be used before setting and clearing this
> > > > +      * register.
> > > > +      */
> > > > +     u32 mipi_phy_rst_mask;
> > > >  };
> > > >
> > > >  #define DOMAIN_MAX_CLKS 3
> > > > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > >
> > > >       /* put devices into reset */
> > > >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > +     if (data->mipi_phy_rst_mask)
> > > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > >
> > > >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > > >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > > >
> > > >       /* release reset */
> > > >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > > +     if (data->mipi_phy_rst_mask)
> > > > +             regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > >
> > > >       /* disable upstream clocks */
> > > >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > > >       struct imx8m_blk_ctrl *bc = domain->bc;
> > > >
> > > >       /* put devices into reset and disable clocks */
> > > > +     if (data->mipi_phy_rst_mask)
> > > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > > +
> > >
> > > Is it the best option to enable/disable both the master and slave MIPI
> > > DPHY, regardless of whether they're used or not ? Or would it be better
> > > to implement a reset controller to expose the two resets independently,
> > > and acquire them from the corresponding display and camera drivers ?
> >
> > In some early attempts to implement the blk-ctrl driver, there was an
> > attempt to enable a reset controller, but it caused some hanging and
> > issues with suspend-resume due to chicken-egg issues where some items
> > were coming up in the wrong order.  I think the decision was made to
> > make the resets part of the power domain so it's very clear that the
> > order of operations.  Lucas might be able to elaborate more on this.
>
> I think supporting via phy driver make sense to me since this resent
> is DPHY specific and nothing related to blk-ctrl.

I would disagree that isn't not blk-ctrl.  The blk-ctrl controls the
reset lines for the CSI and enables clocks.  The additional register
does the same thing to the MIPI CSI and DSI.  The imx7-mipi-csis
driver configures the dphy already, but this reset bit is not part of
its IP block.  It seems weird to me that a phy driver would reference
a phy driver.

>
> >
> > If bits 16 and 17 can act independently and bit 16 only impacts the
> > CSI  and doesn't require bit 17, it seems reasonable to me to have the
> > power-domain part of  the CSI, since this would only be enabled when
> > the CSI is active.  The power domain is idled when the CSI is idled
> > which would effectively place the phy in and out of reset only
> > depending on the state of the CSI.  I am guessing this reset bit
> > should be assigned to DISPBLK_PD_MIPI_CSI and not
> > DISPBLK_PD_CSI_BRIDGE, but I can run some more tests.
> >
> > AFAIK, there is no phy driver for the CSI like there is the DSI, so
> > adding that would require additional work to the CSI driver to work
> > around this quirk.  We don't have an acceptable DSI driver yet, so I'd
> > like to push a V3 with just the corresponding bit enabled for MIPI_CSI
> > after some testing.  FWICT, NXP set both bits 16 and 17 in their ATF
> > gpc code, and it never gets cleared, so I think having the bit set and
> > cleared on demand is an improvement.
>
> How about using the previous one that Marek sent. Add it via CSI
> pipeline and i think it would directly.

That driver specifically addresses the DSI phy and bringing it out of
reset is just one small part of what that driver does.  I don't think
adding CSI functionality to it would be appropriate for that driver as
they are separate IP blocks.

If people don't want the blk-ctl to control this bit, I would advocate
we should do a separate reset controller to be referenced byt the
mipi-csis driver, but that was proposed before and declined.  Since
blt-ctrl already is pulling seemingly unrelated IP blocks by
controlling their clocks and resets.  The fact that NXP included it in
their ATF power-domain controller tells me they considered it related
to power domains and/or resets and not an explicit phy driver.

adam

>
> https://www.spinics.net/lists/devicetree/msg381691.html
>
> Jagan.
