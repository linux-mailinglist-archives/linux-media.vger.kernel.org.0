Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF2A3A4318
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 15:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFKNg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 09:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFKNg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 09:36:56 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A41DC061574;
        Fri, 11 Jun 2021 06:34:46 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w127so5800428oig.12;
        Fri, 11 Jun 2021 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOEeO6Yx/UUevsmguZogDl2rKUzOM84efBMRN1u0UBM=;
        b=KlljV5bfm99mzh/C6UvOvdMZb0DlxPHqcox+GsVlf8v7X9xGCjAmPgBkcmfzZJo6xJ
         NvQ3EwZiU8d/Usmk7hPaMVm943m7lnxQrgYkHpNtDsVVNVnmDd0KfxGEw7TbqSt5KMbE
         stm/S/UacgNolBQWl7eHLEwY9cxVLNns13Byw0FXuClvipdSnC5bJEQpEdunMzR8jbFy
         kbelFMCJh77IPoWaLVpbpv1yg73y91gc5FsqAr4Xqi1D9wM7QOGPbIogfP119AabYkkr
         vXV47Xcvl/ZFnE+TBlvcI0SOTXNk/usqwusN5xPnmhy/b3khcaip4Adi7qdJoXxBNhLK
         CdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOEeO6Yx/UUevsmguZogDl2rKUzOM84efBMRN1u0UBM=;
        b=NoadiIh7cXbPzXUomplPWdFXEOvsafoYHUjAaRhjG9OiLs+JDU3X4Ni3FycYm9O2MC
         ESWSoyUyx/0xB652LlDcgWA4DkdjYfOIyEXLxxAjJjJKltvZWLADEgZ0ggC4hFgeGWRa
         4+HwtrlxYxQZECWTL5fkYM6paCmUfrp5TFffjBtgcfBjkqx+prIe5E0gthW5eIDeJuMR
         wsLHGAsuK/XUrZSnUXq+K7Ba2WNb4ovSxpRc6M1xqVE/ZrNExV91BpOhE++kQsXJLPSh
         ZhNauaFDxp9lHKT3fB+oOYosmOGxyANh4gmfIidmzyPJObgtKjJ/88x65leubsg/wb4f
         yxZQ==
X-Gm-Message-State: AOAM531hE9lPBmfV4x1HGwhDxLVFW1dvzW+OoJG/mzHZz/NcFQrOT8PM
        TSUniWTfR9cKYwDrR1H2JBYS07R5Ku2NMPD+/t0=
X-Google-Smtp-Source: ABdhPJzU1wpb2b19gscLn0AdCh0Hy4c1dn5bZ+kN0rwn8lJf9l3B+sNpxzGvEgfZdBEuU3uBHYqjFB+2Y5lB57oe+Dk=
X-Received: by 2002:aca:3385:: with SMTP id z127mr2426897oiz.142.1623418485563;
 Fri, 11 Jun 2021 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
 <20210522211055.15988-3-mirela.rabulea@oss.nxp.com> <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <e4c174afd7c55c56c68afbe69276b41c3f574964.camel@nxp.com>
In-Reply-To: <e4c174afd7c55c56c68afbe69276b41c3f574964.camel@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Fri, 11 Jun 2021 21:33:29 +0800
Message-ID: <CAA+hA=TEi3iZ+nOfff=aN1FrLGb6+OHfx23aWaa1J7YfZRRgtA@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
To:     Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[...]

> > > +img_subsys: bus@58000000 {
> > > +   compatible = "simple-bus";
> > > +   #address-cells = <1>;
> > > +   #size-cells = <1>;
> > > +   ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> > > +
> > > +   img_ipg_clk: clock-img-ipg {
> > > +           compatible = "fixed-clock";
> > > +           #clock-cells = <0>;
> > > +           clock-frequency = <200000000>;
> > > +           clock-output-names = "img_ipg_clk";
> > > +   };
> > > +
> > > +   jpegdec: jpegdec@58400000 {
> >
> > Node should be disabled by default.
> > And enable it in board dts including LPCG.
>
> At version v5 of this patch, the node was disabled by default, and I
> received this feedback from Ezequiel Garcia:
>
> "Pure memory-to-memory are typically not enabled per-board, but just
> per-platform.
> So you can drop the disabled status here."
>
> So, in v6 I made it enabled by default.
>
> Any strong reasons for enabled/disabled per platform?

AFAIK we usually only enable system basic features and let other
user selectable features disabled by default in dts.
Even for device LPCG clocks, if it's enabled by default and later
enter runtime suspend if no users, it still consumes power.

Regards
Aisheng

>
> Thanks,
> Mirela
>
> >
> > > +           reg = <0x58400000 0x00050000 >;
> > > +           interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> > > +           clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
> > > +                    <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
> > > +           clock-names = "per", "ipg";
> > > +           assigned-clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
> > > +                             <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
> > > +           assigned-clock-rates = <200000000>, <200000000>;
> > > +           power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> > > +                           <&pd IMX_SC_R_MJPEG_DEC_S0>,
> > > +                           <&pd IMX_SC_R_MJPEG_DEC_S1>,
> > > +                           <&pd IMX_SC_R_MJPEG_DEC_S2>,
> > > +                           <&pd IMX_SC_R_MJPEG_DEC_S3>;
> > > +   };
> > > +
> > > +   jpegenc: jpegenc@58450000 {
> >
> > Ditto
> >
> > > +           reg = <0x58450000 0x00050000 >;
> > > +           interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> > > +           clocks = <&img_jpeg_enc_lpcg IMX_LPCG_CLK_0>,
> > > +                    <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
> > > +           clock-names = "per", "ipg";
> > > +           assigned-clocks = <&img_jpeg_enc_lpcg IMX_LPCG_CLK_0>,
> > > +                             <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
> > > +           assigned-clock-rates = <200000000>, <200000000>;
> > > +           power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> > > +                           <&pd IMX_SC_R_MJPEG_ENC_S0>,
> > > +                           <&pd IMX_SC_R_MJPEG_ENC_S1>,
> > > +                           <&pd IMX_SC_R_MJPEG_ENC_S2>,
> > > +                           <&pd IMX_SC_R_MJPEG_ENC_S3>;
> > > +   };
> > > +
> > > +   img_jpeg_dec_lpcg: clock-controller@585d0000 {
> >
> > Ditto
> >
> > > +           compatible = "fsl,imx8qxp-lpcg";
> > > +           reg = <0x585d0000 0x10000>;
> > > +           #clock-cells = <1>;
> > > +           clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> > > +           clock-indices = <IMX_LPCG_CLK_0>,
> > > +                           <IMX_LPCG_CLK_4>;
> > > +           clock-output-names = "img_jpeg_dec_lpcg_clk",
> > > +                                "img_jpeg_dec_lpcg_ipg_clk";
> > > +           power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
> > > +   };
> > > +
> > > +   img_jpeg_enc_lpcg: clock-controller@585f0000 {
> > > +           compatible = "fsl,imx8qxp-lpcg";
> >
> > Ditto
> >
> > Otherwise, I'm fine with this patch.
> >
> > > +           reg = <0x585f0000 0x10000>;
> > > +           #clock-cells = <1>;
> > > +           clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> > > +           clock-indices = <IMX_LPCG_CLK_0>,
> > > +                           <IMX_LPCG_CLK_4>;
> > > +           clock-output-names = "img_jpeg_enc_lpcg_clk",
> > > +                                "img_jpeg_enc_lpcg_ipg_clk";
> > > +           power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
> > > +   };
> > > +};
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> > > new file mode 100644
> > > index 000000000000..7764b4146e0a
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> > > @@ -0,0 +1,12 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2021 NXP
> > > + */
> > > +
> > > +&jpegdec {
> > > +   compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec"; };
> > > +
> > > +&jpegenc {
> > > +   compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgenc"; };
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > > index 12cd059b339b..aebbe2b84aa1 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > > @@ -166,11 +166,13 @@
> > >     };
> > >
> > >     /* sorted in register address */
> > > +   #include "imx8-ss-img.dtsi"
> > >     #include "imx8-ss-dma.dtsi"
> > >     #include "imx8-ss-conn.dtsi"
> > >     #include "imx8-ss-lsio.dtsi"
> > >  };
> > >
> > > +#include "imx8qm-ss-img.dtsi"
> > >  #include "imx8qm-ss-dma.dtsi"
> > >  #include "imx8qm-ss-conn.dtsi"
> > >  #include "imx8qm-ss-lsio.dtsi"
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> > > new file mode 100644
> > > index 000000000000..3a087317591d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> > > @@ -0,0 +1,13 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2021 NXP
> > > + * Dong Aisheng <aisheng.dong@nxp.com>
> > > + */
> > > +
> > > +&jpegdec {
> > > +   compatible = "nxp,imx8qxp-jpgdec";
> > > +};
> > > +
> > > +&jpegenc {
> > > +   compatible = "nxp,imx8qxp-jpgenc";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > index 1e6b4995091e..a625fb6bdc62 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > @@ -258,12 +258,14 @@
> > >     };
> > >
> > >     /* sorted in register address */
> > > +   #include "imx8-ss-img.dtsi"
> > >     #include "imx8-ss-adma.dtsi"
> > >     #include "imx8-ss-conn.dtsi"
> > >     #include "imx8-ss-ddr.dtsi"
> > >     #include "imx8-ss-lsio.dtsi"
> > >  };
> > >
> > > +#include "imx8qxp-ss-img.dtsi"
> > >  #include "imx8qxp-ss-adma.dtsi"
> > >  #include "imx8qxp-ss-conn.dtsi"
> > >  #include "imx8qxp-ss-lsio.dtsi"
> > > --
> > > 2.17.1
> >
> >
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
