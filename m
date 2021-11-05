Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D504464BD
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 15:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhKEOY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 10:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbhKEOY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 10:24:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF1C061714;
        Fri,  5 Nov 2021 07:21:48 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id f4so33377454edx.12;
        Fri, 05 Nov 2021 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nnnVvlGTiPHibPGvPFnpFUDaE+wSskxSIJ6O1Dz1Zpc=;
        b=jXh3ih7gM73bqYRUWrmKkY1kBFaYzFibFskV4wP78k5ooOYKmd9fIDOyFwfcmtmk7a
         dNdtSQFXxXnPac6z87NQejuP9togq0sBJt8ZR4CH5NmibVcZjg/bFUJyiVzV8K1bylAX
         7XJjpHkaoapBNafE8jivAAbVnoI3SIqKC/+NVMoHSejOYaSnVPnd0SxYULLLMPdf96LM
         ElCx2cqdYbhhbstkppBxiERjrx2nr8HDR6Po1OLGx8W3GyKmxiCvpjaDshXfKpN6T9tB
         UTDXjvyZsVX/O/jcvvZEWoZzi7/LrWX3oxwUF1YVww19k3JNSQAxL8gF/aXM0Oj1sv1V
         ATQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnnVvlGTiPHibPGvPFnpFUDaE+wSskxSIJ6O1Dz1Zpc=;
        b=Y2KLeCXgqOIwnZOHNdp9KaTIZiiHqqzCAgcChtSTLsndoLaxRIhKgh0SqFswclDOkh
         VHzH6Bp0yE+jBzmLDcpF+mqlkA6OlHkcBnB4PlMLqI6zozto1xMzLmNacG08PKKascB7
         BFr7rK7nrC0Fv6rSlmBLe74wZiI2+52IALZMZ3QqAdfGblsWdHTFLJtGk8kuKZmToSJU
         lTME7sfw0CQhHLJ0meaFckK5yUkme4EvcI3pgqI0Lt9QJnkn+vadF9dyQvjSZ+hXB/vS
         daoXFsG2dJuMOZp3gUJmMiG4rfiG+7ddubWAa6ul8+CQVH6TG+QElXeDTsstio0Er6bQ
         q+uQ==
X-Gm-Message-State: AOAM531ZfUrWcvbj+jdkEuHRblW9e5ZfeqWEUXZ9SUiAmFjyxsn2501A
        m5rD2+pGg0olbLeoJXwK12ptETnx/EFq0K13dIg=
X-Google-Smtp-Source: ABdhPJykcb6NNkE68484aFwFvdCNeKLqdyfiXyPHFWypBl043e2etrA3R2NxpU2tvVNIFmPKPfXq6mOcIF91Y9u5Qyc=
X-Received: by 2002:a17:906:3c46:: with SMTP id i6mr12389123ejg.371.1636122106352;
 Fri, 05 Nov 2021 07:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211105134228.731331-1-aford173@gmail.com> <4e2feba40ea3f93560e63a9b6af21c78188f02fe.camel@pengutronix.de>
In-Reply-To: <4e2feba40ea3f93560e63a9b6af21c78188f02fe.camel@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 5 Nov 2021 09:21:35 -0500
Message-ID: <CAHCN7xLJeR5V+AGR0GQ55Hf72xO-RJ06UJ8SpzeeqSQ7LHHpGw@mail.gmail.com>
Subject: Re: [PATCH 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
To:     Lucas Stach <l.stach@pengutronix.de>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 5, 2021 at 9:01 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Adam,
>
> Am Freitag, dem 05.11.2021 um 08:42 -0500 schrieb Adam Ford:
> > Most of the blk-ctrl reset bits are found in one register, however
> > there are two bits in offset 8 for pulling the MIPI DPHY out of reset
> > and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
> > out of reset or the MIPI_CSI hangs.
> >
> I'm undecided yet if I like this solution, as register 0x8 has
> different content on different instances of the blk-ctrl, so naming it
> mipi_rst_mask is confusing for others.

 Both Mini and Nano use it, so I could add a comment that this
register only applies to Mini and Nano.  For all others, it would be
empty and do nothing anyway.  If you have a name you'd prefer, I can
do that.

>
> My initial thought was that we should habe a MIPI PHY driver
> controlling all the registers in the disp-blk-ctrl, other than SFT_RSTN
> and CLK_EN, however I see how the reset handling for the PHY would then
> be inconsistent with how we handle all the other devices in the disp-
> blk domain. But then the HW guys seemed to think along the same lines,
> as they placed the PHY resets into the PHY registers, instead of the
> SFT_RSTN, which had more than enough spare bits to carry those
> resets...

The NXP ATF code sets these bits in the GPC code with the other power
domain stuff, so it seems like they intended it to be used as a power
domain thing and not MIPI PHY driver.

>
> > Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  drivers/soc/imx/imx8m-blk-ctrl.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
> > index 519b3651d1d9..5506bd075c35 100644
> > --- a/drivers/soc/imx/imx8m-blk-ctrl.c
> > +++ b/drivers/soc/imx/imx8m-blk-ctrl.c
> > @@ -17,6 +17,7 @@
> >
> >  #define BLK_SFT_RSTN 0x0
> >  #define BLK_CLK_EN   0x4
> > +#define BLK_MIPI_RESET_DIV   0x8
> >
> >  struct imx8m_blk_ctrl_domain;
> >
> > @@ -36,6 +37,7 @@ struct imx8m_blk_ctrl_domain_data {
> >       const char *gpc_name;
> >       u32 rst_mask;
> >       u32 clk_mask;
> > +     u32 mipi_rst_mask;
> >  };
> >
> >  #define DOMAIN_MAX_CLKS 3
> > @@ -78,6 +80,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >       /* put devices into reset */
> >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +     regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
> >
> >       /* enable upstream and blk-ctrl clocks to allow reset to propagate */
> >       ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> > @@ -99,6 +102,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
> >
> >       /* release reset */
> >       regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +     regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
> >
> >       /* disable upstream clocks */
> >       clk_bulk_disable_unprepare(data->num_clks, domain->clks);
> > @@ -122,6 +126,7 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
> >       /* put devices into reset and disable clocks */
> >       regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> >       regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> > +     regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
>
> For consistency the reset assertion should be put before the clock
> disable.

I can do that.  How do you want me to proceed?

adam

>
> Regards,
> Lucas
>
> >
> >       /* power down upstream GPC domain */
> >       pm_runtime_put(domain->power_dev);
> > @@ -488,6 +493,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
> >               .gpc_name = "mipi-csi",
> >               .rst_mask = BIT(3) | BIT(4),
> >               .clk_mask = BIT(10) | BIT(11),
> > +             .mipi_rst_mask = BIT(16) | BIT(17),
> >       },
> >  };
> >
>
>
