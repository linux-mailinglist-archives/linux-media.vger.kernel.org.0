Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1E03A78E8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFOITU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:19:20 -0400
Received: from comms.puri.sm ([159.203.221.185]:48442 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhFOITT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:19:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 479C0E11DD;
        Tue, 15 Jun 2021 01:17:15 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RoN7WlA-jzVk; Tue, 15 Jun 2021 01:17:14 -0700 (PDT)
Message-ID: <3e12f5d22e7940f4143cb9c55367724cb8cf349a.camel@puri.sm>
Subject: Re: [PATCH v4.1 3/3] arm64: dts: imx8mq: add mipi csi phy and csi
 bridge descriptions
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Date:   Tue, 15 Jun 2021 10:17:06 +0200
In-Reply-To: <YMfT+swqNAm67EmS@pendragon.ideasonboard.com>
References: <20210614121522.2944593-4-martin.kepplinger@puri.sm>
         <20210614122517.2945532-1-martin.kepplinger@puri.sm>
         <YMfT+swqNAm67EmS@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, dem 15.06.2021 um 01:11 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> Thank you for the patch.
> 
> On Mon, Jun 14, 2021 at 02:25:17PM +0200, Martin Kepplinger wrote:
> > Describe the 2 available CSI interfaces on the i.MX8MQ with the
> > MIPI-CSI2
> > receiver and the CSI Bridge that provides the user buffers, where
> > the
> > existing driver can directly be used.
> > 
> > An image sensor is to be connected to the MIPIs' second port,
> > described in
> > board files.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > ---
> > 
> > sorry, the csi compatible addition suggested by Marco was missing
> > in
> > v4 3/3. here is 3/3 updated.
> > 
> > 
> > 
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 102
> > ++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index 91df9c5350ae..fa83e8294b20 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -1099,6 +1099,108 @@ uart4: serial@30a60000 {
> >                                 status = "disabled";
> >                         };
> >  
> > +                       mipi_csi1: csi@30a70000 {
> > +                               compatible = "fsl,imx8mq-mipi-
> > csi2";
> > +                               reg = <0x30a70000 0x1000>;
> > +                               clocks = <&clk
> > IMX8MQ_CLK_CSI1_CORE>,
> > +                                  <&clk IMX8MQ_CLK_CSI1_ESC>,
> > +                                  <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> > +                                  <&clk IMX8MQ_CLK_CLKO2>;
> > +                               clock-names = "core", "esc", "pxl",
> > "clko2";
> 
> I can't figure out what the clko2 clock is used for based on the
> datasheet. It seems to be a clock output by the SoC on GPIO1_IO15,
> and
> doesn't seem to belong here.

oh, no it doesn't, I'm sorry, that was just a hack that I forgot about!
That clock is only used by the sensor I'm using -.- I'll remove it
here. thanks a lot for looking closely.

> 
> Regarding core, esc and pix, do these clock correspond to the clk,
> clk_esc and clk_ui listed in table 13-36 (section 13.8.3.3.1 "RX
> Local
> Interface Description") of the TRM ? If so, should they be renamed
> accordingly, to either "clk", "clk_esc" and "clk_ui", or, if we want
> to
> drop the prefixes, "core", "esc" and "ui" ?

yes, I think so.

> 
> > +                               assigned-clocks = <&clk
> > IMX8MQ_CLK_CSI1_CORE>,
> > +                                   <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> > +                                   <&clk IMX8MQ_CLK_CSI1_ESC>;
> > +                               assigned-clock-rates = <266000000>,
> > <333000000>, <66000000>;
> > +                               assigned-clock-parents = <&clk
> > IMX8MQ_SYS1_PLL_266M>,
> > +                                       <&clk
> > IMX8MQ_SYS2_PLL_1000M>,
> > +                                       <&clk
> > IMX8MQ_SYS1_PLL_800M>;
> > +                               power-domains = <&pgc_mipi_csi1>;
> > +                               resets = <&src>;
> 
> The src node has #reset-cells set to 1, I think you're missing
> something
> here.

yes, thank you!

> 
> > +                               fsl,mipi-phy-gpr = <&iomuxc_gpr
> > 0x88>;
> > +                               interconnects = <&noc
> > IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
> > +                               interconnect-names = "dram";
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +
> > +                                               csi1_mipi_ep:
> > endpoint {
> > +                                                       remote-
> > endpoint = <&csi1_ep>;
> > +                                               };
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       csi1: csi@30a90000 {
> > +                               compatible = "fsl,imx8mq-csi",
> > "fsl,imx7-csi";
> > +                               reg = <0x30a90000 0x10000>;
> > +                               interrupts = <GIC_SPI 42
> > IRQ_TYPE_LEVEL_HIGH>;
> > +                               clocks = <&clk
> > IMX8MQ_CLK_CSI1_ROOT>;
> > +                               clock-names = "mclk";
> > +                               status = "disabled";
> > +
> > +                               port {
> > +                                       csi1_ep: endpoint {
> > +                                               remote-endpoint =
> > <&csi1_mipi_ep>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       mipi_csi2: csi@30b60000 {
> > +                               compatible = "fsl,imx8mq-mipi-
> > csi2";
> > +                               reg = <0x30b60000 0x1000>;
> > +                               clocks = <&clk
> > IMX8MQ_CLK_CSI2_CORE>,
> > +                                  <&clk IMX8MQ_CLK_CSI2_ESC>,
> > +                                  <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> > +                                  <&clk IMX8MQ_CLK_CLKO2>;
> > +                               clock-names = "core", "esc", "pxl",
> > "clko2";
> > +                               assigned-clocks = <&clk
> > IMX8MQ_CLK_CSI2_CORE>,
> > +                                   <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> > +                                   <&clk IMX8MQ_CLK_CSI2_ESC>;
> > +                               assigned-clock-rates = <266000000>,
> > <333000000>, <66000000>;
> > +                               assigned-clock-parents = <&clk
> > IMX8MQ_SYS1_PLL_266M>,
> > +                                       <&clk
> > IMX8MQ_SYS2_PLL_1000M>,
> > +                                       <&clk
> > IMX8MQ_SYS1_PLL_800M>;
> > +                               power-domains = <&pgc_mipi_csi2>;
> > +                               resets = <&src>;
> > +                               fsl,mipi-phy-gpr = <&iomuxc_gpr
> > 0xa4>;
> > +                               interconnects = <&noc
> > IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
> > +                               interconnect-names = "dram";
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +
> > +                                               csi2_mipi_ep:
> > endpoint {
> > +                                                       remote-
> > endpoint = <&csi2_ep>;
> > +                                               };
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       csi2: csi@30b80000 {
> > +                               compatible = "fsl,imx8mq-csi",
> > "fsl,imx7-csi";
> > +                               reg = <0x30b80000 0x10000>;
> > +                               interrupts = <GIC_SPI 43
> > IRQ_TYPE_LEVEL_HIGH>;
> > +                               clocks = <&clk
> > IMX8MQ_CLK_CSI2_ROOT>;
> > +                               clock-names = "mclk";
> > +                               status = "disabled";
> > +
> > +                               port {
> > +                                       csi2_ep: endpoint {
> > +                                               remote-endpoint =
> > <&csi2_mipi_ep>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> >                         mu: mailbox@30aa0000 {
> >                                 compatible = "fsl,imx8mq-mu",
> > "fsl,imx6sx-mu";
> >                                 reg = <0x30aa0000 0x10000>;
> 


