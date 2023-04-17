Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87FC6E4174
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 09:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjDQHmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 03:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjDQHmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 03:42:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892A24ED6;
        Mon, 17 Apr 2023 00:41:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F33F1DE6;
        Mon, 17 Apr 2023 09:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681717291;
        bh=8SSnqeaL5ZNLo5JFQAWgyu2IDRB5X/DdxvU5ytni+ns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D8b3ARSUjPXXH/oFsQVpyjwJ9RMWUwNCxjM+gLswAtO7zbvbR0yaG3HEklLHXp9h7
         bkYsdIINO1dcnKfJLVDUmbe2G/1rPjTNYin4SPE3zbT7c6/+uK+Eje7SI/byjl2Fvb
         3CPladoIMrVP4fuPh3D9mzSRDkKVleV2gIHwkVJA=
Date:   Mon, 17 Apr 2023 10:41:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
Message-ID: <20230417074148.GF28551@pendragon.ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417055627.16482-2-laurent.pinchart@ideasonboard.com>
 <20230417065059.fgmdfwk7pnj62amm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230417065059.fgmdfwk7pnj62amm@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Apr 17, 2023 at 08:50:59AM +0200, Marco Felsch wrote:
> Hi Laurent,
> 
> your patch LGTM just one nit/idea, please see below.
> 
> On 23-04-17, Laurent Pinchart wrote:
> > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 2dd60e3252f3..2a374a4c14a2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> >  				};
> >  			};
> >  
> > +			mipi_csi_0: csi@32e40000 {
> > +				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > +				reg = <0x32e40000 0x10000>;
> > +				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +				clock-frequency = <500000000>;
> > +				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > +				clock-names = "pclk", "wrap", "phy", "axi";
> > +				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > +				assigned-clock-rates = <500000000>;
> > +				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> 
> If we would add:
> 						mipi_csi_0_in: endpoint {};
> 
> here we could refernce it from overlays/board dts files more easily.

Isn't there an unwritten rule (or consensus) that an endpoint should
always have a remote-endpoint property ? While ports describe hardware
properties of a device and should always be there regardless of
connections, endpoints describe connections and I don't think they
should be instantiated with a valid remote-endpoint.

> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +					};
> > +				};
> > +			};
> > +
> > +			mipi_csi_1: csi@32e50000 {
> > +				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > +				reg = <0x32e50000 0x10000>;
> > +				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > +				clock-frequency = <266000000>;
> > +				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > +				clock-names = "pclk", "wrap", "phy", "axi";
> > +				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>;
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > +				assigned-clock-rates = <266000000>;
> > +				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +					};
> > +				};
> > +			};
> > +
> >  			pcie_phy: pcie-phy@32f00000 {
> >  				compatible = "fsl,imx8mp-pcie-phy";
> >  				reg = <0x32f00000 0x10000>;

-- 
Regards,

Laurent Pinchart
