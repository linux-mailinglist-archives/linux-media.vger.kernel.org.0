Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BDF4579BD
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 00:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235655AbhKSXy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 18:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233511AbhKSXy4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 18:54:56 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FEEC06173E
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 15:51:54 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id c4so10661298pfj.2
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 15:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BODgI+WH9LDVPfnVoZrz8d3kpc2ZwF9HgTMT9m1WMDQ=;
        b=6oYTnLaHwy9ijpC6lNTNV6Qkj2pZqSmjviJstsVZsZP0/+D50bGRVCOSNcnlrcLvw+
         QAGdsMcr/2GxGj2l/vnyThoZA/kAPTn5SbqVqvzihWfmVGHn25aUwLc1xJ56lp5/r1gs
         FWqjp4e1lqvWB5XA2xe8CTiL7HltqlnWrQf7FGjhksEohu1BJ04N3OYL0Cm9IO+C6bOE
         K8+NnUheB0nFJRCcC0JAdX02mc+xgVC7A7uTQP8o2aJ5ljJpH751/Vw9JwX5tvvFTF6a
         RDNRdfg6YJTKJWiucUhEEDK8nCA5psGA1aNS53szgd3vHFfFH6COAlsB0mcbIUhbtSqk
         tIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BODgI+WH9LDVPfnVoZrz8d3kpc2ZwF9HgTMT9m1WMDQ=;
        b=zozTnQB10CFG5WU8P/6GU1EjwJOuzHHxamK7weDewNHQkkGv5n1ny7yoBrByvWG6Tp
         AMmV1OVKv4MTIjLHGjJIEqnJY2zL2Ou9CMIFF2K+iWGmrKSPcEHbMDfH4e+24OJpOAJM
         geu//dhgJE/JU7Zv5sbrChpDNaRjiiY0f4OZJhFacQh92YCZWcjBrugnos0CjXTEKv+m
         f2R7VMz5ejSiVmpIpPQglr3NJN66RrsTBAICxmC/CSzXgVCvMGI9Kf+pGsKkYqOgRo7y
         g9UmhXBmt7XvFUsH/GcczD59Y61m7FHr4GDaikBxXyJLHaPKB6g0iTpe9khbZ0MmZTqQ
         k85Q==
X-Gm-Message-State: AOAM530nEcDhTqUsNYQsbCvJdAGSROz8Si4WW+T9N5R4EH1REYeF4h/C
        d9AsnPvIM54Bk9gFHZ2GaYcKw739ZuVRggS+1r8flQ==
X-Google-Smtp-Source: ABdhPJzMB8p8ddmaSy56jyawOAPXfj6DxYfYBB3H9qwDBj8andYHK6U8EliK1jklUWV3cYAdwsMq1nvEqhbR6YkBIqk=
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id
 d9-20020aa78149000000b0044c916c1fdbmr26820650pfn.34.1637365913491; Fri, 19
 Nov 2021 15:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <CAMty3ZDi+FMLBooi2jt=dPKVC8PhaBWLgtjoe3m=GHCNiqDqQw@mail.gmail.com>
In-Reply-To: <CAMty3ZDi+FMLBooi2jt=dPKVC8PhaBWLgtjoe3m=GHCNiqDqQw@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 19 Nov 2021 15:51:42 -0800
Message-ID: <CAJ+vNU3sCk2r2TX0=-N76wWxWNna7qnYnruxVxPTGD8L6yVtug@mail.gmail.com>
Subject: Re: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Adam Ford <aford173@gmail.com>,
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

On Thu, Nov 11, 2021 at 10:55 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Sat, Nov 6, 2021 at 9:24 PM Adam Ford <aford173@gmail.com> wrote:
> >
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
>
> This is DPHY reset mask, not sure we can handle this via blk-ctrl.
> Marek has similar patch to support this [1]. we need to phandle the
> phy in host node in order to work this.
>
> However this current patch change seems directly handling dphy reset
> which indeed fine me as well.
>
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
> >  #define BLK_SFT_RSTN   0x0
> >  #define BLK_CLK_EN     0x4
> > +#define BLK_MIPI_RESET_DIV     0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
> >
> >  struct imx8m_blk_ctrl_domain;
> >
> > @@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
> >         const char *gpc_name;
> >         u32 rst_mask;
> >         u32 clk_mask;
> > +
> > +       /*
> > +        * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
> > +        * which is used to control the reset for the MIPI Phy.
> > +        * Since it's only present in certain circumstances,
> > +        * an if-statement should be used before setting and clearing this
> > +        * register.
> > +        */
> > +       u32 mipi_phy_rst_mask;
>
> May be dphy_rst_mask (above comment may not be required, as it
> understand directly with commit message).
>
> >  };
> >
> >  #define DOMAIN_MAX_CLKS 3
> > @@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >         /* put devices into reset */
> >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +       if (data->mipi_phy_rst_mask)
> > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> >
> >         /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> >         ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > @@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >         /* release reset */
> >         regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +       if (data->mipi_phy_rst_mask)
> > +               regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> >
> >         /* disable upstream clocks */
> >         clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > @@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> >         struct imx8m_blk_ctrl *bc = domain->bc;
> >
> >         /* put devices into reset and disable clocks */
> > +       if (data->mipi_phy_rst_mask)
> > +               regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
> > +
> >         regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> >         regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> >
> > @@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> >                 .gpc_name = "mipi-csi",
> >                 .rst_mask = BIT(3) | BIT(4),
> >                 .clk_mask = BIT(10) | BIT(11),
> > +               .mipi_phy_rst_mask = BIT(16) | BIT(17),
>
> DPHY has BIT(17) for Master reset and BIT(16) for Slave reset. I think
> we just need master reset to enable. I've tested only BIT(17) on
> mipi-dsi gpc and it is working.
>

Jagan,

In my testing I had to use BIT(16) | BIT(17) in order to capture via CSI.

Best regards,

Tim
