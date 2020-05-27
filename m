Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3D91E49B1
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 18:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgE0QT2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 27 May 2020 12:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgE0QT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 12:19:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC34BC05BD1E
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 09:19:27 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jdym2-0006Kt-98; Wed, 27 May 2020 18:19:22 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jdym1-00053e-Bn; Wed, 27 May 2020 18:19:21 +0200
Message-ID: <58431830e527c8acb873487f5173e437bee712a6.camel@pengutronix.de>
Subject: Re: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Date:   Wed, 27 May 2020 18:19:21 +0200
In-Reply-To: <20200320131256.23294-4-p.zabel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
         <20200320131256.23294-4-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Fri, 2020-03-20 at 14:12 +0100, Philipp Zabel wrote:
> Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
> decoder cores and a reset/control block.
> 
> Hook up the bus clock to the VPU power domain to enable handshakes, and
> configure the core clocks to 600 MHz and the bus clock to 800 MHz by
> default.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

could you pick up this patch? The driver and binding parts have been
merged in media/master.

regards
Philipp

> ---
> New in v6.
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 6a1e83922c71..98e464ecb68a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -666,6 +666,7 @@
>  					pgc_vpu: power-domain@6 {
>  						#power-domain-cells = <0>;
>  						reg = <IMX8M_POWER_DOMAIN_VPU>;
> +						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>  					};
>  
>  					pgc_disp: power-domain@7 {
> @@ -1130,6 +1131,32 @@
>  			status = "disabled";
>  		};
>  
> +		vpu: video-codec@38300000 {
> +			compatible = "nxp,imx8mq-vpu";
> +			reg = <0x38300000 0x10000>,
> +			      <0x38310000 0x10000>,
> +			      <0x38320000 0x10000>;
> +			reg-names = "g1", "g2", "ctrl";
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "g1", "g2";
> +			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +			clock-names = "g1", "g2", "bus";
> +			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> +					  <&clk IMX8MQ_CLK_VPU_G2>,
> +					  <&clk IMX8MQ_CLK_VPU_BUS>,
> +					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
> +			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> +						 <&clk IMX8MQ_VPU_PLL_OUT>,
> +						 <&clk IMX8MQ_SYS1_PLL_800M>,
> +						 <&clk IMX8MQ_VPU_PLL>;
> +			assigned-clock-rates = <600000000>, <600000000>,
> +					       <800000000>, <0>;
> +			power-domains = <&pgc_vpu>;
> +		};
> +
>  		pcie0: pcie@33800000 {
>  			compatible = "fsl,imx8mq-pcie";
>  			reg = <0x33800000 0x400000>,
