Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8ED645A448
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 14:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhKWOC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhKWOC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:02:59 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFC2C061574;
        Tue, 23 Nov 2021 05:59:50 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r25so55636502edq.7;
        Tue, 23 Nov 2021 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zBJ46VCZftKYaX4m/MsR0nlZ09nGnHLIIi/Y8boq1S4=;
        b=ml3xIPBlr60dBMCYl5SLkJ93OBEOai8j9KgKFEUeiaF3Qn+KW4CfKf2QfuGjsAtz8P
         EXhcTwVOwqB61XeWlDGa1PKI3HTKllXmvMlueySF5hxgeT5Uo3fGXXm+44cuEmGA2c4i
         Bn2efWPt8bAqAt2mBdX+jchCQ1Sb+gRrpQRZpJzjxSi+b0LeqNbi8oCNdGBB2ahCenwB
         bqzTAfHHqHObfP48ju/EC+jfL7e+TsDQ8jo1ARpjI+m/4jA1zcXrp2FCyk+S7VdjAkk4
         hp9evIWnjIch1SGV5dOKM1kD1S7L4+7u9/UYMsTvl1jsTgutPTABf/aSZsZfsf45z5ZC
         aZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zBJ46VCZftKYaX4m/MsR0nlZ09nGnHLIIi/Y8boq1S4=;
        b=yOm6gtUYssTrz1WyPTrpSADHStGJxvLg16gk70lFe5vEjnqCLZu/Jas9gWEOWE9tw6
         KxFNrbYaQCI8bMVtJO0pFoll8MyFRUAKK0OXHuIhqFfVbSvnTLZoQDkxfRkR95AYuDkg
         GJ15cM3lGMSUTDlbTuuPk5Z0fADsdzrlnx+I8YmgIlPbUKpgT5AVE1OLBzdwkQKm6AC8
         lMCCSJRPya0VKUj0bYI1NnuRp8wqjPdy/l4T5vGQUYGcwJBGEfFUEQ0afMSuIvWVJ9oz
         oNcnhc/MUQQSdeWqUco2UgcWyuoYjmMQZMovWaAb2q/9ejL+/WPClczAun7h40mpK3rq
         z9Bw==
X-Gm-Message-State: AOAM530TXD5BBej4835vEz0Liiiyo8OIPtS6EwzD9cc5sgyp0zbzEb/9
        0Qpt4vLctdpA0WjYQ69/K3tq+O+Sb0kmu5nwD88=
X-Google-Smtp-Source: ABdhPJxlyDwl5cBif++Ea2x8vpPPUcK2k0klOLHoDwvnP/g5WHAWxK4LzO+Lhk3pJjlqvBtQFRzdaEAqB4H2pgpO0CU=
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr9682609edd.165.1637675987562;
 Tue, 23 Nov 2021 05:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
In-Reply-To: <YZrHWkbYkrILP9oo@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 23 Nov 2021 07:59:36 -0600
Message-ID: <CAHCN7xLwYcS55N7SNT4k3NqF=Lgdjfe92nJHSVMKkhCuSAPaYw@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
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

On Sun, Nov 21, 2021 at 4:25 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Sat, Nov 06, 2021 at 10:54:23AM -0500, Adam Ford wrote:
> > Most of the blk-ctrl reset bits are found in one register, however
> > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > out of reset or the MIPI_CSI hangs.
> >
> > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >
> > V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
> >      Rename the new register to mipi_phy_rst_mask
> >      Encapsulate the edits to this register with an if-statement
> >
> >  drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > index 519b3651d1d9..581eb4bc7f7d 100644
> > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > @@ -17,6 +17,7 @@
> >
> >  #define BLK_SFT_RSTN 0x0
> >  #define BLK_CLK_EN   0x4
> > +#define BLK_MIPI_RESET_DIV   0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> >
> >  struct imx8m_blk_ctrl_domain;
> >
> > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> >       const char *gpc_name;
> >       u32 rst_mask;
> >       u32 clk_mask;
> > +
> > +     /*
> > +      * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > +      * which is used to control the reset for the MIPI Phy.
> > +      * Since it's only present in certain circumstances,
> > +      * an if-statement should be used before setting and clearing this
> > +      * register.
> > +      */
> > +     u32 mipi_phy_rst_mask;
> >  };
> >
> >  #define DOMAIN_MAX_CLKS 3
> > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >       /* put devices into reset */
> >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +     if (data->mipi_phy_rst_mask)
> > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> >
> >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >       /* release reset */
> >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +     if (data->mipi_phy_rst_mask)
> > +             regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> >
> >       /* disable upstream clocks */
> >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> >       struct imx8m_blk_ctrl *bc = domain->bc;
> >
> >       /* put devices into reset and disable clocks */
> > +     if (data->mipi_phy_rst_mask)
> > +             regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > +
>
> Is it the best option to enable/disable both the master and slave MIPI
> DPHY, regardless of whether they're used or not ? Or would it be better
> to implement a reset controller to expose the two resets independently,
> and acquire them from the corresponding display and camera drivers ?

In some early attempts to implement the blk-ctrl driver, there was an
attempt to enable a reset controller, but it caused some hanging and
issues with suspend-resume due to chicken-egg issues where some items
were coming up in the wrong order.  I think the decision was made to
make the resets part of the power domain so it's very clear that the
order of operations.  Lucas might be able to elaborate more on this.

If bits 16 and 17 can act independently and bit 16 only impacts the
CSI  and doesn't require bit 17, it seems reasonable to me to have the
power-domain part of  the CSI, since this would only be enabled when
the CSI is active.  The power domain is idled when the CSI is idled
which would effectively place the phy in and out of reset only
depending on the state of the CSI.  I am guessing this reset bit
should be assigned to DISPBLK_PD_MIPI_CSI and not
DISPBLK_PD_CSI_BRIDGE, but I can run some more tests.

AFAIK, there is no phy driver for the CSI like there is the DSI, so
adding that would require additional work to the CSI driver to work
around this quirk.  We don't have an acceptable DSI driver yet, so I'd
like to push a V3 with just the corresponding bit enabled for MIPI_CSI
after some testing.  FWICT, NXP set both bits 16 and 17 in their ATF
gpc code, and it never gets cleared, so I think having the bit set and
cleared on demand is an improvement.

>
> >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> >       regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> >
> > @@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> >               .gpc_name = "mipi-csi",
> >               .rst_mask = BIT(3) | BIT(4),
> >               .clk_mask = BIT(10) | BIT(11),
> > +             .mipi_phy_rst_mask = BIT(16) | BIT(17),
> >       },
> >  };
> >

adam

>
> --
> Regards,
>
> Laurent Pinchart
