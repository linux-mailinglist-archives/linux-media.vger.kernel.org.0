Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012CA1E5298
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 03:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgE1BCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 21:02:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48056 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgE1BCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 21:02:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 066332A3B03
Message-ID: <ded561992900a23e9a0135855e9455a07c67ddaf.camel@collabora.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Date:   Wed, 27 May 2020 22:02:17 -0300
In-Reply-To: <58431830e527c8acb873487f5173e437bee712a6.camel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
         <20200320131256.23294-4-p.zabel@pengutronix.de>
         <58431830e527c8acb873487f5173e437bee712a6.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-05-27 at 18:19 +0200, Philipp Zabel wrote:
> Hi Shawn,
> 
> On Fri, 2020-03-20 at 14:12 +0100, Philipp Zabel wrote:
> > Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
> > decoder cores and a reset/control block.
> > 
> > Hook up the bus clock to the VPU power domain to enable handshakes, and
> > configure the core clocks to 600 MHz and the bus clock to 800 MHz by
> > default.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> could you pick up this patch? The driver and binding parts have been
> merged in media/master.
> 

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Ezequiel Garcia <ezequiel@collabora.com>

It looks good and it matches the downstream device tree.

Thanks,
Ezequiel

> regards
> Philipp
> 
> > ---
> > New in v6.
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 27 +++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index 6a1e83922c71..98e464ecb68a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -666,6 +666,7 @@
> >  					pgc_vpu: power-domain@6 {
> >  						#power-domain-cells = <0>;
> >  						reg = <IMX8M_POWER_DOMAIN_VPU>;
> > +						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> >  					};
> >  
> >  					pgc_disp: power-domain@7 {
> > @@ -1130,6 +1131,32 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		vpu: video-codec@38300000 {
> > +			compatible = "nxp,imx8mq-vpu";
> > +			reg = <0x38300000 0x10000>,
> > +			      <0x38310000 0x10000>,
> > +			      <0x38320000 0x10000>;
> > +			reg-names = "g1", "g2", "ctrl";
> > +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "g1", "g2";
> > +			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > +				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > +				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > +			clock-names = "g1", "g2", "bus";
> > +			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> > +					  <&clk IMX8MQ_CLK_VPU_G2>,
> > +					  <&clk IMX8MQ_CLK_VPU_BUS>,
> > +					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> > +			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> > +						 <&clk IMX8MQ_VPU_PLL_OUT>,
> > +						 <&clk IMX8MQ_SYS1_PLL_800M>,
> > +						 <&clk IMX8MQ_VPU_PLL>;
> > +			assigned-clock-rates = <600000000>, <600000000>,
> > +					       <800000000>, <0>;
> > +			power-domains = <&pgc_vpu>;
> > +		};
> > +
> >  		pcie0: pcie@33800000 {
> >  			compatible = "fsl,imx8mq-pcie";
> >  			reg = <0x33800000 0x400000>,


