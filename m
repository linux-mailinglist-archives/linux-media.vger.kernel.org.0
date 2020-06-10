Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A241F4A57
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 02:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgFJATS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 20:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgFJATQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 20:19:16 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70422C08C5C2
        for <linux-media@vger.kernel.org>; Tue,  9 Jun 2020 17:19:13 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o15so518572ejm.12
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osOp62FOVSqRL+E7gP5oUkLSdJ4xEblHVOQqnKObuJg=;
        b=OtKLqIV15kjEqxBBfDDaEcjwg6m5s832ETbdujbwQM40qfO4Qq+zCy7SC6tJ5bhZRP
         bZ75nPDnmazU6TczBrxPS4B3f1CLzJ2U+kRN1OxspFM37QOlrmqSrE66NHLlrgM7y/Kg
         5LasFEqyo5bXZ6lNswAmbGlOlDKlW6FyAHN4y6SIeeiiUawVAu3F1G1VhWKSZtDH3Gp4
         witYF+Dd6rHjnqrF4BgQxeQ/XJ94YL2U/KoHQHhdrZzmt9YeI4Jojy1y4tSqNY63KQ9G
         6qSTTZzj5PIgWKY6DQdCDy/2B8aQzjMToKKtYYk47XTWYccg+nOr2dV5/FkWnD0SGJid
         QIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osOp62FOVSqRL+E7gP5oUkLSdJ4xEblHVOQqnKObuJg=;
        b=hppKMpmE80PlWtAscLjcgQWL7enAqqOJXaKn8MgjqQnu3q94OR+WcR8hGoiZwz5W8G
         m3dCDqx+GbrtSBKQgndsixb3HKTPAHp4C3Dcd3DbetEwN0y/HSoh9q9SOtX05Y1liHNQ
         qpolHbFjsrEk0XVO1I/VfZCxh/38pdX+wX4u5cpuiRnxpMex8DLKp26r2DSlqldA7QY4
         e+rWMEQqciOCLcSG2+QKOZHHDryo3H7D3VDqTuUL+m5HLvsAjh/YpwUO61QRD659NTmR
         /A30LjfwyVJqzexr7rvSIWcPesVZioN2yCD7NM3h1wQk7pxwKClod+hjuMyoskd9gKol
         eqOA==
X-Gm-Message-State: AOAM530hnHTynWJKkSZy+1CV63RFNOb+rAwQImj3+kUsMrVjKin5tIZg
        c49qPQNzJBRnXMhAkj+CT+kic0paP6ODFTs8r9o6tQ==
X-Google-Smtp-Source: ABdhPJxSPuIjrsQ3IPmuQwBPRX78SQ9HxCf/DqzfA8M6A9Er87ytDIw9ZOT1GQgn2LQO1dOBTXPw/niqe343ffym53s=
X-Received: by 2002:a17:906:51c9:: with SMTP id v9mr817357ejk.337.1591748352024;
 Tue, 09 Jun 2020 17:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
 <20200320131256.23294-4-p.zabel@pengutronix.de> <58431830e527c8acb873487f5173e437bee712a6.camel@pengutronix.de>
 <ded561992900a23e9a0135855e9455a07c67ddaf.camel@collabora.com>
In-Reply-To: <ded561992900a23e9a0135855e9455a07c67ddaf.camel@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 9 Jun 2020 21:19:00 -0300
Message-ID: <CAAEAJfDm=XAhsTbUyuhKydyzX=1DAf75WUeY4E7qbhaNQE84Lw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Shawn,

Gentle ping.

Thanks a lot!
Ezequiel

On Wed, 27 May 2020 at 22:02, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Wed, 2020-05-27 at 18:19 +0200, Philipp Zabel wrote:
> > Hi Shawn,
> >
> > On Fri, 2020-03-20 at 14:12 +0100, Philipp Zabel wrote:
> > > Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
> > > decoder cores and a reset/control block.
> > >
> > > Hook up the bus clock to the VPU power domain to enable handshakes, and
> > > configure the core clocks to 600 MHz and the bus clock to 800 MHz by
> > > default.
> > >
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > could you pick up this patch? The driver and binding parts have been
> > merged in media/master.
> >
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> It looks good and it matches the downstream device tree.
>
> Thanks,
> Ezequiel
>
> > regards
> > Philipp
> >
> > > ---
> > > New in v6.
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 27 +++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > index 6a1e83922c71..98e464ecb68a 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > @@ -666,6 +666,7 @@
> > >                                     pgc_vpu: power-domain@6 {
> > >                                             #power-domain-cells = <0>;
> > >                                             reg = <IMX8M_POWER_DOMAIN_VPU>;
> > > +                                           clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > >                                     };
> > >
> > >                                     pgc_disp: power-domain@7 {
> > > @@ -1130,6 +1131,32 @@
> > >                     status = "disabled";
> > >             };
> > >
> > > +           vpu: video-codec@38300000 {
> > > +                   compatible = "nxp,imx8mq-vpu";
> > > +                   reg = <0x38300000 0x10000>,
> > > +                         <0x38310000 0x10000>,
> > > +                         <0x38320000 0x10000>;
> > > +                   reg-names = "g1", "g2", "ctrl";
> > > +                   interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > > +                   interrupt-names = "g1", "g2";
> > > +                   clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > > +                            <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > > +                            <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > > +                   clock-names = "g1", "g2", "bus";
> > > +                   assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> > > +                                     <&clk IMX8MQ_CLK_VPU_G2>,
> > > +                                     <&clk IMX8MQ_CLK_VPU_BUS>,
> > > +                                     <&clk IMX8MQ_VPU_PLL_BYPASS>;
> > > +                   assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> > > +                                            <&clk IMX8MQ_VPU_PLL_OUT>,
> > > +                                            <&clk IMX8MQ_SYS1_PLL_800M>,
> > > +                                            <&clk IMX8MQ_VPU_PLL>;
> > > +                   assigned-clock-rates = <600000000>, <600000000>,
> > > +                                          <800000000>, <0>;
> > > +                   power-domains = <&pgc_vpu>;
> > > +           };
> > > +
> > >             pcie0: pcie@33800000 {
> > >                     compatible = "fsl,imx8mq-pcie";
> > >                     reg = <0x33800000 0x400000>,
>
>
