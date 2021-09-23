Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3D8415FBF
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 15:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241224AbhIWN33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 09:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241205AbhIWN3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 09:29:24 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA92C061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 06:27:52 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id gs10so4058857qvb.13
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pE+kUqL2PlpkB8tQauFk5qMrInUsMZVJSIrm21iK2iU=;
        b=4m/+LebjmmnGicS8Pd8sJRVPobVe1maXDDWoaAVFwieN1i6hw3Kp9kzoGbTkRh1UhT
         9swqVq7r06t6/o3wKxFUtITIzYtdh4I6mbtYxcaZzQB8SsFg2Yj5FAlfBenAI3FCBVss
         JgPPrEdGP+MPtcCxGYjv5Fe4eOPgRTxDV8CmdMgcxCP+4f/cb9uK5JETc9krKJG2i90a
         XUWLLzBJ89cEwHNJaYz66VxPz9Qh8lt9RBo6paGaFlENnZXZSlOgui8AtP8tOu3H8DZb
         1mwKzcdJQaY9ctAYR6Qg1hLsPzWOb0qtEpw8TJe9fCLPboN9syR6mOZkX/UT+fKurtoD
         uOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pE+kUqL2PlpkB8tQauFk5qMrInUsMZVJSIrm21iK2iU=;
        b=zPPul8L7n6DhWy/M/5wRvc6Ewn25p9Ej/TIEwmHfpKIMPnGjLUBM0njMgXJF303yHz
         wMXk57K/LeOVCS8tiRqgh445EW4GwrxxtiVb3ICLRH3u+WMdcGWNSv5zrvvcu9M56gmS
         EGzmRnKZ/2OtCiJBGGV4OpOl6rbze9vlJ2CZyABZ1gZObrCMpI3ExmEAAgPkpAyiMZZZ
         Fx4Ty/urIpj93fM1NY9WSoz6asYiFaboTd7ASk6xu2oine+qCnZSD0thpiErDmn94J4B
         /IATP9MB4VpFFDf1QviRqScpUi56H7Dv2c01PVzpcykTjaZx075U3+QNzm9fbWYUI2bZ
         AAVw==
X-Gm-Message-State: AOAM533+dmNNukH0vrILk6m9JSoBLAWG3rj6xuSAdBH7m5aRi5F4DQo/
        T+ZiF02yc+BVlZ/txxx/7I/mQg==
X-Google-Smtp-Source: ABdhPJxKcZBa8xwy3niKjd2dWmWxuN3nSTVdqXmBmAojwo39fnitZFTHCIiwJ4VmaelURDWAHx6F6Q==
X-Received: by 2002:ad4:55b3:: with SMTP id f19mr4555417qvx.16.1632403671727;
        Thu, 23 Sep 2021 06:27:51 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l3sm2755097qtu.47.2021.09.23.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 06:27:51 -0700 (PDT)
Message-ID: <c3d05d4bdd26ea7a2098b53251cefcc4d1f6b589.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH v9 11/13] ARM64: dts: freescale: imx8q: add
 imx vpu codec entries
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 23 Sep 2021 09:27:49 -0400
In-Reply-To: <AM6PR04MB63418DC3AB2CF38DCA63AA25E7A39@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
         <620081ca2f6441de6307792dbb7797da148cf04c.1631521295.git.ming.qian@nxp.com>
         <1a454107661fced1adfd8a76a20a819d75b882d4.camel@ndufresne.ca>
         <AM6PR04MB63418DC3AB2CF38DCA63AA25E7A39@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 23 septembre 2021 à 10:31 +0000, Ming Qian a écrit :
> > -----Original Message-----
> > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > Sent: Wednesday, September 22, 2021 8:55 PM
> > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> > dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: [EXT] Re: [PATCH v9 11/13] ARM64: dts: freescale: imx8q: add imx
> > vpu
> > codec entries
> > 
> > Caution: EXT Email
> > 
> > Hi Ming,
> > 
> > Le lundi 13 septembre 2021 à 17:11 +0800, Ming Qian a écrit :
> > > Add the Video Processing Unit node for IMX8Q SoC.
> > 
> > Just to let you know that this patch no longer apply on 5.15-rc2. Please let
> > us
> > know which was your base.
> 
> Hi Nicolas,
>    The base commit I used is 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead.
>    It's recorded in the conver

Ah, of course, now that you mention I see it, sorry about the noise.

> 
> > 
> > > 
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > > ---
> > >  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 72
> > > +++++++++++++++++++  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > 17 +++++
> > >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 24 +++++++
> > >  3 files changed, 113 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> > > new file mode 100644
> > > index 000000000000..f2dde6d14ca3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> > > @@ -0,0 +1,72 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2021 NXP
> > > + *   Dong Aisheng <aisheng.dong@nxp.com>
> > > + */
> > > +
> > > +vpu: vpu@2c000000 {
> > > +     #address-cells = <1>;
> > > +     #size-cells = <1>;
> > > +     ranges = <0x2c000000 0x0 0x2c000000 0x2000000>;
> > > +     reg = <0 0x2c000000 0 0x1000000>;
> > > +     power-domains = <&pd IMX_SC_R_VPU>;
> > > +     status = "disabled";
> > > +
> > > +     mu_m0: mailbox@2d000000 {
> > > +             compatible = "fsl,imx6sx-mu";
> > > +             reg = <0x2d000000 0x20000>;
> > > +             interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> > > +             #mbox-cells = <2>;
> > > +             power-domains = <&pd IMX_SC_R_VPU_MU_0>;
> > > +             status = "okay";
> > > +     };
> > > +
> > > +     mu1_m0: mailbox@2d020000 {
> > > +             compatible = "fsl,imx6sx-mu";
> > > +             reg = <0x2d020000 0x20000>;
> > > +             interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> > > +             #mbox-cells = <2>;
> > > +             power-domains = <&pd IMX_SC_R_VPU_MU_1>;
> > > +             status = "okay";
> > > +     };
> > > +
> > > +     mu2_m0: mailbox@2d040000 {
> > > +             compatible = "fsl,imx6sx-mu";
> > > +             reg = <0x2d040000 0x20000>;
> > > +             interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
> > > +             #mbox-cells = <2>;
> > > +             power-domains = <&pd IMX_SC_R_VPU_MU_2>;
> > > +             status = "disabled";
> > > +     };
> > > +
> > > +     vpu_core0: vpu_core@2d080000 {
> > > +             reg = <0x2d080000 0x10000>;
> > > +             compatible = "nxp,imx8q-vpu-decoder";
> > > +             power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
> > > +             mbox-names = "tx0", "tx1", "rx";
> > > +             mboxes = <&mu_m0 0 0>,
> > > +                     <&mu_m0 0 1>,
> > > +                     <&mu_m0 1 0>;
> > > +             status = "disabled";
> > > +     };
> > > +     vpu_core1: vpu_core@2d090000 {
> > > +             reg = <0x2d090000 0x10000>;
> > > +             compatible = "nxp,imx8q-vpu-encoder";
> > > +             power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
> > > +             mbox-names = "tx0", "tx1", "rx";
> > > +             mboxes = <&mu1_m0 0 0>,
> > > +                     <&mu1_m0 0 1>,
> > > +                     <&mu1_m0 1 0>;
> > > +             status = "disabled";
> > > +     };
> > > +     vpu_core2: vpu_core@2d0a0000 {
> > > +             reg = <0x2d0a0000 0x10000>;
> > > +             compatible = "nxp,imx8q-vpu-encoder";
> > > +             power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
> > > +             mbox-names = "tx0", "tx1", "rx";
> > > +             mboxes = <&mu2_m0 0 0>,
> > > +                     <&mu2_m0 0 1>,
> > > +                     <&mu2_m0 1 0>;
> > > +             status = "disabled";
> > > +     };
> > > +};
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > index 863232a47004..05495b60beb8 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > @@ -196,6 +196,23 @@ &usdhc2 {
> > >       status = "okay";
> > >  };
> > > 
> > > +&vpu {
> > > +     compatible = "nxp,imx8qxp-vpu";
> > > +     status = "okay";
> > > +};
> > > +
> > > +&vpu_core0 {
> > > +     reg = <0x2d040000 0x10000>;
> > > +     memory-region = <&decoder_boot>, <&decoder_rpc>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&vpu_core1 {
> > > +     reg = <0x2d050000 0x10000>;
> > > +     memory-region = <&encoder_boot>, <&encoder_rpc>;
> > > +     status = "okay";
> > > +};
> > > +
> > >  &iomuxc {
> > >       pinctrl_fec1: fec1grp {
> > >               fsl,pins = <
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > index 1e6b4995091e..6b421cfa5534 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > @@ -46,6 +46,9 @@ aliases {
> > >               serial1 = &lpuart1;
> > >               serial2 = &lpuart2;
> > >               serial3 = &lpuart3;
> > > +             vpu_core0 = &vpu_core0;
> > > +             vpu_core1 = &vpu_core1;
> > > +             vpu_core2 = &vpu_core2;
> > >       };
> > > 
> > >       cpus {
> > > @@ -134,10 +137,30 @@ reserved-memory {
> > >               #size-cells = <2>;
> > >               ranges;
> > > 
> > > +             decoder_boot: decoder-boot@84000000 {
> > > +                     reg = <0 0x84000000 0 0x2000000>;
> > > +                     no-map;
> > > +             };
> > > +
> > > +             encoder_boot: encoder-boot@86000000 {
> > > +                     reg = <0 0x86000000 0 0x200000>;
> > > +                     no-map;
> > > +             };
> > > +
> > > +             decoder_rpc: decoder-rpc@0x92000000 {
> > > +                     reg = <0 0x92000000 0 0x100000>;
> > > +                     no-map;
> > > +             };
> > > +
> > >               dsp_reserved: dsp@92400000 {
> > >                       reg = <0 0x92400000 0 0x2000000>;
> > >                       no-map;
> > >               };
> > > +
> > > +             encoder_rpc: encoder-rpc@0x94400000 {
> > > +                     reg = <0 0x94400000 0 0x700000>;
> > > +                     no-map;
> > > +             };
> > >       };
> > > 
> > >       pmu {
> > > @@ -258,6 +281,7 @@ map0 {
> > >       };
> > > 
> > >       /* sorted in register address */
> > > +     #include "imx8-ss-vpu.dtsi"
> > >       #include "imx8-ss-adma.dtsi"
> > >       #include "imx8-ss-conn.dtsi"
> > >       #include "imx8-ss-ddr.dtsi"
> > 
> 


