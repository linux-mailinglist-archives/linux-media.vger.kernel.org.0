Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2E45D466
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 06:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245252AbhKYFrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 00:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345909AbhKYFpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 00:45:40 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF2CC061758
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 21:42:29 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r11so20474550edd.9
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 21:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mVokkW0aterUUH0jexbVC9W/wjaVPSuabPLWpcX7R2A=;
        b=FNT3EP7+Uy+OAfQjGgZAc++CUzXezJHka6CQFvQnrppLEF+n5eFf8/OK3iz/nID7Ka
         wRLmeLGyaF1jGYgOYIaSGCvX7xyrt/8iQdM/WV5N87Ys7Vd5v6pjairuAdLtq//2KWTz
         Jj1lg1F39ySbEV1Q4TgQTh/ScXiJdjAozrLg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVokkW0aterUUH0jexbVC9W/wjaVPSuabPLWpcX7R2A=;
        b=If+sVHDbn0wIDTzgUXcN7XBzb1LhJFe76GCThZEax2MMC31XKZ3HQAMEEF+7zRL5nw
         h5CYJqNwd5FdZc89nZCyiBgONzAl+jQgwIjcuW2kI/3Zdx8qUIpWcQvq3PHH6mRORME+
         9v1Bj5SKOHdlIwmLEC2sPUgQ0oOrPMF9Hc+bBgK/Zi66BD3qfh98FW5ooOgEgw0Jl1Oq
         H4G5qStTL/ZJwp2APMi2y/kq7szw8KBylVyew1Riars/DRVGJ5xsWiYvjaSphbe7Ysc/
         uszB9v0iELWnTKbrmlE9i+/hqb9XZ5m6mq3dU1NbTyBHIkM7bP3OeZkR52YQDWLGsCSo
         nmCA==
X-Gm-Message-State: AOAM532EICLK2ZGJRpNnUQiSZ4HYdHAC0V9ElhPe0aNpLTI/sEKGvpAK
        DaivZY2ePe2J4opbMtC+NwbQapCYcwZ+29tq59YNlg==
X-Google-Smtp-Source: ABdhPJxfuEmhMR9o0/g2hgYVXDx6lw/n8Xqvuwbr/l6/CUCx+M7LoZiDWCL6t/nIP5gZg+qjAKK7pDaYQakPi7afJ+8=
X-Received: by 2002:a05:6402:5cc:: with SMTP id n12mr35554738edx.246.1637818948087;
 Wed, 24 Nov 2021 21:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
 <CAHCN7xLwYcS55N7SNT4k3NqF=Lgdjfe92nJHSVMKkhCuSAPaYw@mail.gmail.com>
In-Reply-To: <CAHCN7xLwYcS55N7SNT4k3NqF=Lgdjfe92nJHSVMKkhCuSAPaYw@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 25 Nov 2021 11:12:17 +0530
Message-ID: <CAMty3ZDCCRXLvHaoW=8gqq+3B0j4uQvAk72YjXKr=cxuf7GAkg@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Adam Ford <aford173@gmail.com>
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

On Tue, Nov 23, 2021 at 7:29 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Sun, Nov 21, 2021 at 4:25 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Adam,
> >
> > On Sat, Nov 06, 2021 at 10:54:23AM -0500, Adam Ford wrote:
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
> > >  #define BLK_SFT_RSTN 0x0
> > >  #define BLK_CLK_EN   0x4
> > > +#define BLK_MIPI_RESET_DIV   0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> > >
> > >  struct imx8m_blk_ctrl_domain;
> > >
> > > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> > >       const char *gpc_name;
> > >       u32 rst_mask;
> > >       u32 clk_mask;
> > > +
> > > +     /*
> > > +      * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > > +      * which is used to control the reset for the MIPI Phy.
> > > +      * Since it's only present in certain circumstances,
> > > +      * an if-statement should be used before setting and clearing this
> > > +      * register.
> > > +      */
> > > +     u32 mipi_phy_rst_mask;
> > >  };
> > >
> > >  #define DOMAIN_MAX_CLKS 3
> > > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > >
> > >       /* put devices into reset */
> > >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +     if (data->mipi_phy_rst_mask)
> > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > >
> > >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> > >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> > >
> > >       /* release reset */
> > >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > > +     if (data->mipi_phy_rst_mask)
> > > +             regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > >
> > >       /* disable upstream clocks */
> > >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> > >       struct imx8m_blk_ctrl *bc = domain->bc;
> > >
> > >       /* put devices into reset and disable clocks */
> > > +     if (data->mipi_phy_rst_mask)
> > > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > > +
> >
> > Is it the best option to enable/disable both the master and slave MIPI
> > DPHY, regardless of whether they're used or not ? Or would it be better
> > to implement a reset controller to expose the two resets independently,
> > and acquire them from the corresponding display and camera drivers ?
>
> In some early attempts to implement the blk-ctrl driver, there was an
> attempt to enable a reset controller, but it caused some hanging and
> issues with suspend-resume due to chicken-egg issues where some items
> were coming up in the wrong order.  I think the decision was made to
> make the resets part of the power domain so it's very clear that the
> order of operations.  Lucas might be able to elaborate more on this.

I think supporting via phy driver make sense to me since this resent
is DPHY specific and nothing related to blk-ctrl.

>
> If bits 16 and 17 can act independently and bit 16 only impacts the
> CSI  and doesn't require bit 17, it seems reasonable to me to have the
> power-domain part of  the CSI, since this would only be enabled when
> the CSI is active.  The power domain is idled when the CSI is idled
> which would effectively place the phy in and out of reset only
> depending on the state of the CSI.  I am guessing this reset bit
> should be assigned to DISPBLK_PD_MIPI_CSI and not
> DISPBLK_PD_CSI_BRIDGE, but I can run some more tests.
>
> AFAIK, there is no phy driver for the CSI like there is the DSI, so
> adding that would require additional work to the CSI driver to work
> around this quirk.  We don't have an acceptable DSI driver yet, so I'd
> like to push a V3 with just the corresponding bit enabled for MIPI_CSI
> after some testing.  FWICT, NXP set both bits 16 and 17 in their ATF
> gpc code, and it never gets cleared, so I think having the bit set and
> cleared on demand is an improvement.

How about using the previous one that Marek sent. Add it via CSI
pipeline and i think it would directly.

https://www.spinics.net/lists/devicetree/msg381691.html

Jagan.
